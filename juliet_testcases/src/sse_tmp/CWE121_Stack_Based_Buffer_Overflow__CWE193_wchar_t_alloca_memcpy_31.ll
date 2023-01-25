; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %6, i32** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %7 = load i32*, i32** %dataCopy, align 8, !dbg !39
  store i32* %7, i32** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31_bad.source to i8*), i64 44, i1 false), !dbg !45
  %9 = load i32*, i32** %data1, align 8, !dbg !46
  %10 = bitcast i32* %9 to i8*, !dbg !47
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !47
  %11 = bitcast i32* %arraydecay to i8*, !dbg !47
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !49
  %add = add i64 %call, 1, !dbg !50
  %mul = mul i64 %add, 4, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 %mul, i1 false), !dbg !47
  %12 = load i32*, i32** %data1, align 8, !dbg !52
  call void @printWLine(i32* %12), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
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
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 40, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = alloca i8, i64 44, align 16, !dbg !87
  %3 = bitcast i8* %2 to i32*, !dbg !88
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !86
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !89
  store i32* %4, i32** %data, align 8, !dbg !90
  %5 = load i32*, i32** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !93, metadata !DIExpression()), !dbg !95
  %6 = load i32*, i32** %data, align 8, !dbg !96
  store i32* %6, i32** %dataCopy, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !97, metadata !DIExpression()), !dbg !98
  %7 = load i32*, i32** %dataCopy, align 8, !dbg !99
  store i32* %7, i32** %data1, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !102
  %9 = load i32*, i32** %data1, align 8, !dbg !103
  %10 = bitcast i32* %9 to i8*, !dbg !104
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !104
  %11 = bitcast i32* %arraydecay to i8*, !dbg !104
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !105
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !106
  %add = add i64 %call, 1, !dbg !107
  %mul = mul i64 %add, 4, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 %mul, i1 false), !dbg !104
  %12 = load i32*, i32** %data1, align 8, !dbg !109
  call void @printWLine(i32* %12), !dbg !110
  ret void, !dbg !111
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
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 35, column: 12, scope: !15)
!30 = !DILocation(line: 35, column: 10, scope: !15)
!31 = !DILocation(line: 36, column: 5, scope: !15)
!32 = !DILocation(line: 36, column: 13, scope: !15)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !16, line: 38, type: !4)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!35 = !DILocation(line: 38, column: 19, scope: !34)
!36 = !DILocation(line: 38, column: 30, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !16, line: 39, type: !4)
!38 = !DILocation(line: 39, column: 19, scope: !34)
!39 = !DILocation(line: 39, column: 26, scope: !34)
!40 = !DILocalVariable(name: "source", scope: !41, file: !16, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !16, line: 40, column: 9)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 41, column: 21, scope: !41)
!46 = !DILocation(line: 44, column: 20, scope: !41)
!47 = !DILocation(line: 44, column: 13, scope: !41)
!48 = !DILocation(line: 44, column: 42, scope: !41)
!49 = !DILocation(line: 44, column: 35, scope: !41)
!50 = !DILocation(line: 44, column: 50, scope: !41)
!51 = !DILocation(line: 44, column: 55, scope: !41)
!52 = !DILocation(line: 45, column: 24, scope: !41)
!53 = !DILocation(line: 45, column: 13, scope: !41)
!54 = !DILocation(line: 48, column: 1, scope: !15)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_31_good", scope: !16, file: !16, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 79, column: 5, scope: !55)
!57 = !DILocation(line: 80, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 91, type: !59, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !16, line: 91, type: !7)
!65 = !DILocation(line: 91, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !16, line: 91, type: !61)
!67 = !DILocation(line: 91, column: 27, scope: !58)
!68 = !DILocation(line: 94, column: 22, scope: !58)
!69 = !DILocation(line: 94, column: 12, scope: !58)
!70 = !DILocation(line: 94, column: 5, scope: !58)
!71 = !DILocation(line: 96, column: 5, scope: !58)
!72 = !DILocation(line: 97, column: 5, scope: !58)
!73 = !DILocation(line: 98, column: 5, scope: !58)
!74 = !DILocation(line: 101, column: 5, scope: !58)
!75 = !DILocation(line: 102, column: 5, scope: !58)
!76 = !DILocation(line: 103, column: 5, scope: !58)
!77 = !DILocation(line: 105, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !16, line: 57, type: !4)
!80 = !DILocation(line: 57, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !16, line: 58, type: !4)
!82 = !DILocation(line: 58, column: 15, scope: !78)
!83 = !DILocation(line: 58, column: 42, scope: !78)
!84 = !DILocation(line: 58, column: 31, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !16, line: 59, type: !4)
!86 = !DILocation(line: 59, column: 15, scope: !78)
!87 = !DILocation(line: 59, column: 43, scope: !78)
!88 = !DILocation(line: 59, column: 32, scope: !78)
!89 = !DILocation(line: 62, column: 12, scope: !78)
!90 = !DILocation(line: 62, column: 10, scope: !78)
!91 = !DILocation(line: 63, column: 5, scope: !78)
!92 = !DILocation(line: 63, column: 13, scope: !78)
!93 = !DILocalVariable(name: "dataCopy", scope: !94, file: !16, line: 65, type: !4)
!94 = distinct !DILexicalBlock(scope: !78, file: !16, line: 64, column: 5)
!95 = !DILocation(line: 65, column: 19, scope: !94)
!96 = !DILocation(line: 65, column: 30, scope: !94)
!97 = !DILocalVariable(name: "data", scope: !94, file: !16, line: 66, type: !4)
!98 = !DILocation(line: 66, column: 19, scope: !94)
!99 = !DILocation(line: 66, column: 26, scope: !94)
!100 = !DILocalVariable(name: "source", scope: !101, file: !16, line: 68, type: !42)
!101 = distinct !DILexicalBlock(scope: !94, file: !16, line: 67, column: 9)
!102 = !DILocation(line: 68, column: 21, scope: !101)
!103 = !DILocation(line: 71, column: 20, scope: !101)
!104 = !DILocation(line: 71, column: 13, scope: !101)
!105 = !DILocation(line: 71, column: 42, scope: !101)
!106 = !DILocation(line: 71, column: 35, scope: !101)
!107 = !DILocation(line: 71, column: 50, scope: !101)
!108 = !DILocation(line: 71, column: 55, scope: !101)
!109 = !DILocation(line: 72, column: 24, scope: !101)
!110 = !DILocation(line: 72, column: 13, scope: !101)
!111 = !DILocation(line: 75, column: 1, scope: !78)
