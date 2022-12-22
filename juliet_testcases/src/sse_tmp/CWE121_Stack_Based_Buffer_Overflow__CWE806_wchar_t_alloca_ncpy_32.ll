; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32_bad() #0 !dbg !15 {
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
  %13 = load i32*, i32** %data2, align 8, !dbg !57
  %call3 = call i64 @wcslen(i32* %13) #7, !dbg !58
  %call4 = call i32* @wcsncpy(i32* %arraydecay, i32* %12, i64 %call3) #6, !dbg !59
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !60
  store i32 0, i32* %arrayidx5, align 4, !dbg !61
  %14 = load i32*, i32** %data2, align 8, !dbg !62
  call void @printWLine(i32* %14), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !91, metadata !DIExpression()), !dbg !92
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 400, align 16, !dbg !97
  %1 = bitcast i8* %0 to i32*, !dbg !98
  store i32* %1, i32** %dataBuffer, align 8, !dbg !96
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %2, i32** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !101, metadata !DIExpression()), !dbg !103
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !104
  %4 = load i32*, i32** %3, align 8, !dbg !105
  store i32* %4, i32** %data1, align 8, !dbg !103
  %5 = load i32*, i32** %data1, align 8, !dbg !106
  %call = call i32* @wmemset(i32* %5, i32 65, i64 49) #6, !dbg !107
  %6 = load i32*, i32** %data1, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 49, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %7 = load i32*, i32** %data1, align 8, !dbg !110
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !111
  store i32* %7, i32** %8, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !113, metadata !DIExpression()), !dbg !115
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !116
  %10 = load i32*, i32** %9, align 8, !dbg !117
  store i32* %10, i32** %data2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !120
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !121
  %12 = load i32*, i32** %data2, align 8, !dbg !122
  %13 = load i32*, i32** %data2, align 8, !dbg !123
  %call3 = call i64 @wcslen(i32* %13) #7, !dbg !124
  %call4 = call i32* @wcsncpy(i32* %arraydecay, i32* %12, i64 %call3) #6, !dbg !125
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !126
  store i32 0, i32* %arrayidx5, align 4, !dbg !127
  %14 = load i32*, i32** %data2, align 8, !dbg !128
  call void @printWLine(i32* %14), !dbg !129
  ret void, !dbg !130
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32.c", directory: "/root/SSE-Assessment")
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
!55 = !DILocation(line: 42, column: 21, scope: !50)
!56 = !DILocation(line: 42, column: 27, scope: !50)
!57 = !DILocation(line: 42, column: 40, scope: !50)
!58 = !DILocation(line: 42, column: 33, scope: !50)
!59 = !DILocation(line: 42, column: 13, scope: !50)
!60 = !DILocation(line: 43, column: 13, scope: !50)
!61 = !DILocation(line: 43, column: 24, scope: !50)
!62 = !DILocation(line: 44, column: 24, scope: !50)
!63 = !DILocation(line: 44, column: 13, scope: !50)
!64 = !DILocation(line: 47, column: 1, scope: !15)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_32_good", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 82, column: 5, scope: !65)
!67 = !DILocation(line: 83, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 94, type: !69, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !16, line: 94, type: !7)
!75 = !DILocation(line: 94, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !16, line: 94, type: !71)
!77 = !DILocation(line: 94, column: 27, scope: !68)
!78 = !DILocation(line: 97, column: 22, scope: !68)
!79 = !DILocation(line: 97, column: 12, scope: !68)
!80 = !DILocation(line: 97, column: 5, scope: !68)
!81 = !DILocation(line: 99, column: 5, scope: !68)
!82 = !DILocation(line: 100, column: 5, scope: !68)
!83 = !DILocation(line: 101, column: 5, scope: !68)
!84 = !DILocation(line: 104, column: 5, scope: !68)
!85 = !DILocation(line: 105, column: 5, scope: !68)
!86 = !DILocation(line: 106, column: 5, scope: !68)
!87 = !DILocation(line: 108, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !16, line: 56, type: !4)
!90 = !DILocation(line: 56, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataPtr1", scope: !88, file: !16, line: 57, type: !22)
!92 = !DILocation(line: 57, column: 16, scope: !88)
!93 = !DILocalVariable(name: "dataPtr2", scope: !88, file: !16, line: 58, type: !22)
!94 = !DILocation(line: 58, column: 16, scope: !88)
!95 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !16, line: 59, type: !4)
!96 = !DILocation(line: 59, column: 15, scope: !88)
!97 = !DILocation(line: 59, column: 39, scope: !88)
!98 = !DILocation(line: 59, column: 28, scope: !88)
!99 = !DILocation(line: 60, column: 12, scope: !88)
!100 = !DILocation(line: 60, column: 10, scope: !88)
!101 = !DILocalVariable(name: "data", scope: !102, file: !16, line: 62, type: !4)
!102 = distinct !DILexicalBlock(scope: !88, file: !16, line: 61, column: 5)
!103 = !DILocation(line: 62, column: 19, scope: !102)
!104 = !DILocation(line: 62, column: 27, scope: !102)
!105 = !DILocation(line: 62, column: 26, scope: !102)
!106 = !DILocation(line: 64, column: 17, scope: !102)
!107 = !DILocation(line: 64, column: 9, scope: !102)
!108 = !DILocation(line: 65, column: 9, scope: !102)
!109 = !DILocation(line: 65, column: 20, scope: !102)
!110 = !DILocation(line: 66, column: 21, scope: !102)
!111 = !DILocation(line: 66, column: 10, scope: !102)
!112 = !DILocation(line: 66, column: 19, scope: !102)
!113 = !DILocalVariable(name: "data", scope: !114, file: !16, line: 69, type: !4)
!114 = distinct !DILexicalBlock(scope: !88, file: !16, line: 68, column: 5)
!115 = !DILocation(line: 69, column: 19, scope: !114)
!116 = !DILocation(line: 69, column: 27, scope: !114)
!117 = !DILocation(line: 69, column: 26, scope: !114)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !16, line: 71, type: !51)
!119 = distinct !DILexicalBlock(scope: !114, file: !16, line: 70, column: 9)
!120 = !DILocation(line: 71, column: 21, scope: !119)
!121 = !DILocation(line: 73, column: 21, scope: !119)
!122 = !DILocation(line: 73, column: 27, scope: !119)
!123 = !DILocation(line: 73, column: 40, scope: !119)
!124 = !DILocation(line: 73, column: 33, scope: !119)
!125 = !DILocation(line: 73, column: 13, scope: !119)
!126 = !DILocation(line: 74, column: 13, scope: !119)
!127 = !DILocation(line: 74, column: 24, scope: !119)
!128 = !DILocation(line: 75, column: 24, scope: !119)
!129 = !DILocation(line: 75, column: 13, scope: !119)
!130 = !DILocation(line: 78, column: 1, scope: !88)
