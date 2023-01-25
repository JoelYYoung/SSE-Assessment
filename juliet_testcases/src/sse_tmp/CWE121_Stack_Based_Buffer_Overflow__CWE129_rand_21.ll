; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !9
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !12
@goodG2BStatic = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 -1, i32* %data, align 4, !dbg !27
  %call = call i32 @rand() #5, !dbg !28
  %and = and i32 %call, 1, !dbg !28
  %tobool = icmp ne i32 %and, 0, !dbg !28
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !28

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !28
  %shl = shl i32 %call1, 30, !dbg !28
  %call2 = call i32 @rand() #5, !dbg !28
  %shl3 = shl i32 %call2, 15, !dbg !28
  %xor = xor i32 %shl, %shl3, !dbg !28
  %call4 = call i32 @rand() #5, !dbg !28
  %xor5 = xor i32 %xor, %call4, !dbg !28
  br label %cond.end, !dbg !28

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !28
  %shl7 = shl i32 %call6, 30, !dbg !28
  %call8 = call i32 @rand() #5, !dbg !28
  %shl9 = shl i32 %call8, 15, !dbg !28
  %xor10 = xor i32 %shl7, %shl9, !dbg !28
  %call11 = call i32 @rand() #5, !dbg !28
  %xor12 = xor i32 %xor10, %call11, !dbg !28
  %sub = sub i32 0, %xor12, !dbg !28
  %sub13 = sub i32 %sub, 1, !dbg !28
  br label %cond.end, !dbg !28

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !28
  store i32 %cond, i32* %data, align 4, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32, i32* %data, align 4, !dbg !31
  call void @badSink(i32 %0), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @badStatic, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end5, !dbg !41

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !42, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !46, metadata !DIExpression()), !dbg !50
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !50
  %2 = load i32, i32* %data.addr, align 4, !dbg !51
  %cmp = icmp sge i32 %2, 0, !dbg !53
  br i1 %cmp, label %if.then1, label %if.else, !dbg !54

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !55
  %idxprom = sext i32 %3 to i64, !dbg !57
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !57
  store i32 1, i32* %arrayidx, align 4, !dbg !58
  store i32 0, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !62
  %cmp2 = icmp slt i32 %4, 10, !dbg !64
  br i1 %cmp2, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !66
  %idxprom3 = sext i32 %5 to i64, !dbg !68
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !68
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !68
  call void @printIntLine(i32 %6), !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !71
  %inc = add nsw i32 %7, 1, !dbg !71
  store i32 %inc, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !76

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !79

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21_good() #0 !dbg !81 {
entry:
  call void @goodB2G1(), !dbg !82
  call void @goodB2G2(), !dbg !83
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #5, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #5, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
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
define internal void @goodB2G1() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %data, align 4, !dbg !109
  %call = call i32 @rand() #5, !dbg !110
  %and = and i32 %call, 1, !dbg !110
  %tobool = icmp ne i32 %and, 0, !dbg !110
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !110

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !110
  %shl = shl i32 %call1, 30, !dbg !110
  %call2 = call i32 @rand() #5, !dbg !110
  %shl3 = shl i32 %call2, 15, !dbg !110
  %xor = xor i32 %shl, %shl3, !dbg !110
  %call4 = call i32 @rand() #5, !dbg !110
  %xor5 = xor i32 %xor, %call4, !dbg !110
  br label %cond.end, !dbg !110

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !110
  %shl7 = shl i32 %call6, 30, !dbg !110
  %call8 = call i32 @rand() #5, !dbg !110
  %shl9 = shl i32 %call8, 15, !dbg !110
  %xor10 = xor i32 %shl7, %shl9, !dbg !110
  %call11 = call i32 @rand() #5, !dbg !110
  %xor12 = xor i32 %xor10, %call11, !dbg !110
  %sub = sub i32 0, %xor12, !dbg !110
  %sub13 = sub i32 %sub, 1, !dbg !110
  br label %cond.end, !dbg !110

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !110
  store i32 %cond, i32* %data, align 4, !dbg !111
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !112
  %0 = load i32, i32* %data, align 4, !dbg !113
  call void @goodB2G1Sink(i32 %0), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !116 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !119
  %tobool = icmp ne i32 %0, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !122
  br label %if.end7, !dbg !124

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !129, metadata !DIExpression()), !dbg !130
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !130
  %2 = load i32, i32* %data.addr, align 4, !dbg !131
  %cmp = icmp sge i32 %2, 0, !dbg !133
  br i1 %cmp, label %land.lhs.true, label %if.else6, !dbg !134

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !135
  %cmp1 = icmp slt i32 %3, 10, !dbg !136
  br i1 %cmp1, label %if.then2, label %if.else6, !dbg !137

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !138
  %idxprom = sext i32 %4 to i64, !dbg !140
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !140
  store i32 1, i32* %arrayidx, align 4, !dbg !141
  store i32 0, i32* %i, align 4, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !145
  %cmp3 = icmp slt i32 %5, 10, !dbg !147
  br i1 %cmp3, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !149
  %idxprom4 = sext i32 %6 to i64, !dbg !151
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !151
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !151
  call void @printIntLine(i32 %7), !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !154
  %inc = add nsw i32 %8, 1, !dbg !154
  store i32 %inc, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !158

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !159
  br label %if.end

if.end:                                           ; preds = %if.else6, %for.end
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !162 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !163, metadata !DIExpression()), !dbg !164
  store i32 -1, i32* %data, align 4, !dbg !165
  %call = call i32 @rand() #5, !dbg !166
  %and = and i32 %call, 1, !dbg !166
  %tobool = icmp ne i32 %and, 0, !dbg !166
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !166

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !166
  %shl = shl i32 %call1, 30, !dbg !166
  %call2 = call i32 @rand() #5, !dbg !166
  %shl3 = shl i32 %call2, 15, !dbg !166
  %xor = xor i32 %shl, %shl3, !dbg !166
  %call4 = call i32 @rand() #5, !dbg !166
  %xor5 = xor i32 %xor, %call4, !dbg !166
  br label %cond.end, !dbg !166

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !166
  %shl7 = shl i32 %call6, 30, !dbg !166
  %call8 = call i32 @rand() #5, !dbg !166
  %shl9 = shl i32 %call8, 15, !dbg !166
  %xor10 = xor i32 %shl7, %shl9, !dbg !166
  %call11 = call i32 @rand() #5, !dbg !166
  %xor12 = xor i32 %xor10, %call11, !dbg !166
  %sub = sub i32 0, %xor12, !dbg !166
  %sub13 = sub i32 %sub, 1, !dbg !166
  br label %cond.end, !dbg !166

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !166
  store i32 %cond, i32* %data, align 4, !dbg !167
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !168
  %0 = load i32, i32* %data, align 4, !dbg !169
  call void @goodB2G2Sink(i32 %0), !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !172 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !173, metadata !DIExpression()), !dbg !174
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !175
  %tobool = icmp ne i32 %0, 0, !dbg !175
  br i1 %tobool, label %if.then, label %if.end6, !dbg !177

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !178, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !182, metadata !DIExpression()), !dbg !183
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !183
  %2 = load i32, i32* %data.addr, align 4, !dbg !184
  %cmp = icmp sge i32 %2, 0, !dbg !186
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !187

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !188
  %cmp1 = icmp slt i32 %3, 10, !dbg !189
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !190

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !191
  %idxprom = sext i32 %4 to i64, !dbg !193
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !193
  store i32 1, i32* %arrayidx, align 4, !dbg !194
  store i32 0, i32* %i, align 4, !dbg !195
  br label %for.cond, !dbg !197

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !198
  %cmp3 = icmp slt i32 %5, 10, !dbg !200
  br i1 %cmp3, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !202
  %idxprom4 = sext i32 %6 to i64, !dbg !204
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !204
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !204
  call void @printIntLine(i32 %7), !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !207
  %inc = add nsw i32 %8, 1, !dbg !207
  store i32 %inc, i32* %i, align 4, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !211

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !212
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end6, !dbg !214

if.end6:                                          ; preds = %if.end, %entry
  ret void, !dbg !215
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !216 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !217, metadata !DIExpression()), !dbg !218
  store i32 -1, i32* %data, align 4, !dbg !219
  store i32 7, i32* %data, align 4, !dbg !220
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !221
  %0 = load i32, i32* %data, align 4, !dbg !222
  call void @goodG2BSink(i32 %0), !dbg !223
  ret void, !dbg !224
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !225 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !226, metadata !DIExpression()), !dbg !227
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !228
  %tobool = icmp ne i32 %0, 0, !dbg !228
  br i1 %tobool, label %if.then, label %if.end5, !dbg !230

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !231, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !235, metadata !DIExpression()), !dbg !236
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !236
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !236
  %2 = load i32, i32* %data.addr, align 4, !dbg !237
  %cmp = icmp sge i32 %2, 0, !dbg !239
  br i1 %cmp, label %if.then1, label %if.else, !dbg !240

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !241
  %idxprom = sext i32 %3 to i64, !dbg !243
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !243
  store i32 1, i32* %arrayidx, align 4, !dbg !244
  store i32 0, i32* %i, align 4, !dbg !245
  br label %for.cond, !dbg !247

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !248
  %cmp2 = icmp slt i32 %4, 10, !dbg !250
  br i1 %cmp2, label %for.body, label %for.end, !dbg !251

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !252
  %idxprom3 = sext i32 %5 to i64, !dbg !254
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !254
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !254
  call void @printIntLine(i32 %6), !dbg !255
  br label %for.inc, !dbg !256

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !257
  %inc = add nsw i32 %7, 1, !dbg !257
  store i32 %inc, i32* %i, align 4, !dbg !257
  br label %for.cond, !dbg !258, !llvm.loop !259

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !261

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !262
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !264

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !265
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
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !11, line: 23, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !12, !14}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !11, line: 67, type: !6, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !11, line: 68, type: !6, isLocal: true, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !11, line: 69, type: !6, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21_bad", scope: !11, file: !11, line: 51, type: !23, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !11, line: 53, type: !6)
!26 = !DILocation(line: 53, column: 9, scope: !22)
!27 = !DILocation(line: 55, column: 10, scope: !22)
!28 = !DILocation(line: 57, column: 12, scope: !22)
!29 = !DILocation(line: 57, column: 10, scope: !22)
!30 = !DILocation(line: 58, column: 15, scope: !22)
!31 = !DILocation(line: 59, column: 13, scope: !22)
!32 = !DILocation(line: 59, column: 5, scope: !22)
!33 = !DILocation(line: 60, column: 1, scope: !22)
!34 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 25, type: !35, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !6}
!37 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !11, line: 25, type: !6)
!38 = !DILocation(line: 25, column: 25, scope: !34)
!39 = !DILocation(line: 27, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !11, line: 27, column: 8)
!41 = !DILocation(line: 27, column: 8, scope: !34)
!42 = !DILocalVariable(name: "i", scope: !43, file: !11, line: 30, type: !6)
!43 = distinct !DILexicalBlock(scope: !44, file: !11, line: 29, column: 9)
!44 = distinct !DILexicalBlock(scope: !40, file: !11, line: 28, column: 5)
!45 = !DILocation(line: 30, column: 17, scope: !43)
!46 = !DILocalVariable(name: "buffer", scope: !43, file: !11, line: 31, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 10)
!50 = !DILocation(line: 31, column: 17, scope: !43)
!51 = !DILocation(line: 34, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !11, line: 34, column: 17)
!53 = !DILocation(line: 34, column: 22, scope: !52)
!54 = !DILocation(line: 34, column: 17, scope: !43)
!55 = !DILocation(line: 36, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !11, line: 35, column: 13)
!57 = !DILocation(line: 36, column: 17, scope: !56)
!58 = !DILocation(line: 36, column: 30, scope: !56)
!59 = !DILocation(line: 38, column: 23, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !11, line: 38, column: 17)
!61 = !DILocation(line: 38, column: 21, scope: !60)
!62 = !DILocation(line: 38, column: 28, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !11, line: 38, column: 17)
!64 = !DILocation(line: 38, column: 30, scope: !63)
!65 = !DILocation(line: 38, column: 17, scope: !60)
!66 = !DILocation(line: 40, column: 41, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !11, line: 39, column: 17)
!68 = !DILocation(line: 40, column: 34, scope: !67)
!69 = !DILocation(line: 40, column: 21, scope: !67)
!70 = !DILocation(line: 41, column: 17, scope: !67)
!71 = !DILocation(line: 38, column: 37, scope: !63)
!72 = !DILocation(line: 38, column: 17, scope: !63)
!73 = distinct !{!73, !65, !74, !75}
!74 = !DILocation(line: 41, column: 17, scope: !60)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 42, column: 13, scope: !56)
!77 = !DILocation(line: 45, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !52, file: !11, line: 44, column: 13)
!79 = !DILocation(line: 48, column: 5, scope: !44)
!80 = !DILocation(line: 49, column: 1, scope: !34)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_21_good", scope: !11, file: !11, line: 189, type: !23, scopeLine: 190, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 191, column: 5, scope: !81)
!83 = !DILocation(line: 192, column: 5, scope: !81)
!84 = !DILocation(line: 193, column: 5, scope: !81)
!85 = !DILocation(line: 194, column: 1, scope: !81)
!86 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 205, type: !87, scopeLine: 206, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DISubroutineType(types: !88)
!88 = !{!6, !6, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !11, line: 205, type: !6)
!93 = !DILocation(line: 205, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !11, line: 205, type: !89)
!95 = !DILocation(line: 205, column: 27, scope: !86)
!96 = !DILocation(line: 208, column: 22, scope: !86)
!97 = !DILocation(line: 208, column: 12, scope: !86)
!98 = !DILocation(line: 208, column: 5, scope: !86)
!99 = !DILocation(line: 210, column: 5, scope: !86)
!100 = !DILocation(line: 211, column: 5, scope: !86)
!101 = !DILocation(line: 212, column: 5, scope: !86)
!102 = !DILocation(line: 215, column: 5, scope: !86)
!103 = !DILocation(line: 216, column: 5, scope: !86)
!104 = !DILocation(line: 217, column: 5, scope: !86)
!105 = !DILocation(line: 219, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 102, type: !23, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !11, line: 104, type: !6)
!108 = !DILocation(line: 104, column: 9, scope: !106)
!109 = !DILocation(line: 106, column: 10, scope: !106)
!110 = !DILocation(line: 108, column: 12, scope: !106)
!111 = !DILocation(line: 108, column: 10, scope: !106)
!112 = !DILocation(line: 109, column: 20, scope: !106)
!113 = !DILocation(line: 110, column: 18, scope: !106)
!114 = !DILocation(line: 110, column: 5, scope: !106)
!115 = !DILocation(line: 111, column: 1, scope: !106)
!116 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !11, file: !11, line: 72, type: !35, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", arg: 1, scope: !116, file: !11, line: 72, type: !6)
!118 = !DILocation(line: 72, column: 30, scope: !116)
!119 = !DILocation(line: 74, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !11, line: 74, column: 8)
!121 = !DILocation(line: 74, column: 8, scope: !116)
!122 = !DILocation(line: 77, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !11, line: 75, column: 5)
!124 = !DILocation(line: 78, column: 5, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !126, file: !11, line: 82, type: !6)
!126 = distinct !DILexicalBlock(scope: !127, file: !11, line: 81, column: 9)
!127 = distinct !DILexicalBlock(scope: !120, file: !11, line: 80, column: 5)
!128 = !DILocation(line: 82, column: 17, scope: !126)
!129 = !DILocalVariable(name: "buffer", scope: !126, file: !11, line: 83, type: !47)
!130 = !DILocation(line: 83, column: 17, scope: !126)
!131 = !DILocation(line: 85, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !11, line: 85, column: 17)
!133 = !DILocation(line: 85, column: 22, scope: !132)
!134 = !DILocation(line: 85, column: 27, scope: !132)
!135 = !DILocation(line: 85, column: 30, scope: !132)
!136 = !DILocation(line: 85, column: 35, scope: !132)
!137 = !DILocation(line: 85, column: 17, scope: !126)
!138 = !DILocation(line: 87, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !132, file: !11, line: 86, column: 13)
!140 = !DILocation(line: 87, column: 17, scope: !139)
!141 = !DILocation(line: 87, column: 30, scope: !139)
!142 = !DILocation(line: 89, column: 23, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !11, line: 89, column: 17)
!144 = !DILocation(line: 89, column: 21, scope: !143)
!145 = !DILocation(line: 89, column: 28, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !11, line: 89, column: 17)
!147 = !DILocation(line: 89, column: 30, scope: !146)
!148 = !DILocation(line: 89, column: 17, scope: !143)
!149 = !DILocation(line: 91, column: 41, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !11, line: 90, column: 17)
!151 = !DILocation(line: 91, column: 34, scope: !150)
!152 = !DILocation(line: 91, column: 21, scope: !150)
!153 = !DILocation(line: 92, column: 17, scope: !150)
!154 = !DILocation(line: 89, column: 37, scope: !146)
!155 = !DILocation(line: 89, column: 17, scope: !146)
!156 = distinct !{!156, !148, !157, !75}
!157 = !DILocation(line: 92, column: 17, scope: !143)
!158 = !DILocation(line: 93, column: 13, scope: !139)
!159 = !DILocation(line: 96, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !132, file: !11, line: 95, column: 13)
!161 = !DILocation(line: 100, column: 1, scope: !116)
!162 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 139, type: !23, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DILocalVariable(name: "data", scope: !162, file: !11, line: 141, type: !6)
!164 = !DILocation(line: 141, column: 9, scope: !162)
!165 = !DILocation(line: 143, column: 10, scope: !162)
!166 = !DILocation(line: 145, column: 12, scope: !162)
!167 = !DILocation(line: 145, column: 10, scope: !162)
!168 = !DILocation(line: 146, column: 20, scope: !162)
!169 = !DILocation(line: 147, column: 18, scope: !162)
!170 = !DILocation(line: 147, column: 5, scope: !162)
!171 = !DILocation(line: 148, column: 1, scope: !162)
!172 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !11, file: !11, line: 114, type: !35, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!173 = !DILocalVariable(name: "data", arg: 1, scope: !172, file: !11, line: 114, type: !6)
!174 = !DILocation(line: 114, column: 30, scope: !172)
!175 = !DILocation(line: 116, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !11, line: 116, column: 8)
!177 = !DILocation(line: 116, column: 8, scope: !172)
!178 = !DILocalVariable(name: "i", scope: !179, file: !11, line: 119, type: !6)
!179 = distinct !DILexicalBlock(scope: !180, file: !11, line: 118, column: 9)
!180 = distinct !DILexicalBlock(scope: !176, file: !11, line: 117, column: 5)
!181 = !DILocation(line: 119, column: 17, scope: !179)
!182 = !DILocalVariable(name: "buffer", scope: !179, file: !11, line: 120, type: !47)
!183 = !DILocation(line: 120, column: 17, scope: !179)
!184 = !DILocation(line: 122, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !179, file: !11, line: 122, column: 17)
!186 = !DILocation(line: 122, column: 22, scope: !185)
!187 = !DILocation(line: 122, column: 27, scope: !185)
!188 = !DILocation(line: 122, column: 30, scope: !185)
!189 = !DILocation(line: 122, column: 35, scope: !185)
!190 = !DILocation(line: 122, column: 17, scope: !179)
!191 = !DILocation(line: 124, column: 24, scope: !192)
!192 = distinct !DILexicalBlock(scope: !185, file: !11, line: 123, column: 13)
!193 = !DILocation(line: 124, column: 17, scope: !192)
!194 = !DILocation(line: 124, column: 30, scope: !192)
!195 = !DILocation(line: 126, column: 23, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !11, line: 126, column: 17)
!197 = !DILocation(line: 126, column: 21, scope: !196)
!198 = !DILocation(line: 126, column: 28, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !11, line: 126, column: 17)
!200 = !DILocation(line: 126, column: 30, scope: !199)
!201 = !DILocation(line: 126, column: 17, scope: !196)
!202 = !DILocation(line: 128, column: 41, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !11, line: 127, column: 17)
!204 = !DILocation(line: 128, column: 34, scope: !203)
!205 = !DILocation(line: 128, column: 21, scope: !203)
!206 = !DILocation(line: 129, column: 17, scope: !203)
!207 = !DILocation(line: 126, column: 37, scope: !199)
!208 = !DILocation(line: 126, column: 17, scope: !199)
!209 = distinct !{!209, !201, !210, !75}
!210 = !DILocation(line: 129, column: 17, scope: !196)
!211 = !DILocation(line: 130, column: 13, scope: !192)
!212 = !DILocation(line: 133, column: 17, scope: !213)
!213 = distinct !DILexicalBlock(scope: !185, file: !11, line: 132, column: 13)
!214 = !DILocation(line: 136, column: 5, scope: !180)
!215 = !DILocation(line: 137, column: 1, scope: !172)
!216 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 177, type: !23, scopeLine: 178, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!217 = !DILocalVariable(name: "data", scope: !216, file: !11, line: 179, type: !6)
!218 = !DILocation(line: 179, column: 9, scope: !216)
!219 = !DILocation(line: 181, column: 10, scope: !216)
!220 = !DILocation(line: 184, column: 10, scope: !216)
!221 = !DILocation(line: 185, column: 19, scope: !216)
!222 = !DILocation(line: 186, column: 17, scope: !216)
!223 = !DILocation(line: 186, column: 5, scope: !216)
!224 = !DILocation(line: 187, column: 1, scope: !216)
!225 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 151, type: !35, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!226 = !DILocalVariable(name: "data", arg: 1, scope: !225, file: !11, line: 151, type: !6)
!227 = !DILocation(line: 151, column: 29, scope: !225)
!228 = !DILocation(line: 153, column: 8, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !11, line: 153, column: 8)
!230 = !DILocation(line: 153, column: 8, scope: !225)
!231 = !DILocalVariable(name: "i", scope: !232, file: !11, line: 156, type: !6)
!232 = distinct !DILexicalBlock(scope: !233, file: !11, line: 155, column: 9)
!233 = distinct !DILexicalBlock(scope: !229, file: !11, line: 154, column: 5)
!234 = !DILocation(line: 156, column: 17, scope: !232)
!235 = !DILocalVariable(name: "buffer", scope: !232, file: !11, line: 157, type: !47)
!236 = !DILocation(line: 157, column: 17, scope: !232)
!237 = !DILocation(line: 160, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !232, file: !11, line: 160, column: 17)
!239 = !DILocation(line: 160, column: 22, scope: !238)
!240 = !DILocation(line: 160, column: 17, scope: !232)
!241 = !DILocation(line: 162, column: 24, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !11, line: 161, column: 13)
!243 = !DILocation(line: 162, column: 17, scope: !242)
!244 = !DILocation(line: 162, column: 30, scope: !242)
!245 = !DILocation(line: 164, column: 23, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !11, line: 164, column: 17)
!247 = !DILocation(line: 164, column: 21, scope: !246)
!248 = !DILocation(line: 164, column: 28, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !11, line: 164, column: 17)
!250 = !DILocation(line: 164, column: 30, scope: !249)
!251 = !DILocation(line: 164, column: 17, scope: !246)
!252 = !DILocation(line: 166, column: 41, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !11, line: 165, column: 17)
!254 = !DILocation(line: 166, column: 34, scope: !253)
!255 = !DILocation(line: 166, column: 21, scope: !253)
!256 = !DILocation(line: 167, column: 17, scope: !253)
!257 = !DILocation(line: 164, column: 37, scope: !249)
!258 = !DILocation(line: 164, column: 17, scope: !249)
!259 = distinct !{!259, !251, !260, !75}
!260 = !DILocation(line: 167, column: 17, scope: !246)
!261 = !DILocation(line: 168, column: 13, scope: !242)
!262 = !DILocation(line: 171, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !238, file: !11, line: 170, column: 13)
!264 = !DILocation(line: 174, column: 5, scope: !233)
!265 = !DILocation(line: 175, column: 1, scope: !225)
