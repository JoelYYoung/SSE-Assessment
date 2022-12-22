; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03_bad() #0 !dbg !13 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !38
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !39
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !40
  %add = add i64 %call, 1, !dbg !41
  %mul = mul i64 %add, 1, !dbg !42
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %6), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03_good() #0 !dbg !46 {
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
  %call = call i64 @time(i64* null) #7, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #7, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 10, align 16, !dbg !74
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %1 = alloca i8, i64 11, align 16, !dbg !77
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !76
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !78
  store i8* %2, i8** %data, align 8, !dbg !81
  %3 = load i8*, i8** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !86
  %5 = load i8*, i8** %data, align 8, !dbg !87
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !88
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !89
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !90
  %add = add i64 %call, 1, !dbg !91
  %mul = mul i64 %add, 1, !dbg !92
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !88
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
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 10, align 16, !dbg !101
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %1 = alloca i8, i64 11, align 16, !dbg !104
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !103
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !105
  store i8* %2, i8** %data, align 8, !dbg !108
  %3 = load i8*, i8** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !113
  %5 = load i8*, i8** %data, align 8, !dbg !114
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !115
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !116
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !117
  %add = add i64 %call, 1, !dbg !118
  %mul = mul i64 %add, 1, !dbg !119
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !115
  %6 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %6), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03.c", directory: "/root/SSE-Assessment")
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
!37 = !DILocation(line: 44, column: 17, scope: !32)
!38 = !DILocation(line: 44, column: 9, scope: !32)
!39 = !DILocation(line: 44, column: 39, scope: !32)
!40 = !DILocation(line: 44, column: 32, scope: !32)
!41 = !DILocation(line: 44, column: 47, scope: !32)
!42 = !DILocation(line: 44, column: 52, scope: !32)
!43 = !DILocation(line: 45, column: 19, scope: !32)
!44 = !DILocation(line: 45, column: 9, scope: !32)
!45 = !DILocation(line: 47, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_03_good", scope: !14, file: !14, line: 102, type: !15, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 104, column: 5, scope: !46)
!48 = !DILocation(line: 105, column: 5, scope: !46)
!49 = !DILocation(line: 106, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 118, type: !51, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 118, type: !53)
!56 = !DILocation(line: 118, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 118, type: !54)
!58 = !DILocation(line: 118, column: 27, scope: !50)
!59 = !DILocation(line: 121, column: 22, scope: !50)
!60 = !DILocation(line: 121, column: 12, scope: !50)
!61 = !DILocation(line: 121, column: 5, scope: !50)
!62 = !DILocation(line: 123, column: 5, scope: !50)
!63 = !DILocation(line: 124, column: 5, scope: !50)
!64 = !DILocation(line: 125, column: 5, scope: !50)
!65 = !DILocation(line: 128, column: 5, scope: !50)
!66 = !DILocation(line: 129, column: 5, scope: !50)
!67 = !DILocation(line: 130, column: 5, scope: !50)
!68 = !DILocation(line: 132, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 56, type: !4)
!71 = !DILocation(line: 56, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !14, line: 57, type: !4)
!73 = !DILocation(line: 57, column: 12, scope: !69)
!74 = !DILocation(line: 57, column: 36, scope: !69)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !14, line: 58, type: !4)
!76 = !DILocation(line: 58, column: 12, scope: !69)
!77 = !DILocation(line: 58, column: 37, scope: !69)
!78 = !DILocation(line: 68, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !14, line: 65, column: 5)
!80 = distinct !DILexicalBlock(scope: !69, file: !14, line: 59, column: 8)
!81 = !DILocation(line: 68, column: 14, scope: !79)
!82 = !DILocation(line: 69, column: 9, scope: !79)
!83 = !DILocation(line: 69, column: 17, scope: !79)
!84 = !DILocalVariable(name: "source", scope: !85, file: !14, line: 72, type: !33)
!85 = distinct !DILexicalBlock(scope: !69, file: !14, line: 71, column: 5)
!86 = !DILocation(line: 72, column: 14, scope: !85)
!87 = !DILocation(line: 75, column: 17, scope: !85)
!88 = !DILocation(line: 75, column: 9, scope: !85)
!89 = !DILocation(line: 75, column: 39, scope: !85)
!90 = !DILocation(line: 75, column: 32, scope: !85)
!91 = !DILocation(line: 75, column: 47, scope: !85)
!92 = !DILocation(line: 75, column: 52, scope: !85)
!93 = !DILocation(line: 76, column: 19, scope: !85)
!94 = !DILocation(line: 76, column: 9, scope: !85)
!95 = !DILocation(line: 78, column: 1, scope: !69)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 83, type: !4)
!98 = !DILocation(line: 83, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !14, line: 84, type: !4)
!100 = !DILocation(line: 84, column: 12, scope: !96)
!101 = !DILocation(line: 84, column: 36, scope: !96)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !14, line: 85, type: !4)
!103 = !DILocation(line: 85, column: 12, scope: !96)
!104 = !DILocation(line: 85, column: 37, scope: !96)
!105 = !DILocation(line: 90, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !14, line: 87, column: 5)
!107 = distinct !DILexicalBlock(scope: !96, file: !14, line: 86, column: 8)
!108 = !DILocation(line: 90, column: 14, scope: !106)
!109 = !DILocation(line: 91, column: 9, scope: !106)
!110 = !DILocation(line: 91, column: 17, scope: !106)
!111 = !DILocalVariable(name: "source", scope: !112, file: !14, line: 94, type: !33)
!112 = distinct !DILexicalBlock(scope: !96, file: !14, line: 93, column: 5)
!113 = !DILocation(line: 94, column: 14, scope: !112)
!114 = !DILocation(line: 97, column: 17, scope: !112)
!115 = !DILocation(line: 97, column: 9, scope: !112)
!116 = !DILocation(line: 97, column: 39, scope: !112)
!117 = !DILocation(line: 97, column: 32, scope: !112)
!118 = !DILocation(line: 97, column: 47, scope: !112)
!119 = !DILocation(line: 97, column: 52, scope: !112)
!120 = !DILocation(line: 98, column: 19, scope: !112)
!121 = !DILocation(line: 98, column: 9, scope: !112)
!122 = !DILocation(line: 100, column: 1, scope: !96)
