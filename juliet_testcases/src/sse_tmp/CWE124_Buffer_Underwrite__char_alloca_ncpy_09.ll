; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_09.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_09_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !26
  %tobool = icmp ne i32 %3, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !46
  store i8 0, i8* %arrayidx3, align 1, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %7), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_09_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_09_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_09_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 100, align 16, !dbg !79
  store i8* %0, i8** %dataBuffer, align 8, !dbg !78
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !81
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  %3 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !84
  %tobool = icmp ne i32 %3, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  store i8* %4, i8** %data, align 8, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx1, align 1, !dbg !98
  %5 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !101
  %6 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !102
  store i8 0, i8* %arrayidx3, align 1, !dbg !103
  %7 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %7), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 100, align 16, !dbg !112
  store i8* %0, i8** %dataBuffer, align 8, !dbg !111
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !114
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %3 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !117
  %tobool = icmp ne i32 %3, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !120
  store i8* %4, i8** %data, align 8, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx1, align 1, !dbg !129
  %5 = load i8*, i8** %data, align 8, !dbg !130
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !132
  %6 = load i8*, i8** %data, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !133
  store i8 0, i8* %arrayidx3, align 1, !dbg !134
  %7 = load i8*, i8** %data, align 8, !dbg !135
  call void @printLine(i8* %7), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_09_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 29, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 8)
!28 = !DILocation(line: 29, column: 8, scope: !13)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 5)
!31 = !DILocation(line: 32, column: 27, scope: !30)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocation(line: 33, column: 5, scope: !30)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 35, column: 14, scope: !35)
!40 = !DILocation(line: 36, column: 9, scope: !35)
!41 = !DILocation(line: 37, column: 9, scope: !35)
!42 = !DILocation(line: 37, column: 23, scope: !35)
!43 = !DILocation(line: 39, column: 17, scope: !35)
!44 = !DILocation(line: 39, column: 23, scope: !35)
!45 = !DILocation(line: 39, column: 9, scope: !35)
!46 = !DILocation(line: 41, column: 9, scope: !35)
!47 = !DILocation(line: 41, column: 21, scope: !35)
!48 = !DILocation(line: 42, column: 19, scope: !35)
!49 = !DILocation(line: 42, column: 9, scope: !35)
!50 = !DILocation(line: 44, column: 1, scope: !13)
!51 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_09_good", scope: !14, file: !14, line: 103, type: !15, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 105, column: 5, scope: !51)
!53 = !DILocation(line: 106, column: 5, scope: !51)
!54 = !DILocation(line: 107, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 119, type: !56, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 119, type: !58)
!61 = !DILocation(line: 119, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 119, type: !59)
!63 = !DILocation(line: 119, column: 27, scope: !55)
!64 = !DILocation(line: 122, column: 22, scope: !55)
!65 = !DILocation(line: 122, column: 12, scope: !55)
!66 = !DILocation(line: 122, column: 5, scope: !55)
!67 = !DILocation(line: 124, column: 5, scope: !55)
!68 = !DILocation(line: 125, column: 5, scope: !55)
!69 = !DILocation(line: 126, column: 5, scope: !55)
!70 = !DILocation(line: 129, column: 5, scope: !55)
!71 = !DILocation(line: 130, column: 5, scope: !55)
!72 = !DILocation(line: 131, column: 5, scope: !55)
!73 = !DILocation(line: 133, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 53, type: !4)
!76 = !DILocation(line: 53, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !14, line: 54, type: !4)
!78 = !DILocation(line: 54, column: 12, scope: !74)
!79 = !DILocation(line: 54, column: 33, scope: !74)
!80 = !DILocation(line: 55, column: 12, scope: !74)
!81 = !DILocation(line: 55, column: 5, scope: !74)
!82 = !DILocation(line: 56, column: 5, scope: !74)
!83 = !DILocation(line: 56, column: 23, scope: !74)
!84 = !DILocation(line: 57, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !74, file: !14, line: 57, column: 8)
!86 = !DILocation(line: 57, column: 8, scope: !74)
!87 = !DILocation(line: 60, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !14, line: 58, column: 5)
!89 = !DILocation(line: 61, column: 5, scope: !88)
!90 = !DILocation(line: 65, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !14, line: 63, column: 5)
!92 = !DILocation(line: 65, column: 14, scope: !91)
!93 = !DILocalVariable(name: "source", scope: !94, file: !14, line: 68, type: !36)
!94 = distinct !DILexicalBlock(scope: !74, file: !14, line: 67, column: 5)
!95 = !DILocation(line: 68, column: 14, scope: !94)
!96 = !DILocation(line: 69, column: 9, scope: !94)
!97 = !DILocation(line: 70, column: 9, scope: !94)
!98 = !DILocation(line: 70, column: 23, scope: !94)
!99 = !DILocation(line: 72, column: 17, scope: !94)
!100 = !DILocation(line: 72, column: 23, scope: !94)
!101 = !DILocation(line: 72, column: 9, scope: !94)
!102 = !DILocation(line: 74, column: 9, scope: !94)
!103 = !DILocation(line: 74, column: 21, scope: !94)
!104 = !DILocation(line: 75, column: 19, scope: !94)
!105 = !DILocation(line: 75, column: 9, scope: !94)
!106 = !DILocation(line: 77, column: 1, scope: !74)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !14, line: 82, type: !4)
!109 = !DILocation(line: 82, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !14, line: 83, type: !4)
!111 = !DILocation(line: 83, column: 12, scope: !107)
!112 = !DILocation(line: 83, column: 33, scope: !107)
!113 = !DILocation(line: 84, column: 12, scope: !107)
!114 = !DILocation(line: 84, column: 5, scope: !107)
!115 = !DILocation(line: 85, column: 5, scope: !107)
!116 = !DILocation(line: 85, column: 23, scope: !107)
!117 = !DILocation(line: 86, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !107, file: !14, line: 86, column: 8)
!119 = !DILocation(line: 86, column: 8, scope: !107)
!120 = !DILocation(line: 89, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !14, line: 87, column: 5)
!122 = !DILocation(line: 89, column: 14, scope: !121)
!123 = !DILocation(line: 90, column: 5, scope: !121)
!124 = !DILocalVariable(name: "source", scope: !125, file: !14, line: 92, type: !36)
!125 = distinct !DILexicalBlock(scope: !107, file: !14, line: 91, column: 5)
!126 = !DILocation(line: 92, column: 14, scope: !125)
!127 = !DILocation(line: 93, column: 9, scope: !125)
!128 = !DILocation(line: 94, column: 9, scope: !125)
!129 = !DILocation(line: 94, column: 23, scope: !125)
!130 = !DILocation(line: 96, column: 17, scope: !125)
!131 = !DILocation(line: 96, column: 23, scope: !125)
!132 = !DILocation(line: 96, column: 9, scope: !125)
!133 = !DILocation(line: 98, column: 9, scope: !125)
!134 = !DILocation(line: 98, column: 21, scope: !125)
!135 = !DILocation(line: 99, column: 19, scope: !125)
!136 = !DILocation(line: 99, column: 9, scope: !125)
!137 = !DILocation(line: 101, column: 1, scope: !107)
