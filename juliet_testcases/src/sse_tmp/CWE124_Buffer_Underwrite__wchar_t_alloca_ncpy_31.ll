; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !30
  store i32* %add.ptr, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %5, i32** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !38
  store i32* %6, i32** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !46
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx3, align 4, !dbg !48
  %7 = load i32*, i32** %data1, align 8, !dbg !49
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call5 = call i32* @wcsncpy(i32* %7, i32* %arraydecay4, i64 99) #4, !dbg !51
  %8 = load i32*, i32** %data1, align 8, !dbg !52
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !52
  store i32 0, i32* %arrayidx6, align 4, !dbg !53
  %9 = load i32*, i32** %data1, align 8, !dbg !54
  call void @printWLine(i32* %9), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #4, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #4, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 400, align 16, !dbg !85
  %1 = bitcast i8* %0 to i32*, !dbg !86
  store i32* %1, i32** %dataBuffer, align 8, !dbg !84
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !88
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  store i32* %4, i32** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !93, metadata !DIExpression()), !dbg !95
  %5 = load i32*, i32** %data, align 8, !dbg !96
  store i32* %5, i32** %dataCopy, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !97, metadata !DIExpression()), !dbg !98
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !99
  store i32* %6, i32** %data1, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !104
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx3, align 4, !dbg !106
  %7 = load i32*, i32** %data1, align 8, !dbg !107
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call5 = call i32* @wcsncpy(i32* %7, i32* %arraydecay4, i64 99) #4, !dbg !109
  %8 = load i32*, i32** %data1, align 8, !dbg !110
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !110
  store i32 0, i32* %arrayidx6, align 4, !dbg !111
  %9 = load i32*, i32** %data1, align 8, !dbg !112
  call void @printWLine(i32* %9), !dbg !113
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 30, column: 12, scope: !15)
!30 = !DILocation(line: 30, column: 23, scope: !15)
!31 = !DILocation(line: 30, column: 10, scope: !15)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !16, line: 32, type: !4)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 19, scope: !33)
!35 = !DILocation(line: 32, column: 30, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !16, line: 33, type: !4)
!37 = !DILocation(line: 33, column: 19, scope: !33)
!38 = !DILocation(line: 33, column: 26, scope: !33)
!39 = !DILocalVariable(name: "source", scope: !40, file: !16, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !16, line: 34, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 35, column: 21, scope: !40)
!45 = !DILocation(line: 36, column: 21, scope: !40)
!46 = !DILocation(line: 36, column: 13, scope: !40)
!47 = !DILocation(line: 37, column: 13, scope: !40)
!48 = !DILocation(line: 37, column: 27, scope: !40)
!49 = !DILocation(line: 39, column: 21, scope: !40)
!50 = !DILocation(line: 39, column: 27, scope: !40)
!51 = !DILocation(line: 39, column: 13, scope: !40)
!52 = !DILocation(line: 41, column: 13, scope: !40)
!53 = !DILocation(line: 41, column: 25, scope: !40)
!54 = !DILocation(line: 42, column: 24, scope: !40)
!55 = !DILocation(line: 42, column: 13, scope: !40)
!56 = !DILocation(line: 45, column: 1, scope: !15)
!57 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_31_good", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 78, column: 5, scope: !57)
!59 = !DILocation(line: 79, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 90, type: !61, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !16, line: 90, type: !7)
!67 = !DILocation(line: 90, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !16, line: 90, type: !63)
!69 = !DILocation(line: 90, column: 27, scope: !60)
!70 = !DILocation(line: 93, column: 22, scope: !60)
!71 = !DILocation(line: 93, column: 12, scope: !60)
!72 = !DILocation(line: 93, column: 5, scope: !60)
!73 = !DILocation(line: 95, column: 5, scope: !60)
!74 = !DILocation(line: 96, column: 5, scope: !60)
!75 = !DILocation(line: 97, column: 5, scope: !60)
!76 = !DILocation(line: 100, column: 5, scope: !60)
!77 = !DILocation(line: 101, column: 5, scope: !60)
!78 = !DILocation(line: 102, column: 5, scope: !60)
!79 = !DILocation(line: 104, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !16, line: 54, type: !4)
!82 = !DILocation(line: 54, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !16, line: 55, type: !4)
!84 = !DILocation(line: 55, column: 15, scope: !80)
!85 = !DILocation(line: 55, column: 39, scope: !80)
!86 = !DILocation(line: 55, column: 28, scope: !80)
!87 = !DILocation(line: 56, column: 13, scope: !80)
!88 = !DILocation(line: 56, column: 5, scope: !80)
!89 = !DILocation(line: 57, column: 5, scope: !80)
!90 = !DILocation(line: 57, column: 23, scope: !80)
!91 = !DILocation(line: 59, column: 12, scope: !80)
!92 = !DILocation(line: 59, column: 10, scope: !80)
!93 = !DILocalVariable(name: "dataCopy", scope: !94, file: !16, line: 61, type: !4)
!94 = distinct !DILexicalBlock(scope: !80, file: !16, line: 60, column: 5)
!95 = !DILocation(line: 61, column: 19, scope: !94)
!96 = !DILocation(line: 61, column: 30, scope: !94)
!97 = !DILocalVariable(name: "data", scope: !94, file: !16, line: 62, type: !4)
!98 = !DILocation(line: 62, column: 19, scope: !94)
!99 = !DILocation(line: 62, column: 26, scope: !94)
!100 = !DILocalVariable(name: "source", scope: !101, file: !16, line: 64, type: !41)
!101 = distinct !DILexicalBlock(scope: !94, file: !16, line: 63, column: 9)
!102 = !DILocation(line: 64, column: 21, scope: !101)
!103 = !DILocation(line: 65, column: 21, scope: !101)
!104 = !DILocation(line: 65, column: 13, scope: !101)
!105 = !DILocation(line: 66, column: 13, scope: !101)
!106 = !DILocation(line: 66, column: 27, scope: !101)
!107 = !DILocation(line: 68, column: 21, scope: !101)
!108 = !DILocation(line: 68, column: 27, scope: !101)
!109 = !DILocation(line: 68, column: 13, scope: !101)
!110 = !DILocation(line: 70, column: 13, scope: !101)
!111 = !DILocation(line: 70, column: 25, scope: !101)
!112 = !DILocation(line: 71, column: 24, scope: !101)
!113 = !DILocation(line: 71, column: 13, scope: !101)
!114 = !DILocation(line: 74, column: 1, scope: !80)
