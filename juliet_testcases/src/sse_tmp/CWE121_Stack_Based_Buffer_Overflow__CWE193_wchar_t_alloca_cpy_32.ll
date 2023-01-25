; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 40, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 44, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %5 = load i32*, i32** %4, align 8, !dbg !38
  store i32* %5, i32** %data1, align 8, !dbg !36
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  store i32* %6, i32** %data1, align 8, !dbg !40
  %7 = load i32*, i32** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %8 = load i32*, i32** %data1, align 8, !dbg !43
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !44
  store i32* %8, i32** %9, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !49
  %11 = load i32*, i32** %10, align 8, !dbg !50
  store i32* %11, i32** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  %12 = bitcast [11 x i32]* %source to i8*, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %12, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32_bad.source to i8*), i64 44, i1 false), !dbg !56
  %13 = load i32*, i32** %data2, align 8, !dbg !57
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !58
  %call = call i32* @wcscpy(i32* %13, i32* %arraydecay) #5, !dbg !59
  %14 = load i32*, i32** %data2, align 8, !dbg !60
  call void @printWLine(i32* %14), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !89, metadata !DIExpression()), !dbg !90
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !91, metadata !DIExpression()), !dbg !92
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 40, align 16, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %2 = alloca i8, i64 44, align 16, !dbg !99
  %3 = bitcast i8* %2 to i32*, !dbg !100
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !101, metadata !DIExpression()), !dbg !103
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !104
  %5 = load i32*, i32** %4, align 8, !dbg !105
  store i32* %5, i32** %data1, align 8, !dbg !103
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !106
  store i32* %6, i32** %data1, align 8, !dbg !107
  %7 = load i32*, i32** %data1, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %8 = load i32*, i32** %data1, align 8, !dbg !110
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !111
  store i32* %8, i32** %9, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !113, metadata !DIExpression()), !dbg !115
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !116
  %11 = load i32*, i32** %10, align 8, !dbg !117
  store i32* %11, i32** %data2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %12 = bitcast [11 x i32]* %source to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %12, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !120
  %13 = load i32*, i32** %data2, align 8, !dbg !121
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !122
  %call = call i32* @wcscpy(i32* %13, i32* %arraydecay) #5, !dbg !123
  %14 = load i32*, i32** %data2, align 8, !dbg !124
  call void @printWLine(i32* %14), !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 31, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 31, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 32, type: !22)
!25 = !DILocation(line: 32, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 33, type: !4)
!27 = !DILocation(line: 33, column: 15, scope: !15)
!28 = !DILocation(line: 33, column: 42, scope: !15)
!29 = !DILocation(line: 33, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 34, type: !4)
!31 = !DILocation(line: 34, column: 15, scope: !15)
!32 = !DILocation(line: 34, column: 43, scope: !15)
!33 = !DILocation(line: 34, column: 32, scope: !15)
!34 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 36, type: !4)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!36 = !DILocation(line: 36, column: 19, scope: !35)
!37 = !DILocation(line: 36, column: 27, scope: !35)
!38 = !DILocation(line: 36, column: 26, scope: !35)
!39 = !DILocation(line: 39, column: 16, scope: !35)
!40 = !DILocation(line: 39, column: 14, scope: !35)
!41 = !DILocation(line: 40, column: 9, scope: !35)
!42 = !DILocation(line: 40, column: 17, scope: !35)
!43 = !DILocation(line: 41, column: 21, scope: !35)
!44 = !DILocation(line: 41, column: 10, scope: !35)
!45 = !DILocation(line: 41, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !16, line: 44, type: !4)
!47 = distinct !DILexicalBlock(scope: !15, file: !16, line: 43, column: 5)
!48 = !DILocation(line: 44, column: 19, scope: !47)
!49 = !DILocation(line: 44, column: 27, scope: !47)
!50 = !DILocation(line: 44, column: 26, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !16, line: 46, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !16, line: 45, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 11)
!56 = !DILocation(line: 46, column: 21, scope: !52)
!57 = !DILocation(line: 48, column: 20, scope: !52)
!58 = !DILocation(line: 48, column: 26, scope: !52)
!59 = !DILocation(line: 48, column: 13, scope: !52)
!60 = !DILocation(line: 49, column: 24, scope: !52)
!61 = !DILocation(line: 49, column: 13, scope: !52)
!62 = !DILocation(line: 52, column: 1, scope: !15)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_32_good", scope: !16, file: !16, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 87, column: 5, scope: !63)
!65 = !DILocation(line: 88, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 99, type: !67, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !16, line: 99, type: !7)
!73 = !DILocation(line: 99, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !16, line: 99, type: !69)
!75 = !DILocation(line: 99, column: 27, scope: !66)
!76 = !DILocation(line: 102, column: 22, scope: !66)
!77 = !DILocation(line: 102, column: 12, scope: !66)
!78 = !DILocation(line: 102, column: 5, scope: !66)
!79 = !DILocation(line: 104, column: 5, scope: !66)
!80 = !DILocation(line: 105, column: 5, scope: !66)
!81 = !DILocation(line: 106, column: 5, scope: !66)
!82 = !DILocation(line: 109, column: 5, scope: !66)
!83 = !DILocation(line: 110, column: 5, scope: !66)
!84 = !DILocation(line: 111, column: 5, scope: !66)
!85 = !DILocation(line: 113, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !16, line: 61, type: !4)
!88 = !DILocation(line: 61, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataPtr1", scope: !86, file: !16, line: 62, type: !22)
!90 = !DILocation(line: 62, column: 16, scope: !86)
!91 = !DILocalVariable(name: "dataPtr2", scope: !86, file: !16, line: 63, type: !22)
!92 = !DILocation(line: 63, column: 16, scope: !86)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !16, line: 64, type: !4)
!94 = !DILocation(line: 64, column: 15, scope: !86)
!95 = !DILocation(line: 64, column: 42, scope: !86)
!96 = !DILocation(line: 64, column: 31, scope: !86)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !16, line: 65, type: !4)
!98 = !DILocation(line: 65, column: 15, scope: !86)
!99 = !DILocation(line: 65, column: 43, scope: !86)
!100 = !DILocation(line: 65, column: 32, scope: !86)
!101 = !DILocalVariable(name: "data", scope: !102, file: !16, line: 67, type: !4)
!102 = distinct !DILexicalBlock(scope: !86, file: !16, line: 66, column: 5)
!103 = !DILocation(line: 67, column: 19, scope: !102)
!104 = !DILocation(line: 67, column: 27, scope: !102)
!105 = !DILocation(line: 67, column: 26, scope: !102)
!106 = !DILocation(line: 70, column: 16, scope: !102)
!107 = !DILocation(line: 70, column: 14, scope: !102)
!108 = !DILocation(line: 71, column: 9, scope: !102)
!109 = !DILocation(line: 71, column: 17, scope: !102)
!110 = !DILocation(line: 72, column: 21, scope: !102)
!111 = !DILocation(line: 72, column: 10, scope: !102)
!112 = !DILocation(line: 72, column: 19, scope: !102)
!113 = !DILocalVariable(name: "data", scope: !114, file: !16, line: 75, type: !4)
!114 = distinct !DILexicalBlock(scope: !86, file: !16, line: 74, column: 5)
!115 = !DILocation(line: 75, column: 19, scope: !114)
!116 = !DILocation(line: 75, column: 27, scope: !114)
!117 = !DILocation(line: 75, column: 26, scope: !114)
!118 = !DILocalVariable(name: "source", scope: !119, file: !16, line: 77, type: !53)
!119 = distinct !DILexicalBlock(scope: !114, file: !16, line: 76, column: 9)
!120 = !DILocation(line: 77, column: 21, scope: !119)
!121 = !DILocation(line: 79, column: 20, scope: !119)
!122 = !DILocation(line: 79, column: 26, scope: !119)
!123 = !DILocation(line: 79, column: 13, scope: !119)
!124 = !DILocation(line: 80, column: 24, scope: !119)
!125 = !DILocation(line: 80, column: 13, scope: !119)
!126 = !DILocation(line: 83, column: 1, scope: !86)
