; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !33
  %3 = load i8*, i8** %2, align 8, !dbg !34
  store i8* %3, i8** %data1, align 8, !dbg !32
  %4 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %4, i8** %data1, align 8, !dbg !36
  %5 = load i8*, i8** %data1, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %6 = load i8*, i8** %data1, align 8, !dbg !39
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !40
  store i8* %6, i8** %7, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !45
  %9 = load i8*, i8** %8, align 8, !dbg !46
  store i8* %9, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx3, align 1, !dbg !55
  %10 = load i8*, i8** %data2, align 8, !dbg !56
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !57
  %call = call i8* @strncpy(i8* %10, i8* %arraydecay4, i64 99) #5, !dbg !58
  %11 = load i8*, i8** %data2, align 8, !dbg !59
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !59
  store i8 0, i8* %arrayidx5, align 1, !dbg !60
  %12 = load i8*, i8** %data2, align 8, !dbg !61
  call void @printLine(i8* %12), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 50, align 16, !dbg !94
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %1 = alloca i8, i64 100, align 16, !dbg !97
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !98, metadata !DIExpression()), !dbg !100
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !101
  %3 = load i8*, i8** %2, align 8, !dbg !102
  store i8* %3, i8** %data1, align 8, !dbg !100
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !103
  store i8* %4, i8** %data1, align 8, !dbg !104
  %5 = load i8*, i8** %data1, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %6 = load i8*, i8** %data1, align 8, !dbg !107
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !108
  store i8* %6, i8** %7, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !110, metadata !DIExpression()), !dbg !112
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !113
  %9 = load i8*, i8** %8, align 8, !dbg !114
  store i8* %9, i8** %data2, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !118
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx3, align 1, !dbg !120
  %10 = load i8*, i8** %data2, align 8, !dbg !121
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  %call = call i8* @strncpy(i8* %10, i8* %arraydecay4, i64 99) #5, !dbg !123
  %11 = load i8*, i8** %data2, align 8, !dbg !124
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !124
  store i8 0, i8* %arrayidx5, align 1, !dbg !125
  %12 = load i8*, i8** %data2, align 8, !dbg !126
  call void @printLine(i8* %12), !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 28, type: !4)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 29, type: !4)
!28 = !DILocation(line: 29, column: 12, scope: !13)
!29 = !DILocation(line: 29, column: 37, scope: !13)
!30 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 31, type: !4)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!32 = !DILocation(line: 31, column: 16, scope: !31)
!33 = !DILocation(line: 31, column: 24, scope: !31)
!34 = !DILocation(line: 31, column: 23, scope: !31)
!35 = !DILocation(line: 34, column: 16, scope: !31)
!36 = !DILocation(line: 34, column: 14, scope: !31)
!37 = !DILocation(line: 35, column: 9, scope: !31)
!38 = !DILocation(line: 35, column: 17, scope: !31)
!39 = !DILocation(line: 36, column: 21, scope: !31)
!40 = !DILocation(line: 36, column: 10, scope: !31)
!41 = !DILocation(line: 36, column: 19, scope: !31)
!42 = !DILocalVariable(name: "data", scope: !43, file: !14, line: 39, type: !4)
!43 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!44 = !DILocation(line: 39, column: 16, scope: !43)
!45 = !DILocation(line: 39, column: 24, scope: !43)
!46 = !DILocation(line: 39, column: 23, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 41, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !14, line: 40, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 41, column: 18, scope: !48)
!53 = !DILocation(line: 42, column: 13, scope: !48)
!54 = !DILocation(line: 43, column: 13, scope: !48)
!55 = !DILocation(line: 43, column: 27, scope: !48)
!56 = !DILocation(line: 45, column: 21, scope: !48)
!57 = !DILocation(line: 45, column: 27, scope: !48)
!58 = !DILocation(line: 45, column: 13, scope: !48)
!59 = !DILocation(line: 46, column: 13, scope: !48)
!60 = !DILocation(line: 46, column: 25, scope: !48)
!61 = !DILocation(line: 47, column: 23, scope: !48)
!62 = !DILocation(line: 47, column: 13, scope: !48)
!63 = !DILocation(line: 50, column: 1, scope: !13)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_32_good", scope: !14, file: !14, line: 85, type: !15, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 87, column: 5, scope: !64)
!66 = !DILocation(line: 88, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 99, type: !68, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !20}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !14, line: 99, type: !70)
!72 = !DILocation(line: 99, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !14, line: 99, type: !20)
!74 = !DILocation(line: 99, column: 27, scope: !67)
!75 = !DILocation(line: 102, column: 22, scope: !67)
!76 = !DILocation(line: 102, column: 12, scope: !67)
!77 = !DILocation(line: 102, column: 5, scope: !67)
!78 = !DILocation(line: 104, column: 5, scope: !67)
!79 = !DILocation(line: 105, column: 5, scope: !67)
!80 = !DILocation(line: 106, column: 5, scope: !67)
!81 = !DILocation(line: 109, column: 5, scope: !67)
!82 = !DILocation(line: 110, column: 5, scope: !67)
!83 = !DILocation(line: 111, column: 5, scope: !67)
!84 = !DILocation(line: 113, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !14, line: 59, type: !4)
!87 = !DILocation(line: 59, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataPtr1", scope: !85, file: !14, line: 60, type: !20)
!89 = !DILocation(line: 60, column: 13, scope: !85)
!90 = !DILocalVariable(name: "dataPtr2", scope: !85, file: !14, line: 61, type: !20)
!91 = !DILocation(line: 61, column: 13, scope: !85)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !14, line: 62, type: !4)
!93 = !DILocation(line: 62, column: 12, scope: !85)
!94 = !DILocation(line: 62, column: 36, scope: !85)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !14, line: 63, type: !4)
!96 = !DILocation(line: 63, column: 12, scope: !85)
!97 = !DILocation(line: 63, column: 37, scope: !85)
!98 = !DILocalVariable(name: "data", scope: !99, file: !14, line: 65, type: !4)
!99 = distinct !DILexicalBlock(scope: !85, file: !14, line: 64, column: 5)
!100 = !DILocation(line: 65, column: 16, scope: !99)
!101 = !DILocation(line: 65, column: 24, scope: !99)
!102 = !DILocation(line: 65, column: 23, scope: !99)
!103 = !DILocation(line: 67, column: 16, scope: !99)
!104 = !DILocation(line: 67, column: 14, scope: !99)
!105 = !DILocation(line: 68, column: 9, scope: !99)
!106 = !DILocation(line: 68, column: 17, scope: !99)
!107 = !DILocation(line: 69, column: 21, scope: !99)
!108 = !DILocation(line: 69, column: 10, scope: !99)
!109 = !DILocation(line: 69, column: 19, scope: !99)
!110 = !DILocalVariable(name: "data", scope: !111, file: !14, line: 72, type: !4)
!111 = distinct !DILexicalBlock(scope: !85, file: !14, line: 71, column: 5)
!112 = !DILocation(line: 72, column: 16, scope: !111)
!113 = !DILocation(line: 72, column: 24, scope: !111)
!114 = !DILocation(line: 72, column: 23, scope: !111)
!115 = !DILocalVariable(name: "source", scope: !116, file: !14, line: 74, type: !49)
!116 = distinct !DILexicalBlock(scope: !111, file: !14, line: 73, column: 9)
!117 = !DILocation(line: 74, column: 18, scope: !116)
!118 = !DILocation(line: 75, column: 13, scope: !116)
!119 = !DILocation(line: 76, column: 13, scope: !116)
!120 = !DILocation(line: 76, column: 27, scope: !116)
!121 = !DILocation(line: 78, column: 21, scope: !116)
!122 = !DILocation(line: 78, column: 27, scope: !116)
!123 = !DILocation(line: 78, column: 13, scope: !116)
!124 = !DILocation(line: 79, column: 13, scope: !116)
!125 = !DILocation(line: 79, column: 25, scope: !116)
!126 = !DILocation(line: 80, column: 23, scope: !116)
!127 = !DILocation(line: 80, column: 13, scope: !116)
!128 = !DILocation(line: 83, column: 1, scope: !85)
