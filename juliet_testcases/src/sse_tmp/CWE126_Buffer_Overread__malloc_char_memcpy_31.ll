; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %3 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %3, i8** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !39
  store i8* %4, i8** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx2, align 1, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %5 = load i8*, i8** %data1, align 8, !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call5 = call i64 @strlen(i8* %arraydecay4) #10, !dbg !52
  %mul = mul i64 %call5, 1, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %5, i64 %mul, i1 false), !dbg !49
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx6, align 1, !dbg !55
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay7), !dbg !57
  %6 = load i8*, i8** %data1, align 8, !dbg !58
  call void @free(i8* %6) #8, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_31_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #8, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #8, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_31_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_31_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* null, i8** %data, align 8, !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !87
  store i8* %call, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %cmp = icmp eq i8* %0, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !99, metadata !DIExpression()), !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !102
  store i8* %3, i8** %dataCopy, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !103, metadata !DIExpression()), !dbg !104
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !105
  store i8* %4, i8** %data1, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !109
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx2, align 1, !dbg !111
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  %5 = load i8*, i8** %data1, align 8, !dbg !113
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  %call5 = call i64 @strlen(i8* %arraydecay4) #10, !dbg !115
  %mul = mul i64 %call5, 1, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %5, i64 %mul, i1 false), !dbg !112
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx6, align 1, !dbg !118
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  call void @printLine(i8* %arraydecay7), !dbg !120
  %6 = load i8*, i8** %data1, align 8, !dbg !121
  call void @free(i8* %6) #8, !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 20, scope: !14)
!22 = !DILocation(line: 28, column: 10, scope: !14)
!23 = !DILocation(line: 29, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!25 = !DILocation(line: 29, column: 14, scope: !24)
!26 = !DILocation(line: 29, column: 9, scope: !14)
!27 = !DILocation(line: 29, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 29, column: 23)
!29 = !DILocation(line: 30, column: 12, scope: !14)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 31, column: 5, scope: !14)
!32 = !DILocation(line: 31, column: 16, scope: !14)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !15, line: 33, type: !4)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!35 = !DILocation(line: 33, column: 16, scope: !34)
!36 = !DILocation(line: 33, column: 27, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 34, type: !4)
!38 = !DILocation(line: 34, column: 16, scope: !34)
!39 = !DILocation(line: 34, column: 23, scope: !34)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !15, line: 36, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !15, line: 35, column: 9)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 36, column: 18, scope: !41)
!46 = !DILocation(line: 37, column: 13, scope: !41)
!47 = !DILocation(line: 38, column: 13, scope: !41)
!48 = !DILocation(line: 38, column: 25, scope: !41)
!49 = !DILocation(line: 41, column: 13, scope: !41)
!50 = !DILocation(line: 41, column: 26, scope: !41)
!51 = !DILocation(line: 41, column: 39, scope: !41)
!52 = !DILocation(line: 41, column: 32, scope: !41)
!53 = !DILocation(line: 41, column: 44, scope: !41)
!54 = !DILocation(line: 42, column: 13, scope: !41)
!55 = !DILocation(line: 42, column: 25, scope: !41)
!56 = !DILocation(line: 43, column: 23, scope: !41)
!57 = !DILocation(line: 43, column: 13, scope: !41)
!58 = !DILocation(line: 44, column: 18, scope: !41)
!59 = !DILocation(line: 44, column: 13, scope: !41)
!60 = !DILocation(line: 47, column: 1, scope: !14)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_31_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 82, column: 5, scope: !61)
!63 = !DILocation(line: 83, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 94, type: !65, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !15, line: 94, type: !67)
!70 = !DILocation(line: 94, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !15, line: 94, type: !68)
!72 = !DILocation(line: 94, column: 27, scope: !64)
!73 = !DILocation(line: 97, column: 22, scope: !64)
!74 = !DILocation(line: 97, column: 12, scope: !64)
!75 = !DILocation(line: 97, column: 5, scope: !64)
!76 = !DILocation(line: 99, column: 5, scope: !64)
!77 = !DILocation(line: 100, column: 5, scope: !64)
!78 = !DILocation(line: 101, column: 5, scope: !64)
!79 = !DILocation(line: 104, column: 5, scope: !64)
!80 = !DILocation(line: 105, column: 5, scope: !64)
!81 = !DILocation(line: 106, column: 5, scope: !64)
!82 = !DILocation(line: 108, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !15, line: 56, type: !4)
!85 = !DILocation(line: 56, column: 12, scope: !83)
!86 = !DILocation(line: 57, column: 10, scope: !83)
!87 = !DILocation(line: 59, column: 20, scope: !83)
!88 = !DILocation(line: 59, column: 10, scope: !83)
!89 = !DILocation(line: 60, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !15, line: 60, column: 9)
!91 = !DILocation(line: 60, column: 14, scope: !90)
!92 = !DILocation(line: 60, column: 9, scope: !83)
!93 = !DILocation(line: 60, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 60, column: 23)
!95 = !DILocation(line: 61, column: 12, scope: !83)
!96 = !DILocation(line: 61, column: 5, scope: !83)
!97 = !DILocation(line: 62, column: 5, scope: !83)
!98 = !DILocation(line: 62, column: 17, scope: !83)
!99 = !DILocalVariable(name: "dataCopy", scope: !100, file: !15, line: 64, type: !4)
!100 = distinct !DILexicalBlock(scope: !83, file: !15, line: 63, column: 5)
!101 = !DILocation(line: 64, column: 16, scope: !100)
!102 = !DILocation(line: 64, column: 27, scope: !100)
!103 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 65, type: !4)
!104 = !DILocation(line: 65, column: 16, scope: !100)
!105 = !DILocation(line: 65, column: 23, scope: !100)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !15, line: 67, type: !42)
!107 = distinct !DILexicalBlock(scope: !100, file: !15, line: 66, column: 9)
!108 = !DILocation(line: 67, column: 18, scope: !107)
!109 = !DILocation(line: 68, column: 13, scope: !107)
!110 = !DILocation(line: 69, column: 13, scope: !107)
!111 = !DILocation(line: 69, column: 25, scope: !107)
!112 = !DILocation(line: 72, column: 13, scope: !107)
!113 = !DILocation(line: 72, column: 26, scope: !107)
!114 = !DILocation(line: 72, column: 39, scope: !107)
!115 = !DILocation(line: 72, column: 32, scope: !107)
!116 = !DILocation(line: 72, column: 44, scope: !107)
!117 = !DILocation(line: 73, column: 13, scope: !107)
!118 = !DILocation(line: 73, column: 25, scope: !107)
!119 = !DILocation(line: 74, column: 23, scope: !107)
!120 = !DILocation(line: 74, column: 13, scope: !107)
!121 = !DILocation(line: 75, column: 18, scope: !107)
!122 = !DILocation(line: 75, column: 13, scope: !107)
!123 = !DILocation(line: 78, column: 1, scope: !83)
