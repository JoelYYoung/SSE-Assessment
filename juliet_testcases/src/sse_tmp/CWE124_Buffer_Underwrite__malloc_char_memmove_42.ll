; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_42.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_42_bad() #0 !dbg !14 {
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx2, align 1, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* %3), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !45, metadata !DIExpression()), !dbg !47
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !48
  store i8* %call, i8** %dataBuffer, align 8, !dbg !47
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !49
  %cmp = icmp eq i8* %0, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !53
  unreachable, !dbg !53

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !56
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !57
  store i8 0, i8* %arrayidx, align 1, !dbg !58
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !59
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !60
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !61
  %4 = load i8*, i8** %data.addr, align 8, !dbg !62
  ret i8* %4, !dbg !63
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_42_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #7, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #7, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_42_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_42_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %call = call i8* @goodG2BSource(i8* %0), !dbg !91
  store i8* %call, i8** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %1 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !101
  store i8 0, i8* %arrayidx2, align 1, !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %3), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !106 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !111
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !112
  store i8* %call, i8** %dataBuffer, align 8, !dbg !111
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !113
  %cmp = icmp eq i8* %0, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !120
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !123
  store i8* %3, i8** %data.addr, align 8, !dbg !124
  %4 = load i8*, i8** %data.addr, align 8, !dbg !125
  ret i8* %4, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_42_bad", scope: !15, file: !15, line: 36, type: !16, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocation(line: 46, column: 17, scope: !25)
!34 = !DILocation(line: 46, column: 9, scope: !25)
!35 = !DILocation(line: 48, column: 9, scope: !25)
!36 = !DILocation(line: 48, column: 21, scope: !25)
!37 = !DILocation(line: 49, column: 19, scope: !25)
!38 = !DILocation(line: 49, column: 9, scope: !25)
!39 = !DILocation(line: 53, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !41, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!5, !5}
!43 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !15, line: 23, type: !5)
!44 = !DILocation(line: 23, column: 32, scope: !40)
!45 = !DILocalVariable(name: "dataBuffer", scope: !46, file: !15, line: 26, type: !5)
!46 = distinct !DILexicalBlock(scope: !40, file: !15, line: 25, column: 5)
!47 = !DILocation(line: 26, column: 16, scope: !46)
!48 = !DILocation(line: 26, column: 37, scope: !46)
!49 = !DILocation(line: 27, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 27, column: 13)
!51 = !DILocation(line: 27, column: 24, scope: !50)
!52 = !DILocation(line: 27, column: 13, scope: !46)
!53 = !DILocation(line: 27, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 27, column: 33)
!55 = !DILocation(line: 28, column: 16, scope: !46)
!56 = !DILocation(line: 28, column: 9, scope: !46)
!57 = !DILocation(line: 29, column: 9, scope: !46)
!58 = !DILocation(line: 29, column: 27, scope: !46)
!59 = !DILocation(line: 31, column: 16, scope: !46)
!60 = !DILocation(line: 31, column: 27, scope: !46)
!61 = !DILocation(line: 31, column: 14, scope: !46)
!62 = !DILocation(line: 33, column: 12, scope: !40)
!63 = !DILocation(line: 33, column: 5, scope: !40)
!64 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_42_good", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 94, column: 5, scope: !64)
!66 = !DILocation(line: 95, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 107, type: !68, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 107, type: !70)
!73 = !DILocation(line: 107, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 107, type: !71)
!75 = !DILocation(line: 107, column: 27, scope: !67)
!76 = !DILocation(line: 110, column: 22, scope: !67)
!77 = !DILocation(line: 110, column: 12, scope: !67)
!78 = !DILocation(line: 110, column: 5, scope: !67)
!79 = !DILocation(line: 112, column: 5, scope: !67)
!80 = !DILocation(line: 113, column: 5, scope: !67)
!81 = !DILocation(line: 114, column: 5, scope: !67)
!82 = !DILocation(line: 117, column: 5, scope: !67)
!83 = !DILocation(line: 118, column: 5, scope: !67)
!84 = !DILocation(line: 119, column: 5, scope: !67)
!85 = !DILocation(line: 121, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 73, type: !16, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 75, type: !5)
!88 = !DILocation(line: 75, column: 12, scope: !86)
!89 = !DILocation(line: 76, column: 10, scope: !86)
!90 = !DILocation(line: 77, column: 26, scope: !86)
!91 = !DILocation(line: 77, column: 12, scope: !86)
!92 = !DILocation(line: 77, column: 10, scope: !86)
!93 = !DILocalVariable(name: "source", scope: !94, file: !15, line: 79, type: !26)
!94 = distinct !DILexicalBlock(scope: !86, file: !15, line: 78, column: 5)
!95 = !DILocation(line: 79, column: 14, scope: !94)
!96 = !DILocation(line: 80, column: 9, scope: !94)
!97 = !DILocation(line: 81, column: 9, scope: !94)
!98 = !DILocation(line: 81, column: 23, scope: !94)
!99 = !DILocation(line: 83, column: 17, scope: !94)
!100 = !DILocation(line: 83, column: 9, scope: !94)
!101 = !DILocation(line: 85, column: 9, scope: !94)
!102 = !DILocation(line: 85, column: 21, scope: !94)
!103 = !DILocation(line: 86, column: 19, scope: !94)
!104 = !DILocation(line: 86, column: 9, scope: !94)
!105 = !DILocation(line: 90, column: 1, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 59, type: !41, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", arg: 1, scope: !106, file: !15, line: 59, type: !5)
!108 = !DILocation(line: 59, column: 36, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !15, line: 62, type: !5)
!110 = distinct !DILexicalBlock(scope: !106, file: !15, line: 61, column: 5)
!111 = !DILocation(line: 62, column: 16, scope: !110)
!112 = !DILocation(line: 62, column: 37, scope: !110)
!113 = !DILocation(line: 63, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 63, column: 13)
!115 = !DILocation(line: 63, column: 24, scope: !114)
!116 = !DILocation(line: 63, column: 13, scope: !110)
!117 = !DILocation(line: 63, column: 34, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 63, column: 33)
!119 = !DILocation(line: 64, column: 16, scope: !110)
!120 = !DILocation(line: 64, column: 9, scope: !110)
!121 = !DILocation(line: 65, column: 9, scope: !110)
!122 = !DILocation(line: 65, column: 27, scope: !110)
!123 = !DILocation(line: 67, column: 16, scope: !110)
!124 = !DILocation(line: 67, column: 14, scope: !110)
!125 = !DILocation(line: 69, column: 12, scope: !106)
!126 = !DILocation(line: 69, column: 5, scope: !106)
