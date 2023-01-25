; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType = type { i32* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 40, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 44, align 16, !dbg !34
  %3 = bitcast i8* %2 to i32*, !dbg !35
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %4, i32** %data, align 8, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !41
  store i32* %6, i32** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !46
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !46
  store i32* %7, i32** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_bad.source to i8*), i64 44, i1 false), !dbg !52
  %9 = load i32*, i32** %data1, align 8, !dbg !53
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !55
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !56
  %add = add i64 %call, 1, !dbg !57
  %call3 = call i32* @wcsncpy(i32* %9, i32* %arraydecay, i64 %add) #7, !dbg !58
  %10 = load i32*, i32** %data1, align 8, !dbg !59
  call void @printWLine(i32* %10), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #7, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #7, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType* %myUnion, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 40, align 16, !dbg !92
  %1 = bitcast i8* %0 to i32*, !dbg !93
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %2 = alloca i8, i64 44, align 16, !dbg !96
  %3 = bitcast i8* %2 to i32*, !dbg !97
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !95
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !98
  store i32* %4, i32** %data, align 8, !dbg !99
  %5 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !103
  store i32* %6, i32** %unionFirst, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !105, metadata !DIExpression()), !dbg !107
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !108
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !108
  store i32* %7, i32** %data1, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !111
  %9 = load i32*, i32** %data1, align 8, !dbg !112
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !113
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !114
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !115
  %add = add i64 %call, 1, !dbg !116
  %call3 = call i32* @wcsncpy(i32* %9, i32* %arraydecay, i64 %add) #7, !dbg !117
  %10 = load i32*, i32** %data1, align 8, !dbg !118
  call void @printWLine(i32* %10), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_bad", scope: !16, file: !16, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 36, type: !4)
!20 = !DILocation(line: 36, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_unionType", file: !16, line: 30, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 26, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 28, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 29, baseType: !4, size: 64)
!27 = !DILocation(line: 37, column: 81, scope: !15)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 38, type: !4)
!29 = !DILocation(line: 38, column: 15, scope: !15)
!30 = !DILocation(line: 38, column: 42, scope: !15)
!31 = !DILocation(line: 38, column: 31, scope: !15)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 39, type: !4)
!33 = !DILocation(line: 39, column: 15, scope: !15)
!34 = !DILocation(line: 39, column: 43, scope: !15)
!35 = !DILocation(line: 39, column: 32, scope: !15)
!36 = !DILocation(line: 42, column: 12, scope: !15)
!37 = !DILocation(line: 42, column: 10, scope: !15)
!38 = !DILocation(line: 43, column: 5, scope: !15)
!39 = !DILocation(line: 43, column: 13, scope: !15)
!40 = !DILocation(line: 44, column: 26, scope: !15)
!41 = !DILocation(line: 44, column: 13, scope: !15)
!42 = !DILocation(line: 44, column: 24, scope: !15)
!43 = !DILocalVariable(name: "data", scope: !44, file: !16, line: 46, type: !4)
!44 = distinct !DILexicalBlock(scope: !15, file: !16, line: 45, column: 5)
!45 = !DILocation(line: 46, column: 19, scope: !44)
!46 = !DILocation(line: 46, column: 34, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !16, line: 48, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !16, line: 47, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 48, column: 21, scope: !48)
!53 = !DILocation(line: 51, column: 21, scope: !48)
!54 = !DILocation(line: 51, column: 27, scope: !48)
!55 = !DILocation(line: 51, column: 42, scope: !48)
!56 = !DILocation(line: 51, column: 35, scope: !48)
!57 = !DILocation(line: 51, column: 50, scope: !48)
!58 = !DILocation(line: 51, column: 13, scope: !48)
!59 = !DILocation(line: 52, column: 24, scope: !48)
!60 = !DILocation(line: 52, column: 13, scope: !48)
!61 = !DILocation(line: 55, column: 1, scope: !15)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_34_good", scope: !16, file: !16, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 87, column: 5, scope: !62)
!64 = !DILocation(line: 88, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 99, type: !66, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!7, !7, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !16, line: 99, type: !7)
!72 = !DILocation(line: 99, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !16, line: 99, type: !68)
!74 = !DILocation(line: 99, column: 27, scope: !65)
!75 = !DILocation(line: 102, column: 22, scope: !65)
!76 = !DILocation(line: 102, column: 12, scope: !65)
!77 = !DILocation(line: 102, column: 5, scope: !65)
!78 = !DILocation(line: 104, column: 5, scope: !65)
!79 = !DILocation(line: 105, column: 5, scope: !65)
!80 = !DILocation(line: 106, column: 5, scope: !65)
!81 = !DILocation(line: 109, column: 5, scope: !65)
!82 = !DILocation(line: 110, column: 5, scope: !65)
!83 = !DILocation(line: 111, column: 5, scope: !65)
!84 = !DILocation(line: 113, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !16, line: 64, type: !4)
!87 = !DILocation(line: 64, column: 15, scope: !85)
!88 = !DILocalVariable(name: "myUnion", scope: !85, file: !16, line: 65, type: !22)
!89 = !DILocation(line: 65, column: 81, scope: !85)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !16, line: 66, type: !4)
!91 = !DILocation(line: 66, column: 15, scope: !85)
!92 = !DILocation(line: 66, column: 42, scope: !85)
!93 = !DILocation(line: 66, column: 31, scope: !85)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !16, line: 67, type: !4)
!95 = !DILocation(line: 67, column: 15, scope: !85)
!96 = !DILocation(line: 67, column: 43, scope: !85)
!97 = !DILocation(line: 67, column: 32, scope: !85)
!98 = !DILocation(line: 70, column: 12, scope: !85)
!99 = !DILocation(line: 70, column: 10, scope: !85)
!100 = !DILocation(line: 71, column: 5, scope: !85)
!101 = !DILocation(line: 71, column: 13, scope: !85)
!102 = !DILocation(line: 72, column: 26, scope: !85)
!103 = !DILocation(line: 72, column: 13, scope: !85)
!104 = !DILocation(line: 72, column: 24, scope: !85)
!105 = !DILocalVariable(name: "data", scope: !106, file: !16, line: 74, type: !4)
!106 = distinct !DILexicalBlock(scope: !85, file: !16, line: 73, column: 5)
!107 = !DILocation(line: 74, column: 19, scope: !106)
!108 = !DILocation(line: 74, column: 34, scope: !106)
!109 = !DILocalVariable(name: "source", scope: !110, file: !16, line: 76, type: !49)
!110 = distinct !DILexicalBlock(scope: !106, file: !16, line: 75, column: 9)
!111 = !DILocation(line: 76, column: 21, scope: !110)
!112 = !DILocation(line: 79, column: 21, scope: !110)
!113 = !DILocation(line: 79, column: 27, scope: !110)
!114 = !DILocation(line: 79, column: 42, scope: !110)
!115 = !DILocation(line: 79, column: 35, scope: !110)
!116 = !DILocation(line: 79, column: 50, scope: !110)
!117 = !DILocation(line: 79, column: 13, scope: !110)
!118 = !DILocation(line: 80, column: 24, scope: !110)
!119 = !DILocation(line: 80, column: 13, scope: !110)
!120 = !DILocation(line: 83, column: 1, scope: !85)
