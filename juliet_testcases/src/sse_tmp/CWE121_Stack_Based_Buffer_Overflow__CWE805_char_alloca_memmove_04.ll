; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04_bad() #0 !dbg !13 {
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !41
  %5 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !42
  store i8 0, i8* %arrayidx3, align 1, !dbg !43
  %6 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %6), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
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
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 50, align 16, !dbg !75
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %1 = alloca i8, i64 100, align 16, !dbg !78
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !77
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !79
  store i8* %2, i8** %data, align 8, !dbg !82
  %3 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !88
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx1, align 1, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !92
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !92
  %5 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !93
  store i8 0, i8* %arrayidx3, align 1, !dbg !94
  %6 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* %6), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 50, align 16, !dbg !103
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %1 = alloca i8, i64 100, align 16, !dbg !106
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !105
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !107
  store i8* %2, i8** %data, align 8, !dbg !110
  %3 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !116
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx1, align 1, !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !120
  %5 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !121
  store i8 0, i8* %arrayidx3, align 1, !dbg !122
  %6 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* %6), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04_bad", scope: !14, file: !14, line: 30, type: !15, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!41 = !DILocation(line: 47, column: 9, scope: !32)
!42 = !DILocation(line: 48, column: 9, scope: !32)
!43 = !DILocation(line: 48, column: 21, scope: !32)
!44 = !DILocation(line: 49, column: 19, scope: !32)
!45 = !DILocation(line: 49, column: 9, scope: !32)
!46 = !DILocation(line: 51, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_04_good", scope: !14, file: !14, line: 108, type: !15, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 110, column: 5, scope: !47)
!49 = !DILocation(line: 111, column: 5, scope: !47)
!50 = !DILocation(line: 112, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 124, type: !52, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 124, type: !54)
!57 = !DILocation(line: 124, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 124, type: !55)
!59 = !DILocation(line: 124, column: 27, scope: !51)
!60 = !DILocation(line: 127, column: 22, scope: !51)
!61 = !DILocation(line: 127, column: 12, scope: !51)
!62 = !DILocation(line: 127, column: 5, scope: !51)
!63 = !DILocation(line: 129, column: 5, scope: !51)
!64 = !DILocation(line: 130, column: 5, scope: !51)
!65 = !DILocation(line: 131, column: 5, scope: !51)
!66 = !DILocation(line: 134, column: 5, scope: !51)
!67 = !DILocation(line: 135, column: 5, scope: !51)
!68 = !DILocation(line: 136, column: 5, scope: !51)
!69 = !DILocation(line: 138, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !14, line: 60, type: !4)
!72 = !DILocation(line: 60, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !14, line: 61, type: !4)
!74 = !DILocation(line: 61, column: 12, scope: !70)
!75 = !DILocation(line: 61, column: 36, scope: !70)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !14, line: 62, type: !4)
!77 = !DILocation(line: 62, column: 12, scope: !70)
!78 = !DILocation(line: 62, column: 37, scope: !70)
!79 = !DILocation(line: 71, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !14, line: 69, column: 5)
!81 = distinct !DILexicalBlock(scope: !70, file: !14, line: 63, column: 8)
!82 = !DILocation(line: 71, column: 14, scope: !80)
!83 = !DILocation(line: 72, column: 9, scope: !80)
!84 = !DILocation(line: 72, column: 17, scope: !80)
!85 = !DILocalVariable(name: "source", scope: !86, file: !14, line: 75, type: !33)
!86 = distinct !DILexicalBlock(scope: !70, file: !14, line: 74, column: 5)
!87 = !DILocation(line: 75, column: 14, scope: !86)
!88 = !DILocation(line: 76, column: 9, scope: !86)
!89 = !DILocation(line: 77, column: 9, scope: !86)
!90 = !DILocation(line: 77, column: 23, scope: !86)
!91 = !DILocation(line: 79, column: 17, scope: !86)
!92 = !DILocation(line: 79, column: 9, scope: !86)
!93 = !DILocation(line: 80, column: 9, scope: !86)
!94 = !DILocation(line: 80, column: 21, scope: !86)
!95 = !DILocation(line: 81, column: 19, scope: !86)
!96 = !DILocation(line: 81, column: 9, scope: !86)
!97 = !DILocation(line: 83, column: 1, scope: !70)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 88, type: !4)
!100 = !DILocation(line: 88, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !14, line: 89, type: !4)
!102 = !DILocation(line: 89, column: 12, scope: !98)
!103 = !DILocation(line: 89, column: 36, scope: !98)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !14, line: 90, type: !4)
!105 = !DILocation(line: 90, column: 12, scope: !98)
!106 = !DILocation(line: 90, column: 37, scope: !98)
!107 = !DILocation(line: 94, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !14, line: 92, column: 5)
!109 = distinct !DILexicalBlock(scope: !98, file: !14, line: 91, column: 8)
!110 = !DILocation(line: 94, column: 14, scope: !108)
!111 = !DILocation(line: 95, column: 9, scope: !108)
!112 = !DILocation(line: 95, column: 17, scope: !108)
!113 = !DILocalVariable(name: "source", scope: !114, file: !14, line: 98, type: !33)
!114 = distinct !DILexicalBlock(scope: !98, file: !14, line: 97, column: 5)
!115 = !DILocation(line: 98, column: 14, scope: !114)
!116 = !DILocation(line: 99, column: 9, scope: !114)
!117 = !DILocation(line: 100, column: 9, scope: !114)
!118 = !DILocation(line: 100, column: 23, scope: !114)
!119 = !DILocation(line: 102, column: 17, scope: !114)
!120 = !DILocation(line: 102, column: 9, scope: !114)
!121 = !DILocation(line: 103, column: 9, scope: !114)
!122 = !DILocation(line: 103, column: 21, scope: !114)
!123 = !DILocation(line: 104, column: 19, scope: !114)
!124 = !DILocation(line: 104, column: 9, scope: !114)
!125 = !DILocation(line: 106, column: 1, scope: !98)
