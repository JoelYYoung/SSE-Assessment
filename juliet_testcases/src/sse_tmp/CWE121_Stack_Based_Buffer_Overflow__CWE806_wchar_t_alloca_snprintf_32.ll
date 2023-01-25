; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !35
  %4 = load i32*, i32** %3, align 8, !dbg !36
  store i32* %4, i32** %data1, align 8, !dbg !34
  %5 = load i32*, i32** %data1, align 8, !dbg !37
  %call = call i32* @wmemset(i32* %5, i32 65, i64 99) #6, !dbg !38
  %6 = load i32*, i32** %data1, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %7 = load i32*, i32** %data1, align 8, !dbg !41
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !42
  store i32* %7, i32** %8, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !44, metadata !DIExpression()), !dbg !46
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !47
  %10 = load i32*, i32** %9, align 8, !dbg !48
  store i32* %10, i32** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !54
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !55
  %12 = load i32*, i32** %data2, align 8, !dbg !56
  %call3 = call i64 @wcslen(i32* %12) #7, !dbg !57
  %13 = load i32*, i32** %data2, align 8, !dbg !58
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %13) #6, !dbg !59
  %14 = load i32*, i32** %data2, align 8, !dbg !60
  call void @printWLine(i32* %14), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32_good() #0 !dbg !63 {
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
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !89, metadata !DIExpression()), !dbg !90
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !91, metadata !DIExpression()), !dbg !92
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 400, align 16, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  store i32* %1, i32** %dataBuffer, align 8, !dbg !94
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  store i32* %2, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !99, metadata !DIExpression()), !dbg !101
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !102
  %4 = load i32*, i32** %3, align 8, !dbg !103
  store i32* %4, i32** %data1, align 8, !dbg !101
  %5 = load i32*, i32** %data1, align 8, !dbg !104
  %call = call i32* @wmemset(i32* %5, i32 65, i64 49) #6, !dbg !105
  %6 = load i32*, i32** %data1, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %7 = load i32*, i32** %data1, align 8, !dbg !108
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !109
  store i32* %7, i32** %8, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !111, metadata !DIExpression()), !dbg !113
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !114
  %10 = load i32*, i32** %9, align 8, !dbg !115
  store i32* %10, i32** %data2, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !118
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !119
  %12 = load i32*, i32** %data2, align 8, !dbg !120
  %call3 = call i64 @wcslen(i32* %12) #7, !dbg !121
  %13 = load i32*, i32** %data2, align 8, !dbg !122
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %13) #6, !dbg !123
  %14 = load i32*, i32** %data2, align 8, !dbg !124
  call void @printWLine(i32* %14), !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 32, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 33, type: !22)
!25 = !DILocation(line: 33, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 34, type: !4)
!27 = !DILocation(line: 34, column: 15, scope: !15)
!28 = !DILocation(line: 34, column: 39, scope: !15)
!29 = !DILocation(line: 34, column: 28, scope: !15)
!30 = !DILocation(line: 35, column: 12, scope: !15)
!31 = !DILocation(line: 35, column: 10, scope: !15)
!32 = !DILocalVariable(name: "data", scope: !33, file: !16, line: 37, type: !4)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 36, column: 5)
!34 = !DILocation(line: 37, column: 19, scope: !33)
!35 = !DILocation(line: 37, column: 27, scope: !33)
!36 = !DILocation(line: 37, column: 26, scope: !33)
!37 = !DILocation(line: 39, column: 17, scope: !33)
!38 = !DILocation(line: 39, column: 9, scope: !33)
!39 = !DILocation(line: 40, column: 9, scope: !33)
!40 = !DILocation(line: 40, column: 21, scope: !33)
!41 = !DILocation(line: 41, column: 21, scope: !33)
!42 = !DILocation(line: 41, column: 10, scope: !33)
!43 = !DILocation(line: 41, column: 19, scope: !33)
!44 = !DILocalVariable(name: "data", scope: !45, file: !16, line: 44, type: !4)
!45 = distinct !DILexicalBlock(scope: !15, file: !16, line: 43, column: 5)
!46 = !DILocation(line: 44, column: 19, scope: !45)
!47 = !DILocation(line: 44, column: 27, scope: !45)
!48 = !DILocation(line: 44, column: 26, scope: !45)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !16, line: 46, type: !51)
!50 = distinct !DILexicalBlock(scope: !45, file: !16, line: 45, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 46, column: 21, scope: !50)
!55 = !DILocation(line: 48, column: 22, scope: !50)
!56 = !DILocation(line: 48, column: 35, scope: !50)
!57 = !DILocation(line: 48, column: 28, scope: !50)
!58 = !DILocation(line: 48, column: 49, scope: !50)
!59 = !DILocation(line: 48, column: 13, scope: !50)
!60 = !DILocation(line: 49, column: 24, scope: !50)
!61 = !DILocation(line: 49, column: 13, scope: !50)
!62 = !DILocation(line: 52, column: 1, scope: !15)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_32_good", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 86, column: 5, scope: !63)
!65 = !DILocation(line: 87, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 98, type: !67, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !16, line: 98, type: !7)
!73 = !DILocation(line: 98, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !16, line: 98, type: !69)
!75 = !DILocation(line: 98, column: 27, scope: !66)
!76 = !DILocation(line: 101, column: 22, scope: !66)
!77 = !DILocation(line: 101, column: 12, scope: !66)
!78 = !DILocation(line: 101, column: 5, scope: !66)
!79 = !DILocation(line: 103, column: 5, scope: !66)
!80 = !DILocation(line: 104, column: 5, scope: !66)
!81 = !DILocation(line: 105, column: 5, scope: !66)
!82 = !DILocation(line: 108, column: 5, scope: !66)
!83 = !DILocation(line: 109, column: 5, scope: !66)
!84 = !DILocation(line: 110, column: 5, scope: !66)
!85 = !DILocation(line: 112, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !16, line: 61, type: !4)
!88 = !DILocation(line: 61, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataPtr1", scope: !86, file: !16, line: 62, type: !22)
!90 = !DILocation(line: 62, column: 16, scope: !86)
!91 = !DILocalVariable(name: "dataPtr2", scope: !86, file: !16, line: 63, type: !22)
!92 = !DILocation(line: 63, column: 16, scope: !86)
!93 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !16, line: 64, type: !4)
!94 = !DILocation(line: 64, column: 15, scope: !86)
!95 = !DILocation(line: 64, column: 39, scope: !86)
!96 = !DILocation(line: 64, column: 28, scope: !86)
!97 = !DILocation(line: 65, column: 12, scope: !86)
!98 = !DILocation(line: 65, column: 10, scope: !86)
!99 = !DILocalVariable(name: "data", scope: !100, file: !16, line: 67, type: !4)
!100 = distinct !DILexicalBlock(scope: !86, file: !16, line: 66, column: 5)
!101 = !DILocation(line: 67, column: 19, scope: !100)
!102 = !DILocation(line: 67, column: 27, scope: !100)
!103 = !DILocation(line: 67, column: 26, scope: !100)
!104 = !DILocation(line: 69, column: 17, scope: !100)
!105 = !DILocation(line: 69, column: 9, scope: !100)
!106 = !DILocation(line: 70, column: 9, scope: !100)
!107 = !DILocation(line: 70, column: 20, scope: !100)
!108 = !DILocation(line: 71, column: 21, scope: !100)
!109 = !DILocation(line: 71, column: 10, scope: !100)
!110 = !DILocation(line: 71, column: 19, scope: !100)
!111 = !DILocalVariable(name: "data", scope: !112, file: !16, line: 74, type: !4)
!112 = distinct !DILexicalBlock(scope: !86, file: !16, line: 73, column: 5)
!113 = !DILocation(line: 74, column: 19, scope: !112)
!114 = !DILocation(line: 74, column: 27, scope: !112)
!115 = !DILocation(line: 74, column: 26, scope: !112)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !16, line: 76, type: !51)
!117 = distinct !DILexicalBlock(scope: !112, file: !16, line: 75, column: 9)
!118 = !DILocation(line: 76, column: 21, scope: !117)
!119 = !DILocation(line: 78, column: 22, scope: !117)
!120 = !DILocation(line: 78, column: 35, scope: !117)
!121 = !DILocation(line: 78, column: 28, scope: !117)
!122 = !DILocation(line: 78, column: 49, scope: !117)
!123 = !DILocation(line: 78, column: 13, scope: !117)
!124 = !DILocation(line: 79, column: 24, scope: !117)
!125 = !DILocation(line: 79, column: 13, scope: !117)
!126 = !DILocation(line: 82, column: 1, scope: !86)
