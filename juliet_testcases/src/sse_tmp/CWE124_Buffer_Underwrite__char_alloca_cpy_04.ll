; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_cpy_04.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_cpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_cpy_04_bad() #0 !dbg !13 {
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
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !29
  store i8* %add.ptr, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !37
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  %call = call i8* @strcpy(i8* %4, i8* %arraydecay2) #5, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %5), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_cpy_04_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
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
  call void @CWE124_Buffer_Underwrite__char_alloca_cpy_04_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE124_Buffer_Underwrite__char_alloca_cpy_04_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 100, align 16, !dbg !74
  store i8* %0, i8** %dataBuffer, align 8, !dbg !73
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !76
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !79
  store i8* %3, i8** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !86
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !87
  store i8 0, i8* %arrayidx1, align 1, !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !90
  %call = call i8* @strcpy(i8* %4, i8* %arraydecay2) #5, !dbg !91
  %5 = load i8*, i8** %data, align 8, !dbg !92
  call void @printLine(i8* %5), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 100, align 16, !dbg !100
  store i8* %0, i8** %dataBuffer, align 8, !dbg !99
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !102
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  store i8* %3, i8** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx1, align 1, !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  %call = call i8* @strcpy(i8* %4, i8* %arraydecay2) #5, !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !118
  call void @printLine(i8* %5), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_cpy_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_cpy_04_bad", scope: !14, file: !14, line: 30, type: !15, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_cpy_04.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 32, type: !4)
!18 = !DILocation(line: 32, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 12, scope: !13)
!21 = !DILocation(line: 33, column: 33, scope: !13)
!22 = !DILocation(line: 34, column: 12, scope: !13)
!23 = !DILocation(line: 34, column: 5, scope: !13)
!24 = !DILocation(line: 35, column: 5, scope: !13)
!25 = !DILocation(line: 35, column: 23, scope: !13)
!26 = !DILocation(line: 39, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !14, line: 37, column: 5)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 8)
!29 = !DILocation(line: 39, column: 27, scope: !27)
!30 = !DILocation(line: 39, column: 14, scope: !27)
!31 = !DILocalVariable(name: "source", scope: !32, file: !14, line: 42, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 42, column: 14, scope: !32)
!37 = !DILocation(line: 43, column: 9, scope: !32)
!38 = !DILocation(line: 44, column: 9, scope: !32)
!39 = !DILocation(line: 44, column: 23, scope: !32)
!40 = !DILocation(line: 46, column: 16, scope: !32)
!41 = !DILocation(line: 46, column: 22, scope: !32)
!42 = !DILocation(line: 46, column: 9, scope: !32)
!43 = !DILocation(line: 47, column: 19, scope: !32)
!44 = !DILocation(line: 47, column: 9, scope: !32)
!45 = !DILocation(line: 49, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_cpy_04_good", scope: !14, file: !14, line: 104, type: !15, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 106, column: 5, scope: !46)
!48 = !DILocation(line: 107, column: 5, scope: !46)
!49 = !DILocation(line: 108, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 120, type: !51, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 120, type: !53)
!56 = !DILocation(line: 120, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 120, type: !54)
!58 = !DILocation(line: 120, column: 27, scope: !50)
!59 = !DILocation(line: 123, column: 22, scope: !50)
!60 = !DILocation(line: 123, column: 12, scope: !50)
!61 = !DILocation(line: 123, column: 5, scope: !50)
!62 = !DILocation(line: 125, column: 5, scope: !50)
!63 = !DILocation(line: 126, column: 5, scope: !50)
!64 = !DILocation(line: 127, column: 5, scope: !50)
!65 = !DILocation(line: 130, column: 5, scope: !50)
!66 = !DILocation(line: 131, column: 5, scope: !50)
!67 = !DILocation(line: 132, column: 5, scope: !50)
!68 = !DILocation(line: 134, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 58, type: !4)
!71 = !DILocation(line: 58, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !14, line: 59, type: !4)
!73 = !DILocation(line: 59, column: 12, scope: !69)
!74 = !DILocation(line: 59, column: 33, scope: !69)
!75 = !DILocation(line: 60, column: 12, scope: !69)
!76 = !DILocation(line: 60, column: 5, scope: !69)
!77 = !DILocation(line: 61, column: 5, scope: !69)
!78 = !DILocation(line: 61, column: 23, scope: !69)
!79 = !DILocation(line: 70, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !14, line: 68, column: 5)
!81 = distinct !DILexicalBlock(scope: !69, file: !14, line: 62, column: 8)
!82 = !DILocation(line: 70, column: 14, scope: !80)
!83 = !DILocalVariable(name: "source", scope: !84, file: !14, line: 73, type: !33)
!84 = distinct !DILexicalBlock(scope: !69, file: !14, line: 72, column: 5)
!85 = !DILocation(line: 73, column: 14, scope: !84)
!86 = !DILocation(line: 74, column: 9, scope: !84)
!87 = !DILocation(line: 75, column: 9, scope: !84)
!88 = !DILocation(line: 75, column: 23, scope: !84)
!89 = !DILocation(line: 77, column: 16, scope: !84)
!90 = !DILocation(line: 77, column: 22, scope: !84)
!91 = !DILocation(line: 77, column: 9, scope: !84)
!92 = !DILocation(line: 78, column: 19, scope: !84)
!93 = !DILocation(line: 78, column: 9, scope: !84)
!94 = !DILocation(line: 80, column: 1, scope: !69)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 85, type: !4)
!97 = !DILocation(line: 85, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !14, line: 86, type: !4)
!99 = !DILocation(line: 86, column: 12, scope: !95)
!100 = !DILocation(line: 86, column: 33, scope: !95)
!101 = !DILocation(line: 87, column: 12, scope: !95)
!102 = !DILocation(line: 87, column: 5, scope: !95)
!103 = !DILocation(line: 88, column: 5, scope: !95)
!104 = !DILocation(line: 88, column: 23, scope: !95)
!105 = !DILocation(line: 92, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !14, line: 90, column: 5)
!107 = distinct !DILexicalBlock(scope: !95, file: !14, line: 89, column: 8)
!108 = !DILocation(line: 92, column: 14, scope: !106)
!109 = !DILocalVariable(name: "source", scope: !110, file: !14, line: 95, type: !33)
!110 = distinct !DILexicalBlock(scope: !95, file: !14, line: 94, column: 5)
!111 = !DILocation(line: 95, column: 14, scope: !110)
!112 = !DILocation(line: 96, column: 9, scope: !110)
!113 = !DILocation(line: 97, column: 9, scope: !110)
!114 = !DILocation(line: 97, column: 23, scope: !110)
!115 = !DILocation(line: 99, column: 16, scope: !110)
!116 = !DILocation(line: 99, column: 22, scope: !110)
!117 = !DILocation(line: 99, column: 9, scope: !110)
!118 = !DILocation(line: 100, column: 19, scope: !110)
!119 = !DILocation(line: 100, column: 9, scope: !110)
!120 = !DILocation(line: 102, column: 1, scope: !95)
