; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !27
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !28
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %0 = load i32*, i32** %data.addr, align 8, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #4, !dbg !33
  %1 = load i32*, i32** %data.addr, align 8, !dbg !34
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !34
  store i32 0, i32* %arrayidx3, align 4, !dbg !35
  %2 = load i32*, i32** %data.addr, align 8, !dbg !36
  call void @printWLine(i32* %2), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_bad() #0 !dbg !39 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = alloca i8, i64 400, align 16, !dbg !46
  %1 = bitcast i8* %0 to i32*, !dbg !47
  store i32* %1, i32** %dataBuffer, align 8, !dbg !45
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !48
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !49
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !52
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !53
  store i32* %add.ptr, i32** %data, align 8, !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !55
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_badSink(i32* %5), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_goodG2BSink(i32* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !61, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !64
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !65
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !67
  %0 = load i32*, i32** %data.addr, align 8, !dbg !68
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !69
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #4, !dbg !70
  %1 = load i32*, i32** %data.addr, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !71
  store i32 0, i32* %arrayidx3, align 4, !dbg !72
  %2 = load i32*, i32** %data.addr, align 8, !dbg !73
  call void @printWLine(i32* %2), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #4, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #4, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 400, align 16, !dbg !104
  %1 = bitcast i8* %0 to i32*, !dbg !105
  store i32* %1, i32** %dataBuffer, align 8, !dbg !103
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !107
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  store i32* %4, i32** %data, align 8, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_goodG2BSink(i32* %5), !dbg !113
  ret void, !dbg !114
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 73, scope: !15)
!21 = !DILocalVariable(name: "source", scope: !22, file: !16, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 27, column: 17, scope: !22)
!28 = !DILocation(line: 27, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 9, scope: !22)
!30 = !DILocation(line: 28, column: 23, scope: !22)
!31 = !DILocation(line: 30, column: 17, scope: !22)
!32 = !DILocation(line: 30, column: 23, scope: !22)
!33 = !DILocation(line: 30, column: 9, scope: !22)
!34 = !DILocation(line: 32, column: 9, scope: !22)
!35 = !DILocation(line: 32, column: 21, scope: !22)
!36 = !DILocation(line: 33, column: 20, scope: !22)
!37 = !DILocation(line: 33, column: 9, scope: !22)
!38 = !DILocation(line: 35, column: 1, scope: !15)
!39 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_bad", scope: !16, file: !16, line: 37, type: !40, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null}
!42 = !DILocalVariable(name: "data", scope: !39, file: !16, line: 39, type: !4)
!43 = !DILocation(line: 39, column: 15, scope: !39)
!44 = !DILocalVariable(name: "dataBuffer", scope: !39, file: !16, line: 40, type: !4)
!45 = !DILocation(line: 40, column: 15, scope: !39)
!46 = !DILocation(line: 40, column: 39, scope: !39)
!47 = !DILocation(line: 40, column: 28, scope: !39)
!48 = !DILocation(line: 41, column: 13, scope: !39)
!49 = !DILocation(line: 41, column: 5, scope: !39)
!50 = !DILocation(line: 42, column: 5, scope: !39)
!51 = !DILocation(line: 42, column: 23, scope: !39)
!52 = !DILocation(line: 44, column: 12, scope: !39)
!53 = !DILocation(line: 44, column: 23, scope: !39)
!54 = !DILocation(line: 44, column: 10, scope: !39)
!55 = !DILocation(line: 45, column: 62, scope: !39)
!56 = !DILocation(line: 45, column: 5, scope: !39)
!57 = !DILocation(line: 46, column: 1, scope: !39)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_goodG2BSink", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !16, line: 52, type: !4)
!60 = !DILocation(line: 52, column: 77, scope: !58)
!61 = !DILocalVariable(name: "source", scope: !62, file: !16, line: 55, type: !23)
!62 = distinct !DILexicalBlock(scope: !58, file: !16, line: 54, column: 5)
!63 = !DILocation(line: 55, column: 17, scope: !62)
!64 = !DILocation(line: 56, column: 17, scope: !62)
!65 = !DILocation(line: 56, column: 9, scope: !62)
!66 = !DILocation(line: 57, column: 9, scope: !62)
!67 = !DILocation(line: 57, column: 23, scope: !62)
!68 = !DILocation(line: 59, column: 17, scope: !62)
!69 = !DILocation(line: 59, column: 23, scope: !62)
!70 = !DILocation(line: 59, column: 9, scope: !62)
!71 = !DILocation(line: 61, column: 9, scope: !62)
!72 = !DILocation(line: 61, column: 21, scope: !62)
!73 = !DILocation(line: 62, column: 20, scope: !62)
!74 = !DILocation(line: 62, column: 9, scope: !62)
!75 = !DILocation(line: 64, column: 1, scope: !58)
!76 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_41_good", scope: !16, file: !16, line: 78, type: !40, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 80, column: 5, scope: !76)
!78 = !DILocation(line: 81, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 93, type: !80, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !16, line: 93, type: !7)
!86 = !DILocation(line: 93, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !16, line: 93, type: !82)
!88 = !DILocation(line: 93, column: 27, scope: !79)
!89 = !DILocation(line: 96, column: 22, scope: !79)
!90 = !DILocation(line: 96, column: 12, scope: !79)
!91 = !DILocation(line: 96, column: 5, scope: !79)
!92 = !DILocation(line: 98, column: 5, scope: !79)
!93 = !DILocation(line: 99, column: 5, scope: !79)
!94 = !DILocation(line: 100, column: 5, scope: !79)
!95 = !DILocation(line: 103, column: 5, scope: !79)
!96 = !DILocation(line: 104, column: 5, scope: !79)
!97 = !DILocation(line: 105, column: 5, scope: !79)
!98 = !DILocation(line: 107, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 67, type: !40, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !16, line: 69, type: !4)
!101 = !DILocation(line: 69, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !16, line: 70, type: !4)
!103 = !DILocation(line: 70, column: 15, scope: !99)
!104 = !DILocation(line: 70, column: 39, scope: !99)
!105 = !DILocation(line: 70, column: 28, scope: !99)
!106 = !DILocation(line: 71, column: 13, scope: !99)
!107 = !DILocation(line: 71, column: 5, scope: !99)
!108 = !DILocation(line: 72, column: 5, scope: !99)
!109 = !DILocation(line: 72, column: 23, scope: !99)
!110 = !DILocation(line: 74, column: 12, scope: !99)
!111 = !DILocation(line: 74, column: 10, scope: !99)
!112 = !DILocation(line: 75, column: 66, scope: !99)
!113 = !DILocation(line: 75, column: 5, scope: !99)
!114 = !DILocation(line: 76, column: 1, scope: !99)
