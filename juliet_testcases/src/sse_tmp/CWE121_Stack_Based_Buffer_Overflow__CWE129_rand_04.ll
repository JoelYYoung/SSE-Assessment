; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
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
  store i32 %cond, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !32
  %1 = load i32, i32* %data, align 4, !dbg !33
  %cmp = icmp sge i32 %1, 0, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !37
  %idxprom = sext i32 %2 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !39
  store i32 1, i32* %arrayidx, align 4, !dbg !40
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !44
  %cmp14 = icmp slt i32 %3, 10, !dbg !46
  br i1 %cmp14, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !48
  %idxprom15 = sext i32 %4 to i64, !dbg !50
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom15, !dbg !50
  %5 = load i32, i32* %arrayidx16, align 4, !dbg !50
  call void @printIntLine(i32 %5), !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %6, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !58

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !61
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04_good() #0 !dbg !62 {
entry:
  call void @goodB2G1(), !dbg !63
  call void @goodB2G2(), !dbg !64
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !88 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  %call = call i32 @rand() #5, !dbg !92
  %and = and i32 %call, 1, !dbg !92
  %tobool = icmp ne i32 %and, 0, !dbg !92
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !92

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !92
  %shl = shl i32 %call1, 30, !dbg !92
  %call2 = call i32 @rand() #5, !dbg !92
  %shl3 = shl i32 %call2, 15, !dbg !92
  %xor = xor i32 %shl, %shl3, !dbg !92
  %call4 = call i32 @rand() #5, !dbg !92
  %xor5 = xor i32 %xor, %call4, !dbg !92
  br label %cond.end, !dbg !92

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !92
  %shl7 = shl i32 %call6, 30, !dbg !92
  %call8 = call i32 @rand() #5, !dbg !92
  %shl9 = shl i32 %call8, 15, !dbg !92
  %xor10 = xor i32 %shl7, %shl9, !dbg !92
  %call11 = call i32 @rand() #5, !dbg !92
  %xor12 = xor i32 %xor10, %call11, !dbg !92
  %sub = sub i32 0, %xor12, !dbg !92
  %sub13 = sub i32 %sub, 1, !dbg !92
  br label %cond.end, !dbg !92

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !92
  store i32 %cond, i32* %data, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata i32* %i, metadata !96, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !102
  %1 = load i32, i32* %data, align 4, !dbg !103
  %cmp = icmp sge i32 %1, 0, !dbg !105
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !106

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !107
  %cmp14 = icmp slt i32 %2, 10, !dbg !108
  br i1 %cmp14, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !110
  %idxprom = sext i32 %3 to i64, !dbg !112
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !112
  store i32 1, i32* %arrayidx, align 4, !dbg !113
  store i32 0, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !117
  %cmp15 = icmp slt i32 %4, 10, !dbg !119
  br i1 %cmp15, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !121
  %idxprom16 = sext i32 %5 to i64, !dbg !123
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom16, !dbg !123
  %6 = load i32, i32* %arrayidx17, align 4, !dbg !123
  call void @printIntLine(i32 %6), !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !126
  %inc = add nsw i32 %7, 1, !dbg !126
  store i32 %inc, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !130

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !134 {
entry:
  %data = alloca i32, align 4
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
  store i32 %cond, i32* %data, align 4, !dbg !141
  call void @llvm.dbg.declare(metadata i32* %i, metadata !142, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !148
  %1 = load i32, i32* %data, align 4, !dbg !149
  %cmp = icmp sge i32 %1, 0, !dbg !151
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !152

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !153
  %cmp14 = icmp slt i32 %2, 10, !dbg !154
  br i1 %cmp14, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !156
  %idxprom = sext i32 %3 to i64, !dbg !158
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !158
  store i32 1, i32* %arrayidx, align 4, !dbg !159
  store i32 0, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !163
  %cmp15 = icmp slt i32 %4, 10, !dbg !165
  br i1 %cmp15, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !167
  %idxprom16 = sext i32 %5 to i64, !dbg !169
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom16, !dbg !169
  %6 = load i32, i32* %arrayidx17, align 4, !dbg !169
  call void @printIntLine(i32 %6), !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !172
  %inc = add nsw i32 %7, 1, !dbg !172
  store i32 %inc, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !176

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !177
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !180 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !181, metadata !DIExpression()), !dbg !182
  store i32 -1, i32* %data, align 4, !dbg !183
  store i32 7, i32* %data, align 4, !dbg !184
  call void @llvm.dbg.declare(metadata i32* %i, metadata !187, metadata !DIExpression()), !dbg !191
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !192, metadata !DIExpression()), !dbg !193
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !193
  %1 = load i32, i32* %data, align 4, !dbg !194
  %cmp = icmp sge i32 %1, 0, !dbg !196
  br i1 %cmp, label %if.then, label %if.else, !dbg !197

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !198
  %idxprom = sext i32 %2 to i64, !dbg !200
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !200
  store i32 1, i32* %arrayidx, align 4, !dbg !201
  store i32 0, i32* %i, align 4, !dbg !202
  br label %for.cond, !dbg !204

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !205
  %cmp1 = icmp slt i32 %3, 10, !dbg !207
  br i1 %cmp1, label %for.body, label %for.end, !dbg !208

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !209
  %idxprom2 = sext i32 %4 to i64, !dbg !211
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !211
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !211
  call void @printIntLine(i32 %5), !dbg !212
  br label %for.inc, !dbg !213

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !214
  %inc = add nsw i32 %6, 1, !dbg !214
  store i32 %inc, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !215, !llvm.loop !216

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !218

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !219
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !221
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !222 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !223, metadata !DIExpression()), !dbg !224
  store i32 -1, i32* %data, align 4, !dbg !225
  store i32 7, i32* %data, align 4, !dbg !226
  call void @llvm.dbg.declare(metadata i32* %i, metadata !229, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !234, metadata !DIExpression()), !dbg !235
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !235
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !235
  %1 = load i32, i32* %data, align 4, !dbg !236
  %cmp = icmp sge i32 %1, 0, !dbg !238
  br i1 %cmp, label %if.then, label %if.else, !dbg !239

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !240
  %idxprom = sext i32 %2 to i64, !dbg !242
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !242
  store i32 1, i32* %arrayidx, align 4, !dbg !243
  store i32 0, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !246

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !247
  %cmp1 = icmp slt i32 %3, 10, !dbg !249
  br i1 %cmp1, label %for.body, label %for.end, !dbg !250

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !251
  %idxprom2 = sext i32 %4 to i64, !dbg !253
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !253
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !253
  call void @printIntLine(i32 %5), !dbg !254
  br label %for.inc, !dbg !255

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !256
  %inc = add nsw i32 %6, 1, !dbg !256
  store i32 %inc, i32* %i, align 4, !dbg !256
  br label %for.cond, !dbg !257, !llvm.loop !258

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !260

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !261
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !263
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04_bad", scope: !13, file: !13, line: 28, type: !14, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 30, type: !4)
!17 = !DILocation(line: 30, column: 9, scope: !12)
!18 = !DILocation(line: 32, column: 10, scope: !12)
!19 = !DILocation(line: 36, column: 16, scope: !20)
!20 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 5)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 33, column: 8)
!22 = !DILocation(line: 36, column: 14, scope: !20)
!23 = !DILocalVariable(name: "i", scope: !24, file: !13, line: 41, type: !4)
!24 = distinct !DILexicalBlock(scope: !25, file: !13, line: 40, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !13, line: 39, column: 5)
!26 = distinct !DILexicalBlock(scope: !12, file: !13, line: 38, column: 8)
!27 = !DILocation(line: 41, column: 17, scope: !24)
!28 = !DILocalVariable(name: "buffer", scope: !24, file: !13, line: 42, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 42, column: 17, scope: !24)
!33 = !DILocation(line: 45, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !24, file: !13, line: 45, column: 17)
!35 = !DILocation(line: 45, column: 22, scope: !34)
!36 = !DILocation(line: 45, column: 17, scope: !24)
!37 = !DILocation(line: 47, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 46, column: 13)
!39 = !DILocation(line: 47, column: 17, scope: !38)
!40 = !DILocation(line: 47, column: 30, scope: !38)
!41 = !DILocation(line: 49, column: 23, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !13, line: 49, column: 17)
!43 = !DILocation(line: 49, column: 21, scope: !42)
!44 = !DILocation(line: 49, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !13, line: 49, column: 17)
!46 = !DILocation(line: 49, column: 30, scope: !45)
!47 = !DILocation(line: 49, column: 17, scope: !42)
!48 = !DILocation(line: 51, column: 41, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !13, line: 50, column: 17)
!50 = !DILocation(line: 51, column: 34, scope: !49)
!51 = !DILocation(line: 51, column: 21, scope: !49)
!52 = !DILocation(line: 52, column: 17, scope: !49)
!53 = !DILocation(line: 49, column: 37, scope: !45)
!54 = !DILocation(line: 49, column: 17, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 52, column: 17, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 53, column: 13, scope: !38)
!59 = !DILocation(line: 56, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !34, file: !13, line: 55, column: 13)
!61 = !DILocation(line: 60, column: 1, scope: !12)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_04_good", scope: !13, file: !13, line: 216, type: !14, scopeLine: 217, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 218, column: 5, scope: !62)
!64 = !DILocation(line: 219, column: 5, scope: !62)
!65 = !DILocation(line: 220, column: 5, scope: !62)
!66 = !DILocation(line: 221, column: 5, scope: !62)
!67 = !DILocation(line: 222, column: 1, scope: !62)
!68 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 233, type: !69, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!4, !4, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !13, line: 233, type: !4)
!75 = !DILocation(line: 233, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !13, line: 233, type: !71)
!77 = !DILocation(line: 233, column: 27, scope: !68)
!78 = !DILocation(line: 236, column: 22, scope: !68)
!79 = !DILocation(line: 236, column: 12, scope: !68)
!80 = !DILocation(line: 236, column: 5, scope: !68)
!81 = !DILocation(line: 238, column: 5, scope: !68)
!82 = !DILocation(line: 239, column: 5, scope: !68)
!83 = !DILocation(line: 240, column: 5, scope: !68)
!84 = !DILocation(line: 243, column: 5, scope: !68)
!85 = !DILocation(line: 244, column: 5, scope: !68)
!86 = !DILocation(line: 245, column: 5, scope: !68)
!87 = !DILocation(line: 247, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 67, type: !14, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !13, line: 69, type: !4)
!90 = !DILocation(line: 69, column: 9, scope: !88)
!91 = !DILocation(line: 71, column: 10, scope: !88)
!92 = !DILocation(line: 75, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !94, file: !13, line: 73, column: 5)
!94 = distinct !DILexicalBlock(scope: !88, file: !13, line: 72, column: 8)
!95 = !DILocation(line: 75, column: 14, scope: !93)
!96 = !DILocalVariable(name: "i", scope: !97, file: !13, line: 85, type: !4)
!97 = distinct !DILexicalBlock(scope: !98, file: !13, line: 84, column: 9)
!98 = distinct !DILexicalBlock(scope: !99, file: !13, line: 83, column: 5)
!99 = distinct !DILexicalBlock(scope: !88, file: !13, line: 77, column: 8)
!100 = !DILocation(line: 85, column: 17, scope: !97)
!101 = !DILocalVariable(name: "buffer", scope: !97, file: !13, line: 86, type: !29)
!102 = !DILocation(line: 86, column: 17, scope: !97)
!103 = !DILocation(line: 88, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !13, line: 88, column: 17)
!105 = !DILocation(line: 88, column: 22, scope: !104)
!106 = !DILocation(line: 88, column: 27, scope: !104)
!107 = !DILocation(line: 88, column: 30, scope: !104)
!108 = !DILocation(line: 88, column: 35, scope: !104)
!109 = !DILocation(line: 88, column: 17, scope: !97)
!110 = !DILocation(line: 90, column: 24, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !13, line: 89, column: 13)
!112 = !DILocation(line: 90, column: 17, scope: !111)
!113 = !DILocation(line: 90, column: 30, scope: !111)
!114 = !DILocation(line: 92, column: 23, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !13, line: 92, column: 17)
!116 = !DILocation(line: 92, column: 21, scope: !115)
!117 = !DILocation(line: 92, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !13, line: 92, column: 17)
!119 = !DILocation(line: 92, column: 30, scope: !118)
!120 = !DILocation(line: 92, column: 17, scope: !115)
!121 = !DILocation(line: 94, column: 41, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !13, line: 93, column: 17)
!123 = !DILocation(line: 94, column: 34, scope: !122)
!124 = !DILocation(line: 94, column: 21, scope: !122)
!125 = !DILocation(line: 95, column: 17, scope: !122)
!126 = !DILocation(line: 92, column: 37, scope: !118)
!127 = !DILocation(line: 92, column: 17, scope: !118)
!128 = distinct !{!128, !120, !129, !57}
!129 = !DILocation(line: 95, column: 17, scope: !115)
!130 = !DILocation(line: 96, column: 13, scope: !111)
!131 = !DILocation(line: 99, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !104, file: !13, line: 98, column: 13)
!133 = !DILocation(line: 103, column: 1, scope: !88)
!134 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 106, type: !14, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !13, line: 108, type: !4)
!136 = !DILocation(line: 108, column: 9, scope: !134)
!137 = !DILocation(line: 110, column: 10, scope: !134)
!138 = !DILocation(line: 114, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !13, line: 112, column: 5)
!140 = distinct !DILexicalBlock(scope: !134, file: !13, line: 111, column: 8)
!141 = !DILocation(line: 114, column: 14, scope: !139)
!142 = !DILocalVariable(name: "i", scope: !143, file: !13, line: 119, type: !4)
!143 = distinct !DILexicalBlock(scope: !144, file: !13, line: 118, column: 9)
!144 = distinct !DILexicalBlock(scope: !145, file: !13, line: 117, column: 5)
!145 = distinct !DILexicalBlock(scope: !134, file: !13, line: 116, column: 8)
!146 = !DILocation(line: 119, column: 17, scope: !143)
!147 = !DILocalVariable(name: "buffer", scope: !143, file: !13, line: 120, type: !29)
!148 = !DILocation(line: 120, column: 17, scope: !143)
!149 = !DILocation(line: 122, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !13, line: 122, column: 17)
!151 = !DILocation(line: 122, column: 22, scope: !150)
!152 = !DILocation(line: 122, column: 27, scope: !150)
!153 = !DILocation(line: 122, column: 30, scope: !150)
!154 = !DILocation(line: 122, column: 35, scope: !150)
!155 = !DILocation(line: 122, column: 17, scope: !143)
!156 = !DILocation(line: 124, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !150, file: !13, line: 123, column: 13)
!158 = !DILocation(line: 124, column: 17, scope: !157)
!159 = !DILocation(line: 124, column: 30, scope: !157)
!160 = !DILocation(line: 126, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 126, column: 17)
!162 = !DILocation(line: 126, column: 21, scope: !161)
!163 = !DILocation(line: 126, column: 28, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !13, line: 126, column: 17)
!165 = !DILocation(line: 126, column: 30, scope: !164)
!166 = !DILocation(line: 126, column: 17, scope: !161)
!167 = !DILocation(line: 128, column: 41, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !13, line: 127, column: 17)
!169 = !DILocation(line: 128, column: 34, scope: !168)
!170 = !DILocation(line: 128, column: 21, scope: !168)
!171 = !DILocation(line: 129, column: 17, scope: !168)
!172 = !DILocation(line: 126, column: 37, scope: !164)
!173 = !DILocation(line: 126, column: 17, scope: !164)
!174 = distinct !{!174, !166, !175, !57}
!175 = !DILocation(line: 129, column: 17, scope: !161)
!176 = !DILocation(line: 130, column: 13, scope: !157)
!177 = !DILocation(line: 133, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !150, file: !13, line: 132, column: 13)
!179 = !DILocation(line: 137, column: 1, scope: !134)
!180 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 140, type: !14, scopeLine: 141, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!181 = !DILocalVariable(name: "data", scope: !180, file: !13, line: 142, type: !4)
!182 = !DILocation(line: 142, column: 9, scope: !180)
!183 = !DILocation(line: 144, column: 10, scope: !180)
!184 = !DILocation(line: 154, column: 14, scope: !185)
!185 = distinct !DILexicalBlock(scope: !186, file: !13, line: 151, column: 5)
!186 = distinct !DILexicalBlock(scope: !180, file: !13, line: 145, column: 8)
!187 = !DILocalVariable(name: "i", scope: !188, file: !13, line: 159, type: !4)
!188 = distinct !DILexicalBlock(scope: !189, file: !13, line: 158, column: 9)
!189 = distinct !DILexicalBlock(scope: !190, file: !13, line: 157, column: 5)
!190 = distinct !DILexicalBlock(scope: !180, file: !13, line: 156, column: 8)
!191 = !DILocation(line: 159, column: 17, scope: !188)
!192 = !DILocalVariable(name: "buffer", scope: !188, file: !13, line: 160, type: !29)
!193 = !DILocation(line: 160, column: 17, scope: !188)
!194 = !DILocation(line: 163, column: 17, scope: !195)
!195 = distinct !DILexicalBlock(scope: !188, file: !13, line: 163, column: 17)
!196 = !DILocation(line: 163, column: 22, scope: !195)
!197 = !DILocation(line: 163, column: 17, scope: !188)
!198 = !DILocation(line: 165, column: 24, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !13, line: 164, column: 13)
!200 = !DILocation(line: 165, column: 17, scope: !199)
!201 = !DILocation(line: 165, column: 30, scope: !199)
!202 = !DILocation(line: 167, column: 23, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !13, line: 167, column: 17)
!204 = !DILocation(line: 167, column: 21, scope: !203)
!205 = !DILocation(line: 167, column: 28, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !13, line: 167, column: 17)
!207 = !DILocation(line: 167, column: 30, scope: !206)
!208 = !DILocation(line: 167, column: 17, scope: !203)
!209 = !DILocation(line: 169, column: 41, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !13, line: 168, column: 17)
!211 = !DILocation(line: 169, column: 34, scope: !210)
!212 = !DILocation(line: 169, column: 21, scope: !210)
!213 = !DILocation(line: 170, column: 17, scope: !210)
!214 = !DILocation(line: 167, column: 37, scope: !206)
!215 = !DILocation(line: 167, column: 17, scope: !206)
!216 = distinct !{!216, !208, !217, !57}
!217 = !DILocation(line: 170, column: 17, scope: !203)
!218 = !DILocation(line: 171, column: 13, scope: !199)
!219 = !DILocation(line: 174, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !195, file: !13, line: 173, column: 13)
!221 = !DILocation(line: 178, column: 1, scope: !180)
!222 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 181, type: !14, scopeLine: 182, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!223 = !DILocalVariable(name: "data", scope: !222, file: !13, line: 183, type: !4)
!224 = !DILocation(line: 183, column: 9, scope: !222)
!225 = !DILocation(line: 185, column: 10, scope: !222)
!226 = !DILocation(line: 190, column: 14, scope: !227)
!227 = distinct !DILexicalBlock(scope: !228, file: !13, line: 187, column: 5)
!228 = distinct !DILexicalBlock(scope: !222, file: !13, line: 186, column: 8)
!229 = !DILocalVariable(name: "i", scope: !230, file: !13, line: 195, type: !4)
!230 = distinct !DILexicalBlock(scope: !231, file: !13, line: 194, column: 9)
!231 = distinct !DILexicalBlock(scope: !232, file: !13, line: 193, column: 5)
!232 = distinct !DILexicalBlock(scope: !222, file: !13, line: 192, column: 8)
!233 = !DILocation(line: 195, column: 17, scope: !230)
!234 = !DILocalVariable(name: "buffer", scope: !230, file: !13, line: 196, type: !29)
!235 = !DILocation(line: 196, column: 17, scope: !230)
!236 = !DILocation(line: 199, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !230, file: !13, line: 199, column: 17)
!238 = !DILocation(line: 199, column: 22, scope: !237)
!239 = !DILocation(line: 199, column: 17, scope: !230)
!240 = !DILocation(line: 201, column: 24, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !13, line: 200, column: 13)
!242 = !DILocation(line: 201, column: 17, scope: !241)
!243 = !DILocation(line: 201, column: 30, scope: !241)
!244 = !DILocation(line: 203, column: 23, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !13, line: 203, column: 17)
!246 = !DILocation(line: 203, column: 21, scope: !245)
!247 = !DILocation(line: 203, column: 28, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !13, line: 203, column: 17)
!249 = !DILocation(line: 203, column: 30, scope: !248)
!250 = !DILocation(line: 203, column: 17, scope: !245)
!251 = !DILocation(line: 205, column: 41, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !13, line: 204, column: 17)
!253 = !DILocation(line: 205, column: 34, scope: !252)
!254 = !DILocation(line: 205, column: 21, scope: !252)
!255 = !DILocation(line: 206, column: 17, scope: !252)
!256 = !DILocation(line: 203, column: 37, scope: !248)
!257 = !DILocation(line: 203, column: 17, scope: !248)
!258 = distinct !{!258, !250, !259, !57}
!259 = !DILocation(line: 206, column: 17, scope: !245)
!260 = !DILocation(line: 207, column: 13, scope: !241)
!261 = !DILocation(line: 210, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !237, file: !13, line: 209, column: 13)
!263 = !DILocation(line: 214, column: 1, scope: !222)
