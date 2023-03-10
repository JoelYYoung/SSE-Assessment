; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_badGlobal, align 4, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_badSource(i32* %0), !dbg !37
  store i32* %call, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !44
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !45
  %2 = load i32*, i32** %data, align 8, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !48
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %2, i64 %call2) #7, !dbg !49
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %4 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %4), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #7, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #7, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  store i32* %arraydecay, i32** %data, align 8, !dbg !85
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B1Global, align 4, !dbg !86
  %0 = load i32*, i32** %data, align 8, !dbg !87
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B1Source(i32* %0), !dbg !88
  store i32* %call, i32** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !92
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !96
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %2, i64 %call2) #7, !dbg !97
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  %4 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %4), !dbg !101
  ret void, !dbg !102
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data, align 8, !dbg !109
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B2Global, align 4, !dbg !110
  %0 = load i32*, i32** %data, align 8, !dbg !111
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B2Source(i32* %0), !dbg !112
  store i32* %call, i32** %data, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !116
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !117
  %2 = load i32*, i32** %data, align 8, !dbg !118
  %3 = load i32*, i32** %data, align 8, !dbg !119
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !120
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %2, i64 %call2) #7, !dbg !121
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  %4 = load i32*, i32** %data, align 8, !dbg !124
  call void @printWLine(i32* %4), !dbg !125
  ret void, !dbg !126
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B1Global", scope: !2, file: !10, line: 49, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_goodG2B2Global", scope: !2, file: !10, line: 50, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 31, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 31, column: 13, scope: !20)
!33 = !DILocation(line: 32, column: 12, scope: !20)
!34 = !DILocation(line: 32, column: 10, scope: !20)
!35 = !DILocation(line: 33, column: 82, scope: !20)
!36 = !DILocation(line: 34, column: 89, scope: !20)
!37 = !DILocation(line: 34, column: 12, scope: !20)
!38 = !DILocation(line: 34, column: 10, scope: !20)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !10, line: 36, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !10, line: 35, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 36, column: 17, scope: !40)
!45 = !DILocation(line: 38, column: 17, scope: !40)
!46 = !DILocation(line: 38, column: 23, scope: !40)
!47 = !DILocation(line: 38, column: 36, scope: !40)
!48 = !DILocation(line: 38, column: 29, scope: !40)
!49 = !DILocation(line: 38, column: 9, scope: !40)
!50 = !DILocation(line: 39, column: 9, scope: !40)
!51 = !DILocation(line: 39, column: 20, scope: !40)
!52 = !DILocation(line: 40, column: 20, scope: !40)
!53 = !DILocation(line: 40, column: 9, scope: !40)
!54 = !DILocation(line: 42, column: 1, scope: !20)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_22_good", scope: !10, file: !10, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 92, column: 5, scope: !55)
!57 = !DILocation(line: 93, column: 5, scope: !55)
!58 = !DILocation(line: 94, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 106, type: !60, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!11, !11, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !10, line: 106, type: !11)
!66 = !DILocation(line: 106, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !10, line: 106, type: !62)
!68 = !DILocation(line: 106, column: 27, scope: !59)
!69 = !DILocation(line: 109, column: 22, scope: !59)
!70 = !DILocation(line: 109, column: 12, scope: !59)
!71 = !DILocation(line: 109, column: 5, scope: !59)
!72 = !DILocation(line: 111, column: 5, scope: !59)
!73 = !DILocation(line: 112, column: 5, scope: !59)
!74 = !DILocation(line: 113, column: 5, scope: !59)
!75 = !DILocation(line: 116, column: 5, scope: !59)
!76 = !DILocation(line: 117, column: 5, scope: !59)
!77 = !DILocation(line: 118, column: 5, scope: !59)
!78 = !DILocation(line: 120, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !10, line: 57, type: !24)
!81 = !DILocation(line: 57, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !10, line: 58, type: !29)
!83 = !DILocation(line: 58, column: 13, scope: !79)
!84 = !DILocation(line: 59, column: 12, scope: !79)
!85 = !DILocation(line: 59, column: 10, scope: !79)
!86 = !DILocation(line: 60, column: 87, scope: !79)
!87 = !DILocation(line: 61, column: 94, scope: !79)
!88 = !DILocation(line: 61, column: 12, scope: !79)
!89 = !DILocation(line: 61, column: 10, scope: !79)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !10, line: 63, type: !41)
!91 = distinct !DILexicalBlock(scope: !79, file: !10, line: 62, column: 5)
!92 = !DILocation(line: 63, column: 17, scope: !91)
!93 = !DILocation(line: 65, column: 17, scope: !91)
!94 = !DILocation(line: 65, column: 23, scope: !91)
!95 = !DILocation(line: 65, column: 36, scope: !91)
!96 = !DILocation(line: 65, column: 29, scope: !91)
!97 = !DILocation(line: 65, column: 9, scope: !91)
!98 = !DILocation(line: 66, column: 9, scope: !91)
!99 = !DILocation(line: 66, column: 20, scope: !91)
!100 = !DILocation(line: 67, column: 20, scope: !91)
!101 = !DILocation(line: 67, column: 9, scope: !91)
!102 = !DILocation(line: 69, column: 1, scope: !79)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 74, type: !21, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !10, line: 76, type: !24)
!105 = !DILocation(line: 76, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !10, line: 77, type: !29)
!107 = !DILocation(line: 77, column: 13, scope: !103)
!108 = !DILocation(line: 78, column: 12, scope: !103)
!109 = !DILocation(line: 78, column: 10, scope: !103)
!110 = !DILocation(line: 79, column: 87, scope: !103)
!111 = !DILocation(line: 80, column: 94, scope: !103)
!112 = !DILocation(line: 80, column: 12, scope: !103)
!113 = !DILocation(line: 80, column: 10, scope: !103)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !10, line: 82, type: !41)
!115 = distinct !DILexicalBlock(scope: !103, file: !10, line: 81, column: 5)
!116 = !DILocation(line: 82, column: 17, scope: !115)
!117 = !DILocation(line: 84, column: 17, scope: !115)
!118 = !DILocation(line: 84, column: 23, scope: !115)
!119 = !DILocation(line: 84, column: 36, scope: !115)
!120 = !DILocation(line: 84, column: 29, scope: !115)
!121 = !DILocation(line: 84, column: 9, scope: !115)
!122 = !DILocation(line: 85, column: 9, scope: !115)
!123 = !DILocation(line: 85, column: 20, scope: !115)
!124 = !DILocation(line: 86, column: 20, scope: !115)
!125 = !DILocation(line: 86, column: 9, scope: !115)
!126 = !DILocation(line: 88, column: 1, scope: !103)
