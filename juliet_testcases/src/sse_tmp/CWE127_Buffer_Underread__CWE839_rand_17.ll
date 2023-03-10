; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_17.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_17_bad() #0 !dbg !12 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !17
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
  %call = call i32 @rand() #5, !dbg !30
  %and = and i32 %call, 1, !dbg !30
  %tobool = icmp ne i32 %and, 0, !dbg !30
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !30

cond.true:                                        ; preds = %for.body
  %call1 = call i32 @rand() #5, !dbg !30
  %shl = shl i32 %call1, 30, !dbg !30
  %call2 = call i32 @rand() #5, !dbg !30
  %shl3 = shl i32 %call2, 15, !dbg !30
  %xor = xor i32 %shl, %shl3, !dbg !30
  %call4 = call i32 @rand() #5, !dbg !30
  %xor5 = xor i32 %xor, %call4, !dbg !30
  br label %cond.end, !dbg !30

cond.false:                                       ; preds = %for.body
  %call6 = call i32 @rand() #5, !dbg !30
  %shl7 = shl i32 %call6, 30, !dbg !30
  %call8 = call i32 @rand() #5, !dbg !30
  %shl9 = shl i32 %call8, 15, !dbg !30
  %xor10 = xor i32 %shl7, %shl9, !dbg !30
  %call11 = call i32 @rand() #5, !dbg !30
  %xor12 = xor i32 %xor10, %call11, !dbg !30
  %sub = sub i32 0, %xor12, !dbg !30
  %sub13 = sub i32 %sub, 1, !dbg !30
  br label %cond.end, !dbg !30

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !30
  store i32 %cond, i32* %data, align 4, !dbg !32
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %cond.end
  %1 = load i32, i32* %i, align 4, !dbg !34
  %inc = add nsw i32 %1, 1, !dbg !34
  store i32 %inc, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !35, !llvm.loop !36

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !39
  br label %for.cond14, !dbg !41

for.cond14:                                       ; preds = %for.inc18, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !42
  %cmp15 = icmp slt i32 %2, 1, !dbg !44
  br i1 %cmp15, label %for.body16, label %for.end20, !dbg !45

for.body16:                                       ; preds = %for.cond14
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !46, metadata !DIExpression()), !dbg !52
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !52
  %4 = load i32, i32* %data, align 4, !dbg !53
  %cmp17 = icmp slt i32 %4, 10, !dbg !55
  br i1 %cmp17, label %if.then, label %if.else, !dbg !56

if.then:                                          ; preds = %for.body16
  %5 = load i32, i32* %data, align 4, !dbg !57
  %idxprom = sext i32 %5 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !59
  %6 = load i32, i32* %arrayidx, align 4, !dbg !59
  call void @printIntLine(i32 %6), !dbg !60
  br label %if.end, !dbg !61

if.else:                                          ; preds = %for.body16
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !62
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc18, !dbg !64

for.inc18:                                        ; preds = %if.end
  %7 = load i32, i32* %j, align 4, !dbg !65
  %inc19 = add nsw i32 %7, 1, !dbg !65
  store i32 %inc19, i32* %j, align 4, !dbg !65
  br label %for.cond14, !dbg !66, !llvm.loop !67

for.end20:                                        ; preds = %for.cond14
  ret void, !dbg !69
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
define dso_local void @CWE127_Buffer_Underread__CWE839_rand_17_good() #0 !dbg !70 {
entry:
  call void @goodB2G(), !dbg !71
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @CWE127_Buffer_Underread__CWE839_rand_17_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  call void @CWE127_Buffer_Underread__CWE839_rand_17_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !94 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32* %k, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 -1, i32* %data, align 4, !dbg !101
  store i32 0, i32* %i, align 4, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !105
  %cmp = icmp slt i32 %0, 1, !dbg !107
  br i1 %cmp, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand() #5, !dbg !109
  %and = and i32 %call, 1, !dbg !109
  %tobool = icmp ne i32 %and, 0, !dbg !109
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !109

cond.true:                                        ; preds = %for.body
  %call1 = call i32 @rand() #5, !dbg !109
  %shl = shl i32 %call1, 30, !dbg !109
  %call2 = call i32 @rand() #5, !dbg !109
  %shl3 = shl i32 %call2, 15, !dbg !109
  %xor = xor i32 %shl, %shl3, !dbg !109
  %call4 = call i32 @rand() #5, !dbg !109
  %xor5 = xor i32 %xor, %call4, !dbg !109
  br label %cond.end, !dbg !109

cond.false:                                       ; preds = %for.body
  %call6 = call i32 @rand() #5, !dbg !109
  %shl7 = shl i32 %call6, 30, !dbg !109
  %call8 = call i32 @rand() #5, !dbg !109
  %shl9 = shl i32 %call8, 15, !dbg !109
  %xor10 = xor i32 %shl7, %shl9, !dbg !109
  %call11 = call i32 @rand() #5, !dbg !109
  %xor12 = xor i32 %xor10, %call11, !dbg !109
  %sub = sub i32 0, %xor12, !dbg !109
  %sub13 = sub i32 %sub, 1, !dbg !109
  br label %cond.end, !dbg !109

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !109
  store i32 %cond, i32* %data, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %cond.end
  %1 = load i32, i32* %i, align 4, !dbg !113
  %inc = add nsw i32 %1, 1, !dbg !113
  store i32 %inc, i32* %i, align 4, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !117
  br label %for.cond14, !dbg !119

for.cond14:                                       ; preds = %for.inc19, %for.end
  %2 = load i32, i32* %k, align 4, !dbg !120
  %cmp15 = icmp slt i32 %2, 1, !dbg !122
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !123

for.body16:                                       ; preds = %for.cond14
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !124, metadata !DIExpression()), !dbg !127
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !127
  %4 = load i32, i32* %data, align 4, !dbg !128
  %cmp17 = icmp sge i32 %4, 0, !dbg !130
  br i1 %cmp17, label %land.lhs.true, label %if.else, !dbg !131

land.lhs.true:                                    ; preds = %for.body16
  %5 = load i32, i32* %data, align 4, !dbg !132
  %cmp18 = icmp slt i32 %5, 10, !dbg !133
  br i1 %cmp18, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !135
  %idxprom = sext i32 %6 to i64, !dbg !137
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !137
  %7 = load i32, i32* %arrayidx, align 4, !dbg !137
  call void @printIntLine(i32 %7), !dbg !138
  br label %if.end, !dbg !139

if.else:                                          ; preds = %land.lhs.true, %for.body16
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !140
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc19, !dbg !142

for.inc19:                                        ; preds = %if.end
  %8 = load i32, i32* %k, align 4, !dbg !143
  %inc20 = add nsw i32 %8, 1, !dbg !143
  store i32 %inc20, i32* %k, align 4, !dbg !143
  br label %for.cond14, !dbg !144, !llvm.loop !145

for.end21:                                        ; preds = %for.cond14
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !148 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %j, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i32* %data, metadata !153, metadata !DIExpression()), !dbg !154
  store i32 -1, i32* %data, align 4, !dbg !155
  store i32 0, i32* %h, align 4, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !159
  %cmp = icmp slt i32 %0, 1, !dbg !161
  br i1 %cmp, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !163
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !166
  %inc = add nsw i32 %1, 1, !dbg !166
  store i32 %inc, i32* %h, align 4, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !170
  br label %for.cond1, !dbg !172

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !173
  %cmp2 = icmp slt i32 %2, 1, !dbg !175
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !176

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !177, metadata !DIExpression()), !dbg !180
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !180
  %4 = load i32, i32* %data, align 4, !dbg !181
  %cmp4 = icmp slt i32 %4, 10, !dbg !183
  br i1 %cmp4, label %if.then, label %if.else, !dbg !184

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !185
  %idxprom = sext i32 %5 to i64, !dbg !187
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !187
  %6 = load i32, i32* %arrayidx, align 4, !dbg !187
  call void @printIntLine(i32 %6), !dbg !188
  br label %if.end, !dbg !189

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !190
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc5, !dbg !192

for.inc5:                                         ; preds = %if.end
  %7 = load i32, i32* %j, align 4, !dbg !193
  %inc6 = add nsw i32 %7, 1, !dbg !193
  store i32 %inc6, i32* %j, align 4, !dbg !193
  br label %for.cond1, !dbg !194, !llvm.loop !195

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !197
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_17_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_rand_17.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "i", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocalVariable(name: "j", scope: !12, file: !13, line: 24, type: !4)
!19 = !DILocation(line: 24, column: 11, scope: !12)
!20 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 9, scope: !12)
!22 = !DILocation(line: 27, column: 10, scope: !12)
!23 = !DILocation(line: 28, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !12, file: !13, line: 28, column: 5)
!25 = !DILocation(line: 28, column: 9, scope: !24)
!26 = !DILocation(line: 28, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !13, line: 28, column: 5)
!28 = !DILocation(line: 28, column: 18, scope: !27)
!29 = !DILocation(line: 28, column: 5, scope: !24)
!30 = !DILocation(line: 31, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 29, column: 5)
!32 = !DILocation(line: 31, column: 14, scope: !31)
!33 = !DILocation(line: 32, column: 5, scope: !31)
!34 = !DILocation(line: 28, column: 24, scope: !27)
!35 = !DILocation(line: 28, column: 5, scope: !27)
!36 = distinct !{!36, !29, !37, !38}
!37 = !DILocation(line: 32, column: 5, scope: !24)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocation(line: 33, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !12, file: !13, line: 33, column: 5)
!41 = !DILocation(line: 33, column: 9, scope: !40)
!42 = !DILocation(line: 33, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !13, line: 33, column: 5)
!44 = !DILocation(line: 33, column: 18, scope: !43)
!45 = !DILocation(line: 33, column: 5, scope: !40)
!46 = !DILocalVariable(name: "buffer", scope: !47, file: !13, line: 36, type: !49)
!47 = distinct !DILexicalBlock(scope: !48, file: !13, line: 35, column: 9)
!48 = distinct !DILexicalBlock(scope: !43, file: !13, line: 34, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 10)
!52 = !DILocation(line: 36, column: 17, scope: !47)
!53 = !DILocation(line: 39, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !47, file: !13, line: 39, column: 17)
!55 = !DILocation(line: 39, column: 22, scope: !54)
!56 = !DILocation(line: 39, column: 17, scope: !47)
!57 = !DILocation(line: 41, column: 37, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !13, line: 40, column: 13)
!59 = !DILocation(line: 41, column: 30, scope: !58)
!60 = !DILocation(line: 41, column: 17, scope: !58)
!61 = !DILocation(line: 42, column: 13, scope: !58)
!62 = !DILocation(line: 45, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !54, file: !13, line: 44, column: 13)
!64 = !DILocation(line: 48, column: 5, scope: !48)
!65 = !DILocation(line: 33, column: 24, scope: !43)
!66 = !DILocation(line: 33, column: 5, scope: !43)
!67 = distinct !{!67, !45, !68, !38}
!68 = !DILocation(line: 48, column: 5, scope: !40)
!69 = !DILocation(line: 49, column: 1, scope: !12)
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_rand_17_good", scope: !13, file: !13, line: 115, type: !14, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 117, column: 5, scope: !70)
!72 = !DILocation(line: 118, column: 5, scope: !70)
!73 = !DILocation(line: 119, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 130, type: !75, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!4, !4, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !13, line: 130, type: !4)
!81 = !DILocation(line: 130, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !13, line: 130, type: !77)
!83 = !DILocation(line: 130, column: 27, scope: !74)
!84 = !DILocation(line: 133, column: 22, scope: !74)
!85 = !DILocation(line: 133, column: 12, scope: !74)
!86 = !DILocation(line: 133, column: 5, scope: !74)
!87 = !DILocation(line: 135, column: 5, scope: !74)
!88 = !DILocation(line: 136, column: 5, scope: !74)
!89 = !DILocation(line: 137, column: 5, scope: !74)
!90 = !DILocation(line: 140, column: 5, scope: !74)
!91 = !DILocation(line: 141, column: 5, scope: !74)
!92 = !DILocation(line: 142, column: 5, scope: !74)
!93 = !DILocation(line: 144, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 56, type: !14, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "i", scope: !94, file: !13, line: 58, type: !4)
!96 = !DILocation(line: 58, column: 9, scope: !94)
!97 = !DILocalVariable(name: "k", scope: !94, file: !13, line: 58, type: !4)
!98 = !DILocation(line: 58, column: 11, scope: !94)
!99 = !DILocalVariable(name: "data", scope: !94, file: !13, line: 59, type: !4)
!100 = !DILocation(line: 59, column: 9, scope: !94)
!101 = !DILocation(line: 61, column: 10, scope: !94)
!102 = !DILocation(line: 62, column: 11, scope: !103)
!103 = distinct !DILexicalBlock(scope: !94, file: !13, line: 62, column: 5)
!104 = !DILocation(line: 62, column: 9, scope: !103)
!105 = !DILocation(line: 62, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !13, line: 62, column: 5)
!107 = !DILocation(line: 62, column: 18, scope: !106)
!108 = !DILocation(line: 62, column: 5, scope: !103)
!109 = !DILocation(line: 65, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !13, line: 63, column: 5)
!111 = !DILocation(line: 65, column: 14, scope: !110)
!112 = !DILocation(line: 66, column: 5, scope: !110)
!113 = !DILocation(line: 62, column: 24, scope: !106)
!114 = !DILocation(line: 62, column: 5, scope: !106)
!115 = distinct !{!115, !108, !116, !38}
!116 = !DILocation(line: 66, column: 5, scope: !103)
!117 = !DILocation(line: 67, column: 11, scope: !118)
!118 = distinct !DILexicalBlock(scope: !94, file: !13, line: 67, column: 5)
!119 = !DILocation(line: 67, column: 9, scope: !118)
!120 = !DILocation(line: 67, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !13, line: 67, column: 5)
!122 = !DILocation(line: 67, column: 18, scope: !121)
!123 = !DILocation(line: 67, column: 5, scope: !118)
!124 = !DILocalVariable(name: "buffer", scope: !125, file: !13, line: 70, type: !49)
!125 = distinct !DILexicalBlock(scope: !126, file: !13, line: 69, column: 9)
!126 = distinct !DILexicalBlock(scope: !121, file: !13, line: 68, column: 5)
!127 = !DILocation(line: 70, column: 17, scope: !125)
!128 = !DILocation(line: 72, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 72, column: 17)
!130 = !DILocation(line: 72, column: 22, scope: !129)
!131 = !DILocation(line: 72, column: 27, scope: !129)
!132 = !DILocation(line: 72, column: 30, scope: !129)
!133 = !DILocation(line: 72, column: 35, scope: !129)
!134 = !DILocation(line: 72, column: 17, scope: !125)
!135 = !DILocation(line: 74, column: 37, scope: !136)
!136 = distinct !DILexicalBlock(scope: !129, file: !13, line: 73, column: 13)
!137 = !DILocation(line: 74, column: 30, scope: !136)
!138 = !DILocation(line: 74, column: 17, scope: !136)
!139 = !DILocation(line: 75, column: 13, scope: !136)
!140 = !DILocation(line: 78, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !129, file: !13, line: 77, column: 13)
!142 = !DILocation(line: 81, column: 5, scope: !126)
!143 = !DILocation(line: 67, column: 24, scope: !121)
!144 = !DILocation(line: 67, column: 5, scope: !121)
!145 = distinct !{!145, !123, !146, !38}
!146 = !DILocation(line: 81, column: 5, scope: !118)
!147 = !DILocation(line: 82, column: 1, scope: !94)
!148 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 85, type: !14, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "h", scope: !148, file: !13, line: 87, type: !4)
!150 = !DILocation(line: 87, column: 9, scope: !148)
!151 = !DILocalVariable(name: "j", scope: !148, file: !13, line: 87, type: !4)
!152 = !DILocation(line: 87, column: 11, scope: !148)
!153 = !DILocalVariable(name: "data", scope: !148, file: !13, line: 88, type: !4)
!154 = !DILocation(line: 88, column: 9, scope: !148)
!155 = !DILocation(line: 90, column: 10, scope: !148)
!156 = !DILocation(line: 91, column: 11, scope: !157)
!157 = distinct !DILexicalBlock(scope: !148, file: !13, line: 91, column: 5)
!158 = !DILocation(line: 91, column: 9, scope: !157)
!159 = !DILocation(line: 91, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !13, line: 91, column: 5)
!161 = !DILocation(line: 91, column: 18, scope: !160)
!162 = !DILocation(line: 91, column: 5, scope: !157)
!163 = !DILocation(line: 95, column: 14, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !13, line: 92, column: 5)
!165 = !DILocation(line: 96, column: 5, scope: !164)
!166 = !DILocation(line: 91, column: 24, scope: !160)
!167 = !DILocation(line: 91, column: 5, scope: !160)
!168 = distinct !{!168, !162, !169, !38}
!169 = !DILocation(line: 96, column: 5, scope: !157)
!170 = !DILocation(line: 97, column: 11, scope: !171)
!171 = distinct !DILexicalBlock(scope: !148, file: !13, line: 97, column: 5)
!172 = !DILocation(line: 97, column: 9, scope: !171)
!173 = !DILocation(line: 97, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !13, line: 97, column: 5)
!175 = !DILocation(line: 97, column: 18, scope: !174)
!176 = !DILocation(line: 97, column: 5, scope: !171)
!177 = !DILocalVariable(name: "buffer", scope: !178, file: !13, line: 100, type: !49)
!178 = distinct !DILexicalBlock(scope: !179, file: !13, line: 99, column: 9)
!179 = distinct !DILexicalBlock(scope: !174, file: !13, line: 98, column: 5)
!180 = !DILocation(line: 100, column: 17, scope: !178)
!181 = !DILocation(line: 103, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !13, line: 103, column: 17)
!183 = !DILocation(line: 103, column: 22, scope: !182)
!184 = !DILocation(line: 103, column: 17, scope: !178)
!185 = !DILocation(line: 105, column: 37, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !13, line: 104, column: 13)
!187 = !DILocation(line: 105, column: 30, scope: !186)
!188 = !DILocation(line: 105, column: 17, scope: !186)
!189 = !DILocation(line: 106, column: 13, scope: !186)
!190 = !DILocation(line: 109, column: 17, scope: !191)
!191 = distinct !DILexicalBlock(scope: !182, file: !13, line: 108, column: 13)
!192 = !DILocation(line: 112, column: 5, scope: !179)
!193 = !DILocation(line: 97, column: 24, scope: !174)
!194 = !DILocation(line: 97, column: 5, scope: !174)
!195 = distinct !{!195, !176, !196, !38}
!196 = !DILocation(line: 112, column: 5, scope: !171)
!197 = !DILocation(line: 113, column: 1, scope: !148)
