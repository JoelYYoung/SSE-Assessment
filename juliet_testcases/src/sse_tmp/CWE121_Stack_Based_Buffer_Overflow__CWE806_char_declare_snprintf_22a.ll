; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_badGlobal, align 4, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_badSource(i8* %0), !dbg !36
  store i8* %call, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %4), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  store i8* %arraydecay, i8** %data, align 8, !dbg !80
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B1Global, align 4, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B1Source(i8* %0), !dbg !83
  store i8* %call, i8** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !87
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !88
  %2 = load i8*, i8** %data, align 8, !dbg !89
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !90
  %3 = load i8*, i8** %data, align 8, !dbg !91
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !92
  %4 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* %4), !dbg !94
  ret void, !dbg !95
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay, i8** %data, align 8, !dbg !102
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B2Global, align 4, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B2Source(i8* %0), !dbg !105
  store i8* %call, i8** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !109
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !111
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !113
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* %4), !dbg !116
  ret void, !dbg !117
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B2Source(i8*) #2

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
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_badGlobal", scope: !2, file: !10, line: 30, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B1Global", scope: !2, file: !10, line: 54, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_goodG2B2Global", scope: !2, file: !10, line: 55, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_bad", scope: !10, file: !10, line: 34, type: !21, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 36, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 36, column: 12, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 37, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 37, column: 10, scope: !20)
!32 = !DILocation(line: 38, column: 12, scope: !20)
!33 = !DILocation(line: 38, column: 10, scope: !20)
!34 = !DILocation(line: 39, column: 83, scope: !20)
!35 = !DILocation(line: 40, column: 90, scope: !20)
!36 = !DILocation(line: 40, column: 12, scope: !20)
!37 = !DILocation(line: 40, column: 10, scope: !20)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 42, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 41, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 42, column: 14, scope: !39)
!44 = !DILocation(line: 44, column: 18, scope: !39)
!45 = !DILocation(line: 44, column: 31, scope: !39)
!46 = !DILocation(line: 44, column: 24, scope: !39)
!47 = !DILocation(line: 44, column: 44, scope: !39)
!48 = !DILocation(line: 44, column: 9, scope: !39)
!49 = !DILocation(line: 45, column: 19, scope: !39)
!50 = !DILocation(line: 45, column: 9, scope: !39)
!51 = !DILocation(line: 47, column: 1, scope: !20)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_22_good", scope: !10, file: !10, line: 93, type: !21, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 95, column: 5, scope: !52)
!54 = !DILocation(line: 96, column: 5, scope: !52)
!55 = !DILocation(line: 97, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 109, type: !57, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!11, !11, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !10, line: 109, type: !11)
!61 = !DILocation(line: 109, column: 14, scope: !56)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !10, line: 109, type: !59)
!63 = !DILocation(line: 109, column: 27, scope: !56)
!64 = !DILocation(line: 112, column: 22, scope: !56)
!65 = !DILocation(line: 112, column: 12, scope: !56)
!66 = !DILocation(line: 112, column: 5, scope: !56)
!67 = !DILocation(line: 114, column: 5, scope: !56)
!68 = !DILocation(line: 115, column: 5, scope: !56)
!69 = !DILocation(line: 116, column: 5, scope: !56)
!70 = !DILocation(line: 119, column: 5, scope: !56)
!71 = !DILocation(line: 120, column: 5, scope: !56)
!72 = !DILocation(line: 121, column: 5, scope: !56)
!73 = !DILocation(line: 123, column: 5, scope: !56)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !10, line: 62, type: !24)
!76 = !DILocation(line: 62, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !10, line: 63, type: !28)
!78 = !DILocation(line: 63, column: 10, scope: !74)
!79 = !DILocation(line: 64, column: 12, scope: !74)
!80 = !DILocation(line: 64, column: 10, scope: !74)
!81 = !DILocation(line: 65, column: 88, scope: !74)
!82 = !DILocation(line: 66, column: 95, scope: !74)
!83 = !DILocation(line: 66, column: 12, scope: !74)
!84 = !DILocation(line: 66, column: 10, scope: !74)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !10, line: 68, type: !40)
!86 = distinct !DILexicalBlock(scope: !74, file: !10, line: 67, column: 5)
!87 = !DILocation(line: 68, column: 14, scope: !86)
!88 = !DILocation(line: 70, column: 18, scope: !86)
!89 = !DILocation(line: 70, column: 31, scope: !86)
!90 = !DILocation(line: 70, column: 24, scope: !86)
!91 = !DILocation(line: 70, column: 44, scope: !86)
!92 = !DILocation(line: 70, column: 9, scope: !86)
!93 = !DILocation(line: 71, column: 19, scope: !86)
!94 = !DILocation(line: 71, column: 9, scope: !86)
!95 = !DILocation(line: 73, column: 1, scope: !74)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !10, line: 80, type: !24)
!98 = !DILocation(line: 80, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !10, line: 81, type: !28)
!100 = !DILocation(line: 81, column: 10, scope: !96)
!101 = !DILocation(line: 82, column: 12, scope: !96)
!102 = !DILocation(line: 82, column: 10, scope: !96)
!103 = !DILocation(line: 83, column: 88, scope: !96)
!104 = !DILocation(line: 84, column: 95, scope: !96)
!105 = !DILocation(line: 84, column: 12, scope: !96)
!106 = !DILocation(line: 84, column: 10, scope: !96)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !10, line: 86, type: !40)
!108 = distinct !DILexicalBlock(scope: !96, file: !10, line: 85, column: 5)
!109 = !DILocation(line: 86, column: 14, scope: !108)
!110 = !DILocation(line: 88, column: 18, scope: !108)
!111 = !DILocation(line: 88, column: 31, scope: !108)
!112 = !DILocation(line: 88, column: 24, scope: !108)
!113 = !DILocation(line: 88, column: 44, scope: !108)
!114 = !DILocation(line: 88, column: 9, scope: !108)
!115 = !DILocation(line: 89, column: 19, scope: !108)
!116 = !DILocation(line: 89, column: 9, scope: !108)
!117 = !DILocation(line: 91, column: 1, scope: !96)
