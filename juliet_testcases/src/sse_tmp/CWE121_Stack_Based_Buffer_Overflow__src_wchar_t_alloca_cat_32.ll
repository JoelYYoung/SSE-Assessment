; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32_bad() #0 !dbg !15 {
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
  %call = call i32* @wmemset(i32* %5, i32 65, i64 99) #5, !dbg !38
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
  %call3 = call i32* @wcscat(i32* %arraydecay, i32* %12) #5, !dbg !57
  %13 = load i32*, i32** %data2, align 8, !dbg !58
  call void @printWLine(i32* %13), !dbg !59
  ret void, !dbg !60
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32_good() #0 !dbg !61 {
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
  %call = call i64 @time(i64* null) #5, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #5, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !87, metadata !DIExpression()), !dbg !88
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !89, metadata !DIExpression()), !dbg !90
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 400, align 16, !dbg !93
  %1 = bitcast i8* %0 to i32*, !dbg !94
  store i32* %1, i32** %dataBuffer, align 8, !dbg !92
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  store i32* %2, i32** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !100
  %4 = load i32*, i32** %3, align 8, !dbg !101
  store i32* %4, i32** %data1, align 8, !dbg !99
  %5 = load i32*, i32** %data1, align 8, !dbg !102
  %call = call i32* @wmemset(i32* %5, i32 65, i64 49) #5, !dbg !103
  %6 = load i32*, i32** %data1, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 49, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %7 = load i32*, i32** %data1, align 8, !dbg !106
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !107
  store i32* %7, i32** %8, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !109, metadata !DIExpression()), !dbg !111
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !112
  %10 = load i32*, i32** %9, align 8, !dbg !113
  store i32* %10, i32** %data2, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !116
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !117
  %12 = load i32*, i32** %data2, align 8, !dbg !118
  %call3 = call i32* @wcscat(i32* %arraydecay, i32* %12) #5, !dbg !119
  %13 = load i32*, i32** %data2, align 8, !dbg !120
  call void @printWLine(i32* %13), !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32.c", directory: "/root/SSE-Assessment")
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
!30 = !DILocation(line: 29, column: 12, scope: !15)
!31 = !DILocation(line: 29, column: 10, scope: !15)
!32 = !DILocalVariable(name: "data", scope: !33, file: !16, line: 31, type: !4)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!34 = !DILocation(line: 31, column: 19, scope: !33)
!35 = !DILocation(line: 31, column: 27, scope: !33)
!36 = !DILocation(line: 31, column: 26, scope: !33)
!37 = !DILocation(line: 33, column: 17, scope: !33)
!38 = !DILocation(line: 33, column: 9, scope: !33)
!39 = !DILocation(line: 34, column: 9, scope: !33)
!40 = !DILocation(line: 34, column: 21, scope: !33)
!41 = !DILocation(line: 35, column: 21, scope: !33)
!42 = !DILocation(line: 35, column: 10, scope: !33)
!43 = !DILocation(line: 35, column: 19, scope: !33)
!44 = !DILocalVariable(name: "data", scope: !45, file: !16, line: 38, type: !4)
!45 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!46 = !DILocation(line: 38, column: 19, scope: !45)
!47 = !DILocation(line: 38, column: 27, scope: !45)
!48 = !DILocation(line: 38, column: 26, scope: !45)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !16, line: 40, type: !51)
!50 = distinct !DILexicalBlock(scope: !45, file: !16, line: 39, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 40, column: 21, scope: !50)
!55 = !DILocation(line: 42, column: 20, scope: !50)
!56 = !DILocation(line: 42, column: 26, scope: !50)
!57 = !DILocation(line: 42, column: 13, scope: !50)
!58 = !DILocation(line: 43, column: 24, scope: !50)
!59 = !DILocation(line: 43, column: 13, scope: !50)
!60 = !DILocation(line: 46, column: 1, scope: !15)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_32_good", scope: !16, file: !16, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 80, column: 5, scope: !61)
!63 = !DILocation(line: 81, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 92, type: !65, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !16, line: 92, type: !7)
!71 = !DILocation(line: 92, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !16, line: 92, type: !67)
!73 = !DILocation(line: 92, column: 27, scope: !64)
!74 = !DILocation(line: 95, column: 22, scope: !64)
!75 = !DILocation(line: 95, column: 12, scope: !64)
!76 = !DILocation(line: 95, column: 5, scope: !64)
!77 = !DILocation(line: 97, column: 5, scope: !64)
!78 = !DILocation(line: 98, column: 5, scope: !64)
!79 = !DILocation(line: 99, column: 5, scope: !64)
!80 = !DILocation(line: 102, column: 5, scope: !64)
!81 = !DILocation(line: 103, column: 5, scope: !64)
!82 = !DILocation(line: 104, column: 5, scope: !64)
!83 = !DILocation(line: 106, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !16, line: 55, type: !4)
!86 = !DILocation(line: 55, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataPtr1", scope: !84, file: !16, line: 56, type: !22)
!88 = !DILocation(line: 56, column: 16, scope: !84)
!89 = !DILocalVariable(name: "dataPtr2", scope: !84, file: !16, line: 57, type: !22)
!90 = !DILocation(line: 57, column: 16, scope: !84)
!91 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !16, line: 58, type: !4)
!92 = !DILocation(line: 58, column: 15, scope: !84)
!93 = !DILocation(line: 58, column: 39, scope: !84)
!94 = !DILocation(line: 58, column: 28, scope: !84)
!95 = !DILocation(line: 59, column: 12, scope: !84)
!96 = !DILocation(line: 59, column: 10, scope: !84)
!97 = !DILocalVariable(name: "data", scope: !98, file: !16, line: 61, type: !4)
!98 = distinct !DILexicalBlock(scope: !84, file: !16, line: 60, column: 5)
!99 = !DILocation(line: 61, column: 19, scope: !98)
!100 = !DILocation(line: 61, column: 27, scope: !98)
!101 = !DILocation(line: 61, column: 26, scope: !98)
!102 = !DILocation(line: 63, column: 17, scope: !98)
!103 = !DILocation(line: 63, column: 9, scope: !98)
!104 = !DILocation(line: 64, column: 9, scope: !98)
!105 = !DILocation(line: 64, column: 20, scope: !98)
!106 = !DILocation(line: 65, column: 21, scope: !98)
!107 = !DILocation(line: 65, column: 10, scope: !98)
!108 = !DILocation(line: 65, column: 19, scope: !98)
!109 = !DILocalVariable(name: "data", scope: !110, file: !16, line: 68, type: !4)
!110 = distinct !DILexicalBlock(scope: !84, file: !16, line: 67, column: 5)
!111 = !DILocation(line: 68, column: 19, scope: !110)
!112 = !DILocation(line: 68, column: 27, scope: !110)
!113 = !DILocation(line: 68, column: 26, scope: !110)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !16, line: 70, type: !51)
!115 = distinct !DILexicalBlock(scope: !110, file: !16, line: 69, column: 9)
!116 = !DILocation(line: 70, column: 21, scope: !115)
!117 = !DILocation(line: 72, column: 20, scope: !115)
!118 = !DILocation(line: 72, column: 26, scope: !115)
!119 = !DILocation(line: 72, column: 13, scope: !115)
!120 = !DILocation(line: 73, column: 24, scope: !115)
!121 = !DILocation(line: 73, column: 13, scope: !115)
!122 = !DILocation(line: 76, column: 1, scope: !84)
