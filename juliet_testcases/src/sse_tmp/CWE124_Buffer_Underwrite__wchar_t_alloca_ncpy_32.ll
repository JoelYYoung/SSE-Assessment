; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
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
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %5 = load i32*, i32** %4, align 8, !dbg !38
  store i32* %5, i32** %data1, align 8, !dbg !36
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i32, i32* %6, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data1, align 8, !dbg !41
  %7 = load i32*, i32** %data1, align 8, !dbg !42
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !43
  store i32* %7, i32** %8, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !48
  %10 = load i32*, i32** %9, align 8, !dbg !49
  store i32* %10, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx4, align 4, !dbg !59
  %11 = load i32*, i32** %data2, align 8, !dbg !60
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %call6 = call i32* @wcsncpy(i32* %11, i32* %arraydecay5, i64 99) #4, !dbg !62
  %12 = load i32*, i32** %data2, align 8, !dbg !63
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !63
  store i32 0, i32* %arrayidx7, align 4, !dbg !64
  %13 = load i32*, i32** %data2, align 8, !dbg !65
  call void @printWLine(i32* %13), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #4, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #4, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !94, metadata !DIExpression()), !dbg !95
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !96, metadata !DIExpression()), !dbg !97
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 400, align 16, !dbg !100
  %1 = bitcast i8* %0 to i32*, !dbg !101
  store i32* %1, i32** %dataBuffer, align 8, !dbg !99
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !103
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !106, metadata !DIExpression()), !dbg !108
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !109
  %5 = load i32*, i32** %4, align 8, !dbg !110
  store i32* %5, i32** %data1, align 8, !dbg !108
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %6, i32** %data1, align 8, !dbg !112
  %7 = load i32*, i32** %data1, align 8, !dbg !113
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !114
  store i32* %7, i32** %8, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !116, metadata !DIExpression()), !dbg !118
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !119
  %10 = load i32*, i32** %9, align 8, !dbg !120
  store i32* %10, i32** %data2, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !124
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !125
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx4, align 4, !dbg !127
  %11 = load i32*, i32** %data2, align 8, !dbg !128
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !129
  %call6 = call i32* @wcsncpy(i32* %11, i32* %arraydecay5, i64 99) #4, !dbg !130
  %12 = load i32*, i32** %data2, align 8, !dbg !131
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !131
  store i32 0, i32* %arrayidx7, align 4, !dbg !132
  %13 = load i32*, i32** %data2, align 8, !dbg !133
  call void @printWLine(i32* %13), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 39, scope: !15)
!29 = !DILocation(line: 28, column: 28, scope: !15)
!30 = !DILocation(line: 29, column: 13, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 30, column: 5, scope: !15)
!33 = !DILocation(line: 30, column: 23, scope: !15)
!34 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 32, type: !4)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 19, scope: !35)
!37 = !DILocation(line: 32, column: 27, scope: !35)
!38 = !DILocation(line: 32, column: 26, scope: !35)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocation(line: 34, column: 27, scope: !35)
!41 = !DILocation(line: 34, column: 14, scope: !35)
!42 = !DILocation(line: 35, column: 21, scope: !35)
!43 = !DILocation(line: 35, column: 10, scope: !35)
!44 = !DILocation(line: 35, column: 19, scope: !35)
!45 = !DILocalVariable(name: "data", scope: !46, file: !16, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 19, scope: !46)
!48 = !DILocation(line: 38, column: 27, scope: !46)
!49 = !DILocation(line: 38, column: 26, scope: !46)
!50 = !DILocalVariable(name: "source", scope: !51, file: !16, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !16, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 40, column: 21, scope: !51)
!56 = !DILocation(line: 41, column: 21, scope: !51)
!57 = !DILocation(line: 41, column: 13, scope: !51)
!58 = !DILocation(line: 42, column: 13, scope: !51)
!59 = !DILocation(line: 42, column: 27, scope: !51)
!60 = !DILocation(line: 44, column: 21, scope: !51)
!61 = !DILocation(line: 44, column: 27, scope: !51)
!62 = !DILocation(line: 44, column: 13, scope: !51)
!63 = !DILocation(line: 46, column: 13, scope: !51)
!64 = !DILocation(line: 46, column: 25, scope: !51)
!65 = !DILocation(line: 47, column: 24, scope: !51)
!66 = !DILocation(line: 47, column: 13, scope: !51)
!67 = !DILocation(line: 50, column: 1, scope: !15)
!68 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_32_good", scope: !16, file: !16, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 88, column: 5, scope: !68)
!70 = !DILocation(line: 89, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 100, type: !72, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!7, !7, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !16, line: 100, type: !7)
!78 = !DILocation(line: 100, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !16, line: 100, type: !74)
!80 = !DILocation(line: 100, column: 27, scope: !71)
!81 = !DILocation(line: 103, column: 22, scope: !71)
!82 = !DILocation(line: 103, column: 12, scope: !71)
!83 = !DILocation(line: 103, column: 5, scope: !71)
!84 = !DILocation(line: 105, column: 5, scope: !71)
!85 = !DILocation(line: 106, column: 5, scope: !71)
!86 = !DILocation(line: 107, column: 5, scope: !71)
!87 = !DILocation(line: 110, column: 5, scope: !71)
!88 = !DILocation(line: 111, column: 5, scope: !71)
!89 = !DILocation(line: 112, column: 5, scope: !71)
!90 = !DILocation(line: 114, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !16, line: 59, type: !4)
!93 = !DILocation(line: 59, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataPtr1", scope: !91, file: !16, line: 60, type: !22)
!95 = !DILocation(line: 60, column: 16, scope: !91)
!96 = !DILocalVariable(name: "dataPtr2", scope: !91, file: !16, line: 61, type: !22)
!97 = !DILocation(line: 61, column: 16, scope: !91)
!98 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !16, line: 62, type: !4)
!99 = !DILocation(line: 62, column: 15, scope: !91)
!100 = !DILocation(line: 62, column: 39, scope: !91)
!101 = !DILocation(line: 62, column: 28, scope: !91)
!102 = !DILocation(line: 63, column: 13, scope: !91)
!103 = !DILocation(line: 63, column: 5, scope: !91)
!104 = !DILocation(line: 64, column: 5, scope: !91)
!105 = !DILocation(line: 64, column: 23, scope: !91)
!106 = !DILocalVariable(name: "data", scope: !107, file: !16, line: 66, type: !4)
!107 = distinct !DILexicalBlock(scope: !91, file: !16, line: 65, column: 5)
!108 = !DILocation(line: 66, column: 19, scope: !107)
!109 = !DILocation(line: 66, column: 27, scope: !107)
!110 = !DILocation(line: 66, column: 26, scope: !107)
!111 = !DILocation(line: 68, column: 16, scope: !107)
!112 = !DILocation(line: 68, column: 14, scope: !107)
!113 = !DILocation(line: 69, column: 21, scope: !107)
!114 = !DILocation(line: 69, column: 10, scope: !107)
!115 = !DILocation(line: 69, column: 19, scope: !107)
!116 = !DILocalVariable(name: "data", scope: !117, file: !16, line: 72, type: !4)
!117 = distinct !DILexicalBlock(scope: !91, file: !16, line: 71, column: 5)
!118 = !DILocation(line: 72, column: 19, scope: !117)
!119 = !DILocation(line: 72, column: 27, scope: !117)
!120 = !DILocation(line: 72, column: 26, scope: !117)
!121 = !DILocalVariable(name: "source", scope: !122, file: !16, line: 74, type: !52)
!122 = distinct !DILexicalBlock(scope: !117, file: !16, line: 73, column: 9)
!123 = !DILocation(line: 74, column: 21, scope: !122)
!124 = !DILocation(line: 75, column: 21, scope: !122)
!125 = !DILocation(line: 75, column: 13, scope: !122)
!126 = !DILocation(line: 76, column: 13, scope: !122)
!127 = !DILocation(line: 76, column: 27, scope: !122)
!128 = !DILocation(line: 78, column: 21, scope: !122)
!129 = !DILocation(line: 78, column: 27, scope: !122)
!130 = !DILocation(line: 78, column: 13, scope: !122)
!131 = !DILocation(line: 80, column: 13, scope: !122)
!132 = !DILocation(line: 80, column: 25, scope: !122)
!133 = !DILocation(line: 81, column: 24, scope: !122)
!134 = !DILocation(line: 81, column: 13, scope: !122)
!135 = !DILocation(line: 84, column: 1, scope: !91)
