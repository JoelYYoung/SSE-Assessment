; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !24
  store i8* %call, i8** %dataBuffer, align 8, !dbg !23
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx1, align 1, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  %call3 = call i8* @strcpy(i8* %4, i8* %arraydecay2) #6, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %5), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_15_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_15_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_15_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* null, i8** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !83
  store i8* %call, i8** %dataBuffer, align 8, !dbg !82
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !91
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  store i8* %3, i8** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx1, align 1, !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  %call3 = call i8* @strcpy(i8* %4, i8* %arraydecay2) #6, !dbg !104
  %5 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %5), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* null, i8** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !115
  store i8* %call, i8** %dataBuffer, align 8, !dbg !114
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  %cmp = icmp eq i8* %0, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !123
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !126
  store i8* %3, i8** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx1, align 1, !dbg !133
  %4 = load i8*, i8** %data, align 8, !dbg !134
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !135
  %call3 = call i8* @strcpy(i8* %4, i8* %arraydecay2) #6, !dbg !136
  %5 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %5), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 31, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!23 = !DILocation(line: 31, column: 16, scope: !22)
!24 = !DILocation(line: 31, column: 37, scope: !22)
!25 = !DILocation(line: 32, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 32, column: 13)
!27 = !DILocation(line: 32, column: 24, scope: !26)
!28 = !DILocation(line: 32, column: 13, scope: !22)
!29 = !DILocation(line: 32, column: 34, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 32, column: 33)
!31 = !DILocation(line: 33, column: 16, scope: !22)
!32 = !DILocation(line: 33, column: 9, scope: !22)
!33 = !DILocation(line: 34, column: 9, scope: !22)
!34 = !DILocation(line: 34, column: 27, scope: !22)
!35 = !DILocation(line: 36, column: 16, scope: !22)
!36 = !DILocation(line: 36, column: 27, scope: !22)
!37 = !DILocation(line: 36, column: 14, scope: !22)
!38 = !DILocalVariable(name: "source", scope: !39, file: !15, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 45, column: 14, scope: !39)
!44 = !DILocation(line: 46, column: 9, scope: !39)
!45 = !DILocation(line: 47, column: 9, scope: !39)
!46 = !DILocation(line: 47, column: 23, scope: !39)
!47 = !DILocation(line: 49, column: 16, scope: !39)
!48 = !DILocation(line: 49, column: 22, scope: !39)
!49 = !DILocation(line: 49, column: 9, scope: !39)
!50 = !DILocation(line: 50, column: 19, scope: !39)
!51 = !DILocation(line: 50, column: 9, scope: !39)
!52 = !DILocation(line: 54, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_15_good", scope: !15, file: !15, line: 128, type: !16, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 130, column: 5, scope: !53)
!55 = !DILocation(line: 131, column: 5, scope: !53)
!56 = !DILocation(line: 132, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 144, type: !58, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !15, line: 144, type: !60)
!63 = !DILocation(line: 144, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !15, line: 144, type: !61)
!65 = !DILocation(line: 144, column: 27, scope: !57)
!66 = !DILocation(line: 147, column: 22, scope: !57)
!67 = !DILocation(line: 147, column: 12, scope: !57)
!68 = !DILocation(line: 147, column: 5, scope: !57)
!69 = !DILocation(line: 149, column: 5, scope: !57)
!70 = !DILocation(line: 150, column: 5, scope: !57)
!71 = !DILocation(line: 151, column: 5, scope: !57)
!72 = !DILocation(line: 154, column: 5, scope: !57)
!73 = !DILocation(line: 155, column: 5, scope: !57)
!74 = !DILocation(line: 156, column: 5, scope: !57)
!75 = !DILocation(line: 158, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 63, type: !4)
!78 = !DILocation(line: 63, column: 12, scope: !76)
!79 = !DILocation(line: 64, column: 10, scope: !76)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !15, line: 73, type: !4)
!81 = distinct !DILexicalBlock(scope: !76, file: !15, line: 72, column: 5)
!82 = !DILocation(line: 73, column: 16, scope: !81)
!83 = !DILocation(line: 73, column: 37, scope: !81)
!84 = !DILocation(line: 74, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 74, column: 13)
!86 = !DILocation(line: 74, column: 24, scope: !85)
!87 = !DILocation(line: 74, column: 13, scope: !81)
!88 = !DILocation(line: 74, column: 34, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 74, column: 33)
!90 = !DILocation(line: 75, column: 16, scope: !81)
!91 = !DILocation(line: 75, column: 9, scope: !81)
!92 = !DILocation(line: 76, column: 9, scope: !81)
!93 = !DILocation(line: 76, column: 27, scope: !81)
!94 = !DILocation(line: 78, column: 16, scope: !81)
!95 = !DILocation(line: 78, column: 14, scope: !81)
!96 = !DILocalVariable(name: "source", scope: !97, file: !15, line: 83, type: !40)
!97 = distinct !DILexicalBlock(scope: !76, file: !15, line: 82, column: 5)
!98 = !DILocation(line: 83, column: 14, scope: !97)
!99 = !DILocation(line: 84, column: 9, scope: !97)
!100 = !DILocation(line: 85, column: 9, scope: !97)
!101 = !DILocation(line: 85, column: 23, scope: !97)
!102 = !DILocation(line: 87, column: 16, scope: !97)
!103 = !DILocation(line: 87, column: 22, scope: !97)
!104 = !DILocation(line: 87, column: 9, scope: !97)
!105 = !DILocation(line: 88, column: 19, scope: !97)
!106 = !DILocation(line: 88, column: 9, scope: !97)
!107 = !DILocation(line: 92, column: 1, scope: !76)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 95, type: !16, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 97, type: !4)
!110 = !DILocation(line: 97, column: 12, scope: !108)
!111 = !DILocation(line: 98, column: 10, scope: !108)
!112 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !15, line: 103, type: !4)
!113 = distinct !DILexicalBlock(scope: !108, file: !15, line: 102, column: 5)
!114 = !DILocation(line: 103, column: 16, scope: !113)
!115 = !DILocation(line: 103, column: 37, scope: !113)
!116 = !DILocation(line: 104, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 104, column: 13)
!118 = !DILocation(line: 104, column: 24, scope: !117)
!119 = !DILocation(line: 104, column: 13, scope: !113)
!120 = !DILocation(line: 104, column: 34, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 104, column: 33)
!122 = !DILocation(line: 105, column: 16, scope: !113)
!123 = !DILocation(line: 105, column: 9, scope: !113)
!124 = !DILocation(line: 106, column: 9, scope: !113)
!125 = !DILocation(line: 106, column: 27, scope: !113)
!126 = !DILocation(line: 108, column: 16, scope: !113)
!127 = !DILocation(line: 108, column: 14, scope: !113)
!128 = !DILocalVariable(name: "source", scope: !129, file: !15, line: 117, type: !40)
!129 = distinct !DILexicalBlock(scope: !108, file: !15, line: 116, column: 5)
!130 = !DILocation(line: 117, column: 14, scope: !129)
!131 = !DILocation(line: 118, column: 9, scope: !129)
!132 = !DILocation(line: 119, column: 9, scope: !129)
!133 = !DILocation(line: 119, column: 23, scope: !129)
!134 = !DILocation(line: 121, column: 16, scope: !129)
!135 = !DILocation(line: 121, column: 22, scope: !129)
!136 = !DILocation(line: 121, column: 9, scope: !129)
!137 = !DILocation(line: 122, column: 19, scope: !129)
!138 = !DILocation(line: 122, column: 9, scope: !129)
!139 = !DILocation(line: 126, column: 1, scope: !108)
