; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_42.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  %call3 = call i64 @strlen(i8* %arraydecay2) #8, !dbg !36
  %mul = mul i64 %call3, 1, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !33
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx4, align 1, !dbg !39
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @printLine(i8* %arraydecay5), !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  call void @free(i8* %2) #9, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call noalias align 16 i8* @malloc(i64 50) #9, !dbg !50
  store i8* %call, i8** %data.addr, align 8, !dbg !51
  %0 = load i8*, i8** %data.addr, align 8, !dbg !52
  %cmp = icmp eq i8* %0, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #10, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !59
  %2 = load i8*, i8** %data.addr, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !60
  store i8 0, i8* %arrayidx, align 1, !dbg !61
  %3 = load i8*, i8** %data.addr, align 8, !dbg !62
  ret i8* %3, !dbg !63
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memmove_42_good() #0 !dbg !64 {
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
  %call = call i64 @time(i64* null) #9, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #9, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__malloc_char_memmove_42_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__malloc_char_memmove_42_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #6

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %call = call i8* @goodG2BSource(i8* %0), !dbg !91
  store i8* %call, i8** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  %1 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  %call3 = call i64 @strlen(i8* %arraydecay2) #8, !dbg !102
  %mul = mul i64 %call3, 1, !dbg !103
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %1, i64 %mul, i1 false), !dbg !99
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx4, align 1, !dbg !105
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  call void @printLine(i8* %arraydecay5), !dbg !107
  %2 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* %2) #9, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !111 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 100) #9, !dbg !114
  store i8* %call, i8** %data.addr, align 8, !dbg !115
  %0 = load i8*, i8** %data.addr, align 8, !dbg !116
  %cmp = icmp eq i8* %0, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #10, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !123
  %2 = load i8*, i8** %data.addr, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  %3 = load i8*, i8** %data.addr, align 8, !dbg !126
  ret i8* %3, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_42.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_42_bad", scope: !15, file: !15, line: 33, type: !16, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memmove_42.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 35, type: !5)
!19 = !DILocation(line: 35, column: 12, scope: !14)
!20 = !DILocation(line: 36, column: 10, scope: !14)
!21 = !DILocation(line: 37, column: 22, scope: !14)
!22 = !DILocation(line: 37, column: 12, scope: !14)
!23 = !DILocation(line: 37, column: 10, scope: !14)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !15, line: 39, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 39, column: 14, scope: !25)
!30 = !DILocation(line: 40, column: 9, scope: !25)
!31 = !DILocation(line: 41, column: 9, scope: !25)
!32 = !DILocation(line: 41, column: 21, scope: !25)
!33 = !DILocation(line: 44, column: 9, scope: !25)
!34 = !DILocation(line: 44, column: 23, scope: !25)
!35 = !DILocation(line: 44, column: 36, scope: !25)
!36 = !DILocation(line: 44, column: 29, scope: !25)
!37 = !DILocation(line: 44, column: 41, scope: !25)
!38 = !DILocation(line: 45, column: 9, scope: !25)
!39 = !DILocation(line: 45, column: 21, scope: !25)
!40 = !DILocation(line: 46, column: 19, scope: !25)
!41 = !DILocation(line: 46, column: 9, scope: !25)
!42 = !DILocation(line: 47, column: 14, scope: !25)
!43 = !DILocation(line: 47, column: 9, scope: !25)
!44 = !DILocation(line: 49, column: 1, scope: !14)
!45 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !46, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!5, !5}
!48 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !15, line: 23, type: !5)
!49 = !DILocation(line: 23, column: 32, scope: !45)
!50 = !DILocation(line: 26, column: 20, scope: !45)
!51 = !DILocation(line: 26, column: 10, scope: !45)
!52 = !DILocation(line: 27, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !15, line: 27, column: 9)
!54 = !DILocation(line: 27, column: 14, scope: !53)
!55 = !DILocation(line: 27, column: 9, scope: !45)
!56 = !DILocation(line: 27, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !15, line: 27, column: 23)
!58 = !DILocation(line: 28, column: 12, scope: !45)
!59 = !DILocation(line: 28, column: 5, scope: !45)
!60 = !DILocation(line: 29, column: 5, scope: !45)
!61 = !DILocation(line: 29, column: 16, scope: !45)
!62 = !DILocation(line: 30, column: 12, scope: !45)
!63 = !DILocation(line: 30, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_42_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 86, column: 5, scope: !64)
!66 = !DILocation(line: 87, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !68, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 99, type: !70)
!73 = !DILocation(line: 99, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 99, type: !71)
!75 = !DILocation(line: 99, column: 27, scope: !67)
!76 = !DILocation(line: 102, column: 22, scope: !67)
!77 = !DILocation(line: 102, column: 12, scope: !67)
!78 = !DILocation(line: 102, column: 5, scope: !67)
!79 = !DILocation(line: 104, column: 5, scope: !67)
!80 = !DILocation(line: 105, column: 5, scope: !67)
!81 = !DILocation(line: 106, column: 5, scope: !67)
!82 = !DILocation(line: 109, column: 5, scope: !67)
!83 = !DILocation(line: 110, column: 5, scope: !67)
!84 = !DILocation(line: 111, column: 5, scope: !67)
!85 = !DILocation(line: 113, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 68, type: !5)
!88 = !DILocation(line: 68, column: 12, scope: !86)
!89 = !DILocation(line: 69, column: 10, scope: !86)
!90 = !DILocation(line: 70, column: 26, scope: !86)
!91 = !DILocation(line: 70, column: 12, scope: !86)
!92 = !DILocation(line: 70, column: 10, scope: !86)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !15, line: 72, type: !26)
!94 = distinct !DILexicalBlock(scope: !86, file: !15, line: 71, column: 5)
!95 = !DILocation(line: 72, column: 14, scope: !94)
!96 = !DILocation(line: 73, column: 9, scope: !94)
!97 = !DILocation(line: 74, column: 9, scope: !94)
!98 = !DILocation(line: 74, column: 21, scope: !94)
!99 = !DILocation(line: 77, column: 9, scope: !94)
!100 = !DILocation(line: 77, column: 23, scope: !94)
!101 = !DILocation(line: 77, column: 36, scope: !94)
!102 = !DILocation(line: 77, column: 29, scope: !94)
!103 = !DILocation(line: 77, column: 41, scope: !94)
!104 = !DILocation(line: 78, column: 9, scope: !94)
!105 = !DILocation(line: 78, column: 21, scope: !94)
!106 = !DILocation(line: 79, column: 19, scope: !94)
!107 = !DILocation(line: 79, column: 9, scope: !94)
!108 = !DILocation(line: 80, column: 14, scope: !94)
!109 = !DILocation(line: 80, column: 9, scope: !94)
!110 = !DILocation(line: 82, column: 1, scope: !86)
!111 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 55, type: !46, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", arg: 1, scope: !111, file: !15, line: 55, type: !5)
!113 = !DILocation(line: 55, column: 36, scope: !111)
!114 = !DILocation(line: 58, column: 20, scope: !111)
!115 = !DILocation(line: 58, column: 10, scope: !111)
!116 = !DILocation(line: 59, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !15, line: 59, column: 9)
!118 = !DILocation(line: 59, column: 14, scope: !117)
!119 = !DILocation(line: 59, column: 9, scope: !111)
!120 = !DILocation(line: 59, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 59, column: 23)
!122 = !DILocation(line: 60, column: 12, scope: !111)
!123 = !DILocation(line: 60, column: 5, scope: !111)
!124 = !DILocation(line: 61, column: 5, scope: !111)
!125 = !DILocation(line: 61, column: 17, scope: !111)
!126 = !DILocation(line: 62, column: 12, scope: !111)
!127 = !DILocation(line: 62, column: 5, scope: !111)
