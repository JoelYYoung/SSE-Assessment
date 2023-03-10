; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !10
@CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !14
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  store i8* %1, i8** %data, align 8, !dbg !31
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_badGlobal, align 4, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_badSource(i8* %2), !dbg !34
  store i8* %call, i8** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %call1 = call i8* @strcpy(i8* %arraydecay, i8* %4) #5, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %5), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 100, align 16, !dbg !75
  store i8* %0, i8** %dataBuffer, align 8, !dbg !74
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !76
  store i8* %1, i8** %data, align 8, !dbg !77
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B1Global, align 4, !dbg !78
  %2 = load i8*, i8** %data, align 8, !dbg !79
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B1Source(i8* %2), !dbg !80
  store i8* %call, i8** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !84
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !85
  %4 = load i8*, i8** %data, align 8, !dbg !86
  %call1 = call i8* @strcpy(i8* %arraydecay, i8* %4) #5, !dbg !87
  %5 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* %5), !dbg !89
  ret void, !dbg !90
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = alloca i8, i64 100, align 16, !dbg !96
  store i8* %0, i8** %dataBuffer, align 8, !dbg !95
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  store i8* %1, i8** %data, align 8, !dbg !98
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B2Global, align 4, !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B2Source(i8* %2), !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !107
  %call1 = call i8* @strcpy(i8* %arraydecay, i8* %4) #5, !dbg !108
  %5 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %5), !dbg !110
  ret void, !dbg !111
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_badGlobal", scope: !2, file: !12, line: 24, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B1Global", scope: !2, file: !12, line: 48, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_goodG2B2Global", scope: !2, file: !12, line: 49, type: !13, isLocal: false, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_bad", scope: !12, file: !12, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 30, type: !6)
!26 = !DILocation(line: 30, column: 12, scope: !22)
!27 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !12, line: 31, type: !6)
!28 = !DILocation(line: 31, column: 12, scope: !22)
!29 = !DILocation(line: 31, column: 33, scope: !22)
!30 = !DILocation(line: 32, column: 12, scope: !22)
!31 = !DILocation(line: 32, column: 10, scope: !22)
!32 = !DILocation(line: 33, column: 74, scope: !22)
!33 = !DILocation(line: 34, column: 81, scope: !22)
!34 = !DILocation(line: 34, column: 12, scope: !22)
!35 = !DILocation(line: 34, column: 10, scope: !22)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !22, file: !12, line: 35, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 36, column: 14, scope: !37)
!42 = !DILocation(line: 38, column: 16, scope: !37)
!43 = !DILocation(line: 38, column: 22, scope: !37)
!44 = !DILocation(line: 38, column: 9, scope: !37)
!45 = !DILocation(line: 39, column: 19, scope: !37)
!46 = !DILocation(line: 39, column: 9, scope: !37)
!47 = !DILocation(line: 41, column: 1, scope: !22)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_22_good", scope: !12, file: !12, line: 87, type: !23, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DILocation(line: 89, column: 5, scope: !48)
!50 = !DILocation(line: 90, column: 5, scope: !48)
!51 = !DILocation(line: 91, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !53, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!13, !13, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 103, type: !13)
!57 = !DILocation(line: 103, column: 14, scope: !52)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 103, type: !55)
!59 = !DILocation(line: 103, column: 27, scope: !52)
!60 = !DILocation(line: 106, column: 22, scope: !52)
!61 = !DILocation(line: 106, column: 12, scope: !52)
!62 = !DILocation(line: 106, column: 5, scope: !52)
!63 = !DILocation(line: 108, column: 5, scope: !52)
!64 = !DILocation(line: 109, column: 5, scope: !52)
!65 = !DILocation(line: 110, column: 5, scope: !52)
!66 = !DILocation(line: 113, column: 5, scope: !52)
!67 = !DILocation(line: 114, column: 5, scope: !52)
!68 = !DILocation(line: 115, column: 5, scope: !52)
!69 = !DILocation(line: 117, column: 5, scope: !52)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !23, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 56, type: !6)
!72 = !DILocation(line: 56, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !12, line: 57, type: !6)
!74 = !DILocation(line: 57, column: 12, scope: !70)
!75 = !DILocation(line: 57, column: 33, scope: !70)
!76 = !DILocation(line: 58, column: 12, scope: !70)
!77 = !DILocation(line: 58, column: 10, scope: !70)
!78 = !DILocation(line: 59, column: 79, scope: !70)
!79 = !DILocation(line: 60, column: 86, scope: !70)
!80 = !DILocation(line: 60, column: 12, scope: !70)
!81 = !DILocation(line: 60, column: 10, scope: !70)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !12, line: 62, type: !38)
!83 = distinct !DILexicalBlock(scope: !70, file: !12, line: 61, column: 5)
!84 = !DILocation(line: 62, column: 14, scope: !83)
!85 = !DILocation(line: 64, column: 16, scope: !83)
!86 = !DILocation(line: 64, column: 22, scope: !83)
!87 = !DILocation(line: 64, column: 9, scope: !83)
!88 = !DILocation(line: 65, column: 19, scope: !83)
!89 = !DILocation(line: 65, column: 9, scope: !83)
!90 = !DILocation(line: 67, column: 1, scope: !70)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 72, type: !23, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 74, type: !6)
!93 = !DILocation(line: 74, column: 12, scope: !91)
!94 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !12, line: 75, type: !6)
!95 = !DILocation(line: 75, column: 12, scope: !91)
!96 = !DILocation(line: 75, column: 33, scope: !91)
!97 = !DILocation(line: 76, column: 12, scope: !91)
!98 = !DILocation(line: 76, column: 10, scope: !91)
!99 = !DILocation(line: 77, column: 79, scope: !91)
!100 = !DILocation(line: 78, column: 86, scope: !91)
!101 = !DILocation(line: 78, column: 12, scope: !91)
!102 = !DILocation(line: 78, column: 10, scope: !91)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !12, line: 80, type: !38)
!104 = distinct !DILexicalBlock(scope: !91, file: !12, line: 79, column: 5)
!105 = !DILocation(line: 80, column: 14, scope: !104)
!106 = !DILocation(line: 82, column: 16, scope: !104)
!107 = !DILocation(line: 82, column: 22, scope: !104)
!108 = !DILocation(line: 82, column: 9, scope: !104)
!109 = !DILocation(line: 83, column: 19, scope: !104)
!110 = !DILocation(line: 83, column: 9, scope: !104)
!111 = !DILocation(line: 85, column: 1, scope: !91)
