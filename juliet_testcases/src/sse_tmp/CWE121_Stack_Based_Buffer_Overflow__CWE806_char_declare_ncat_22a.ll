; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_badGlobal, align 4, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_badSource(i8* %0), !dbg !36
  store i8* %call, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !47
  %call3 = call i8* @strncat(i8* %arraydecay1, i8* %2, i64 %call2) #7, !dbg !48
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !49
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %4 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %4), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !81
  store i8* %arraydecay, i8** %data, align 8, !dbg !82
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B1Global, align 4, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B1Source(i8* %0), !dbg !85
  store i8* %call, i8** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !87, metadata !DIExpression()), !dbg !89
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !89
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !93
  %call3 = call i8* @strncat(i8* %arraydecay1, i8* %2, i64 %call2) #7, !dbg !94
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* %4), !dbg !98
  ret void, !dbg !99
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !105
  store i8* %arraydecay, i8** %data, align 8, !dbg !106
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B2Global, align 4, !dbg !107
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B2Source(i8* %0), !dbg !109
  store i8* %call, i8** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !113
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !114
  %2 = load i8*, i8** %data, align 8, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !117
  %call3 = call i8* @strncat(i8* %arraydecay1, i8* %2, i64 %call2) #7, !dbg !118
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  call void @printLine(i8* %4), !dbg !122
  ret void, !dbg !123
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B2Source(i8*) #2

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
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B1Global", scope: !2, file: !10, line: 49, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_goodG2B2Global", scope: !2, file: !10, line: 50, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 31, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 31, column: 10, scope: !20)
!32 = !DILocation(line: 32, column: 12, scope: !20)
!33 = !DILocation(line: 32, column: 10, scope: !20)
!34 = !DILocation(line: 33, column: 79, scope: !20)
!35 = !DILocation(line: 34, column: 86, scope: !20)
!36 = !DILocation(line: 34, column: 12, scope: !20)
!37 = !DILocation(line: 34, column: 10, scope: !20)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 36, column: 14, scope: !39)
!44 = !DILocation(line: 38, column: 17, scope: !39)
!45 = !DILocation(line: 38, column: 23, scope: !39)
!46 = !DILocation(line: 38, column: 36, scope: !39)
!47 = !DILocation(line: 38, column: 29, scope: !39)
!48 = !DILocation(line: 38, column: 9, scope: !39)
!49 = !DILocation(line: 39, column: 9, scope: !39)
!50 = !DILocation(line: 39, column: 20, scope: !39)
!51 = !DILocation(line: 40, column: 19, scope: !39)
!52 = !DILocation(line: 40, column: 9, scope: !39)
!53 = !DILocation(line: 42, column: 1, scope: !20)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_22_good", scope: !10, file: !10, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 92, column: 5, scope: !54)
!56 = !DILocation(line: 93, column: 5, scope: !54)
!57 = !DILocation(line: 94, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 106, type: !59, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !10, line: 106, type: !11)
!63 = !DILocation(line: 106, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !10, line: 106, type: !61)
!65 = !DILocation(line: 106, column: 27, scope: !58)
!66 = !DILocation(line: 109, column: 22, scope: !58)
!67 = !DILocation(line: 109, column: 12, scope: !58)
!68 = !DILocation(line: 109, column: 5, scope: !58)
!69 = !DILocation(line: 111, column: 5, scope: !58)
!70 = !DILocation(line: 112, column: 5, scope: !58)
!71 = !DILocation(line: 113, column: 5, scope: !58)
!72 = !DILocation(line: 116, column: 5, scope: !58)
!73 = !DILocation(line: 117, column: 5, scope: !58)
!74 = !DILocation(line: 118, column: 5, scope: !58)
!75 = !DILocation(line: 120, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !10, line: 57, type: !24)
!78 = !DILocation(line: 57, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !10, line: 58, type: !28)
!80 = !DILocation(line: 58, column: 10, scope: !76)
!81 = !DILocation(line: 59, column: 12, scope: !76)
!82 = !DILocation(line: 59, column: 10, scope: !76)
!83 = !DILocation(line: 60, column: 84, scope: !76)
!84 = !DILocation(line: 61, column: 91, scope: !76)
!85 = !DILocation(line: 61, column: 12, scope: !76)
!86 = !DILocation(line: 61, column: 10, scope: !76)
!87 = !DILocalVariable(name: "dest", scope: !88, file: !10, line: 63, type: !40)
!88 = distinct !DILexicalBlock(scope: !76, file: !10, line: 62, column: 5)
!89 = !DILocation(line: 63, column: 14, scope: !88)
!90 = !DILocation(line: 65, column: 17, scope: !88)
!91 = !DILocation(line: 65, column: 23, scope: !88)
!92 = !DILocation(line: 65, column: 36, scope: !88)
!93 = !DILocation(line: 65, column: 29, scope: !88)
!94 = !DILocation(line: 65, column: 9, scope: !88)
!95 = !DILocation(line: 66, column: 9, scope: !88)
!96 = !DILocation(line: 66, column: 20, scope: !88)
!97 = !DILocation(line: 67, column: 19, scope: !88)
!98 = !DILocation(line: 67, column: 9, scope: !88)
!99 = !DILocation(line: 69, column: 1, scope: !76)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 74, type: !21, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !10, line: 76, type: !24)
!102 = !DILocation(line: 76, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !10, line: 77, type: !28)
!104 = !DILocation(line: 77, column: 10, scope: !100)
!105 = !DILocation(line: 78, column: 12, scope: !100)
!106 = !DILocation(line: 78, column: 10, scope: !100)
!107 = !DILocation(line: 79, column: 84, scope: !100)
!108 = !DILocation(line: 80, column: 91, scope: !100)
!109 = !DILocation(line: 80, column: 12, scope: !100)
!110 = !DILocation(line: 80, column: 10, scope: !100)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !10, line: 82, type: !40)
!112 = distinct !DILexicalBlock(scope: !100, file: !10, line: 81, column: 5)
!113 = !DILocation(line: 82, column: 14, scope: !112)
!114 = !DILocation(line: 84, column: 17, scope: !112)
!115 = !DILocation(line: 84, column: 23, scope: !112)
!116 = !DILocation(line: 84, column: 36, scope: !112)
!117 = !DILocation(line: 84, column: 29, scope: !112)
!118 = !DILocation(line: 84, column: 9, scope: !112)
!119 = !DILocation(line: 85, column: 9, scope: !112)
!120 = !DILocation(line: 85, column: 20, scope: !112)
!121 = !DILocation(line: 86, column: 19, scope: !112)
!122 = !DILocation(line: 86, column: 9, scope: !112)
!123 = !DILocation(line: 88, column: 1, scope: !100)
