; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %0, i8** %dataBuffer, align 8, !dbg !23
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !26
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %3, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  br label %for.inc, !dbg !40

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !41
  %inc = add nsw i32 %5, 1, !dbg !41
  store i32 %inc, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx1, align 1, !dbg !54
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %6 = load i8*, i8** %data, align 8, !dbg !56
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !58
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %6, i64 %call) #7, !dbg !59
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx5, align 1, !dbg !61
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @printLine(i8* %arraydecay6), !dbg !63
  ret void, !dbg !64
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
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_17_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #7, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #7, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_17_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_17_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 100, align 16, !dbg !93
  store i8* %0, i8** %dataBuffer, align 8, !dbg !92
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !95
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  store i32 0, i32* %h, align 4, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %h, align 4, !dbg !101
  %cmp = icmp slt i32 %3, 1, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  store i8* %4, i8** %data, align 8, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !109
  %inc = add nsw i32 %5, 1, !dbg !109
  store i32 %inc, i32* %h, align 4, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !116
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx1, align 1, !dbg !118
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  %6 = load i8*, i8** %data, align 8, !dbg !120
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !122
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %6, i64 %call) #7, !dbg !123
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx5, align 1, !dbg !125
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @printLine(i8* %arraydecay6), !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_17_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 23, scope: !13)
!29 = !DILocation(line: 30, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!31 = !DILocation(line: 30, column: 9, scope: !30)
!32 = !DILocation(line: 30, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !14, line: 30, column: 5)
!34 = !DILocation(line: 30, column: 18, scope: !33)
!35 = !DILocation(line: 30, column: 5, scope: !30)
!36 = !DILocation(line: 33, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !14, line: 31, column: 5)
!38 = !DILocation(line: 33, column: 27, scope: !37)
!39 = !DILocation(line: 33, column: 14, scope: !37)
!40 = !DILocation(line: 34, column: 5, scope: !37)
!41 = !DILocation(line: 30, column: 24, scope: !33)
!42 = !DILocation(line: 30, column: 5, scope: !33)
!43 = distinct !{!43, !35, !44, !45}
!44 = !DILocation(line: 34, column: 5, scope: !30)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocalVariable(name: "dest", scope: !47, file: !14, line: 36, type: !48)
!47 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 36, column: 14, scope: !47)
!52 = !DILocation(line: 37, column: 9, scope: !47)
!53 = !DILocation(line: 38, column: 9, scope: !47)
!54 = !DILocation(line: 38, column: 21, scope: !47)
!55 = !DILocation(line: 40, column: 17, scope: !47)
!56 = !DILocation(line: 40, column: 23, scope: !47)
!57 = !DILocation(line: 40, column: 36, scope: !47)
!58 = !DILocation(line: 40, column: 29, scope: !47)
!59 = !DILocation(line: 40, column: 9, scope: !47)
!60 = !DILocation(line: 42, column: 9, scope: !47)
!61 = !DILocation(line: 42, column: 21, scope: !47)
!62 = !DILocation(line: 43, column: 19, scope: !47)
!63 = !DILocation(line: 43, column: 9, scope: !47)
!64 = !DILocation(line: 45, column: 1, scope: !13)
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_17_good", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 78, column: 5, scope: !65)
!67 = !DILocation(line: 79, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 91, type: !69, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!18, !18, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !14, line: 91, type: !18)
!73 = !DILocation(line: 91, column: 14, scope: !68)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !14, line: 91, type: !71)
!75 = !DILocation(line: 91, column: 27, scope: !68)
!76 = !DILocation(line: 94, column: 22, scope: !68)
!77 = !DILocation(line: 94, column: 12, scope: !68)
!78 = !DILocation(line: 94, column: 5, scope: !68)
!79 = !DILocation(line: 96, column: 5, scope: !68)
!80 = !DILocation(line: 97, column: 5, scope: !68)
!81 = !DILocation(line: 98, column: 5, scope: !68)
!82 = !DILocation(line: 101, column: 5, scope: !68)
!83 = !DILocation(line: 102, column: 5, scope: !68)
!84 = !DILocation(line: 103, column: 5, scope: !68)
!85 = !DILocation(line: 105, column: 5, scope: !68)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "h", scope: !86, file: !14, line: 54, type: !18)
!88 = !DILocation(line: 54, column: 9, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 55, type: !4)
!90 = !DILocation(line: 55, column: 12, scope: !86)
!91 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !14, line: 56, type: !4)
!92 = !DILocation(line: 56, column: 12, scope: !86)
!93 = !DILocation(line: 56, column: 33, scope: !86)
!94 = !DILocation(line: 57, column: 12, scope: !86)
!95 = !DILocation(line: 57, column: 5, scope: !86)
!96 = !DILocation(line: 58, column: 5, scope: !86)
!97 = !DILocation(line: 58, column: 23, scope: !86)
!98 = !DILocation(line: 59, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !86, file: !14, line: 59, column: 5)
!100 = !DILocation(line: 59, column: 9, scope: !99)
!101 = !DILocation(line: 59, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !14, line: 59, column: 5)
!103 = !DILocation(line: 59, column: 18, scope: !102)
!104 = !DILocation(line: 59, column: 5, scope: !99)
!105 = !DILocation(line: 62, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !14, line: 60, column: 5)
!107 = !DILocation(line: 62, column: 14, scope: !106)
!108 = !DILocation(line: 63, column: 5, scope: !106)
!109 = !DILocation(line: 59, column: 24, scope: !102)
!110 = !DILocation(line: 59, column: 5, scope: !102)
!111 = distinct !{!111, !104, !112, !45}
!112 = !DILocation(line: 63, column: 5, scope: !99)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !14, line: 65, type: !48)
!114 = distinct !DILexicalBlock(scope: !86, file: !14, line: 64, column: 5)
!115 = !DILocation(line: 65, column: 14, scope: !114)
!116 = !DILocation(line: 66, column: 9, scope: !114)
!117 = !DILocation(line: 67, column: 9, scope: !114)
!118 = !DILocation(line: 67, column: 21, scope: !114)
!119 = !DILocation(line: 69, column: 17, scope: !114)
!120 = !DILocation(line: 69, column: 23, scope: !114)
!121 = !DILocation(line: 69, column: 36, scope: !114)
!122 = !DILocation(line: 69, column: 29, scope: !114)
!123 = !DILocation(line: 69, column: 9, scope: !114)
!124 = !DILocation(line: 71, column: 9, scope: !114)
!125 = !DILocation(line: 71, column: 21, scope: !114)
!126 = !DILocation(line: 72, column: 19, scope: !114)
!127 = !DILocation(line: 72, column: 9, scope: !114)
!128 = !DILocation(line: 74, column: 1, scope: !86)
