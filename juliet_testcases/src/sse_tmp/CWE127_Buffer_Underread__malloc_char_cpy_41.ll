; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !29
  %0 = load i8*, i8** %data.addr, align 8, !dbg !30
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %0) #6, !dbg !31
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !32
  call void @printLine(i8* %arraydecay2), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_41_bad() #0 !dbg !35 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  store i8* null, i8** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !41, metadata !DIExpression()), !dbg !43
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !44
  store i8* %call, i8** %dataBuffer, align 8, !dbg !43
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !45
  %cmp = icmp eq i8* %0, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !52
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !53
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !55
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !56
  store i8* %add.ptr, i8** %data, align 8, !dbg !57
  %4 = load i8*, i8** %data, align 8, !dbg !58
  call void @CWE127_Buffer_Underread__malloc_char_cpy_41_badSink(i8* %4), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_41_goodG2BSink(i8* %data) #0 !dbg !61 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !64, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !67
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !68
  store i8 0, i8* %arrayidx, align 1, !dbg !69
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !70
  %0 = load i8*, i8** %data.addr, align 8, !dbg !71
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %0) #6, !dbg !72
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !73
  call void @printLine(i8* %arraydecay2), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_41_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #6, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #6, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE127_Buffer_Underread__malloc_char_cpy_41_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE127_Buffer_Underread__malloc_char_cpy_41_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i8* null, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !104
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !105
  store i8* %call, i8** %dataBuffer, align 8, !dbg !104
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  %cmp = icmp eq i8* %0, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !113
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  store i8* %3, i8** %data, align 8, !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  call void @CWE127_Buffer_Underread__malloc_char_cpy_41_goodG2BSink(i8* %4), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 65, scope: !14)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 200)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 23, scope: !21)
!29 = !DILocation(line: 30, column: 16, scope: !21)
!30 = !DILocation(line: 30, column: 22, scope: !21)
!31 = !DILocation(line: 30, column: 9, scope: !21)
!32 = !DILocation(line: 31, column: 19, scope: !21)
!33 = !DILocation(line: 31, column: 9, scope: !21)
!34 = !DILocation(line: 35, column: 1, scope: !14)
!35 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_41_bad", scope: !15, file: !15, line: 37, type: !36, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "data", scope: !35, file: !15, line: 39, type: !4)
!39 = !DILocation(line: 39, column: 12, scope: !35)
!40 = !DILocation(line: 40, column: 10, scope: !35)
!41 = !DILocalVariable(name: "dataBuffer", scope: !42, file: !15, line: 42, type: !4)
!42 = distinct !DILexicalBlock(scope: !35, file: !15, line: 41, column: 5)
!43 = !DILocation(line: 42, column: 16, scope: !42)
!44 = !DILocation(line: 42, column: 37, scope: !42)
!45 = !DILocation(line: 43, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 43, column: 13)
!47 = !DILocation(line: 43, column: 24, scope: !46)
!48 = !DILocation(line: 43, column: 13, scope: !42)
!49 = !DILocation(line: 43, column: 34, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 43, column: 33)
!51 = !DILocation(line: 44, column: 16, scope: !42)
!52 = !DILocation(line: 44, column: 9, scope: !42)
!53 = !DILocation(line: 45, column: 9, scope: !42)
!54 = !DILocation(line: 45, column: 27, scope: !42)
!55 = !DILocation(line: 47, column: 16, scope: !42)
!56 = !DILocation(line: 47, column: 27, scope: !42)
!57 = !DILocation(line: 47, column: 14, scope: !42)
!58 = !DILocation(line: 49, column: 57, scope: !35)
!59 = !DILocation(line: 49, column: 5, scope: !35)
!60 = !DILocation(line: 50, column: 1, scope: !35)
!61 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_41_goodG2BSink", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", arg: 1, scope: !61, file: !15, line: 56, type: !4)
!63 = !DILocation(line: 56, column: 69, scope: !61)
!64 = !DILocalVariable(name: "dest", scope: !65, file: !15, line: 59, type: !22)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 58, column: 5)
!66 = !DILocation(line: 59, column: 14, scope: !65)
!67 = !DILocation(line: 60, column: 9, scope: !65)
!68 = !DILocation(line: 61, column: 9, scope: !65)
!69 = !DILocation(line: 61, column: 23, scope: !65)
!70 = !DILocation(line: 63, column: 16, scope: !65)
!71 = !DILocation(line: 63, column: 22, scope: !65)
!72 = !DILocation(line: 63, column: 9, scope: !65)
!73 = !DILocation(line: 64, column: 19, scope: !65)
!74 = !DILocation(line: 64, column: 9, scope: !65)
!75 = !DILocation(line: 68, column: 1, scope: !61)
!76 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_41_good", scope: !15, file: !15, line: 86, type: !36, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 88, column: 5, scope: !76)
!78 = !DILocation(line: 89, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 101, type: !80, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !15, line: 101, type: !82)
!85 = !DILocation(line: 101, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !15, line: 101, type: !83)
!87 = !DILocation(line: 101, column: 27, scope: !79)
!88 = !DILocation(line: 104, column: 22, scope: !79)
!89 = !DILocation(line: 104, column: 12, scope: !79)
!90 = !DILocation(line: 104, column: 5, scope: !79)
!91 = !DILocation(line: 106, column: 5, scope: !79)
!92 = !DILocation(line: 107, column: 5, scope: !79)
!93 = !DILocation(line: 108, column: 5, scope: !79)
!94 = !DILocation(line: 111, column: 5, scope: !79)
!95 = !DILocation(line: 112, column: 5, scope: !79)
!96 = !DILocation(line: 113, column: 5, scope: !79)
!97 = !DILocation(line: 115, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 71, type: !36, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 73, type: !4)
!100 = !DILocation(line: 73, column: 12, scope: !98)
!101 = !DILocation(line: 74, column: 10, scope: !98)
!102 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !15, line: 76, type: !4)
!103 = distinct !DILexicalBlock(scope: !98, file: !15, line: 75, column: 5)
!104 = !DILocation(line: 76, column: 16, scope: !103)
!105 = !DILocation(line: 76, column: 37, scope: !103)
!106 = !DILocation(line: 77, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 77, column: 13)
!108 = !DILocation(line: 77, column: 24, scope: !107)
!109 = !DILocation(line: 77, column: 13, scope: !103)
!110 = !DILocation(line: 77, column: 34, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !15, line: 77, column: 33)
!112 = !DILocation(line: 78, column: 16, scope: !103)
!113 = !DILocation(line: 78, column: 9, scope: !103)
!114 = !DILocation(line: 79, column: 9, scope: !103)
!115 = !DILocation(line: 79, column: 27, scope: !103)
!116 = !DILocation(line: 81, column: 16, scope: !103)
!117 = !DILocation(line: 81, column: 14, scope: !103)
!118 = !DILocation(line: 83, column: 61, scope: !98)
!119 = !DILocation(line: 83, column: 5, scope: !98)
!120 = !DILocation(line: 84, column: 1, scope: !98)
