; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_18.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !27
  store i8* %call, i8** %dataBuffer, align 8, !dbg !26
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !35
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !39
  store i8* %add.ptr, i8** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx2, align 1, !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !51
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #6, !dbg !52
  %5 = load i8*, i8** %data, align 8, !dbg !53
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %6 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* %6), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_18_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_18_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_18_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  br label %source, !dbg !84

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !85), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !89
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !90
  store i8* %call, i8** %dataBuffer, align 8, !dbg !89
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !91
  %cmp = icmp eq i8* %0, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !98
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  store i8* %3, i8** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx2, align 1, !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !109
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !110
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #6, !dbg !111
  %5 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !112
  store i8 0, i8* %arrayidx5, align 1, !dbg !113
  %6 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %6), !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_18_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !15, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!26 = !DILocation(line: 30, column: 16, scope: !25)
!27 = !DILocation(line: 30, column: 37, scope: !25)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 24, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !25)
!32 = !DILocation(line: 31, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 31, column: 33)
!34 = !DILocation(line: 32, column: 16, scope: !25)
!35 = !DILocation(line: 32, column: 9, scope: !25)
!36 = !DILocation(line: 33, column: 9, scope: !25)
!37 = !DILocation(line: 33, column: 27, scope: !25)
!38 = !DILocation(line: 35, column: 16, scope: !25)
!39 = !DILocation(line: 35, column: 27, scope: !25)
!40 = !DILocation(line: 35, column: 14, scope: !25)
!41 = !DILocalVariable(name: "source", scope: !42, file: !15, line: 38, type: !43)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 38, column: 14, scope: !42)
!47 = !DILocation(line: 39, column: 9, scope: !42)
!48 = !DILocation(line: 40, column: 9, scope: !42)
!49 = !DILocation(line: 40, column: 23, scope: !42)
!50 = !DILocation(line: 42, column: 17, scope: !42)
!51 = !DILocation(line: 42, column: 23, scope: !42)
!52 = !DILocation(line: 42, column: 9, scope: !42)
!53 = !DILocation(line: 44, column: 9, scope: !42)
!54 = !DILocation(line: 44, column: 21, scope: !42)
!55 = !DILocation(line: 45, column: 19, scope: !42)
!56 = !DILocation(line: 45, column: 9, scope: !42)
!57 = !DILocation(line: 49, column: 1, scope: !14)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_18_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 86, column: 5, scope: !58)
!60 = !DILocation(line: 87, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !62, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !15, line: 99, type: !64)
!67 = !DILocation(line: 99, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !15, line: 99, type: !65)
!69 = !DILocation(line: 99, column: 27, scope: !61)
!70 = !DILocation(line: 102, column: 22, scope: !61)
!71 = !DILocation(line: 102, column: 12, scope: !61)
!72 = !DILocation(line: 102, column: 5, scope: !61)
!73 = !DILocation(line: 104, column: 5, scope: !61)
!74 = !DILocation(line: 105, column: 5, scope: !61)
!75 = !DILocation(line: 106, column: 5, scope: !61)
!76 = !DILocation(line: 109, column: 5, scope: !61)
!77 = !DILocation(line: 110, column: 5, scope: !61)
!78 = !DILocation(line: 111, column: 5, scope: !61)
!79 = !DILocation(line: 113, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 58, type: !4)
!82 = !DILocation(line: 58, column: 12, scope: !80)
!83 = !DILocation(line: 59, column: 10, scope: !80)
!84 = !DILocation(line: 60, column: 5, scope: !80)
!85 = !DILabel(scope: !80, name: "source", file: !15, line: 61)
!86 = !DILocation(line: 61, column: 1, scope: !80)
!87 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !15, line: 63, type: !4)
!88 = distinct !DILexicalBlock(scope: !80, file: !15, line: 62, column: 5)
!89 = !DILocation(line: 63, column: 16, scope: !88)
!90 = !DILocation(line: 63, column: 37, scope: !88)
!91 = !DILocation(line: 64, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 64, column: 13)
!93 = !DILocation(line: 64, column: 24, scope: !92)
!94 = !DILocation(line: 64, column: 13, scope: !88)
!95 = !DILocation(line: 64, column: 34, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 64, column: 33)
!97 = !DILocation(line: 65, column: 16, scope: !88)
!98 = !DILocation(line: 65, column: 9, scope: !88)
!99 = !DILocation(line: 66, column: 9, scope: !88)
!100 = !DILocation(line: 66, column: 27, scope: !88)
!101 = !DILocation(line: 68, column: 16, scope: !88)
!102 = !DILocation(line: 68, column: 14, scope: !88)
!103 = !DILocalVariable(name: "source", scope: !104, file: !15, line: 71, type: !43)
!104 = distinct !DILexicalBlock(scope: !80, file: !15, line: 70, column: 5)
!105 = !DILocation(line: 71, column: 14, scope: !104)
!106 = !DILocation(line: 72, column: 9, scope: !104)
!107 = !DILocation(line: 73, column: 9, scope: !104)
!108 = !DILocation(line: 73, column: 23, scope: !104)
!109 = !DILocation(line: 75, column: 17, scope: !104)
!110 = !DILocation(line: 75, column: 23, scope: !104)
!111 = !DILocation(line: 75, column: 9, scope: !104)
!112 = !DILocation(line: 77, column: 9, scope: !104)
!113 = !DILocation(line: 77, column: 21, scope: !104)
!114 = !DILocation(line: 78, column: 19, scope: !104)
!115 = !DILocation(line: 78, column: 9, scope: !104)
!116 = !DILocation(line: 82, column: 1, scope: !80)
