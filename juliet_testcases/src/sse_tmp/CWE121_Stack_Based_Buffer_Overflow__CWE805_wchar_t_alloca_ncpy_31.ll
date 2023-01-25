; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx2, align 4, !dbg !49
  %8 = load i32*, i32** %data1, align 8, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call4 = call i32* @wcsncpy(i32* %8, i32* %arraydecay3, i64 99) #4, !dbg !52
  %9 = load i32*, i32** %data1, align 8, !dbg !53
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !53
  store i32 0, i32* %arrayidx5, align 4, !dbg !54
  %10 = load i32*, i32** %data1, align 8, !dbg !55
  call void @printWLine(i32* %10), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #4, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #4, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 200, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 400, align 16, !dbg !90
  %3 = bitcast i8* %2 to i32*, !dbg !91
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !89
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !92
  store i32* %4, i32** %data, align 8, !dbg !93
  %5 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !96, metadata !DIExpression()), !dbg !98
  %6 = load i32*, i32** %data, align 8, !dbg !99
  store i32* %6, i32** %dataCopy, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !100, metadata !DIExpression()), !dbg !101
  %7 = load i32*, i32** %dataCopy, align 8, !dbg !102
  store i32* %7, i32** %data1, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !107
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx2, align 4, !dbg !109
  %8 = load i32*, i32** %data1, align 8, !dbg !110
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call4 = call i32* @wcsncpy(i32* %8, i32* %arraydecay3, i64 99) #4, !dbg !112
  %9 = load i32*, i32** %data1, align 8, !dbg !113
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !113
  store i32 0, i32* %arrayidx5, align 4, !dbg !114
  %10 = load i32*, i32** %data1, align 8, !dbg !115
  call void @printWLine(i32* %10), !dbg !116
  ret void, !dbg !117
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 30, column: 12, scope: !15)
!30 = !DILocation(line: 30, column: 10, scope: !15)
!31 = !DILocation(line: 31, column: 5, scope: !15)
!32 = !DILocation(line: 31, column: 13, scope: !15)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !16, line: 33, type: !4)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 5)
!35 = !DILocation(line: 33, column: 19, scope: !34)
!36 = !DILocation(line: 33, column: 30, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !16, line: 34, type: !4)
!38 = !DILocation(line: 34, column: 19, scope: !34)
!39 = !DILocation(line: 34, column: 26, scope: !34)
!40 = !DILocalVariable(name: "source", scope: !41, file: !16, line: 36, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !16, line: 35, column: 9)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 36, column: 21, scope: !41)
!46 = !DILocation(line: 37, column: 21, scope: !41)
!47 = !DILocation(line: 37, column: 13, scope: !41)
!48 = !DILocation(line: 38, column: 13, scope: !41)
!49 = !DILocation(line: 38, column: 27, scope: !41)
!50 = !DILocation(line: 40, column: 21, scope: !41)
!51 = !DILocation(line: 40, column: 27, scope: !41)
!52 = !DILocation(line: 40, column: 13, scope: !41)
!53 = !DILocation(line: 41, column: 13, scope: !41)
!54 = !DILocation(line: 41, column: 25, scope: !41)
!55 = !DILocation(line: 42, column: 24, scope: !41)
!56 = !DILocation(line: 42, column: 13, scope: !41)
!57 = !DILocation(line: 45, column: 1, scope: !15)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_31_good", scope: !16, file: !16, line: 75, type: !17, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 77, column: 5, scope: !58)
!60 = !DILocation(line: 78, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 89, type: !62, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !16, line: 89, type: !7)
!68 = !DILocation(line: 89, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !16, line: 89, type: !64)
!70 = !DILocation(line: 89, column: 27, scope: !61)
!71 = !DILocation(line: 92, column: 22, scope: !61)
!72 = !DILocation(line: 92, column: 12, scope: !61)
!73 = !DILocation(line: 92, column: 5, scope: !61)
!74 = !DILocation(line: 94, column: 5, scope: !61)
!75 = !DILocation(line: 95, column: 5, scope: !61)
!76 = !DILocation(line: 96, column: 5, scope: !61)
!77 = !DILocation(line: 99, column: 5, scope: !61)
!78 = !DILocation(line: 100, column: 5, scope: !61)
!79 = !DILocation(line: 101, column: 5, scope: !61)
!80 = !DILocation(line: 103, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !16, line: 54, type: !4)
!83 = !DILocation(line: 54, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !16, line: 55, type: !4)
!85 = !DILocation(line: 55, column: 15, scope: !81)
!86 = !DILocation(line: 55, column: 42, scope: !81)
!87 = !DILocation(line: 55, column: 31, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !16, line: 56, type: !4)
!89 = !DILocation(line: 56, column: 15, scope: !81)
!90 = !DILocation(line: 56, column: 43, scope: !81)
!91 = !DILocation(line: 56, column: 32, scope: !81)
!92 = !DILocation(line: 58, column: 12, scope: !81)
!93 = !DILocation(line: 58, column: 10, scope: !81)
!94 = !DILocation(line: 59, column: 5, scope: !81)
!95 = !DILocation(line: 59, column: 13, scope: !81)
!96 = !DILocalVariable(name: "dataCopy", scope: !97, file: !16, line: 61, type: !4)
!97 = distinct !DILexicalBlock(scope: !81, file: !16, line: 60, column: 5)
!98 = !DILocation(line: 61, column: 19, scope: !97)
!99 = !DILocation(line: 61, column: 30, scope: !97)
!100 = !DILocalVariable(name: "data", scope: !97, file: !16, line: 62, type: !4)
!101 = !DILocation(line: 62, column: 19, scope: !97)
!102 = !DILocation(line: 62, column: 26, scope: !97)
!103 = !DILocalVariable(name: "source", scope: !104, file: !16, line: 64, type: !42)
!104 = distinct !DILexicalBlock(scope: !97, file: !16, line: 63, column: 9)
!105 = !DILocation(line: 64, column: 21, scope: !104)
!106 = !DILocation(line: 65, column: 21, scope: !104)
!107 = !DILocation(line: 65, column: 13, scope: !104)
!108 = !DILocation(line: 66, column: 13, scope: !104)
!109 = !DILocation(line: 66, column: 27, scope: !104)
!110 = !DILocation(line: 68, column: 21, scope: !104)
!111 = !DILocation(line: 68, column: 27, scope: !104)
!112 = !DILocation(line: 68, column: 13, scope: !104)
!113 = !DILocation(line: 69, column: 13, scope: !104)
!114 = !DILocation(line: 69, column: 25, scope: !104)
!115 = !DILocation(line: 70, column: 24, scope: !104)
!116 = !DILocation(line: 70, column: 13, scope: !104)
!117 = !DILocation(line: 73, column: 1, scope: !81)
