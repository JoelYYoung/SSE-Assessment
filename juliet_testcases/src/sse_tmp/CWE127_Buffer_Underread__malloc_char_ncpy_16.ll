; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_16.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !26
  store i8* %call, i8** %dataBuffer, align 8, !dbg !25
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  br label %while.end, !dbg !40

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx1, align 1, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %4 = load i8*, i8** %data, align 8, !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !53
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !54
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx6, align 1, !dbg !56
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @printLine(i8* %arraydecay7), !dbg !58
  ret void, !dbg !59
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_16_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_16_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_16_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  br label %while.body, !dbg !86

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !91
  store i8* %call, i8** %dataBuffer, align 8, !dbg !90
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  %cmp = icmp eq i8* %0, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !99
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  store i8* %3, i8** %data, align 8, !dbg !103
  br label %while.end, !dbg !104

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx1, align 1, !dbg !110
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !114
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !115
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx6, align 1, !dbg !117
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  call void @printLine(i8* %arraydecay7), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_16_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !15, line: 30, type: !4)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 29, column: 9)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!25 = !DILocation(line: 30, column: 20, scope: !23)
!26 = !DILocation(line: 30, column: 41, scope: !23)
!27 = !DILocation(line: 31, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !15, line: 31, column: 17)
!29 = !DILocation(line: 31, column: 28, scope: !28)
!30 = !DILocation(line: 31, column: 17, scope: !23)
!31 = !DILocation(line: 31, column: 38, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 37)
!33 = !DILocation(line: 32, column: 20, scope: !23)
!34 = !DILocation(line: 32, column: 13, scope: !23)
!35 = !DILocation(line: 33, column: 13, scope: !23)
!36 = !DILocation(line: 33, column: 31, scope: !23)
!37 = !DILocation(line: 35, column: 20, scope: !23)
!38 = !DILocation(line: 35, column: 31, scope: !23)
!39 = !DILocation(line: 35, column: 18, scope: !23)
!40 = !DILocation(line: 37, column: 9, scope: !24)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !15, line: 40, type: !43)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 40, column: 14, scope: !42)
!47 = !DILocation(line: 41, column: 9, scope: !42)
!48 = !DILocation(line: 42, column: 9, scope: !42)
!49 = !DILocation(line: 42, column: 21, scope: !42)
!50 = !DILocation(line: 44, column: 17, scope: !42)
!51 = !DILocation(line: 44, column: 23, scope: !42)
!52 = !DILocation(line: 44, column: 36, scope: !42)
!53 = !DILocation(line: 44, column: 29, scope: !42)
!54 = !DILocation(line: 44, column: 9, scope: !42)
!55 = !DILocation(line: 46, column: 9, scope: !42)
!56 = !DILocation(line: 46, column: 21, scope: !42)
!57 = !DILocation(line: 47, column: 19, scope: !42)
!58 = !DILocation(line: 47, column: 9, scope: !42)
!59 = !DILocation(line: 51, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_16_good", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 90, column: 5, scope: !60)
!62 = !DILocation(line: 91, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 103, type: !64, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 103, type: !66)
!69 = !DILocation(line: 103, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 103, type: !67)
!71 = !DILocation(line: 103, column: 27, scope: !63)
!72 = !DILocation(line: 106, column: 22, scope: !63)
!73 = !DILocation(line: 106, column: 12, scope: !63)
!74 = !DILocation(line: 106, column: 5, scope: !63)
!75 = !DILocation(line: 108, column: 5, scope: !63)
!76 = !DILocation(line: 109, column: 5, scope: !63)
!77 = !DILocation(line: 110, column: 5, scope: !63)
!78 = !DILocation(line: 113, column: 5, scope: !63)
!79 = !DILocation(line: 114, column: 5, scope: !63)
!80 = !DILocation(line: 115, column: 5, scope: !63)
!81 = !DILocation(line: 117, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 60, type: !4)
!84 = !DILocation(line: 60, column: 12, scope: !82)
!85 = !DILocation(line: 61, column: 10, scope: !82)
!86 = !DILocation(line: 62, column: 5, scope: !82)
!87 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !15, line: 65, type: !4)
!88 = distinct !DILexicalBlock(scope: !89, file: !15, line: 64, column: 9)
!89 = distinct !DILexicalBlock(scope: !82, file: !15, line: 63, column: 5)
!90 = !DILocation(line: 65, column: 20, scope: !88)
!91 = !DILocation(line: 65, column: 41, scope: !88)
!92 = !DILocation(line: 66, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !15, line: 66, column: 17)
!94 = !DILocation(line: 66, column: 28, scope: !93)
!95 = !DILocation(line: 66, column: 17, scope: !88)
!96 = !DILocation(line: 66, column: 38, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 66, column: 37)
!98 = !DILocation(line: 67, column: 20, scope: !88)
!99 = !DILocation(line: 67, column: 13, scope: !88)
!100 = !DILocation(line: 68, column: 13, scope: !88)
!101 = !DILocation(line: 68, column: 31, scope: !88)
!102 = !DILocation(line: 70, column: 20, scope: !88)
!103 = !DILocation(line: 70, column: 18, scope: !88)
!104 = !DILocation(line: 72, column: 9, scope: !89)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !15, line: 75, type: !43)
!106 = distinct !DILexicalBlock(scope: !82, file: !15, line: 74, column: 5)
!107 = !DILocation(line: 75, column: 14, scope: !106)
!108 = !DILocation(line: 76, column: 9, scope: !106)
!109 = !DILocation(line: 77, column: 9, scope: !106)
!110 = !DILocation(line: 77, column: 21, scope: !106)
!111 = !DILocation(line: 79, column: 17, scope: !106)
!112 = !DILocation(line: 79, column: 23, scope: !106)
!113 = !DILocation(line: 79, column: 36, scope: !106)
!114 = !DILocation(line: 79, column: 29, scope: !106)
!115 = !DILocation(line: 79, column: 9, scope: !106)
!116 = !DILocation(line: 81, column: 9, scope: !106)
!117 = !DILocation(line: 81, column: 21, scope: !106)
!118 = !DILocation(line: 82, column: 19, scope: !106)
!119 = !DILocation(line: 82, column: 9, scope: !106)
!120 = !DILocation(line: 86, column: 1, scope: !82)
