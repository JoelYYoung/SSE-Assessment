; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !10
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !14
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_bad() #0 !dbg !22 {
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
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_badGlobal, align 4, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_badSource(i8* %2), !dbg !34
  store i8* %call, i8** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %6), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 100, align 16, !dbg !77
  store i8* %0, i8** %dataBuffer, align 8, !dbg !76
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  store i8* %1, i8** %data, align 8, !dbg !79
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B1Global, align 4, !dbg !80
  %2 = load i8*, i8** %data, align 8, !dbg !81
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B1Source(i8* %2), !dbg !82
  store i8* %call, i8** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !84, metadata !DIExpression()), !dbg !86
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !86
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !90
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !91
  %6 = load i8*, i8** %data, align 8, !dbg !92
  call void @printLine(i8* %6), !dbg !93
  ret void, !dbg !94
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 100, align 16, !dbg !100
  store i8* %0, i8** %dataBuffer, align 8, !dbg !99
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  store i8* %1, i8** %data, align 8, !dbg !102
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B2Global, align 4, !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B2Source(i8* %2), !dbg !105
  store i8* %call, i8** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !113
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !114
  %6 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* %6), !dbg !116
  ret void, !dbg !117
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_badGlobal", scope: !2, file: !12, line: 30, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B1Global", scope: !2, file: !12, line: 54, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_goodG2B2Global", scope: !2, file: !12, line: 55, type: !13, isLocal: false, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_bad", scope: !12, file: !12, line: 34, type: !23, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 36, type: !6)
!26 = !DILocation(line: 36, column: 12, scope: !22)
!27 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !12, line: 37, type: !6)
!28 = !DILocation(line: 37, column: 12, scope: !22)
!29 = !DILocation(line: 37, column: 33, scope: !22)
!30 = !DILocation(line: 38, column: 12, scope: !22)
!31 = !DILocation(line: 38, column: 10, scope: !22)
!32 = !DILocation(line: 39, column: 82, scope: !22)
!33 = !DILocation(line: 40, column: 89, scope: !22)
!34 = !DILocation(line: 40, column: 12, scope: !22)
!35 = !DILocation(line: 40, column: 10, scope: !22)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 42, type: !38)
!37 = distinct !DILexicalBlock(scope: !22, file: !12, line: 41, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 42, column: 14, scope: !37)
!42 = !DILocation(line: 44, column: 18, scope: !37)
!43 = !DILocation(line: 44, column: 31, scope: !37)
!44 = !DILocation(line: 44, column: 24, scope: !37)
!45 = !DILocation(line: 44, column: 44, scope: !37)
!46 = !DILocation(line: 44, column: 9, scope: !37)
!47 = !DILocation(line: 45, column: 19, scope: !37)
!48 = !DILocation(line: 45, column: 9, scope: !37)
!49 = !DILocation(line: 47, column: 1, scope: !22)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_22_good", scope: !12, file: !12, line: 93, type: !23, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 95, column: 5, scope: !50)
!52 = !DILocation(line: 96, column: 5, scope: !50)
!53 = !DILocation(line: 97, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !55, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!13, !13, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 109, type: !13)
!59 = !DILocation(line: 109, column: 14, scope: !54)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 109, type: !57)
!61 = !DILocation(line: 109, column: 27, scope: !54)
!62 = !DILocation(line: 112, column: 22, scope: !54)
!63 = !DILocation(line: 112, column: 12, scope: !54)
!64 = !DILocation(line: 112, column: 5, scope: !54)
!65 = !DILocation(line: 114, column: 5, scope: !54)
!66 = !DILocation(line: 115, column: 5, scope: !54)
!67 = !DILocation(line: 116, column: 5, scope: !54)
!68 = !DILocation(line: 119, column: 5, scope: !54)
!69 = !DILocation(line: 120, column: 5, scope: !54)
!70 = !DILocation(line: 121, column: 5, scope: !54)
!71 = !DILocation(line: 123, column: 5, scope: !54)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !23, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 62, type: !6)
!74 = !DILocation(line: 62, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !12, line: 63, type: !6)
!76 = !DILocation(line: 63, column: 12, scope: !72)
!77 = !DILocation(line: 63, column: 33, scope: !72)
!78 = !DILocation(line: 64, column: 12, scope: !72)
!79 = !DILocation(line: 64, column: 10, scope: !72)
!80 = !DILocation(line: 65, column: 87, scope: !72)
!81 = !DILocation(line: 66, column: 94, scope: !72)
!82 = !DILocation(line: 66, column: 12, scope: !72)
!83 = !DILocation(line: 66, column: 10, scope: !72)
!84 = !DILocalVariable(name: "dest", scope: !85, file: !12, line: 68, type: !38)
!85 = distinct !DILexicalBlock(scope: !72, file: !12, line: 67, column: 5)
!86 = !DILocation(line: 68, column: 14, scope: !85)
!87 = !DILocation(line: 70, column: 18, scope: !85)
!88 = !DILocation(line: 70, column: 31, scope: !85)
!89 = !DILocation(line: 70, column: 24, scope: !85)
!90 = !DILocation(line: 70, column: 44, scope: !85)
!91 = !DILocation(line: 70, column: 9, scope: !85)
!92 = !DILocation(line: 71, column: 19, scope: !85)
!93 = !DILocation(line: 71, column: 9, scope: !85)
!94 = !DILocation(line: 73, column: 1, scope: !72)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 78, type: !23, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 80, type: !6)
!97 = !DILocation(line: 80, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !12, line: 81, type: !6)
!99 = !DILocation(line: 81, column: 12, scope: !95)
!100 = !DILocation(line: 81, column: 33, scope: !95)
!101 = !DILocation(line: 82, column: 12, scope: !95)
!102 = !DILocation(line: 82, column: 10, scope: !95)
!103 = !DILocation(line: 83, column: 87, scope: !95)
!104 = !DILocation(line: 84, column: 94, scope: !95)
!105 = !DILocation(line: 84, column: 12, scope: !95)
!106 = !DILocation(line: 84, column: 10, scope: !95)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !12, line: 86, type: !38)
!108 = distinct !DILexicalBlock(scope: !95, file: !12, line: 85, column: 5)
!109 = !DILocation(line: 86, column: 14, scope: !108)
!110 = !DILocation(line: 88, column: 18, scope: !108)
!111 = !DILocation(line: 88, column: 31, scope: !108)
!112 = !DILocation(line: 88, column: 24, scope: !108)
!113 = !DILocation(line: 88, column: 44, scope: !108)
!114 = !DILocation(line: 88, column: 9, scope: !108)
!115 = !DILocation(line: 89, column: 19, scope: !108)
!116 = !DILocation(line: 89, column: 9, scope: !108)
!117 = !DILocation(line: 91, column: 1, scope: !95)
