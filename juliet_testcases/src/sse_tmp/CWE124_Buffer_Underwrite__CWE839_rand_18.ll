; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_18.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_18_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  br label %source, !dbg !19

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !20), !dbg !21
  %call = call i32 @rand() #5, !dbg !22
  %and = and i32 %call, 1, !dbg !22
  %tobool = icmp ne i32 %and, 0, !dbg !22
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !22

cond.true:                                        ; preds = %source
  %call1 = call i32 @rand() #5, !dbg !22
  %shl = shl i32 %call1, 30, !dbg !22
  %call2 = call i32 @rand() #5, !dbg !22
  %shl3 = shl i32 %call2, 15, !dbg !22
  %xor = xor i32 %shl, %shl3, !dbg !22
  %call4 = call i32 @rand() #5, !dbg !22
  %xor5 = xor i32 %xor, %call4, !dbg !22
  br label %cond.end, !dbg !22

cond.false:                                       ; preds = %source
  %call6 = call i32 @rand() #5, !dbg !22
  %shl7 = shl i32 %call6, 30, !dbg !22
  %call8 = call i32 @rand() #5, !dbg !22
  %shl9 = shl i32 %call8, 15, !dbg !22
  %xor10 = xor i32 %shl7, %shl9, !dbg !22
  %call11 = call i32 @rand() #5, !dbg !22
  %xor12 = xor i32 %xor10, %call11, !dbg !22
  %sub = sub i32 0, %xor12, !dbg !22
  %sub13 = sub i32 %sub, 1, !dbg !22
  br label %cond.end, !dbg !22

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !22
  store i32 %cond, i32* %data, align 4, !dbg !23
  br label %sink, !dbg !24

sink:                                             ; preds = %cond.end
  call void @llvm.dbg.label(metadata !25), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !34
  %1 = load i32, i32* %data, align 4, !dbg !35
  %cmp = icmp slt i32 %1, 10, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !39
  %idxprom = sext i32 %2 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !41
  store i32 1, i32* %arrayidx, align 4, !dbg !42
  store i32 0, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !46
  %cmp14 = icmp slt i32 %3, 10, !dbg !48
  br i1 %cmp14, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !50
  %idxprom15 = sext i32 %4 to i64, !dbg !52
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom15, !dbg !52
  %5 = load i32, i32* %arrayidx16, align 4, !dbg !52
  call void @printIntLine(i32 %5), !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !55
  %inc = add nsw i32 %6, 1, !dbg !55
  store i32 %inc, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !60

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !61
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_18_good() #0 !dbg !64 {
entry:
  call void @goodB2G(), !dbg !65
  call void @goodG2B(), !dbg !66
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE124_Buffer_Underwrite__CWE839_rand_18_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__CWE839_rand_18_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !88 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  br label %source, !dbg !92

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !93), !dbg !94
  %call = call i32 @rand() #5, !dbg !95
  %and = and i32 %call, 1, !dbg !95
  %tobool = icmp ne i32 %and, 0, !dbg !95
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !95

cond.true:                                        ; preds = %source
  %call1 = call i32 @rand() #5, !dbg !95
  %shl = shl i32 %call1, 30, !dbg !95
  %call2 = call i32 @rand() #5, !dbg !95
  %shl3 = shl i32 %call2, 15, !dbg !95
  %xor = xor i32 %shl, %shl3, !dbg !95
  %call4 = call i32 @rand() #5, !dbg !95
  %xor5 = xor i32 %xor, %call4, !dbg !95
  br label %cond.end, !dbg !95

cond.false:                                       ; preds = %source
  %call6 = call i32 @rand() #5, !dbg !95
  %shl7 = shl i32 %call6, 30, !dbg !95
  %call8 = call i32 @rand() #5, !dbg !95
  %shl9 = shl i32 %call8, 15, !dbg !95
  %xor10 = xor i32 %shl7, %shl9, !dbg !95
  %call11 = call i32 @rand() #5, !dbg !95
  %xor12 = xor i32 %xor10, %call11, !dbg !95
  %sub = sub i32 0, %xor12, !dbg !95
  %sub13 = sub i32 %sub, 1, !dbg !95
  br label %cond.end, !dbg !95

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !95
  store i32 %cond, i32* %data, align 4, !dbg !96
  br label %sink, !dbg !97

sink:                                             ; preds = %cond.end
  call void @llvm.dbg.label(metadata !98), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %i, metadata !100, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !104
  %1 = load i32, i32* %data, align 4, !dbg !105
  %cmp = icmp sge i32 %1, 0, !dbg !107
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !108

land.lhs.true:                                    ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !109
  %cmp14 = icmp slt i32 %2, 10, !dbg !110
  br i1 %cmp14, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !112
  %idxprom = sext i32 %3 to i64, !dbg !114
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !114
  store i32 1, i32* %arrayidx, align 4, !dbg !115
  store i32 0, i32* %i, align 4, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !119
  %cmp15 = icmp slt i32 %4, 10, !dbg !121
  br i1 %cmp15, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !123
  %idxprom16 = sext i32 %5 to i64, !dbg !125
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom16, !dbg !125
  %6 = load i32, i32* %arrayidx17, align 4, !dbg !125
  call void @printIntLine(i32 %6), !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !128
  %inc = add nsw i32 %7, 1, !dbg !128
  store i32 %inc, i32* %i, align 4, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !132

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !136 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !137, metadata !DIExpression()), !dbg !138
  store i32 -1, i32* %data, align 4, !dbg !139
  br label %source, !dbg !140

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !141), !dbg !142
  store i32 7, i32* %data, align 4, !dbg !143
  br label %sink, !dbg !144

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !145), !dbg !146
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !151
  %1 = load i32, i32* %data, align 4, !dbg !152
  %cmp = icmp slt i32 %1, 10, !dbg !154
  br i1 %cmp, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !156
  %idxprom = sext i32 %2 to i64, !dbg !158
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !158
  store i32 1, i32* %arrayidx, align 4, !dbg !159
  store i32 0, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !163
  %cmp1 = icmp slt i32 %3, 10, !dbg !165
  br i1 %cmp1, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !167
  %idxprom2 = sext i32 %4 to i64, !dbg !169
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !169
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !169
  call void @printIntLine(i32 %5), !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !172
  %inc = add nsw i32 %6, 1, !dbg !172
  store i32 %inc, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !176

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !177
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !179
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_18_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_18.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 27, column: 5, scope: !12)
!20 = !DILabel(scope: !12, name: "source", file: !13, line: 28)
!21 = !DILocation(line: 28, column: 1, scope: !12)
!22 = !DILocation(line: 30, column: 12, scope: !12)
!23 = !DILocation(line: 30, column: 10, scope: !12)
!24 = !DILocation(line: 31, column: 5, scope: !12)
!25 = !DILabel(scope: !12, name: "sink", file: !13, line: 32)
!26 = !DILocation(line: 32, column: 1, scope: !12)
!27 = !DILocalVariable(name: "i", scope: !28, file: !13, line: 34, type: !4)
!28 = distinct !DILexicalBlock(scope: !12, file: !13, line: 33, column: 5)
!29 = !DILocation(line: 34, column: 13, scope: !28)
!30 = !DILocalVariable(name: "buffer", scope: !28, file: !13, line: 35, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 10)
!34 = !DILocation(line: 35, column: 13, scope: !28)
!35 = !DILocation(line: 38, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !13, line: 38, column: 13)
!37 = !DILocation(line: 38, column: 18, scope: !36)
!38 = !DILocation(line: 38, column: 13, scope: !28)
!39 = !DILocation(line: 40, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !13, line: 39, column: 9)
!41 = !DILocation(line: 40, column: 13, scope: !40)
!42 = !DILocation(line: 40, column: 26, scope: !40)
!43 = !DILocation(line: 42, column: 19, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !13, line: 42, column: 13)
!45 = !DILocation(line: 42, column: 17, scope: !44)
!46 = !DILocation(line: 42, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !13, line: 42, column: 13)
!48 = !DILocation(line: 42, column: 26, scope: !47)
!49 = !DILocation(line: 42, column: 13, scope: !44)
!50 = !DILocation(line: 44, column: 37, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !13, line: 43, column: 13)
!52 = !DILocation(line: 44, column: 30, scope: !51)
!53 = !DILocation(line: 44, column: 17, scope: !51)
!54 = !DILocation(line: 45, column: 13, scope: !51)
!55 = !DILocation(line: 42, column: 33, scope: !47)
!56 = !DILocation(line: 42, column: 13, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 45, column: 13, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 46, column: 9, scope: !40)
!61 = !DILocation(line: 49, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !36, file: !13, line: 48, column: 9)
!63 = !DILocation(line: 52, column: 1, scope: !12)
!64 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_18_good", scope: !13, file: !13, line: 124, type: !14, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 126, column: 5, scope: !64)
!66 = !DILocation(line: 127, column: 5, scope: !64)
!67 = !DILocation(line: 128, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 139, type: !69, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!4, !4, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !13, line: 139, type: !4)
!75 = !DILocation(line: 139, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !13, line: 139, type: !71)
!77 = !DILocation(line: 139, column: 27, scope: !68)
!78 = !DILocation(line: 142, column: 22, scope: !68)
!79 = !DILocation(line: 142, column: 12, scope: !68)
!80 = !DILocation(line: 142, column: 5, scope: !68)
!81 = !DILocation(line: 144, column: 5, scope: !68)
!82 = !DILocation(line: 145, column: 5, scope: !68)
!83 = !DILocation(line: 146, column: 5, scope: !68)
!84 = !DILocation(line: 149, column: 5, scope: !68)
!85 = !DILocation(line: 150, column: 5, scope: !68)
!86 = !DILocation(line: 151, column: 5, scope: !68)
!87 = !DILocation(line: 153, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 59, type: !14, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !13, line: 61, type: !4)
!90 = !DILocation(line: 61, column: 9, scope: !88)
!91 = !DILocation(line: 63, column: 10, scope: !88)
!92 = !DILocation(line: 64, column: 5, scope: !88)
!93 = !DILabel(scope: !88, name: "source", file: !13, line: 65)
!94 = !DILocation(line: 65, column: 1, scope: !88)
!95 = !DILocation(line: 67, column: 12, scope: !88)
!96 = !DILocation(line: 67, column: 10, scope: !88)
!97 = !DILocation(line: 68, column: 5, scope: !88)
!98 = !DILabel(scope: !88, name: "sink", file: !13, line: 69)
!99 = !DILocation(line: 69, column: 1, scope: !88)
!100 = !DILocalVariable(name: "i", scope: !101, file: !13, line: 71, type: !4)
!101 = distinct !DILexicalBlock(scope: !88, file: !13, line: 70, column: 5)
!102 = !DILocation(line: 71, column: 13, scope: !101)
!103 = !DILocalVariable(name: "buffer", scope: !101, file: !13, line: 72, type: !31)
!104 = !DILocation(line: 72, column: 13, scope: !101)
!105 = !DILocation(line: 74, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !13, line: 74, column: 13)
!107 = !DILocation(line: 74, column: 18, scope: !106)
!108 = !DILocation(line: 74, column: 23, scope: !106)
!109 = !DILocation(line: 74, column: 26, scope: !106)
!110 = !DILocation(line: 74, column: 31, scope: !106)
!111 = !DILocation(line: 74, column: 13, scope: !101)
!112 = !DILocation(line: 76, column: 20, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !13, line: 75, column: 9)
!114 = !DILocation(line: 76, column: 13, scope: !113)
!115 = !DILocation(line: 76, column: 26, scope: !113)
!116 = !DILocation(line: 78, column: 19, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !13, line: 78, column: 13)
!118 = !DILocation(line: 78, column: 17, scope: !117)
!119 = !DILocation(line: 78, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !13, line: 78, column: 13)
!121 = !DILocation(line: 78, column: 26, scope: !120)
!122 = !DILocation(line: 78, column: 13, scope: !117)
!123 = !DILocation(line: 80, column: 37, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !13, line: 79, column: 13)
!125 = !DILocation(line: 80, column: 30, scope: !124)
!126 = !DILocation(line: 80, column: 17, scope: !124)
!127 = !DILocation(line: 81, column: 13, scope: !124)
!128 = !DILocation(line: 78, column: 33, scope: !120)
!129 = !DILocation(line: 78, column: 13, scope: !120)
!130 = distinct !{!130, !122, !131, !59}
!131 = !DILocation(line: 81, column: 13, scope: !117)
!132 = !DILocation(line: 82, column: 9, scope: !113)
!133 = !DILocation(line: 85, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !106, file: !13, line: 84, column: 9)
!135 = !DILocation(line: 88, column: 1, scope: !88)
!136 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 91, type: !14, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !13, line: 93, type: !4)
!138 = !DILocation(line: 93, column: 9, scope: !136)
!139 = !DILocation(line: 95, column: 10, scope: !136)
!140 = !DILocation(line: 96, column: 5, scope: !136)
!141 = !DILabel(scope: !136, name: "source", file: !13, line: 97)
!142 = !DILocation(line: 97, column: 1, scope: !136)
!143 = !DILocation(line: 100, column: 10, scope: !136)
!144 = !DILocation(line: 101, column: 5, scope: !136)
!145 = !DILabel(scope: !136, name: "sink", file: !13, line: 102)
!146 = !DILocation(line: 102, column: 1, scope: !136)
!147 = !DILocalVariable(name: "i", scope: !148, file: !13, line: 104, type: !4)
!148 = distinct !DILexicalBlock(scope: !136, file: !13, line: 103, column: 5)
!149 = !DILocation(line: 104, column: 13, scope: !148)
!150 = !DILocalVariable(name: "buffer", scope: !148, file: !13, line: 105, type: !31)
!151 = !DILocation(line: 105, column: 13, scope: !148)
!152 = !DILocation(line: 108, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !13, line: 108, column: 13)
!154 = !DILocation(line: 108, column: 18, scope: !153)
!155 = !DILocation(line: 108, column: 13, scope: !148)
!156 = !DILocation(line: 110, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !13, line: 109, column: 9)
!158 = !DILocation(line: 110, column: 13, scope: !157)
!159 = !DILocation(line: 110, column: 26, scope: !157)
!160 = !DILocation(line: 112, column: 19, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 112, column: 13)
!162 = !DILocation(line: 112, column: 17, scope: !161)
!163 = !DILocation(line: 112, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !13, line: 112, column: 13)
!165 = !DILocation(line: 112, column: 26, scope: !164)
!166 = !DILocation(line: 112, column: 13, scope: !161)
!167 = !DILocation(line: 114, column: 37, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !13, line: 113, column: 13)
!169 = !DILocation(line: 114, column: 30, scope: !168)
!170 = !DILocation(line: 114, column: 17, scope: !168)
!171 = !DILocation(line: 115, column: 13, scope: !168)
!172 = !DILocation(line: 112, column: 33, scope: !164)
!173 = !DILocation(line: 112, column: 13, scope: !164)
!174 = distinct !{!174, !166, !175, !59}
!175 = !DILocation(line: 115, column: 13, scope: !161)
!176 = !DILocation(line: 116, column: 9, scope: !157)
!177 = !DILocation(line: 119, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !153, file: !13, line: 118, column: 9)
!179 = !DILocation(line: 122, column: 1, scope: !136)
