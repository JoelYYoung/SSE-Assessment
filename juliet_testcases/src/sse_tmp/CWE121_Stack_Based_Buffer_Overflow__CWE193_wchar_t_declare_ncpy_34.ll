; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType = type { i32* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !43
  store i32* %1, i32** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !48
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !48
  store i32* %2, i32** %data1, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_bad.source to i8*), i64 44, i1 false), !dbg !51
  %4 = load i32*, i32** %data1, align 8, !dbg !52
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !53
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %call = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !55
  %add = add i64 %call, 1, !dbg !56
  %call4 = call i32* @wcsncpy(i32* %4, i32* %arraydecay2, i64 %add) #7, !dbg !57
  %5 = load i32*, i32** %data1, align 8, !dbg !58
  call void @printWLine(i32* %5), !dbg !59
  ret void, !dbg !60
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType* %myUnion, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  store i32* %arraydecay, i32** %data, align 8, !dbg !94
  %0 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !98
  store i32* %1, i32** %unionFirst, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !100, metadata !DIExpression()), !dbg !102
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !103
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !103
  store i32* %2, i32** %data1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !106
  %4 = load i32*, i32** %data1, align 8, !dbg !107
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !108
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !109
  %call = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !110
  %add = add i64 %call, 1, !dbg !111
  %call4 = call i32* @wcsncpy(i32* %4, i32* %arraydecay2, i64 %add) #7, !dbg !112
  %5 = load i32*, i32** %data1, align 8, !dbg !113
  call void @printWLine(i32* %5), !dbg !114
  ret void, !dbg !115
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_bad", scope: !12, file: !12, line: 34, type: !13, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 36, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 36, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_unionType", file: !12, line: 30, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 26, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 28, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 29, baseType: !16, size: 64)
!27 = !DILocation(line: 37, column: 82, scope: !11)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 38, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 39, column: 13, scope: !11)
!38 = !DILocation(line: 42, column: 12, scope: !11)
!39 = !DILocation(line: 42, column: 10, scope: !11)
!40 = !DILocation(line: 43, column: 5, scope: !11)
!41 = !DILocation(line: 43, column: 13, scope: !11)
!42 = !DILocation(line: 44, column: 26, scope: !11)
!43 = !DILocation(line: 44, column: 13, scope: !11)
!44 = !DILocation(line: 44, column: 24, scope: !11)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 46, type: !16)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 5)
!47 = !DILocation(line: 46, column: 19, scope: !46)
!48 = !DILocation(line: 46, column: 34, scope: !46)
!49 = !DILocalVariable(name: "source", scope: !50, file: !12, line: 48, type: !34)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 47, column: 9)
!51 = !DILocation(line: 48, column: 21, scope: !50)
!52 = !DILocation(line: 51, column: 21, scope: !50)
!53 = !DILocation(line: 51, column: 27, scope: !50)
!54 = !DILocation(line: 51, column: 42, scope: !50)
!55 = !DILocation(line: 51, column: 35, scope: !50)
!56 = !DILocation(line: 51, column: 50, scope: !50)
!57 = !DILocation(line: 51, column: 13, scope: !50)
!58 = !DILocation(line: 52, column: 24, scope: !50)
!59 = !DILocation(line: 52, column: 13, scope: !50)
!60 = !DILocation(line: 55, column: 1, scope: !11)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_34_good", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 87, column: 5, scope: !61)
!63 = !DILocation(line: 88, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !65, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!19, !19, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 99, type: !19)
!71 = !DILocation(line: 99, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 99, type: !67)
!73 = !DILocation(line: 99, column: 27, scope: !64)
!74 = !DILocation(line: 102, column: 22, scope: !64)
!75 = !DILocation(line: 102, column: 12, scope: !64)
!76 = !DILocation(line: 102, column: 5, scope: !64)
!77 = !DILocation(line: 104, column: 5, scope: !64)
!78 = !DILocation(line: 105, column: 5, scope: !64)
!79 = !DILocation(line: 106, column: 5, scope: !64)
!80 = !DILocation(line: 109, column: 5, scope: !64)
!81 = !DILocation(line: 110, column: 5, scope: !64)
!82 = !DILocation(line: 111, column: 5, scope: !64)
!83 = !DILocation(line: 113, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 64, type: !16)
!86 = !DILocation(line: 64, column: 15, scope: !84)
!87 = !DILocalVariable(name: "myUnion", scope: !84, file: !12, line: 65, type: !22)
!88 = !DILocation(line: 65, column: 82, scope: !84)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !12, line: 66, type: !29)
!90 = !DILocation(line: 66, column: 13, scope: !84)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !12, line: 67, type: !34)
!92 = !DILocation(line: 67, column: 13, scope: !84)
!93 = !DILocation(line: 70, column: 12, scope: !84)
!94 = !DILocation(line: 70, column: 10, scope: !84)
!95 = !DILocation(line: 71, column: 5, scope: !84)
!96 = !DILocation(line: 71, column: 13, scope: !84)
!97 = !DILocation(line: 72, column: 26, scope: !84)
!98 = !DILocation(line: 72, column: 13, scope: !84)
!99 = !DILocation(line: 72, column: 24, scope: !84)
!100 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 74, type: !16)
!101 = distinct !DILexicalBlock(scope: !84, file: !12, line: 73, column: 5)
!102 = !DILocation(line: 74, column: 19, scope: !101)
!103 = !DILocation(line: 74, column: 34, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 76, type: !34)
!105 = distinct !DILexicalBlock(scope: !101, file: !12, line: 75, column: 9)
!106 = !DILocation(line: 76, column: 21, scope: !105)
!107 = !DILocation(line: 79, column: 21, scope: !105)
!108 = !DILocation(line: 79, column: 27, scope: !105)
!109 = !DILocation(line: 79, column: 42, scope: !105)
!110 = !DILocation(line: 79, column: 35, scope: !105)
!111 = !DILocation(line: 79, column: 50, scope: !105)
!112 = !DILocation(line: 79, column: 13, scope: !105)
!113 = !DILocation(line: 80, column: 24, scope: !105)
!114 = !DILocation(line: 80, column: 13, scope: !105)
!115 = !DILocation(line: 83, column: 1, scope: !84)
