; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17_bad() #0 !dbg !13 {
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
  %call = call i64 @strlen(i8* %7) #6, !dbg !53
  %8 = load i8*, i8** %data, align 8, !dbg !54
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %8) #7, !dbg !55
  %9 = load i8*, i8** %data, align 8, !dbg !56
  call void @printLine(i8* %9), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #7, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #7, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 100, align 16, !dbg !87
  store i8* %0, i8** %dataBuffer, align 8, !dbg !86
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  store i8* %1, i8** %data, align 8, !dbg !89
  store i32 0, i32* %h, align 4, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !93
  %cmp = icmp slt i32 %2, 1, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !99
  %4 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !103
  %inc = add nsw i32 %5, 1, !dbg !103
  store i32 %inc, i32* %h, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !110
  %7 = load i8*, i8** %data, align 8, !dbg !111
  %call = call i64 @strlen(i8* %7) #6, !dbg !112
  %8 = load i8*, i8** %data, align 8, !dbg !113
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %8) #7, !dbg !114
  %9 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* %9), !dbg !116
  ret void, !dbg !117
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 31, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 31, column: 9, scope: !13)
!20 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 32, type: !4)
!21 = !DILocation(line: 32, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 33, type: !4)
!23 = !DILocation(line: 33, column: 12, scope: !13)
!24 = !DILocation(line: 33, column: 33, scope: !13)
!25 = !DILocation(line: 34, column: 12, scope: !13)
!26 = !DILocation(line: 34, column: 10, scope: !13)
!27 = !DILocation(line: 35, column: 11, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!29 = !DILocation(line: 35, column: 9, scope: !28)
!30 = !DILocation(line: 35, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !14, line: 35, column: 5)
!32 = !DILocation(line: 35, column: 18, scope: !31)
!33 = !DILocation(line: 35, column: 5, scope: !28)
!34 = !DILocation(line: 38, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !14, line: 36, column: 5)
!36 = !DILocation(line: 38, column: 9, scope: !35)
!37 = !DILocation(line: 39, column: 9, scope: !35)
!38 = !DILocation(line: 39, column: 21, scope: !35)
!39 = !DILocation(line: 40, column: 5, scope: !35)
!40 = !DILocation(line: 35, column: 24, scope: !31)
!41 = !DILocation(line: 35, column: 5, scope: !31)
!42 = distinct !{!42, !33, !43, !44}
!43 = !DILocation(line: 40, column: 5, scope: !28)
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocalVariable(name: "dest", scope: !46, file: !14, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 42, column: 14, scope: !46)
!51 = !DILocation(line: 44, column: 18, scope: !46)
!52 = !DILocation(line: 44, column: 31, scope: !46)
!53 = !DILocation(line: 44, column: 24, scope: !46)
!54 = !DILocation(line: 44, column: 44, scope: !46)
!55 = !DILocation(line: 44, column: 9, scope: !46)
!56 = !DILocation(line: 45, column: 19, scope: !46)
!57 = !DILocation(line: 45, column: 9, scope: !46)
!58 = !DILocation(line: 47, column: 1, scope: !13)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_17_good", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 76, column: 5, scope: !59)
!61 = !DILocation(line: 77, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 89, type: !63, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!18, !18, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !14, line: 89, type: !18)
!67 = !DILocation(line: 89, column: 14, scope: !62)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !14, line: 89, type: !65)
!69 = !DILocation(line: 89, column: 27, scope: !62)
!70 = !DILocation(line: 92, column: 22, scope: !62)
!71 = !DILocation(line: 92, column: 12, scope: !62)
!72 = !DILocation(line: 92, column: 5, scope: !62)
!73 = !DILocation(line: 94, column: 5, scope: !62)
!74 = !DILocation(line: 95, column: 5, scope: !62)
!75 = !DILocation(line: 96, column: 5, scope: !62)
!76 = !DILocation(line: 99, column: 5, scope: !62)
!77 = !DILocation(line: 100, column: 5, scope: !62)
!78 = !DILocation(line: 101, column: 5, scope: !62)
!79 = !DILocation(line: 103, column: 5, scope: !62)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "h", scope: !80, file: !14, line: 56, type: !18)
!82 = !DILocation(line: 56, column: 9, scope: !80)
!83 = !DILocalVariable(name: "data", scope: !80, file: !14, line: 57, type: !4)
!84 = !DILocation(line: 57, column: 12, scope: !80)
!85 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !14, line: 58, type: !4)
!86 = !DILocation(line: 58, column: 12, scope: !80)
!87 = !DILocation(line: 58, column: 33, scope: !80)
!88 = !DILocation(line: 59, column: 12, scope: !80)
!89 = !DILocation(line: 59, column: 10, scope: !80)
!90 = !DILocation(line: 60, column: 11, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !14, line: 60, column: 5)
!92 = !DILocation(line: 60, column: 9, scope: !91)
!93 = !DILocation(line: 60, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !14, line: 60, column: 5)
!95 = !DILocation(line: 60, column: 18, scope: !94)
!96 = !DILocation(line: 60, column: 5, scope: !91)
!97 = !DILocation(line: 63, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !14, line: 61, column: 5)
!99 = !DILocation(line: 63, column: 9, scope: !98)
!100 = !DILocation(line: 64, column: 9, scope: !98)
!101 = !DILocation(line: 64, column: 20, scope: !98)
!102 = !DILocation(line: 65, column: 5, scope: !98)
!103 = !DILocation(line: 60, column: 24, scope: !94)
!104 = !DILocation(line: 60, column: 5, scope: !94)
!105 = distinct !{!105, !96, !106, !44}
!106 = !DILocation(line: 65, column: 5, scope: !91)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !14, line: 67, type: !47)
!108 = distinct !DILexicalBlock(scope: !80, file: !14, line: 66, column: 5)
!109 = !DILocation(line: 67, column: 14, scope: !108)
!110 = !DILocation(line: 69, column: 18, scope: !108)
!111 = !DILocation(line: 69, column: 31, scope: !108)
!112 = !DILocation(line: 69, column: 24, scope: !108)
!113 = !DILocation(line: 69, column: 44, scope: !108)
!114 = !DILocation(line: 69, column: 9, scope: !108)
!115 = !DILocation(line: 70, column: 19, scope: !108)
!116 = !DILocation(line: 70, column: 9, scope: !108)
!117 = !DILocation(line: 72, column: 1, scope: !80)
