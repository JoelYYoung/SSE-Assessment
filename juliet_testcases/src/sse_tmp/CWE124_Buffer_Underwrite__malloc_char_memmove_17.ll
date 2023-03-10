; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
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
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !35
  store i8* %call, i8** %dataBuffer, align 8, !dbg !34
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  %cmp1 = icmp eq i8* %1, null, !dbg !38
  br i1 %cmp1, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !40
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !55, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !61
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !62
  store i8 0, i8* %arrayidx2, align 1, !dbg !63
  %6 = load i8*, i8** %data, align 8, !dbg !64
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !65
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %6, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !65
  %7 = load i8*, i8** %data, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !66
  store i8 0, i8* %arrayidx4, align 1, !dbg !67
  %8 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* %8), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_memmove_17_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_17_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE124_Buffer_Underwrite__malloc_char_memmove_17_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i8* null, i8** %data, align 8, !dbg !97
  store i32 0, i32* %h, align 4, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !101
  %cmp = icmp slt i32 %0, 1, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !109
  store i8* %call, i8** %dataBuffer, align 8, !dbg !108
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  %cmp1 = icmp eq i8* %1, null, !dbg !112
  br i1 %cmp1, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !117
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !120
  store i8* %4, i8** %data, align 8, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %h, align 4, !dbg !123
  %inc = add nsw i32 %5, 1, !dbg !123
  store i32 %inc, i32* %h, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx2, align 1, !dbg !132
  %6 = load i8*, i8** %data, align 8, !dbg !133
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !134
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %6, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !134
  %7 = load i8*, i8** %data, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !135
  store i8 0, i8* %arrayidx4, align 1, !dbg !136
  %8 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %8), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!55 = !DILocalVariable(name: "source", scope: !56, file: !15, line: 40, type: !57)
!56 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 40, column: 14, scope: !56)
!61 = !DILocation(line: 41, column: 9, scope: !56)
!62 = !DILocation(line: 42, column: 9, scope: !56)
!63 = !DILocation(line: 42, column: 23, scope: !56)
!64 = !DILocation(line: 44, column: 17, scope: !56)
!65 = !DILocation(line: 44, column: 9, scope: !56)
!66 = !DILocation(line: 46, column: 9, scope: !56)
!67 = !DILocation(line: 46, column: 21, scope: !56)
!68 = !DILocation(line: 47, column: 19, scope: !56)
!69 = !DILocation(line: 47, column: 9, scope: !56)
!70 = !DILocation(line: 51, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memmove_17_good", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 90, column: 5, scope: !71)
!73 = !DILocation(line: 91, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 103, type: !75, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!19, !19, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !15, line: 103, type: !19)
!79 = !DILocation(line: 103, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !15, line: 103, type: !77)
!81 = !DILocation(line: 103, column: 27, scope: !74)
!82 = !DILocation(line: 106, column: 22, scope: !74)
!83 = !DILocation(line: 106, column: 12, scope: !74)
!84 = !DILocation(line: 106, column: 5, scope: !74)
!85 = !DILocation(line: 108, column: 5, scope: !74)
!86 = !DILocation(line: 109, column: 5, scope: !74)
!87 = !DILocation(line: 110, column: 5, scope: !74)
!88 = !DILocation(line: 113, column: 5, scope: !74)
!89 = !DILocation(line: 114, column: 5, scope: !74)
!90 = !DILocation(line: 115, column: 5, scope: !74)
!91 = !DILocation(line: 117, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "h", scope: !92, file: !15, line: 60, type: !19)
!94 = !DILocation(line: 60, column: 9, scope: !92)
!95 = !DILocalVariable(name: "data", scope: !92, file: !15, line: 61, type: !4)
!96 = !DILocation(line: 61, column: 12, scope: !92)
!97 = !DILocation(line: 62, column: 10, scope: !92)
!98 = !DILocation(line: 63, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !15, line: 63, column: 5)
!100 = !DILocation(line: 63, column: 9, scope: !99)
!101 = !DILocation(line: 63, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !15, line: 63, column: 5)
!103 = !DILocation(line: 63, column: 18, scope: !102)
!104 = !DILocation(line: 63, column: 5, scope: !99)
!105 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !15, line: 66, type: !4)
!106 = distinct !DILexicalBlock(scope: !107, file: !15, line: 65, column: 9)
!107 = distinct !DILexicalBlock(scope: !102, file: !15, line: 64, column: 5)
!108 = !DILocation(line: 66, column: 20, scope: !106)
!109 = !DILocation(line: 66, column: 41, scope: !106)
!110 = !DILocation(line: 67, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !15, line: 67, column: 17)
!112 = !DILocation(line: 67, column: 28, scope: !111)
!113 = !DILocation(line: 67, column: 17, scope: !106)
!114 = !DILocation(line: 67, column: 38, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 67, column: 37)
!116 = !DILocation(line: 68, column: 20, scope: !106)
!117 = !DILocation(line: 68, column: 13, scope: !106)
!118 = !DILocation(line: 69, column: 13, scope: !106)
!119 = !DILocation(line: 69, column: 31, scope: !106)
!120 = !DILocation(line: 71, column: 20, scope: !106)
!121 = !DILocation(line: 71, column: 18, scope: !106)
!122 = !DILocation(line: 73, column: 5, scope: !107)
!123 = !DILocation(line: 63, column: 24, scope: !102)
!124 = !DILocation(line: 63, column: 5, scope: !102)
!125 = distinct !{!125, !104, !126, !54}
!126 = !DILocation(line: 73, column: 5, scope: !99)
!127 = !DILocalVariable(name: "source", scope: !128, file: !15, line: 75, type: !57)
!128 = distinct !DILexicalBlock(scope: !92, file: !15, line: 74, column: 5)
!129 = !DILocation(line: 75, column: 14, scope: !128)
!130 = !DILocation(line: 76, column: 9, scope: !128)
!131 = !DILocation(line: 77, column: 9, scope: !128)
!132 = !DILocation(line: 77, column: 23, scope: !128)
!133 = !DILocation(line: 79, column: 17, scope: !128)
!134 = !DILocation(line: 79, column: 9, scope: !128)
!135 = !DILocation(line: 81, column: 9, scope: !128)
!136 = !DILocation(line: 81, column: 21, scope: !128)
!137 = !DILocation(line: 82, column: 19, scope: !128)
!138 = !DILocation(line: 82, column: 9, scope: !128)
!139 = !DILocation(line: 86, column: 1, scope: !92)
