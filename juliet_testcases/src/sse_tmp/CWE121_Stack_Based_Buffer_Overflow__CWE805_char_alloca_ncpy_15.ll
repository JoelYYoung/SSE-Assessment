; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15_good() #0 !dbg !46 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15_bad(), !dbg !66
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
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 50, align 16, !dbg !74
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %1 = alloca i8, i64 100, align 16, !dbg !77
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !76
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !78
  store i8* %2, i8** %data, align 8, !dbg !79
  %3 = load i8*, i8** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !85
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx1, align 1, !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !89
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !90
  %5 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !91
  store i8 0, i8* %arrayidx3, align 1, !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* %6), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 50, align 16, !dbg !101
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %1 = alloca i8, i64 100, align 16, !dbg !104
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !103
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !105
  store i8* %2, i8** %data, align 8, !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx1, align 1, !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !118
  store i8 0, i8* %arrayidx3, align 1, !dbg !119
  %6 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %6), !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 33, column: 16, scope: !13)
!26 = !DILocation(line: 33, column: 14, scope: !13)
!27 = !DILocation(line: 34, column: 9, scope: !13)
!28 = !DILocation(line: 34, column: 17, scope: !13)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 42, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 42, column: 14, scope: !30)
!35 = !DILocation(line: 43, column: 9, scope: !30)
!36 = !DILocation(line: 44, column: 9, scope: !30)
!37 = !DILocation(line: 44, column: 23, scope: !30)
!38 = !DILocation(line: 46, column: 17, scope: !30)
!39 = !DILocation(line: 46, column: 23, scope: !30)
!40 = !DILocation(line: 46, column: 9, scope: !30)
!41 = !DILocation(line: 47, column: 9, scope: !30)
!42 = !DILocation(line: 47, column: 21, scope: !30)
!43 = !DILocation(line: 48, column: 19, scope: !30)
!44 = !DILocation(line: 48, column: 9, scope: !30)
!45 = !DILocation(line: 50, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_15_good", scope: !14, file: !14, line: 114, type: !15, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 116, column: 5, scope: !46)
!48 = !DILocation(line: 117, column: 5, scope: !46)
!49 = !DILocation(line: 118, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 130, type: !51, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 130, type: !53)
!56 = !DILocation(line: 130, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 130, type: !54)
!58 = !DILocation(line: 130, column: 27, scope: !50)
!59 = !DILocation(line: 133, column: 22, scope: !50)
!60 = !DILocation(line: 133, column: 12, scope: !50)
!61 = !DILocation(line: 133, column: 5, scope: !50)
!62 = !DILocation(line: 135, column: 5, scope: !50)
!63 = !DILocation(line: 136, column: 5, scope: !50)
!64 = !DILocation(line: 137, column: 5, scope: !50)
!65 = !DILocation(line: 140, column: 5, scope: !50)
!66 = !DILocation(line: 141, column: 5, scope: !50)
!67 = !DILocation(line: 142, column: 5, scope: !50)
!68 = !DILocation(line: 144, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 59, type: !4)
!71 = !DILocation(line: 59, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !14, line: 60, type: !4)
!73 = !DILocation(line: 60, column: 12, scope: !69)
!74 = !DILocation(line: 60, column: 36, scope: !69)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !14, line: 61, type: !4)
!76 = !DILocation(line: 61, column: 12, scope: !69)
!77 = !DILocation(line: 61, column: 37, scope: !69)
!78 = !DILocation(line: 70, column: 16, scope: !69)
!79 = !DILocation(line: 70, column: 14, scope: !69)
!80 = !DILocation(line: 71, column: 9, scope: !69)
!81 = !DILocation(line: 71, column: 17, scope: !69)
!82 = !DILocalVariable(name: "source", scope: !83, file: !14, line: 75, type: !31)
!83 = distinct !DILexicalBlock(scope: !69, file: !14, line: 74, column: 5)
!84 = !DILocation(line: 75, column: 14, scope: !83)
!85 = !DILocation(line: 76, column: 9, scope: !83)
!86 = !DILocation(line: 77, column: 9, scope: !83)
!87 = !DILocation(line: 77, column: 23, scope: !83)
!88 = !DILocation(line: 79, column: 17, scope: !83)
!89 = !DILocation(line: 79, column: 23, scope: !83)
!90 = !DILocation(line: 79, column: 9, scope: !83)
!91 = !DILocation(line: 80, column: 9, scope: !83)
!92 = !DILocation(line: 80, column: 21, scope: !83)
!93 = !DILocation(line: 81, column: 19, scope: !83)
!94 = !DILocation(line: 81, column: 9, scope: !83)
!95 = !DILocation(line: 83, column: 1, scope: !69)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 88, type: !4)
!98 = !DILocation(line: 88, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !14, line: 89, type: !4)
!100 = !DILocation(line: 89, column: 12, scope: !96)
!101 = !DILocation(line: 89, column: 36, scope: !96)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !14, line: 90, type: !4)
!103 = !DILocation(line: 90, column: 12, scope: !96)
!104 = !DILocation(line: 90, column: 37, scope: !96)
!105 = !DILocation(line: 95, column: 16, scope: !96)
!106 = !DILocation(line: 95, column: 14, scope: !96)
!107 = !DILocation(line: 96, column: 9, scope: !96)
!108 = !DILocation(line: 96, column: 17, scope: !96)
!109 = !DILocalVariable(name: "source", scope: !110, file: !14, line: 104, type: !31)
!110 = distinct !DILexicalBlock(scope: !96, file: !14, line: 103, column: 5)
!111 = !DILocation(line: 104, column: 14, scope: !110)
!112 = !DILocation(line: 105, column: 9, scope: !110)
!113 = !DILocation(line: 106, column: 9, scope: !110)
!114 = !DILocation(line: 106, column: 23, scope: !110)
!115 = !DILocation(line: 108, column: 17, scope: !110)
!116 = !DILocation(line: 108, column: 23, scope: !110)
!117 = !DILocation(line: 108, column: 9, scope: !110)
!118 = !DILocation(line: 109, column: 9, scope: !110)
!119 = !DILocation(line: 109, column: 21, scope: !110)
!120 = !DILocation(line: 110, column: 19, scope: !110)
!121 = !DILocation(line: 110, column: 9, scope: !110)
!122 = !DILocation(line: 112, column: 1, scope: !96)