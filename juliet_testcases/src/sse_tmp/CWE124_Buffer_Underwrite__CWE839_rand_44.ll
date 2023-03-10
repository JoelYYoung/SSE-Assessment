; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_44.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_44_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !18, metadata !DIExpression()), !dbg !22
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  %call = call i32 @rand() #5, !dbg !24
  %and = and i32 %call, 1, !dbg !24
  %tobool = icmp ne i32 %and, 0, !dbg !24
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !24

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !24
  %shl = shl i32 %call1, 30, !dbg !24
  %call2 = call i32 @rand() #5, !dbg !24
  %shl3 = shl i32 %call2, 15, !dbg !24
  %xor = xor i32 %shl, %shl3, !dbg !24
  %call4 = call i32 @rand() #5, !dbg !24
  %xor5 = xor i32 %xor, %call4, !dbg !24
  br label %cond.end, !dbg !24

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !24
  %shl7 = shl i32 %call6, 30, !dbg !24
  %call8 = call i32 @rand() #5, !dbg !24
  %shl9 = shl i32 %call8, 15, !dbg !24
  %xor10 = xor i32 %shl7, %shl9, !dbg !24
  %call11 = call i32 @rand() #5, !dbg !24
  %xor12 = xor i32 %xor10, %call11, !dbg !24
  %sub = sub i32 0, %xor12, !dbg !24
  %sub13 = sub i32 %sub, 1, !dbg !24
  br label %cond.end, !dbg !24

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !24
  store i32 %cond, i32* %data, align 4, !dbg !25
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !26
  %1 = load i32, i32* %data, align 4, !dbg !27
  call void %0(i32 %1), !dbg !26
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !29 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !35, metadata !DIExpression()), !dbg !39
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !39
  %1 = load i32, i32* %data.addr, align 4, !dbg !40
  %cmp = icmp slt i32 %1, 10, !dbg !42
  br i1 %cmp, label %if.then, label %if.else, !dbg !43

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !44
  %idxprom = sext i32 %2 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !46
  store i32 1, i32* %arrayidx, align 4, !dbg !47
  store i32 0, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !51
  %cmp1 = icmp slt i32 %3, 10, !dbg !53
  br i1 %cmp1, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !55
  %idxprom2 = sext i32 %4 to i64, !dbg !57
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !57
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !57
  call void @printIntLine(i32 %5), !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !60
  %inc = add nsw i32 %6, 1, !dbg !60
  store i32 %inc, i32* %i, align 4, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !65

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !66
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !68
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_44_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  call void @goodB2G(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE124_Buffer_Underwrite__CWE839_rand_44_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE124_Buffer_Underwrite__CWE839_rand_44_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !96, metadata !DIExpression()), !dbg !97
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !97
  store i32 -1, i32* %data, align 4, !dbg !98
  store i32 7, i32* %data, align 4, !dbg !99
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !100
  %1 = load i32, i32* %data, align 4, !dbg !101
  call void %0(i32 %1), !dbg !100
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !103 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %i, metadata !106, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !110
  %1 = load i32, i32* %data.addr, align 4, !dbg !111
  %cmp = icmp slt i32 %1, 10, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !115
  %idxprom = sext i32 %2 to i64, !dbg !117
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !117
  store i32 1, i32* %arrayidx, align 4, !dbg !118
  store i32 0, i32* %i, align 4, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !122
  %cmp1 = icmp slt i32 %3, 10, !dbg !124
  br i1 %cmp1, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !126
  %idxprom2 = sext i32 %4 to i64, !dbg !128
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !128
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !128
  call void @printIntLine(i32 %5), !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !131
  %inc = add nsw i32 %6, 1, !dbg !131
  store i32 %inc, i32* %i, align 4, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !135

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !136
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !139 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !142, metadata !DIExpression()), !dbg !143
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !143
  store i32 -1, i32* %data, align 4, !dbg !144
  %call = call i32 @rand() #5, !dbg !145
  %and = and i32 %call, 1, !dbg !145
  %tobool = icmp ne i32 %and, 0, !dbg !145
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !145

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !145
  %shl = shl i32 %call1, 30, !dbg !145
  %call2 = call i32 @rand() #5, !dbg !145
  %shl3 = shl i32 %call2, 15, !dbg !145
  %xor = xor i32 %shl, %shl3, !dbg !145
  %call4 = call i32 @rand() #5, !dbg !145
  %xor5 = xor i32 %xor, %call4, !dbg !145
  br label %cond.end, !dbg !145

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !145
  %shl7 = shl i32 %call6, 30, !dbg !145
  %call8 = call i32 @rand() #5, !dbg !145
  %shl9 = shl i32 %call8, 15, !dbg !145
  %xor10 = xor i32 %shl7, %shl9, !dbg !145
  %call11 = call i32 @rand() #5, !dbg !145
  %xor12 = xor i32 %xor10, %call11, !dbg !145
  %sub = sub i32 0, %xor12, !dbg !145
  %sub13 = sub i32 %sub, 1, !dbg !145
  br label %cond.end, !dbg !145

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !145
  store i32 %cond, i32* %data, align 4, !dbg !146
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !147
  %1 = load i32, i32* %data, align 4, !dbg !148
  call void %0(i32 %1), !dbg !147
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !150 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i32* %i, metadata !153, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !156, metadata !DIExpression()), !dbg !157
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !157
  %1 = load i32, i32* %data.addr, align 4, !dbg !158
  %cmp = icmp sge i32 %1, 0, !dbg !160
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !161

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !162
  %cmp1 = icmp slt i32 %2, 10, !dbg !163
  br i1 %cmp1, label %if.then, label %if.else, !dbg !164

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !165
  %idxprom = sext i32 %3 to i64, !dbg !167
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !167
  store i32 1, i32* %arrayidx, align 4, !dbg !168
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !172
  %cmp2 = icmp slt i32 %4, 10, !dbg !174
  br i1 %cmp2, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !176
  %idxprom3 = sext i32 %5 to i64, !dbg !178
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !178
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !178
  call void @printIntLine(i32 %6), !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !181
  %inc = add nsw i32 %7, 1, !dbg !181
  store i32 %inc, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !185

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !186
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_44_bad", scope: !13, file: !13, line: 45, type: !14, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_44.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 47, type: !4)
!17 = !DILocation(line: 47, column: 9, scope: !12)
!18 = !DILocalVariable(name: "funcPtr", scope: !12, file: !13, line: 49, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !4}
!22 = !DILocation(line: 49, column: 12, scope: !12)
!23 = !DILocation(line: 51, column: 10, scope: !12)
!24 = !DILocation(line: 53, column: 12, scope: !12)
!25 = !DILocation(line: 53, column: 10, scope: !12)
!26 = !DILocation(line: 55, column: 5, scope: !12)
!27 = !DILocation(line: 55, column: 13, scope: !12)
!28 = !DILocation(line: 56, column: 1, scope: !12)
!29 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 22, type: !20, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocalVariable(name: "data", arg: 1, scope: !29, file: !13, line: 22, type: !4)
!31 = !DILocation(line: 22, column: 25, scope: !29)
!32 = !DILocalVariable(name: "i", scope: !33, file: !13, line: 25, type: !4)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 24, column: 5)
!34 = !DILocation(line: 25, column: 13, scope: !33)
!35 = !DILocalVariable(name: "buffer", scope: !33, file: !13, line: 26, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 10)
!39 = !DILocation(line: 26, column: 13, scope: !33)
!40 = !DILocation(line: 29, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !13, line: 29, column: 13)
!42 = !DILocation(line: 29, column: 18, scope: !41)
!43 = !DILocation(line: 29, column: 13, scope: !33)
!44 = !DILocation(line: 31, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !13, line: 30, column: 9)
!46 = !DILocation(line: 31, column: 13, scope: !45)
!47 = !DILocation(line: 31, column: 26, scope: !45)
!48 = !DILocation(line: 33, column: 19, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !13, line: 33, column: 13)
!50 = !DILocation(line: 33, column: 17, scope: !49)
!51 = !DILocation(line: 33, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !13, line: 33, column: 13)
!53 = !DILocation(line: 33, column: 26, scope: !52)
!54 = !DILocation(line: 33, column: 13, scope: !49)
!55 = !DILocation(line: 35, column: 37, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !13, line: 34, column: 13)
!57 = !DILocation(line: 35, column: 30, scope: !56)
!58 = !DILocation(line: 35, column: 17, scope: !56)
!59 = !DILocation(line: 36, column: 13, scope: !56)
!60 = !DILocation(line: 33, column: 33, scope: !52)
!61 = !DILocation(line: 33, column: 13, scope: !52)
!62 = distinct !{!62, !54, !63, !64}
!63 = !DILocation(line: 36, column: 13, scope: !49)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 37, column: 9, scope: !45)
!66 = !DILocation(line: 40, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !41, file: !13, line: 39, column: 9)
!68 = !DILocation(line: 43, column: 1, scope: !29)
!69 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_44_good", scope: !13, file: !13, line: 132, type: !14, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 134, column: 5, scope: !69)
!71 = !DILocation(line: 135, column: 5, scope: !69)
!72 = !DILocation(line: 136, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 146, type: !74, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!4, !4, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !13, line: 146, type: !4)
!80 = !DILocation(line: 146, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !13, line: 146, type: !76)
!82 = !DILocation(line: 146, column: 27, scope: !73)
!83 = !DILocation(line: 149, column: 22, scope: !73)
!84 = !DILocation(line: 149, column: 12, scope: !73)
!85 = !DILocation(line: 149, column: 5, scope: !73)
!86 = !DILocation(line: 151, column: 5, scope: !73)
!87 = !DILocation(line: 152, column: 5, scope: !73)
!88 = !DILocation(line: 153, column: 5, scope: !73)
!89 = !DILocation(line: 156, column: 5, scope: !73)
!90 = !DILocation(line: 157, column: 5, scope: !73)
!91 = !DILocation(line: 158, column: 5, scope: !73)
!92 = !DILocation(line: 160, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 86, type: !14, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !13, line: 88, type: !4)
!95 = !DILocation(line: 88, column: 9, scope: !93)
!96 = !DILocalVariable(name: "funcPtr", scope: !93, file: !13, line: 89, type: !19)
!97 = !DILocation(line: 89, column: 12, scope: !93)
!98 = !DILocation(line: 91, column: 10, scope: !93)
!99 = !DILocation(line: 94, column: 10, scope: !93)
!100 = !DILocation(line: 95, column: 5, scope: !93)
!101 = !DILocation(line: 95, column: 13, scope: !93)
!102 = !DILocation(line: 96, column: 1, scope: !93)
!103 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 63, type: !20, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", arg: 1, scope: !103, file: !13, line: 63, type: !4)
!105 = !DILocation(line: 63, column: 29, scope: !103)
!106 = !DILocalVariable(name: "i", scope: !107, file: !13, line: 66, type: !4)
!107 = distinct !DILexicalBlock(scope: !103, file: !13, line: 65, column: 5)
!108 = !DILocation(line: 66, column: 13, scope: !107)
!109 = !DILocalVariable(name: "buffer", scope: !107, file: !13, line: 67, type: !36)
!110 = !DILocation(line: 67, column: 13, scope: !107)
!111 = !DILocation(line: 70, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !13, line: 70, column: 13)
!113 = !DILocation(line: 70, column: 18, scope: !112)
!114 = !DILocation(line: 70, column: 13, scope: !107)
!115 = !DILocation(line: 72, column: 20, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !13, line: 71, column: 9)
!117 = !DILocation(line: 72, column: 13, scope: !116)
!118 = !DILocation(line: 72, column: 26, scope: !116)
!119 = !DILocation(line: 74, column: 19, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !13, line: 74, column: 13)
!121 = !DILocation(line: 74, column: 17, scope: !120)
!122 = !DILocation(line: 74, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !13, line: 74, column: 13)
!124 = !DILocation(line: 74, column: 26, scope: !123)
!125 = !DILocation(line: 74, column: 13, scope: !120)
!126 = !DILocation(line: 76, column: 37, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !13, line: 75, column: 13)
!128 = !DILocation(line: 76, column: 30, scope: !127)
!129 = !DILocation(line: 76, column: 17, scope: !127)
!130 = !DILocation(line: 77, column: 13, scope: !127)
!131 = !DILocation(line: 74, column: 33, scope: !123)
!132 = !DILocation(line: 74, column: 13, scope: !123)
!133 = distinct !{!133, !125, !134, !64}
!134 = !DILocation(line: 77, column: 13, scope: !120)
!135 = !DILocation(line: 78, column: 9, scope: !116)
!136 = !DILocation(line: 81, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !112, file: !13, line: 80, column: 9)
!138 = !DILocation(line: 84, column: 1, scope: !103)
!139 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 121, type: !14, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !13, line: 123, type: !4)
!141 = !DILocation(line: 123, column: 9, scope: !139)
!142 = !DILocalVariable(name: "funcPtr", scope: !139, file: !13, line: 124, type: !19)
!143 = !DILocation(line: 124, column: 12, scope: !139)
!144 = !DILocation(line: 126, column: 10, scope: !139)
!145 = !DILocation(line: 128, column: 12, scope: !139)
!146 = !DILocation(line: 128, column: 10, scope: !139)
!147 = !DILocation(line: 129, column: 5, scope: !139)
!148 = !DILocation(line: 129, column: 13, scope: !139)
!149 = !DILocation(line: 130, column: 1, scope: !139)
!150 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 99, type: !20, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocalVariable(name: "data", arg: 1, scope: !150, file: !13, line: 99, type: !4)
!152 = !DILocation(line: 99, column: 29, scope: !150)
!153 = !DILocalVariable(name: "i", scope: !154, file: !13, line: 102, type: !4)
!154 = distinct !DILexicalBlock(scope: !150, file: !13, line: 101, column: 5)
!155 = !DILocation(line: 102, column: 13, scope: !154)
!156 = !DILocalVariable(name: "buffer", scope: !154, file: !13, line: 103, type: !36)
!157 = !DILocation(line: 103, column: 13, scope: !154)
!158 = !DILocation(line: 105, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !13, line: 105, column: 13)
!160 = !DILocation(line: 105, column: 18, scope: !159)
!161 = !DILocation(line: 105, column: 23, scope: !159)
!162 = !DILocation(line: 105, column: 26, scope: !159)
!163 = !DILocation(line: 105, column: 31, scope: !159)
!164 = !DILocation(line: 105, column: 13, scope: !154)
!165 = !DILocation(line: 107, column: 20, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !13, line: 106, column: 9)
!167 = !DILocation(line: 107, column: 13, scope: !166)
!168 = !DILocation(line: 107, column: 26, scope: !166)
!169 = !DILocation(line: 109, column: 19, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !13, line: 109, column: 13)
!171 = !DILocation(line: 109, column: 17, scope: !170)
!172 = !DILocation(line: 109, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !13, line: 109, column: 13)
!174 = !DILocation(line: 109, column: 26, scope: !173)
!175 = !DILocation(line: 109, column: 13, scope: !170)
!176 = !DILocation(line: 111, column: 37, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !13, line: 110, column: 13)
!178 = !DILocation(line: 111, column: 30, scope: !177)
!179 = !DILocation(line: 111, column: 17, scope: !177)
!180 = !DILocation(line: 112, column: 13, scope: !177)
!181 = !DILocation(line: 109, column: 33, scope: !173)
!182 = !DILocation(line: 109, column: 13, scope: !173)
!183 = distinct !{!183, !175, !184, !64}
!184 = !DILocation(line: 112, column: 13, scope: !170)
!185 = !DILocation(line: 113, column: 9, scope: !166)
!186 = !DILocation(line: 116, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !159, file: !13, line: 115, column: 9)
!188 = !DILocation(line: 119, column: 1, scope: !150)
