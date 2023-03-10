; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_17.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i8* null, i8** %data, align 8, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !35
  store i8* %call, i8** %dataBuffer, align 8, !dbg !34
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  %cmp1 = icmp eq i8* %1, null, !dbg !38
  br i1 %cmp1, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !43
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !44
  store i8 0, i8* %arrayidx, align 1, !dbg !45
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !46
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !47
  store i8* %add.ptr, i8** %data, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %5, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !61
  %arrayidx2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !62
  store i8 0, i8* %arrayidx2, align 1, !dbg !63
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !64
  %6 = load i8*, i8** %data, align 8, !dbg !65
  %call4 = call i8* @strcpy(i8* %arraydecay3, i8* %6) #6, !dbg !66
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !67
  call void @printLine(i8* %arraydecay5), !dbg !68
  ret void, !dbg !69
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
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_17_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE127_Buffer_Underread__malloc_char_cpy_17_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE127_Buffer_Underread__malloc_char_cpy_17_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i8* null, i8** %data, align 8, !dbg !96
  store i32 0, i32* %h, align 4, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !100
  %cmp = icmp slt i32 %0, 1, !dbg !102
  br i1 %cmp, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !107
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !108
  store i8* %call, i8** %dataBuffer, align 8, !dbg !107
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  %cmp1 = icmp eq i8* %1, null, !dbg !111
  br i1 %cmp1, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !116
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  store i8* %4, i8** %data, align 8, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %h, align 4, !dbg !122
  %inc = add nsw i32 %5, 1, !dbg !122
  store i32 %inc, i32* %h, align 4, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !129
  %arrayidx2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !130
  store i8 0, i8* %arrayidx2, align 1, !dbg !131
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !132
  %6 = load i8*, i8** %data, align 8, !dbg !133
  %call4 = call i8* @strcpy(i8* %arraydecay3, i8* %6) #6, !dbg !134
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !135
  call void @printLine(i8* %arraydecay5), !dbg !136
  ret void, !dbg !137
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 27, column: 10, scope: !14)
!24 = !DILocation(line: 28, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 28, column: 9, scope: !25)
!27 = !DILocation(line: 28, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 28, column: 5)
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 5, scope: !25)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !15, line: 31, type: !4)
!32 = distinct !DILexicalBlock(scope: !33, file: !15, line: 30, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !15, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 20, scope: !32)
!35 = !DILocation(line: 31, column: 41, scope: !32)
!36 = !DILocation(line: 32, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !15, line: 32, column: 17)
!38 = !DILocation(line: 32, column: 28, scope: !37)
!39 = !DILocation(line: 32, column: 17, scope: !32)
!40 = !DILocation(line: 32, column: 38, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !15, line: 32, column: 37)
!42 = !DILocation(line: 33, column: 20, scope: !32)
!43 = !DILocation(line: 33, column: 13, scope: !32)
!44 = !DILocation(line: 34, column: 13, scope: !32)
!45 = !DILocation(line: 34, column: 31, scope: !32)
!46 = !DILocation(line: 36, column: 20, scope: !32)
!47 = !DILocation(line: 36, column: 31, scope: !32)
!48 = !DILocation(line: 36, column: 18, scope: !32)
!49 = !DILocation(line: 38, column: 5, scope: !33)
!50 = !DILocation(line: 28, column: 24, scope: !28)
!51 = !DILocation(line: 28, column: 5, scope: !28)
!52 = distinct !{!52, !30, !53, !54}
!53 = !DILocation(line: 38, column: 5, scope: !25)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocalVariable(name: "dest", scope: !56, file: !15, line: 40, type: !57)
!56 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 200)
!60 = !DILocation(line: 40, column: 14, scope: !56)
!61 = !DILocation(line: 41, column: 9, scope: !56)
!62 = !DILocation(line: 42, column: 9, scope: !56)
!63 = !DILocation(line: 42, column: 23, scope: !56)
!64 = !DILocation(line: 44, column: 16, scope: !56)
!65 = !DILocation(line: 44, column: 22, scope: !56)
!66 = !DILocation(line: 44, column: 9, scope: !56)
!67 = !DILocation(line: 45, column: 19, scope: !56)
!68 = !DILocation(line: 45, column: 9, scope: !56)
!69 = !DILocation(line: 49, column: 1, scope: !14)
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_17_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 86, column: 5, scope: !70)
!72 = !DILocation(line: 87, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !74, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!19, !19, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !15, line: 99, type: !19)
!78 = !DILocation(line: 99, column: 14, scope: !73)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !15, line: 99, type: !76)
!80 = !DILocation(line: 99, column: 27, scope: !73)
!81 = !DILocation(line: 102, column: 22, scope: !73)
!82 = !DILocation(line: 102, column: 12, scope: !73)
!83 = !DILocation(line: 102, column: 5, scope: !73)
!84 = !DILocation(line: 104, column: 5, scope: !73)
!85 = !DILocation(line: 105, column: 5, scope: !73)
!86 = !DILocation(line: 106, column: 5, scope: !73)
!87 = !DILocation(line: 109, column: 5, scope: !73)
!88 = !DILocation(line: 110, column: 5, scope: !73)
!89 = !DILocation(line: 111, column: 5, scope: !73)
!90 = !DILocation(line: 113, column: 5, scope: !73)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "h", scope: !91, file: !15, line: 58, type: !19)
!93 = !DILocation(line: 58, column: 9, scope: !91)
!94 = !DILocalVariable(name: "data", scope: !91, file: !15, line: 59, type: !4)
!95 = !DILocation(line: 59, column: 12, scope: !91)
!96 = !DILocation(line: 60, column: 10, scope: !91)
!97 = !DILocation(line: 61, column: 11, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !15, line: 61, column: 5)
!99 = !DILocation(line: 61, column: 9, scope: !98)
!100 = !DILocation(line: 61, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !15, line: 61, column: 5)
!102 = !DILocation(line: 61, column: 18, scope: !101)
!103 = !DILocation(line: 61, column: 5, scope: !98)
!104 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !15, line: 64, type: !4)
!105 = distinct !DILexicalBlock(scope: !106, file: !15, line: 63, column: 9)
!106 = distinct !DILexicalBlock(scope: !101, file: !15, line: 62, column: 5)
!107 = !DILocation(line: 64, column: 20, scope: !105)
!108 = !DILocation(line: 64, column: 41, scope: !105)
!109 = !DILocation(line: 65, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !15, line: 65, column: 17)
!111 = !DILocation(line: 65, column: 28, scope: !110)
!112 = !DILocation(line: 65, column: 17, scope: !105)
!113 = !DILocation(line: 65, column: 38, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 65, column: 37)
!115 = !DILocation(line: 66, column: 20, scope: !105)
!116 = !DILocation(line: 66, column: 13, scope: !105)
!117 = !DILocation(line: 67, column: 13, scope: !105)
!118 = !DILocation(line: 67, column: 31, scope: !105)
!119 = !DILocation(line: 69, column: 20, scope: !105)
!120 = !DILocation(line: 69, column: 18, scope: !105)
!121 = !DILocation(line: 71, column: 5, scope: !106)
!122 = !DILocation(line: 61, column: 24, scope: !101)
!123 = !DILocation(line: 61, column: 5, scope: !101)
!124 = distinct !{!124, !103, !125, !54}
!125 = !DILocation(line: 71, column: 5, scope: !98)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !15, line: 73, type: !57)
!127 = distinct !DILexicalBlock(scope: !91, file: !15, line: 72, column: 5)
!128 = !DILocation(line: 73, column: 14, scope: !127)
!129 = !DILocation(line: 74, column: 9, scope: !127)
!130 = !DILocation(line: 75, column: 9, scope: !127)
!131 = !DILocation(line: 75, column: 23, scope: !127)
!132 = !DILocation(line: 77, column: 16, scope: !127)
!133 = !DILocation(line: 77, column: 22, scope: !127)
!134 = !DILocation(line: 77, column: 9, scope: !127)
!135 = !DILocation(line: 78, column: 19, scope: !127)
!136 = !DILocation(line: 78, column: 9, scope: !127)
!137 = !DILocation(line: 82, column: 1, scope: !91)
