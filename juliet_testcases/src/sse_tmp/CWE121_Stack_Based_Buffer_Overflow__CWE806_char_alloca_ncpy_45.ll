; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_goodG2BData = internal global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !28
  %2 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_badData, align 8, !dbg !34
  call void @badSink(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #6, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #6, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_badData, align 8, !dbg !62
  store i8* %0, i8** %data, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !63, metadata !DIExpression()), !dbg !68
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !68
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !69
  %2 = load i8*, i8** %data, align 8, !dbg !70
  %3 = load i8*, i8** %data, align 8, !dbg !71
  %call = call i64 @strlen(i8* %3) #7, !dbg !72
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %2, i64 %call) #6, !dbg !73
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %4 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %4), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 100, align 16, !dbg !84
  store i8* %0, i8** %dataBuffer, align 8, !dbg !83
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  store i8* %1, i8** %data, align 8, !dbg !86
  %2 = load i8*, i8** %data, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !88
  %3 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !92
  call void @goodG2BSink(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !98
  store i8* %0, i8** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !101
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %call = call i64 @strlen(i8* %3) #7, !dbg !105
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %2, i64 %call) #6, !dbg !106
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %4), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_bad", scope: !12, file: !12, line: 38, type: !20, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 40, type: !6)
!23 = !DILocation(line: 40, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 41, type: !6)
!25 = !DILocation(line: 41, column: 12, scope: !19)
!26 = !DILocation(line: 41, column: 33, scope: !19)
!27 = !DILocation(line: 42, column: 12, scope: !19)
!28 = !DILocation(line: 42, column: 10, scope: !19)
!29 = !DILocation(line: 44, column: 12, scope: !19)
!30 = !DILocation(line: 44, column: 5, scope: !19)
!31 = !DILocation(line: 45, column: 5, scope: !19)
!32 = !DILocation(line: 45, column: 17, scope: !19)
!33 = !DILocation(line: 46, column: 78, scope: !19)
!34 = !DILocation(line: 46, column: 76, scope: !19)
!35 = !DILocation(line: 47, column: 5, scope: !19)
!36 = !DILocation(line: 48, column: 1, scope: !19)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_45_good", scope: !12, file: !12, line: 79, type: !20, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DILocation(line: 81, column: 5, scope: !37)
!39 = !DILocation(line: 82, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 93, type: !41, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !12, line: 93, type: !43)
!46 = !DILocation(line: 93, column: 14, scope: !40)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !12, line: 93, type: !44)
!48 = !DILocation(line: 93, column: 27, scope: !40)
!49 = !DILocation(line: 96, column: 22, scope: !40)
!50 = !DILocation(line: 96, column: 12, scope: !40)
!51 = !DILocation(line: 96, column: 5, scope: !40)
!52 = !DILocation(line: 98, column: 5, scope: !40)
!53 = !DILocation(line: 99, column: 5, scope: !40)
!54 = !DILocation(line: 100, column: 5, scope: !40)
!55 = !DILocation(line: 103, column: 5, scope: !40)
!56 = !DILocation(line: 104, column: 5, scope: !40)
!57 = !DILocation(line: 105, column: 5, scope: !40)
!58 = !DILocation(line: 107, column: 5, scope: !40)
!59 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocalVariable(name: "data", scope: !59, file: !12, line: 28, type: !6)
!61 = !DILocation(line: 28, column: 12, scope: !59)
!62 = !DILocation(line: 28, column: 19, scope: !59)
!63 = !DILocalVariable(name: "dest", scope: !64, file: !12, line: 30, type: !65)
!64 = distinct !DILexicalBlock(scope: !59, file: !12, line: 29, column: 5)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 50)
!68 = !DILocation(line: 30, column: 14, scope: !64)
!69 = !DILocation(line: 32, column: 17, scope: !64)
!70 = !DILocation(line: 32, column: 23, scope: !64)
!71 = !DILocation(line: 32, column: 36, scope: !64)
!72 = !DILocation(line: 32, column: 29, scope: !64)
!73 = !DILocation(line: 32, column: 9, scope: !64)
!74 = !DILocation(line: 33, column: 9, scope: !64)
!75 = !DILocation(line: 33, column: 20, scope: !64)
!76 = !DILocation(line: 34, column: 19, scope: !64)
!77 = !DILocation(line: 34, column: 9, scope: !64)
!78 = !DILocation(line: 36, column: 1, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 69, type: !6)
!81 = !DILocation(line: 69, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !12, line: 70, type: !6)
!83 = !DILocation(line: 70, column: 12, scope: !79)
!84 = !DILocation(line: 70, column: 33, scope: !79)
!85 = !DILocation(line: 71, column: 12, scope: !79)
!86 = !DILocation(line: 71, column: 10, scope: !79)
!87 = !DILocation(line: 73, column: 12, scope: !79)
!88 = !DILocation(line: 73, column: 5, scope: !79)
!89 = !DILocation(line: 74, column: 5, scope: !79)
!90 = !DILocation(line: 74, column: 16, scope: !79)
!91 = !DILocation(line: 75, column: 82, scope: !79)
!92 = !DILocation(line: 75, column: 80, scope: !79)
!93 = !DILocation(line: 76, column: 5, scope: !79)
!94 = !DILocation(line: 77, column: 1, scope: !79)
!95 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 57, type: !6)
!97 = !DILocation(line: 57, column: 12, scope: !95)
!98 = !DILocation(line: 57, column: 19, scope: !95)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 59, type: !65)
!100 = distinct !DILexicalBlock(scope: !95, file: !12, line: 58, column: 5)
!101 = !DILocation(line: 59, column: 14, scope: !100)
!102 = !DILocation(line: 61, column: 17, scope: !100)
!103 = !DILocation(line: 61, column: 23, scope: !100)
!104 = !DILocation(line: 61, column: 36, scope: !100)
!105 = !DILocation(line: 61, column: 29, scope: !100)
!106 = !DILocation(line: 61, column: 9, scope: !100)
!107 = !DILocation(line: 62, column: 9, scope: !100)
!108 = !DILocation(line: 62, column: 20, scope: !100)
!109 = !DILocation(line: 63, column: 19, scope: !100)
!110 = !DILocation(line: 63, column: 9, scope: !100)
!111 = !DILocation(line: 65, column: 1, scope: !95)
