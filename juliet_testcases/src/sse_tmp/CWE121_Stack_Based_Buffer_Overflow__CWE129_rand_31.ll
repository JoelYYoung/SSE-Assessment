; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data14 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 @rand() #5, !dbg !19
  %and = and i32 %call, 1, !dbg !19
  %tobool = icmp ne i32 %and, 0, !dbg !19
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !19

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !19
  %shl = shl i32 %call1, 30, !dbg !19
  %call2 = call i32 @rand() #5, !dbg !19
  %shl3 = shl i32 %call2, 15, !dbg !19
  %xor = xor i32 %shl, %shl3, !dbg !19
  %call4 = call i32 @rand() #5, !dbg !19
  %xor5 = xor i32 %xor, %call4, !dbg !19
  br label %cond.end, !dbg !19

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !19
  %shl7 = shl i32 %call6, 30, !dbg !19
  %call8 = call i32 @rand() #5, !dbg !19
  %shl9 = shl i32 %call8, 15, !dbg !19
  %xor10 = xor i32 %shl7, %shl9, !dbg !19
  %call11 = call i32 @rand() #5, !dbg !19
  %xor12 = xor i32 %xor10, %call11, !dbg !19
  %sub = sub i32 0, %xor12, !dbg !19
  %sub13 = sub i32 %sub, 1, !dbg !19
  br label %cond.end, !dbg !19

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !19
  store i32 %cond, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !21, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* %data, align 4, !dbg !24
  store i32 %0, i32* %dataCopy, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %data14, metadata !25, metadata !DIExpression()), !dbg !26
  %1 = load i32, i32* %dataCopy, align 4, !dbg !27
  store i32 %1, i32* %data14, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !31, metadata !DIExpression()), !dbg !35
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !35
  %3 = load i32, i32* %data14, align 4, !dbg !36
  %cmp = icmp sge i32 %3, 0, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %cond.end
  %4 = load i32, i32* %data14, align 4, !dbg !40
  %idxprom = sext i32 %4 to i64, !dbg !42
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !42
  store i32 1, i32* %arrayidx, align 4, !dbg !43
  store i32 0, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !47
  %cmp15 = icmp slt i32 %5, 10, !dbg !49
  br i1 %cmp15, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !51
  %idxprom16 = sext i32 %6 to i64, !dbg !53
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom16, !dbg !53
  %7 = load i32, i32* %arrayidx17, align 4, !dbg !53
  call void @printIntLine(i32 %7), !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !56
  %inc = add nsw i32 %8, 1, !dbg !56
  store i32 %inc, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !61

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !62
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  call void @goodB2G(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 -1, i32* %data, align 4, !dbg !92
  store i32 7, i32* %data, align 4, !dbg !93
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !94, metadata !DIExpression()), !dbg !96
  %0 = load i32, i32* %data, align 4, !dbg !97
  store i32 %0, i32* %dataCopy, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !98, metadata !DIExpression()), !dbg !99
  %1 = load i32, i32* %dataCopy, align 4, !dbg !100
  store i32 %1, i32* %data1, align 4, !dbg !99
  call void @llvm.dbg.declare(metadata i32* %i, metadata !101, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !104, metadata !DIExpression()), !dbg !105
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !105
  %3 = load i32, i32* %data1, align 4, !dbg !106
  %cmp = icmp sge i32 %3, 0, !dbg !108
  br i1 %cmp, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !110
  %idxprom = sext i32 %4 to i64, !dbg !112
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !112
  store i32 1, i32* %arrayidx, align 4, !dbg !113
  store i32 0, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !117
  %cmp2 = icmp slt i32 %5, 10, !dbg !119
  br i1 %cmp2, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !121
  %idxprom3 = sext i32 %6 to i64, !dbg !123
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !123
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !123
  call void @printIntLine(i32 %7), !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !126
  %inc = add nsw i32 %8, 1, !dbg !126
  store i32 %inc, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !130

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !134 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data14 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 -1, i32* %data, align 4, !dbg !137
  %call = call i32 @rand() #5, !dbg !138
  %and = and i32 %call, 1, !dbg !138
  %tobool = icmp ne i32 %and, 0, !dbg !138
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !138

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !138
  %shl = shl i32 %call1, 30, !dbg !138
  %call2 = call i32 @rand() #5, !dbg !138
  %shl3 = shl i32 %call2, 15, !dbg !138
  %xor = xor i32 %shl, %shl3, !dbg !138
  %call4 = call i32 @rand() #5, !dbg !138
  %xor5 = xor i32 %xor, %call4, !dbg !138
  br label %cond.end, !dbg !138

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !138
  %shl7 = shl i32 %call6, 30, !dbg !138
  %call8 = call i32 @rand() #5, !dbg !138
  %shl9 = shl i32 %call8, 15, !dbg !138
  %xor10 = xor i32 %shl7, %shl9, !dbg !138
  %call11 = call i32 @rand() #5, !dbg !138
  %xor12 = xor i32 %xor10, %call11, !dbg !138
  %sub = sub i32 0, %xor12, !dbg !138
  %sub13 = sub i32 %sub, 1, !dbg !138
  br label %cond.end, !dbg !138

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !138
  store i32 %cond, i32* %data, align 4, !dbg !139
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !140, metadata !DIExpression()), !dbg !142
  %0 = load i32, i32* %data, align 4, !dbg !143
  store i32 %0, i32* %dataCopy, align 4, !dbg !142
  call void @llvm.dbg.declare(metadata i32* %data14, metadata !144, metadata !DIExpression()), !dbg !145
  %1 = load i32, i32* %dataCopy, align 4, !dbg !146
  store i32 %1, i32* %data14, align 4, !dbg !145
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !150, metadata !DIExpression()), !dbg !151
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !151
  %3 = load i32, i32* %data14, align 4, !dbg !152
  %cmp = icmp sge i32 %3, 0, !dbg !154
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !155

land.lhs.true:                                    ; preds = %cond.end
  %4 = load i32, i32* %data14, align 4, !dbg !156
  %cmp15 = icmp slt i32 %4, 10, !dbg !157
  br i1 %cmp15, label %if.then, label %if.else, !dbg !158

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data14, align 4, !dbg !159
  %idxprom = sext i32 %5 to i64, !dbg !161
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !161
  store i32 1, i32* %arrayidx, align 4, !dbg !162
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !166
  %cmp16 = icmp slt i32 %6, 10, !dbg !168
  br i1 %cmp16, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !170
  %idxprom17 = sext i32 %7 to i64, !dbg !172
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom17, !dbg !172
  %8 = load i32, i32* %arrayidx18, align 4, !dbg !172
  call void @printIntLine(i32 %8), !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !175
  %inc = add nsw i32 %9, 1, !dbg !175
  store i32 %inc, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !179

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !180
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !182
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 28, column: 12, scope: !12)
!20 = !DILocation(line: 28, column: 10, scope: !12)
!21 = !DILocalVariable(name: "dataCopy", scope: !22, file: !13, line: 30, type: !4)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!23 = !DILocation(line: 30, column: 13, scope: !22)
!24 = !DILocation(line: 30, column: 24, scope: !22)
!25 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 31, type: !4)
!26 = !DILocation(line: 31, column: 13, scope: !22)
!27 = !DILocation(line: 31, column: 20, scope: !22)
!28 = !DILocalVariable(name: "i", scope: !29, file: !13, line: 33, type: !4)
!29 = distinct !DILexicalBlock(scope: !22, file: !13, line: 32, column: 9)
!30 = !DILocation(line: 33, column: 17, scope: !29)
!31 = !DILocalVariable(name: "buffer", scope: !29, file: !13, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DILocation(line: 34, column: 17, scope: !29)
!36 = !DILocation(line: 37, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !13, line: 37, column: 17)
!38 = !DILocation(line: 37, column: 22, scope: !37)
!39 = !DILocation(line: 37, column: 17, scope: !29)
!40 = !DILocation(line: 39, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !13, line: 38, column: 13)
!42 = !DILocation(line: 39, column: 17, scope: !41)
!43 = !DILocation(line: 39, column: 30, scope: !41)
!44 = !DILocation(line: 41, column: 23, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !13, line: 41, column: 17)
!46 = !DILocation(line: 41, column: 21, scope: !45)
!47 = !DILocation(line: 41, column: 28, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !13, line: 41, column: 17)
!49 = !DILocation(line: 41, column: 30, scope: !48)
!50 = !DILocation(line: 41, column: 17, scope: !45)
!51 = !DILocation(line: 43, column: 41, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !13, line: 42, column: 17)
!53 = !DILocation(line: 43, column: 34, scope: !52)
!54 = !DILocation(line: 43, column: 21, scope: !52)
!55 = !DILocation(line: 44, column: 17, scope: !52)
!56 = !DILocation(line: 41, column: 37, scope: !48)
!57 = !DILocation(line: 41, column: 17, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 44, column: 17, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 45, column: 13, scope: !41)
!62 = !DILocation(line: 48, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !37, file: !13, line: 47, column: 13)
!64 = !DILocation(line: 52, column: 1, scope: !12)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_good", scope: !13, file: !13, line: 124, type: !14, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 126, column: 5, scope: !65)
!67 = !DILocation(line: 127, column: 5, scope: !65)
!68 = !DILocation(line: 128, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 138, type: !70, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!4, !4, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !13, line: 138, type: !4)
!76 = !DILocation(line: 138, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !13, line: 138, type: !72)
!78 = !DILocation(line: 138, column: 27, scope: !69)
!79 = !DILocation(line: 141, column: 22, scope: !69)
!80 = !DILocation(line: 141, column: 12, scope: !69)
!81 = !DILocation(line: 141, column: 5, scope: !69)
!82 = !DILocation(line: 143, column: 5, scope: !69)
!83 = !DILocation(line: 144, column: 5, scope: !69)
!84 = !DILocation(line: 145, column: 5, scope: !69)
!85 = !DILocation(line: 148, column: 5, scope: !69)
!86 = !DILocation(line: 149, column: 5, scope: !69)
!87 = !DILocation(line: 150, column: 5, scope: !69)
!88 = !DILocation(line: 152, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 59, type: !14, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !13, line: 61, type: !4)
!91 = !DILocation(line: 61, column: 9, scope: !89)
!92 = !DILocation(line: 63, column: 10, scope: !89)
!93 = !DILocation(line: 66, column: 10, scope: !89)
!94 = !DILocalVariable(name: "dataCopy", scope: !95, file: !13, line: 68, type: !4)
!95 = distinct !DILexicalBlock(scope: !89, file: !13, line: 67, column: 5)
!96 = !DILocation(line: 68, column: 13, scope: !95)
!97 = !DILocation(line: 68, column: 24, scope: !95)
!98 = !DILocalVariable(name: "data", scope: !95, file: !13, line: 69, type: !4)
!99 = !DILocation(line: 69, column: 13, scope: !95)
!100 = !DILocation(line: 69, column: 20, scope: !95)
!101 = !DILocalVariable(name: "i", scope: !102, file: !13, line: 71, type: !4)
!102 = distinct !DILexicalBlock(scope: !95, file: !13, line: 70, column: 9)
!103 = !DILocation(line: 71, column: 17, scope: !102)
!104 = !DILocalVariable(name: "buffer", scope: !102, file: !13, line: 72, type: !32)
!105 = !DILocation(line: 72, column: 17, scope: !102)
!106 = !DILocation(line: 75, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !13, line: 75, column: 17)
!108 = !DILocation(line: 75, column: 22, scope: !107)
!109 = !DILocation(line: 75, column: 17, scope: !102)
!110 = !DILocation(line: 77, column: 24, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !13, line: 76, column: 13)
!112 = !DILocation(line: 77, column: 17, scope: !111)
!113 = !DILocation(line: 77, column: 30, scope: !111)
!114 = !DILocation(line: 79, column: 23, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !13, line: 79, column: 17)
!116 = !DILocation(line: 79, column: 21, scope: !115)
!117 = !DILocation(line: 79, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !13, line: 79, column: 17)
!119 = !DILocation(line: 79, column: 30, scope: !118)
!120 = !DILocation(line: 79, column: 17, scope: !115)
!121 = !DILocation(line: 81, column: 41, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !13, line: 80, column: 17)
!123 = !DILocation(line: 81, column: 34, scope: !122)
!124 = !DILocation(line: 81, column: 21, scope: !122)
!125 = !DILocation(line: 82, column: 17, scope: !122)
!126 = !DILocation(line: 79, column: 37, scope: !118)
!127 = !DILocation(line: 79, column: 17, scope: !118)
!128 = distinct !{!128, !120, !129, !60}
!129 = !DILocation(line: 82, column: 17, scope: !115)
!130 = !DILocation(line: 83, column: 13, scope: !111)
!131 = !DILocation(line: 86, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !107, file: !13, line: 85, column: 13)
!133 = !DILocation(line: 90, column: 1, scope: !89)
!134 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 93, type: !14, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !13, line: 95, type: !4)
!136 = !DILocation(line: 95, column: 9, scope: !134)
!137 = !DILocation(line: 97, column: 10, scope: !134)
!138 = !DILocation(line: 99, column: 12, scope: !134)
!139 = !DILocation(line: 99, column: 10, scope: !134)
!140 = !DILocalVariable(name: "dataCopy", scope: !141, file: !13, line: 101, type: !4)
!141 = distinct !DILexicalBlock(scope: !134, file: !13, line: 100, column: 5)
!142 = !DILocation(line: 101, column: 13, scope: !141)
!143 = !DILocation(line: 101, column: 24, scope: !141)
!144 = !DILocalVariable(name: "data", scope: !141, file: !13, line: 102, type: !4)
!145 = !DILocation(line: 102, column: 13, scope: !141)
!146 = !DILocation(line: 102, column: 20, scope: !141)
!147 = !DILocalVariable(name: "i", scope: !148, file: !13, line: 104, type: !4)
!148 = distinct !DILexicalBlock(scope: !141, file: !13, line: 103, column: 9)
!149 = !DILocation(line: 104, column: 17, scope: !148)
!150 = !DILocalVariable(name: "buffer", scope: !148, file: !13, line: 105, type: !32)
!151 = !DILocation(line: 105, column: 17, scope: !148)
!152 = !DILocation(line: 107, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !13, line: 107, column: 17)
!154 = !DILocation(line: 107, column: 22, scope: !153)
!155 = !DILocation(line: 107, column: 27, scope: !153)
!156 = !DILocation(line: 107, column: 30, scope: !153)
!157 = !DILocation(line: 107, column: 35, scope: !153)
!158 = !DILocation(line: 107, column: 17, scope: !148)
!159 = !DILocation(line: 109, column: 24, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !13, line: 108, column: 13)
!161 = !DILocation(line: 109, column: 17, scope: !160)
!162 = !DILocation(line: 109, column: 30, scope: !160)
!163 = !DILocation(line: 111, column: 23, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !13, line: 111, column: 17)
!165 = !DILocation(line: 111, column: 21, scope: !164)
!166 = !DILocation(line: 111, column: 28, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !13, line: 111, column: 17)
!168 = !DILocation(line: 111, column: 30, scope: !167)
!169 = !DILocation(line: 111, column: 17, scope: !164)
!170 = !DILocation(line: 113, column: 41, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !13, line: 112, column: 17)
!172 = !DILocation(line: 113, column: 34, scope: !171)
!173 = !DILocation(line: 113, column: 21, scope: !171)
!174 = !DILocation(line: 114, column: 17, scope: !171)
!175 = !DILocation(line: 111, column: 37, scope: !167)
!176 = !DILocation(line: 111, column: 17, scope: !167)
!177 = distinct !{!177, !169, !178, !60}
!178 = !DILocation(line: 114, column: 17, scope: !164)
!179 = !DILocation(line: 115, column: 13, scope: !160)
!180 = !DILocation(line: 118, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !153, file: !13, line: 117, column: 13)
!182 = !DILocation(line: 122, column: 1, scope: !134)
