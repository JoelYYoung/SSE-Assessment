; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_13_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !15
  %cmp = icmp eq i32 %0, 5, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !18

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !19, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !35
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !41
  %cmp1 = icmp slt i32 %1, 99, !dbg !43
  br i1 %cmp1, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !45
  %idxprom = sext i32 %2 to i64, !dbg !47
  %arrayidx2 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !47
  %3 = load i8, i8* %arrayidx2, align 1, !dbg !47
  %4 = load i32, i32* %i, align 4, !dbg !48
  %idxprom3 = sext i32 %4 to i64, !dbg !49
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom3, !dbg !49
  store i8 %3, i8* %arrayidx4, align 1, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %5, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @printLine(i8* %arraydecay5), !dbg !58
  br label %if.end, !dbg !59

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_13_good() #0 !dbg !61 {
entry:
  call void @good1(), !dbg !62
  call void @good2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #5, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #5, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__CWE170_char_loop_13_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__CWE170_char_loop_13_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !84 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !85
  %cmp = icmp ne i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !92, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %i, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !100
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  store i32 0, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %if.else
  %1 = load i32, i32* %i, align 4, !dbg !106
  %cmp1 = icmp slt i32 %1, 99, !dbg !108
  br i1 %cmp1, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !110
  %idxprom = sext i32 %2 to i64, !dbg !112
  %arrayidx2 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !112
  %3 = load i8, i8* %arrayidx2, align 1, !dbg !112
  %4 = load i32, i32* %i, align 4, !dbg !113
  %idxprom3 = sext i32 %4 to i64, !dbg !114
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom3, !dbg !114
  store i8 %3, i8* %arrayidx4, align 1, !dbg !115
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !117
  %inc = add nsw i32 %5, 1, !dbg !117
  store i32 %inc, i32* %i, align 4, !dbg !117
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx5, align 1, !dbg !122
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !123
  call void @printLine(i8* %arraydecay6), !dbg !124
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !126 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !127
  %cmp = icmp eq i32 %0, 5, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !131, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i32* %i, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !139
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !140
  store i8 0, i8* %arrayidx, align 1, !dbg !141
  store i32 0, i32* %i, align 4, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4, !dbg !145
  %cmp1 = icmp slt i32 %1, 99, !dbg !147
  br i1 %cmp1, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !149
  %idxprom = sext i32 %2 to i64, !dbg !151
  %arrayidx2 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !151
  %3 = load i8, i8* %arrayidx2, align 1, !dbg !151
  %4 = load i32, i32* %i, align 4, !dbg !152
  %idxprom3 = sext i32 %4 to i64, !dbg !153
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom3, !dbg !153
  store i8 %3, i8* %arrayidx4, align 1, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !156
  %inc = add nsw i32 %5, 1, !dbg !156
  store i32 %inc, i32* %i, align 4, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !160
  store i8 0, i8* %arrayidx5, align 1, !dbg !161
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !162
  call void @printLine(i8* %arraydecay6), !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_13_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 25, scope: !16)
!18 = !DILocation(line: 24, column: 8, scope: !11)
!19 = !DILocalVariable(name: "src", scope: !20, file: !12, line: 27, type: !22)
!20 = distinct !DILexicalBlock(scope: !21, file: !12, line: 26, column: 9)
!21 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1200, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 150)
!26 = !DILocation(line: 27, column: 18, scope: !20)
!27 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 27, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 27, column: 28, scope: !20)
!32 = !DILocalVariable(name: "i", scope: !20, file: !12, line: 28, type: !33)
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !DILocation(line: 28, column: 17, scope: !20)
!35 = !DILocation(line: 30, column: 13, scope: !20)
!36 = !DILocation(line: 31, column: 13, scope: !20)
!37 = !DILocation(line: 31, column: 22, scope: !20)
!38 = !DILocation(line: 32, column: 18, scope: !39)
!39 = distinct !DILexicalBlock(scope: !20, file: !12, line: 32, column: 13)
!40 = !DILocation(line: 32, column: 17, scope: !39)
!41 = !DILocation(line: 32, column: 22, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 32, column: 13)
!43 = !DILocation(line: 32, column: 24, scope: !42)
!44 = !DILocation(line: 32, column: 13, scope: !39)
!45 = !DILocation(line: 34, column: 31, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 33, column: 13)
!47 = !DILocation(line: 34, column: 27, scope: !46)
!48 = !DILocation(line: 34, column: 22, scope: !46)
!49 = !DILocation(line: 34, column: 17, scope: !46)
!50 = !DILocation(line: 34, column: 25, scope: !46)
!51 = !DILocation(line: 35, column: 13, scope: !46)
!52 = !DILocation(line: 32, column: 31, scope: !42)
!53 = !DILocation(line: 32, column: 13, scope: !42)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 35, column: 13, scope: !39)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 37, column: 23, scope: !20)
!58 = !DILocation(line: 37, column: 13, scope: !20)
!59 = !DILocation(line: 39, column: 5, scope: !21)
!60 = !DILocation(line: 40, column: 1, scope: !11)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_13_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 95, column: 5, scope: !61)
!63 = !DILocation(line: 96, column: 5, scope: !61)
!64 = !DILocation(line: 97, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 108, type: !66, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!33, !33, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 108, type: !33)
!71 = !DILocation(line: 108, column: 14, scope: !65)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 108, type: !68)
!73 = !DILocation(line: 108, column: 27, scope: !65)
!74 = !DILocation(line: 111, column: 22, scope: !65)
!75 = !DILocation(line: 111, column: 12, scope: !65)
!76 = !DILocation(line: 111, column: 5, scope: !65)
!77 = !DILocation(line: 113, column: 5, scope: !65)
!78 = !DILocation(line: 114, column: 5, scope: !65)
!79 = !DILocation(line: 115, column: 5, scope: !65)
!80 = !DILocation(line: 118, column: 5, scope: !65)
!81 = !DILocation(line: 119, column: 5, scope: !65)
!82 = !DILocation(line: 120, column: 5, scope: !65)
!83 = !DILocation(line: 122, column: 5, scope: !65)
!84 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 49, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !84, file: !12, line: 49, column: 8)
!87 = !DILocation(line: 49, column: 25, scope: !86)
!88 = !DILocation(line: 49, column: 8, scope: !84)
!89 = !DILocation(line: 52, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !12, line: 50, column: 5)
!91 = !DILocation(line: 53, column: 5, scope: !90)
!92 = !DILocalVariable(name: "src", scope: !93, file: !12, line: 57, type: !22)
!93 = distinct !DILexicalBlock(scope: !94, file: !12, line: 56, column: 9)
!94 = distinct !DILexicalBlock(scope: !86, file: !12, line: 55, column: 5)
!95 = !DILocation(line: 57, column: 18, scope: !93)
!96 = !DILocalVariable(name: "dest", scope: !93, file: !12, line: 57, type: !28)
!97 = !DILocation(line: 57, column: 28, scope: !93)
!98 = !DILocalVariable(name: "i", scope: !93, file: !12, line: 58, type: !33)
!99 = !DILocation(line: 58, column: 17, scope: !93)
!100 = !DILocation(line: 60, column: 13, scope: !93)
!101 = !DILocation(line: 61, column: 13, scope: !93)
!102 = !DILocation(line: 61, column: 22, scope: !93)
!103 = !DILocation(line: 62, column: 18, scope: !104)
!104 = distinct !DILexicalBlock(scope: !93, file: !12, line: 62, column: 13)
!105 = !DILocation(line: 62, column: 17, scope: !104)
!106 = !DILocation(line: 62, column: 22, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 62, column: 13)
!108 = !DILocation(line: 62, column: 24, scope: !107)
!109 = !DILocation(line: 62, column: 13, scope: !104)
!110 = !DILocation(line: 64, column: 31, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 63, column: 13)
!112 = !DILocation(line: 64, column: 27, scope: !111)
!113 = !DILocation(line: 64, column: 22, scope: !111)
!114 = !DILocation(line: 64, column: 17, scope: !111)
!115 = !DILocation(line: 64, column: 25, scope: !111)
!116 = !DILocation(line: 65, column: 13, scope: !111)
!117 = !DILocation(line: 62, column: 31, scope: !107)
!118 = !DILocation(line: 62, column: 13, scope: !107)
!119 = distinct !{!119, !109, !120, !56}
!120 = !DILocation(line: 65, column: 13, scope: !104)
!121 = !DILocation(line: 66, column: 13, scope: !93)
!122 = !DILocation(line: 66, column: 22, scope: !93)
!123 = !DILocation(line: 67, column: 23, scope: !93)
!124 = !DILocation(line: 67, column: 13, scope: !93)
!125 = !DILocation(line: 70, column: 1, scope: !84)
!126 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocation(line: 75, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !126, file: !12, line: 75, column: 8)
!129 = !DILocation(line: 75, column: 25, scope: !128)
!130 = !DILocation(line: 75, column: 8, scope: !126)
!131 = !DILocalVariable(name: "src", scope: !132, file: !12, line: 78, type: !22)
!132 = distinct !DILexicalBlock(scope: !133, file: !12, line: 77, column: 9)
!133 = distinct !DILexicalBlock(scope: !128, file: !12, line: 76, column: 5)
!134 = !DILocation(line: 78, column: 18, scope: !132)
!135 = !DILocalVariable(name: "dest", scope: !132, file: !12, line: 78, type: !28)
!136 = !DILocation(line: 78, column: 28, scope: !132)
!137 = !DILocalVariable(name: "i", scope: !132, file: !12, line: 79, type: !33)
!138 = !DILocation(line: 79, column: 17, scope: !132)
!139 = !DILocation(line: 81, column: 13, scope: !132)
!140 = !DILocation(line: 82, column: 13, scope: !132)
!141 = !DILocation(line: 82, column: 22, scope: !132)
!142 = !DILocation(line: 83, column: 18, scope: !143)
!143 = distinct !DILexicalBlock(scope: !132, file: !12, line: 83, column: 13)
!144 = !DILocation(line: 83, column: 17, scope: !143)
!145 = !DILocation(line: 83, column: 22, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 83, column: 13)
!147 = !DILocation(line: 83, column: 24, scope: !146)
!148 = !DILocation(line: 83, column: 13, scope: !143)
!149 = !DILocation(line: 85, column: 31, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !12, line: 84, column: 13)
!151 = !DILocation(line: 85, column: 27, scope: !150)
!152 = !DILocation(line: 85, column: 22, scope: !150)
!153 = !DILocation(line: 85, column: 17, scope: !150)
!154 = !DILocation(line: 85, column: 25, scope: !150)
!155 = !DILocation(line: 86, column: 13, scope: !150)
!156 = !DILocation(line: 83, column: 31, scope: !146)
!157 = !DILocation(line: 83, column: 13, scope: !146)
!158 = distinct !{!158, !148, !159, !56}
!159 = !DILocation(line: 86, column: 13, scope: !143)
!160 = !DILocation(line: 87, column: 13, scope: !132)
!161 = !DILocation(line: 87, column: 22, scope: !132)
!162 = !DILocation(line: 88, column: 23, scope: !132)
!163 = !DILocation(line: 88, column: 13, scope: !132)
!164 = !DILocation(line: 90, column: 5, scope: !133)
!165 = !DILocation(line: 91, column: 1, scope: !126)
