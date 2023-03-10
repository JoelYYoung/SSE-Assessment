; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memmove_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !27
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %0, 1, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !39
  store i8* %add.ptr, i8** %data, align 8, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %1, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %2 = load i8*, i8** %data, align 8, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !54
  %3 = load i8*, i8** %data, align 8, !dbg !55
  %arrayidx5 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !55
  store i8 0, i8* %arrayidx5, align 1, !dbg !56
  %4 = load i8*, i8** %data, align 8, !dbg !57
  call void @printLine(i8* %4), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memmove_17_good() #0 !dbg !60 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE124_Buffer_Underwrite__char_declare_memmove_17_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE124_Buffer_Underwrite__char_declare_memmove_17_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !88
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  store i32 0, i32* %h, align 4, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !94
  %cmp = icmp slt i32 %0, 1, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !98
  store i8* %arraydecay1, i8** %data, align 8, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !102
  %inc = add nsw i32 %1, 1, !dbg !102
  store i32 %inc, i32* %h, align 4, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !109
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx3, align 1, !dbg !111
  %2 = load i8*, i8** %data, align 8, !dbg !112
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !113
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !113
  %3 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx5 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !114
  store i8 0, i8* %arrayidx5, align 1, !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  call void @printLine(i8* %4), !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memmove_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 26, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 27, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 28, column: 5, scope: !11)
!28 = !DILocation(line: 29, column: 5, scope: !11)
!29 = !DILocation(line: 29, column: 23, scope: !11)
!30 = !DILocation(line: 30, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!32 = !DILocation(line: 30, column: 9, scope: !31)
!33 = !DILocation(line: 30, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 30, column: 5)
!35 = !DILocation(line: 30, column: 18, scope: !34)
!36 = !DILocation(line: 30, column: 5, scope: !31)
!37 = !DILocation(line: 33, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 31, column: 5)
!39 = !DILocation(line: 33, column: 27, scope: !38)
!40 = !DILocation(line: 33, column: 14, scope: !38)
!41 = !DILocation(line: 34, column: 5, scope: !38)
!42 = !DILocation(line: 30, column: 24, scope: !34)
!43 = !DILocation(line: 30, column: 5, scope: !34)
!44 = distinct !{!44, !36, !45, !46}
!45 = !DILocation(line: 34, column: 5, scope: !31)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "source", scope: !48, file: !12, line: 36, type: !23)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!49 = !DILocation(line: 36, column: 14, scope: !48)
!50 = !DILocation(line: 37, column: 9, scope: !48)
!51 = !DILocation(line: 38, column: 9, scope: !48)
!52 = !DILocation(line: 38, column: 23, scope: !48)
!53 = !DILocation(line: 40, column: 17, scope: !48)
!54 = !DILocation(line: 40, column: 9, scope: !48)
!55 = !DILocation(line: 42, column: 9, scope: !48)
!56 = !DILocation(line: 42, column: 21, scope: !48)
!57 = !DILocation(line: 43, column: 19, scope: !48)
!58 = !DILocation(line: 43, column: 9, scope: !48)
!59 = !DILocation(line: 45, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memmove_17_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 78, column: 5, scope: !60)
!62 = !DILocation(line: 79, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !64, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!16, !16, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 91, type: !16)
!68 = !DILocation(line: 91, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 91, type: !66)
!70 = !DILocation(line: 91, column: 27, scope: !63)
!71 = !DILocation(line: 94, column: 22, scope: !63)
!72 = !DILocation(line: 94, column: 12, scope: !63)
!73 = !DILocation(line: 94, column: 5, scope: !63)
!74 = !DILocation(line: 96, column: 5, scope: !63)
!75 = !DILocation(line: 97, column: 5, scope: !63)
!76 = !DILocation(line: 98, column: 5, scope: !63)
!77 = !DILocation(line: 101, column: 5, scope: !63)
!78 = !DILocation(line: 102, column: 5, scope: !63)
!79 = !DILocation(line: 103, column: 5, scope: !63)
!80 = !DILocation(line: 105, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "h", scope: !81, file: !12, line: 54, type: !16)
!83 = !DILocation(line: 54, column: 9, scope: !81)
!84 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 55, type: !19)
!85 = !DILocation(line: 55, column: 12, scope: !81)
!86 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !12, line: 56, type: !23)
!87 = !DILocation(line: 56, column: 10, scope: !81)
!88 = !DILocation(line: 57, column: 5, scope: !81)
!89 = !DILocation(line: 58, column: 5, scope: !81)
!90 = !DILocation(line: 58, column: 23, scope: !81)
!91 = !DILocation(line: 59, column: 11, scope: !92)
!92 = distinct !DILexicalBlock(scope: !81, file: !12, line: 59, column: 5)
!93 = !DILocation(line: 59, column: 9, scope: !92)
!94 = !DILocation(line: 59, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !12, line: 59, column: 5)
!96 = !DILocation(line: 59, column: 18, scope: !95)
!97 = !DILocation(line: 59, column: 5, scope: !92)
!98 = !DILocation(line: 62, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 60, column: 5)
!100 = !DILocation(line: 62, column: 14, scope: !99)
!101 = !DILocation(line: 63, column: 5, scope: !99)
!102 = !DILocation(line: 59, column: 24, scope: !95)
!103 = !DILocation(line: 59, column: 5, scope: !95)
!104 = distinct !{!104, !97, !105, !46}
!105 = !DILocation(line: 63, column: 5, scope: !92)
!106 = !DILocalVariable(name: "source", scope: !107, file: !12, line: 65, type: !23)
!107 = distinct !DILexicalBlock(scope: !81, file: !12, line: 64, column: 5)
!108 = !DILocation(line: 65, column: 14, scope: !107)
!109 = !DILocation(line: 66, column: 9, scope: !107)
!110 = !DILocation(line: 67, column: 9, scope: !107)
!111 = !DILocation(line: 67, column: 23, scope: !107)
!112 = !DILocation(line: 69, column: 17, scope: !107)
!113 = !DILocation(line: 69, column: 9, scope: !107)
!114 = !DILocation(line: 71, column: 9, scope: !107)
!115 = !DILocation(line: 71, column: 21, scope: !107)
!116 = !DILocation(line: 72, column: 19, scope: !107)
!117 = !DILocation(line: 72, column: 9, scope: !107)
!118 = !DILocation(line: 74, column: 1, scope: !81)
