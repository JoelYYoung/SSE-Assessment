; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %0, i8** %dataBuffer, align 8, !dbg !23
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  store i8* %1, i8** %data, align 8, !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !30
  %cmp = icmp slt i32 %2, 1, !dbg !32
  br i1 %cmp, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !40
  %inc = add nsw i32 %5, 1, !dbg !40
  store i32 %inc, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !41, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !51
  %7 = load i8*, i8** %data, align 8, !dbg !52
  %8 = load i8*, i8** %data, align 8, !dbg !53
  %call = call i64 @strlen(i8* %8) #6, !dbg !54
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %7, i64 %call) #7, !dbg !55
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !56
  store i8 0, i8* %arrayidx2, align 1, !dbg !57
  %9 = load i8*, i8** %data, align 8, !dbg !58
  call void @printLine(i8* %9), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17_good() #0 !dbg !61 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 100, align 16, !dbg !89
  store i8* %0, i8** %dataBuffer, align 8, !dbg !88
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  store i8* %1, i8** %data, align 8, !dbg !91
  store i32 0, i32* %h, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !95
  %cmp = icmp slt i32 %2, 1, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !105
  %inc = add nsw i32 %5, 1, !dbg !105
  store i32 %inc, i32* %h, align 4, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !111
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !112
  %7 = load i8*, i8** %data, align 8, !dbg !113
  %8 = load i8*, i8** %data, align 8, !dbg !114
  %call = call i64 @strlen(i8* %8) #6, !dbg !115
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %7, i64 %call) #7, !dbg !116
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !117
  store i8 0, i8* %arrayidx2, align 1, !dbg !118
  %9 = load i8*, i8** %data, align 8, !dbg !119
  call void @printLine(i8* %9), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 25, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 25, column: 9, scope: !13)
!20 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 33, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 10, scope: !13)
!27 = !DILocation(line: 29, column: 11, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!29 = !DILocation(line: 29, column: 9, scope: !28)
!30 = !DILocation(line: 29, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !14, line: 29, column: 5)
!32 = !DILocation(line: 29, column: 18, scope: !31)
!33 = !DILocation(line: 29, column: 5, scope: !28)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !14, line: 30, column: 5)
!36 = !DILocation(line: 32, column: 9, scope: !35)
!37 = !DILocation(line: 33, column: 9, scope: !35)
!38 = !DILocation(line: 33, column: 21, scope: !35)
!39 = !DILocation(line: 34, column: 5, scope: !35)
!40 = !DILocation(line: 29, column: 24, scope: !31)
!41 = !DILocation(line: 29, column: 5, scope: !31)
!42 = distinct !{!42, !33, !43, !44}
!43 = !DILocation(line: 34, column: 5, scope: !28)
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocalVariable(name: "dest", scope: !46, file: !14, line: 36, type: !47)
!46 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 36, column: 14, scope: !46)
!51 = !DILocation(line: 38, column: 17, scope: !46)
!52 = !DILocation(line: 38, column: 23, scope: !46)
!53 = !DILocation(line: 38, column: 36, scope: !46)
!54 = !DILocation(line: 38, column: 29, scope: !46)
!55 = !DILocation(line: 38, column: 9, scope: !46)
!56 = !DILocation(line: 39, column: 9, scope: !46)
!57 = !DILocation(line: 39, column: 20, scope: !46)
!58 = !DILocation(line: 40, column: 19, scope: !46)
!59 = !DILocation(line: 40, column: 9, scope: !46)
!60 = !DILocation(line: 42, column: 1, scope: !13)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_17_good", scope: !14, file: !14, line: 70, type: !15, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 72, column: 5, scope: !61)
!63 = !DILocation(line: 73, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 85, type: !65, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!18, !18, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !14, line: 85, type: !18)
!69 = !DILocation(line: 85, column: 14, scope: !64)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !14, line: 85, type: !67)
!71 = !DILocation(line: 85, column: 27, scope: !64)
!72 = !DILocation(line: 88, column: 22, scope: !64)
!73 = !DILocation(line: 88, column: 12, scope: !64)
!74 = !DILocation(line: 88, column: 5, scope: !64)
!75 = !DILocation(line: 90, column: 5, scope: !64)
!76 = !DILocation(line: 91, column: 5, scope: !64)
!77 = !DILocation(line: 92, column: 5, scope: !64)
!78 = !DILocation(line: 95, column: 5, scope: !64)
!79 = !DILocation(line: 96, column: 5, scope: !64)
!80 = !DILocation(line: 97, column: 5, scope: !64)
!81 = !DILocation(line: 99, column: 5, scope: !64)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "h", scope: !82, file: !14, line: 51, type: !18)
!84 = !DILocation(line: 51, column: 9, scope: !82)
!85 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 52, type: !4)
!86 = !DILocation(line: 52, column: 12, scope: !82)
!87 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !14, line: 53, type: !4)
!88 = !DILocation(line: 53, column: 12, scope: !82)
!89 = !DILocation(line: 53, column: 33, scope: !82)
!90 = !DILocation(line: 54, column: 12, scope: !82)
!91 = !DILocation(line: 54, column: 10, scope: !82)
!92 = !DILocation(line: 55, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !82, file: !14, line: 55, column: 5)
!94 = !DILocation(line: 55, column: 9, scope: !93)
!95 = !DILocation(line: 55, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !14, line: 55, column: 5)
!97 = !DILocation(line: 55, column: 18, scope: !96)
!98 = !DILocation(line: 55, column: 5, scope: !93)
!99 = !DILocation(line: 58, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !14, line: 56, column: 5)
!101 = !DILocation(line: 58, column: 9, scope: !100)
!102 = !DILocation(line: 59, column: 9, scope: !100)
!103 = !DILocation(line: 59, column: 20, scope: !100)
!104 = !DILocation(line: 60, column: 5, scope: !100)
!105 = !DILocation(line: 55, column: 24, scope: !96)
!106 = !DILocation(line: 55, column: 5, scope: !96)
!107 = distinct !{!107, !98, !108, !44}
!108 = !DILocation(line: 60, column: 5, scope: !93)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !14, line: 62, type: !47)
!110 = distinct !DILexicalBlock(scope: !82, file: !14, line: 61, column: 5)
!111 = !DILocation(line: 62, column: 14, scope: !110)
!112 = !DILocation(line: 64, column: 17, scope: !110)
!113 = !DILocation(line: 64, column: 23, scope: !110)
!114 = !DILocation(line: 64, column: 36, scope: !110)
!115 = !DILocation(line: 64, column: 29, scope: !110)
!116 = !DILocation(line: 64, column: 9, scope: !110)
!117 = !DILocation(line: 65, column: 9, scope: !110)
!118 = !DILocation(line: 65, column: 20, scope: !110)
!119 = !DILocation(line: 66, column: 19, scope: !110)
!120 = !DILocation(line: 66, column: 9, scope: !110)
!121 = !DILocation(line: 68, column: 1, scope: !82)
