; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_15_bad() #0 !dbg !13 {
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
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !27
  store i8* %add.ptr, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !35
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !41
  store i8 0, i8* %arrayidx3, align 1, !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %6), !dbg !44
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
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_15_good() #0 !dbg !46 {
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
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_15_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_15_bad(), !dbg !66
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
  store i8* %3, i8** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !84
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx1, align 1, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !88
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !90
  store i8 0, i8* %arrayidx3, align 1, !dbg !91
  %6 = load i8*, i8** %data, align 8, !dbg !92
  call void @printLine(i8* %6), !dbg !93
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
  store i8* %3, i8** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !110
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx1, align 1, !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !114
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !115
  %5 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !116
  store i8 0, i8* %arrayidx3, align 1, !dbg !117
  %6 = load i8*, i8** %data, align 8, !dbg !118
  call void @printLine(i8* %6), !dbg !119
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!26 = !DILocation(line: 33, column: 16, scope: !13)
!27 = !DILocation(line: 33, column: 27, scope: !13)
!28 = !DILocation(line: 33, column: 14, scope: !13)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 41, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 41, column: 14, scope: !30)
!35 = !DILocation(line: 42, column: 9, scope: !30)
!36 = !DILocation(line: 43, column: 9, scope: !30)
!37 = !DILocation(line: 43, column: 23, scope: !30)
!38 = !DILocation(line: 45, column: 17, scope: !30)
!39 = !DILocation(line: 45, column: 23, scope: !30)
!40 = !DILocation(line: 45, column: 9, scope: !30)
!41 = !DILocation(line: 47, column: 9, scope: !30)
!42 = !DILocation(line: 47, column: 21, scope: !30)
!43 = !DILocation(line: 48, column: 19, scope: !30)
!44 = !DILocation(line: 48, column: 9, scope: !30)
!45 = !DILocation(line: 50, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_15_good", scope: !14, file: !14, line: 116, type: !15, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 118, column: 5, scope: !46)
!48 = !DILocation(line: 119, column: 5, scope: !46)
!49 = !DILocation(line: 120, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 132, type: !51, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 132, type: !53)
!56 = !DILocation(line: 132, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 132, type: !54)
!58 = !DILocation(line: 132, column: 27, scope: !50)
!59 = !DILocation(line: 135, column: 22, scope: !50)
!60 = !DILocation(line: 135, column: 12, scope: !50)
!61 = !DILocation(line: 135, column: 5, scope: !50)
!62 = !DILocation(line: 137, column: 5, scope: !50)
!63 = !DILocation(line: 138, column: 5, scope: !50)
!64 = !DILocation(line: 139, column: 5, scope: !50)
!65 = !DILocation(line: 142, column: 5, scope: !50)
!66 = !DILocation(line: 143, column: 5, scope: !50)
!67 = !DILocation(line: 144, column: 5, scope: !50)
!68 = !DILocation(line: 146, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 59, type: !4)
!71 = !DILocation(line: 59, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !14, line: 60, type: !4)
!73 = !DILocation(line: 60, column: 12, scope: !69)
!74 = !DILocation(line: 60, column: 33, scope: !69)
!75 = !DILocation(line: 61, column: 12, scope: !69)
!76 = !DILocation(line: 61, column: 5, scope: !69)
!77 = !DILocation(line: 62, column: 5, scope: !69)
!78 = !DILocation(line: 62, column: 23, scope: !69)
!79 = !DILocation(line: 71, column: 16, scope: !69)
!80 = !DILocation(line: 71, column: 14, scope: !69)
!81 = !DILocalVariable(name: "source", scope: !82, file: !14, line: 75, type: !31)
!82 = distinct !DILexicalBlock(scope: !69, file: !14, line: 74, column: 5)
!83 = !DILocation(line: 75, column: 14, scope: !82)
!84 = !DILocation(line: 76, column: 9, scope: !82)
!85 = !DILocation(line: 77, column: 9, scope: !82)
!86 = !DILocation(line: 77, column: 23, scope: !82)
!87 = !DILocation(line: 79, column: 17, scope: !82)
!88 = !DILocation(line: 79, column: 23, scope: !82)
!89 = !DILocation(line: 79, column: 9, scope: !82)
!90 = !DILocation(line: 81, column: 9, scope: !82)
!91 = !DILocation(line: 81, column: 21, scope: !82)
!92 = !DILocation(line: 82, column: 19, scope: !82)
!93 = !DILocation(line: 82, column: 9, scope: !82)
!94 = !DILocation(line: 84, column: 1, scope: !69)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 89, type: !4)
!97 = !DILocation(line: 89, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !14, line: 90, type: !4)
!99 = !DILocation(line: 90, column: 12, scope: !95)
!100 = !DILocation(line: 90, column: 33, scope: !95)
!101 = !DILocation(line: 91, column: 12, scope: !95)
!102 = !DILocation(line: 91, column: 5, scope: !95)
!103 = !DILocation(line: 92, column: 5, scope: !95)
!104 = !DILocation(line: 92, column: 23, scope: !95)
!105 = !DILocation(line: 97, column: 16, scope: !95)
!106 = !DILocation(line: 97, column: 14, scope: !95)
!107 = !DILocalVariable(name: "source", scope: !108, file: !14, line: 105, type: !31)
!108 = distinct !DILexicalBlock(scope: !95, file: !14, line: 104, column: 5)
!109 = !DILocation(line: 105, column: 14, scope: !108)
!110 = !DILocation(line: 106, column: 9, scope: !108)
!111 = !DILocation(line: 107, column: 9, scope: !108)
!112 = !DILocation(line: 107, column: 23, scope: !108)
!113 = !DILocation(line: 109, column: 17, scope: !108)
!114 = !DILocation(line: 109, column: 23, scope: !108)
!115 = !DILocation(line: 109, column: 9, scope: !108)
!116 = !DILocation(line: 111, column: 9, scope: !108)
!117 = !DILocation(line: 111, column: 21, scope: !108)
!118 = !DILocation(line: 112, column: 19, scope: !108)
!119 = !DILocation(line: 112, column: 9, scope: !108)
!120 = !DILocation(line: 114, column: 1, scope: !95)
