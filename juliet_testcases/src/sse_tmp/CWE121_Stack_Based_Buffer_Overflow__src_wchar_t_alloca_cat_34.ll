; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %2, i32** %data, align 8, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !35
  %4 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType* %myUnion to i32**, !dbg !39
  store i32* %5, i32** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType* %myUnion to i32**, !dbg !44
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !44
  store i32* %6, i32** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %8 = load i32*, i32** %data1, align 8, !dbg !52
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %8) #5, !dbg !53
  %9 = load i32*, i32** %data1, align 8, !dbg !54
  call void @printWLine(i32* %9), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType* %myUnion, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 400, align 16, !dbg !87
  %1 = bitcast i8* %0 to i32*, !dbg !88
  store i32* %1, i32** %dataBuffer, align 8, !dbg !86
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  store i32* %2, i32** %data, align 8, !dbg !90
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !92
  %4 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType* %myUnion to i32**, !dbg !96
  store i32* %5, i32** %unionFirst, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !98, metadata !DIExpression()), !dbg !100
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType* %myUnion to i32**, !dbg !101
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !101
  store i32* %6, i32** %data1, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !105
  %8 = load i32*, i32** %data1, align 8, !dbg !106
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %8) #5, !dbg !107
  %9 = load i32*, i32** %data1, align 8, !dbg !108
  call void @printWLine(i32* %9), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 77, scope: !15)
!28 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 33, type: !4)
!29 = !DILocation(line: 33, column: 15, scope: !15)
!30 = !DILocation(line: 33, column: 39, scope: !15)
!31 = !DILocation(line: 33, column: 28, scope: !15)
!32 = !DILocation(line: 34, column: 12, scope: !15)
!33 = !DILocation(line: 34, column: 10, scope: !15)
!34 = !DILocation(line: 36, column: 13, scope: !15)
!35 = !DILocation(line: 36, column: 5, scope: !15)
!36 = !DILocation(line: 37, column: 5, scope: !15)
!37 = !DILocation(line: 37, column: 17, scope: !15)
!38 = !DILocation(line: 38, column: 26, scope: !15)
!39 = !DILocation(line: 38, column: 13, scope: !15)
!40 = !DILocation(line: 38, column: 24, scope: !15)
!41 = !DILocalVariable(name: "data", scope: !42, file: !16, line: 40, type: !4)
!42 = distinct !DILexicalBlock(scope: !15, file: !16, line: 39, column: 5)
!43 = !DILocation(line: 40, column: 19, scope: !42)
!44 = !DILocation(line: 40, column: 34, scope: !42)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !16, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !16, line: 41, column: 9)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 42, column: 21, scope: !46)
!51 = !DILocation(line: 44, column: 20, scope: !46)
!52 = !DILocation(line: 44, column: 26, scope: !46)
!53 = !DILocation(line: 44, column: 13, scope: !46)
!54 = !DILocation(line: 45, column: 24, scope: !46)
!55 = !DILocation(line: 45, column: 13, scope: !46)
!56 = !DILocation(line: 48, column: 1, scope: !15)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_34_good", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 78, column: 5, scope: !57)
!59 = !DILocation(line: 79, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 90, type: !61, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !16, line: 90, type: !7)
!67 = !DILocation(line: 90, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !16, line: 90, type: !63)
!69 = !DILocation(line: 90, column: 27, scope: !60)
!70 = !DILocation(line: 93, column: 22, scope: !60)
!71 = !DILocation(line: 93, column: 12, scope: !60)
!72 = !DILocation(line: 93, column: 5, scope: !60)
!73 = !DILocation(line: 95, column: 5, scope: !60)
!74 = !DILocation(line: 96, column: 5, scope: !60)
!75 = !DILocation(line: 97, column: 5, scope: !60)
!76 = !DILocation(line: 100, column: 5, scope: !60)
!77 = !DILocation(line: 101, column: 5, scope: !60)
!78 = !DILocation(line: 102, column: 5, scope: !60)
!79 = !DILocation(line: 104, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !16, line: 57, type: !4)
!82 = !DILocation(line: 57, column: 15, scope: !80)
!83 = !DILocalVariable(name: "myUnion", scope: !80, file: !16, line: 58, type: !22)
!84 = !DILocation(line: 58, column: 77, scope: !80)
!85 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !16, line: 59, type: !4)
!86 = !DILocation(line: 59, column: 15, scope: !80)
!87 = !DILocation(line: 59, column: 39, scope: !80)
!88 = !DILocation(line: 59, column: 28, scope: !80)
!89 = !DILocation(line: 60, column: 12, scope: !80)
!90 = !DILocation(line: 60, column: 10, scope: !80)
!91 = !DILocation(line: 62, column: 13, scope: !80)
!92 = !DILocation(line: 62, column: 5, scope: !80)
!93 = !DILocation(line: 63, column: 5, scope: !80)
!94 = !DILocation(line: 63, column: 16, scope: !80)
!95 = !DILocation(line: 64, column: 26, scope: !80)
!96 = !DILocation(line: 64, column: 13, scope: !80)
!97 = !DILocation(line: 64, column: 24, scope: !80)
!98 = !DILocalVariable(name: "data", scope: !99, file: !16, line: 66, type: !4)
!99 = distinct !DILexicalBlock(scope: !80, file: !16, line: 65, column: 5)
!100 = !DILocation(line: 66, column: 19, scope: !99)
!101 = !DILocation(line: 66, column: 34, scope: !99)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !16, line: 68, type: !47)
!103 = distinct !DILexicalBlock(scope: !99, file: !16, line: 67, column: 9)
!104 = !DILocation(line: 68, column: 21, scope: !103)
!105 = !DILocation(line: 70, column: 20, scope: !103)
!106 = !DILocation(line: 70, column: 26, scope: !103)
!107 = !DILocation(line: 70, column: 13, scope: !103)
!108 = !DILocation(line: 71, column: 24, scope: !103)
!109 = !DILocation(line: 71, column: 13, scope: !103)
!110 = !DILocation(line: 74, column: 1, scope: !80)
