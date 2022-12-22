; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04_bad() #0 !dbg !13 {
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
  store i8* %2, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !37
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !43
  store i8 0, i8* %arrayidx3, align 1, !dbg !44
  %6 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %6), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 50, align 16, !dbg !76
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %1 = alloca i8, i64 100, align 16, !dbg !79
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !78
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !80
  store i8* %2, i8** %data, align 8, !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !89
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx1, align 1, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !93
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !94
  %5 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !95
  store i8 0, i8* %arrayidx3, align 1, !dbg !96
  %6 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* %6), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 50, align 16, !dbg !105
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %1 = alloca i8, i64 100, align 16, !dbg !108
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !107
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !109
  store i8* %2, i8** %data, align 8, !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !118
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx1, align 1, !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !123
  %5 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !124
  store i8 0, i8* %arrayidx3, align 1, !dbg !125
  %6 = load i8*, i8** %data, align 8, !dbg !126
  call void @printLine(i8* %6), !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04_bad", scope: !14, file: !14, line: 30, type: !15, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 32, type: !4)
!18 = !DILocation(line: 32, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 12, scope: !13)
!21 = !DILocation(line: 33, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !4)
!23 = !DILocation(line: 34, column: 12, scope: !13)
!24 = !DILocation(line: 34, column: 37, scope: !13)
!25 = !DILocation(line: 39, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !14, line: 36, column: 5)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 8)
!28 = !DILocation(line: 39, column: 14, scope: !26)
!29 = !DILocation(line: 40, column: 9, scope: !26)
!30 = !DILocation(line: 40, column: 17, scope: !26)
!31 = !DILocalVariable(name: "source", scope: !32, file: !14, line: 43, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 43, column: 14, scope: !32)
!37 = !DILocation(line: 44, column: 9, scope: !32)
!38 = !DILocation(line: 45, column: 9, scope: !32)
!39 = !DILocation(line: 45, column: 23, scope: !32)
!40 = !DILocation(line: 47, column: 17, scope: !32)
!41 = !DILocation(line: 47, column: 23, scope: !32)
!42 = !DILocation(line: 47, column: 9, scope: !32)
!43 = !DILocation(line: 48, column: 9, scope: !32)
!44 = !DILocation(line: 48, column: 21, scope: !32)
!45 = !DILocation(line: 49, column: 19, scope: !32)
!46 = !DILocation(line: 49, column: 9, scope: !32)
!47 = !DILocation(line: 51, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_04_good", scope: !14, file: !14, line: 108, type: !15, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 110, column: 5, scope: !48)
!50 = !DILocation(line: 111, column: 5, scope: !48)
!51 = !DILocation(line: 112, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 124, type: !53, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !14, line: 124, type: !55)
!58 = !DILocation(line: 124, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !14, line: 124, type: !56)
!60 = !DILocation(line: 124, column: 27, scope: !52)
!61 = !DILocation(line: 127, column: 22, scope: !52)
!62 = !DILocation(line: 127, column: 12, scope: !52)
!63 = !DILocation(line: 127, column: 5, scope: !52)
!64 = !DILocation(line: 129, column: 5, scope: !52)
!65 = !DILocation(line: 130, column: 5, scope: !52)
!66 = !DILocation(line: 131, column: 5, scope: !52)
!67 = !DILocation(line: 134, column: 5, scope: !52)
!68 = !DILocation(line: 135, column: 5, scope: !52)
!69 = !DILocation(line: 136, column: 5, scope: !52)
!70 = !DILocation(line: 138, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 60, type: !4)
!73 = !DILocation(line: 60, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !14, line: 61, type: !4)
!75 = !DILocation(line: 61, column: 12, scope: !71)
!76 = !DILocation(line: 61, column: 36, scope: !71)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !14, line: 62, type: !4)
!78 = !DILocation(line: 62, column: 12, scope: !71)
!79 = !DILocation(line: 62, column: 37, scope: !71)
!80 = !DILocation(line: 71, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !14, line: 69, column: 5)
!82 = distinct !DILexicalBlock(scope: !71, file: !14, line: 63, column: 8)
!83 = !DILocation(line: 71, column: 14, scope: !81)
!84 = !DILocation(line: 72, column: 9, scope: !81)
!85 = !DILocation(line: 72, column: 17, scope: !81)
!86 = !DILocalVariable(name: "source", scope: !87, file: !14, line: 75, type: !33)
!87 = distinct !DILexicalBlock(scope: !71, file: !14, line: 74, column: 5)
!88 = !DILocation(line: 75, column: 14, scope: !87)
!89 = !DILocation(line: 76, column: 9, scope: !87)
!90 = !DILocation(line: 77, column: 9, scope: !87)
!91 = !DILocation(line: 77, column: 23, scope: !87)
!92 = !DILocation(line: 79, column: 17, scope: !87)
!93 = !DILocation(line: 79, column: 23, scope: !87)
!94 = !DILocation(line: 79, column: 9, scope: !87)
!95 = !DILocation(line: 80, column: 9, scope: !87)
!96 = !DILocation(line: 80, column: 21, scope: !87)
!97 = !DILocation(line: 81, column: 19, scope: !87)
!98 = !DILocation(line: 81, column: 9, scope: !87)
!99 = !DILocation(line: 83, column: 1, scope: !71)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !14, line: 88, type: !4)
!102 = !DILocation(line: 88, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !14, line: 89, type: !4)
!104 = !DILocation(line: 89, column: 12, scope: !100)
!105 = !DILocation(line: 89, column: 36, scope: !100)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !14, line: 90, type: !4)
!107 = !DILocation(line: 90, column: 12, scope: !100)
!108 = !DILocation(line: 90, column: 37, scope: !100)
!109 = !DILocation(line: 94, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !14, line: 92, column: 5)
!111 = distinct !DILexicalBlock(scope: !100, file: !14, line: 91, column: 8)
!112 = !DILocation(line: 94, column: 14, scope: !110)
!113 = !DILocation(line: 95, column: 9, scope: !110)
!114 = !DILocation(line: 95, column: 17, scope: !110)
!115 = !DILocalVariable(name: "source", scope: !116, file: !14, line: 98, type: !33)
!116 = distinct !DILexicalBlock(scope: !100, file: !14, line: 97, column: 5)
!117 = !DILocation(line: 98, column: 14, scope: !116)
!118 = !DILocation(line: 99, column: 9, scope: !116)
!119 = !DILocation(line: 100, column: 9, scope: !116)
!120 = !DILocation(line: 100, column: 23, scope: !116)
!121 = !DILocation(line: 102, column: 17, scope: !116)
!122 = !DILocation(line: 102, column: 23, scope: !116)
!123 = !DILocation(line: 102, column: 9, scope: !116)
!124 = !DILocation(line: 103, column: 9, scope: !116)
!125 = !DILocation(line: 103, column: 21, scope: !116)
!126 = !DILocation(line: 104, column: 19, scope: !116)
!127 = !DILocation(line: 104, column: 9, scope: !116)
!128 = !DILocation(line: 106, column: 1, scope: !100)
