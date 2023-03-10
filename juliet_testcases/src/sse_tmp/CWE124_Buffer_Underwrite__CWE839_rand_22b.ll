; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_22b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__CWE839_rand_22_badGlobal = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE124_Buffer_Underwrite__CWE839_rand_22_goodB2G1Global = external dso_local global i32, align 4
@.str.1 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@CWE124_Buffer_Underwrite__CWE839_rand_22_goodB2G2Global = external dso_local global i32, align 4
@CWE124_Buffer_Underwrite__CWE839_rand_22_goodG2BGlobal = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_22_badSink(i32 %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__CWE839_rand_22_badGlobal, align 4, !dbg !16
  %tobool = icmp ne i32 %0, 0, !dbg !16
  br i1 %tobool, label %if.then, label %if.end5, !dbg !18

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !27
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !27
  %2 = load i32, i32* %data.addr, align 4, !dbg !28
  %cmp = icmp slt i32 %2, 10, !dbg !30
  br i1 %cmp, label %if.then1, label %if.else, !dbg !31

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !32
  %idxprom = sext i32 %3 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !34
  store i32 1, i32* %arrayidx, align 4, !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !39
  %cmp2 = icmp slt i32 %4, 10, !dbg !41
  br i1 %cmp2, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !43
  %idxprom3 = sext i32 %5 to i64, !dbg !45
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !45
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !45
  call void @printIntLine(i32 %6), !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %7, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !53

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !54
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !56

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_22_goodB2G1Sink(i32 %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__CWE839_rand_22_goodB2G1Global, align 4, !dbg !61
  %tobool = icmp ne i32 %0, 0, !dbg !61
  br i1 %tobool, label %if.then, label %if.else, !dbg !63

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  br label %if.end7, !dbg !66

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !67, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !71, metadata !DIExpression()), !dbg !72
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !72
  %2 = load i32, i32* %data.addr, align 4, !dbg !73
  %cmp = icmp sge i32 %2, 0, !dbg !75
  br i1 %cmp, label %land.lhs.true, label %if.else6, !dbg !76

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !77
  %cmp1 = icmp slt i32 %3, 10, !dbg !78
  br i1 %cmp1, label %if.then2, label %if.else6, !dbg !79

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !80
  %idxprom = sext i32 %4 to i64, !dbg !82
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !82
  store i32 1, i32* %arrayidx, align 4, !dbg !83
  store i32 0, i32* %i, align 4, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !87
  %cmp3 = icmp slt i32 %5, 10, !dbg !89
  br i1 %cmp3, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !91
  %idxprom4 = sext i32 %6 to i64, !dbg !93
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !93
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !93
  call void @printIntLine(i32 %7), !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !96
  %inc = add nsw i32 %8, 1, !dbg !96
  store i32 %inc, i32* %i, align 4, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !100

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else6, %for.end
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_22_goodB2G2Sink(i32 %data) #0 !dbg !104 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__CWE839_rand_22_goodB2G2Global, align 4, !dbg !107
  %tobool = icmp ne i32 %0, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.end6, !dbg !109

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !110, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !114, metadata !DIExpression()), !dbg !115
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !115
  %2 = load i32, i32* %data.addr, align 4, !dbg !116
  %cmp = icmp sge i32 %2, 0, !dbg !118
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !119

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !120
  %cmp1 = icmp slt i32 %3, 10, !dbg !121
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !122

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !123
  %idxprom = sext i32 %4 to i64, !dbg !125
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !125
  store i32 1, i32* %arrayidx, align 4, !dbg !126
  store i32 0, i32* %i, align 4, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !130
  %cmp3 = icmp slt i32 %5, 10, !dbg !132
  br i1 %cmp3, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !134
  %idxprom4 = sext i32 %6 to i64, !dbg !136
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !136
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !136
  call void @printIntLine(i32 %7), !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !139
  %inc = add nsw i32 %8, 1, !dbg !139
  store i32 %inc, i32* %i, align 4, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !143

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !144
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end6, !dbg !146

if.end6:                                          ; preds = %if.end, %entry
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_22_goodG2BSink(i32 %data) #0 !dbg !148 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__CWE839_rand_22_goodG2BGlobal, align 4, !dbg !151
  %tobool = icmp ne i32 %0, 0, !dbg !151
  br i1 %tobool, label %if.then, label %if.end5, !dbg !153

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !154, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !158, metadata !DIExpression()), !dbg !159
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !159
  %2 = load i32, i32* %data.addr, align 4, !dbg !160
  %cmp = icmp slt i32 %2, 10, !dbg !162
  br i1 %cmp, label %if.then1, label %if.else, !dbg !163

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !164
  %idxprom = sext i32 %3 to i64, !dbg !166
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !166
  store i32 1, i32* %arrayidx, align 4, !dbg !167
  store i32 0, i32* %i, align 4, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !171
  %cmp2 = icmp slt i32 %4, 10, !dbg !173
  br i1 %cmp2, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !175
  %idxprom3 = sext i32 %5 to i64, !dbg !177
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !177
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !177
  call void @printIntLine(i32 %6), !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !180
  %inc = add nsw i32 %7, 1, !dbg !180
  store i32 %inc, i32* %i, align 4, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !184

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !185
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !187

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_22_badSink", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_22b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 25, type: !13)
!15 = !DILocation(line: 25, column: 59, scope: !9)
!16 = !DILocation(line: 27, column: 8, scope: !17)
!17 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 8)
!18 = !DILocation(line: 27, column: 8, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 30, type: !13)
!20 = distinct !DILexicalBlock(scope: !21, file: !10, line: 29, column: 9)
!21 = distinct !DILexicalBlock(scope: !17, file: !10, line: 28, column: 5)
!22 = !DILocation(line: 30, column: 17, scope: !20)
!23 = !DILocalVariable(name: "buffer", scope: !20, file: !10, line: 31, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 31, column: 17, scope: !20)
!28 = !DILocation(line: 34, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 17)
!30 = !DILocation(line: 34, column: 22, scope: !29)
!31 = !DILocation(line: 34, column: 17, scope: !20)
!32 = !DILocation(line: 36, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 35, column: 13)
!34 = !DILocation(line: 36, column: 17, scope: !33)
!35 = !DILocation(line: 36, column: 30, scope: !33)
!36 = !DILocation(line: 38, column: 23, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 38, column: 17)
!38 = !DILocation(line: 38, column: 21, scope: !37)
!39 = !DILocation(line: 38, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 38, column: 17)
!41 = !DILocation(line: 38, column: 30, scope: !40)
!42 = !DILocation(line: 38, column: 17, scope: !37)
!43 = !DILocation(line: 40, column: 41, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !10, line: 39, column: 17)
!45 = !DILocation(line: 40, column: 34, scope: !44)
!46 = !DILocation(line: 40, column: 21, scope: !44)
!47 = !DILocation(line: 41, column: 17, scope: !44)
!48 = !DILocation(line: 38, column: 37, scope: !40)
!49 = !DILocation(line: 38, column: 17, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 41, column: 17, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 42, column: 13, scope: !33)
!54 = !DILocation(line: 45, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !29, file: !10, line: 44, column: 13)
!56 = !DILocation(line: 48, column: 5, scope: !21)
!57 = !DILocation(line: 49, column: 1, scope: !9)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_22_goodB2G1Sink", scope: !10, file: !10, line: 61, type: !11, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !10, line: 61, type: !13)
!60 = !DILocation(line: 61, column: 64, scope: !58)
!61 = !DILocation(line: 63, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !10, line: 63, column: 8)
!63 = !DILocation(line: 63, column: 8, scope: !58)
!64 = !DILocation(line: 66, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !10, line: 64, column: 5)
!66 = !DILocation(line: 67, column: 5, scope: !65)
!67 = !DILocalVariable(name: "i", scope: !68, file: !10, line: 71, type: !13)
!68 = distinct !DILexicalBlock(scope: !69, file: !10, line: 70, column: 9)
!69 = distinct !DILexicalBlock(scope: !62, file: !10, line: 69, column: 5)
!70 = !DILocation(line: 71, column: 17, scope: !68)
!71 = !DILocalVariable(name: "buffer", scope: !68, file: !10, line: 72, type: !24)
!72 = !DILocation(line: 72, column: 17, scope: !68)
!73 = !DILocation(line: 74, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !10, line: 74, column: 17)
!75 = !DILocation(line: 74, column: 22, scope: !74)
!76 = !DILocation(line: 74, column: 27, scope: !74)
!77 = !DILocation(line: 74, column: 30, scope: !74)
!78 = !DILocation(line: 74, column: 35, scope: !74)
!79 = !DILocation(line: 74, column: 17, scope: !68)
!80 = !DILocation(line: 76, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !74, file: !10, line: 75, column: 13)
!82 = !DILocation(line: 76, column: 17, scope: !81)
!83 = !DILocation(line: 76, column: 30, scope: !81)
!84 = !DILocation(line: 78, column: 23, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !10, line: 78, column: 17)
!86 = !DILocation(line: 78, column: 21, scope: !85)
!87 = !DILocation(line: 78, column: 28, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !10, line: 78, column: 17)
!89 = !DILocation(line: 78, column: 30, scope: !88)
!90 = !DILocation(line: 78, column: 17, scope: !85)
!91 = !DILocation(line: 80, column: 41, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !10, line: 79, column: 17)
!93 = !DILocation(line: 80, column: 34, scope: !92)
!94 = !DILocation(line: 80, column: 21, scope: !92)
!95 = !DILocation(line: 81, column: 17, scope: !92)
!96 = !DILocation(line: 78, column: 37, scope: !88)
!97 = !DILocation(line: 78, column: 17, scope: !88)
!98 = distinct !{!98, !90, !99, !52}
!99 = !DILocation(line: 81, column: 17, scope: !85)
!100 = !DILocation(line: 82, column: 13, scope: !81)
!101 = !DILocation(line: 85, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !74, file: !10, line: 84, column: 13)
!103 = !DILocation(line: 89, column: 1, scope: !58)
!104 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_22_goodB2G2Sink", scope: !10, file: !10, line: 92, type: !11, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", arg: 1, scope: !104, file: !10, line: 92, type: !13)
!106 = !DILocation(line: 92, column: 64, scope: !104)
!107 = !DILocation(line: 94, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !10, line: 94, column: 8)
!109 = !DILocation(line: 94, column: 8, scope: !104)
!110 = !DILocalVariable(name: "i", scope: !111, file: !10, line: 97, type: !13)
!111 = distinct !DILexicalBlock(scope: !112, file: !10, line: 96, column: 9)
!112 = distinct !DILexicalBlock(scope: !108, file: !10, line: 95, column: 5)
!113 = !DILocation(line: 97, column: 17, scope: !111)
!114 = !DILocalVariable(name: "buffer", scope: !111, file: !10, line: 98, type: !24)
!115 = !DILocation(line: 98, column: 17, scope: !111)
!116 = !DILocation(line: 100, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !10, line: 100, column: 17)
!118 = !DILocation(line: 100, column: 22, scope: !117)
!119 = !DILocation(line: 100, column: 27, scope: !117)
!120 = !DILocation(line: 100, column: 30, scope: !117)
!121 = !DILocation(line: 100, column: 35, scope: !117)
!122 = !DILocation(line: 100, column: 17, scope: !111)
!123 = !DILocation(line: 102, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !10, line: 101, column: 13)
!125 = !DILocation(line: 102, column: 17, scope: !124)
!126 = !DILocation(line: 102, column: 30, scope: !124)
!127 = !DILocation(line: 104, column: 23, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !10, line: 104, column: 17)
!129 = !DILocation(line: 104, column: 21, scope: !128)
!130 = !DILocation(line: 104, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !10, line: 104, column: 17)
!132 = !DILocation(line: 104, column: 30, scope: !131)
!133 = !DILocation(line: 104, column: 17, scope: !128)
!134 = !DILocation(line: 106, column: 41, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !10, line: 105, column: 17)
!136 = !DILocation(line: 106, column: 34, scope: !135)
!137 = !DILocation(line: 106, column: 21, scope: !135)
!138 = !DILocation(line: 107, column: 17, scope: !135)
!139 = !DILocation(line: 104, column: 37, scope: !131)
!140 = !DILocation(line: 104, column: 17, scope: !131)
!141 = distinct !{!141, !133, !142, !52}
!142 = !DILocation(line: 107, column: 17, scope: !128)
!143 = !DILocation(line: 108, column: 13, scope: !124)
!144 = !DILocation(line: 111, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !117, file: !10, line: 110, column: 13)
!146 = !DILocation(line: 114, column: 5, scope: !112)
!147 = !DILocation(line: 115, column: 1, scope: !104)
!148 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_22_goodG2BSink", scope: !10, file: !10, line: 118, type: !11, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", arg: 1, scope: !148, file: !10, line: 118, type: !13)
!150 = !DILocation(line: 118, column: 63, scope: !148)
!151 = !DILocation(line: 120, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !10, line: 120, column: 8)
!153 = !DILocation(line: 120, column: 8, scope: !148)
!154 = !DILocalVariable(name: "i", scope: !155, file: !10, line: 123, type: !13)
!155 = distinct !DILexicalBlock(scope: !156, file: !10, line: 122, column: 9)
!156 = distinct !DILexicalBlock(scope: !152, file: !10, line: 121, column: 5)
!157 = !DILocation(line: 123, column: 17, scope: !155)
!158 = !DILocalVariable(name: "buffer", scope: !155, file: !10, line: 124, type: !24)
!159 = !DILocation(line: 124, column: 17, scope: !155)
!160 = !DILocation(line: 127, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !155, file: !10, line: 127, column: 17)
!162 = !DILocation(line: 127, column: 22, scope: !161)
!163 = !DILocation(line: 127, column: 17, scope: !155)
!164 = !DILocation(line: 129, column: 24, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !10, line: 128, column: 13)
!166 = !DILocation(line: 129, column: 17, scope: !165)
!167 = !DILocation(line: 129, column: 30, scope: !165)
!168 = !DILocation(line: 131, column: 23, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !10, line: 131, column: 17)
!170 = !DILocation(line: 131, column: 21, scope: !169)
!171 = !DILocation(line: 131, column: 28, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !10, line: 131, column: 17)
!173 = !DILocation(line: 131, column: 30, scope: !172)
!174 = !DILocation(line: 131, column: 17, scope: !169)
!175 = !DILocation(line: 133, column: 41, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !10, line: 132, column: 17)
!177 = !DILocation(line: 133, column: 34, scope: !176)
!178 = !DILocation(line: 133, column: 21, scope: !176)
!179 = !DILocation(line: 134, column: 17, scope: !176)
!180 = !DILocation(line: 131, column: 37, scope: !172)
!181 = !DILocation(line: 131, column: 17, scope: !172)
!182 = distinct !{!182, !174, !183, !52}
!183 = !DILocation(line: 134, column: 17, scope: !169)
!184 = !DILocation(line: 135, column: 13, scope: !165)
!185 = !DILocation(line: 138, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !161, file: !10, line: 137, column: 13)
!187 = !DILocation(line: 141, column: 5, scope: !156)
!188 = !DILocation(line: 142, column: 1, scope: !148)
