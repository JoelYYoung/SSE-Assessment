; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !22
  %and = and i32 %call, 1, !dbg !22
  %tobool1 = icmp ne i32 %and, 0, !dbg !22
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !22

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand() #5, !dbg !22
  %shl = shl i32 %call2, 30, !dbg !22
  %call3 = call i32 @rand() #5, !dbg !22
  %shl4 = shl i32 %call3, 15, !dbg !22
  %xor = xor i32 %shl, %shl4, !dbg !22
  %call5 = call i32 @rand() #5, !dbg !22
  %xor6 = xor i32 %xor, %call5, !dbg !22
  br label %cond.end, !dbg !22

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand() #5, !dbg !22
  %shl8 = shl i32 %call7, 30, !dbg !22
  %call9 = call i32 @rand() #5, !dbg !22
  %shl10 = shl i32 %call9, 15, !dbg !22
  %xor11 = xor i32 %shl8, %shl10, !dbg !22
  %call12 = call i32 @rand() #5, !dbg !22
  %xor13 = xor i32 %xor11, %call12, !dbg !22
  %sub = sub i32 0, %xor13, !dbg !22
  %sub14 = sub i32 %sub, 1, !dbg !22
  br label %cond.end, !dbg !22

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !22
  store i32 %cond, i32* %data, align 4, !dbg !24
  br label %if.end, !dbg !25

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !26
  %tobool15 = icmp ne i32 %1, 0, !dbg !26
  br i1 %tobool15, label %if.then16, label %if.end22, !dbg !28

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !33, metadata !DIExpression()), !dbg !37
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !37
  %3 = load i32, i32* %data, align 4, !dbg !38
  %cmp = icmp sge i32 %3, 0, !dbg !40
  br i1 %cmp, label %if.then17, label %if.else, !dbg !41

if.then17:                                        ; preds = %if.then16
  %4 = load i32, i32* %data, align 4, !dbg !42
  %idxprom = sext i32 %4 to i64, !dbg !44
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !44
  store i32 1, i32* %arrayidx, align 4, !dbg !45
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.then17
  %5 = load i32, i32* %i, align 4, !dbg !49
  %cmp18 = icmp slt i32 %5, 10, !dbg !51
  br i1 %cmp18, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !53
  %idxprom19 = sext i32 %6 to i64, !dbg !55
  %arrayidx20 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom19, !dbg !55
  %7 = load i32, i32* %arrayidx20, align 4, !dbg !55
  call void @printIntLine(i32 %7), !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !58
  %inc = add nsw i32 %8, 1, !dbg !58
  store i32 %inc, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  br label %if.end21, !dbg !63

if.else:                                          ; preds = %if.then16
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !64
  br label %if.end21

if.end21:                                         ; preds = %if.else, %for.end
  br label %if.end22, !dbg !66

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !67
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09_good() #0 !dbg !68 {
entry:
  call void @goodB2G1(), !dbg !69
  call void @goodB2G2(), !dbg !70
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !94 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32 -1, i32* %data, align 4, !dbg !97
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !98
  %tobool = icmp ne i32 %0, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !101
  %and = and i32 %call, 1, !dbg !101
  %tobool1 = icmp ne i32 %and, 0, !dbg !101
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !101

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand() #5, !dbg !101
  %shl = shl i32 %call2, 30, !dbg !101
  %call3 = call i32 @rand() #5, !dbg !101
  %shl4 = shl i32 %call3, 15, !dbg !101
  %xor = xor i32 %shl, %shl4, !dbg !101
  %call5 = call i32 @rand() #5, !dbg !101
  %xor6 = xor i32 %xor, %call5, !dbg !101
  br label %cond.end, !dbg !101

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand() #5, !dbg !101
  %shl8 = shl i32 %call7, 30, !dbg !101
  %call9 = call i32 @rand() #5, !dbg !101
  %shl10 = shl i32 %call9, 15, !dbg !101
  %xor11 = xor i32 %shl8, %shl10, !dbg !101
  %call12 = call i32 @rand() #5, !dbg !101
  %xor13 = xor i32 %xor11, %call12, !dbg !101
  %sub = sub i32 0, %xor13, !dbg !101
  %sub14 = sub i32 %sub, 1, !dbg !101
  br label %cond.end, !dbg !101

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !101
  store i32 %cond, i32* %data, align 4, !dbg !103
  br label %if.end, !dbg !104

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !105
  %tobool15 = icmp ne i32 %1, 0, !dbg !105
  br i1 %tobool15, label %if.then16, label %if.else, !dbg !107

if.then16:                                        ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !108
  br label %if.end24, !dbg !110

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !111, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !116
  %3 = load i32, i32* %data, align 4, !dbg !117
  %cmp = icmp sge i32 %3, 0, !dbg !119
  br i1 %cmp, label %land.lhs.true, label %if.else22, !dbg !120

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !121
  %cmp17 = icmp slt i32 %4, 10, !dbg !122
  br i1 %cmp17, label %if.then18, label %if.else22, !dbg !123

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !124
  %idxprom = sext i32 %5 to i64, !dbg !126
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !126
  store i32 1, i32* %arrayidx, align 4, !dbg !127
  store i32 0, i32* %i, align 4, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.then18
  %6 = load i32, i32* %i, align 4, !dbg !131
  %cmp19 = icmp slt i32 %6, 10, !dbg !133
  br i1 %cmp19, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !135
  %idxprom20 = sext i32 %7 to i64, !dbg !137
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom20, !dbg !137
  %8 = load i32, i32* %arrayidx21, align 4, !dbg !137
  call void @printIntLine(i32 %8), !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !140
  %inc = add nsw i32 %9, 1, !dbg !140
  store i32 %inc, i32* %i, align 4, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  br label %if.end23, !dbg !144

if.else22:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !145
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then16
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 -1, i32* %data, align 4, !dbg !151
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !152
  %tobool = icmp ne i32 %0, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !155
  %and = and i32 %call, 1, !dbg !155
  %tobool1 = icmp ne i32 %and, 0, !dbg !155
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !155

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand() #5, !dbg !155
  %shl = shl i32 %call2, 30, !dbg !155
  %call3 = call i32 @rand() #5, !dbg !155
  %shl4 = shl i32 %call3, 15, !dbg !155
  %xor = xor i32 %shl, %shl4, !dbg !155
  %call5 = call i32 @rand() #5, !dbg !155
  %xor6 = xor i32 %xor, %call5, !dbg !155
  br label %cond.end, !dbg !155

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand() #5, !dbg !155
  %shl8 = shl i32 %call7, 30, !dbg !155
  %call9 = call i32 @rand() #5, !dbg !155
  %shl10 = shl i32 %call9, 15, !dbg !155
  %xor11 = xor i32 %shl8, %shl10, !dbg !155
  %call12 = call i32 @rand() #5, !dbg !155
  %xor13 = xor i32 %xor11, %call12, !dbg !155
  %sub = sub i32 0, %xor13, !dbg !155
  %sub14 = sub i32 %sub, 1, !dbg !155
  br label %cond.end, !dbg !155

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !155
  store i32 %cond, i32* %data, align 4, !dbg !157
  br label %if.end, !dbg !158

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !159
  %tobool15 = icmp ne i32 %1, 0, !dbg !159
  br i1 %tobool15, label %if.then16, label %if.end23, !dbg !161

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !162, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !166, metadata !DIExpression()), !dbg !167
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !167
  %3 = load i32, i32* %data, align 4, !dbg !168
  %cmp = icmp sge i32 %3, 0, !dbg !170
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !171

land.lhs.true:                                    ; preds = %if.then16
  %4 = load i32, i32* %data, align 4, !dbg !172
  %cmp17 = icmp slt i32 %4, 10, !dbg !173
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !174

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !175
  %idxprom = sext i32 %5 to i64, !dbg !177
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !177
  store i32 1, i32* %arrayidx, align 4, !dbg !178
  store i32 0, i32* %i, align 4, !dbg !179
  br label %for.cond, !dbg !181

for.cond:                                         ; preds = %for.inc, %if.then18
  %6 = load i32, i32* %i, align 4, !dbg !182
  %cmp19 = icmp slt i32 %6, 10, !dbg !184
  br i1 %cmp19, label %for.body, label %for.end, !dbg !185

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !186
  %idxprom20 = sext i32 %7 to i64, !dbg !188
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom20, !dbg !188
  %8 = load i32, i32* %arrayidx21, align 4, !dbg !188
  call void @printIntLine(i32 %8), !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !191
  %inc = add nsw i32 %9, 1, !dbg !191
  store i32 %inc, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  br label %if.end22, !dbg !195

if.else:                                          ; preds = %land.lhs.true, %if.then16
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !196
  br label %if.end22

if.end22:                                         ; preds = %if.else, %for.end
  br label %if.end23, !dbg !198

if.end23:                                         ; preds = %if.end22, %if.end
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !200 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !201, metadata !DIExpression()), !dbg !202
  store i32 -1, i32* %data, align 4, !dbg !203
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !204
  %tobool = icmp ne i32 %0, 0, !dbg !204
  br i1 %tobool, label %if.then, label %if.else, !dbg !206

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !207
  br label %if.end, !dbg !209

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !210
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !212
  %tobool1 = icmp ne i32 %1, 0, !dbg !212
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !214

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !215, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !219, metadata !DIExpression()), !dbg !220
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !220
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !220
  %3 = load i32, i32* %data, align 4, !dbg !221
  %cmp = icmp sge i32 %3, 0, !dbg !223
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !224

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !225
  %idxprom = sext i32 %4 to i64, !dbg !227
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !227
  store i32 1, i32* %arrayidx, align 4, !dbg !228
  store i32 0, i32* %i, align 4, !dbg !229
  br label %for.cond, !dbg !231

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !232
  %cmp4 = icmp slt i32 %5, 10, !dbg !234
  br i1 %cmp4, label %for.body, label %for.end, !dbg !235

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !236
  %idxprom5 = sext i32 %6 to i64, !dbg !238
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !238
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !238
  call void @printIntLine(i32 %7), !dbg !239
  br label %for.inc, !dbg !240

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !241
  %inc = add nsw i32 %8, 1, !dbg !241
  store i32 %inc, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !242, !llvm.loop !243

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !245

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !246
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !248

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !249
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !250 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 -1, i32* %data, align 4, !dbg !253
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !254
  %tobool = icmp ne i32 %0, 0, !dbg !254
  br i1 %tobool, label %if.then, label %if.end, !dbg !256

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !257
  br label %if.end, !dbg !259

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !260
  %tobool1 = icmp ne i32 %1, 0, !dbg !260
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !262

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !263, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !267, metadata !DIExpression()), !dbg !268
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !268
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !268
  %3 = load i32, i32* %data, align 4, !dbg !269
  %cmp = icmp sge i32 %3, 0, !dbg !271
  br i1 %cmp, label %if.then3, label %if.else, !dbg !272

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !273
  %idxprom = sext i32 %4 to i64, !dbg !275
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !275
  store i32 1, i32* %arrayidx, align 4, !dbg !276
  store i32 0, i32* %i, align 4, !dbg !277
  br label %for.cond, !dbg !279

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !280
  %cmp4 = icmp slt i32 %5, 10, !dbg !282
  br i1 %cmp4, label %for.body, label %for.end, !dbg !283

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !284
  %idxprom5 = sext i32 %6 to i64, !dbg !286
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !286
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !286
  call void @printIntLine(i32 %7), !dbg !287
  br label %for.inc, !dbg !288

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !289
  %inc = add nsw i32 %8, 1, !dbg !289
  store i32 %inc, i32* %i, align 4, !dbg !289
  br label %for.cond, !dbg !290, !llvm.loop !291

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !293

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !294
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !296

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !297
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !12, file: !13, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 8, scope: !12)
!22 = !DILocation(line: 30, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !13, line: 28, column: 5)
!24 = !DILocation(line: 30, column: 14, scope: !23)
!25 = !DILocation(line: 31, column: 5, scope: !23)
!26 = !DILocation(line: 32, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !12, file: !13, line: 32, column: 8)
!28 = !DILocation(line: 32, column: 8, scope: !12)
!29 = !DILocalVariable(name: "i", scope: !30, file: !13, line: 35, type: !4)
!30 = distinct !DILexicalBlock(scope: !31, file: !13, line: 34, column: 9)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 33, column: 5)
!32 = !DILocation(line: 35, column: 17, scope: !30)
!33 = !DILocalVariable(name: "buffer", scope: !30, file: !13, line: 36, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 36, column: 17, scope: !30)
!38 = !DILocation(line: 39, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !13, line: 39, column: 17)
!40 = !DILocation(line: 39, column: 22, scope: !39)
!41 = !DILocation(line: 39, column: 17, scope: !30)
!42 = !DILocation(line: 41, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !13, line: 40, column: 13)
!44 = !DILocation(line: 41, column: 17, scope: !43)
!45 = !DILocation(line: 41, column: 30, scope: !43)
!46 = !DILocation(line: 43, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !13, line: 43, column: 17)
!48 = !DILocation(line: 43, column: 21, scope: !47)
!49 = !DILocation(line: 43, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !13, line: 43, column: 17)
!51 = !DILocation(line: 43, column: 30, scope: !50)
!52 = !DILocation(line: 43, column: 17, scope: !47)
!53 = !DILocation(line: 45, column: 41, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !13, line: 44, column: 17)
!55 = !DILocation(line: 45, column: 34, scope: !54)
!56 = !DILocation(line: 45, column: 21, scope: !54)
!57 = !DILocation(line: 46, column: 17, scope: !54)
!58 = !DILocation(line: 43, column: 37, scope: !50)
!59 = !DILocation(line: 43, column: 17, scope: !50)
!60 = distinct !{!60, !52, !61, !62}
!61 = !DILocation(line: 46, column: 17, scope: !47)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 47, column: 13, scope: !43)
!64 = !DILocation(line: 50, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !39, file: !13, line: 49, column: 13)
!66 = !DILocation(line: 53, column: 5, scope: !31)
!67 = !DILocation(line: 54, column: 1, scope: !12)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_09_good", scope: !13, file: !13, line: 210, type: !14, scopeLine: 211, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 212, column: 5, scope: !68)
!70 = !DILocation(line: 213, column: 5, scope: !68)
!71 = !DILocation(line: 214, column: 5, scope: !68)
!72 = !DILocation(line: 215, column: 5, scope: !68)
!73 = !DILocation(line: 216, column: 1, scope: !68)
!74 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 227, type: !75, scopeLine: 228, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!4, !4, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !13, line: 227, type: !4)
!81 = !DILocation(line: 227, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !13, line: 227, type: !77)
!83 = !DILocation(line: 227, column: 27, scope: !74)
!84 = !DILocation(line: 230, column: 22, scope: !74)
!85 = !DILocation(line: 230, column: 12, scope: !74)
!86 = !DILocation(line: 230, column: 5, scope: !74)
!87 = !DILocation(line: 232, column: 5, scope: !74)
!88 = !DILocation(line: 233, column: 5, scope: !74)
!89 = !DILocation(line: 234, column: 5, scope: !74)
!90 = !DILocation(line: 237, column: 5, scope: !74)
!91 = !DILocation(line: 238, column: 5, scope: !74)
!92 = !DILocation(line: 239, column: 5, scope: !74)
!93 = !DILocation(line: 241, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 61, type: !14, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !13, line: 63, type: !4)
!96 = !DILocation(line: 63, column: 9, scope: !94)
!97 = !DILocation(line: 65, column: 10, scope: !94)
!98 = !DILocation(line: 66, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !13, line: 66, column: 8)
!100 = !DILocation(line: 66, column: 8, scope: !94)
!101 = !DILocation(line: 69, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !13, line: 67, column: 5)
!103 = !DILocation(line: 69, column: 14, scope: !102)
!104 = !DILocation(line: 70, column: 5, scope: !102)
!105 = !DILocation(line: 71, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !94, file: !13, line: 71, column: 8)
!107 = !DILocation(line: 71, column: 8, scope: !94)
!108 = !DILocation(line: 74, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !13, line: 72, column: 5)
!110 = !DILocation(line: 75, column: 5, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !112, file: !13, line: 79, type: !4)
!112 = distinct !DILexicalBlock(scope: !113, file: !13, line: 78, column: 9)
!113 = distinct !DILexicalBlock(scope: !106, file: !13, line: 77, column: 5)
!114 = !DILocation(line: 79, column: 17, scope: !112)
!115 = !DILocalVariable(name: "buffer", scope: !112, file: !13, line: 80, type: !34)
!116 = !DILocation(line: 80, column: 17, scope: !112)
!117 = !DILocation(line: 82, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !13, line: 82, column: 17)
!119 = !DILocation(line: 82, column: 22, scope: !118)
!120 = !DILocation(line: 82, column: 27, scope: !118)
!121 = !DILocation(line: 82, column: 30, scope: !118)
!122 = !DILocation(line: 82, column: 35, scope: !118)
!123 = !DILocation(line: 82, column: 17, scope: !112)
!124 = !DILocation(line: 84, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !13, line: 83, column: 13)
!126 = !DILocation(line: 84, column: 17, scope: !125)
!127 = !DILocation(line: 84, column: 30, scope: !125)
!128 = !DILocation(line: 86, column: 23, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 86, column: 17)
!130 = !DILocation(line: 86, column: 21, scope: !129)
!131 = !DILocation(line: 86, column: 28, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !13, line: 86, column: 17)
!133 = !DILocation(line: 86, column: 30, scope: !132)
!134 = !DILocation(line: 86, column: 17, scope: !129)
!135 = !DILocation(line: 88, column: 41, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !13, line: 87, column: 17)
!137 = !DILocation(line: 88, column: 34, scope: !136)
!138 = !DILocation(line: 88, column: 21, scope: !136)
!139 = !DILocation(line: 89, column: 17, scope: !136)
!140 = !DILocation(line: 86, column: 37, scope: !132)
!141 = !DILocation(line: 86, column: 17, scope: !132)
!142 = distinct !{!142, !134, !143, !62}
!143 = !DILocation(line: 89, column: 17, scope: !129)
!144 = !DILocation(line: 90, column: 13, scope: !125)
!145 = !DILocation(line: 93, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !118, file: !13, line: 92, column: 13)
!147 = !DILocation(line: 97, column: 1, scope: !94)
!148 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 100, type: !14, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", scope: !148, file: !13, line: 102, type: !4)
!150 = !DILocation(line: 102, column: 9, scope: !148)
!151 = !DILocation(line: 104, column: 10, scope: !148)
!152 = !DILocation(line: 105, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !13, line: 105, column: 8)
!154 = !DILocation(line: 105, column: 8, scope: !148)
!155 = !DILocation(line: 108, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !13, line: 106, column: 5)
!157 = !DILocation(line: 108, column: 14, scope: !156)
!158 = !DILocation(line: 109, column: 5, scope: !156)
!159 = !DILocation(line: 110, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !148, file: !13, line: 110, column: 8)
!161 = !DILocation(line: 110, column: 8, scope: !148)
!162 = !DILocalVariable(name: "i", scope: !163, file: !13, line: 113, type: !4)
!163 = distinct !DILexicalBlock(scope: !164, file: !13, line: 112, column: 9)
!164 = distinct !DILexicalBlock(scope: !160, file: !13, line: 111, column: 5)
!165 = !DILocation(line: 113, column: 17, scope: !163)
!166 = !DILocalVariable(name: "buffer", scope: !163, file: !13, line: 114, type: !34)
!167 = !DILocation(line: 114, column: 17, scope: !163)
!168 = !DILocation(line: 116, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !163, file: !13, line: 116, column: 17)
!170 = !DILocation(line: 116, column: 22, scope: !169)
!171 = !DILocation(line: 116, column: 27, scope: !169)
!172 = !DILocation(line: 116, column: 30, scope: !169)
!173 = !DILocation(line: 116, column: 35, scope: !169)
!174 = !DILocation(line: 116, column: 17, scope: !163)
!175 = !DILocation(line: 118, column: 24, scope: !176)
!176 = distinct !DILexicalBlock(scope: !169, file: !13, line: 117, column: 13)
!177 = !DILocation(line: 118, column: 17, scope: !176)
!178 = !DILocation(line: 118, column: 30, scope: !176)
!179 = !DILocation(line: 120, column: 23, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !13, line: 120, column: 17)
!181 = !DILocation(line: 120, column: 21, scope: !180)
!182 = !DILocation(line: 120, column: 28, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !13, line: 120, column: 17)
!184 = !DILocation(line: 120, column: 30, scope: !183)
!185 = !DILocation(line: 120, column: 17, scope: !180)
!186 = !DILocation(line: 122, column: 41, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !13, line: 121, column: 17)
!188 = !DILocation(line: 122, column: 34, scope: !187)
!189 = !DILocation(line: 122, column: 21, scope: !187)
!190 = !DILocation(line: 123, column: 17, scope: !187)
!191 = !DILocation(line: 120, column: 37, scope: !183)
!192 = !DILocation(line: 120, column: 17, scope: !183)
!193 = distinct !{!193, !185, !194, !62}
!194 = !DILocation(line: 123, column: 17, scope: !180)
!195 = !DILocation(line: 124, column: 13, scope: !176)
!196 = !DILocation(line: 127, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !169, file: !13, line: 126, column: 13)
!198 = !DILocation(line: 130, column: 5, scope: !164)
!199 = !DILocation(line: 131, column: 1, scope: !148)
!200 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 134, type: !14, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!201 = !DILocalVariable(name: "data", scope: !200, file: !13, line: 136, type: !4)
!202 = !DILocation(line: 136, column: 9, scope: !200)
!203 = !DILocation(line: 138, column: 10, scope: !200)
!204 = !DILocation(line: 139, column: 8, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !13, line: 139, column: 8)
!206 = !DILocation(line: 139, column: 8, scope: !200)
!207 = !DILocation(line: 142, column: 9, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !13, line: 140, column: 5)
!209 = !DILocation(line: 143, column: 5, scope: !208)
!210 = !DILocation(line: 148, column: 14, scope: !211)
!211 = distinct !DILexicalBlock(scope: !205, file: !13, line: 145, column: 5)
!212 = !DILocation(line: 150, column: 8, scope: !213)
!213 = distinct !DILexicalBlock(scope: !200, file: !13, line: 150, column: 8)
!214 = !DILocation(line: 150, column: 8, scope: !200)
!215 = !DILocalVariable(name: "i", scope: !216, file: !13, line: 153, type: !4)
!216 = distinct !DILexicalBlock(scope: !217, file: !13, line: 152, column: 9)
!217 = distinct !DILexicalBlock(scope: !213, file: !13, line: 151, column: 5)
!218 = !DILocation(line: 153, column: 17, scope: !216)
!219 = !DILocalVariable(name: "buffer", scope: !216, file: !13, line: 154, type: !34)
!220 = !DILocation(line: 154, column: 17, scope: !216)
!221 = !DILocation(line: 157, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !216, file: !13, line: 157, column: 17)
!223 = !DILocation(line: 157, column: 22, scope: !222)
!224 = !DILocation(line: 157, column: 17, scope: !216)
!225 = !DILocation(line: 159, column: 24, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !13, line: 158, column: 13)
!227 = !DILocation(line: 159, column: 17, scope: !226)
!228 = !DILocation(line: 159, column: 30, scope: !226)
!229 = !DILocation(line: 161, column: 23, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !13, line: 161, column: 17)
!231 = !DILocation(line: 161, column: 21, scope: !230)
!232 = !DILocation(line: 161, column: 28, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !13, line: 161, column: 17)
!234 = !DILocation(line: 161, column: 30, scope: !233)
!235 = !DILocation(line: 161, column: 17, scope: !230)
!236 = !DILocation(line: 163, column: 41, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !13, line: 162, column: 17)
!238 = !DILocation(line: 163, column: 34, scope: !237)
!239 = !DILocation(line: 163, column: 21, scope: !237)
!240 = !DILocation(line: 164, column: 17, scope: !237)
!241 = !DILocation(line: 161, column: 37, scope: !233)
!242 = !DILocation(line: 161, column: 17, scope: !233)
!243 = distinct !{!243, !235, !244, !62}
!244 = !DILocation(line: 164, column: 17, scope: !230)
!245 = !DILocation(line: 165, column: 13, scope: !226)
!246 = !DILocation(line: 168, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !222, file: !13, line: 167, column: 13)
!248 = !DILocation(line: 171, column: 5, scope: !217)
!249 = !DILocation(line: 172, column: 1, scope: !200)
!250 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 175, type: !14, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!251 = !DILocalVariable(name: "data", scope: !250, file: !13, line: 177, type: !4)
!252 = !DILocation(line: 177, column: 9, scope: !250)
!253 = !DILocation(line: 179, column: 10, scope: !250)
!254 = !DILocation(line: 180, column: 8, scope: !255)
!255 = distinct !DILexicalBlock(scope: !250, file: !13, line: 180, column: 8)
!256 = !DILocation(line: 180, column: 8, scope: !250)
!257 = !DILocation(line: 184, column: 14, scope: !258)
!258 = distinct !DILexicalBlock(scope: !255, file: !13, line: 181, column: 5)
!259 = !DILocation(line: 185, column: 5, scope: !258)
!260 = !DILocation(line: 186, column: 8, scope: !261)
!261 = distinct !DILexicalBlock(scope: !250, file: !13, line: 186, column: 8)
!262 = !DILocation(line: 186, column: 8, scope: !250)
!263 = !DILocalVariable(name: "i", scope: !264, file: !13, line: 189, type: !4)
!264 = distinct !DILexicalBlock(scope: !265, file: !13, line: 188, column: 9)
!265 = distinct !DILexicalBlock(scope: !261, file: !13, line: 187, column: 5)
!266 = !DILocation(line: 189, column: 17, scope: !264)
!267 = !DILocalVariable(name: "buffer", scope: !264, file: !13, line: 190, type: !34)
!268 = !DILocation(line: 190, column: 17, scope: !264)
!269 = !DILocation(line: 193, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !264, file: !13, line: 193, column: 17)
!271 = !DILocation(line: 193, column: 22, scope: !270)
!272 = !DILocation(line: 193, column: 17, scope: !264)
!273 = !DILocation(line: 195, column: 24, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !13, line: 194, column: 13)
!275 = !DILocation(line: 195, column: 17, scope: !274)
!276 = !DILocation(line: 195, column: 30, scope: !274)
!277 = !DILocation(line: 197, column: 23, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !13, line: 197, column: 17)
!279 = !DILocation(line: 197, column: 21, scope: !278)
!280 = !DILocation(line: 197, column: 28, scope: !281)
!281 = distinct !DILexicalBlock(scope: !278, file: !13, line: 197, column: 17)
!282 = !DILocation(line: 197, column: 30, scope: !281)
!283 = !DILocation(line: 197, column: 17, scope: !278)
!284 = !DILocation(line: 199, column: 41, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !13, line: 198, column: 17)
!286 = !DILocation(line: 199, column: 34, scope: !285)
!287 = !DILocation(line: 199, column: 21, scope: !285)
!288 = !DILocation(line: 200, column: 17, scope: !285)
!289 = !DILocation(line: 197, column: 37, scope: !281)
!290 = !DILocation(line: 197, column: 17, scope: !281)
!291 = distinct !{!291, !283, !292, !62}
!292 = !DILocation(line: 200, column: 17, scope: !278)
!293 = !DILocation(line: 201, column: 13, scope: !274)
!294 = !DILocation(line: 204, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !270, file: !13, line: 203, column: 13)
!296 = !DILocation(line: 207, column: 5, scope: !265)
!297 = !DILocation(line: 208, column: 1, scope: !250)
