; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15_bad() #0 !dbg !13 {
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
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %call = call i8* @strcpy(i8* %5, i8* %arraydecay) #5, !dbg !37
  %6 = load i8*, i8** %data, align 8, !dbg !38
  call void @printLine(i8* %6), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15_good() #0 !dbg !41 {
entry:
  call void @goodG2B1(), !dbg !42
  call void @goodG2B2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #5, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #5, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = alloca i8, i64 10, align 16, !dbg !69
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %1 = alloca i8, i64 11, align 16, !dbg !72
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !71
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !73
  store i8* %2, i8** %data, align 8, !dbg !74
  %3 = load i8*, i8** %data, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !75
  store i8 0, i8* %arrayidx, align 1, !dbg !76
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !79
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !79
  %5 = load i8*, i8** %data, align 8, !dbg !80
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !81
  %call = call i8* @strcpy(i8* %5, i8* %arraydecay) #5, !dbg !82
  %6 = load i8*, i8** %data, align 8, !dbg !83
  call void @printLine(i8* %6), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 10, align 16, !dbg !91
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %1 = alloca i8, i64 11, align 16, !dbg !94
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !93
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !95
  store i8* %2, i8** %data, align 8, !dbg !96
  %3 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !103
  %call = call i8* @strcpy(i8* %5, i8* %arraydecay) #5, !dbg !104
  %6 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %6), !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!25 = !DILocation(line: 38, column: 16, scope: !13)
!26 = !DILocation(line: 38, column: 14, scope: !13)
!27 = !DILocation(line: 39, column: 9, scope: !13)
!28 = !DILocation(line: 39, column: 17, scope: !13)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 47, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 46, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 47, column: 14, scope: !30)
!35 = !DILocation(line: 49, column: 16, scope: !30)
!36 = !DILocation(line: 49, column: 22, scope: !30)
!37 = !DILocation(line: 49, column: 9, scope: !30)
!38 = !DILocation(line: 50, column: 19, scope: !30)
!39 = !DILocation(line: 50, column: 9, scope: !30)
!40 = !DILocation(line: 52, column: 1, scope: !13)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_15_good", scope: !14, file: !14, line: 112, type: !15, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 114, column: 5, scope: !41)
!43 = !DILocation(line: 115, column: 5, scope: !41)
!44 = !DILocation(line: 116, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 128, type: !46, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !14, line: 128, type: !48)
!51 = !DILocation(line: 128, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !14, line: 128, type: !49)
!53 = !DILocation(line: 128, column: 27, scope: !45)
!54 = !DILocation(line: 131, column: 22, scope: !45)
!55 = !DILocation(line: 131, column: 12, scope: !45)
!56 = !DILocation(line: 131, column: 5, scope: !45)
!57 = !DILocation(line: 133, column: 5, scope: !45)
!58 = !DILocation(line: 134, column: 5, scope: !45)
!59 = !DILocation(line: 135, column: 5, scope: !45)
!60 = !DILocation(line: 138, column: 5, scope: !45)
!61 = !DILocation(line: 139, column: 5, scope: !45)
!62 = !DILocation(line: 140, column: 5, scope: !45)
!63 = !DILocation(line: 142, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !14, line: 61, type: !4)
!66 = !DILocation(line: 61, column: 12, scope: !64)
!67 = !DILocalVariable(name: "dataBadBuffer", scope: !64, file: !14, line: 62, type: !4)
!68 = !DILocation(line: 62, column: 12, scope: !64)
!69 = !DILocation(line: 62, column: 36, scope: !64)
!70 = !DILocalVariable(name: "dataGoodBuffer", scope: !64, file: !14, line: 63, type: !4)
!71 = !DILocation(line: 63, column: 12, scope: !64)
!72 = !DILocation(line: 63, column: 37, scope: !64)
!73 = !DILocation(line: 73, column: 16, scope: !64)
!74 = !DILocation(line: 73, column: 14, scope: !64)
!75 = !DILocation(line: 74, column: 9, scope: !64)
!76 = !DILocation(line: 74, column: 17, scope: !64)
!77 = !DILocalVariable(name: "source", scope: !78, file: !14, line: 78, type: !31)
!78 = distinct !DILexicalBlock(scope: !64, file: !14, line: 77, column: 5)
!79 = !DILocation(line: 78, column: 14, scope: !78)
!80 = !DILocation(line: 80, column: 16, scope: !78)
!81 = !DILocation(line: 80, column: 22, scope: !78)
!82 = !DILocation(line: 80, column: 9, scope: !78)
!83 = !DILocation(line: 81, column: 19, scope: !78)
!84 = !DILocation(line: 81, column: 9, scope: !78)
!85 = !DILocation(line: 83, column: 1, scope: !64)
!86 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 88, type: !4)
!88 = !DILocation(line: 88, column: 12, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !14, line: 89, type: !4)
!90 = !DILocation(line: 89, column: 12, scope: !86)
!91 = !DILocation(line: 89, column: 36, scope: !86)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !14, line: 90, type: !4)
!93 = !DILocation(line: 90, column: 12, scope: !86)
!94 = !DILocation(line: 90, column: 37, scope: !86)
!95 = !DILocation(line: 96, column: 16, scope: !86)
!96 = !DILocation(line: 96, column: 14, scope: !86)
!97 = !DILocation(line: 97, column: 9, scope: !86)
!98 = !DILocation(line: 97, column: 17, scope: !86)
!99 = !DILocalVariable(name: "source", scope: !100, file: !14, line: 105, type: !31)
!100 = distinct !DILexicalBlock(scope: !86, file: !14, line: 104, column: 5)
!101 = !DILocation(line: 105, column: 14, scope: !100)
!102 = !DILocation(line: 107, column: 16, scope: !100)
!103 = !DILocation(line: 107, column: 22, scope: !100)
!104 = !DILocation(line: 107, column: 9, scope: !100)
!105 = !DILocation(line: 108, column: 19, scope: !100)
!106 = !DILocation(line: 108, column: 9, scope: !100)
!107 = !DILocation(line: 110, column: 1, scope: !86)
