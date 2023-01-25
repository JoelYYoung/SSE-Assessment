; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_07_bad() #0 !dbg !16 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticFive, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !23, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !36, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !38
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !44
  %cmp1 = icmp slt i32 %1, 99, !dbg !46
  br i1 %cmp1, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !48
  %idxprom = sext i32 %2 to i64, !dbg !50
  %arrayidx2 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !50
  %3 = load i8, i8* %arrayidx2, align 1, !dbg !50
  %4 = load i32, i32* %i, align 4, !dbg !51
  %idxprom3 = sext i32 %4 to i64, !dbg !52
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom3, !dbg !52
  store i8 %3, i8* %arrayidx4, align 1, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !55
  %inc = add nsw i32 %5, 1, !dbg !55
  store i32 %inc, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @printLine(i8* %arraydecay5), !dbg !61
  br label %if.end, !dbg !62

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_07_good() #0 !dbg !64 {
entry:
  call void @good1(), !dbg !65
  call void @good2(), !dbg !66
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__CWE170_char_loop_07_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__CWE170_char_loop_07_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !87 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticFive, align 4, !dbg !88
  %cmp = icmp ne i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !95, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %i, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !103
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  store i32 0, i32* %i, align 4, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %if.else
  %1 = load i32, i32* %i, align 4, !dbg !109
  %cmp1 = icmp slt i32 %1, 99, !dbg !111
  br i1 %cmp1, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !113
  %idxprom = sext i32 %2 to i64, !dbg !115
  %arrayidx2 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !115
  %3 = load i8, i8* %arrayidx2, align 1, !dbg !115
  %4 = load i32, i32* %i, align 4, !dbg !116
  %idxprom3 = sext i32 %4 to i64, !dbg !117
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom3, !dbg !117
  store i8 %3, i8* %arrayidx4, align 1, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !120
  %inc = add nsw i32 %5, 1, !dbg !120
  store i32 %inc, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx5, align 1, !dbg !125
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @printLine(i8* %arraydecay6), !dbg !127
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !129 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @staticFive, align 4, !dbg !130
  %cmp = icmp eq i32 %0, 5, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !134, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32* %i, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !142
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !143
  store i8 0, i8* %arrayidx, align 1, !dbg !144
  store i32 0, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !148
  %cmp1 = icmp slt i32 %1, 99, !dbg !150
  br i1 %cmp1, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !152
  %idxprom = sext i32 %2 to i64, !dbg !154
  %arrayidx2 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !154
  %3 = load i8, i8* %arrayidx2, align 1, !dbg !154
  %4 = load i32, i32* %i, align 4, !dbg !155
  %idxprom3 = sext i32 %4 to i64, !dbg !156
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom3, !dbg !156
  store i8 %3, i8* %arrayidx4, align 1, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !159
  %inc = add nsw i32 %5, 1, !dbg !159
  store i32 %inc, i32* %i, align 4, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !163
  store i8 0, i8* %arrayidx5, align 1, !dbg !164
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !165
  call void @printLine(i8* %arraydecay6), !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 29, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !8, line: 29, column: 8)
!21 = !DILocation(line: 29, column: 18, scope: !20)
!22 = !DILocation(line: 29, column: 8, scope: !16)
!23 = !DILocalVariable(name: "src", scope: !24, file: !8, line: 32, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !8, line: 31, column: 9)
!25 = distinct !DILexicalBlock(scope: !20, file: !8, line: 30, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 1200, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 150)
!30 = !DILocation(line: 32, column: 18, scope: !24)
!31 = !DILocalVariable(name: "dest", scope: !24, file: !8, line: 32, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 32, column: 28, scope: !24)
!36 = !DILocalVariable(name: "i", scope: !24, file: !8, line: 33, type: !9)
!37 = !DILocation(line: 33, column: 17, scope: !24)
!38 = !DILocation(line: 35, column: 13, scope: !24)
!39 = !DILocation(line: 36, column: 13, scope: !24)
!40 = !DILocation(line: 36, column: 22, scope: !24)
!41 = !DILocation(line: 37, column: 18, scope: !42)
!42 = distinct !DILexicalBlock(scope: !24, file: !8, line: 37, column: 13)
!43 = !DILocation(line: 37, column: 17, scope: !42)
!44 = !DILocation(line: 37, column: 22, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !8, line: 37, column: 13)
!46 = !DILocation(line: 37, column: 24, scope: !45)
!47 = !DILocation(line: 37, column: 13, scope: !42)
!48 = !DILocation(line: 39, column: 31, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !8, line: 38, column: 13)
!50 = !DILocation(line: 39, column: 27, scope: !49)
!51 = !DILocation(line: 39, column: 22, scope: !49)
!52 = !DILocation(line: 39, column: 17, scope: !49)
!53 = !DILocation(line: 39, column: 25, scope: !49)
!54 = !DILocation(line: 40, column: 13, scope: !49)
!55 = !DILocation(line: 37, column: 31, scope: !45)
!56 = !DILocation(line: 37, column: 13, scope: !45)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 40, column: 13, scope: !42)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 42, column: 23, scope: !24)
!61 = !DILocation(line: 42, column: 13, scope: !24)
!62 = !DILocation(line: 44, column: 5, scope: !25)
!63 = !DILocation(line: 45, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_07_good", scope: !8, file: !8, line: 98, type: !17, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocation(line: 100, column: 5, scope: !64)
!66 = !DILocation(line: 101, column: 5, scope: !64)
!67 = !DILocation(line: 102, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 113, type: !69, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!9, !9, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !8, line: 113, type: !9)
!74 = !DILocation(line: 113, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !8, line: 113, type: !71)
!76 = !DILocation(line: 113, column: 27, scope: !68)
!77 = !DILocation(line: 116, column: 22, scope: !68)
!78 = !DILocation(line: 116, column: 12, scope: !68)
!79 = !DILocation(line: 116, column: 5, scope: !68)
!80 = !DILocation(line: 118, column: 5, scope: !68)
!81 = !DILocation(line: 119, column: 5, scope: !68)
!82 = !DILocation(line: 120, column: 5, scope: !68)
!83 = !DILocation(line: 123, column: 5, scope: !68)
!84 = !DILocation(line: 124, column: 5, scope: !68)
!85 = !DILocation(line: 125, column: 5, scope: !68)
!86 = !DILocation(line: 127, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocation(line: 54, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !87, file: !8, line: 54, column: 8)
!90 = !DILocation(line: 54, column: 18, scope: !89)
!91 = !DILocation(line: 54, column: 8, scope: !87)
!92 = !DILocation(line: 57, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !8, line: 55, column: 5)
!94 = !DILocation(line: 58, column: 5, scope: !93)
!95 = !DILocalVariable(name: "src", scope: !96, file: !8, line: 62, type: !26)
!96 = distinct !DILexicalBlock(scope: !97, file: !8, line: 61, column: 9)
!97 = distinct !DILexicalBlock(scope: !89, file: !8, line: 60, column: 5)
!98 = !DILocation(line: 62, column: 18, scope: !96)
!99 = !DILocalVariable(name: "dest", scope: !96, file: !8, line: 62, type: !32)
!100 = !DILocation(line: 62, column: 28, scope: !96)
!101 = !DILocalVariable(name: "i", scope: !96, file: !8, line: 63, type: !9)
!102 = !DILocation(line: 63, column: 17, scope: !96)
!103 = !DILocation(line: 65, column: 13, scope: !96)
!104 = !DILocation(line: 66, column: 13, scope: !96)
!105 = !DILocation(line: 66, column: 22, scope: !96)
!106 = !DILocation(line: 67, column: 18, scope: !107)
!107 = distinct !DILexicalBlock(scope: !96, file: !8, line: 67, column: 13)
!108 = !DILocation(line: 67, column: 17, scope: !107)
!109 = !DILocation(line: 67, column: 22, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !8, line: 67, column: 13)
!111 = !DILocation(line: 67, column: 24, scope: !110)
!112 = !DILocation(line: 67, column: 13, scope: !107)
!113 = !DILocation(line: 69, column: 31, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !8, line: 68, column: 13)
!115 = !DILocation(line: 69, column: 27, scope: !114)
!116 = !DILocation(line: 69, column: 22, scope: !114)
!117 = !DILocation(line: 69, column: 17, scope: !114)
!118 = !DILocation(line: 69, column: 25, scope: !114)
!119 = !DILocation(line: 70, column: 13, scope: !114)
!120 = !DILocation(line: 67, column: 31, scope: !110)
!121 = !DILocation(line: 67, column: 13, scope: !110)
!122 = distinct !{!122, !112, !123, !59}
!123 = !DILocation(line: 70, column: 13, scope: !107)
!124 = !DILocation(line: 71, column: 13, scope: !96)
!125 = !DILocation(line: 71, column: 22, scope: !96)
!126 = !DILocation(line: 72, column: 23, scope: !96)
!127 = !DILocation(line: 72, column: 13, scope: !96)
!128 = !DILocation(line: 75, column: 1, scope: !87)
!129 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocation(line: 80, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !129, file: !8, line: 80, column: 8)
!132 = !DILocation(line: 80, column: 18, scope: !131)
!133 = !DILocation(line: 80, column: 8, scope: !129)
!134 = !DILocalVariable(name: "src", scope: !135, file: !8, line: 83, type: !26)
!135 = distinct !DILexicalBlock(scope: !136, file: !8, line: 82, column: 9)
!136 = distinct !DILexicalBlock(scope: !131, file: !8, line: 81, column: 5)
!137 = !DILocation(line: 83, column: 18, scope: !135)
!138 = !DILocalVariable(name: "dest", scope: !135, file: !8, line: 83, type: !32)
!139 = !DILocation(line: 83, column: 28, scope: !135)
!140 = !DILocalVariable(name: "i", scope: !135, file: !8, line: 84, type: !9)
!141 = !DILocation(line: 84, column: 17, scope: !135)
!142 = !DILocation(line: 86, column: 13, scope: !135)
!143 = !DILocation(line: 87, column: 13, scope: !135)
!144 = !DILocation(line: 87, column: 22, scope: !135)
!145 = !DILocation(line: 88, column: 18, scope: !146)
!146 = distinct !DILexicalBlock(scope: !135, file: !8, line: 88, column: 13)
!147 = !DILocation(line: 88, column: 17, scope: !146)
!148 = !DILocation(line: 88, column: 22, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !8, line: 88, column: 13)
!150 = !DILocation(line: 88, column: 24, scope: !149)
!151 = !DILocation(line: 88, column: 13, scope: !146)
!152 = !DILocation(line: 90, column: 31, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !8, line: 89, column: 13)
!154 = !DILocation(line: 90, column: 27, scope: !153)
!155 = !DILocation(line: 90, column: 22, scope: !153)
!156 = !DILocation(line: 90, column: 17, scope: !153)
!157 = !DILocation(line: 90, column: 25, scope: !153)
!158 = !DILocation(line: 91, column: 13, scope: !153)
!159 = !DILocation(line: 88, column: 31, scope: !149)
!160 = !DILocation(line: 88, column: 13, scope: !149)
!161 = distinct !{!161, !151, !162, !59}
!162 = !DILocation(line: 91, column: 13, scope: !146)
!163 = !DILocation(line: 92, column: 13, scope: !135)
!164 = !DILocation(line: 92, column: 22, scope: !135)
!165 = !DILocation(line: 93, column: 23, scope: !135)
!166 = !DILocation(line: 93, column: 13, scope: !135)
!167 = !DILocation(line: 95, column: 5, scope: !136)
!168 = !DILocation(line: 96, column: 1, scope: !129)
