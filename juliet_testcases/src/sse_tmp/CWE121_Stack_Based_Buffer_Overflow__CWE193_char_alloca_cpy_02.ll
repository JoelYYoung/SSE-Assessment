; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !38
  %call = call i8* @strcpy(i8* %5, i8* %arraydecay) #5, !dbg !39
  %6 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* %6), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 10, align 16, !dbg !71
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %1 = alloca i8, i64 11, align 16, !dbg !74
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !73
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !75
  store i8* %2, i8** %data, align 8, !dbg !78
  %3 = load i8*, i8** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !83
  %5 = load i8*, i8** %data, align 8, !dbg !84
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !85
  %call = call i8* @strcpy(i8* %5, i8* %arraydecay) #5, !dbg !86
  %6 = load i8*, i8** %data, align 8, !dbg !87
  call void @printLine(i8* %6), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 10, align 16, !dbg !95
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %1 = alloca i8, i64 11, align 16, !dbg !98
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !97
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  store i8* %2, i8** %data, align 8, !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !107
  %5 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !109
  %call = call i8* @strcpy(i8* %5, i8* %arraydecay) #5, !dbg !110
  %6 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %6), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 37, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !14, line: 34, column: 5)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 8)
!28 = !DILocation(line: 37, column: 14, scope: !26)
!29 = !DILocation(line: 38, column: 9, scope: !26)
!30 = !DILocation(line: 38, column: 17, scope: !26)
!31 = !DILocalVariable(name: "source", scope: !32, file: !14, line: 41, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 11)
!36 = !DILocation(line: 41, column: 14, scope: !32)
!37 = !DILocation(line: 43, column: 16, scope: !32)
!38 = !DILocation(line: 43, column: 22, scope: !32)
!39 = !DILocation(line: 43, column: 9, scope: !32)
!40 = !DILocation(line: 44, column: 19, scope: !32)
!41 = !DILocation(line: 44, column: 9, scope: !32)
!42 = !DILocation(line: 46, column: 1, scope: !13)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_02_good", scope: !14, file: !14, line: 99, type: !15, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 101, column: 5, scope: !43)
!45 = !DILocation(line: 102, column: 5, scope: !43)
!46 = !DILocation(line: 103, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 115, type: !48, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !14, line: 115, type: !50)
!53 = !DILocation(line: 115, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !14, line: 115, type: !51)
!55 = !DILocation(line: 115, column: 27, scope: !47)
!56 = !DILocation(line: 118, column: 22, scope: !47)
!57 = !DILocation(line: 118, column: 12, scope: !47)
!58 = !DILocation(line: 118, column: 5, scope: !47)
!59 = !DILocation(line: 120, column: 5, scope: !47)
!60 = !DILocation(line: 121, column: 5, scope: !47)
!61 = !DILocation(line: 122, column: 5, scope: !47)
!62 = !DILocation(line: 125, column: 5, scope: !47)
!63 = !DILocation(line: 126, column: 5, scope: !47)
!64 = !DILocation(line: 127, column: 5, scope: !47)
!65 = !DILocation(line: 129, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 55, type: !4)
!68 = !DILocation(line: 55, column: 12, scope: !66)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !14, line: 56, type: !4)
!70 = !DILocation(line: 56, column: 12, scope: !66)
!71 = !DILocation(line: 56, column: 36, scope: !66)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !14, line: 57, type: !4)
!73 = !DILocation(line: 57, column: 12, scope: !66)
!74 = !DILocation(line: 57, column: 37, scope: !66)
!75 = !DILocation(line: 67, column: 16, scope: !76)
!76 = distinct !DILexicalBlock(scope: !77, file: !14, line: 64, column: 5)
!77 = distinct !DILexicalBlock(scope: !66, file: !14, line: 58, column: 8)
!78 = !DILocation(line: 67, column: 14, scope: !76)
!79 = !DILocation(line: 68, column: 9, scope: !76)
!80 = !DILocation(line: 68, column: 17, scope: !76)
!81 = !DILocalVariable(name: "source", scope: !82, file: !14, line: 71, type: !33)
!82 = distinct !DILexicalBlock(scope: !66, file: !14, line: 70, column: 5)
!83 = !DILocation(line: 71, column: 14, scope: !82)
!84 = !DILocation(line: 73, column: 16, scope: !82)
!85 = !DILocation(line: 73, column: 22, scope: !82)
!86 = !DILocation(line: 73, column: 9, scope: !82)
!87 = !DILocation(line: 74, column: 19, scope: !82)
!88 = !DILocation(line: 74, column: 9, scope: !82)
!89 = !DILocation(line: 76, column: 1, scope: !66)
!90 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !14, line: 81, type: !4)
!92 = !DILocation(line: 81, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !14, line: 82, type: !4)
!94 = !DILocation(line: 82, column: 12, scope: !90)
!95 = !DILocation(line: 82, column: 36, scope: !90)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !14, line: 83, type: !4)
!97 = !DILocation(line: 83, column: 12, scope: !90)
!98 = !DILocation(line: 83, column: 37, scope: !90)
!99 = !DILocation(line: 88, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !14, line: 85, column: 5)
!101 = distinct !DILexicalBlock(scope: !90, file: !14, line: 84, column: 8)
!102 = !DILocation(line: 88, column: 14, scope: !100)
!103 = !DILocation(line: 89, column: 9, scope: !100)
!104 = !DILocation(line: 89, column: 17, scope: !100)
!105 = !DILocalVariable(name: "source", scope: !106, file: !14, line: 92, type: !33)
!106 = distinct !DILexicalBlock(scope: !90, file: !14, line: 91, column: 5)
!107 = !DILocation(line: 92, column: 14, scope: !106)
!108 = !DILocation(line: 94, column: 16, scope: !106)
!109 = !DILocation(line: 94, column: 22, scope: !106)
!110 = !DILocation(line: 94, column: 9, scope: !106)
!111 = !DILocation(line: 95, column: 19, scope: !106)
!112 = !DILocation(line: 95, column: 9, scope: !106)
!113 = !DILocation(line: 97, column: 1, scope: !90)
