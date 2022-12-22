; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %0 = load i32, i32* @staticFive, align 4, !dbg !22
  %cmp = icmp eq i32 %0, 5, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !26
  %and = and i32 %call, 1, !dbg !26
  %tobool = icmp ne i32 %and, 0, !dbg !26
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !26

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand() #5, !dbg !26
  %shl = shl i32 %call1, 30, !dbg !26
  %call2 = call i32 @rand() #5, !dbg !26
  %shl3 = shl i32 %call2, 15, !dbg !26
  %xor = xor i32 %shl, %shl3, !dbg !26
  %call4 = call i32 @rand() #5, !dbg !26
  %xor5 = xor i32 %xor, %call4, !dbg !26
  br label %cond.end, !dbg !26

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand() #5, !dbg !26
  %shl7 = shl i32 %call6, 30, !dbg !26
  %call8 = call i32 @rand() #5, !dbg !26
  %shl9 = shl i32 %call8, 15, !dbg !26
  %xor10 = xor i32 %shl7, %shl9, !dbg !26
  %call11 = call i32 @rand() #5, !dbg !26
  %xor12 = xor i32 %xor10, %call11, !dbg !26
  %sub = sub i32 0, %xor12, !dbg !26
  %sub13 = sub i32 %sub, 1, !dbg !26
  br label %cond.end, !dbg !26

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !26
  store i32 %cond, i32* %data, align 4, !dbg !28
  br label %if.end, !dbg !29

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp14 = icmp eq i32 %1, 5, !dbg !32
  br i1 %cmp14, label %if.then15, label %if.end22, !dbg !33

if.then15:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !38, metadata !DIExpression()), !dbg !42
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !42
  %3 = load i32, i32* %data, align 4, !dbg !43
  %cmp16 = icmp sge i32 %3, 0, !dbg !45
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !46

if.then17:                                        ; preds = %if.then15
  %4 = load i32, i32* %data, align 4, !dbg !47
  %idxprom = sext i32 %4 to i64, !dbg !49
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !49
  store i32 1, i32* %arrayidx, align 4, !dbg !50
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.then17
  %5 = load i32, i32* %i, align 4, !dbg !54
  %cmp18 = icmp slt i32 %5, 10, !dbg !56
  br i1 %cmp18, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !58
  %idxprom19 = sext i32 %6 to i64, !dbg !60
  %arrayidx20 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom19, !dbg !60
  %7 = load i32, i32* %arrayidx20, align 4, !dbg !60
  call void @printIntLine(i32 %7), !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !63
  %inc = add nsw i32 %8, 1, !dbg !63
  store i32 %inc, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  br label %if.end21, !dbg !68

if.else:                                          ; preds = %if.then15
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !69
  br label %if.end21

if.end21:                                         ; preds = %if.else, %for.end
  br label %if.end22, !dbg !71

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !72
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07_good() #0 !dbg !73 {
entry:
  call void @goodB2G1(), !dbg !74
  call void @goodB2G2(), !dbg !75
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #5, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #5, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !99 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %data, align 4, !dbg !102
  %0 = load i32, i32* @staticFive, align 4, !dbg !103
  %cmp = icmp eq i32 %0, 5, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !107
  %and = and i32 %call, 1, !dbg !107
  %tobool = icmp ne i32 %and, 0, !dbg !107
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !107

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand() #5, !dbg !107
  %shl = shl i32 %call1, 30, !dbg !107
  %call2 = call i32 @rand() #5, !dbg !107
  %shl3 = shl i32 %call2, 15, !dbg !107
  %xor = xor i32 %shl, %shl3, !dbg !107
  %call4 = call i32 @rand() #5, !dbg !107
  %xor5 = xor i32 %xor, %call4, !dbg !107
  br label %cond.end, !dbg !107

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand() #5, !dbg !107
  %shl7 = shl i32 %call6, 30, !dbg !107
  %call8 = call i32 @rand() #5, !dbg !107
  %shl9 = shl i32 %call8, 15, !dbg !107
  %xor10 = xor i32 %shl7, %shl9, !dbg !107
  %call11 = call i32 @rand() #5, !dbg !107
  %xor12 = xor i32 %xor10, %call11, !dbg !107
  %sub = sub i32 0, %xor12, !dbg !107
  %sub13 = sub i32 %sub, 1, !dbg !107
  br label %cond.end, !dbg !107

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !107
  store i32 %cond, i32* %data, align 4, !dbg !109
  br label %if.end, !dbg !110

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !111
  %cmp14 = icmp ne i32 %1, 5, !dbg !113
  br i1 %cmp14, label %if.then15, label %if.else, !dbg !114

if.then15:                                        ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !115
  br label %if.end24, !dbg !117

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !118, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !122, metadata !DIExpression()), !dbg !123
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !123
  %3 = load i32, i32* %data, align 4, !dbg !124
  %cmp16 = icmp sge i32 %3, 0, !dbg !126
  br i1 %cmp16, label %land.lhs.true, label %if.else22, !dbg !127

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !128
  %cmp17 = icmp slt i32 %4, 10, !dbg !129
  br i1 %cmp17, label %if.then18, label %if.else22, !dbg !130

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !131
  %idxprom = sext i32 %5 to i64, !dbg !133
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !133
  store i32 1, i32* %arrayidx, align 4, !dbg !134
  store i32 0, i32* %i, align 4, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.then18
  %6 = load i32, i32* %i, align 4, !dbg !138
  %cmp19 = icmp slt i32 %6, 10, !dbg !140
  br i1 %cmp19, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !142
  %idxprom20 = sext i32 %7 to i64, !dbg !144
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom20, !dbg !144
  %8 = load i32, i32* %arrayidx21, align 4, !dbg !144
  call void @printIntLine(i32 %8), !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !147
  %inc = add nsw i32 %9, 1, !dbg !147
  store i32 %inc, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  br label %if.end23, !dbg !151

if.else22:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !152
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then15
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !155 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !156, metadata !DIExpression()), !dbg !157
  store i32 -1, i32* %data, align 4, !dbg !158
  %0 = load i32, i32* @staticFive, align 4, !dbg !159
  %cmp = icmp eq i32 %0, 5, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !163
  %and = and i32 %call, 1, !dbg !163
  %tobool = icmp ne i32 %and, 0, !dbg !163
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !163

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand() #5, !dbg !163
  %shl = shl i32 %call1, 30, !dbg !163
  %call2 = call i32 @rand() #5, !dbg !163
  %shl3 = shl i32 %call2, 15, !dbg !163
  %xor = xor i32 %shl, %shl3, !dbg !163
  %call4 = call i32 @rand() #5, !dbg !163
  %xor5 = xor i32 %xor, %call4, !dbg !163
  br label %cond.end, !dbg !163

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand() #5, !dbg !163
  %shl7 = shl i32 %call6, 30, !dbg !163
  %call8 = call i32 @rand() #5, !dbg !163
  %shl9 = shl i32 %call8, 15, !dbg !163
  %xor10 = xor i32 %shl7, %shl9, !dbg !163
  %call11 = call i32 @rand() #5, !dbg !163
  %xor12 = xor i32 %xor10, %call11, !dbg !163
  %sub = sub i32 0, %xor12, !dbg !163
  %sub13 = sub i32 %sub, 1, !dbg !163
  br label %cond.end, !dbg !163

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !163
  store i32 %cond, i32* %data, align 4, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !167
  %cmp14 = icmp eq i32 %1, 5, !dbg !169
  br i1 %cmp14, label %if.then15, label %if.end23, !dbg !170

if.then15:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !171, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !175, metadata !DIExpression()), !dbg !176
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !176
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !176
  %3 = load i32, i32* %data, align 4, !dbg !177
  %cmp16 = icmp sge i32 %3, 0, !dbg !179
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !180

land.lhs.true:                                    ; preds = %if.then15
  %4 = load i32, i32* %data, align 4, !dbg !181
  %cmp17 = icmp slt i32 %4, 10, !dbg !182
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !183

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !184
  %idxprom = sext i32 %5 to i64, !dbg !186
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !186
  store i32 1, i32* %arrayidx, align 4, !dbg !187
  store i32 0, i32* %i, align 4, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %if.then18
  %6 = load i32, i32* %i, align 4, !dbg !191
  %cmp19 = icmp slt i32 %6, 10, !dbg !193
  br i1 %cmp19, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !195
  %idxprom20 = sext i32 %7 to i64, !dbg !197
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom20, !dbg !197
  %8 = load i32, i32* %arrayidx21, align 4, !dbg !197
  call void @printIntLine(i32 %8), !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !200
  %inc = add nsw i32 %9, 1, !dbg !200
  store i32 %inc, i32* %i, align 4, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  br label %if.end22, !dbg !204

if.else:                                          ; preds = %land.lhs.true, %if.then15
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !205
  br label %if.end22

if.end22:                                         ; preds = %if.else, %for.end
  br label %if.end23, !dbg !207

if.end23:                                         ; preds = %if.end22, %if.end
  ret void, !dbg !208
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !209 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !210, metadata !DIExpression()), !dbg !211
  store i32 -1, i32* %data, align 4, !dbg !212
  %0 = load i32, i32* @staticFive, align 4, !dbg !213
  %cmp = icmp ne i32 %0, 5, !dbg !215
  br i1 %cmp, label %if.then, label %if.else, !dbg !216

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !217
  br label %if.end, !dbg !219

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !220
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !222
  %cmp1 = icmp eq i32 %1, 5, !dbg !224
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !225

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !226, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !230, metadata !DIExpression()), !dbg !231
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !231
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !231
  %3 = load i32, i32* %data, align 4, !dbg !232
  %cmp3 = icmp sge i32 %3, 0, !dbg !234
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !235

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !236
  %idxprom = sext i32 %4 to i64, !dbg !238
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !238
  store i32 1, i32* %arrayidx, align 4, !dbg !239
  store i32 0, i32* %i, align 4, !dbg !240
  br label %for.cond, !dbg !242

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !243
  %cmp5 = icmp slt i32 %5, 10, !dbg !245
  br i1 %cmp5, label %for.body, label %for.end, !dbg !246

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !247
  %idxprom6 = sext i32 %6 to i64, !dbg !249
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !249
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !249
  call void @printIntLine(i32 %7), !dbg !250
  br label %for.inc, !dbg !251

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !252
  %inc = add nsw i32 %8, 1, !dbg !252
  store i32 %inc, i32* %i, align 4, !dbg !252
  br label %for.cond, !dbg !253, !llvm.loop !254

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !256

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !257
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !259

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !260
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !261 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %data, align 4, !dbg !264
  %0 = load i32, i32* @staticFive, align 4, !dbg !265
  %cmp = icmp eq i32 %0, 5, !dbg !267
  br i1 %cmp, label %if.then, label %if.end, !dbg !268

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !269
  br label %if.end, !dbg !271

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !272
  %cmp1 = icmp eq i32 %1, 5, !dbg !274
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !275

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !276, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !280, metadata !DIExpression()), !dbg !281
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !281
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !281
  %3 = load i32, i32* %data, align 4, !dbg !282
  %cmp3 = icmp sge i32 %3, 0, !dbg !284
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !285

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !286
  %idxprom = sext i32 %4 to i64, !dbg !288
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !288
  store i32 1, i32* %arrayidx, align 4, !dbg !289
  store i32 0, i32* %i, align 4, !dbg !290
  br label %for.cond, !dbg !292

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !293
  %cmp5 = icmp slt i32 %5, 10, !dbg !295
  br i1 %cmp5, label %for.body, label %for.end, !dbg !296

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !297
  %idxprom6 = sext i32 %6 to i64, !dbg !299
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !299
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !299
  call void @printIntLine(i32 %7), !dbg !300
  br label %for.inc, !dbg !301

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !302
  %inc = add nsw i32 %8, 1, !dbg !302
  store i32 %inc, i32* %i, align 4, !dbg !302
  br label %for.cond, !dbg !303, !llvm.loop !304

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !306

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !307
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !309

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !310
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 23, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07.c", directory: "/root/SSE-Assessment")
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07_bad", scope: !9, file: !9, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !9, line: 29, type: !6)
!20 = !DILocation(line: 29, column: 9, scope: !16)
!21 = !DILocation(line: 31, column: 10, scope: !16)
!22 = !DILocation(line: 32, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !9, line: 32, column: 8)
!24 = !DILocation(line: 32, column: 18, scope: !23)
!25 = !DILocation(line: 32, column: 8, scope: !16)
!26 = !DILocation(line: 35, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !9, line: 33, column: 5)
!28 = !DILocation(line: 35, column: 14, scope: !27)
!29 = !DILocation(line: 36, column: 5, scope: !27)
!30 = !DILocation(line: 37, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !9, line: 37, column: 8)
!32 = !DILocation(line: 37, column: 18, scope: !31)
!33 = !DILocation(line: 37, column: 8, scope: !16)
!34 = !DILocalVariable(name: "i", scope: !35, file: !9, line: 40, type: !6)
!35 = distinct !DILexicalBlock(scope: !36, file: !9, line: 39, column: 9)
!36 = distinct !DILexicalBlock(scope: !31, file: !9, line: 38, column: 5)
!37 = !DILocation(line: 40, column: 17, scope: !35)
!38 = !DILocalVariable(name: "buffer", scope: !35, file: !9, line: 41, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 10)
!42 = !DILocation(line: 41, column: 17, scope: !35)
!43 = !DILocation(line: 44, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !9, line: 44, column: 17)
!45 = !DILocation(line: 44, column: 22, scope: !44)
!46 = !DILocation(line: 44, column: 17, scope: !35)
!47 = !DILocation(line: 46, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !9, line: 45, column: 13)
!49 = !DILocation(line: 46, column: 17, scope: !48)
!50 = !DILocation(line: 46, column: 30, scope: !48)
!51 = !DILocation(line: 48, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !9, line: 48, column: 17)
!53 = !DILocation(line: 48, column: 21, scope: !52)
!54 = !DILocation(line: 48, column: 28, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !9, line: 48, column: 17)
!56 = !DILocation(line: 48, column: 30, scope: !55)
!57 = !DILocation(line: 48, column: 17, scope: !52)
!58 = !DILocation(line: 50, column: 41, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !9, line: 49, column: 17)
!60 = !DILocation(line: 50, column: 34, scope: !59)
!61 = !DILocation(line: 50, column: 21, scope: !59)
!62 = !DILocation(line: 51, column: 17, scope: !59)
!63 = !DILocation(line: 48, column: 37, scope: !55)
!64 = !DILocation(line: 48, column: 17, scope: !55)
!65 = distinct !{!65, !57, !66, !67}
!66 = !DILocation(line: 51, column: 17, scope: !52)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 52, column: 13, scope: !48)
!69 = !DILocation(line: 55, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !44, file: !9, line: 54, column: 13)
!71 = !DILocation(line: 58, column: 5, scope: !36)
!72 = !DILocation(line: 59, column: 1, scope: !16)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_07_good", scope: !9, file: !9, line: 215, type: !17, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 217, column: 5, scope: !73)
!75 = !DILocation(line: 218, column: 5, scope: !73)
!76 = !DILocation(line: 219, column: 5, scope: !73)
!77 = !DILocation(line: 220, column: 5, scope: !73)
!78 = !DILocation(line: 221, column: 1, scope: !73)
!79 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 232, type: !80, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!6, !6, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !9, line: 232, type: !6)
!86 = !DILocation(line: 232, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !9, line: 232, type: !82)
!88 = !DILocation(line: 232, column: 27, scope: !79)
!89 = !DILocation(line: 235, column: 22, scope: !79)
!90 = !DILocation(line: 235, column: 12, scope: !79)
!91 = !DILocation(line: 235, column: 5, scope: !79)
!92 = !DILocation(line: 237, column: 5, scope: !79)
!93 = !DILocation(line: 238, column: 5, scope: !79)
!94 = !DILocation(line: 239, column: 5, scope: !79)
!95 = !DILocation(line: 242, column: 5, scope: !79)
!96 = !DILocation(line: 243, column: 5, scope: !79)
!97 = !DILocation(line: 244, column: 5, scope: !79)
!98 = !DILocation(line: 246, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodB2G1", scope: !9, file: !9, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !9, line: 68, type: !6)
!101 = !DILocation(line: 68, column: 9, scope: !99)
!102 = !DILocation(line: 70, column: 10, scope: !99)
!103 = !DILocation(line: 71, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !9, line: 71, column: 8)
!105 = !DILocation(line: 71, column: 18, scope: !104)
!106 = !DILocation(line: 71, column: 8, scope: !99)
!107 = !DILocation(line: 74, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !9, line: 72, column: 5)
!109 = !DILocation(line: 74, column: 14, scope: !108)
!110 = !DILocation(line: 75, column: 5, scope: !108)
!111 = !DILocation(line: 76, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !99, file: !9, line: 76, column: 8)
!113 = !DILocation(line: 76, column: 18, scope: !112)
!114 = !DILocation(line: 76, column: 8, scope: !99)
!115 = !DILocation(line: 79, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !9, line: 77, column: 5)
!117 = !DILocation(line: 80, column: 5, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !9, line: 84, type: !6)
!119 = distinct !DILexicalBlock(scope: !120, file: !9, line: 83, column: 9)
!120 = distinct !DILexicalBlock(scope: !112, file: !9, line: 82, column: 5)
!121 = !DILocation(line: 84, column: 17, scope: !119)
!122 = !DILocalVariable(name: "buffer", scope: !119, file: !9, line: 85, type: !39)
!123 = !DILocation(line: 85, column: 17, scope: !119)
!124 = !DILocation(line: 87, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !9, line: 87, column: 17)
!126 = !DILocation(line: 87, column: 22, scope: !125)
!127 = !DILocation(line: 87, column: 27, scope: !125)
!128 = !DILocation(line: 87, column: 30, scope: !125)
!129 = !DILocation(line: 87, column: 35, scope: !125)
!130 = !DILocation(line: 87, column: 17, scope: !119)
!131 = !DILocation(line: 89, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !9, line: 88, column: 13)
!133 = !DILocation(line: 89, column: 17, scope: !132)
!134 = !DILocation(line: 89, column: 30, scope: !132)
!135 = !DILocation(line: 91, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !9, line: 91, column: 17)
!137 = !DILocation(line: 91, column: 21, scope: !136)
!138 = !DILocation(line: 91, column: 28, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !9, line: 91, column: 17)
!140 = !DILocation(line: 91, column: 30, scope: !139)
!141 = !DILocation(line: 91, column: 17, scope: !136)
!142 = !DILocation(line: 93, column: 41, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !9, line: 92, column: 17)
!144 = !DILocation(line: 93, column: 34, scope: !143)
!145 = !DILocation(line: 93, column: 21, scope: !143)
!146 = !DILocation(line: 94, column: 17, scope: !143)
!147 = !DILocation(line: 91, column: 37, scope: !139)
!148 = !DILocation(line: 91, column: 17, scope: !139)
!149 = distinct !{!149, !141, !150, !67}
!150 = !DILocation(line: 94, column: 17, scope: !136)
!151 = !DILocation(line: 95, column: 13, scope: !132)
!152 = !DILocation(line: 98, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !125, file: !9, line: 97, column: 13)
!154 = !DILocation(line: 102, column: 1, scope: !99)
!155 = distinct !DISubprogram(name: "goodB2G2", scope: !9, file: !9, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DILocalVariable(name: "data", scope: !155, file: !9, line: 107, type: !6)
!157 = !DILocation(line: 107, column: 9, scope: !155)
!158 = !DILocation(line: 109, column: 10, scope: !155)
!159 = !DILocation(line: 110, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !9, line: 110, column: 8)
!161 = !DILocation(line: 110, column: 18, scope: !160)
!162 = !DILocation(line: 110, column: 8, scope: !155)
!163 = !DILocation(line: 113, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !9, line: 111, column: 5)
!165 = !DILocation(line: 113, column: 14, scope: !164)
!166 = !DILocation(line: 114, column: 5, scope: !164)
!167 = !DILocation(line: 115, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !155, file: !9, line: 115, column: 8)
!169 = !DILocation(line: 115, column: 18, scope: !168)
!170 = !DILocation(line: 115, column: 8, scope: !155)
!171 = !DILocalVariable(name: "i", scope: !172, file: !9, line: 118, type: !6)
!172 = distinct !DILexicalBlock(scope: !173, file: !9, line: 117, column: 9)
!173 = distinct !DILexicalBlock(scope: !168, file: !9, line: 116, column: 5)
!174 = !DILocation(line: 118, column: 17, scope: !172)
!175 = !DILocalVariable(name: "buffer", scope: !172, file: !9, line: 119, type: !39)
!176 = !DILocation(line: 119, column: 17, scope: !172)
!177 = !DILocation(line: 121, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !172, file: !9, line: 121, column: 17)
!179 = !DILocation(line: 121, column: 22, scope: !178)
!180 = !DILocation(line: 121, column: 27, scope: !178)
!181 = !DILocation(line: 121, column: 30, scope: !178)
!182 = !DILocation(line: 121, column: 35, scope: !178)
!183 = !DILocation(line: 121, column: 17, scope: !172)
!184 = !DILocation(line: 123, column: 24, scope: !185)
!185 = distinct !DILexicalBlock(scope: !178, file: !9, line: 122, column: 13)
!186 = !DILocation(line: 123, column: 17, scope: !185)
!187 = !DILocation(line: 123, column: 30, scope: !185)
!188 = !DILocation(line: 125, column: 23, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !9, line: 125, column: 17)
!190 = !DILocation(line: 125, column: 21, scope: !189)
!191 = !DILocation(line: 125, column: 28, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !9, line: 125, column: 17)
!193 = !DILocation(line: 125, column: 30, scope: !192)
!194 = !DILocation(line: 125, column: 17, scope: !189)
!195 = !DILocation(line: 127, column: 41, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !9, line: 126, column: 17)
!197 = !DILocation(line: 127, column: 34, scope: !196)
!198 = !DILocation(line: 127, column: 21, scope: !196)
!199 = !DILocation(line: 128, column: 17, scope: !196)
!200 = !DILocation(line: 125, column: 37, scope: !192)
!201 = !DILocation(line: 125, column: 17, scope: !192)
!202 = distinct !{!202, !194, !203, !67}
!203 = !DILocation(line: 128, column: 17, scope: !189)
!204 = !DILocation(line: 129, column: 13, scope: !185)
!205 = !DILocation(line: 132, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !178, file: !9, line: 131, column: 13)
!207 = !DILocation(line: 135, column: 5, scope: !173)
!208 = !DILocation(line: 136, column: 1, scope: !155)
!209 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 139, type: !17, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!210 = !DILocalVariable(name: "data", scope: !209, file: !9, line: 141, type: !6)
!211 = !DILocation(line: 141, column: 9, scope: !209)
!212 = !DILocation(line: 143, column: 10, scope: !209)
!213 = !DILocation(line: 144, column: 8, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !9, line: 144, column: 8)
!215 = !DILocation(line: 144, column: 18, scope: !214)
!216 = !DILocation(line: 144, column: 8, scope: !209)
!217 = !DILocation(line: 147, column: 9, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !9, line: 145, column: 5)
!219 = !DILocation(line: 148, column: 5, scope: !218)
!220 = !DILocation(line: 153, column: 14, scope: !221)
!221 = distinct !DILexicalBlock(scope: !214, file: !9, line: 150, column: 5)
!222 = !DILocation(line: 155, column: 8, scope: !223)
!223 = distinct !DILexicalBlock(scope: !209, file: !9, line: 155, column: 8)
!224 = !DILocation(line: 155, column: 18, scope: !223)
!225 = !DILocation(line: 155, column: 8, scope: !209)
!226 = !DILocalVariable(name: "i", scope: !227, file: !9, line: 158, type: !6)
!227 = distinct !DILexicalBlock(scope: !228, file: !9, line: 157, column: 9)
!228 = distinct !DILexicalBlock(scope: !223, file: !9, line: 156, column: 5)
!229 = !DILocation(line: 158, column: 17, scope: !227)
!230 = !DILocalVariable(name: "buffer", scope: !227, file: !9, line: 159, type: !39)
!231 = !DILocation(line: 159, column: 17, scope: !227)
!232 = !DILocation(line: 162, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !227, file: !9, line: 162, column: 17)
!234 = !DILocation(line: 162, column: 22, scope: !233)
!235 = !DILocation(line: 162, column: 17, scope: !227)
!236 = !DILocation(line: 164, column: 24, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !9, line: 163, column: 13)
!238 = !DILocation(line: 164, column: 17, scope: !237)
!239 = !DILocation(line: 164, column: 30, scope: !237)
!240 = !DILocation(line: 166, column: 23, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !9, line: 166, column: 17)
!242 = !DILocation(line: 166, column: 21, scope: !241)
!243 = !DILocation(line: 166, column: 28, scope: !244)
!244 = distinct !DILexicalBlock(scope: !241, file: !9, line: 166, column: 17)
!245 = !DILocation(line: 166, column: 30, scope: !244)
!246 = !DILocation(line: 166, column: 17, scope: !241)
!247 = !DILocation(line: 168, column: 41, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !9, line: 167, column: 17)
!249 = !DILocation(line: 168, column: 34, scope: !248)
!250 = !DILocation(line: 168, column: 21, scope: !248)
!251 = !DILocation(line: 169, column: 17, scope: !248)
!252 = !DILocation(line: 166, column: 37, scope: !244)
!253 = !DILocation(line: 166, column: 17, scope: !244)
!254 = distinct !{!254, !246, !255, !67}
!255 = !DILocation(line: 169, column: 17, scope: !241)
!256 = !DILocation(line: 170, column: 13, scope: !237)
!257 = !DILocation(line: 173, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !233, file: !9, line: 172, column: 13)
!259 = !DILocation(line: 176, column: 5, scope: !228)
!260 = !DILocation(line: 177, column: 1, scope: !209)
!261 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 180, type: !17, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!262 = !DILocalVariable(name: "data", scope: !261, file: !9, line: 182, type: !6)
!263 = !DILocation(line: 182, column: 9, scope: !261)
!264 = !DILocation(line: 184, column: 10, scope: !261)
!265 = !DILocation(line: 185, column: 8, scope: !266)
!266 = distinct !DILexicalBlock(scope: !261, file: !9, line: 185, column: 8)
!267 = !DILocation(line: 185, column: 18, scope: !266)
!268 = !DILocation(line: 185, column: 8, scope: !261)
!269 = !DILocation(line: 189, column: 14, scope: !270)
!270 = distinct !DILexicalBlock(scope: !266, file: !9, line: 186, column: 5)
!271 = !DILocation(line: 190, column: 5, scope: !270)
!272 = !DILocation(line: 191, column: 8, scope: !273)
!273 = distinct !DILexicalBlock(scope: !261, file: !9, line: 191, column: 8)
!274 = !DILocation(line: 191, column: 18, scope: !273)
!275 = !DILocation(line: 191, column: 8, scope: !261)
!276 = !DILocalVariable(name: "i", scope: !277, file: !9, line: 194, type: !6)
!277 = distinct !DILexicalBlock(scope: !278, file: !9, line: 193, column: 9)
!278 = distinct !DILexicalBlock(scope: !273, file: !9, line: 192, column: 5)
!279 = !DILocation(line: 194, column: 17, scope: !277)
!280 = !DILocalVariable(name: "buffer", scope: !277, file: !9, line: 195, type: !39)
!281 = !DILocation(line: 195, column: 17, scope: !277)
!282 = !DILocation(line: 198, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !277, file: !9, line: 198, column: 17)
!284 = !DILocation(line: 198, column: 22, scope: !283)
!285 = !DILocation(line: 198, column: 17, scope: !277)
!286 = !DILocation(line: 200, column: 24, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !9, line: 199, column: 13)
!288 = !DILocation(line: 200, column: 17, scope: !287)
!289 = !DILocation(line: 200, column: 30, scope: !287)
!290 = !DILocation(line: 202, column: 23, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !9, line: 202, column: 17)
!292 = !DILocation(line: 202, column: 21, scope: !291)
!293 = !DILocation(line: 202, column: 28, scope: !294)
!294 = distinct !DILexicalBlock(scope: !291, file: !9, line: 202, column: 17)
!295 = !DILocation(line: 202, column: 30, scope: !294)
!296 = !DILocation(line: 202, column: 17, scope: !291)
!297 = !DILocation(line: 204, column: 41, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !9, line: 203, column: 17)
!299 = !DILocation(line: 204, column: 34, scope: !298)
!300 = !DILocation(line: 204, column: 21, scope: !298)
!301 = !DILocation(line: 205, column: 17, scope: !298)
!302 = !DILocation(line: 202, column: 37, scope: !294)
!303 = !DILocation(line: 202, column: 17, scope: !294)
!304 = distinct !{!304, !296, !305, !67}
!305 = !DILocation(line: 205, column: 17, scope: !291)
!306 = !DILocation(line: 206, column: 13, scope: !287)
!307 = !DILocation(line: 209, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !283, file: !9, line: 208, column: 13)
!309 = !DILocation(line: 212, column: 5, scope: !278)
!310 = !DILocation(line: 213, column: 1, scope: !261)
