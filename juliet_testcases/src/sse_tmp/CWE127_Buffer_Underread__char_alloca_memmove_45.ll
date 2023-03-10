; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__char_alloca_memmove_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__char_alloca_memmove_45_goodG2BData = internal global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memmove_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !28
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %4, i8** @CWE127_Buffer_Underread__char_alloca_memmove_45_badData, align 8, !dbg !35
  call void @badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memmove_45_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #6, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #6, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE127_Buffer_Underread__char_alloca_memmove_45_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE127_Buffer_Underread__char_alloca_memmove_45_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i8*, i8** @CWE127_Buffer_Underread__char_alloca_memmove_45_badData, align 8, !dbg !63
  store i8* %0, i8** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !64, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !70
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  %1 = load i8*, i8** %data, align 8, !dbg !74
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 100, i1 false), !dbg !73
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !75
  store i8 0, i8* %arrayidx2, align 1, !dbg !76
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !77
  call void @printLine(i8* %arraydecay3), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 100, align 16, !dbg !85
  store i8* %0, i8** %dataBuffer, align 8, !dbg !84
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !87
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  store i8* %3, i8** %data, align 8, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  store i8* %4, i8** @CWE127_Buffer_Underread__char_alloca_memmove_45_goodG2BData, align 8, !dbg !93
  call void @goodG2BSink(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i8*, i8** @CWE127_Buffer_Underread__char_alloca_memmove_45_goodG2BData, align 8, !dbg !99
  store i8* %0, i8** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !103
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  %1 = load i8*, i8** %data, align 8, !dbg !107
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 100, i1 false), !dbg !106
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx2, align 1, !dbg !109
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @printLine(i8* %arraydecay3), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__char_alloca_memmove_45_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__char_alloca_memmove_45_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memmove_45_bad", scope: !12, file: !12, line: 41, type: !20, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 43, type: !6)
!23 = !DILocation(line: 43, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 44, type: !6)
!25 = !DILocation(line: 44, column: 12, scope: !19)
!26 = !DILocation(line: 44, column: 33, scope: !19)
!27 = !DILocation(line: 45, column: 12, scope: !19)
!28 = !DILocation(line: 45, column: 5, scope: !19)
!29 = !DILocation(line: 46, column: 5, scope: !19)
!30 = !DILocation(line: 46, column: 23, scope: !19)
!31 = !DILocation(line: 48, column: 12, scope: !19)
!32 = !DILocation(line: 48, column: 23, scope: !19)
!33 = !DILocation(line: 48, column: 10, scope: !19)
!34 = !DILocation(line: 49, column: 63, scope: !19)
!35 = !DILocation(line: 49, column: 61, scope: !19)
!36 = !DILocation(line: 50, column: 5, scope: !19)
!37 = !DILocation(line: 51, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memmove_45_good", scope: !12, file: !12, line: 85, type: !20, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 87, column: 5, scope: !38)
!40 = !DILocation(line: 88, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !42, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 99, type: !44)
!47 = !DILocation(line: 99, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 99, type: !45)
!49 = !DILocation(line: 99, column: 27, scope: !41)
!50 = !DILocation(line: 102, column: 22, scope: !41)
!51 = !DILocation(line: 102, column: 12, scope: !41)
!52 = !DILocation(line: 102, column: 5, scope: !41)
!53 = !DILocation(line: 104, column: 5, scope: !41)
!54 = !DILocation(line: 105, column: 5, scope: !41)
!55 = !DILocation(line: 106, column: 5, scope: !41)
!56 = !DILocation(line: 109, column: 5, scope: !41)
!57 = !DILocation(line: 110, column: 5, scope: !41)
!58 = !DILocation(line: 111, column: 5, scope: !41)
!59 = !DILocation(line: 113, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 28, type: !6)
!62 = !DILocation(line: 28, column: 12, scope: !60)
!63 = !DILocation(line: 28, column: 19, scope: !60)
!64 = !DILocalVariable(name: "dest", scope: !65, file: !12, line: 30, type: !66)
!65 = distinct !DILexicalBlock(scope: !60, file: !12, line: 29, column: 5)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 100)
!69 = !DILocation(line: 30, column: 14, scope: !65)
!70 = !DILocation(line: 31, column: 9, scope: !65)
!71 = !DILocation(line: 32, column: 9, scope: !65)
!72 = !DILocation(line: 32, column: 21, scope: !65)
!73 = !DILocation(line: 34, column: 9, scope: !65)
!74 = !DILocation(line: 34, column: 23, scope: !65)
!75 = !DILocation(line: 36, column: 9, scope: !65)
!76 = !DILocation(line: 36, column: 21, scope: !65)
!77 = !DILocation(line: 37, column: 19, scope: !65)
!78 = !DILocation(line: 37, column: 9, scope: !65)
!79 = !DILocation(line: 39, column: 1, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 73, type: !20, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 75, type: !6)
!82 = !DILocation(line: 75, column: 12, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !12, line: 76, type: !6)
!84 = !DILocation(line: 76, column: 12, scope: !80)
!85 = !DILocation(line: 76, column: 33, scope: !80)
!86 = !DILocation(line: 77, column: 12, scope: !80)
!87 = !DILocation(line: 77, column: 5, scope: !80)
!88 = !DILocation(line: 78, column: 5, scope: !80)
!89 = !DILocation(line: 78, column: 23, scope: !80)
!90 = !DILocation(line: 80, column: 12, scope: !80)
!91 = !DILocation(line: 80, column: 10, scope: !80)
!92 = !DILocation(line: 81, column: 67, scope: !80)
!93 = !DILocation(line: 81, column: 65, scope: !80)
!94 = !DILocation(line: 82, column: 5, scope: !80)
!95 = !DILocation(line: 83, column: 1, scope: !80)
!96 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 60, type: !6)
!98 = !DILocation(line: 60, column: 12, scope: !96)
!99 = !DILocation(line: 60, column: 19, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 62, type: !66)
!101 = distinct !DILexicalBlock(scope: !96, file: !12, line: 61, column: 5)
!102 = !DILocation(line: 62, column: 14, scope: !101)
!103 = !DILocation(line: 63, column: 9, scope: !101)
!104 = !DILocation(line: 64, column: 9, scope: !101)
!105 = !DILocation(line: 64, column: 21, scope: !101)
!106 = !DILocation(line: 66, column: 9, scope: !101)
!107 = !DILocation(line: 66, column: 23, scope: !101)
!108 = !DILocation(line: 68, column: 9, scope: !101)
!109 = !DILocation(line: 68, column: 21, scope: !101)
!110 = !DILocation(line: 69, column: 19, scope: !101)
!111 = !DILocation(line: 69, column: 9, scope: !101)
!112 = !DILocation(line: 71, column: 1, scope: !96)
