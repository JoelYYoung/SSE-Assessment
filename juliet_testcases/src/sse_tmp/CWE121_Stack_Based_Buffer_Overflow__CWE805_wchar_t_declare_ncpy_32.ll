; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !39
  %1 = load i32*, i32** %0, align 8, !dbg !40
  store i32* %1, i32** %data1, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay, i32** %data1, align 8, !dbg !42
  %2 = load i32*, i32** %data1, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %3 = load i32*, i32** %data1, align 8, !dbg !45
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !46
  store i32* %3, i32** %4, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !48, metadata !DIExpression()), !dbg !50
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !51
  %6 = load i32*, i32** %5, align 8, !dbg !52
  store i32* %6, i32** %data2, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %call = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx4, align 4, !dbg !59
  %7 = load i32*, i32** %data2, align 8, !dbg !60
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %call6 = call i32* @wcsncpy(i32* %7, i32* %arraydecay5, i64 99) #4, !dbg !62
  %8 = load i32*, i32** %data2, align 8, !dbg !63
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !63
  store i32 0, i32* %arrayidx7, align 4, !dbg !64
  %9 = load i32*, i32** %data2, align 8, !dbg !65
  call void @printWLine(i32* %9), !dbg !66
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32_good() #0 !dbg !68 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32_bad(), !dbg !88
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !94, metadata !DIExpression()), !dbg !95
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !96, metadata !DIExpression()), !dbg !97
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !102, metadata !DIExpression()), !dbg !104
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !105
  %1 = load i32*, i32** %0, align 8, !dbg !106
  store i32* %1, i32** %data1, align 8, !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay, i32** %data1, align 8, !dbg !108
  %2 = load i32*, i32** %data1, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %3 = load i32*, i32** %data1, align 8, !dbg !111
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !112
  store i32* %3, i32** %4, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !114, metadata !DIExpression()), !dbg !116
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !117
  %6 = load i32*, i32** %5, align 8, !dbg !118
  store i32* %6, i32** %data2, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !122
  %call = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !123
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx4, align 4, !dbg !125
  %7 = load i32*, i32** %data2, align 8, !dbg !126
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call6 = call i32* @wcsncpy(i32* %7, i32* %arraydecay5, i64 99) #4, !dbg !128
  %8 = load i32*, i32** %data2, align 8, !dbg !129
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !129
  store i32 0, i32* %arrayidx7, align 4, !dbg !130
  %9 = load i32*, i32** %data2, align 8, !dbg !131
  call void @printWLine(i32* %9), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 28, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 29, column: 13, scope: !11)
!36 = !DILocalVariable(name: "data", scope: !37, file: !12, line: 31, type: !16)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!38 = !DILocation(line: 31, column: 19, scope: !37)
!39 = !DILocation(line: 31, column: 27, scope: !37)
!40 = !DILocation(line: 31, column: 26, scope: !37)
!41 = !DILocation(line: 34, column: 16, scope: !37)
!42 = !DILocation(line: 34, column: 14, scope: !37)
!43 = !DILocation(line: 35, column: 9, scope: !37)
!44 = !DILocation(line: 35, column: 17, scope: !37)
!45 = !DILocation(line: 36, column: 21, scope: !37)
!46 = !DILocation(line: 36, column: 10, scope: !37)
!47 = !DILocation(line: 36, column: 19, scope: !37)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 39, type: !16)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!50 = !DILocation(line: 39, column: 19, scope: !49)
!51 = !DILocation(line: 39, column: 27, scope: !49)
!52 = !DILocation(line: 39, column: 26, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !54, file: !12, line: 41, type: !32)
!54 = distinct !DILexicalBlock(scope: !49, file: !12, line: 40, column: 9)
!55 = !DILocation(line: 41, column: 21, scope: !54)
!56 = !DILocation(line: 42, column: 21, scope: !54)
!57 = !DILocation(line: 42, column: 13, scope: !54)
!58 = !DILocation(line: 43, column: 13, scope: !54)
!59 = !DILocation(line: 43, column: 27, scope: !54)
!60 = !DILocation(line: 45, column: 21, scope: !54)
!61 = !DILocation(line: 45, column: 27, scope: !54)
!62 = !DILocation(line: 45, column: 13, scope: !54)
!63 = !DILocation(line: 46, column: 13, scope: !54)
!64 = !DILocation(line: 46, column: 25, scope: !54)
!65 = !DILocation(line: 47, column: 24, scope: !54)
!66 = !DILocation(line: 47, column: 13, scope: !54)
!67 = !DILocation(line: 50, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_32_good", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 87, column: 5, scope: !68)
!70 = !DILocation(line: 88, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !72, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!19, !19, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 99, type: !19)
!78 = !DILocation(line: 99, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 99, type: !74)
!80 = !DILocation(line: 99, column: 27, scope: !71)
!81 = !DILocation(line: 102, column: 22, scope: !71)
!82 = !DILocation(line: 102, column: 12, scope: !71)
!83 = !DILocation(line: 102, column: 5, scope: !71)
!84 = !DILocation(line: 104, column: 5, scope: !71)
!85 = !DILocation(line: 105, column: 5, scope: !71)
!86 = !DILocation(line: 106, column: 5, scope: !71)
!87 = !DILocation(line: 109, column: 5, scope: !71)
!88 = !DILocation(line: 110, column: 5, scope: !71)
!89 = !DILocation(line: 111, column: 5, scope: !71)
!90 = !DILocation(line: 113, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 59, type: !16)
!93 = !DILocation(line: 59, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataPtr1", scope: !91, file: !12, line: 60, type: !22)
!95 = !DILocation(line: 60, column: 16, scope: !91)
!96 = !DILocalVariable(name: "dataPtr2", scope: !91, file: !12, line: 61, type: !22)
!97 = !DILocation(line: 61, column: 16, scope: !91)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 62, type: !27)
!99 = !DILocation(line: 62, column: 13, scope: !91)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 63, type: !32)
!101 = !DILocation(line: 63, column: 13, scope: !91)
!102 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 65, type: !16)
!103 = distinct !DILexicalBlock(scope: !91, file: !12, line: 64, column: 5)
!104 = !DILocation(line: 65, column: 19, scope: !103)
!105 = !DILocation(line: 65, column: 27, scope: !103)
!106 = !DILocation(line: 65, column: 26, scope: !103)
!107 = !DILocation(line: 67, column: 16, scope: !103)
!108 = !DILocation(line: 67, column: 14, scope: !103)
!109 = !DILocation(line: 68, column: 9, scope: !103)
!110 = !DILocation(line: 68, column: 17, scope: !103)
!111 = !DILocation(line: 69, column: 21, scope: !103)
!112 = !DILocation(line: 69, column: 10, scope: !103)
!113 = !DILocation(line: 69, column: 19, scope: !103)
!114 = !DILocalVariable(name: "data", scope: !115, file: !12, line: 72, type: !16)
!115 = distinct !DILexicalBlock(scope: !91, file: !12, line: 71, column: 5)
!116 = !DILocation(line: 72, column: 19, scope: !115)
!117 = !DILocation(line: 72, column: 27, scope: !115)
!118 = !DILocation(line: 72, column: 26, scope: !115)
!119 = !DILocalVariable(name: "source", scope: !120, file: !12, line: 74, type: !32)
!120 = distinct !DILexicalBlock(scope: !115, file: !12, line: 73, column: 9)
!121 = !DILocation(line: 74, column: 21, scope: !120)
!122 = !DILocation(line: 75, column: 21, scope: !120)
!123 = !DILocation(line: 75, column: 13, scope: !120)
!124 = !DILocation(line: 76, column: 13, scope: !120)
!125 = !DILocation(line: 76, column: 27, scope: !120)
!126 = !DILocation(line: 78, column: 21, scope: !120)
!127 = !DILocation(line: 78, column: 27, scope: !120)
!128 = !DILocation(line: 78, column: 13, scope: !120)
!129 = !DILocation(line: 79, column: 13, scope: !120)
!130 = !DILocation(line: 79, column: 25, scope: !120)
!131 = !DILocation(line: 80, column: 24, scope: !120)
!132 = !DILocation(line: 80, column: 13, scope: !120)
!133 = !DILocation(line: 83, column: 1, scope: !91)
