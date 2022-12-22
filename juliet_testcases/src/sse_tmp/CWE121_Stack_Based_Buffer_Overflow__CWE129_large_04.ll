; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 10, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !27, metadata !DIExpression()), !dbg !31
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !31
  %1 = load i32, i32* %data, align 4, !dbg !32
  %cmp = icmp sge i32 %1, 0, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !36
  %idxprom = sext i32 %2 to i64, !dbg !38
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !38
  store i32 1, i32* %arrayidx, align 4, !dbg !39
  store i32 0, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !43
  %cmp1 = icmp slt i32 %3, 10, !dbg !45
  br i1 %cmp1, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !47
  %idxprom2 = sext i32 %4 to i64, !dbg !49
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !49
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !49
  call void @printIntLine(i32 %5), !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %6, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !57

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !58
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_good() #0 !dbg !61 {
entry:
  call void @goodB2G1(), !dbg !62
  call void @goodB2G2(), !dbg !63
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !87 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 -1, i32* %data, align 4, !dbg !90
  store i32 10, i32* %data, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata i32* %i, metadata !94, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !100
  %1 = load i32, i32* %data, align 4, !dbg !101
  %cmp = icmp sge i32 %1, 0, !dbg !103
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !104

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !105
  %cmp1 = icmp slt i32 %2, 10, !dbg !106
  br i1 %cmp1, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !108
  %idxprom = sext i32 %3 to i64, !dbg !110
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !110
  store i32 1, i32* %arrayidx, align 4, !dbg !111
  store i32 0, i32* %i, align 4, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !115
  %cmp2 = icmp slt i32 %4, 10, !dbg !117
  br i1 %cmp2, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !119
  %idxprom3 = sext i32 %5 to i64, !dbg !121
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !121
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !121
  call void @printIntLine(i32 %6), !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !124
  %inc = add nsw i32 %7, 1, !dbg !124
  store i32 %inc, i32* %i, align 4, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !128

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !129
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !132 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !133, metadata !DIExpression()), !dbg !134
  store i32 -1, i32* %data, align 4, !dbg !135
  store i32 10, i32* %data, align 4, !dbg !136
  call void @llvm.dbg.declare(metadata i32* %i, metadata !139, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !145
  %1 = load i32, i32* %data, align 4, !dbg !146
  %cmp = icmp sge i32 %1, 0, !dbg !148
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !149

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !150
  %cmp1 = icmp slt i32 %2, 10, !dbg !151
  br i1 %cmp1, label %if.then, label %if.else, !dbg !152

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !153
  %idxprom = sext i32 %3 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !155
  store i32 1, i32* %arrayidx, align 4, !dbg !156
  store i32 0, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !160
  %cmp2 = icmp slt i32 %4, 10, !dbg !162
  br i1 %cmp2, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !164
  %idxprom3 = sext i32 %5 to i64, !dbg !166
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !166
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !166
  call void @printIntLine(i32 %6), !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !169
  %inc = add nsw i32 %7, 1, !dbg !169
  store i32 %inc, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !173

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !174
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !177 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !178, metadata !DIExpression()), !dbg !179
  store i32 -1, i32* %data, align 4, !dbg !180
  store i32 7, i32* %data, align 4, !dbg !181
  call void @llvm.dbg.declare(metadata i32* %i, metadata !184, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !189, metadata !DIExpression()), !dbg !190
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !190
  %1 = load i32, i32* %data, align 4, !dbg !191
  %cmp = icmp sge i32 %1, 0, !dbg !193
  br i1 %cmp, label %if.then, label %if.else, !dbg !194

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !195
  %idxprom = sext i32 %2 to i64, !dbg !197
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !197
  store i32 1, i32* %arrayidx, align 4, !dbg !198
  store i32 0, i32* %i, align 4, !dbg !199
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !202
  %cmp1 = icmp slt i32 %3, 10, !dbg !204
  br i1 %cmp1, label %for.body, label %for.end, !dbg !205

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !206
  %idxprom2 = sext i32 %4 to i64, !dbg !208
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !208
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !208
  call void @printIntLine(i32 %5), !dbg !209
  br label %for.inc, !dbg !210

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !211
  %inc = add nsw i32 %6, 1, !dbg !211
  store i32 %inc, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !215

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !216
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !218
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !219 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 -1, i32* %data, align 4, !dbg !222
  store i32 7, i32* %data, align 4, !dbg !223
  call void @llvm.dbg.declare(metadata i32* %i, metadata !226, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !231, metadata !DIExpression()), !dbg !232
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !232
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !232
  %1 = load i32, i32* %data, align 4, !dbg !233
  %cmp = icmp sge i32 %1, 0, !dbg !235
  br i1 %cmp, label %if.then, label %if.else, !dbg !236

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !237
  %idxprom = sext i32 %2 to i64, !dbg !239
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !239
  store i32 1, i32* %arrayidx, align 4, !dbg !240
  store i32 0, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !243

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !244
  %cmp1 = icmp slt i32 %3, 10, !dbg !246
  br i1 %cmp1, label %for.body, label %for.end, !dbg !247

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !248
  %idxprom2 = sext i32 %4 to i64, !dbg !250
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !250
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !250
  call void @printIntLine(i32 %5), !dbg !251
  br label %for.inc, !dbg !252

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !253
  %inc = add nsw i32 %6, 1, !dbg !253
  store i32 %inc, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !254, !llvm.loop !255

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !257

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !258
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !260
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocation(line: 32, column: 10, scope: !11)
!19 = !DILocation(line: 36, column: 14, scope: !20)
!20 = distinct !DILexicalBlock(scope: !21, file: !12, line: 34, column: 5)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!22 = !DILocalVariable(name: "i", scope: !23, file: !12, line: 41, type: !16)
!23 = distinct !DILexicalBlock(scope: !24, file: !12, line: 40, column: 9)
!24 = distinct !DILexicalBlock(scope: !25, file: !12, line: 39, column: 5)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 8)
!26 = !DILocation(line: 41, column: 17, scope: !23)
!27 = !DILocalVariable(name: "buffer", scope: !23, file: !12, line: 42, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 10)
!31 = !DILocation(line: 42, column: 17, scope: !23)
!32 = !DILocation(line: 45, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !23, file: !12, line: 45, column: 17)
!34 = !DILocation(line: 45, column: 22, scope: !33)
!35 = !DILocation(line: 45, column: 17, scope: !23)
!36 = !DILocation(line: 47, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 46, column: 13)
!38 = !DILocation(line: 47, column: 17, scope: !37)
!39 = !DILocation(line: 47, column: 30, scope: !37)
!40 = !DILocation(line: 49, column: 23, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 49, column: 17)
!42 = !DILocation(line: 49, column: 21, scope: !41)
!43 = !DILocation(line: 49, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 49, column: 17)
!45 = !DILocation(line: 49, column: 30, scope: !44)
!46 = !DILocation(line: 49, column: 17, scope: !41)
!47 = !DILocation(line: 51, column: 41, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 50, column: 17)
!49 = !DILocation(line: 51, column: 34, scope: !48)
!50 = !DILocation(line: 51, column: 21, scope: !48)
!51 = !DILocation(line: 52, column: 17, scope: !48)
!52 = !DILocation(line: 49, column: 37, scope: !44)
!53 = !DILocation(line: 49, column: 17, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 52, column: 17, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 53, column: 13, scope: !37)
!58 = !DILocation(line: 56, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !33, file: !12, line: 55, column: 13)
!60 = !DILocation(line: 60, column: 1, scope: !11)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_good", scope: !12, file: !12, line: 216, type: !13, scopeLine: 217, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 218, column: 5, scope: !61)
!63 = !DILocation(line: 219, column: 5, scope: !61)
!64 = !DILocation(line: 220, column: 5, scope: !61)
!65 = !DILocation(line: 221, column: 5, scope: !61)
!66 = !DILocation(line: 222, column: 1, scope: !61)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 233, type: !68, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!16, !16, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 233, type: !16)
!74 = !DILocation(line: 233, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 233, type: !70)
!76 = !DILocation(line: 233, column: 27, scope: !67)
!77 = !DILocation(line: 236, column: 22, scope: !67)
!78 = !DILocation(line: 236, column: 12, scope: !67)
!79 = !DILocation(line: 236, column: 5, scope: !67)
!80 = !DILocation(line: 238, column: 5, scope: !67)
!81 = !DILocation(line: 239, column: 5, scope: !67)
!82 = !DILocation(line: 240, column: 5, scope: !67)
!83 = !DILocation(line: 243, column: 5, scope: !67)
!84 = !DILocation(line: 244, column: 5, scope: !67)
!85 = !DILocation(line: 245, column: 5, scope: !67)
!86 = !DILocation(line: 247, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 69, type: !16)
!89 = !DILocation(line: 69, column: 9, scope: !87)
!90 = !DILocation(line: 71, column: 10, scope: !87)
!91 = !DILocation(line: 75, column: 14, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !12, line: 73, column: 5)
!93 = distinct !DILexicalBlock(scope: !87, file: !12, line: 72, column: 8)
!94 = !DILocalVariable(name: "i", scope: !95, file: !12, line: 85, type: !16)
!95 = distinct !DILexicalBlock(scope: !96, file: !12, line: 84, column: 9)
!96 = distinct !DILexicalBlock(scope: !97, file: !12, line: 83, column: 5)
!97 = distinct !DILexicalBlock(scope: !87, file: !12, line: 77, column: 8)
!98 = !DILocation(line: 85, column: 17, scope: !95)
!99 = !DILocalVariable(name: "buffer", scope: !95, file: !12, line: 86, type: !28)
!100 = !DILocation(line: 86, column: 17, scope: !95)
!101 = !DILocation(line: 88, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !12, line: 88, column: 17)
!103 = !DILocation(line: 88, column: 22, scope: !102)
!104 = !DILocation(line: 88, column: 27, scope: !102)
!105 = !DILocation(line: 88, column: 30, scope: !102)
!106 = !DILocation(line: 88, column: 35, scope: !102)
!107 = !DILocation(line: 88, column: 17, scope: !95)
!108 = !DILocation(line: 90, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !12, line: 89, column: 13)
!110 = !DILocation(line: 90, column: 17, scope: !109)
!111 = !DILocation(line: 90, column: 30, scope: !109)
!112 = !DILocation(line: 92, column: 23, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 92, column: 17)
!114 = !DILocation(line: 92, column: 21, scope: !113)
!115 = !DILocation(line: 92, column: 28, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 92, column: 17)
!117 = !DILocation(line: 92, column: 30, scope: !116)
!118 = !DILocation(line: 92, column: 17, scope: !113)
!119 = !DILocation(line: 94, column: 41, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 93, column: 17)
!121 = !DILocation(line: 94, column: 34, scope: !120)
!122 = !DILocation(line: 94, column: 21, scope: !120)
!123 = !DILocation(line: 95, column: 17, scope: !120)
!124 = !DILocation(line: 92, column: 37, scope: !116)
!125 = !DILocation(line: 92, column: 17, scope: !116)
!126 = distinct !{!126, !118, !127, !56}
!127 = !DILocation(line: 95, column: 17, scope: !113)
!128 = !DILocation(line: 96, column: 13, scope: !109)
!129 = !DILocation(line: 99, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !102, file: !12, line: 98, column: 13)
!131 = !DILocation(line: 103, column: 1, scope: !87)
!132 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocalVariable(name: "data", scope: !132, file: !12, line: 108, type: !16)
!134 = !DILocation(line: 108, column: 9, scope: !132)
!135 = !DILocation(line: 110, column: 10, scope: !132)
!136 = !DILocation(line: 114, column: 14, scope: !137)
!137 = distinct !DILexicalBlock(scope: !138, file: !12, line: 112, column: 5)
!138 = distinct !DILexicalBlock(scope: !132, file: !12, line: 111, column: 8)
!139 = !DILocalVariable(name: "i", scope: !140, file: !12, line: 119, type: !16)
!140 = distinct !DILexicalBlock(scope: !141, file: !12, line: 118, column: 9)
!141 = distinct !DILexicalBlock(scope: !142, file: !12, line: 117, column: 5)
!142 = distinct !DILexicalBlock(scope: !132, file: !12, line: 116, column: 8)
!143 = !DILocation(line: 119, column: 17, scope: !140)
!144 = !DILocalVariable(name: "buffer", scope: !140, file: !12, line: 120, type: !28)
!145 = !DILocation(line: 120, column: 17, scope: !140)
!146 = !DILocation(line: 122, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !140, file: !12, line: 122, column: 17)
!148 = !DILocation(line: 122, column: 22, scope: !147)
!149 = !DILocation(line: 122, column: 27, scope: !147)
!150 = !DILocation(line: 122, column: 30, scope: !147)
!151 = !DILocation(line: 122, column: 35, scope: !147)
!152 = !DILocation(line: 122, column: 17, scope: !140)
!153 = !DILocation(line: 124, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !12, line: 123, column: 13)
!155 = !DILocation(line: 124, column: 17, scope: !154)
!156 = !DILocation(line: 124, column: 30, scope: !154)
!157 = !DILocation(line: 126, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !12, line: 126, column: 17)
!159 = !DILocation(line: 126, column: 21, scope: !158)
!160 = !DILocation(line: 126, column: 28, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !12, line: 126, column: 17)
!162 = !DILocation(line: 126, column: 30, scope: !161)
!163 = !DILocation(line: 126, column: 17, scope: !158)
!164 = !DILocation(line: 128, column: 41, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 127, column: 17)
!166 = !DILocation(line: 128, column: 34, scope: !165)
!167 = !DILocation(line: 128, column: 21, scope: !165)
!168 = !DILocation(line: 129, column: 17, scope: !165)
!169 = !DILocation(line: 126, column: 37, scope: !161)
!170 = !DILocation(line: 126, column: 17, scope: !161)
!171 = distinct !{!171, !163, !172, !56}
!172 = !DILocation(line: 129, column: 17, scope: !158)
!173 = !DILocation(line: 130, column: 13, scope: !154)
!174 = !DILocation(line: 133, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !147, file: !12, line: 132, column: 13)
!176 = !DILocation(line: 137, column: 1, scope: !132)
!177 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 140, type: !13, scopeLine: 141, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!178 = !DILocalVariable(name: "data", scope: !177, file: !12, line: 142, type: !16)
!179 = !DILocation(line: 142, column: 9, scope: !177)
!180 = !DILocation(line: 144, column: 10, scope: !177)
!181 = !DILocation(line: 154, column: 14, scope: !182)
!182 = distinct !DILexicalBlock(scope: !183, file: !12, line: 151, column: 5)
!183 = distinct !DILexicalBlock(scope: !177, file: !12, line: 145, column: 8)
!184 = !DILocalVariable(name: "i", scope: !185, file: !12, line: 159, type: !16)
!185 = distinct !DILexicalBlock(scope: !186, file: !12, line: 158, column: 9)
!186 = distinct !DILexicalBlock(scope: !187, file: !12, line: 157, column: 5)
!187 = distinct !DILexicalBlock(scope: !177, file: !12, line: 156, column: 8)
!188 = !DILocation(line: 159, column: 17, scope: !185)
!189 = !DILocalVariable(name: "buffer", scope: !185, file: !12, line: 160, type: !28)
!190 = !DILocation(line: 160, column: 17, scope: !185)
!191 = !DILocation(line: 163, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !185, file: !12, line: 163, column: 17)
!193 = !DILocation(line: 163, column: 22, scope: !192)
!194 = !DILocation(line: 163, column: 17, scope: !185)
!195 = !DILocation(line: 165, column: 24, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !12, line: 164, column: 13)
!197 = !DILocation(line: 165, column: 17, scope: !196)
!198 = !DILocation(line: 165, column: 30, scope: !196)
!199 = !DILocation(line: 167, column: 23, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !12, line: 167, column: 17)
!201 = !DILocation(line: 167, column: 21, scope: !200)
!202 = !DILocation(line: 167, column: 28, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !12, line: 167, column: 17)
!204 = !DILocation(line: 167, column: 30, scope: !203)
!205 = !DILocation(line: 167, column: 17, scope: !200)
!206 = !DILocation(line: 169, column: 41, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !12, line: 168, column: 17)
!208 = !DILocation(line: 169, column: 34, scope: !207)
!209 = !DILocation(line: 169, column: 21, scope: !207)
!210 = !DILocation(line: 170, column: 17, scope: !207)
!211 = !DILocation(line: 167, column: 37, scope: !203)
!212 = !DILocation(line: 167, column: 17, scope: !203)
!213 = distinct !{!213, !205, !214, !56}
!214 = !DILocation(line: 170, column: 17, scope: !200)
!215 = !DILocation(line: 171, column: 13, scope: !196)
!216 = !DILocation(line: 174, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !192, file: !12, line: 173, column: 13)
!218 = !DILocation(line: 178, column: 1, scope: !177)
!219 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 181, type: !13, scopeLine: 182, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!220 = !DILocalVariable(name: "data", scope: !219, file: !12, line: 183, type: !16)
!221 = !DILocation(line: 183, column: 9, scope: !219)
!222 = !DILocation(line: 185, column: 10, scope: !219)
!223 = !DILocation(line: 190, column: 14, scope: !224)
!224 = distinct !DILexicalBlock(scope: !225, file: !12, line: 187, column: 5)
!225 = distinct !DILexicalBlock(scope: !219, file: !12, line: 186, column: 8)
!226 = !DILocalVariable(name: "i", scope: !227, file: !12, line: 195, type: !16)
!227 = distinct !DILexicalBlock(scope: !228, file: !12, line: 194, column: 9)
!228 = distinct !DILexicalBlock(scope: !229, file: !12, line: 193, column: 5)
!229 = distinct !DILexicalBlock(scope: !219, file: !12, line: 192, column: 8)
!230 = !DILocation(line: 195, column: 17, scope: !227)
!231 = !DILocalVariable(name: "buffer", scope: !227, file: !12, line: 196, type: !28)
!232 = !DILocation(line: 196, column: 17, scope: !227)
!233 = !DILocation(line: 199, column: 17, scope: !234)
!234 = distinct !DILexicalBlock(scope: !227, file: !12, line: 199, column: 17)
!235 = !DILocation(line: 199, column: 22, scope: !234)
!236 = !DILocation(line: 199, column: 17, scope: !227)
!237 = !DILocation(line: 201, column: 24, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !12, line: 200, column: 13)
!239 = !DILocation(line: 201, column: 17, scope: !238)
!240 = !DILocation(line: 201, column: 30, scope: !238)
!241 = !DILocation(line: 203, column: 23, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !12, line: 203, column: 17)
!243 = !DILocation(line: 203, column: 21, scope: !242)
!244 = !DILocation(line: 203, column: 28, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !12, line: 203, column: 17)
!246 = !DILocation(line: 203, column: 30, scope: !245)
!247 = !DILocation(line: 203, column: 17, scope: !242)
!248 = !DILocation(line: 205, column: 41, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !12, line: 204, column: 17)
!250 = !DILocation(line: 205, column: 34, scope: !249)
!251 = !DILocation(line: 205, column: 21, scope: !249)
!252 = !DILocation(line: 206, column: 17, scope: !249)
!253 = !DILocation(line: 203, column: 37, scope: !245)
!254 = !DILocation(line: 203, column: 17, scope: !245)
!255 = distinct !{!255, !247, !256, !56}
!256 = !DILocation(line: 206, column: 17, scope: !242)
!257 = !DILocation(line: 207, column: 13, scope: !238)
!258 = !DILocation(line: 210, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !234, file: !12, line: 209, column: 13)
!260 = !DILocation(line: 214, column: 1, scope: !219)
