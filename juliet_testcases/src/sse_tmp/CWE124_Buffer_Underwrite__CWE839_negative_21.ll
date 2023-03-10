; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_21.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !12
@goodG2BStatic = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 -1, i32* %data, align 4, !dbg !27
  store i32 -5, i32* %data, align 4, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i32, i32* %data, align 4, !dbg !30
  call void @badSink(i32 %0), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !33 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* @badStatic, align 4, !dbg !38
  %tobool = icmp ne i32 %0, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.end5, !dbg !40

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !45, metadata !DIExpression()), !dbg !49
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !49
  %2 = load i32, i32* %data.addr, align 4, !dbg !50
  %cmp = icmp slt i32 %2, 10, !dbg !52
  br i1 %cmp, label %if.then1, label %if.else, !dbg !53

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !54
  %idxprom = sext i32 %3 to i64, !dbg !56
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !56
  store i32 1, i32* %arrayidx, align 4, !dbg !57
  store i32 0, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !61
  %cmp2 = icmp slt i32 %4, 10, !dbg !63
  br i1 %cmp2, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !65
  %idxprom3 = sext i32 %5 to i64, !dbg !67
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !67
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !67
  call void @printIntLine(i32 %6), !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !70
  %inc = add nsw i32 %7, 1, !dbg !70
  store i32 %inc, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !75

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !78

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_21_good() #0 !dbg !80 {
entry:
  call void @goodB2G1(), !dbg !81
  call void @goodB2G2(), !dbg !82
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE124_Buffer_Underwrite__CWE839_negative_21_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE124_Buffer_Underwrite__CWE839_negative_21_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
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
define internal void @goodB2G1() #0 !dbg !105 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %data, align 4, !dbg !108
  store i32 -5, i32* %data, align 4, !dbg !109
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !110
  %0 = load i32, i32* %data, align 4, !dbg !111
  call void @goodB2G1Sink(i32 %0), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !114 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !117
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !120
  br label %if.end7, !dbg !122

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !123, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !127, metadata !DIExpression()), !dbg !128
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !128
  %2 = load i32, i32* %data.addr, align 4, !dbg !129
  %cmp = icmp sge i32 %2, 0, !dbg !131
  br i1 %cmp, label %land.lhs.true, label %if.else6, !dbg !132

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !133
  %cmp1 = icmp slt i32 %3, 10, !dbg !134
  br i1 %cmp1, label %if.then2, label %if.else6, !dbg !135

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !136
  %idxprom = sext i32 %4 to i64, !dbg !138
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !138
  store i32 1, i32* %arrayidx, align 4, !dbg !139
  store i32 0, i32* %i, align 4, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !143
  %cmp3 = icmp slt i32 %5, 10, !dbg !145
  br i1 %cmp3, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !147
  %idxprom4 = sext i32 %6 to i64, !dbg !149
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !149
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !149
  call void @printIntLine(i32 %7), !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !152
  %inc = add nsw i32 %8, 1, !dbg !152
  store i32 %inc, i32* %i, align 4, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !156

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !157
  br label %if.end

if.end:                                           ; preds = %if.else6, %for.end
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !160 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !161, metadata !DIExpression()), !dbg !162
  store i32 -1, i32* %data, align 4, !dbg !163
  store i32 -5, i32* %data, align 4, !dbg !164
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !165
  %0 = load i32, i32* %data, align 4, !dbg !166
  call void @goodB2G2Sink(i32 %0), !dbg !167
  ret void, !dbg !168
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !169 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !170, metadata !DIExpression()), !dbg !171
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !172
  %tobool = icmp ne i32 %0, 0, !dbg !172
  br i1 %tobool, label %if.then, label %if.end6, !dbg !174

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !175, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !179, metadata !DIExpression()), !dbg !180
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !180
  %2 = load i32, i32* %data.addr, align 4, !dbg !181
  %cmp = icmp sge i32 %2, 0, !dbg !183
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !184

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !185
  %cmp1 = icmp slt i32 %3, 10, !dbg !186
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !187

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !188
  %idxprom = sext i32 %4 to i64, !dbg !190
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !190
  store i32 1, i32* %arrayidx, align 4, !dbg !191
  store i32 0, i32* %i, align 4, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !195
  %cmp3 = icmp slt i32 %5, 10, !dbg !197
  br i1 %cmp3, label %for.body, label %for.end, !dbg !198

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !199
  %idxprom4 = sext i32 %6 to i64, !dbg !201
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !201
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !201
  call void @printIntLine(i32 %7), !dbg !202
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !204
  %inc = add nsw i32 %8, 1, !dbg !204
  store i32 %inc, i32* %i, align 4, !dbg !204
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !208

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !209
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end6, !dbg !211

if.end6:                                          ; preds = %if.end, %entry
  ret void, !dbg !212
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !213 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !214, metadata !DIExpression()), !dbg !215
  store i32 -1, i32* %data, align 4, !dbg !216
  store i32 7, i32* %data, align 4, !dbg !217
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !218
  %0 = load i32, i32* %data, align 4, !dbg !219
  call void @goodG2BSink(i32 %0), !dbg !220
  ret void, !dbg !221
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !222 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !223, metadata !DIExpression()), !dbg !224
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !225
  %tobool = icmp ne i32 %0, 0, !dbg !225
  br i1 %tobool, label %if.then, label %if.end5, !dbg !227

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !228, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !232, metadata !DIExpression()), !dbg !233
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !233
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !233
  %2 = load i32, i32* %data.addr, align 4, !dbg !234
  %cmp = icmp slt i32 %2, 10, !dbg !236
  br i1 %cmp, label %if.then1, label %if.else, !dbg !237

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !238
  %idxprom = sext i32 %3 to i64, !dbg !240
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !240
  store i32 1, i32* %arrayidx, align 4, !dbg !241
  store i32 0, i32* %i, align 4, !dbg !242
  br label %for.cond, !dbg !244

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !245
  %cmp2 = icmp slt i32 %4, 10, !dbg !247
  br i1 %cmp2, label %for.body, label %for.end, !dbg !248

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !249
  %idxprom3 = sext i32 %5 to i64, !dbg !251
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !251
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !251
  call void @printIntLine(i32 %6), !dbg !252
  br label %for.inc, !dbg !253

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !254
  %inc = add nsw i32 %7, 1, !dbg !254
  store i32 %inc, i32* %i, align 4, !dbg !254
  br label %for.cond, !dbg !255, !llvm.loop !256

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !258

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !259
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !261

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !262
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12, !14}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !10, line: 67, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_21.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !10, line: 68, type: !11, isLocal: true, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !10, line: 69, type: !11, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_21_bad", scope: !10, file: !10, line: 51, type: !23, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !10, line: 53, type: !11)
!26 = !DILocation(line: 53, column: 9, scope: !22)
!27 = !DILocation(line: 55, column: 10, scope: !22)
!28 = !DILocation(line: 57, column: 10, scope: !22)
!29 = !DILocation(line: 58, column: 15, scope: !22)
!30 = !DILocation(line: 59, column: 13, scope: !22)
!31 = !DILocation(line: 59, column: 5, scope: !22)
!32 = !DILocation(line: 60, column: 1, scope: !22)
!33 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 25, type: !34, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !11}
!36 = !DILocalVariable(name: "data", arg: 1, scope: !33, file: !10, line: 25, type: !11)
!37 = !DILocation(line: 25, column: 25, scope: !33)
!38 = !DILocation(line: 27, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !10, line: 27, column: 8)
!40 = !DILocation(line: 27, column: 8, scope: !33)
!41 = !DILocalVariable(name: "i", scope: !42, file: !10, line: 30, type: !11)
!42 = distinct !DILexicalBlock(scope: !43, file: !10, line: 29, column: 9)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 28, column: 5)
!44 = !DILocation(line: 30, column: 17, scope: !42)
!45 = !DILocalVariable(name: "buffer", scope: !42, file: !10, line: 31, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 10)
!49 = !DILocation(line: 31, column: 17, scope: !42)
!50 = !DILocation(line: 34, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !42, file: !10, line: 34, column: 17)
!52 = !DILocation(line: 34, column: 22, scope: !51)
!53 = !DILocation(line: 34, column: 17, scope: !42)
!54 = !DILocation(line: 36, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !10, line: 35, column: 13)
!56 = !DILocation(line: 36, column: 17, scope: !55)
!57 = !DILocation(line: 36, column: 30, scope: !55)
!58 = !DILocation(line: 38, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !10, line: 38, column: 17)
!60 = !DILocation(line: 38, column: 21, scope: !59)
!61 = !DILocation(line: 38, column: 28, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !10, line: 38, column: 17)
!63 = !DILocation(line: 38, column: 30, scope: !62)
!64 = !DILocation(line: 38, column: 17, scope: !59)
!65 = !DILocation(line: 40, column: 41, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !10, line: 39, column: 17)
!67 = !DILocation(line: 40, column: 34, scope: !66)
!68 = !DILocation(line: 40, column: 21, scope: !66)
!69 = !DILocation(line: 41, column: 17, scope: !66)
!70 = !DILocation(line: 38, column: 37, scope: !62)
!71 = !DILocation(line: 38, column: 17, scope: !62)
!72 = distinct !{!72, !64, !73, !74}
!73 = !DILocation(line: 41, column: 17, scope: !59)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 42, column: 13, scope: !55)
!76 = !DILocation(line: 45, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !51, file: !10, line: 44, column: 13)
!78 = !DILocation(line: 48, column: 5, scope: !43)
!79 = !DILocation(line: 49, column: 1, scope: !33)
!80 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_21_good", scope: !10, file: !10, line: 189, type: !23, scopeLine: 190, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 191, column: 5, scope: !80)
!82 = !DILocation(line: 192, column: 5, scope: !80)
!83 = !DILocation(line: 193, column: 5, scope: !80)
!84 = !DILocation(line: 194, column: 1, scope: !80)
!85 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 205, type: !86, scopeLine: 206, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!11, !11, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !10, line: 205, type: !11)
!92 = !DILocation(line: 205, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !10, line: 205, type: !88)
!94 = !DILocation(line: 205, column: 27, scope: !85)
!95 = !DILocation(line: 208, column: 22, scope: !85)
!96 = !DILocation(line: 208, column: 12, scope: !85)
!97 = !DILocation(line: 208, column: 5, scope: !85)
!98 = !DILocation(line: 210, column: 5, scope: !85)
!99 = !DILocation(line: 211, column: 5, scope: !85)
!100 = !DILocation(line: 212, column: 5, scope: !85)
!101 = !DILocation(line: 215, column: 5, scope: !85)
!102 = !DILocation(line: 216, column: 5, scope: !85)
!103 = !DILocation(line: 217, column: 5, scope: !85)
!104 = !DILocation(line: 219, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 102, type: !23, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !10, line: 104, type: !11)
!107 = !DILocation(line: 104, column: 9, scope: !105)
!108 = !DILocation(line: 106, column: 10, scope: !105)
!109 = !DILocation(line: 108, column: 10, scope: !105)
!110 = !DILocation(line: 109, column: 20, scope: !105)
!111 = !DILocation(line: 110, column: 18, scope: !105)
!112 = !DILocation(line: 110, column: 5, scope: !105)
!113 = !DILocation(line: 111, column: 1, scope: !105)
!114 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !10, file: !10, line: 72, type: !34, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", arg: 1, scope: !114, file: !10, line: 72, type: !11)
!116 = !DILocation(line: 72, column: 30, scope: !114)
!117 = !DILocation(line: 74, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !10, line: 74, column: 8)
!119 = !DILocation(line: 74, column: 8, scope: !114)
!120 = !DILocation(line: 77, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !10, line: 75, column: 5)
!122 = !DILocation(line: 78, column: 5, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !10, line: 82, type: !11)
!124 = distinct !DILexicalBlock(scope: !125, file: !10, line: 81, column: 9)
!125 = distinct !DILexicalBlock(scope: !118, file: !10, line: 80, column: 5)
!126 = !DILocation(line: 82, column: 17, scope: !124)
!127 = !DILocalVariable(name: "buffer", scope: !124, file: !10, line: 83, type: !46)
!128 = !DILocation(line: 83, column: 17, scope: !124)
!129 = !DILocation(line: 85, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !10, line: 85, column: 17)
!131 = !DILocation(line: 85, column: 22, scope: !130)
!132 = !DILocation(line: 85, column: 27, scope: !130)
!133 = !DILocation(line: 85, column: 30, scope: !130)
!134 = !DILocation(line: 85, column: 35, scope: !130)
!135 = !DILocation(line: 85, column: 17, scope: !124)
!136 = !DILocation(line: 87, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !10, line: 86, column: 13)
!138 = !DILocation(line: 87, column: 17, scope: !137)
!139 = !DILocation(line: 87, column: 30, scope: !137)
!140 = !DILocation(line: 89, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !10, line: 89, column: 17)
!142 = !DILocation(line: 89, column: 21, scope: !141)
!143 = !DILocation(line: 89, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !10, line: 89, column: 17)
!145 = !DILocation(line: 89, column: 30, scope: !144)
!146 = !DILocation(line: 89, column: 17, scope: !141)
!147 = !DILocation(line: 91, column: 41, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !10, line: 90, column: 17)
!149 = !DILocation(line: 91, column: 34, scope: !148)
!150 = !DILocation(line: 91, column: 21, scope: !148)
!151 = !DILocation(line: 92, column: 17, scope: !148)
!152 = !DILocation(line: 89, column: 37, scope: !144)
!153 = !DILocation(line: 89, column: 17, scope: !144)
!154 = distinct !{!154, !146, !155, !74}
!155 = !DILocation(line: 92, column: 17, scope: !141)
!156 = !DILocation(line: 93, column: 13, scope: !137)
!157 = !DILocation(line: 96, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !130, file: !10, line: 95, column: 13)
!159 = !DILocation(line: 100, column: 1, scope: !114)
!160 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 139, type: !23, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!161 = !DILocalVariable(name: "data", scope: !160, file: !10, line: 141, type: !11)
!162 = !DILocation(line: 141, column: 9, scope: !160)
!163 = !DILocation(line: 143, column: 10, scope: !160)
!164 = !DILocation(line: 145, column: 10, scope: !160)
!165 = !DILocation(line: 146, column: 20, scope: !160)
!166 = !DILocation(line: 147, column: 18, scope: !160)
!167 = !DILocation(line: 147, column: 5, scope: !160)
!168 = !DILocation(line: 148, column: 1, scope: !160)
!169 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !10, file: !10, line: 114, type: !34, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!170 = !DILocalVariable(name: "data", arg: 1, scope: !169, file: !10, line: 114, type: !11)
!171 = !DILocation(line: 114, column: 30, scope: !169)
!172 = !DILocation(line: 116, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !10, line: 116, column: 8)
!174 = !DILocation(line: 116, column: 8, scope: !169)
!175 = !DILocalVariable(name: "i", scope: !176, file: !10, line: 119, type: !11)
!176 = distinct !DILexicalBlock(scope: !177, file: !10, line: 118, column: 9)
!177 = distinct !DILexicalBlock(scope: !173, file: !10, line: 117, column: 5)
!178 = !DILocation(line: 119, column: 17, scope: !176)
!179 = !DILocalVariable(name: "buffer", scope: !176, file: !10, line: 120, type: !46)
!180 = !DILocation(line: 120, column: 17, scope: !176)
!181 = !DILocation(line: 122, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !176, file: !10, line: 122, column: 17)
!183 = !DILocation(line: 122, column: 22, scope: !182)
!184 = !DILocation(line: 122, column: 27, scope: !182)
!185 = !DILocation(line: 122, column: 30, scope: !182)
!186 = !DILocation(line: 122, column: 35, scope: !182)
!187 = !DILocation(line: 122, column: 17, scope: !176)
!188 = !DILocation(line: 124, column: 24, scope: !189)
!189 = distinct !DILexicalBlock(scope: !182, file: !10, line: 123, column: 13)
!190 = !DILocation(line: 124, column: 17, scope: !189)
!191 = !DILocation(line: 124, column: 30, scope: !189)
!192 = !DILocation(line: 126, column: 23, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !10, line: 126, column: 17)
!194 = !DILocation(line: 126, column: 21, scope: !193)
!195 = !DILocation(line: 126, column: 28, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !10, line: 126, column: 17)
!197 = !DILocation(line: 126, column: 30, scope: !196)
!198 = !DILocation(line: 126, column: 17, scope: !193)
!199 = !DILocation(line: 128, column: 41, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !10, line: 127, column: 17)
!201 = !DILocation(line: 128, column: 34, scope: !200)
!202 = !DILocation(line: 128, column: 21, scope: !200)
!203 = !DILocation(line: 129, column: 17, scope: !200)
!204 = !DILocation(line: 126, column: 37, scope: !196)
!205 = !DILocation(line: 126, column: 17, scope: !196)
!206 = distinct !{!206, !198, !207, !74}
!207 = !DILocation(line: 129, column: 17, scope: !193)
!208 = !DILocation(line: 130, column: 13, scope: !189)
!209 = !DILocation(line: 133, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !182, file: !10, line: 132, column: 13)
!211 = !DILocation(line: 136, column: 5, scope: !177)
!212 = !DILocation(line: 137, column: 1, scope: !169)
!213 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 177, type: !23, scopeLine: 178, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!214 = !DILocalVariable(name: "data", scope: !213, file: !10, line: 179, type: !11)
!215 = !DILocation(line: 179, column: 9, scope: !213)
!216 = !DILocation(line: 181, column: 10, scope: !213)
!217 = !DILocation(line: 184, column: 10, scope: !213)
!218 = !DILocation(line: 185, column: 19, scope: !213)
!219 = !DILocation(line: 186, column: 17, scope: !213)
!220 = !DILocation(line: 186, column: 5, scope: !213)
!221 = !DILocation(line: 187, column: 1, scope: !213)
!222 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 151, type: !34, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!223 = !DILocalVariable(name: "data", arg: 1, scope: !222, file: !10, line: 151, type: !11)
!224 = !DILocation(line: 151, column: 29, scope: !222)
!225 = !DILocation(line: 153, column: 8, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !10, line: 153, column: 8)
!227 = !DILocation(line: 153, column: 8, scope: !222)
!228 = !DILocalVariable(name: "i", scope: !229, file: !10, line: 156, type: !11)
!229 = distinct !DILexicalBlock(scope: !230, file: !10, line: 155, column: 9)
!230 = distinct !DILexicalBlock(scope: !226, file: !10, line: 154, column: 5)
!231 = !DILocation(line: 156, column: 17, scope: !229)
!232 = !DILocalVariable(name: "buffer", scope: !229, file: !10, line: 157, type: !46)
!233 = !DILocation(line: 157, column: 17, scope: !229)
!234 = !DILocation(line: 160, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !229, file: !10, line: 160, column: 17)
!236 = !DILocation(line: 160, column: 22, scope: !235)
!237 = !DILocation(line: 160, column: 17, scope: !229)
!238 = !DILocation(line: 162, column: 24, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !10, line: 161, column: 13)
!240 = !DILocation(line: 162, column: 17, scope: !239)
!241 = !DILocation(line: 162, column: 30, scope: !239)
!242 = !DILocation(line: 164, column: 23, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !10, line: 164, column: 17)
!244 = !DILocation(line: 164, column: 21, scope: !243)
!245 = !DILocation(line: 164, column: 28, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !10, line: 164, column: 17)
!247 = !DILocation(line: 164, column: 30, scope: !246)
!248 = !DILocation(line: 164, column: 17, scope: !243)
!249 = !DILocation(line: 166, column: 41, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !10, line: 165, column: 17)
!251 = !DILocation(line: 166, column: 34, scope: !250)
!252 = !DILocation(line: 166, column: 21, scope: !250)
!253 = !DILocation(line: 167, column: 17, scope: !250)
!254 = !DILocation(line: 164, column: 37, scope: !246)
!255 = !DILocation(line: 164, column: 17, scope: !246)
!256 = distinct !{!256, !248, !257, !74}
!257 = !DILocation(line: 167, column: 17, scope: !243)
!258 = !DILocation(line: 168, column: 13, scope: !239)
!259 = !DILocation(line: 171, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !235, file: !10, line: 170, column: 13)
!261 = !DILocation(line: 174, column: 5, scope: !230)
!262 = !DILocation(line: 175, column: 1, scope: !222)
