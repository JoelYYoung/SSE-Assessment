; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx3, align 4, !dbg !60
  %12 = load i32*, i32** %data2, align 8, !dbg !61
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !62
  %call5 = call i32* @wcsncpy(i32* %12, i32* %arraydecay4, i64 99) #4, !dbg !63
  %13 = load i32*, i32** %data2, align 8, !dbg !64
  %arrayidx6 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !64
  store i32 0, i32* %arrayidx6, align 4, !dbg !65
  %14 = load i32*, i32** %data2, align 8, !dbg !66
  call void @printWLine(i32* %14), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #4, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #4, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !95, metadata !DIExpression()), !dbg !96
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !97, metadata !DIExpression()), !dbg !98
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 200, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %2 = alloca i8, i64 400, align 16, !dbg !105
  %3 = bitcast i8* %2 to i32*, !dbg !106
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !107, metadata !DIExpression()), !dbg !109
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !110
  %5 = load i32*, i32** %4, align 8, !dbg !111
  store i32* %5, i32** %data1, align 8, !dbg !109
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !112
  store i32* %6, i32** %data1, align 8, !dbg !113
  %7 = load i32*, i32** %data1, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %8 = load i32*, i32** %data1, align 8, !dbg !116
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !117
  store i32* %8, i32** %9, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !119, metadata !DIExpression()), !dbg !121
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !122
  %11 = load i32*, i32** %10, align 8, !dbg !123
  store i32* %11, i32** %data2, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !128
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx3, align 4, !dbg !130
  %12 = load i32*, i32** %data2, align 8, !dbg !131
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call5 = call i32* @wcsncpy(i32* %12, i32* %arraydecay4, i64 99) #4, !dbg !133
  %13 = load i32*, i32** %data2, align 8, !dbg !134
  %arrayidx6 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !134
  store i32 0, i32* %arrayidx6, align 4, !dbg !135
  %14 = load i32*, i32** %data2, align 8, !dbg !136
  call void @printWLine(i32* %14), !dbg !137
  ret void, !dbg !138
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 42, scope: !15)
!29 = !DILocation(line: 28, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 29, type: !4)
!31 = !DILocation(line: 29, column: 15, scope: !15)
!32 = !DILocation(line: 29, column: 43, scope: !15)
!33 = !DILocation(line: 29, column: 32, scope: !15)
!34 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 31, type: !4)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!36 = !DILocation(line: 31, column: 19, scope: !35)
!37 = !DILocation(line: 31, column: 27, scope: !35)
!38 = !DILocation(line: 31, column: 26, scope: !35)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocation(line: 34, column: 14, scope: !35)
!41 = !DILocation(line: 35, column: 9, scope: !35)
!42 = !DILocation(line: 35, column: 17, scope: !35)
!43 = !DILocation(line: 36, column: 21, scope: !35)
!44 = !DILocation(line: 36, column: 10, scope: !35)
!45 = !DILocation(line: 36, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !16, line: 39, type: !4)
!47 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 19, scope: !47)
!49 = !DILocation(line: 39, column: 27, scope: !47)
!50 = !DILocation(line: 39, column: 26, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !16, line: 41, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !16, line: 40, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 41, column: 21, scope: !52)
!57 = !DILocation(line: 42, column: 21, scope: !52)
!58 = !DILocation(line: 42, column: 13, scope: !52)
!59 = !DILocation(line: 43, column: 13, scope: !52)
!60 = !DILocation(line: 43, column: 27, scope: !52)
!61 = !DILocation(line: 45, column: 21, scope: !52)
!62 = !DILocation(line: 45, column: 27, scope: !52)
!63 = !DILocation(line: 45, column: 13, scope: !52)
!64 = !DILocation(line: 46, column: 13, scope: !52)
!65 = !DILocation(line: 46, column: 25, scope: !52)
!66 = !DILocation(line: 47, column: 24, scope: !52)
!67 = !DILocation(line: 47, column: 13, scope: !52)
!68 = !DILocation(line: 50, column: 1, scope: !15)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_32_good", scope: !16, file: !16, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 87, column: 5, scope: !69)
!71 = !DILocation(line: 88, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 99, type: !73, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!7, !7, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !16, line: 99, type: !7)
!79 = !DILocation(line: 99, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !16, line: 99, type: !75)
!81 = !DILocation(line: 99, column: 27, scope: !72)
!82 = !DILocation(line: 102, column: 22, scope: !72)
!83 = !DILocation(line: 102, column: 12, scope: !72)
!84 = !DILocation(line: 102, column: 5, scope: !72)
!85 = !DILocation(line: 104, column: 5, scope: !72)
!86 = !DILocation(line: 105, column: 5, scope: !72)
!87 = !DILocation(line: 106, column: 5, scope: !72)
!88 = !DILocation(line: 109, column: 5, scope: !72)
!89 = !DILocation(line: 110, column: 5, scope: !72)
!90 = !DILocation(line: 111, column: 5, scope: !72)
!91 = !DILocation(line: 113, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !16, line: 59, type: !4)
!94 = !DILocation(line: 59, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataPtr1", scope: !92, file: !16, line: 60, type: !22)
!96 = !DILocation(line: 60, column: 16, scope: !92)
!97 = !DILocalVariable(name: "dataPtr2", scope: !92, file: !16, line: 61, type: !22)
!98 = !DILocation(line: 61, column: 16, scope: !92)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !16, line: 62, type: !4)
!100 = !DILocation(line: 62, column: 15, scope: !92)
!101 = !DILocation(line: 62, column: 42, scope: !92)
!102 = !DILocation(line: 62, column: 31, scope: !92)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !16, line: 63, type: !4)
!104 = !DILocation(line: 63, column: 15, scope: !92)
!105 = !DILocation(line: 63, column: 43, scope: !92)
!106 = !DILocation(line: 63, column: 32, scope: !92)
!107 = !DILocalVariable(name: "data", scope: !108, file: !16, line: 65, type: !4)
!108 = distinct !DILexicalBlock(scope: !92, file: !16, line: 64, column: 5)
!109 = !DILocation(line: 65, column: 19, scope: !108)
!110 = !DILocation(line: 65, column: 27, scope: !108)
!111 = !DILocation(line: 65, column: 26, scope: !108)
!112 = !DILocation(line: 67, column: 16, scope: !108)
!113 = !DILocation(line: 67, column: 14, scope: !108)
!114 = !DILocation(line: 68, column: 9, scope: !108)
!115 = !DILocation(line: 68, column: 17, scope: !108)
!116 = !DILocation(line: 69, column: 21, scope: !108)
!117 = !DILocation(line: 69, column: 10, scope: !108)
!118 = !DILocation(line: 69, column: 19, scope: !108)
!119 = !DILocalVariable(name: "data", scope: !120, file: !16, line: 72, type: !4)
!120 = distinct !DILexicalBlock(scope: !92, file: !16, line: 71, column: 5)
!121 = !DILocation(line: 72, column: 19, scope: !120)
!122 = !DILocation(line: 72, column: 27, scope: !120)
!123 = !DILocation(line: 72, column: 26, scope: !120)
!124 = !DILocalVariable(name: "source", scope: !125, file: !16, line: 74, type: !53)
!125 = distinct !DILexicalBlock(scope: !120, file: !16, line: 73, column: 9)
!126 = !DILocation(line: 74, column: 21, scope: !125)
!127 = !DILocation(line: 75, column: 21, scope: !125)
!128 = !DILocation(line: 75, column: 13, scope: !125)
!129 = !DILocation(line: 76, column: 13, scope: !125)
!130 = !DILocation(line: 76, column: 27, scope: !125)
!131 = !DILocation(line: 78, column: 21, scope: !125)
!132 = !DILocation(line: 78, column: 27, scope: !125)
!133 = !DILocation(line: 78, column: 13, scope: !125)
!134 = !DILocation(line: 79, column: 13, scope: !125)
!135 = !DILocation(line: 79, column: 25, scope: !125)
!136 = !DILocation(line: 80, column: 24, scope: !125)
!137 = !DILocation(line: 80, column: 13, scope: !125)
!138 = !DILocation(line: 83, column: 1, scope: !92)
