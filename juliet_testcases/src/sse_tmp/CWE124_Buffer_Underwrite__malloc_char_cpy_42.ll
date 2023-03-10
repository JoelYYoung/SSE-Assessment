; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_42.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !34
  %call2 = call i8* @strcpy(i8* %1, i8* %arraydecay1) #6, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* %2), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !44, metadata !DIExpression()), !dbg !46
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !47
  store i8* %call, i8** %dataBuffer, align 8, !dbg !46
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !48
  %cmp = icmp eq i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !55
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !56
  store i8 0, i8* %arrayidx, align 1, !dbg !57
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !58
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !59
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !60
  %4 = load i8*, i8** %data.addr, align 8, !dbg !61
  ret i8* %4, !dbg !62
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_42_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_42_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_42_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %call = call i8* @goodG2BSource(i8* %0), !dbg !90
  store i8* %call, i8** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !95
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %1 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  %call2 = call i8* @strcpy(i8* %1, i8* %arraydecay1) #6, !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %2), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !104 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !110
  store i8* %call, i8** %dataBuffer, align 8, !dbg !109
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  %cmp = icmp eq i8* %0, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !118
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !121
  store i8* %3, i8** %data.addr, align 8, !dbg !122
  %4 = load i8*, i8** %data.addr, align 8, !dbg !123
  ret i8* %4, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_42_bad", scope: !15, file: !15, line: 36, type: !16, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 38, type: !5)
!19 = !DILocation(line: 38, column: 12, scope: !14)
!20 = !DILocation(line: 39, column: 10, scope: !14)
!21 = !DILocation(line: 40, column: 22, scope: !14)
!22 = !DILocation(line: 40, column: 12, scope: !14)
!23 = !DILocation(line: 40, column: 10, scope: !14)
!24 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 42, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 42, column: 14, scope: !25)
!30 = !DILocation(line: 43, column: 9, scope: !25)
!31 = !DILocation(line: 44, column: 9, scope: !25)
!32 = !DILocation(line: 44, column: 23, scope: !25)
!33 = !DILocation(line: 46, column: 16, scope: !25)
!34 = !DILocation(line: 46, column: 22, scope: !25)
!35 = !DILocation(line: 46, column: 9, scope: !25)
!36 = !DILocation(line: 47, column: 19, scope: !25)
!37 = !DILocation(line: 47, column: 9, scope: !25)
!38 = !DILocation(line: 51, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !40, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!5, !5}
!42 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !15, line: 23, type: !5)
!43 = !DILocation(line: 23, column: 32, scope: !39)
!44 = !DILocalVariable(name: "dataBuffer", scope: !45, file: !15, line: 26, type: !5)
!45 = distinct !DILexicalBlock(scope: !39, file: !15, line: 25, column: 5)
!46 = !DILocation(line: 26, column: 16, scope: !45)
!47 = !DILocation(line: 26, column: 37, scope: !45)
!48 = !DILocation(line: 27, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !15, line: 27, column: 13)
!50 = !DILocation(line: 27, column: 24, scope: !49)
!51 = !DILocation(line: 27, column: 13, scope: !45)
!52 = !DILocation(line: 27, column: 34, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 27, column: 33)
!54 = !DILocation(line: 28, column: 16, scope: !45)
!55 = !DILocation(line: 28, column: 9, scope: !45)
!56 = !DILocation(line: 29, column: 9, scope: !45)
!57 = !DILocation(line: 29, column: 27, scope: !45)
!58 = !DILocation(line: 31, column: 16, scope: !45)
!59 = !DILocation(line: 31, column: 27, scope: !45)
!60 = !DILocation(line: 31, column: 14, scope: !45)
!61 = !DILocation(line: 33, column: 12, scope: !39)
!62 = !DILocation(line: 33, column: 5, scope: !39)
!63 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_42_good", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 90, column: 5, scope: !63)
!65 = !DILocation(line: 91, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 103, type: !67, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !15, line: 103, type: !69)
!72 = !DILocation(line: 103, column: 14, scope: !66)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !15, line: 103, type: !70)
!74 = !DILocation(line: 103, column: 27, scope: !66)
!75 = !DILocation(line: 106, column: 22, scope: !66)
!76 = !DILocation(line: 106, column: 12, scope: !66)
!77 = !DILocation(line: 106, column: 5, scope: !66)
!78 = !DILocation(line: 108, column: 5, scope: !66)
!79 = !DILocation(line: 109, column: 5, scope: !66)
!80 = !DILocation(line: 110, column: 5, scope: !66)
!81 = !DILocation(line: 113, column: 5, scope: !66)
!82 = !DILocation(line: 114, column: 5, scope: !66)
!83 = !DILocation(line: 115, column: 5, scope: !66)
!84 = !DILocation(line: 117, column: 5, scope: !66)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 71, type: !16, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 73, type: !5)
!87 = !DILocation(line: 73, column: 12, scope: !85)
!88 = !DILocation(line: 74, column: 10, scope: !85)
!89 = !DILocation(line: 75, column: 26, scope: !85)
!90 = !DILocation(line: 75, column: 12, scope: !85)
!91 = !DILocation(line: 75, column: 10, scope: !85)
!92 = !DILocalVariable(name: "source", scope: !93, file: !15, line: 77, type: !26)
!93 = distinct !DILexicalBlock(scope: !85, file: !15, line: 76, column: 5)
!94 = !DILocation(line: 77, column: 14, scope: !93)
!95 = !DILocation(line: 78, column: 9, scope: !93)
!96 = !DILocation(line: 79, column: 9, scope: !93)
!97 = !DILocation(line: 79, column: 23, scope: !93)
!98 = !DILocation(line: 81, column: 16, scope: !93)
!99 = !DILocation(line: 81, column: 22, scope: !93)
!100 = !DILocation(line: 81, column: 9, scope: !93)
!101 = !DILocation(line: 82, column: 19, scope: !93)
!102 = !DILocation(line: 82, column: 9, scope: !93)
!103 = !DILocation(line: 86, column: 1, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 57, type: !40, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", arg: 1, scope: !104, file: !15, line: 57, type: !5)
!106 = !DILocation(line: 57, column: 36, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !15, line: 60, type: !5)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 59, column: 5)
!109 = !DILocation(line: 60, column: 16, scope: !108)
!110 = !DILocation(line: 60, column: 37, scope: !108)
!111 = !DILocation(line: 61, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 61, column: 13)
!113 = !DILocation(line: 61, column: 24, scope: !112)
!114 = !DILocation(line: 61, column: 13, scope: !108)
!115 = !DILocation(line: 61, column: 34, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 61, column: 33)
!117 = !DILocation(line: 62, column: 16, scope: !108)
!118 = !DILocation(line: 62, column: 9, scope: !108)
!119 = !DILocation(line: 63, column: 9, scope: !108)
!120 = !DILocation(line: 63, column: 27, scope: !108)
!121 = !DILocation(line: 65, column: 16, scope: !108)
!122 = !DILocation(line: 65, column: 14, scope: !108)
!123 = !DILocation(line: 67, column: 12, scope: !104)
!124 = !DILocation(line: 67, column: 5, scope: !104)
