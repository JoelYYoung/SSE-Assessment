; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_32.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_32_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data15 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !18, metadata !DIExpression()), !dbg !20
  store i32* %data, i32** %dataPtr1, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !21, metadata !DIExpression()), !dbg !22
  store i32* %data, i32** %dataPtr2, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !24, metadata !DIExpression()), !dbg !26
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !27
  %1 = load i32, i32* %0, align 4, !dbg !28
  store i32 %1, i32* %data1, align 4, !dbg !26
  %call = call i32 @rand() #5, !dbg !29
  %and = and i32 %call, 1, !dbg !29
  %tobool = icmp ne i32 %and, 0, !dbg !29
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !29

cond.true:                                        ; preds = %entry
  %call2 = call i32 @rand() #5, !dbg !29
  %shl = shl i32 %call2, 30, !dbg !29
  %call3 = call i32 @rand() #5, !dbg !29
  %shl4 = shl i32 %call3, 15, !dbg !29
  %xor = xor i32 %shl, %shl4, !dbg !29
  %call5 = call i32 @rand() #5, !dbg !29
  %xor6 = xor i32 %xor, %call5, !dbg !29
  br label %cond.end, !dbg !29

cond.false:                                       ; preds = %entry
  %call7 = call i32 @rand() #5, !dbg !29
  %shl8 = shl i32 %call7, 30, !dbg !29
  %call9 = call i32 @rand() #5, !dbg !29
  %shl10 = shl i32 %call9, 15, !dbg !29
  %xor11 = xor i32 %shl8, %shl10, !dbg !29
  %call12 = call i32 @rand() #5, !dbg !29
  %xor13 = xor i32 %xor11, %call12, !dbg !29
  %sub = sub i32 0, %xor13, !dbg !29
  %sub14 = sub i32 %sub, 1, !dbg !29
  br label %cond.end, !dbg !29

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !29
  store i32 %cond, i32* %data1, align 4, !dbg !30
  %2 = load i32, i32* %data1, align 4, !dbg !31
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !32
  store i32 %2, i32* %3, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %data15, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !37
  %5 = load i32, i32* %4, align 4, !dbg !38
  store i32 %5, i32* %data15, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %i, metadata !39, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !42, metadata !DIExpression()), !dbg !46
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !46
  %7 = load i32, i32* %data15, align 4, !dbg !47
  %cmp = icmp slt i32 %7, 10, !dbg !49
  br i1 %cmp, label %if.then, label %if.else, !dbg !50

if.then:                                          ; preds = %cond.end
  %8 = load i32, i32* %data15, align 4, !dbg !51
  %idxprom = sext i32 %8 to i64, !dbg !53
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !53
  store i32 1, i32* %arrayidx, align 4, !dbg !54
  store i32 0, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !58
  %cmp16 = icmp slt i32 %9, 10, !dbg !60
  br i1 %cmp16, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !62
  %idxprom17 = sext i32 %10 to i64, !dbg !64
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom17, !dbg !64
  %11 = load i32, i32* %arrayidx18, align 4, !dbg !64
  call void @printIntLine(i32 %11), !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !67
  %inc = add nsw i32 %12, 1, !dbg !67
  store i32 %inc, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !72

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !73
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !75
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_32_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  call void @goodB2G(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @CWE124_Buffer_Underwrite__CWE839_rand_32_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  call void @CWE124_Buffer_Underwrite__CWE839_rand_32_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !103, metadata !DIExpression()), !dbg !104
  store i32* %data, i32** %dataPtr1, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !105, metadata !DIExpression()), !dbg !106
  store i32* %data, i32** %dataPtr2, align 8, !dbg !106
  store i32 -1, i32* %data, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !108, metadata !DIExpression()), !dbg !110
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !111
  %1 = load i32, i32* %0, align 4, !dbg !112
  store i32 %1, i32* %data1, align 4, !dbg !110
  store i32 7, i32* %data1, align 4, !dbg !113
  %2 = load i32, i32* %data1, align 4, !dbg !114
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !115
  store i32 %2, i32* %3, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !117, metadata !DIExpression()), !dbg !119
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !120
  %5 = load i32, i32* %4, align 4, !dbg !121
  store i32 %5, i32* %data2, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata i32* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !125, metadata !DIExpression()), !dbg !126
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !126
  %7 = load i32, i32* %data2, align 4, !dbg !127
  %cmp = icmp slt i32 %7, 10, !dbg !129
  br i1 %cmp, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !131
  %idxprom = sext i32 %8 to i64, !dbg !133
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !133
  store i32 1, i32* %arrayidx, align 4, !dbg !134
  store i32 0, i32* %i, align 4, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !138
  %cmp3 = icmp slt i32 %9, 10, !dbg !140
  br i1 %cmp3, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !142
  %idxprom4 = sext i32 %10 to i64, !dbg !144
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !144
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !144
  call void @printIntLine(i32 %11), !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !147
  %inc = add nsw i32 %12, 1, !dbg !147
  store i32 %inc, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !151

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !152
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !155 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data15 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !158, metadata !DIExpression()), !dbg !159
  store i32* %data, i32** %dataPtr1, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !160, metadata !DIExpression()), !dbg !161
  store i32* %data, i32** %dataPtr2, align 8, !dbg !161
  store i32 -1, i32* %data, align 4, !dbg !162
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !163, metadata !DIExpression()), !dbg !165
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !166
  %1 = load i32, i32* %0, align 4, !dbg !167
  store i32 %1, i32* %data1, align 4, !dbg !165
  %call = call i32 @rand() #5, !dbg !168
  %and = and i32 %call, 1, !dbg !168
  %tobool = icmp ne i32 %and, 0, !dbg !168
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !168

cond.true:                                        ; preds = %entry
  %call2 = call i32 @rand() #5, !dbg !168
  %shl = shl i32 %call2, 30, !dbg !168
  %call3 = call i32 @rand() #5, !dbg !168
  %shl4 = shl i32 %call3, 15, !dbg !168
  %xor = xor i32 %shl, %shl4, !dbg !168
  %call5 = call i32 @rand() #5, !dbg !168
  %xor6 = xor i32 %xor, %call5, !dbg !168
  br label %cond.end, !dbg !168

cond.false:                                       ; preds = %entry
  %call7 = call i32 @rand() #5, !dbg !168
  %shl8 = shl i32 %call7, 30, !dbg !168
  %call9 = call i32 @rand() #5, !dbg !168
  %shl10 = shl i32 %call9, 15, !dbg !168
  %xor11 = xor i32 %shl8, %shl10, !dbg !168
  %call12 = call i32 @rand() #5, !dbg !168
  %xor13 = xor i32 %xor11, %call12, !dbg !168
  %sub = sub i32 0, %xor13, !dbg !168
  %sub14 = sub i32 %sub, 1, !dbg !168
  br label %cond.end, !dbg !168

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !168
  store i32 %cond, i32* %data1, align 4, !dbg !169
  %2 = load i32, i32* %data1, align 4, !dbg !170
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !171
  store i32 %2, i32* %3, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata i32* %data15, metadata !173, metadata !DIExpression()), !dbg !175
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !176
  %5 = load i32, i32* %4, align 4, !dbg !177
  store i32 %5, i32* %data15, align 4, !dbg !175
  call void @llvm.dbg.declare(metadata i32* %i, metadata !178, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !181, metadata !DIExpression()), !dbg !182
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !182
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !182
  %7 = load i32, i32* %data15, align 4, !dbg !183
  %cmp = icmp sge i32 %7, 0, !dbg !185
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !186

land.lhs.true:                                    ; preds = %cond.end
  %8 = load i32, i32* %data15, align 4, !dbg !187
  %cmp16 = icmp slt i32 %8, 10, !dbg !188
  br i1 %cmp16, label %if.then, label %if.else, !dbg !189

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32, i32* %data15, align 4, !dbg !190
  %idxprom = sext i32 %9 to i64, !dbg !192
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !192
  store i32 1, i32* %arrayidx, align 4, !dbg !193
  store i32 0, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.then
  %10 = load i32, i32* %i, align 4, !dbg !197
  %cmp17 = icmp slt i32 %10, 10, !dbg !199
  br i1 %cmp17, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %11 = load i32, i32* %i, align 4, !dbg !201
  %idxprom18 = sext i32 %11 to i64, !dbg !203
  %arrayidx19 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom18, !dbg !203
  %12 = load i32, i32* %arrayidx19, align 4, !dbg !203
  call void @printIntLine(i32 %12), !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4, !dbg !206
  %inc = add nsw i32 %13, 1, !dbg !206
  store i32 %inc, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !210

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !211
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !213
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_32_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_32.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocalVariable(name: "dataPtr1", scope: !12, file: !13, line: 25, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!20 = !DILocation(line: 25, column: 10, scope: !12)
!21 = !DILocalVariable(name: "dataPtr2", scope: !12, file: !13, line: 26, type: !19)
!22 = !DILocation(line: 26, column: 10, scope: !12)
!23 = !DILocation(line: 28, column: 10, scope: !12)
!24 = !DILocalVariable(name: "data", scope: !25, file: !13, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!26 = !DILocation(line: 30, column: 13, scope: !25)
!27 = !DILocation(line: 30, column: 21, scope: !25)
!28 = !DILocation(line: 30, column: 20, scope: !25)
!29 = !DILocation(line: 32, column: 16, scope: !25)
!30 = !DILocation(line: 32, column: 14, scope: !25)
!31 = !DILocation(line: 33, column: 21, scope: !25)
!32 = !DILocation(line: 33, column: 10, scope: !25)
!33 = !DILocation(line: 33, column: 19, scope: !25)
!34 = !DILocalVariable(name: "data", scope: !35, file: !13, line: 36, type: !4)
!35 = distinct !DILexicalBlock(scope: !12, file: !13, line: 35, column: 5)
!36 = !DILocation(line: 36, column: 13, scope: !35)
!37 = !DILocation(line: 36, column: 21, scope: !35)
!38 = !DILocation(line: 36, column: 20, scope: !35)
!39 = !DILocalVariable(name: "i", scope: !40, file: !13, line: 38, type: !4)
!40 = distinct !DILexicalBlock(scope: !35, file: !13, line: 37, column: 9)
!41 = !DILocation(line: 38, column: 17, scope: !40)
!42 = !DILocalVariable(name: "buffer", scope: !40, file: !13, line: 39, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 10)
!46 = !DILocation(line: 39, column: 17, scope: !40)
!47 = !DILocation(line: 42, column: 17, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !13, line: 42, column: 17)
!49 = !DILocation(line: 42, column: 22, scope: !48)
!50 = !DILocation(line: 42, column: 17, scope: !40)
!51 = !DILocation(line: 44, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !13, line: 43, column: 13)
!53 = !DILocation(line: 44, column: 17, scope: !52)
!54 = !DILocation(line: 44, column: 30, scope: !52)
!55 = !DILocation(line: 46, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !13, line: 46, column: 17)
!57 = !DILocation(line: 46, column: 21, scope: !56)
!58 = !DILocation(line: 46, column: 28, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !13, line: 46, column: 17)
!60 = !DILocation(line: 46, column: 30, scope: !59)
!61 = !DILocation(line: 46, column: 17, scope: !56)
!62 = !DILocation(line: 48, column: 41, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !13, line: 47, column: 17)
!64 = !DILocation(line: 48, column: 34, scope: !63)
!65 = !DILocation(line: 48, column: 21, scope: !63)
!66 = !DILocation(line: 49, column: 17, scope: !63)
!67 = !DILocation(line: 46, column: 37, scope: !59)
!68 = !DILocation(line: 46, column: 17, scope: !59)
!69 = distinct !{!69, !61, !70, !71}
!70 = !DILocation(line: 49, column: 17, scope: !56)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 50, column: 13, scope: !52)
!73 = !DILocation(line: 53, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !48, file: !13, line: 52, column: 13)
!75 = !DILocation(line: 57, column: 1, scope: !12)
!76 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_32_good", scope: !13, file: !13, line: 139, type: !14, scopeLine: 140, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 141, column: 5, scope: !76)
!78 = !DILocation(line: 142, column: 5, scope: !76)
!79 = !DILocation(line: 143, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 153, type: !81, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!4, !4, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !13, line: 153, type: !4)
!87 = !DILocation(line: 153, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !13, line: 153, type: !83)
!89 = !DILocation(line: 153, column: 27, scope: !80)
!90 = !DILocation(line: 156, column: 22, scope: !80)
!91 = !DILocation(line: 156, column: 12, scope: !80)
!92 = !DILocation(line: 156, column: 5, scope: !80)
!93 = !DILocation(line: 158, column: 5, scope: !80)
!94 = !DILocation(line: 159, column: 5, scope: !80)
!95 = !DILocation(line: 160, column: 5, scope: !80)
!96 = !DILocation(line: 163, column: 5, scope: !80)
!97 = !DILocation(line: 164, column: 5, scope: !80)
!98 = !DILocation(line: 165, column: 5, scope: !80)
!99 = !DILocation(line: 167, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 64, type: !14, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !13, line: 66, type: !4)
!102 = !DILocation(line: 66, column: 9, scope: !100)
!103 = !DILocalVariable(name: "dataPtr1", scope: !100, file: !13, line: 67, type: !19)
!104 = !DILocation(line: 67, column: 10, scope: !100)
!105 = !DILocalVariable(name: "dataPtr2", scope: !100, file: !13, line: 68, type: !19)
!106 = !DILocation(line: 68, column: 10, scope: !100)
!107 = !DILocation(line: 70, column: 10, scope: !100)
!108 = !DILocalVariable(name: "data", scope: !109, file: !13, line: 72, type: !4)
!109 = distinct !DILexicalBlock(scope: !100, file: !13, line: 71, column: 5)
!110 = !DILocation(line: 72, column: 13, scope: !109)
!111 = !DILocation(line: 72, column: 21, scope: !109)
!112 = !DILocation(line: 72, column: 20, scope: !109)
!113 = !DILocation(line: 75, column: 14, scope: !109)
!114 = !DILocation(line: 76, column: 21, scope: !109)
!115 = !DILocation(line: 76, column: 10, scope: !109)
!116 = !DILocation(line: 76, column: 19, scope: !109)
!117 = !DILocalVariable(name: "data", scope: !118, file: !13, line: 79, type: !4)
!118 = distinct !DILexicalBlock(scope: !100, file: !13, line: 78, column: 5)
!119 = !DILocation(line: 79, column: 13, scope: !118)
!120 = !DILocation(line: 79, column: 21, scope: !118)
!121 = !DILocation(line: 79, column: 20, scope: !118)
!122 = !DILocalVariable(name: "i", scope: !123, file: !13, line: 81, type: !4)
!123 = distinct !DILexicalBlock(scope: !118, file: !13, line: 80, column: 9)
!124 = !DILocation(line: 81, column: 17, scope: !123)
!125 = !DILocalVariable(name: "buffer", scope: !123, file: !13, line: 82, type: !43)
!126 = !DILocation(line: 82, column: 17, scope: !123)
!127 = !DILocation(line: 85, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !13, line: 85, column: 17)
!129 = !DILocation(line: 85, column: 22, scope: !128)
!130 = !DILocation(line: 85, column: 17, scope: !123)
!131 = !DILocation(line: 87, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !13, line: 86, column: 13)
!133 = !DILocation(line: 87, column: 17, scope: !132)
!134 = !DILocation(line: 87, column: 30, scope: !132)
!135 = !DILocation(line: 89, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !13, line: 89, column: 17)
!137 = !DILocation(line: 89, column: 21, scope: !136)
!138 = !DILocation(line: 89, column: 28, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !13, line: 89, column: 17)
!140 = !DILocation(line: 89, column: 30, scope: !139)
!141 = !DILocation(line: 89, column: 17, scope: !136)
!142 = !DILocation(line: 91, column: 41, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !13, line: 90, column: 17)
!144 = !DILocation(line: 91, column: 34, scope: !143)
!145 = !DILocation(line: 91, column: 21, scope: !143)
!146 = !DILocation(line: 92, column: 17, scope: !143)
!147 = !DILocation(line: 89, column: 37, scope: !139)
!148 = !DILocation(line: 89, column: 17, scope: !139)
!149 = distinct !{!149, !141, !150, !71}
!150 = !DILocation(line: 92, column: 17, scope: !136)
!151 = !DILocation(line: 93, column: 13, scope: !132)
!152 = !DILocation(line: 96, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !128, file: !13, line: 95, column: 13)
!154 = !DILocation(line: 100, column: 1, scope: !100)
!155 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 103, type: !14, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !13, line: 105, type: !4)
!157 = !DILocation(line: 105, column: 9, scope: !155)
!158 = !DILocalVariable(name: "dataPtr1", scope: !155, file: !13, line: 106, type: !19)
!159 = !DILocation(line: 106, column: 10, scope: !155)
!160 = !DILocalVariable(name: "dataPtr2", scope: !155, file: !13, line: 107, type: !19)
!161 = !DILocation(line: 107, column: 10, scope: !155)
!162 = !DILocation(line: 109, column: 10, scope: !155)
!163 = !DILocalVariable(name: "data", scope: !164, file: !13, line: 111, type: !4)
!164 = distinct !DILexicalBlock(scope: !155, file: !13, line: 110, column: 5)
!165 = !DILocation(line: 111, column: 13, scope: !164)
!166 = !DILocation(line: 111, column: 21, scope: !164)
!167 = !DILocation(line: 111, column: 20, scope: !164)
!168 = !DILocation(line: 113, column: 16, scope: !164)
!169 = !DILocation(line: 113, column: 14, scope: !164)
!170 = !DILocation(line: 114, column: 21, scope: !164)
!171 = !DILocation(line: 114, column: 10, scope: !164)
!172 = !DILocation(line: 114, column: 19, scope: !164)
!173 = !DILocalVariable(name: "data", scope: !174, file: !13, line: 117, type: !4)
!174 = distinct !DILexicalBlock(scope: !155, file: !13, line: 116, column: 5)
!175 = !DILocation(line: 117, column: 13, scope: !174)
!176 = !DILocation(line: 117, column: 21, scope: !174)
!177 = !DILocation(line: 117, column: 20, scope: !174)
!178 = !DILocalVariable(name: "i", scope: !179, file: !13, line: 119, type: !4)
!179 = distinct !DILexicalBlock(scope: !174, file: !13, line: 118, column: 9)
!180 = !DILocation(line: 119, column: 17, scope: !179)
!181 = !DILocalVariable(name: "buffer", scope: !179, file: !13, line: 120, type: !43)
!182 = !DILocation(line: 120, column: 17, scope: !179)
!183 = !DILocation(line: 122, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !179, file: !13, line: 122, column: 17)
!185 = !DILocation(line: 122, column: 22, scope: !184)
!186 = !DILocation(line: 122, column: 27, scope: !184)
!187 = !DILocation(line: 122, column: 30, scope: !184)
!188 = !DILocation(line: 122, column: 35, scope: !184)
!189 = !DILocation(line: 122, column: 17, scope: !179)
!190 = !DILocation(line: 124, column: 24, scope: !191)
!191 = distinct !DILexicalBlock(scope: !184, file: !13, line: 123, column: 13)
!192 = !DILocation(line: 124, column: 17, scope: !191)
!193 = !DILocation(line: 124, column: 30, scope: !191)
!194 = !DILocation(line: 126, column: 23, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !13, line: 126, column: 17)
!196 = !DILocation(line: 126, column: 21, scope: !195)
!197 = !DILocation(line: 126, column: 28, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !13, line: 126, column: 17)
!199 = !DILocation(line: 126, column: 30, scope: !198)
!200 = !DILocation(line: 126, column: 17, scope: !195)
!201 = !DILocation(line: 128, column: 41, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !13, line: 127, column: 17)
!203 = !DILocation(line: 128, column: 34, scope: !202)
!204 = !DILocation(line: 128, column: 21, scope: !202)
!205 = !DILocation(line: 129, column: 17, scope: !202)
!206 = !DILocation(line: 126, column: 37, scope: !198)
!207 = !DILocation(line: 126, column: 17, scope: !198)
!208 = distinct !{!208, !200, !209, !71}
!209 = !DILocation(line: 129, column: 17, scope: !195)
!210 = !DILocation(line: 130, column: 13, scope: !191)
!211 = !DILocation(line: 133, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !184, file: !13, line: 132, column: 13)
!213 = !DILocation(line: 137, column: 1, scope: !155)
