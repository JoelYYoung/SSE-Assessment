; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 10, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !27
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !27
  %1 = load i32, i32* %data, align 4, !dbg !28
  %cmp = icmp sge i32 %1, 0, !dbg !30
  br i1 %cmp, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !32
  %idxprom = sext i32 %2 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !34
  store i32 1, i32* %arrayidx, align 4, !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !39
  %cmp1 = icmp slt i32 %3, 10, !dbg !41
  br i1 %cmp1, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !43
  %idxprom2 = sext i32 %4 to i64, !dbg !45
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !45
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !45
  call void @printIntLine(i32 %5), !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %6, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !53

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !54
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15_good() #0 !dbg !57 {
entry:
  call void @goodB2G1(), !dbg !58
  call void @goodB2G2(), !dbg !59
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !83 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 -1, i32* %data, align 4, !dbg !86
  store i32 10, i32* %data, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %i, metadata !88, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !92
  %1 = load i32, i32* %data, align 4, !dbg !93
  %cmp = icmp sge i32 %1, 0, !dbg !95
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !96

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !97
  %cmp1 = icmp slt i32 %2, 10, !dbg !98
  br i1 %cmp1, label %if.then, label %if.else, !dbg !99

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !100
  %idxprom = sext i32 %3 to i64, !dbg !102
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !102
  store i32 1, i32* %arrayidx, align 4, !dbg !103
  store i32 0, i32* %i, align 4, !dbg !104
  br label %for.cond, !dbg !106

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !107
  %cmp2 = icmp slt i32 %4, 10, !dbg !109
  br i1 %cmp2, label %for.body, label %for.end, !dbg !110

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !111
  %idxprom3 = sext i32 %5 to i64, !dbg !113
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !113
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !113
  call void @printIntLine(i32 %6), !dbg !114
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !116
  %inc = add nsw i32 %7, 1, !dbg !116
  store i32 %inc, i32* %i, align 4, !dbg !116
  br label %for.cond, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !120

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 -1, i32* %data, align 4, !dbg !127
  store i32 10, i32* %data, align 4, !dbg !128
  call void @llvm.dbg.declare(metadata i32* %i, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !132, metadata !DIExpression()), !dbg !133
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !133
  %1 = load i32, i32* %data, align 4, !dbg !134
  %cmp = icmp sge i32 %1, 0, !dbg !136
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !137

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !138
  %cmp1 = icmp slt i32 %2, 10, !dbg !139
  br i1 %cmp1, label %if.then, label %if.else, !dbg !140

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !141
  %idxprom = sext i32 %3 to i64, !dbg !143
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !143
  store i32 1, i32* %arrayidx, align 4, !dbg !144
  store i32 0, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !148
  %cmp2 = icmp slt i32 %4, 10, !dbg !150
  br i1 %cmp2, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !152
  %idxprom3 = sext i32 %5 to i64, !dbg !154
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !154
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !154
  call void @printIntLine(i32 %6), !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !157
  %inc = add nsw i32 %7, 1, !dbg !157
  store i32 %inc, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !161

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !162
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !165 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !166, metadata !DIExpression()), !dbg !167
  store i32 -1, i32* %data, align 4, !dbg !168
  store i32 7, i32* %data, align 4, !dbg !169
  call void @llvm.dbg.declare(metadata i32* %i, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !173, metadata !DIExpression()), !dbg !174
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !174
  %1 = load i32, i32* %data, align 4, !dbg !175
  %cmp = icmp sge i32 %1, 0, !dbg !177
  br i1 %cmp, label %if.then, label %if.else, !dbg !178

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !179
  %idxprom = sext i32 %2 to i64, !dbg !181
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !181
  store i32 1, i32* %arrayidx, align 4, !dbg !182
  store i32 0, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !186
  %cmp1 = icmp slt i32 %3, 10, !dbg !188
  br i1 %cmp1, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !190
  %idxprom2 = sext i32 %4 to i64, !dbg !192
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !192
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !192
  call void @printIntLine(i32 %5), !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !195
  %inc = add nsw i32 %6, 1, !dbg !195
  store i32 %inc, i32* %i, align 4, !dbg !195
  br label %for.cond, !dbg !196, !llvm.loop !197

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !199

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !200
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  store i32 7, i32* %data, align 4, !dbg !207
  call void @llvm.dbg.declare(metadata i32* %i, metadata !208, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !211, metadata !DIExpression()), !dbg !212
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !212
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !212
  %1 = load i32, i32* %data, align 4, !dbg !213
  %cmp = icmp sge i32 %1, 0, !dbg !215
  br i1 %cmp, label %if.then, label %if.else, !dbg !216

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !217
  %idxprom = sext i32 %2 to i64, !dbg !219
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !219
  store i32 1, i32* %arrayidx, align 4, !dbg !220
  store i32 0, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !223

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !224
  %cmp1 = icmp slt i32 %3, 10, !dbg !226
  br i1 %cmp1, label %for.body, label %for.end, !dbg !227

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !228
  %idxprom2 = sext i32 %4 to i64, !dbg !230
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !230
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !230
  call void @printIntLine(i32 %5), !dbg !231
  br label %for.inc, !dbg !232

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !233
  %inc = add nsw i32 %6, 1, !dbg !233
  store i32 %inc, i32* %i, align 4, !dbg !233
  br label %for.cond, !dbg !234, !llvm.loop !235

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !237

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !238
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !240
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 31, column: 14, scope: !11)
!20 = !DILocalVariable(name: "i", scope: !21, file: !12, line: 42, type: !16)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!22 = !DILocation(line: 42, column: 13, scope: !21)
!23 = !DILocalVariable(name: "buffer", scope: !21, file: !12, line: 43, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 43, column: 13, scope: !21)
!28 = !DILocation(line: 46, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !12, line: 46, column: 13)
!30 = !DILocation(line: 46, column: 18, scope: !29)
!31 = !DILocation(line: 46, column: 13, scope: !21)
!32 = !DILocation(line: 48, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 47, column: 9)
!34 = !DILocation(line: 48, column: 13, scope: !33)
!35 = !DILocation(line: 48, column: 26, scope: !33)
!36 = !DILocation(line: 50, column: 19, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 50, column: 13)
!38 = !DILocation(line: 50, column: 17, scope: !37)
!39 = !DILocation(line: 50, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 50, column: 13)
!41 = !DILocation(line: 50, column: 26, scope: !40)
!42 = !DILocation(line: 50, column: 13, scope: !37)
!43 = !DILocation(line: 52, column: 37, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 51, column: 13)
!45 = !DILocation(line: 52, column: 30, scope: !44)
!46 = !DILocation(line: 52, column: 17, scope: !44)
!47 = !DILocation(line: 53, column: 13, scope: !44)
!48 = !DILocation(line: 50, column: 33, scope: !40)
!49 = !DILocation(line: 50, column: 13, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 53, column: 13, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 54, column: 9, scope: !33)
!54 = !DILocation(line: 57, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !29, file: !12, line: 56, column: 9)
!56 = !DILocation(line: 66, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_15_good", scope: !12, file: !12, line: 260, type: !13, scopeLine: 261, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 262, column: 5, scope: !57)
!59 = !DILocation(line: 263, column: 5, scope: !57)
!60 = !DILocation(line: 264, column: 5, scope: !57)
!61 = !DILocation(line: 265, column: 5, scope: !57)
!62 = !DILocation(line: 266, column: 1, scope: !57)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 277, type: !64, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!16, !16, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 277, type: !16)
!70 = !DILocation(line: 277, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 277, type: !66)
!72 = !DILocation(line: 277, column: 27, scope: !63)
!73 = !DILocation(line: 280, column: 22, scope: !63)
!74 = !DILocation(line: 280, column: 12, scope: !63)
!75 = !DILocation(line: 280, column: 5, scope: !63)
!76 = !DILocation(line: 282, column: 5, scope: !63)
!77 = !DILocation(line: 283, column: 5, scope: !63)
!78 = !DILocation(line: 284, column: 5, scope: !63)
!79 = !DILocation(line: 287, column: 5, scope: !63)
!80 = !DILocation(line: 288, column: 5, scope: !63)
!81 = !DILocation(line: 289, column: 5, scope: !63)
!82 = !DILocation(line: 291, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 75, type: !16)
!85 = !DILocation(line: 75, column: 9, scope: !83)
!86 = !DILocation(line: 77, column: 10, scope: !83)
!87 = !DILocation(line: 82, column: 14, scope: !83)
!88 = !DILocalVariable(name: "i", scope: !89, file: !12, line: 97, type: !16)
!89 = distinct !DILexicalBlock(scope: !83, file: !12, line: 96, column: 5)
!90 = !DILocation(line: 97, column: 13, scope: !89)
!91 = !DILocalVariable(name: "buffer", scope: !89, file: !12, line: 98, type: !24)
!92 = !DILocation(line: 98, column: 13, scope: !89)
!93 = !DILocation(line: 100, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !12, line: 100, column: 13)
!95 = !DILocation(line: 100, column: 18, scope: !94)
!96 = !DILocation(line: 100, column: 23, scope: !94)
!97 = !DILocation(line: 100, column: 26, scope: !94)
!98 = !DILocation(line: 100, column: 31, scope: !94)
!99 = !DILocation(line: 100, column: 13, scope: !89)
!100 = !DILocation(line: 102, column: 20, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !12, line: 101, column: 9)
!102 = !DILocation(line: 102, column: 13, scope: !101)
!103 = !DILocation(line: 102, column: 26, scope: !101)
!104 = !DILocation(line: 104, column: 19, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !12, line: 104, column: 13)
!106 = !DILocation(line: 104, column: 17, scope: !105)
!107 = !DILocation(line: 104, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !12, line: 104, column: 13)
!109 = !DILocation(line: 104, column: 26, scope: !108)
!110 = !DILocation(line: 104, column: 13, scope: !105)
!111 = !DILocation(line: 106, column: 37, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !12, line: 105, column: 13)
!113 = !DILocation(line: 106, column: 30, scope: !112)
!114 = !DILocation(line: 106, column: 17, scope: !112)
!115 = !DILocation(line: 107, column: 13, scope: !112)
!116 = !DILocation(line: 104, column: 33, scope: !108)
!117 = !DILocation(line: 104, column: 13, scope: !108)
!118 = distinct !{!118, !110, !119, !52}
!119 = !DILocation(line: 107, column: 13, scope: !105)
!120 = !DILocation(line: 108, column: 9, scope: !101)
!121 = !DILocation(line: 111, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !94, file: !12, line: 110, column: 9)
!123 = !DILocation(line: 116, column: 1, scope: !83)
!124 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 119, type: !13, scopeLine: 120, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !12, line: 121, type: !16)
!126 = !DILocation(line: 121, column: 9, scope: !124)
!127 = !DILocation(line: 123, column: 10, scope: !124)
!128 = !DILocation(line: 128, column: 14, scope: !124)
!129 = !DILocalVariable(name: "i", scope: !130, file: !12, line: 139, type: !16)
!130 = distinct !DILexicalBlock(scope: !124, file: !12, line: 138, column: 5)
!131 = !DILocation(line: 139, column: 13, scope: !130)
!132 = !DILocalVariable(name: "buffer", scope: !130, file: !12, line: 140, type: !24)
!133 = !DILocation(line: 140, column: 13, scope: !130)
!134 = !DILocation(line: 142, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !12, line: 142, column: 13)
!136 = !DILocation(line: 142, column: 18, scope: !135)
!137 = !DILocation(line: 142, column: 23, scope: !135)
!138 = !DILocation(line: 142, column: 26, scope: !135)
!139 = !DILocation(line: 142, column: 31, scope: !135)
!140 = !DILocation(line: 142, column: 13, scope: !130)
!141 = !DILocation(line: 144, column: 20, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !12, line: 143, column: 9)
!143 = !DILocation(line: 144, column: 13, scope: !142)
!144 = !DILocation(line: 144, column: 26, scope: !142)
!145 = !DILocation(line: 146, column: 19, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !12, line: 146, column: 13)
!147 = !DILocation(line: 146, column: 17, scope: !146)
!148 = !DILocation(line: 146, column: 24, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 146, column: 13)
!150 = !DILocation(line: 146, column: 26, scope: !149)
!151 = !DILocation(line: 146, column: 13, scope: !146)
!152 = !DILocation(line: 148, column: 37, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !12, line: 147, column: 13)
!154 = !DILocation(line: 148, column: 30, scope: !153)
!155 = !DILocation(line: 148, column: 17, scope: !153)
!156 = !DILocation(line: 149, column: 13, scope: !153)
!157 = !DILocation(line: 146, column: 33, scope: !149)
!158 = !DILocation(line: 146, column: 13, scope: !149)
!159 = distinct !{!159, !151, !160, !52}
!160 = !DILocation(line: 149, column: 13, scope: !146)
!161 = !DILocation(line: 150, column: 9, scope: !142)
!162 = !DILocation(line: 153, column: 13, scope: !163)
!163 = distinct !DILexicalBlock(scope: !135, file: !12, line: 152, column: 9)
!164 = !DILocation(line: 162, column: 1, scope: !124)
!165 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 165, type: !13, scopeLine: 166, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!166 = !DILocalVariable(name: "data", scope: !165, file: !12, line: 167, type: !16)
!167 = !DILocation(line: 167, column: 9, scope: !165)
!168 = !DILocation(line: 169, column: 10, scope: !165)
!169 = !DILocation(line: 179, column: 14, scope: !165)
!170 = !DILocalVariable(name: "i", scope: !171, file: !12, line: 186, type: !16)
!171 = distinct !DILexicalBlock(scope: !165, file: !12, line: 185, column: 5)
!172 = !DILocation(line: 186, column: 13, scope: !171)
!173 = !DILocalVariable(name: "buffer", scope: !171, file: !12, line: 187, type: !24)
!174 = !DILocation(line: 187, column: 13, scope: !171)
!175 = !DILocation(line: 190, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !12, line: 190, column: 13)
!177 = !DILocation(line: 190, column: 18, scope: !176)
!178 = !DILocation(line: 190, column: 13, scope: !171)
!179 = !DILocation(line: 192, column: 20, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !12, line: 191, column: 9)
!181 = !DILocation(line: 192, column: 13, scope: !180)
!182 = !DILocation(line: 192, column: 26, scope: !180)
!183 = !DILocation(line: 194, column: 19, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !12, line: 194, column: 13)
!185 = !DILocation(line: 194, column: 17, scope: !184)
!186 = !DILocation(line: 194, column: 24, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !12, line: 194, column: 13)
!188 = !DILocation(line: 194, column: 26, scope: !187)
!189 = !DILocation(line: 194, column: 13, scope: !184)
!190 = !DILocation(line: 196, column: 37, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !12, line: 195, column: 13)
!192 = !DILocation(line: 196, column: 30, scope: !191)
!193 = !DILocation(line: 196, column: 17, scope: !191)
!194 = !DILocation(line: 197, column: 13, scope: !191)
!195 = !DILocation(line: 194, column: 33, scope: !187)
!196 = !DILocation(line: 194, column: 13, scope: !187)
!197 = distinct !{!197, !189, !198, !52}
!198 = !DILocation(line: 197, column: 13, scope: !184)
!199 = !DILocation(line: 198, column: 9, scope: !180)
!200 = !DILocation(line: 201, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !176, file: !12, line: 200, column: 9)
!202 = !DILocation(line: 210, column: 1, scope: !165)
!203 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 213, type: !13, scopeLine: 214, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!204 = !DILocalVariable(name: "data", scope: !203, file: !12, line: 215, type: !16)
!205 = !DILocation(line: 215, column: 9, scope: !203)
!206 = !DILocation(line: 217, column: 10, scope: !203)
!207 = !DILocation(line: 223, column: 14, scope: !203)
!208 = !DILocalVariable(name: "i", scope: !209, file: !12, line: 234, type: !16)
!209 = distinct !DILexicalBlock(scope: !203, file: !12, line: 233, column: 5)
!210 = !DILocation(line: 234, column: 13, scope: !209)
!211 = !DILocalVariable(name: "buffer", scope: !209, file: !12, line: 235, type: !24)
!212 = !DILocation(line: 235, column: 13, scope: !209)
!213 = !DILocation(line: 238, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !12, line: 238, column: 13)
!215 = !DILocation(line: 238, column: 18, scope: !214)
!216 = !DILocation(line: 238, column: 13, scope: !209)
!217 = !DILocation(line: 240, column: 20, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !12, line: 239, column: 9)
!219 = !DILocation(line: 240, column: 13, scope: !218)
!220 = !DILocation(line: 240, column: 26, scope: !218)
!221 = !DILocation(line: 242, column: 19, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !12, line: 242, column: 13)
!223 = !DILocation(line: 242, column: 17, scope: !222)
!224 = !DILocation(line: 242, column: 24, scope: !225)
!225 = distinct !DILexicalBlock(scope: !222, file: !12, line: 242, column: 13)
!226 = !DILocation(line: 242, column: 26, scope: !225)
!227 = !DILocation(line: 242, column: 13, scope: !222)
!228 = !DILocation(line: 244, column: 37, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !12, line: 243, column: 13)
!230 = !DILocation(line: 244, column: 30, scope: !229)
!231 = !DILocation(line: 244, column: 17, scope: !229)
!232 = !DILocation(line: 245, column: 13, scope: !229)
!233 = !DILocation(line: 242, column: 33, scope: !225)
!234 = !DILocation(line: 242, column: 13, scope: !225)
!235 = distinct !{!235, !227, !236, !52}
!236 = !DILocation(line: 245, column: 13, scope: !222)
!237 = !DILocation(line: 246, column: 9, scope: !218)
!238 = !DILocation(line: 249, column: 13, scope: !239)
!239 = distinct !DILexicalBlock(scope: !214, file: !12, line: 248, column: 9)
!240 = !DILocation(line: 258, column: 1, scope: !203)
