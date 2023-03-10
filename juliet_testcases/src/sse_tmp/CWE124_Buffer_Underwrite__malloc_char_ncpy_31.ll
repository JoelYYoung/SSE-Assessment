; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !24
  store i8* %call, i8** %dataBuffer, align 8, !dbg !23
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !38, metadata !DIExpression()), !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  store i8* %4, i8** %dataCopy, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !42, metadata !DIExpression()), !dbg !43
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !44
  store i8* %5, i8** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx2, align 1, !dbg !53
  %6 = load i8*, i8** %data1, align 8, !dbg !54
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  %call4 = call i8* @strncpy(i8* %6, i8* %arraydecay3, i64 99) #6, !dbg !56
  %7 = load i8*, i8** %data1, align 8, !dbg !57
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !57
  store i8 0, i8* %arrayidx5, align 1, !dbg !58
  %8 = load i8*, i8** %data1, align 8, !dbg !59
  call void @printLine(i8* %8), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_31_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_31_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_31_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i8* null, i8** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !91
  store i8* %call, i8** %dataBuffer, align 8, !dbg !90
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  %cmp = icmp eq i8* %0, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !99
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  store i8* %3, i8** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !104, metadata !DIExpression()), !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !107
  store i8* %4, i8** %dataCopy, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !108, metadata !DIExpression()), !dbg !109
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !110
  store i8* %5, i8** %data1, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx2, align 1, !dbg !116
  %6 = load i8*, i8** %data1, align 8, !dbg !117
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !118
  %call4 = call i8* @strncpy(i8* %6, i8* %arraydecay3, i64 99) #6, !dbg !119
  %7 = load i8*, i8** %data1, align 8, !dbg !120
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !120
  store i8 0, i8* %arrayidx5, align 1, !dbg !121
  %8 = load i8*, i8** %data1, align 8, !dbg !122
  call void @printLine(i8* %8), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 28, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 5)
!23 = !DILocation(line: 28, column: 16, scope: !22)
!24 = !DILocation(line: 28, column: 37, scope: !22)
!25 = !DILocation(line: 29, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 29, column: 13)
!27 = !DILocation(line: 29, column: 24, scope: !26)
!28 = !DILocation(line: 29, column: 13, scope: !22)
!29 = !DILocation(line: 29, column: 34, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 33)
!31 = !DILocation(line: 30, column: 16, scope: !22)
!32 = !DILocation(line: 30, column: 9, scope: !22)
!33 = !DILocation(line: 31, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 27, scope: !22)
!35 = !DILocation(line: 33, column: 16, scope: !22)
!36 = !DILocation(line: 33, column: 27, scope: !22)
!37 = !DILocation(line: 33, column: 14, scope: !22)
!38 = !DILocalVariable(name: "dataCopy", scope: !39, file: !15, line: 36, type: !4)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!40 = !DILocation(line: 36, column: 16, scope: !39)
!41 = !DILocation(line: 36, column: 27, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !15, line: 37, type: !4)
!43 = !DILocation(line: 37, column: 16, scope: !39)
!44 = !DILocation(line: 37, column: 23, scope: !39)
!45 = !DILocalVariable(name: "source", scope: !46, file: !15, line: 39, type: !47)
!46 = distinct !DILexicalBlock(scope: !39, file: !15, line: 38, column: 9)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 39, column: 18, scope: !46)
!51 = !DILocation(line: 40, column: 13, scope: !46)
!52 = !DILocation(line: 41, column: 13, scope: !46)
!53 = !DILocation(line: 41, column: 27, scope: !46)
!54 = !DILocation(line: 43, column: 21, scope: !46)
!55 = !DILocation(line: 43, column: 27, scope: !46)
!56 = !DILocation(line: 43, column: 13, scope: !46)
!57 = !DILocation(line: 45, column: 13, scope: !46)
!58 = !DILocation(line: 45, column: 25, scope: !46)
!59 = !DILocation(line: 46, column: 23, scope: !46)
!60 = !DILocation(line: 46, column: 13, scope: !46)
!61 = !DILocation(line: 51, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_31_good", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 90, column: 5, scope: !62)
!64 = !DILocation(line: 91, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 102, type: !66, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !15, line: 102, type: !68)
!71 = !DILocation(line: 102, column: 14, scope: !65)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !15, line: 102, type: !69)
!73 = !DILocation(line: 102, column: 27, scope: !65)
!74 = !DILocation(line: 105, column: 22, scope: !65)
!75 = !DILocation(line: 105, column: 12, scope: !65)
!76 = !DILocation(line: 105, column: 5, scope: !65)
!77 = !DILocation(line: 107, column: 5, scope: !65)
!78 = !DILocation(line: 108, column: 5, scope: !65)
!79 = !DILocation(line: 109, column: 5, scope: !65)
!80 = !DILocation(line: 112, column: 5, scope: !65)
!81 = !DILocation(line: 113, column: 5, scope: !65)
!82 = !DILocation(line: 114, column: 5, scope: !65)
!83 = !DILocation(line: 116, column: 5, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 60, type: !4)
!86 = !DILocation(line: 60, column: 12, scope: !84)
!87 = !DILocation(line: 61, column: 10, scope: !84)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !15, line: 63, type: !4)
!89 = distinct !DILexicalBlock(scope: !84, file: !15, line: 62, column: 5)
!90 = !DILocation(line: 63, column: 16, scope: !89)
!91 = !DILocation(line: 63, column: 37, scope: !89)
!92 = !DILocation(line: 64, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 64, column: 13)
!94 = !DILocation(line: 64, column: 24, scope: !93)
!95 = !DILocation(line: 64, column: 13, scope: !89)
!96 = !DILocation(line: 64, column: 34, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 64, column: 33)
!98 = !DILocation(line: 65, column: 16, scope: !89)
!99 = !DILocation(line: 65, column: 9, scope: !89)
!100 = !DILocation(line: 66, column: 9, scope: !89)
!101 = !DILocation(line: 66, column: 27, scope: !89)
!102 = !DILocation(line: 68, column: 16, scope: !89)
!103 = !DILocation(line: 68, column: 14, scope: !89)
!104 = !DILocalVariable(name: "dataCopy", scope: !105, file: !15, line: 71, type: !4)
!105 = distinct !DILexicalBlock(scope: !84, file: !15, line: 70, column: 5)
!106 = !DILocation(line: 71, column: 16, scope: !105)
!107 = !DILocation(line: 71, column: 27, scope: !105)
!108 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 72, type: !4)
!109 = !DILocation(line: 72, column: 16, scope: !105)
!110 = !DILocation(line: 72, column: 23, scope: !105)
!111 = !DILocalVariable(name: "source", scope: !112, file: !15, line: 74, type: !47)
!112 = distinct !DILexicalBlock(scope: !105, file: !15, line: 73, column: 9)
!113 = !DILocation(line: 74, column: 18, scope: !112)
!114 = !DILocation(line: 75, column: 13, scope: !112)
!115 = !DILocation(line: 76, column: 13, scope: !112)
!116 = !DILocation(line: 76, column: 27, scope: !112)
!117 = !DILocation(line: 78, column: 21, scope: !112)
!118 = !DILocation(line: 78, column: 27, scope: !112)
!119 = !DILocation(line: 78, column: 13, scope: !112)
!120 = !DILocation(line: 80, column: 13, scope: !112)
!121 = !DILocation(line: 80, column: 25, scope: !112)
!122 = !DILocation(line: 81, column: 23, scope: !112)
!123 = !DILocation(line: 81, column: 13, scope: !112)
!124 = !DILocation(line: 86, column: 1, scope: !84)
