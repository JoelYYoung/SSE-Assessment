; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_22a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_char_memmove_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  store i32 1, i32* @CWE126_Buffer_Overread__malloc_char_memmove_22_badGlobal, align 4, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i8* @CWE126_Buffer_Overread__malloc_char_memmove_22_badSource(i8* %0), !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %call3 = call i64 @strlen(i8* %arraydecay2) #7, !dbg !44
  %mul = mul i64 %call3, 1, !dbg !45
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !41
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @printLine(i8* %arraydecay5), !dbg !49
  %2 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* %2) #8, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE126_Buffer_Overread__malloc_char_memmove_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_22_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #8, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #8, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__malloc_char_memmove_22_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__malloc_char_memmove_22_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  store i32 0, i32* @CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B1Global, align 4, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %call = call i8* @CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B1Source(i8* %0), !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !86
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !91
  %call3 = call i64 @strlen(i8* %arraydecay2) #7, !dbg !92
  %mul = mul i64 %call3, 1, !dbg !93
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !89
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx4, align 1, !dbg !95
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @printLine(i8* %arraydecay5), !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !98
  call void @free(i8* %2) #8, !dbg !99
  ret void, !dbg !100
}

declare dso_local i8* @CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i8* null, i8** %data, align 8, !dbg !104
  store i32 1, i32* @CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B2Global, align 4, !dbg !105
  %0 = load i8*, i8** %data, align 8, !dbg !106
  %call = call i8* @CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B2Source(i8* %0), !dbg !107
  store i8* %call, i8** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  %1 = load i8*, i8** %data, align 8, !dbg !116
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %call3 = call i64 @strlen(i8* %arraydecay2) #7, !dbg !118
  %mul = mul i64 %call3, 1, !dbg !119
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !115
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx4, align 1, !dbg !121
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !122
  call void @printLine(i8* %arraydecay5), !dbg !123
  %2 = load i8*, i8** %data, align 8, !dbg !124
  call void @free(i8* %2) #8, !dbg !125
  ret void, !dbg !126
}

declare dso_local i8* @CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_memmove_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B1Global", scope: !2, file: !10, line: 52, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_memmove_22_goodG2B2Global", scope: !2, file: !10, line: 53, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocation(line: 31, column: 10, scope: !20)
!28 = !DILocation(line: 32, column: 62, scope: !20)
!29 = !DILocation(line: 33, column: 69, scope: !20)
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
!41 = !DILocation(line: 40, column: 9, scope: !33)
!42 = !DILocation(line: 40, column: 23, scope: !33)
!43 = !DILocation(line: 40, column: 36, scope: !33)
!44 = !DILocation(line: 40, column: 29, scope: !33)
!45 = !DILocation(line: 40, column: 41, scope: !33)
!46 = !DILocation(line: 41, column: 9, scope: !33)
!47 = !DILocation(line: 41, column: 21, scope: !33)
!48 = !DILocation(line: 42, column: 19, scope: !33)
!49 = !DILocation(line: 42, column: 9, scope: !33)
!50 = !DILocation(line: 43, column: 14, scope: !33)
!51 = !DILocation(line: 43, column: 9, scope: !33)
!52 = !DILocation(line: 45, column: 1, scope: !20)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_22_good", scope: !10, file: !10, line: 99, type: !21, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 101, column: 5, scope: !53)
!55 = !DILocation(line: 102, column: 5, scope: !53)
!56 = !DILocation(line: 103, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 115, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!11, !11, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !10, line: 115, type: !11)
!62 = !DILocation(line: 115, column: 14, scope: !57)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !10, line: 115, type: !60)
!64 = !DILocation(line: 115, column: 27, scope: !57)
!65 = !DILocation(line: 118, column: 22, scope: !57)
!66 = !DILocation(line: 118, column: 12, scope: !57)
!67 = !DILocation(line: 118, column: 5, scope: !57)
!68 = !DILocation(line: 120, column: 5, scope: !57)
!69 = !DILocation(line: 121, column: 5, scope: !57)
!70 = !DILocation(line: 122, column: 5, scope: !57)
!71 = !DILocation(line: 125, column: 5, scope: !57)
!72 = !DILocation(line: 126, column: 5, scope: !57)
!73 = !DILocation(line: 127, column: 5, scope: !57)
!74 = !DILocation(line: 129, column: 5, scope: !57)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 60, type: !24)
!77 = !DILocation(line: 60, column: 12, scope: !75)
!78 = !DILocation(line: 61, column: 10, scope: !75)
!79 = !DILocation(line: 62, column: 67, scope: !75)
!80 = !DILocation(line: 63, column: 74, scope: !75)
!81 = !DILocation(line: 63, column: 12, scope: !75)
!82 = !DILocation(line: 63, column: 10, scope: !75)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !10, line: 65, type: !34)
!84 = distinct !DILexicalBlock(scope: !75, file: !10, line: 64, column: 5)
!85 = !DILocation(line: 65, column: 14, scope: !84)
!86 = !DILocation(line: 66, column: 9, scope: !84)
!87 = !DILocation(line: 67, column: 9, scope: !84)
!88 = !DILocation(line: 67, column: 21, scope: !84)
!89 = !DILocation(line: 70, column: 9, scope: !84)
!90 = !DILocation(line: 70, column: 23, scope: !84)
!91 = !DILocation(line: 70, column: 36, scope: !84)
!92 = !DILocation(line: 70, column: 29, scope: !84)
!93 = !DILocation(line: 70, column: 41, scope: !84)
!94 = !DILocation(line: 71, column: 9, scope: !84)
!95 = !DILocation(line: 71, column: 21, scope: !84)
!96 = !DILocation(line: 72, column: 19, scope: !84)
!97 = !DILocation(line: 72, column: 9, scope: !84)
!98 = !DILocation(line: 73, column: 14, scope: !84)
!99 = !DILocation(line: 73, column: 9, scope: !84)
!100 = !DILocation(line: 75, column: 1, scope: !75)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 80, type: !21, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !10, line: 82, type: !24)
!103 = !DILocation(line: 82, column: 12, scope: !101)
!104 = !DILocation(line: 83, column: 10, scope: !101)
!105 = !DILocation(line: 84, column: 67, scope: !101)
!106 = !DILocation(line: 85, column: 74, scope: !101)
!107 = !DILocation(line: 85, column: 12, scope: !101)
!108 = !DILocation(line: 85, column: 10, scope: !101)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !10, line: 87, type: !34)
!110 = distinct !DILexicalBlock(scope: !101, file: !10, line: 86, column: 5)
!111 = !DILocation(line: 87, column: 14, scope: !110)
!112 = !DILocation(line: 88, column: 9, scope: !110)
!113 = !DILocation(line: 89, column: 9, scope: !110)
!114 = !DILocation(line: 89, column: 21, scope: !110)
!115 = !DILocation(line: 92, column: 9, scope: !110)
!116 = !DILocation(line: 92, column: 23, scope: !110)
!117 = !DILocation(line: 92, column: 36, scope: !110)
!118 = !DILocation(line: 92, column: 29, scope: !110)
!119 = !DILocation(line: 92, column: 41, scope: !110)
!120 = !DILocation(line: 93, column: 9, scope: !110)
!121 = !DILocation(line: 93, column: 21, scope: !110)
!122 = !DILocation(line: 94, column: 19, scope: !110)
!123 = !DILocation(line: 94, column: 9, scope: !110)
!124 = !DILocation(line: 95, column: 14, scope: !110)
!125 = !DILocation(line: 95, column: 9, scope: !110)
!126 = !DILocation(line: 97, column: 1, scope: !101)
