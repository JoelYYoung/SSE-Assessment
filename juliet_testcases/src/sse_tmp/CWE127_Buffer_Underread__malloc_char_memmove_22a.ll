; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_22a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_char_memmove_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memmove_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_char_memmove_22_badGlobal, align 4, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_memmove_22_badSource(i8* %0), !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 100, i1 false), !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx2, align 1, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @printLine(i8* %arraydecay3), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_memmove_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memmove_22_good() #0 !dbg !48 {
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
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE127_Buffer_Underread__malloc_char_memmove_22_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__malloc_char_memmove_22_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i8* null, i8** %data, align 8, !dbg !73
  store i32 0, i32* @CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B1Global, align 4, !dbg !74
  %0 = load i8*, i8** %data, align 8, !dbg !75
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B1Source(i8* %0), !dbg !76
  store i8* %call, i8** %data, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !81
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  %1 = load i8*, i8** %data, align 8, !dbg !85
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 100, i1 false), !dbg !84
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx2, align 1, !dbg !87
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !88
  call void @printLine(i8* %arraydecay3), !dbg !89
  ret void, !dbg !90
}

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i8* null, i8** %data, align 8, !dbg !94
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B2Global, align 4, !dbg !95
  %0 = load i8*, i8** %data, align 8, !dbg !96
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B2Source(i8* %0), !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !102
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  %1 = load i8*, i8** %data, align 8, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 100, i1 false), !dbg !105
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx2, align 1, !dbg !108
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay3), !dbg !110
  ret void, !dbg !111
}

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_memmove_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B1Global", scope: !2, file: !10, line: 53, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_memmove_22_goodG2B2Global", scope: !2, file: !10, line: 54, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memmove_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocation(line: 31, column: 10, scope: !20)
!28 = !DILocation(line: 32, column: 63, scope: !20)
!29 = !DILocation(line: 33, column: 70, scope: !20)
!30 = !DILocation(line: 33, column: 12, scope: !20)
!31 = !DILocation(line: 33, column: 10, scope: !20)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !10, line: 35, type: !34)
!33 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 35, column: 14, scope: !33)
!38 = !DILocation(line: 36, column: 9, scope: !33)
!39 = !DILocation(line: 37, column: 9, scope: !33)
!40 = !DILocation(line: 37, column: 21, scope: !33)
!41 = !DILocation(line: 39, column: 9, scope: !33)
!42 = !DILocation(line: 39, column: 23, scope: !33)
!43 = !DILocation(line: 41, column: 9, scope: !33)
!44 = !DILocation(line: 41, column: 21, scope: !33)
!45 = !DILocation(line: 42, column: 19, scope: !33)
!46 = !DILocation(line: 42, column: 9, scope: !33)
!47 = !DILocation(line: 46, column: 1, scope: !20)
!48 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memmove_22_good", scope: !10, file: !10, line: 102, type: !21, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DILocation(line: 104, column: 5, scope: !48)
!50 = !DILocation(line: 105, column: 5, scope: !48)
!51 = !DILocation(line: 106, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 118, type: !53, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!11, !11, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !10, line: 118, type: !11)
!57 = !DILocation(line: 118, column: 14, scope: !52)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !10, line: 118, type: !55)
!59 = !DILocation(line: 118, column: 27, scope: !52)
!60 = !DILocation(line: 121, column: 22, scope: !52)
!61 = !DILocation(line: 121, column: 12, scope: !52)
!62 = !DILocation(line: 121, column: 5, scope: !52)
!63 = !DILocation(line: 123, column: 5, scope: !52)
!64 = !DILocation(line: 124, column: 5, scope: !52)
!65 = !DILocation(line: 125, column: 5, scope: !52)
!66 = !DILocation(line: 128, column: 5, scope: !52)
!67 = !DILocation(line: 129, column: 5, scope: !52)
!68 = !DILocation(line: 130, column: 5, scope: !52)
!69 = !DILocation(line: 132, column: 5, scope: !52)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocalVariable(name: "data", scope: !70, file: !10, line: 61, type: !24)
!72 = !DILocation(line: 61, column: 12, scope: !70)
!73 = !DILocation(line: 62, column: 10, scope: !70)
!74 = !DILocation(line: 63, column: 68, scope: !70)
!75 = !DILocation(line: 64, column: 75, scope: !70)
!76 = !DILocation(line: 64, column: 12, scope: !70)
!77 = !DILocation(line: 64, column: 10, scope: !70)
!78 = !DILocalVariable(name: "dest", scope: !79, file: !10, line: 66, type: !34)
!79 = distinct !DILexicalBlock(scope: !70, file: !10, line: 65, column: 5)
!80 = !DILocation(line: 66, column: 14, scope: !79)
!81 = !DILocation(line: 67, column: 9, scope: !79)
!82 = !DILocation(line: 68, column: 9, scope: !79)
!83 = !DILocation(line: 68, column: 21, scope: !79)
!84 = !DILocation(line: 70, column: 9, scope: !79)
!85 = !DILocation(line: 70, column: 23, scope: !79)
!86 = !DILocation(line: 72, column: 9, scope: !79)
!87 = !DILocation(line: 72, column: 21, scope: !79)
!88 = !DILocation(line: 73, column: 19, scope: !79)
!89 = !DILocation(line: 73, column: 9, scope: !79)
!90 = !DILocation(line: 77, column: 1, scope: !70)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 82, type: !21, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocalVariable(name: "data", scope: !91, file: !10, line: 84, type: !24)
!93 = !DILocation(line: 84, column: 12, scope: !91)
!94 = !DILocation(line: 85, column: 10, scope: !91)
!95 = !DILocation(line: 86, column: 68, scope: !91)
!96 = !DILocation(line: 87, column: 75, scope: !91)
!97 = !DILocation(line: 87, column: 12, scope: !91)
!98 = !DILocation(line: 87, column: 10, scope: !91)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !10, line: 89, type: !34)
!100 = distinct !DILexicalBlock(scope: !91, file: !10, line: 88, column: 5)
!101 = !DILocation(line: 89, column: 14, scope: !100)
!102 = !DILocation(line: 90, column: 9, scope: !100)
!103 = !DILocation(line: 91, column: 9, scope: !100)
!104 = !DILocation(line: 91, column: 21, scope: !100)
!105 = !DILocation(line: 93, column: 9, scope: !100)
!106 = !DILocation(line: 93, column: 23, scope: !100)
!107 = !DILocation(line: 95, column: 9, scope: !100)
!108 = !DILocation(line: 95, column: 21, scope: !100)
!109 = !DILocation(line: 96, column: 19, scope: !100)
!110 = !DILocation(line: 96, column: 9, scope: !100)
!111 = !DILocation(line: 100, column: 1, scope: !91)
