; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i4 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %j, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 -1, i32* %data, align 4, !dbg !22
  store i32 0, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !26
  %cmp = icmp slt i32 %0, 1, !dbg !28
  br i1 %cmp, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  store i32 10, i32* %data, align 4, !dbg !30
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !33
  %inc = add nsw i32 %1, 1, !dbg !33
  store i32 %inc, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !38
  br label %for.cond1, !dbg !40

for.cond1:                                        ; preds = %for.inc14, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !41
  %cmp2 = icmp slt i32 %2, 1, !dbg !43
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !44

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !49, metadata !DIExpression()), !dbg !53
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !53
  %4 = load i32, i32* %data, align 4, !dbg !54
  %cmp5 = icmp sge i32 %4, 0, !dbg !56
  br i1 %cmp5, label %if.then, label %if.else, !dbg !57

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !58
  %idxprom = sext i32 %5 to i64, !dbg !60
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !60
  store i32 1, i32* %arrayidx, align 4, !dbg !61
  store i32 0, i32* %i4, align 4, !dbg !62
  br label %for.cond6, !dbg !64

for.cond6:                                        ; preds = %for.inc11, %if.then
  %6 = load i32, i32* %i4, align 4, !dbg !65
  %cmp7 = icmp slt i32 %6, 10, !dbg !67
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !68

for.body8:                                        ; preds = %for.cond6
  %7 = load i32, i32* %i4, align 4, !dbg !69
  %idxprom9 = sext i32 %7 to i64, !dbg !71
  %arrayidx10 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom9, !dbg !71
  %8 = load i32, i32* %arrayidx10, align 4, !dbg !71
  call void @printIntLine(i32 %8), !dbg !72
  br label %for.inc11, !dbg !73

for.inc11:                                        ; preds = %for.body8
  %9 = load i32, i32* %i4, align 4, !dbg !74
  %inc12 = add nsw i32 %9, 1, !dbg !74
  store i32 %inc12, i32* %i4, align 4, !dbg !74
  br label %for.cond6, !dbg !75, !llvm.loop !76

for.end13:                                        ; preds = %for.cond6
  br label %if.end, !dbg !78

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !79
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end13
  br label %for.inc14, !dbg !81

for.inc14:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !82
  %inc15 = add nsw i32 %10, 1, !dbg !82
  store i32 %inc15, i32* %j, align 4, !dbg !82
  br label %for.cond1, !dbg !83, !llvm.loop !84

for.end16:                                        ; preds = %for.cond1
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_good() #0 !dbg !87 {
entry:
  call void @goodB2G(), !dbg !88
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #5, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #5, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !111 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %i4 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32* %k, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %data, align 4, !dbg !118
  store i32 0, i32* %i, align 4, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !122
  %cmp = icmp slt i32 %0, 1, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  store i32 10, i32* %data, align 4, !dbg !126
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !129
  %inc = add nsw i32 %1, 1, !dbg !129
  store i32 %inc, i32* %i, align 4, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !133
  br label %for.cond1, !dbg !135

for.cond1:                                        ; preds = %for.inc15, %for.end
  %2 = load i32, i32* %k, align 4, !dbg !136
  %cmp2 = icmp slt i32 %2, 1, !dbg !138
  br i1 %cmp2, label %for.body3, label %for.end17, !dbg !139

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !140, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !144, metadata !DIExpression()), !dbg !145
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !145
  %4 = load i32, i32* %data, align 4, !dbg !146
  %cmp5 = icmp sge i32 %4, 0, !dbg !148
  br i1 %cmp5, label %land.lhs.true, label %if.else, !dbg !149

land.lhs.true:                                    ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !150
  %cmp6 = icmp slt i32 %5, 10, !dbg !151
  br i1 %cmp6, label %if.then, label %if.else, !dbg !152

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !153
  %idxprom = sext i32 %6 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !155
  store i32 1, i32* %arrayidx, align 4, !dbg !156
  store i32 0, i32* %i4, align 4, !dbg !157
  br label %for.cond7, !dbg !159

for.cond7:                                        ; preds = %for.inc12, %if.then
  %7 = load i32, i32* %i4, align 4, !dbg !160
  %cmp8 = icmp slt i32 %7, 10, !dbg !162
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !163

for.body9:                                        ; preds = %for.cond7
  %8 = load i32, i32* %i4, align 4, !dbg !164
  %idxprom10 = sext i32 %8 to i64, !dbg !166
  %arrayidx11 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom10, !dbg !166
  %9 = load i32, i32* %arrayidx11, align 4, !dbg !166
  call void @printIntLine(i32 %9), !dbg !167
  br label %for.inc12, !dbg !168

for.inc12:                                        ; preds = %for.body9
  %10 = load i32, i32* %i4, align 4, !dbg !169
  %inc13 = add nsw i32 %10, 1, !dbg !169
  store i32 %inc13, i32* %i4, align 4, !dbg !169
  br label %for.cond7, !dbg !170, !llvm.loop !171

for.end14:                                        ; preds = %for.cond7
  br label %if.end, !dbg !173

if.else:                                          ; preds = %land.lhs.true, %for.body3
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !174
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end14
  br label %for.inc15, !dbg !176

for.inc15:                                        ; preds = %if.end
  %11 = load i32, i32* %k, align 4, !dbg !177
  %inc16 = add nsw i32 %11, 1, !dbg !177
  store i32 %inc16, i32* %k, align 4, !dbg !177
  br label %for.cond1, !dbg !178, !llvm.loop !179

for.end17:                                        ; preds = %for.cond1
  ret void, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !182 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i32* %j, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i32* %data, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 -1, i32* %data, align 4, !dbg !189
  store i32 0, i32* %h, align 4, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !193
  %cmp = icmp slt i32 %0, 1, !dbg !195
  br i1 %cmp, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !197
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !200
  %inc = add nsw i32 %1, 1, !dbg !200
  store i32 %inc, i32* %h, align 4, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !204
  br label %for.cond1, !dbg !206

for.cond1:                                        ; preds = %for.inc13, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !207
  %cmp2 = icmp slt i32 %2, 1, !dbg !209
  br i1 %cmp2, label %for.body3, label %for.end15, !dbg !210

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !211, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !215, metadata !DIExpression()), !dbg !216
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !216
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !216
  %4 = load i32, i32* %data, align 4, !dbg !217
  %cmp4 = icmp sge i32 %4, 0, !dbg !219
  br i1 %cmp4, label %if.then, label %if.else, !dbg !220

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !221
  %idxprom = sext i32 %5 to i64, !dbg !223
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !223
  store i32 1, i32* %arrayidx, align 4, !dbg !224
  store i32 0, i32* %i, align 4, !dbg !225
  br label %for.cond5, !dbg !227

for.cond5:                                        ; preds = %for.inc10, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !228
  %cmp6 = icmp slt i32 %6, 10, !dbg !230
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !231

for.body7:                                        ; preds = %for.cond5
  %7 = load i32, i32* %i, align 4, !dbg !232
  %idxprom8 = sext i32 %7 to i64, !dbg !234
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !234
  %8 = load i32, i32* %arrayidx9, align 4, !dbg !234
  call void @printIntLine(i32 %8), !dbg !235
  br label %for.inc10, !dbg !236

for.inc10:                                        ; preds = %for.body7
  %9 = load i32, i32* %i, align 4, !dbg !237
  %inc11 = add nsw i32 %9, 1, !dbg !237
  store i32 %inc11, i32* %i, align 4, !dbg !237
  br label %for.cond5, !dbg !238, !llvm.loop !239

for.end12:                                        ; preds = %for.cond5
  br label %if.end, !dbg !241

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !242
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end12
  br label %for.inc13, !dbg !244

for.inc13:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !245
  %inc14 = add nsw i32 %10, 1, !dbg !245
  store i32 %inc14, i32* %j, align 4, !dbg !245
  br label %for.cond1, !dbg !246, !llvm.loop !247

for.end15:                                        ; preds = %for.cond1
  ret void, !dbg !249
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocalVariable(name: "j", scope: !11, file: !12, line: 24, type: !16)
!19 = !DILocation(line: 24, column: 11, scope: !11)
!20 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!21 = !DILocation(line: 25, column: 9, scope: !11)
!22 = !DILocation(line: 27, column: 10, scope: !11)
!23 = !DILocation(line: 28, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!25 = !DILocation(line: 28, column: 9, scope: !24)
!26 = !DILocation(line: 28, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !12, line: 28, column: 5)
!28 = !DILocation(line: 28, column: 18, scope: !27)
!29 = !DILocation(line: 28, column: 5, scope: !24)
!30 = !DILocation(line: 31, column: 14, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 32, column: 5, scope: !31)
!33 = !DILocation(line: 28, column: 24, scope: !27)
!34 = !DILocation(line: 28, column: 5, scope: !27)
!35 = distinct !{!35, !29, !36, !37}
!36 = !DILocation(line: 32, column: 5, scope: !24)
!37 = !{!"llvm.loop.mustprogress"}
!38 = !DILocation(line: 33, column: 11, scope: !39)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 33, column: 9, scope: !39)
!41 = !DILocation(line: 33, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 33, column: 5)
!43 = !DILocation(line: 33, column: 18, scope: !42)
!44 = !DILocation(line: 33, column: 5, scope: !39)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 36, type: !16)
!46 = distinct !DILexicalBlock(scope: !47, file: !12, line: 35, column: 9)
!47 = distinct !DILexicalBlock(scope: !42, file: !12, line: 34, column: 5)
!48 = !DILocation(line: 36, column: 17, scope: !46)
!49 = !DILocalVariable(name: "buffer", scope: !46, file: !12, line: 37, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 10)
!53 = !DILocation(line: 37, column: 17, scope: !46)
!54 = !DILocation(line: 40, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !46, file: !12, line: 40, column: 17)
!56 = !DILocation(line: 40, column: 22, scope: !55)
!57 = !DILocation(line: 40, column: 17, scope: !46)
!58 = !DILocation(line: 42, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 41, column: 13)
!60 = !DILocation(line: 42, column: 17, scope: !59)
!61 = !DILocation(line: 42, column: 30, scope: !59)
!62 = !DILocation(line: 44, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !12, line: 44, column: 17)
!64 = !DILocation(line: 44, column: 21, scope: !63)
!65 = !DILocation(line: 44, column: 28, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 44, column: 17)
!67 = !DILocation(line: 44, column: 30, scope: !66)
!68 = !DILocation(line: 44, column: 17, scope: !63)
!69 = !DILocation(line: 46, column: 41, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 45, column: 17)
!71 = !DILocation(line: 46, column: 34, scope: !70)
!72 = !DILocation(line: 46, column: 21, scope: !70)
!73 = !DILocation(line: 47, column: 17, scope: !70)
!74 = !DILocation(line: 44, column: 37, scope: !66)
!75 = !DILocation(line: 44, column: 17, scope: !66)
!76 = distinct !{!76, !68, !77, !37}
!77 = !DILocation(line: 47, column: 17, scope: !63)
!78 = !DILocation(line: 48, column: 13, scope: !59)
!79 = !DILocation(line: 51, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !55, file: !12, line: 50, column: 13)
!81 = !DILocation(line: 54, column: 5, scope: !47)
!82 = !DILocation(line: 33, column: 24, scope: !42)
!83 = !DILocation(line: 33, column: 5, scope: !42)
!84 = distinct !{!84, !44, !85, !37}
!85 = !DILocation(line: 54, column: 5, scope: !39)
!86 = !DILocation(line: 55, column: 1, scope: !11)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_good", scope: !12, file: !12, line: 133, type: !13, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 135, column: 5, scope: !87)
!89 = !DILocation(line: 136, column: 5, scope: !87)
!90 = !DILocation(line: 137, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 148, type: !92, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!16, !16, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !12, line: 148, type: !16)
!98 = !DILocation(line: 148, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !12, line: 148, type: !94)
!100 = !DILocation(line: 148, column: 27, scope: !91)
!101 = !DILocation(line: 151, column: 22, scope: !91)
!102 = !DILocation(line: 151, column: 12, scope: !91)
!103 = !DILocation(line: 151, column: 5, scope: !91)
!104 = !DILocation(line: 153, column: 5, scope: !91)
!105 = !DILocation(line: 154, column: 5, scope: !91)
!106 = !DILocation(line: 155, column: 5, scope: !91)
!107 = !DILocation(line: 158, column: 5, scope: !91)
!108 = !DILocation(line: 159, column: 5, scope: !91)
!109 = !DILocation(line: 160, column: 5, scope: !91)
!110 = !DILocation(line: 162, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "i", scope: !111, file: !12, line: 64, type: !16)
!113 = !DILocation(line: 64, column: 9, scope: !111)
!114 = !DILocalVariable(name: "k", scope: !111, file: !12, line: 64, type: !16)
!115 = !DILocation(line: 64, column: 11, scope: !111)
!116 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 65, type: !16)
!117 = !DILocation(line: 65, column: 9, scope: !111)
!118 = !DILocation(line: 67, column: 10, scope: !111)
!119 = !DILocation(line: 68, column: 11, scope: !120)
!120 = distinct !DILexicalBlock(scope: !111, file: !12, line: 68, column: 5)
!121 = !DILocation(line: 68, column: 9, scope: !120)
!122 = !DILocation(line: 68, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 68, column: 5)
!124 = !DILocation(line: 68, column: 18, scope: !123)
!125 = !DILocation(line: 68, column: 5, scope: !120)
!126 = !DILocation(line: 71, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 69, column: 5)
!128 = !DILocation(line: 72, column: 5, scope: !127)
!129 = !DILocation(line: 68, column: 24, scope: !123)
!130 = !DILocation(line: 68, column: 5, scope: !123)
!131 = distinct !{!131, !125, !132, !37}
!132 = !DILocation(line: 72, column: 5, scope: !120)
!133 = !DILocation(line: 73, column: 11, scope: !134)
!134 = distinct !DILexicalBlock(scope: !111, file: !12, line: 73, column: 5)
!135 = !DILocation(line: 73, column: 9, scope: !134)
!136 = !DILocation(line: 73, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 73, column: 5)
!138 = !DILocation(line: 73, column: 18, scope: !137)
!139 = !DILocation(line: 73, column: 5, scope: !134)
!140 = !DILocalVariable(name: "i", scope: !141, file: !12, line: 76, type: !16)
!141 = distinct !DILexicalBlock(scope: !142, file: !12, line: 75, column: 9)
!142 = distinct !DILexicalBlock(scope: !137, file: !12, line: 74, column: 5)
!143 = !DILocation(line: 76, column: 17, scope: !141)
!144 = !DILocalVariable(name: "buffer", scope: !141, file: !12, line: 77, type: !50)
!145 = !DILocation(line: 77, column: 17, scope: !141)
!146 = !DILocation(line: 79, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !12, line: 79, column: 17)
!148 = !DILocation(line: 79, column: 22, scope: !147)
!149 = !DILocation(line: 79, column: 27, scope: !147)
!150 = !DILocation(line: 79, column: 30, scope: !147)
!151 = !DILocation(line: 79, column: 35, scope: !147)
!152 = !DILocation(line: 79, column: 17, scope: !141)
!153 = !DILocation(line: 81, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !12, line: 80, column: 13)
!155 = !DILocation(line: 81, column: 17, scope: !154)
!156 = !DILocation(line: 81, column: 30, scope: !154)
!157 = !DILocation(line: 83, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !12, line: 83, column: 17)
!159 = !DILocation(line: 83, column: 21, scope: !158)
!160 = !DILocation(line: 83, column: 28, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !12, line: 83, column: 17)
!162 = !DILocation(line: 83, column: 30, scope: !161)
!163 = !DILocation(line: 83, column: 17, scope: !158)
!164 = !DILocation(line: 85, column: 41, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 84, column: 17)
!166 = !DILocation(line: 85, column: 34, scope: !165)
!167 = !DILocation(line: 85, column: 21, scope: !165)
!168 = !DILocation(line: 86, column: 17, scope: !165)
!169 = !DILocation(line: 83, column: 37, scope: !161)
!170 = !DILocation(line: 83, column: 17, scope: !161)
!171 = distinct !{!171, !163, !172, !37}
!172 = !DILocation(line: 86, column: 17, scope: !158)
!173 = !DILocation(line: 87, column: 13, scope: !154)
!174 = !DILocation(line: 90, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !147, file: !12, line: 89, column: 13)
!176 = !DILocation(line: 93, column: 5, scope: !142)
!177 = !DILocation(line: 73, column: 24, scope: !137)
!178 = !DILocation(line: 73, column: 5, scope: !137)
!179 = distinct !{!179, !139, !180, !37}
!180 = !DILocation(line: 93, column: 5, scope: !134)
!181 = !DILocation(line: 94, column: 1, scope: !111)
!182 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!183 = !DILocalVariable(name: "h", scope: !182, file: !12, line: 99, type: !16)
!184 = !DILocation(line: 99, column: 9, scope: !182)
!185 = !DILocalVariable(name: "j", scope: !182, file: !12, line: 99, type: !16)
!186 = !DILocation(line: 99, column: 11, scope: !182)
!187 = !DILocalVariable(name: "data", scope: !182, file: !12, line: 100, type: !16)
!188 = !DILocation(line: 100, column: 9, scope: !182)
!189 = !DILocation(line: 102, column: 10, scope: !182)
!190 = !DILocation(line: 103, column: 11, scope: !191)
!191 = distinct !DILexicalBlock(scope: !182, file: !12, line: 103, column: 5)
!192 = !DILocation(line: 103, column: 9, scope: !191)
!193 = !DILocation(line: 103, column: 16, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !12, line: 103, column: 5)
!195 = !DILocation(line: 103, column: 18, scope: !194)
!196 = !DILocation(line: 103, column: 5, scope: !191)
!197 = !DILocation(line: 107, column: 14, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !12, line: 104, column: 5)
!199 = !DILocation(line: 108, column: 5, scope: !198)
!200 = !DILocation(line: 103, column: 24, scope: !194)
!201 = !DILocation(line: 103, column: 5, scope: !194)
!202 = distinct !{!202, !196, !203, !37}
!203 = !DILocation(line: 108, column: 5, scope: !191)
!204 = !DILocation(line: 109, column: 11, scope: !205)
!205 = distinct !DILexicalBlock(scope: !182, file: !12, line: 109, column: 5)
!206 = !DILocation(line: 109, column: 9, scope: !205)
!207 = !DILocation(line: 109, column: 16, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !12, line: 109, column: 5)
!209 = !DILocation(line: 109, column: 18, scope: !208)
!210 = !DILocation(line: 109, column: 5, scope: !205)
!211 = !DILocalVariable(name: "i", scope: !212, file: !12, line: 112, type: !16)
!212 = distinct !DILexicalBlock(scope: !213, file: !12, line: 111, column: 9)
!213 = distinct !DILexicalBlock(scope: !208, file: !12, line: 110, column: 5)
!214 = !DILocation(line: 112, column: 17, scope: !212)
!215 = !DILocalVariable(name: "buffer", scope: !212, file: !12, line: 113, type: !50)
!216 = !DILocation(line: 113, column: 17, scope: !212)
!217 = !DILocation(line: 116, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !212, file: !12, line: 116, column: 17)
!219 = !DILocation(line: 116, column: 22, scope: !218)
!220 = !DILocation(line: 116, column: 17, scope: !212)
!221 = !DILocation(line: 118, column: 24, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !12, line: 117, column: 13)
!223 = !DILocation(line: 118, column: 17, scope: !222)
!224 = !DILocation(line: 118, column: 30, scope: !222)
!225 = !DILocation(line: 120, column: 23, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !12, line: 120, column: 17)
!227 = !DILocation(line: 120, column: 21, scope: !226)
!228 = !DILocation(line: 120, column: 28, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !12, line: 120, column: 17)
!230 = !DILocation(line: 120, column: 30, scope: !229)
!231 = !DILocation(line: 120, column: 17, scope: !226)
!232 = !DILocation(line: 122, column: 41, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !12, line: 121, column: 17)
!234 = !DILocation(line: 122, column: 34, scope: !233)
!235 = !DILocation(line: 122, column: 21, scope: !233)
!236 = !DILocation(line: 123, column: 17, scope: !233)
!237 = !DILocation(line: 120, column: 37, scope: !229)
!238 = !DILocation(line: 120, column: 17, scope: !229)
!239 = distinct !{!239, !231, !240, !37}
!240 = !DILocation(line: 123, column: 17, scope: !226)
!241 = !DILocation(line: 124, column: 13, scope: !222)
!242 = !DILocation(line: 127, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !218, file: !12, line: 126, column: 13)
!244 = !DILocation(line: 130, column: 5, scope: !213)
!245 = !DILocation(line: 109, column: 24, scope: !208)
!246 = !DILocation(line: 109, column: 5, scope: !208)
!247 = distinct !{!247, !210, !248, !37}
!248 = !DILocation(line: 130, column: 5, scope: !205)
!249 = !DILocation(line: 131, column: 1, scope: !182)
