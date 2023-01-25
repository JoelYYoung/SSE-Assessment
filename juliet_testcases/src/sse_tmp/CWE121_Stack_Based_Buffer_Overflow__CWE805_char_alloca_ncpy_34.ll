; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 50, align 16, !dbg !28
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %1 = alloca i8, i64 100, align 16, !dbg !31
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !30
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  store i8* %2, i8** %data, align 8, !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType* %myUnion to i8**, !dbg !37
  store i8* %4, i8** %unionFirst, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType* %myUnion to i8**, !dbg !42
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !42
  store i8* %5, i8** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx2, align 1, !dbg !51
  %6 = load i8*, i8** %data1, align 8, !dbg !52
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !53
  %call = call i8* @strncpy(i8* %6, i8* %arraydecay3, i64 99) #5, !dbg !54
  %7 = load i8*, i8** %data1, align 8, !dbg !55
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !55
  store i8 0, i8* %arrayidx4, align 1, !dbg !56
  %8 = load i8*, i8** %data1, align 8, !dbg !57
  call void @printLine(i8* %8), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType* %myUnion, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 50, align 16, !dbg !89
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %1 = alloca i8, i64 100, align 16, !dbg !92
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !91
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !93
  store i8* %2, i8** %data, align 8, !dbg !94
  %3 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType* %myUnion to i8**, !dbg !98
  store i8* %4, i8** %unionFirst, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !100, metadata !DIExpression()), !dbg !102
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType* %myUnion to i8**, !dbg !103
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !103
  store i8* %5, i8** %data1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx2, align 1, !dbg !109
  %6 = load i8*, i8** %data1, align 8, !dbg !110
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  %call = call i8* @strncpy(i8* %6, i8* %arraydecay3, i64 99) #5, !dbg !112
  %7 = load i8*, i8** %data1, align 8, !dbg !113
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !113
  store i8 0, i8* %arrayidx4, align 1, !dbg !114
  %8 = load i8*, i8** %data1, align 8, !dbg !115
  call void @printLine(i8* %8), !dbg !116
  ret void, !dbg !117
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_unionType", file: !14, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 23, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 24, baseType: !4, size: 64)
!25 = !DILocation(line: 32, column: 78, scope: !13)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !4)
!27 = !DILocation(line: 33, column: 12, scope: !13)
!28 = !DILocation(line: 33, column: 36, scope: !13)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !4)
!30 = !DILocation(line: 34, column: 12, scope: !13)
!31 = !DILocation(line: 34, column: 37, scope: !13)
!32 = !DILocation(line: 37, column: 12, scope: !13)
!33 = !DILocation(line: 37, column: 10, scope: !13)
!34 = !DILocation(line: 38, column: 5, scope: !13)
!35 = !DILocation(line: 38, column: 13, scope: !13)
!36 = !DILocation(line: 39, column: 26, scope: !13)
!37 = !DILocation(line: 39, column: 13, scope: !13)
!38 = !DILocation(line: 39, column: 24, scope: !13)
!39 = !DILocalVariable(name: "data", scope: !40, file: !14, line: 41, type: !4)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!41 = !DILocation(line: 41, column: 16, scope: !40)
!42 = !DILocation(line: 41, column: 31, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 43, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !14, line: 42, column: 9)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 43, column: 18, scope: !44)
!49 = !DILocation(line: 44, column: 13, scope: !44)
!50 = !DILocation(line: 45, column: 13, scope: !44)
!51 = !DILocation(line: 45, column: 27, scope: !44)
!52 = !DILocation(line: 47, column: 21, scope: !44)
!53 = !DILocation(line: 47, column: 27, scope: !44)
!54 = !DILocation(line: 47, column: 13, scope: !44)
!55 = !DILocation(line: 48, column: 13, scope: !44)
!56 = !DILocation(line: 48, column: 25, scope: !44)
!57 = !DILocation(line: 49, column: 23, scope: !44)
!58 = !DILocation(line: 49, column: 13, scope: !44)
!59 = !DILocation(line: 52, column: 1, scope: !13)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_34_good", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 85, column: 5, scope: !60)
!62 = !DILocation(line: 86, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 97, type: !64, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !14, line: 97, type: !66)
!69 = !DILocation(line: 97, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !14, line: 97, type: !67)
!71 = !DILocation(line: 97, column: 27, scope: !63)
!72 = !DILocation(line: 100, column: 22, scope: !63)
!73 = !DILocation(line: 100, column: 12, scope: !63)
!74 = !DILocation(line: 100, column: 5, scope: !63)
!75 = !DILocation(line: 102, column: 5, scope: !63)
!76 = !DILocation(line: 103, column: 5, scope: !63)
!77 = !DILocation(line: 104, column: 5, scope: !63)
!78 = !DILocation(line: 107, column: 5, scope: !63)
!79 = !DILocation(line: 108, column: 5, scope: !63)
!80 = !DILocation(line: 109, column: 5, scope: !63)
!81 = !DILocation(line: 111, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 61, type: !4)
!84 = !DILocation(line: 61, column: 12, scope: !82)
!85 = !DILocalVariable(name: "myUnion", scope: !82, file: !14, line: 62, type: !20)
!86 = !DILocation(line: 62, column: 78, scope: !82)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !14, line: 63, type: !4)
!88 = !DILocation(line: 63, column: 12, scope: !82)
!89 = !DILocation(line: 63, column: 36, scope: !82)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !14, line: 64, type: !4)
!91 = !DILocation(line: 64, column: 12, scope: !82)
!92 = !DILocation(line: 64, column: 37, scope: !82)
!93 = !DILocation(line: 66, column: 12, scope: !82)
!94 = !DILocation(line: 66, column: 10, scope: !82)
!95 = !DILocation(line: 67, column: 5, scope: !82)
!96 = !DILocation(line: 67, column: 13, scope: !82)
!97 = !DILocation(line: 68, column: 26, scope: !82)
!98 = !DILocation(line: 68, column: 13, scope: !82)
!99 = !DILocation(line: 68, column: 24, scope: !82)
!100 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 70, type: !4)
!101 = distinct !DILexicalBlock(scope: !82, file: !14, line: 69, column: 5)
!102 = !DILocation(line: 70, column: 16, scope: !101)
!103 = !DILocation(line: 70, column: 31, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !14, line: 72, type: !45)
!105 = distinct !DILexicalBlock(scope: !101, file: !14, line: 71, column: 9)
!106 = !DILocation(line: 72, column: 18, scope: !105)
!107 = !DILocation(line: 73, column: 13, scope: !105)
!108 = !DILocation(line: 74, column: 13, scope: !105)
!109 = !DILocation(line: 74, column: 27, scope: !105)
!110 = !DILocation(line: 76, column: 21, scope: !105)
!111 = !DILocation(line: 76, column: 27, scope: !105)
!112 = !DILocation(line: 76, column: 13, scope: !105)
!113 = !DILocation(line: 77, column: 13, scope: !105)
!114 = !DILocation(line: 77, column: 25, scope: !105)
!115 = !DILocation(line: 78, column: 23, scope: !105)
!116 = !DILocation(line: 78, column: 13, scope: !105)
!117 = !DILocation(line: 81, column: 1, scope: !82)
