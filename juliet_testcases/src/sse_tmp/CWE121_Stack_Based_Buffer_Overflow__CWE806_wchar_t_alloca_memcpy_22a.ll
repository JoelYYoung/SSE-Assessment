; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !12
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !15
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %2, i32** %data, align 8, !dbg !33
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_badGlobal, align 4, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_badSource(i32* %3), !dbg !36
  store i32* %call, i32** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = bitcast i32* %arraydecay to i8*, !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %7 = bitcast i32* %6 to i8*, !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !46
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !47
  %mul = mul i64 %call1, 4, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !44
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  %9 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %9), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #8, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #8, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 400, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBuffer, align 8, !dbg !82
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  store i32* %2, i32** %data, align 8, !dbg !86
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B1Global, align 4, !dbg !87
  %3 = load i32*, i32** %data, align 8, !dbg !88
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B1Source(i32* %3), !dbg !89
  store i32* %call, i32** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !93
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !94
  %5 = bitcast i32* %arraydecay to i8*, !dbg !94
  %6 = load i32*, i32** %data, align 8, !dbg !95
  %7 = bitcast i32* %6 to i8*, !dbg !94
  %8 = load i32*, i32** %data, align 8, !dbg !96
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !97
  %mul = mul i64 %call1, 4, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !94
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %9 = load i32*, i32** %data, align 8, !dbg !101
  call void @printWLine(i32* %9), !dbg !102
  ret void, !dbg !103
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBuffer, align 8, !dbg !108
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %2, i32** %data, align 8, !dbg !112
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B2Global, align 4, !dbg !113
  %3 = load i32*, i32** %data, align 8, !dbg !114
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B2Source(i32* %3), !dbg !115
  store i32* %call, i32** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !120
  %5 = bitcast i32* %arraydecay to i8*, !dbg !120
  %6 = load i32*, i32** %data, align 8, !dbg !121
  %7 = bitcast i32* %6 to i8*, !dbg !120
  %8 = load i32*, i32** %data, align 8, !dbg !122
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !123
  %mul = mul i64 %call1, 4, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !120
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %9 = load i32*, i32** %data, align 8, !dbg !127
  call void @printWLine(i32* %9), !dbg !128
  ret void, !dbg !129
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_badGlobal", scope: !2, file: !14, line: 24, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B1Global", scope: !2, file: !14, line: 49, type: !9, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_goodG2B2Global", scope: !2, file: !14, line: 50, type: !9, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_bad", scope: !14, file: !14, line: 28, type: !24, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 30, type: !6)
!27 = !DILocation(line: 30, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !14, line: 31, type: !6)
!29 = !DILocation(line: 31, column: 15, scope: !23)
!30 = !DILocation(line: 31, column: 39, scope: !23)
!31 = !DILocation(line: 31, column: 28, scope: !23)
!32 = !DILocation(line: 32, column: 12, scope: !23)
!33 = !DILocation(line: 32, column: 10, scope: !23)
!34 = !DILocation(line: 33, column: 83, scope: !23)
!35 = !DILocation(line: 34, column: 90, scope: !23)
!36 = !DILocation(line: 34, column: 12, scope: !23)
!37 = !DILocation(line: 34, column: 10, scope: !23)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !23, file: !14, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 36, column: 17, scope: !39)
!44 = !DILocation(line: 38, column: 9, scope: !39)
!45 = !DILocation(line: 38, column: 22, scope: !39)
!46 = !DILocation(line: 38, column: 35, scope: !39)
!47 = !DILocation(line: 38, column: 28, scope: !39)
!48 = !DILocation(line: 38, column: 40, scope: !39)
!49 = !DILocation(line: 39, column: 9, scope: !39)
!50 = !DILocation(line: 39, column: 20, scope: !39)
!51 = !DILocation(line: 40, column: 20, scope: !39)
!52 = !DILocation(line: 40, column: 9, scope: !39)
!53 = !DILocation(line: 42, column: 1, scope: !23)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_22_good", scope: !14, file: !14, line: 90, type: !24, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 92, column: 5, scope: !54)
!56 = !DILocation(line: 93, column: 5, scope: !54)
!57 = !DILocation(line: 94, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !59, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!9, !9, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 106, type: !9)
!65 = !DILocation(line: 106, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 106, type: !61)
!67 = !DILocation(line: 106, column: 27, scope: !58)
!68 = !DILocation(line: 109, column: 22, scope: !58)
!69 = !DILocation(line: 109, column: 12, scope: !58)
!70 = !DILocation(line: 109, column: 5, scope: !58)
!71 = !DILocation(line: 111, column: 5, scope: !58)
!72 = !DILocation(line: 112, column: 5, scope: !58)
!73 = !DILocation(line: 113, column: 5, scope: !58)
!74 = !DILocation(line: 116, column: 5, scope: !58)
!75 = !DILocation(line: 117, column: 5, scope: !58)
!76 = !DILocation(line: 118, column: 5, scope: !58)
!77 = !DILocation(line: 120, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 55, type: !24, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !14, line: 57, type: !6)
!80 = !DILocation(line: 57, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !14, line: 58, type: !6)
!82 = !DILocation(line: 58, column: 15, scope: !78)
!83 = !DILocation(line: 58, column: 39, scope: !78)
!84 = !DILocation(line: 58, column: 28, scope: !78)
!85 = !DILocation(line: 59, column: 12, scope: !78)
!86 = !DILocation(line: 59, column: 10, scope: !78)
!87 = !DILocation(line: 60, column: 88, scope: !78)
!88 = !DILocation(line: 61, column: 95, scope: !78)
!89 = !DILocation(line: 61, column: 12, scope: !78)
!90 = !DILocation(line: 61, column: 10, scope: !78)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !14, line: 63, type: !40)
!92 = distinct !DILexicalBlock(scope: !78, file: !14, line: 62, column: 5)
!93 = !DILocation(line: 63, column: 17, scope: !92)
!94 = !DILocation(line: 65, column: 9, scope: !92)
!95 = !DILocation(line: 65, column: 22, scope: !92)
!96 = !DILocation(line: 65, column: 35, scope: !92)
!97 = !DILocation(line: 65, column: 28, scope: !92)
!98 = !DILocation(line: 65, column: 40, scope: !92)
!99 = !DILocation(line: 66, column: 9, scope: !92)
!100 = !DILocation(line: 66, column: 20, scope: !92)
!101 = !DILocation(line: 67, column: 20, scope: !92)
!102 = !DILocation(line: 67, column: 9, scope: !92)
!103 = !DILocation(line: 69, column: 1, scope: !78)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 74, type: !24, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 76, type: !6)
!106 = !DILocation(line: 76, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !14, line: 77, type: !6)
!108 = !DILocation(line: 77, column: 15, scope: !104)
!109 = !DILocation(line: 77, column: 39, scope: !104)
!110 = !DILocation(line: 77, column: 28, scope: !104)
!111 = !DILocation(line: 78, column: 12, scope: !104)
!112 = !DILocation(line: 78, column: 10, scope: !104)
!113 = !DILocation(line: 79, column: 88, scope: !104)
!114 = !DILocation(line: 80, column: 95, scope: !104)
!115 = !DILocation(line: 80, column: 12, scope: !104)
!116 = !DILocation(line: 80, column: 10, scope: !104)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !14, line: 82, type: !40)
!118 = distinct !DILexicalBlock(scope: !104, file: !14, line: 81, column: 5)
!119 = !DILocation(line: 82, column: 17, scope: !118)
!120 = !DILocation(line: 84, column: 9, scope: !118)
!121 = !DILocation(line: 84, column: 22, scope: !118)
!122 = !DILocation(line: 84, column: 35, scope: !118)
!123 = !DILocation(line: 84, column: 28, scope: !118)
!124 = !DILocation(line: 84, column: 40, scope: !118)
!125 = !DILocation(line: 85, column: 9, scope: !118)
!126 = !DILocation(line: 85, column: 20, scope: !118)
!127 = !DILocation(line: 86, column: 20, scope: !118)
!128 = !DILocation(line: 86, column: 9, scope: !118)
!129 = !DILocation(line: 88, column: 1, scope: !104)
