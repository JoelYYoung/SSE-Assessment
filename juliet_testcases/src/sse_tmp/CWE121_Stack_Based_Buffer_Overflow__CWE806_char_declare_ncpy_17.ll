; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  store i8* %arraydecay, i8** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %3, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !52
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !53
  %5 = load i8*, i8** %data, align 8, !dbg !54
  %6 = load i8*, i8** %data, align 8, !dbg !55
  %call = call i64 @strlen(i8* %6) #6, !dbg !56
  %call2 = call i8* @strncpy(i8* %arraydecay1, i8* %5, i64 %call) #7, !dbg !57
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !58
  store i8 0, i8* %arrayidx3, align 1, !dbg !59
  %7 = load i8*, i8** %data, align 8, !dbg !60
  call void @printLine(i8* %7), !dbg !61
  ret void, !dbg !62
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !91
  store i8* %arraydecay, i8** %data, align 8, !dbg !92
  store i32 0, i32* %h, align 4, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !96
  %cmp = icmp slt i32 %0, 1, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %h, align 4, !dbg !106
  %inc = add nsw i32 %3, 1, !dbg !106
  store i32 %inc, i32* %h, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !112
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !113
  %5 = load i8*, i8** %data, align 8, !dbg !114
  %6 = load i8*, i8** %data, align 8, !dbg !115
  %call = call i64 @strlen(i8* %6) #6, !dbg !116
  %call2 = call i8* @strncpy(i8* %arraydecay1, i8* %5, i64 %call) #7, !dbg !117
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !118
  store i8 0, i8* %arrayidx3, align 1, !dbg !119
  %7 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %7), !dbg !121
  ret void, !dbg !122
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17.c", directory: "/root/SSE-Assessment")
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
!27 = !DILocation(line: 28, column: 12, scope: !11)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocation(line: 29, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!31 = !DILocation(line: 29, column: 9, scope: !30)
!32 = !DILocation(line: 29, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 5, scope: !30)
!36 = !DILocation(line: 32, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 30, column: 5)
!38 = !DILocation(line: 32, column: 9, scope: !37)
!39 = !DILocation(line: 33, column: 9, scope: !37)
!40 = !DILocation(line: 33, column: 21, scope: !37)
!41 = !DILocation(line: 34, column: 5, scope: !37)
!42 = !DILocation(line: 29, column: 24, scope: !33)
!43 = !DILocation(line: 29, column: 5, scope: !33)
!44 = distinct !{!44, !35, !45, !46}
!45 = !DILocation(line: 34, column: 5, scope: !30)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 36, type: !49)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 400, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 50)
!52 = !DILocation(line: 36, column: 14, scope: !48)
!53 = !DILocation(line: 38, column: 17, scope: !48)
!54 = !DILocation(line: 38, column: 23, scope: !48)
!55 = !DILocation(line: 38, column: 36, scope: !48)
!56 = !DILocation(line: 38, column: 29, scope: !48)
!57 = !DILocation(line: 38, column: 9, scope: !48)
!58 = !DILocation(line: 39, column: 9, scope: !48)
!59 = !DILocation(line: 39, column: 20, scope: !48)
!60 = !DILocation(line: 40, column: 19, scope: !48)
!61 = !DILocation(line: 40, column: 9, scope: !48)
!62 = !DILocation(line: 42, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_17_good", scope: !12, file: !12, line: 70, type: !13, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 72, column: 5, scope: !63)
!65 = !DILocation(line: 73, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 85, type: !67, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!16, !16, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 85, type: !16)
!71 = !DILocation(line: 85, column: 14, scope: !66)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 85, type: !69)
!73 = !DILocation(line: 85, column: 27, scope: !66)
!74 = !DILocation(line: 88, column: 22, scope: !66)
!75 = !DILocation(line: 88, column: 12, scope: !66)
!76 = !DILocation(line: 88, column: 5, scope: !66)
!77 = !DILocation(line: 90, column: 5, scope: !66)
!78 = !DILocation(line: 91, column: 5, scope: !66)
!79 = !DILocation(line: 92, column: 5, scope: !66)
!80 = !DILocation(line: 95, column: 5, scope: !66)
!81 = !DILocation(line: 96, column: 5, scope: !66)
!82 = !DILocation(line: 97, column: 5, scope: !66)
!83 = !DILocation(line: 99, column: 5, scope: !66)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "h", scope: !84, file: !12, line: 51, type: !16)
!86 = !DILocation(line: 51, column: 9, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 52, type: !19)
!88 = !DILocation(line: 52, column: 12, scope: !84)
!89 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !12, line: 53, type: !23)
!90 = !DILocation(line: 53, column: 10, scope: !84)
!91 = !DILocation(line: 54, column: 12, scope: !84)
!92 = !DILocation(line: 54, column: 10, scope: !84)
!93 = !DILocation(line: 55, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !84, file: !12, line: 55, column: 5)
!95 = !DILocation(line: 55, column: 9, scope: !94)
!96 = !DILocation(line: 55, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !12, line: 55, column: 5)
!98 = !DILocation(line: 55, column: 18, scope: !97)
!99 = !DILocation(line: 55, column: 5, scope: !94)
!100 = !DILocation(line: 58, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 56, column: 5)
!102 = !DILocation(line: 58, column: 9, scope: !101)
!103 = !DILocation(line: 59, column: 9, scope: !101)
!104 = !DILocation(line: 59, column: 20, scope: !101)
!105 = !DILocation(line: 60, column: 5, scope: !101)
!106 = !DILocation(line: 55, column: 24, scope: !97)
!107 = !DILocation(line: 55, column: 5, scope: !97)
!108 = distinct !{!108, !99, !109, !46}
!109 = !DILocation(line: 60, column: 5, scope: !94)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !12, line: 62, type: !49)
!111 = distinct !DILexicalBlock(scope: !84, file: !12, line: 61, column: 5)
!112 = !DILocation(line: 62, column: 14, scope: !111)
!113 = !DILocation(line: 64, column: 17, scope: !111)
!114 = !DILocation(line: 64, column: 23, scope: !111)
!115 = !DILocation(line: 64, column: 36, scope: !111)
!116 = !DILocation(line: 64, column: 29, scope: !111)
!117 = !DILocation(line: 64, column: 9, scope: !111)
!118 = !DILocation(line: 65, column: 9, scope: !111)
!119 = !DILocation(line: 65, column: 20, scope: !111)
!120 = !DILocation(line: 66, column: 19, scope: !111)
!121 = !DILocation(line: 66, column: 9, scope: !111)
!122 = !DILocation(line: 68, column: 1, scope: !84)
