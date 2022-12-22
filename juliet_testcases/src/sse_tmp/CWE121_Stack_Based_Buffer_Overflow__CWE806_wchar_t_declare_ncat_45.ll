; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_goodG2BData = internal global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !34
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %2 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_badData, align 8, !dbg !67
  store i32* %0, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !68, metadata !DIExpression()), !dbg !73
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !73
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !74
  %2 = load i32*, i32** %data, align 8, !dbg !75
  %3 = load i32*, i32** %data, align 8, !dbg !76
  %call = call i64 @wcslen(i32* %3) #7, !dbg !77
  %call1 = call i32* @wcsncat(i32* %arraydecay, i32* %2, i64 %call) #6, !dbg !78
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  %4 = load i32*, i32** %data, align 8, !dbg !81
  call void @printWLine(i32* %4), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !89
  store i32* %arraydecay, i32** %data, align 8, !dbg !90
  %0 = load i32*, i32** %data, align 8, !dbg !91
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %2 = load i32*, i32** %data, align 8, !dbg !95
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_goodG2BData, align 8, !dbg !96
  call void @goodG2BSink(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_goodG2BData, align 8, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !106
  %2 = load i32*, i32** %data, align 8, !dbg !107
  %3 = load i32*, i32** %data, align 8, !dbg !108
  %call = call i64 @wcslen(i32* %3) #7, !dbg !109
  %call1 = call i32* @wcsncat(i32* %arraydecay, i32* %2, i64 %call) #6, !dbg !110
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %4 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %4), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_bad", scope: !10, file: !10, line: 38, type: !22, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 40, type: !11)
!25 = !DILocation(line: 40, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !10, line: 41, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 41, column: 13, scope: !21)
!31 = !DILocation(line: 42, column: 12, scope: !21)
!32 = !DILocation(line: 42, column: 10, scope: !21)
!33 = !DILocation(line: 44, column: 13, scope: !21)
!34 = !DILocation(line: 44, column: 5, scope: !21)
!35 = !DILocation(line: 45, column: 5, scope: !21)
!36 = !DILocation(line: 45, column: 17, scope: !21)
!37 = !DILocation(line: 46, column: 82, scope: !21)
!38 = !DILocation(line: 46, column: 80, scope: !21)
!39 = !DILocation(line: 47, column: 5, scope: !21)
!40 = !DILocation(line: 48, column: 1, scope: !21)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_45_good", scope: !10, file: !10, line: 79, type: !22, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 81, column: 5, scope: !41)
!43 = !DILocation(line: 82, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 93, type: !45, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!14, !14, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !10, line: 93, type: !14)
!51 = !DILocation(line: 93, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !10, line: 93, type: !47)
!53 = !DILocation(line: 93, column: 27, scope: !44)
!54 = !DILocation(line: 96, column: 22, scope: !44)
!55 = !DILocation(line: 96, column: 12, scope: !44)
!56 = !DILocation(line: 96, column: 5, scope: !44)
!57 = !DILocation(line: 98, column: 5, scope: !44)
!58 = !DILocation(line: 99, column: 5, scope: !44)
!59 = !DILocation(line: 100, column: 5, scope: !44)
!60 = !DILocation(line: 103, column: 5, scope: !44)
!61 = !DILocation(line: 104, column: 5, scope: !44)
!62 = !DILocation(line: 105, column: 5, scope: !44)
!63 = !DILocation(line: 107, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 28, type: !11)
!66 = !DILocation(line: 28, column: 15, scope: !64)
!67 = !DILocation(line: 28, column: 22, scope: !64)
!68 = !DILocalVariable(name: "dest", scope: !69, file: !10, line: 30, type: !70)
!69 = distinct !DILexicalBlock(scope: !64, file: !10, line: 29, column: 5)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 50)
!73 = !DILocation(line: 30, column: 17, scope: !69)
!74 = !DILocation(line: 32, column: 17, scope: !69)
!75 = !DILocation(line: 32, column: 23, scope: !69)
!76 = !DILocation(line: 32, column: 36, scope: !69)
!77 = !DILocation(line: 32, column: 29, scope: !69)
!78 = !DILocation(line: 32, column: 9, scope: !69)
!79 = !DILocation(line: 33, column: 9, scope: !69)
!80 = !DILocation(line: 33, column: 20, scope: !69)
!81 = !DILocation(line: 34, column: 20, scope: !69)
!82 = !DILocation(line: 34, column: 9, scope: !69)
!83 = !DILocation(line: 36, column: 1, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 67, type: !22, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocalVariable(name: "data", scope: !84, file: !10, line: 69, type: !11)
!86 = !DILocation(line: 69, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !10, line: 70, type: !27)
!88 = !DILocation(line: 70, column: 13, scope: !84)
!89 = !DILocation(line: 71, column: 12, scope: !84)
!90 = !DILocation(line: 71, column: 10, scope: !84)
!91 = !DILocation(line: 73, column: 13, scope: !84)
!92 = !DILocation(line: 73, column: 5, scope: !84)
!93 = !DILocation(line: 74, column: 5, scope: !84)
!94 = !DILocation(line: 74, column: 16, scope: !84)
!95 = !DILocation(line: 75, column: 86, scope: !84)
!96 = !DILocation(line: 75, column: 84, scope: !84)
!97 = !DILocation(line: 76, column: 5, scope: !84)
!98 = !DILocation(line: 77, column: 1, scope: !84)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 55, type: !22, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 57, type: !11)
!101 = !DILocation(line: 57, column: 15, scope: !99)
!102 = !DILocation(line: 57, column: 22, scope: !99)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !10, line: 59, type: !70)
!104 = distinct !DILexicalBlock(scope: !99, file: !10, line: 58, column: 5)
!105 = !DILocation(line: 59, column: 17, scope: !104)
!106 = !DILocation(line: 61, column: 17, scope: !104)
!107 = !DILocation(line: 61, column: 23, scope: !104)
!108 = !DILocation(line: 61, column: 36, scope: !104)
!109 = !DILocation(line: 61, column: 29, scope: !104)
!110 = !DILocation(line: 61, column: 9, scope: !104)
!111 = !DILocation(line: 62, column: 9, scope: !104)
!112 = !DILocation(line: 62, column: 20, scope: !104)
!113 = !DILocation(line: 63, column: 20, scope: !104)
!114 = !DILocation(line: 63, column: 9, scope: !104)
!115 = !DILocation(line: 65, column: 1, scope: !99)
