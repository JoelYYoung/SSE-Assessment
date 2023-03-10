; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
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
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !31
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx4, align 4, !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %11 = load i32*, i32** %data2, align 8, !dbg !61
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !63
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %11, i64 %call7) #5, !dbg !64
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx9, align 4, !dbg !66
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  call void @printWLine(i32* %arraydecay10), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !96, metadata !DIExpression()), !dbg !97
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !98, metadata !DIExpression()), !dbg !99
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 400, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBuffer, align 8, !dbg !101
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !105
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !108, metadata !DIExpression()), !dbg !110
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !111
  %5 = load i32*, i32** %4, align 8, !dbg !112
  store i32* %5, i32** %data1, align 8, !dbg !110
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  store i32* %6, i32** %data1, align 8, !dbg !114
  %7 = load i32*, i32** %data1, align 8, !dbg !115
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !116
  store i32* %7, i32** %8, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !118, metadata !DIExpression()), !dbg !120
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !121
  %10 = load i32*, i32** %9, align 8, !dbg !122
  store i32* %10, i32** %data2, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !127
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx4, align 4, !dbg !129
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %11 = load i32*, i32** %data2, align 8, !dbg !131
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !133
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %11, i64 %call7) #5, !dbg !134
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx9, align 4, !dbg !136
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !137
  call void @printWLine(i32* %arraydecay10), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!50 = !DILocalVariable(name: "dest", scope: !51, file: !16, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !16, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 40, column: 21, scope: !51)
!56 = !DILocation(line: 41, column: 21, scope: !51)
!57 = !DILocation(line: 41, column: 13, scope: !51)
!58 = !DILocation(line: 42, column: 13, scope: !51)
!59 = !DILocation(line: 42, column: 25, scope: !51)
!60 = !DILocation(line: 44, column: 21, scope: !51)
!61 = !DILocation(line: 44, column: 27, scope: !51)
!62 = !DILocation(line: 44, column: 40, scope: !51)
!63 = !DILocation(line: 44, column: 33, scope: !51)
!64 = !DILocation(line: 44, column: 13, scope: !51)
!65 = !DILocation(line: 46, column: 13, scope: !51)
!66 = !DILocation(line: 46, column: 25, scope: !51)
!67 = !DILocation(line: 47, column: 24, scope: !51)
!68 = !DILocation(line: 47, column: 13, scope: !51)
!69 = !DILocation(line: 50, column: 1, scope: !15)
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_32_good", scope: !16, file: !16, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 88, column: 5, scope: !70)
!72 = !DILocation(line: 89, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 100, type: !74, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!7, !7, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !16, line: 100, type: !7)
!80 = !DILocation(line: 100, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !16, line: 100, type: !76)
!82 = !DILocation(line: 100, column: 27, scope: !73)
!83 = !DILocation(line: 103, column: 22, scope: !73)
!84 = !DILocation(line: 103, column: 12, scope: !73)
!85 = !DILocation(line: 103, column: 5, scope: !73)
!86 = !DILocation(line: 105, column: 5, scope: !73)
!87 = !DILocation(line: 106, column: 5, scope: !73)
!88 = !DILocation(line: 107, column: 5, scope: !73)
!89 = !DILocation(line: 110, column: 5, scope: !73)
!90 = !DILocation(line: 111, column: 5, scope: !73)
!91 = !DILocation(line: 112, column: 5, scope: !73)
!92 = !DILocation(line: 114, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !16, line: 59, type: !4)
!95 = !DILocation(line: 59, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataPtr1", scope: !93, file: !16, line: 60, type: !22)
!97 = !DILocation(line: 60, column: 16, scope: !93)
!98 = !DILocalVariable(name: "dataPtr2", scope: !93, file: !16, line: 61, type: !22)
!99 = !DILocation(line: 61, column: 16, scope: !93)
!100 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !16, line: 62, type: !4)
!101 = !DILocation(line: 62, column: 15, scope: !93)
!102 = !DILocation(line: 62, column: 39, scope: !93)
!103 = !DILocation(line: 62, column: 28, scope: !93)
!104 = !DILocation(line: 63, column: 13, scope: !93)
!105 = !DILocation(line: 63, column: 5, scope: !93)
!106 = !DILocation(line: 64, column: 5, scope: !93)
!107 = !DILocation(line: 64, column: 23, scope: !93)
!108 = !DILocalVariable(name: "data", scope: !109, file: !16, line: 66, type: !4)
!109 = distinct !DILexicalBlock(scope: !93, file: !16, line: 65, column: 5)
!110 = !DILocation(line: 66, column: 19, scope: !109)
!111 = !DILocation(line: 66, column: 27, scope: !109)
!112 = !DILocation(line: 66, column: 26, scope: !109)
!113 = !DILocation(line: 68, column: 16, scope: !109)
!114 = !DILocation(line: 68, column: 14, scope: !109)
!115 = !DILocation(line: 69, column: 21, scope: !109)
!116 = !DILocation(line: 69, column: 10, scope: !109)
!117 = !DILocation(line: 69, column: 19, scope: !109)
!118 = !DILocalVariable(name: "data", scope: !119, file: !16, line: 72, type: !4)
!119 = distinct !DILexicalBlock(scope: !93, file: !16, line: 71, column: 5)
!120 = !DILocation(line: 72, column: 19, scope: !119)
!121 = !DILocation(line: 72, column: 27, scope: !119)
!122 = !DILocation(line: 72, column: 26, scope: !119)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !16, line: 74, type: !52)
!124 = distinct !DILexicalBlock(scope: !119, file: !16, line: 73, column: 9)
!125 = !DILocation(line: 74, column: 21, scope: !124)
!126 = !DILocation(line: 75, column: 21, scope: !124)
!127 = !DILocation(line: 75, column: 13, scope: !124)
!128 = !DILocation(line: 76, column: 13, scope: !124)
!129 = !DILocation(line: 76, column: 25, scope: !124)
!130 = !DILocation(line: 78, column: 21, scope: !124)
!131 = !DILocation(line: 78, column: 27, scope: !124)
!132 = !DILocation(line: 78, column: 40, scope: !124)
!133 = !DILocation(line: 78, column: 33, scope: !124)
!134 = !DILocation(line: 78, column: 13, scope: !124)
!135 = !DILocation(line: 80, column: 13, scope: !124)
!136 = !DILocation(line: 80, column: 25, scope: !124)
!137 = !DILocation(line: 81, column: 24, scope: !124)
!138 = !DILocation(line: 81, column: 13, scope: !124)
!139 = !DILocation(line: 84, column: 1, scope: !93)
