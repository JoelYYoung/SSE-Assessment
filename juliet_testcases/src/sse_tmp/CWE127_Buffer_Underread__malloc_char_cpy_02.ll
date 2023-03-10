; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_02.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_02_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !26
  store i8* %call, i8** %dataBuffer, align 8, !dbg !25
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %4) #6, !dbg !51
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @printLine(i8* %arraydecay4), !dbg !53
  ret void, !dbg !54
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
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_02_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__malloc_char_cpy_02_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__malloc_char_cpy_02_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !87
  store i8* %call, i8** %dataBuffer, align 8, !dbg !86
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  %cmp = icmp eq i8* %0, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !95
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  store i8* %3, i8** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !103
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !104
  store i8 0, i8* %arrayidx1, align 1, !dbg !105
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !107
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %4) #6, !dbg !108
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay4), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i8* null, i8** %data, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !120
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !121
  store i8* %call, i8** %dataBuffer, align 8, !dbg !120
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !122
  %cmp = icmp eq i8* %0, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !129
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !132
  store i8* %3, i8** %data, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !137
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !138
  store i8 0, i8* %arrayidx1, align 1, !dbg !139
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !140
  %4 = load i8*, i8** %data, align 8, !dbg !141
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %4) #6, !dbg !142
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !143
  call void @printLine(i8* %arraydecay4), !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_02_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 30, type: !4)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 29, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 28, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!25 = !DILocation(line: 30, column: 20, scope: !22)
!26 = !DILocation(line: 30, column: 41, scope: !22)
!27 = !DILocation(line: 31, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !15, line: 31, column: 17)
!29 = !DILocation(line: 31, column: 28, scope: !28)
!30 = !DILocation(line: 31, column: 17, scope: !22)
!31 = !DILocation(line: 31, column: 38, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 37)
!33 = !DILocation(line: 32, column: 20, scope: !22)
!34 = !DILocation(line: 32, column: 13, scope: !22)
!35 = !DILocation(line: 33, column: 13, scope: !22)
!36 = !DILocation(line: 33, column: 31, scope: !22)
!37 = !DILocation(line: 35, column: 20, scope: !22)
!38 = !DILocation(line: 35, column: 31, scope: !22)
!39 = !DILocation(line: 35, column: 18, scope: !22)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !15, line: 39, type: !42)
!41 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 200)
!45 = !DILocation(line: 39, column: 14, scope: !41)
!46 = !DILocation(line: 40, column: 9, scope: !41)
!47 = !DILocation(line: 41, column: 9, scope: !41)
!48 = !DILocation(line: 41, column: 23, scope: !41)
!49 = !DILocation(line: 43, column: 16, scope: !41)
!50 = !DILocation(line: 43, column: 22, scope: !41)
!51 = !DILocation(line: 43, column: 9, scope: !41)
!52 = !DILocation(line: 44, column: 19, scope: !41)
!53 = !DILocation(line: 44, column: 9, scope: !41)
!54 = !DILocation(line: 48, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_02_good", scope: !15, file: !15, line: 115, type: !16, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 117, column: 5, scope: !55)
!57 = !DILocation(line: 118, column: 5, scope: !55)
!58 = !DILocation(line: 119, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 131, type: !60, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 131, type: !62)
!65 = !DILocation(line: 131, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 131, type: !63)
!67 = !DILocation(line: 131, column: 27, scope: !59)
!68 = !DILocation(line: 134, column: 22, scope: !59)
!69 = !DILocation(line: 134, column: 12, scope: !59)
!70 = !DILocation(line: 134, column: 5, scope: !59)
!71 = !DILocation(line: 136, column: 5, scope: !59)
!72 = !DILocation(line: 137, column: 5, scope: !59)
!73 = !DILocation(line: 138, column: 5, scope: !59)
!74 = !DILocation(line: 141, column: 5, scope: !59)
!75 = !DILocation(line: 142, column: 5, scope: !59)
!76 = !DILocation(line: 143, column: 5, scope: !59)
!77 = !DILocation(line: 145, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 57, type: !4)
!80 = !DILocation(line: 57, column: 12, scope: !78)
!81 = !DILocation(line: 58, column: 10, scope: !78)
!82 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !15, line: 67, type: !4)
!83 = distinct !DILexicalBlock(scope: !84, file: !15, line: 66, column: 9)
!84 = distinct !DILexicalBlock(scope: !85, file: !15, line: 65, column: 5)
!85 = distinct !DILexicalBlock(scope: !78, file: !15, line: 59, column: 8)
!86 = !DILocation(line: 67, column: 20, scope: !83)
!87 = !DILocation(line: 67, column: 41, scope: !83)
!88 = !DILocation(line: 68, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !15, line: 68, column: 17)
!90 = !DILocation(line: 68, column: 28, scope: !89)
!91 = !DILocation(line: 68, column: 17, scope: !83)
!92 = !DILocation(line: 68, column: 38, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 68, column: 37)
!94 = !DILocation(line: 69, column: 20, scope: !83)
!95 = !DILocation(line: 69, column: 13, scope: !83)
!96 = !DILocation(line: 70, column: 13, scope: !83)
!97 = !DILocation(line: 70, column: 31, scope: !83)
!98 = !DILocation(line: 72, column: 20, scope: !83)
!99 = !DILocation(line: 72, column: 18, scope: !83)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !15, line: 76, type: !42)
!101 = distinct !DILexicalBlock(scope: !78, file: !15, line: 75, column: 5)
!102 = !DILocation(line: 76, column: 14, scope: !101)
!103 = !DILocation(line: 77, column: 9, scope: !101)
!104 = !DILocation(line: 78, column: 9, scope: !101)
!105 = !DILocation(line: 78, column: 23, scope: !101)
!106 = !DILocation(line: 80, column: 16, scope: !101)
!107 = !DILocation(line: 80, column: 22, scope: !101)
!108 = !DILocation(line: 80, column: 9, scope: !101)
!109 = !DILocation(line: 81, column: 19, scope: !101)
!110 = !DILocation(line: 81, column: 9, scope: !101)
!111 = !DILocation(line: 85, column: 1, scope: !78)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 90, type: !4)
!114 = !DILocation(line: 90, column: 12, scope: !112)
!115 = !DILocation(line: 91, column: 10, scope: !112)
!116 = !DILocalVariable(name: "dataBuffer", scope: !117, file: !15, line: 95, type: !4)
!117 = distinct !DILexicalBlock(scope: !118, file: !15, line: 94, column: 9)
!118 = distinct !DILexicalBlock(scope: !119, file: !15, line: 93, column: 5)
!119 = distinct !DILexicalBlock(scope: !112, file: !15, line: 92, column: 8)
!120 = !DILocation(line: 95, column: 20, scope: !117)
!121 = !DILocation(line: 95, column: 41, scope: !117)
!122 = !DILocation(line: 96, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !15, line: 96, column: 17)
!124 = !DILocation(line: 96, column: 28, scope: !123)
!125 = !DILocation(line: 96, column: 17, scope: !117)
!126 = !DILocation(line: 96, column: 38, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 96, column: 37)
!128 = !DILocation(line: 97, column: 20, scope: !117)
!129 = !DILocation(line: 97, column: 13, scope: !117)
!130 = !DILocation(line: 98, column: 13, scope: !117)
!131 = !DILocation(line: 98, column: 31, scope: !117)
!132 = !DILocation(line: 100, column: 20, scope: !117)
!133 = !DILocation(line: 100, column: 18, scope: !117)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !15, line: 104, type: !42)
!135 = distinct !DILexicalBlock(scope: !112, file: !15, line: 103, column: 5)
!136 = !DILocation(line: 104, column: 14, scope: !135)
!137 = !DILocation(line: 105, column: 9, scope: !135)
!138 = !DILocation(line: 106, column: 9, scope: !135)
!139 = !DILocation(line: 106, column: 23, scope: !135)
!140 = !DILocation(line: 108, column: 16, scope: !135)
!141 = !DILocation(line: 108, column: 22, scope: !135)
!142 = !DILocation(line: 108, column: 9, scope: !135)
!143 = !DILocation(line: 109, column: 19, scope: !135)
!144 = !DILocation(line: 109, column: 9, scope: !135)
!145 = !DILocation(line: 113, column: 1, scope: !112)
