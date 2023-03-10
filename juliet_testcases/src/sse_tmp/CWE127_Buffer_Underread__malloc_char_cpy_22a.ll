; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_22a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_char_cpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_char_cpy_22_badGlobal, align 4, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_cpy_22_badSource(i8* %0), !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !38
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %call2 = call i8* @strcpy(i8* %arraydecay1, i8* %1) #5, !dbg !43
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @printLine(i8* %arraydecay3), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_cpy_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_22_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE127_Buffer_Underread__malloc_char_cpy_22_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE127_Buffer_Underread__malloc_char_cpy_22_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i8* null, i8** %data, align 8, !dbg !72
  store i32 0, i32* @CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B1Global, align 4, !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B1Source(i8* %0), !dbg !75
  store i8* %call, i8** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !77, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !80
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !83
  %1 = load i8*, i8** %data, align 8, !dbg !84
  %call2 = call i8* @strcpy(i8* %arraydecay1, i8* %1) #5, !dbg !85
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !86
  call void @printLine(i8* %arraydecay3), !dbg !87
  ret void, !dbg !88
}

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i8* null, i8** %data, align 8, !dbg !92
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B2Global, align 4, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  %call = call i8* @CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B2Source(i8* %0), !dbg !95
  store i8* %call, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !100
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !103
  %1 = load i8*, i8** %data, align 8, !dbg !104
  %call2 = call i8* @strcpy(i8* %arraydecay1, i8* %1) #5, !dbg !105
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !106
  call void @printLine(i8* %arraydecay3), !dbg !107
  ret void, !dbg !108
}

declare dso_local i8* @CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_cpy_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B1Global", scope: !2, file: !10, line: 51, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_cpy_22_goodG2B2Global", scope: !2, file: !10, line: 52, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocation(line: 31, column: 10, scope: !20)
!28 = !DILocation(line: 32, column: 59, scope: !20)
!29 = !DILocation(line: 33, column: 66, scope: !20)
!30 = !DILocation(line: 33, column: 12, scope: !20)
!31 = !DILocation(line: 33, column: 10, scope: !20)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !10, line: 35, type: !34)
!33 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 1600, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 200)
!37 = !DILocation(line: 35, column: 14, scope: !33)
!38 = !DILocation(line: 36, column: 9, scope: !33)
!39 = !DILocation(line: 37, column: 9, scope: !33)
!40 = !DILocation(line: 37, column: 23, scope: !33)
!41 = !DILocation(line: 39, column: 16, scope: !33)
!42 = !DILocation(line: 39, column: 22, scope: !33)
!43 = !DILocation(line: 39, column: 9, scope: !33)
!44 = !DILocation(line: 40, column: 19, scope: !33)
!45 = !DILocation(line: 40, column: 9, scope: !33)
!46 = !DILocation(line: 44, column: 1, scope: !20)
!47 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_22_good", scope: !10, file: !10, line: 96, type: !21, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DILocation(line: 98, column: 5, scope: !47)
!49 = !DILocation(line: 99, column: 5, scope: !47)
!50 = !DILocation(line: 100, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 112, type: !52, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!11, !11, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !10, line: 112, type: !11)
!56 = !DILocation(line: 112, column: 14, scope: !51)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !10, line: 112, type: !54)
!58 = !DILocation(line: 112, column: 27, scope: !51)
!59 = !DILocation(line: 115, column: 22, scope: !51)
!60 = !DILocation(line: 115, column: 12, scope: !51)
!61 = !DILocation(line: 115, column: 5, scope: !51)
!62 = !DILocation(line: 117, column: 5, scope: !51)
!63 = !DILocation(line: 118, column: 5, scope: !51)
!64 = !DILocation(line: 119, column: 5, scope: !51)
!65 = !DILocation(line: 122, column: 5, scope: !51)
!66 = !DILocation(line: 123, column: 5, scope: !51)
!67 = !DILocation(line: 124, column: 5, scope: !51)
!68 = !DILocation(line: 126, column: 5, scope: !51)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocalVariable(name: "data", scope: !69, file: !10, line: 59, type: !24)
!71 = !DILocation(line: 59, column: 12, scope: !69)
!72 = !DILocation(line: 60, column: 10, scope: !69)
!73 = !DILocation(line: 61, column: 64, scope: !69)
!74 = !DILocation(line: 62, column: 71, scope: !69)
!75 = !DILocation(line: 62, column: 12, scope: !69)
!76 = !DILocation(line: 62, column: 10, scope: !69)
!77 = !DILocalVariable(name: "dest", scope: !78, file: !10, line: 64, type: !34)
!78 = distinct !DILexicalBlock(scope: !69, file: !10, line: 63, column: 5)
!79 = !DILocation(line: 64, column: 14, scope: !78)
!80 = !DILocation(line: 65, column: 9, scope: !78)
!81 = !DILocation(line: 66, column: 9, scope: !78)
!82 = !DILocation(line: 66, column: 23, scope: !78)
!83 = !DILocation(line: 68, column: 16, scope: !78)
!84 = !DILocation(line: 68, column: 22, scope: !78)
!85 = !DILocation(line: 68, column: 9, scope: !78)
!86 = !DILocation(line: 69, column: 19, scope: !78)
!87 = !DILocation(line: 69, column: 9, scope: !78)
!88 = !DILocation(line: 73, column: 1, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocalVariable(name: "data", scope: !89, file: !10, line: 80, type: !24)
!91 = !DILocation(line: 80, column: 12, scope: !89)
!92 = !DILocation(line: 81, column: 10, scope: !89)
!93 = !DILocation(line: 82, column: 64, scope: !89)
!94 = !DILocation(line: 83, column: 71, scope: !89)
!95 = !DILocation(line: 83, column: 12, scope: !89)
!96 = !DILocation(line: 83, column: 10, scope: !89)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !10, line: 85, type: !34)
!98 = distinct !DILexicalBlock(scope: !89, file: !10, line: 84, column: 5)
!99 = !DILocation(line: 85, column: 14, scope: !98)
!100 = !DILocation(line: 86, column: 9, scope: !98)
!101 = !DILocation(line: 87, column: 9, scope: !98)
!102 = !DILocation(line: 87, column: 23, scope: !98)
!103 = !DILocation(line: 89, column: 16, scope: !98)
!104 = !DILocation(line: 89, column: 22, scope: !98)
!105 = !DILocation(line: 89, column: 9, scope: !98)
!106 = !DILocation(line: 90, column: 19, scope: !98)
!107 = !DILocation(line: 90, column: 9, scope: !98)
!108 = !DILocation(line: 94, column: 1, scope: !89)
