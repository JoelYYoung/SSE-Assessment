; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_15_bad() #0 !dbg !12 {
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
  store i32 %cond, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !28
  %1 = load i32, i32* %data, align 4, !dbg !29
  %cmp = icmp slt i32 %1, 10, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !33
  %idxprom = sext i32 %2 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !35
  store i32 1, i32* %arrayidx, align 4, !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !40
  %cmp14 = icmp slt i32 %3, 10, !dbg !42
  br i1 %cmp14, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !44
  %idxprom15 = sext i32 %4 to i64, !dbg !46
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom15, !dbg !46
  %5 = load i32, i32* %arrayidx16, align 4, !dbg !46
  call void @printIntLine(i32 %5), !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %6, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !54

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !55
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !57
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_rand_15_good() #0 !dbg !58 {
entry:
  call void @goodB2G1(), !dbg !59
  call void @goodB2G2(), !dbg !60
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #5, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #5, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @CWE124_Buffer_Underwrite__CWE839_rand_15_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__CWE839_rand_15_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !84 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 -1, i32* %data, align 4, !dbg !87
  %call = call i32 @rand() #5, !dbg !88
  %and = and i32 %call, 1, !dbg !88
  %tobool = icmp ne i32 %and, 0, !dbg !88
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !88

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !88
  %shl = shl i32 %call1, 30, !dbg !88
  %call2 = call i32 @rand() #5, !dbg !88
  %shl3 = shl i32 %call2, 15, !dbg !88
  %xor = xor i32 %shl, %shl3, !dbg !88
  %call4 = call i32 @rand() #5, !dbg !88
  %xor5 = xor i32 %xor, %call4, !dbg !88
  br label %cond.end, !dbg !88

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !88
  %shl7 = shl i32 %call6, 30, !dbg !88
  %call8 = call i32 @rand() #5, !dbg !88
  %shl9 = shl i32 %call8, 15, !dbg !88
  %xor10 = xor i32 %shl7, %shl9, !dbg !88
  %call11 = call i32 @rand() #5, !dbg !88
  %xor12 = xor i32 %xor10, %call11, !dbg !88
  %sub = sub i32 0, %xor12, !dbg !88
  %sub13 = sub i32 %sub, 1, !dbg !88
  br label %cond.end, !dbg !88

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !88
  store i32 %cond, i32* %data, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata i32* %i, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !94
  %1 = load i32, i32* %data, align 4, !dbg !95
  %cmp = icmp sge i32 %1, 0, !dbg !97
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !98

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !99
  %cmp14 = icmp slt i32 %2, 10, !dbg !100
  br i1 %cmp14, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !102
  %idxprom = sext i32 %3 to i64, !dbg !104
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !104
  store i32 1, i32* %arrayidx, align 4, !dbg !105
  store i32 0, i32* %i, align 4, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !109
  %cmp15 = icmp slt i32 %4, 10, !dbg !111
  br i1 %cmp15, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !113
  %idxprom16 = sext i32 %5 to i64, !dbg !115
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom16, !dbg !115
  %6 = load i32, i32* %arrayidx17, align 4, !dbg !115
  call void @printIntLine(i32 %6), !dbg !116
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !118
  %inc = add nsw i32 %7, 1, !dbg !118
  store i32 %inc, i32* %i, align 4, !dbg !118
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !122

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !126 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 -1, i32* %data, align 4, !dbg !129
  %call = call i32 @rand() #5, !dbg !130
  %and = and i32 %call, 1, !dbg !130
  %tobool = icmp ne i32 %and, 0, !dbg !130
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !130

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !130
  %shl = shl i32 %call1, 30, !dbg !130
  %call2 = call i32 @rand() #5, !dbg !130
  %shl3 = shl i32 %call2, 15, !dbg !130
  %xor = xor i32 %shl, %shl3, !dbg !130
  %call4 = call i32 @rand() #5, !dbg !130
  %xor5 = xor i32 %xor, %call4, !dbg !130
  br label %cond.end, !dbg !130

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !130
  %shl7 = shl i32 %call6, 30, !dbg !130
  %call8 = call i32 @rand() #5, !dbg !130
  %shl9 = shl i32 %call8, 15, !dbg !130
  %xor10 = xor i32 %shl7, %shl9, !dbg !130
  %call11 = call i32 @rand() #5, !dbg !130
  %xor12 = xor i32 %xor10, %call11, !dbg !130
  %sub = sub i32 0, %xor12, !dbg !130
  %sub13 = sub i32 %sub, 1, !dbg !130
  br label %cond.end, !dbg !130

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !130
  store i32 %cond, i32* %data, align 4, !dbg !131
  call void @llvm.dbg.declare(metadata i32* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !135, metadata !DIExpression()), !dbg !136
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !136
  %1 = load i32, i32* %data, align 4, !dbg !137
  %cmp = icmp sge i32 %1, 0, !dbg !139
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !140

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !141
  %cmp14 = icmp slt i32 %2, 10, !dbg !142
  br i1 %cmp14, label %if.then, label %if.else, !dbg !143

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !144
  %idxprom = sext i32 %3 to i64, !dbg !146
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !146
  store i32 1, i32* %arrayidx, align 4, !dbg !147
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !151
  %cmp15 = icmp slt i32 %4, 10, !dbg !153
  br i1 %cmp15, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !155
  %idxprom16 = sext i32 %5 to i64, !dbg !157
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom16, !dbg !157
  %6 = load i32, i32* %arrayidx17, align 4, !dbg !157
  call void @printIntLine(i32 %6), !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !160
  %inc = add nsw i32 %7, 1, !dbg !160
  store i32 %inc, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !164

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !165
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !167
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !168 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !169, metadata !DIExpression()), !dbg !170
  store i32 -1, i32* %data, align 4, !dbg !171
  store i32 7, i32* %data, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata i32* %i, metadata !173, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !176, metadata !DIExpression()), !dbg !177
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !177
  %1 = load i32, i32* %data, align 4, !dbg !178
  %cmp = icmp slt i32 %1, 10, !dbg !180
  br i1 %cmp, label %if.then, label %if.else, !dbg !181

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !182
  %idxprom = sext i32 %2 to i64, !dbg !184
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !184
  store i32 1, i32* %arrayidx, align 4, !dbg !185
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !189
  %cmp1 = icmp slt i32 %3, 10, !dbg !191
  br i1 %cmp1, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !193
  %idxprom2 = sext i32 %4 to i64, !dbg !195
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !195
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !195
  call void @printIntLine(i32 %5), !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !198
  %inc = add nsw i32 %6, 1, !dbg !198
  store i32 %inc, i32* %i, align 4, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !202

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !203
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !205
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !206 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 -1, i32* %data, align 4, !dbg !209
  store i32 7, i32* %data, align 4, !dbg !210
  call void @llvm.dbg.declare(metadata i32* %i, metadata !211, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !214, metadata !DIExpression()), !dbg !215
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !215
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !215
  %1 = load i32, i32* %data, align 4, !dbg !216
  %cmp = icmp slt i32 %1, 10, !dbg !218
  br i1 %cmp, label %if.then, label %if.else, !dbg !219

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !220
  %idxprom = sext i32 %2 to i64, !dbg !222
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !222
  store i32 1, i32* %arrayidx, align 4, !dbg !223
  store i32 0, i32* %i, align 4, !dbg !224
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !227
  %cmp1 = icmp slt i32 %3, 10, !dbg !229
  br i1 %cmp1, label %for.body, label %for.end, !dbg !230

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !231
  %idxprom2 = sext i32 %4 to i64, !dbg !233
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !233
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !233
  call void @printIntLine(i32 %5), !dbg !234
  br label %for.inc, !dbg !235

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !236
  %inc = add nsw i32 %6, 1, !dbg !236
  store i32 %inc, i32* %i, align 4, !dbg !236
  br label %for.cond, !dbg !237, !llvm.loop !238

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !240

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !241
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !243
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_15_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_rand_15.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 31, column: 16, scope: !12)
!20 = !DILocation(line: 31, column: 14, scope: !12)
!21 = !DILocalVariable(name: "i", scope: !22, file: !13, line: 42, type: !4)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 41, column: 5)
!23 = !DILocation(line: 42, column: 13, scope: !22)
!24 = !DILocalVariable(name: "buffer", scope: !22, file: !13, line: 43, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 43, column: 13, scope: !22)
!29 = !DILocation(line: 46, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !13, line: 46, column: 13)
!31 = !DILocation(line: 46, column: 18, scope: !30)
!32 = !DILocation(line: 46, column: 13, scope: !22)
!33 = !DILocation(line: 48, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !13, line: 47, column: 9)
!35 = !DILocation(line: 48, column: 13, scope: !34)
!36 = !DILocation(line: 48, column: 26, scope: !34)
!37 = !DILocation(line: 50, column: 19, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 50, column: 13)
!39 = !DILocation(line: 50, column: 17, scope: !38)
!40 = !DILocation(line: 50, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !13, line: 50, column: 13)
!42 = !DILocation(line: 50, column: 26, scope: !41)
!43 = !DILocation(line: 50, column: 13, scope: !38)
!44 = !DILocation(line: 52, column: 37, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !13, line: 51, column: 13)
!46 = !DILocation(line: 52, column: 30, scope: !45)
!47 = !DILocation(line: 52, column: 17, scope: !45)
!48 = !DILocation(line: 53, column: 13, scope: !45)
!49 = !DILocation(line: 50, column: 33, scope: !41)
!50 = !DILocation(line: 50, column: 13, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 53, column: 13, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 54, column: 9, scope: !34)
!55 = !DILocation(line: 57, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !30, file: !13, line: 56, column: 9)
!57 = !DILocation(line: 66, column: 1, scope: !12)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_rand_15_good", scope: !13, file: !13, line: 260, type: !14, scopeLine: 261, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 262, column: 5, scope: !58)
!60 = !DILocation(line: 263, column: 5, scope: !58)
!61 = !DILocation(line: 264, column: 5, scope: !58)
!62 = !DILocation(line: 265, column: 5, scope: !58)
!63 = !DILocation(line: 266, column: 1, scope: !58)
!64 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 277, type: !65, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!4, !4, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !13, line: 277, type: !4)
!71 = !DILocation(line: 277, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !13, line: 277, type: !67)
!73 = !DILocation(line: 277, column: 27, scope: !64)
!74 = !DILocation(line: 280, column: 22, scope: !64)
!75 = !DILocation(line: 280, column: 12, scope: !64)
!76 = !DILocation(line: 280, column: 5, scope: !64)
!77 = !DILocation(line: 282, column: 5, scope: !64)
!78 = !DILocation(line: 283, column: 5, scope: !64)
!79 = !DILocation(line: 284, column: 5, scope: !64)
!80 = !DILocation(line: 287, column: 5, scope: !64)
!81 = !DILocation(line: 288, column: 5, scope: !64)
!82 = !DILocation(line: 289, column: 5, scope: !64)
!83 = !DILocation(line: 291, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 73, type: !14, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !13, line: 75, type: !4)
!86 = !DILocation(line: 75, column: 9, scope: !84)
!87 = !DILocation(line: 77, column: 10, scope: !84)
!88 = !DILocation(line: 82, column: 16, scope: !84)
!89 = !DILocation(line: 82, column: 14, scope: !84)
!90 = !DILocalVariable(name: "i", scope: !91, file: !13, line: 97, type: !4)
!91 = distinct !DILexicalBlock(scope: !84, file: !13, line: 96, column: 5)
!92 = !DILocation(line: 97, column: 13, scope: !91)
!93 = !DILocalVariable(name: "buffer", scope: !91, file: !13, line: 98, type: !25)
!94 = !DILocation(line: 98, column: 13, scope: !91)
!95 = !DILocation(line: 100, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !13, line: 100, column: 13)
!97 = !DILocation(line: 100, column: 18, scope: !96)
!98 = !DILocation(line: 100, column: 23, scope: !96)
!99 = !DILocation(line: 100, column: 26, scope: !96)
!100 = !DILocation(line: 100, column: 31, scope: !96)
!101 = !DILocation(line: 100, column: 13, scope: !91)
!102 = !DILocation(line: 102, column: 20, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !13, line: 101, column: 9)
!104 = !DILocation(line: 102, column: 13, scope: !103)
!105 = !DILocation(line: 102, column: 26, scope: !103)
!106 = !DILocation(line: 104, column: 19, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !13, line: 104, column: 13)
!108 = !DILocation(line: 104, column: 17, scope: !107)
!109 = !DILocation(line: 104, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !13, line: 104, column: 13)
!111 = !DILocation(line: 104, column: 26, scope: !110)
!112 = !DILocation(line: 104, column: 13, scope: !107)
!113 = !DILocation(line: 106, column: 37, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !13, line: 105, column: 13)
!115 = !DILocation(line: 106, column: 30, scope: !114)
!116 = !DILocation(line: 106, column: 17, scope: !114)
!117 = !DILocation(line: 107, column: 13, scope: !114)
!118 = !DILocation(line: 104, column: 33, scope: !110)
!119 = !DILocation(line: 104, column: 13, scope: !110)
!120 = distinct !{!120, !112, !121, !53}
!121 = !DILocation(line: 107, column: 13, scope: !107)
!122 = !DILocation(line: 108, column: 9, scope: !103)
!123 = !DILocation(line: 111, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !96, file: !13, line: 110, column: 9)
!125 = !DILocation(line: 116, column: 1, scope: !84)
!126 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 119, type: !14, scopeLine: 120, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", scope: !126, file: !13, line: 121, type: !4)
!128 = !DILocation(line: 121, column: 9, scope: !126)
!129 = !DILocation(line: 123, column: 10, scope: !126)
!130 = !DILocation(line: 128, column: 16, scope: !126)
!131 = !DILocation(line: 128, column: 14, scope: !126)
!132 = !DILocalVariable(name: "i", scope: !133, file: !13, line: 139, type: !4)
!133 = distinct !DILexicalBlock(scope: !126, file: !13, line: 138, column: 5)
!134 = !DILocation(line: 139, column: 13, scope: !133)
!135 = !DILocalVariable(name: "buffer", scope: !133, file: !13, line: 140, type: !25)
!136 = !DILocation(line: 140, column: 13, scope: !133)
!137 = !DILocation(line: 142, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !13, line: 142, column: 13)
!139 = !DILocation(line: 142, column: 18, scope: !138)
!140 = !DILocation(line: 142, column: 23, scope: !138)
!141 = !DILocation(line: 142, column: 26, scope: !138)
!142 = !DILocation(line: 142, column: 31, scope: !138)
!143 = !DILocation(line: 142, column: 13, scope: !133)
!144 = !DILocation(line: 144, column: 20, scope: !145)
!145 = distinct !DILexicalBlock(scope: !138, file: !13, line: 143, column: 9)
!146 = !DILocation(line: 144, column: 13, scope: !145)
!147 = !DILocation(line: 144, column: 26, scope: !145)
!148 = !DILocation(line: 146, column: 19, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !13, line: 146, column: 13)
!150 = !DILocation(line: 146, column: 17, scope: !149)
!151 = !DILocation(line: 146, column: 24, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !13, line: 146, column: 13)
!153 = !DILocation(line: 146, column: 26, scope: !152)
!154 = !DILocation(line: 146, column: 13, scope: !149)
!155 = !DILocation(line: 148, column: 37, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !13, line: 147, column: 13)
!157 = !DILocation(line: 148, column: 30, scope: !156)
!158 = !DILocation(line: 148, column: 17, scope: !156)
!159 = !DILocation(line: 149, column: 13, scope: !156)
!160 = !DILocation(line: 146, column: 33, scope: !152)
!161 = !DILocation(line: 146, column: 13, scope: !152)
!162 = distinct !{!162, !154, !163, !53}
!163 = !DILocation(line: 149, column: 13, scope: !149)
!164 = !DILocation(line: 150, column: 9, scope: !145)
!165 = !DILocation(line: 153, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !138, file: !13, line: 152, column: 9)
!167 = !DILocation(line: 162, column: 1, scope: !126)
!168 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 165, type: !14, scopeLine: 166, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!169 = !DILocalVariable(name: "data", scope: !168, file: !13, line: 167, type: !4)
!170 = !DILocation(line: 167, column: 9, scope: !168)
!171 = !DILocation(line: 169, column: 10, scope: !168)
!172 = !DILocation(line: 179, column: 14, scope: !168)
!173 = !DILocalVariable(name: "i", scope: !174, file: !13, line: 186, type: !4)
!174 = distinct !DILexicalBlock(scope: !168, file: !13, line: 185, column: 5)
!175 = !DILocation(line: 186, column: 13, scope: !174)
!176 = !DILocalVariable(name: "buffer", scope: !174, file: !13, line: 187, type: !25)
!177 = !DILocation(line: 187, column: 13, scope: !174)
!178 = !DILocation(line: 190, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !174, file: !13, line: 190, column: 13)
!180 = !DILocation(line: 190, column: 18, scope: !179)
!181 = !DILocation(line: 190, column: 13, scope: !174)
!182 = !DILocation(line: 192, column: 20, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !13, line: 191, column: 9)
!184 = !DILocation(line: 192, column: 13, scope: !183)
!185 = !DILocation(line: 192, column: 26, scope: !183)
!186 = !DILocation(line: 194, column: 19, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !13, line: 194, column: 13)
!188 = !DILocation(line: 194, column: 17, scope: !187)
!189 = !DILocation(line: 194, column: 24, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !13, line: 194, column: 13)
!191 = !DILocation(line: 194, column: 26, scope: !190)
!192 = !DILocation(line: 194, column: 13, scope: !187)
!193 = !DILocation(line: 196, column: 37, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !13, line: 195, column: 13)
!195 = !DILocation(line: 196, column: 30, scope: !194)
!196 = !DILocation(line: 196, column: 17, scope: !194)
!197 = !DILocation(line: 197, column: 13, scope: !194)
!198 = !DILocation(line: 194, column: 33, scope: !190)
!199 = !DILocation(line: 194, column: 13, scope: !190)
!200 = distinct !{!200, !192, !201, !53}
!201 = !DILocation(line: 197, column: 13, scope: !187)
!202 = !DILocation(line: 198, column: 9, scope: !183)
!203 = !DILocation(line: 201, column: 13, scope: !204)
!204 = distinct !DILexicalBlock(scope: !179, file: !13, line: 200, column: 9)
!205 = !DILocation(line: 210, column: 1, scope: !168)
!206 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 213, type: !14, scopeLine: 214, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!207 = !DILocalVariable(name: "data", scope: !206, file: !13, line: 215, type: !4)
!208 = !DILocation(line: 215, column: 9, scope: !206)
!209 = !DILocation(line: 217, column: 10, scope: !206)
!210 = !DILocation(line: 223, column: 14, scope: !206)
!211 = !DILocalVariable(name: "i", scope: !212, file: !13, line: 234, type: !4)
!212 = distinct !DILexicalBlock(scope: !206, file: !13, line: 233, column: 5)
!213 = !DILocation(line: 234, column: 13, scope: !212)
!214 = !DILocalVariable(name: "buffer", scope: !212, file: !13, line: 235, type: !25)
!215 = !DILocation(line: 235, column: 13, scope: !212)
!216 = !DILocation(line: 238, column: 13, scope: !217)
!217 = distinct !DILexicalBlock(scope: !212, file: !13, line: 238, column: 13)
!218 = !DILocation(line: 238, column: 18, scope: !217)
!219 = !DILocation(line: 238, column: 13, scope: !212)
!220 = !DILocation(line: 240, column: 20, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !13, line: 239, column: 9)
!222 = !DILocation(line: 240, column: 13, scope: !221)
!223 = !DILocation(line: 240, column: 26, scope: !221)
!224 = !DILocation(line: 242, column: 19, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !13, line: 242, column: 13)
!226 = !DILocation(line: 242, column: 17, scope: !225)
!227 = !DILocation(line: 242, column: 24, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !13, line: 242, column: 13)
!229 = !DILocation(line: 242, column: 26, scope: !228)
!230 = !DILocation(line: 242, column: 13, scope: !225)
!231 = !DILocation(line: 244, column: 37, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !13, line: 243, column: 13)
!233 = !DILocation(line: 244, column: 30, scope: !232)
!234 = !DILocation(line: 244, column: 17, scope: !232)
!235 = !DILocation(line: 245, column: 13, scope: !232)
!236 = !DILocation(line: 242, column: 33, scope: !228)
!237 = !DILocation(line: 242, column: 13, scope: !228)
!238 = distinct !{!238, !230, !239, !53}
!239 = !DILocation(line: 245, column: 13, scope: !225)
!240 = !DILocation(line: 246, column: 9, scope: !221)
!241 = !DILocation(line: 249, column: 13, scope: !242)
!242 = distinct !DILexicalBlock(scope: !217, file: !13, line: 248, column: 9)
!243 = !DILocation(line: 258, column: 1, scope: !206)
