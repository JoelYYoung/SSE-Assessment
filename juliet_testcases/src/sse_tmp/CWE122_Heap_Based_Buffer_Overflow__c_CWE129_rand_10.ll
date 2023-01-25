; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* @globalTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !24
  %and = and i32 %call, 1, !dbg !24
  %tobool1 = icmp ne i32 %and, 0, !dbg !24
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !24

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand() #5, !dbg !24
  %shl = shl i32 %call2, 30, !dbg !24
  %call3 = call i32 @rand() #5, !dbg !24
  %shl4 = shl i32 %call3, 15, !dbg !24
  %xor = xor i32 %shl, %shl4, !dbg !24
  %call5 = call i32 @rand() #5, !dbg !24
  %xor6 = xor i32 %xor, %call5, !dbg !24
  br label %cond.end, !dbg !24

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand() #5, !dbg !24
  %shl8 = shl i32 %call7, 30, !dbg !24
  %call9 = call i32 @rand() #5, !dbg !24
  %shl10 = shl i32 %call9, 15, !dbg !24
  %xor11 = xor i32 %shl8, %shl10, !dbg !24
  %call12 = call i32 @rand() #5, !dbg !24
  %xor13 = xor i32 %xor11, %call12, !dbg !24
  %sub = sub i32 0, %xor13, !dbg !24
  %sub14 = sub i32 %sub, 1, !dbg !24
  br label %cond.end, !dbg !24

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !24
  store i32 %cond, i32* %data, align 4, !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !28
  %tobool15 = icmp ne i32 %1, 0, !dbg !28
  br i1 %tobool15, label %if.then16, label %if.end34, !dbg !30

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !35, metadata !DIExpression()), !dbg !36
  %call17 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !37
  %2 = bitcast i8* %call17 to i32*, !dbg !38
  store i32* %2, i32** %buffer, align 8, !dbg !36
  %3 = load i32*, i32** %buffer, align 8, !dbg !39
  %cmp = icmp eq i32* %3, null, !dbg !41
  br i1 %cmp, label %if.then18, label %if.end19, !dbg !42

if.then18:                                        ; preds = %if.then16
  call void @exit(i32 -1) #6, !dbg !43
  unreachable, !dbg !43

if.end19:                                         ; preds = %if.then16
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end19
  %4 = load i32, i32* %i, align 4, !dbg !48
  %cmp20 = icmp slt i32 %4, 10, !dbg !50
  br i1 %cmp20, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !52
  %6 = load i32, i32* %i, align 4, !dbg !54
  %idxprom = sext i32 %6 to i64, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !52
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %7, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !62
  %cmp21 = icmp sge i32 %8, 0, !dbg !64
  br i1 %cmp21, label %if.then22, label %if.else, !dbg !65

if.then22:                                        ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !66
  %10 = load i32, i32* %data, align 4, !dbg !68
  %idxprom23 = sext i32 %10 to i64, !dbg !66
  %arrayidx24 = getelementptr inbounds i32, i32* %9, i64 %idxprom23, !dbg !66
  store i32 1, i32* %arrayidx24, align 4, !dbg !69
  store i32 0, i32* %i, align 4, !dbg !70
  br label %for.cond25, !dbg !72

for.cond25:                                       ; preds = %for.inc30, %if.then22
  %11 = load i32, i32* %i, align 4, !dbg !73
  %cmp26 = icmp slt i32 %11, 10, !dbg !75
  br i1 %cmp26, label %for.body27, label %for.end32, !dbg !76

for.body27:                                       ; preds = %for.cond25
  %12 = load i32*, i32** %buffer, align 8, !dbg !77
  %13 = load i32, i32* %i, align 4, !dbg !79
  %idxprom28 = sext i32 %13 to i64, !dbg !77
  %arrayidx29 = getelementptr inbounds i32, i32* %12, i64 %idxprom28, !dbg !77
  %14 = load i32, i32* %arrayidx29, align 4, !dbg !77
  call void @printIntLine(i32 %14), !dbg !80
  br label %for.inc30, !dbg !81

for.inc30:                                        ; preds = %for.body27
  %15 = load i32, i32* %i, align 4, !dbg !82
  %inc31 = add nsw i32 %15, 1, !dbg !82
  store i32 %inc31, i32* %i, align 4, !dbg !82
  br label %for.cond25, !dbg !83, !llvm.loop !84

for.end32:                                        ; preds = %for.cond25
  br label %if.end33, !dbg !86

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !87
  br label %if.end33

if.end33:                                         ; preds = %if.else, %for.end32
  %16 = load i32*, i32** %buffer, align 8, !dbg !89
  %17 = bitcast i32* %16 to i8*, !dbg !89
  call void @free(i8* %17) #5, !dbg !90
  br label %if.end34, !dbg !91

if.end34:                                         ; preds = %if.end33, %if.end
  ret void, !dbg !92
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10_good() #0 !dbg !93 {
entry:
  call void @goodB2G1(), !dbg !94
  call void @goodB2G2(), !dbg !95
  call void @goodG2B1(), !dbg !96
  call void @goodG2B2(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* null) #5, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 %conv) #5, !dbg !111
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10_good(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10_bad(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !119 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i32 -1, i32* %data, align 4, !dbg !122
  %0 = load i32, i32* @globalTrue, align 4, !dbg !123
  %tobool = icmp ne i32 %0, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !126
  %and = and i32 %call, 1, !dbg !126
  %tobool1 = icmp ne i32 %and, 0, !dbg !126
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !126

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand() #5, !dbg !126
  %shl = shl i32 %call2, 30, !dbg !126
  %call3 = call i32 @rand() #5, !dbg !126
  %shl4 = shl i32 %call3, 15, !dbg !126
  %xor = xor i32 %shl, %shl4, !dbg !126
  %call5 = call i32 @rand() #5, !dbg !126
  %xor6 = xor i32 %xor, %call5, !dbg !126
  br label %cond.end, !dbg !126

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand() #5, !dbg !126
  %shl8 = shl i32 %call7, 30, !dbg !126
  %call9 = call i32 @rand() #5, !dbg !126
  %shl10 = shl i32 %call9, 15, !dbg !126
  %xor11 = xor i32 %shl8, %shl10, !dbg !126
  %call12 = call i32 @rand() #5, !dbg !126
  %xor13 = xor i32 %xor11, %call12, !dbg !126
  %sub = sub i32 0, %xor13, !dbg !126
  %sub14 = sub i32 %sub, 1, !dbg !126
  br label %cond.end, !dbg !126

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !126
  store i32 %cond, i32* %data, align 4, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @globalFalse, align 4, !dbg !130
  %tobool15 = icmp ne i32 %1, 0, !dbg !130
  br i1 %tobool15, label %if.then16, label %if.else, !dbg !132

if.then16:                                        ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !133
  br label %if.end36, !dbg !135

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !136, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !140, metadata !DIExpression()), !dbg !141
  %call17 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !142
  %2 = bitcast i8* %call17 to i32*, !dbg !143
  store i32* %2, i32** %buffer, align 8, !dbg !141
  %3 = load i32*, i32** %buffer, align 8, !dbg !144
  %cmp = icmp eq i32* %3, null, !dbg !146
  br i1 %cmp, label %if.then18, label %if.end19, !dbg !147

if.then18:                                        ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !148
  unreachable, !dbg !148

if.end19:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end19
  %4 = load i32, i32* %i, align 4, !dbg !153
  %cmp20 = icmp slt i32 %4, 10, !dbg !155
  br i1 %cmp20, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !157
  %6 = load i32, i32* %i, align 4, !dbg !159
  %idxprom = sext i32 %6 to i64, !dbg !157
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !157
  store i32 0, i32* %arrayidx, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !162
  %inc = add nsw i32 %7, 1, !dbg !162
  store i32 %inc, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !166
  %cmp21 = icmp sge i32 %8, 0, !dbg !168
  br i1 %cmp21, label %land.lhs.true, label %if.else34, !dbg !169

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !170
  %cmp22 = icmp slt i32 %9, 10, !dbg !171
  br i1 %cmp22, label %if.then23, label %if.else34, !dbg !172

if.then23:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !173
  %11 = load i32, i32* %data, align 4, !dbg !175
  %idxprom24 = sext i32 %11 to i64, !dbg !173
  %arrayidx25 = getelementptr inbounds i32, i32* %10, i64 %idxprom24, !dbg !173
  store i32 1, i32* %arrayidx25, align 4, !dbg !176
  store i32 0, i32* %i, align 4, !dbg !177
  br label %for.cond26, !dbg !179

for.cond26:                                       ; preds = %for.inc31, %if.then23
  %12 = load i32, i32* %i, align 4, !dbg !180
  %cmp27 = icmp slt i32 %12, 10, !dbg !182
  br i1 %cmp27, label %for.body28, label %for.end33, !dbg !183

for.body28:                                       ; preds = %for.cond26
  %13 = load i32*, i32** %buffer, align 8, !dbg !184
  %14 = load i32, i32* %i, align 4, !dbg !186
  %idxprom29 = sext i32 %14 to i64, !dbg !184
  %arrayidx30 = getelementptr inbounds i32, i32* %13, i64 %idxprom29, !dbg !184
  %15 = load i32, i32* %arrayidx30, align 4, !dbg !184
  call void @printIntLine(i32 %15), !dbg !187
  br label %for.inc31, !dbg !188

for.inc31:                                        ; preds = %for.body28
  %16 = load i32, i32* %i, align 4, !dbg !189
  %inc32 = add nsw i32 %16, 1, !dbg !189
  store i32 %inc32, i32* %i, align 4, !dbg !189
  br label %for.cond26, !dbg !190, !llvm.loop !191

for.end33:                                        ; preds = %for.cond26
  br label %if.end35, !dbg !193

if.else34:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !194
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %for.end33
  %17 = load i32*, i32** %buffer, align 8, !dbg !196
  %18 = bitcast i32* %17 to i8*, !dbg !196
  call void @free(i8* %18) #5, !dbg !197
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then16
  ret void, !dbg !198
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !199 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !200, metadata !DIExpression()), !dbg !201
  store i32 -1, i32* %data, align 4, !dbg !202
  %0 = load i32, i32* @globalTrue, align 4, !dbg !203
  %tobool = icmp ne i32 %0, 0, !dbg !203
  br i1 %tobool, label %if.then, label %if.end, !dbg !205

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !206
  %and = and i32 %call, 1, !dbg !206
  %tobool1 = icmp ne i32 %and, 0, !dbg !206
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !206

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand() #5, !dbg !206
  %shl = shl i32 %call2, 30, !dbg !206
  %call3 = call i32 @rand() #5, !dbg !206
  %shl4 = shl i32 %call3, 15, !dbg !206
  %xor = xor i32 %shl, %shl4, !dbg !206
  %call5 = call i32 @rand() #5, !dbg !206
  %xor6 = xor i32 %xor, %call5, !dbg !206
  br label %cond.end, !dbg !206

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand() #5, !dbg !206
  %shl8 = shl i32 %call7, 30, !dbg !206
  %call9 = call i32 @rand() #5, !dbg !206
  %shl10 = shl i32 %call9, 15, !dbg !206
  %xor11 = xor i32 %shl8, %shl10, !dbg !206
  %call12 = call i32 @rand() #5, !dbg !206
  %xor13 = xor i32 %xor11, %call12, !dbg !206
  %sub = sub i32 0, %xor13, !dbg !206
  %sub14 = sub i32 %sub, 1, !dbg !206
  br label %cond.end, !dbg !206

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !206
  store i32 %cond, i32* %data, align 4, !dbg !208
  br label %if.end, !dbg !209

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !210
  %tobool15 = icmp ne i32 %1, 0, !dbg !210
  br i1 %tobool15, label %if.then16, label %if.end35, !dbg !212

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !213, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !217, metadata !DIExpression()), !dbg !218
  %call17 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !219
  %2 = bitcast i8* %call17 to i32*, !dbg !220
  store i32* %2, i32** %buffer, align 8, !dbg !218
  %3 = load i32*, i32** %buffer, align 8, !dbg !221
  %cmp = icmp eq i32* %3, null, !dbg !223
  br i1 %cmp, label %if.then18, label %if.end19, !dbg !224

if.then18:                                        ; preds = %if.then16
  call void @exit(i32 -1) #6, !dbg !225
  unreachable, !dbg !225

if.end19:                                         ; preds = %if.then16
  store i32 0, i32* %i, align 4, !dbg !227
  br label %for.cond, !dbg !229

for.cond:                                         ; preds = %for.inc, %if.end19
  %4 = load i32, i32* %i, align 4, !dbg !230
  %cmp20 = icmp slt i32 %4, 10, !dbg !232
  br i1 %cmp20, label %for.body, label %for.end, !dbg !233

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !234
  %6 = load i32, i32* %i, align 4, !dbg !236
  %idxprom = sext i32 %6 to i64, !dbg !234
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !234
  store i32 0, i32* %arrayidx, align 4, !dbg !237
  br label %for.inc, !dbg !238

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !239
  %inc = add nsw i32 %7, 1, !dbg !239
  store i32 %inc, i32* %i, align 4, !dbg !239
  br label %for.cond, !dbg !240, !llvm.loop !241

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !243
  %cmp21 = icmp sge i32 %8, 0, !dbg !245
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !246

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !247
  %cmp22 = icmp slt i32 %9, 10, !dbg !248
  br i1 %cmp22, label %if.then23, label %if.else, !dbg !249

if.then23:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !250
  %11 = load i32, i32* %data, align 4, !dbg !252
  %idxprom24 = sext i32 %11 to i64, !dbg !250
  %arrayidx25 = getelementptr inbounds i32, i32* %10, i64 %idxprom24, !dbg !250
  store i32 1, i32* %arrayidx25, align 4, !dbg !253
  store i32 0, i32* %i, align 4, !dbg !254
  br label %for.cond26, !dbg !256

for.cond26:                                       ; preds = %for.inc31, %if.then23
  %12 = load i32, i32* %i, align 4, !dbg !257
  %cmp27 = icmp slt i32 %12, 10, !dbg !259
  br i1 %cmp27, label %for.body28, label %for.end33, !dbg !260

for.body28:                                       ; preds = %for.cond26
  %13 = load i32*, i32** %buffer, align 8, !dbg !261
  %14 = load i32, i32* %i, align 4, !dbg !263
  %idxprom29 = sext i32 %14 to i64, !dbg !261
  %arrayidx30 = getelementptr inbounds i32, i32* %13, i64 %idxprom29, !dbg !261
  %15 = load i32, i32* %arrayidx30, align 4, !dbg !261
  call void @printIntLine(i32 %15), !dbg !264
  br label %for.inc31, !dbg !265

for.inc31:                                        ; preds = %for.body28
  %16 = load i32, i32* %i, align 4, !dbg !266
  %inc32 = add nsw i32 %16, 1, !dbg !266
  store i32 %inc32, i32* %i, align 4, !dbg !266
  br label %for.cond26, !dbg !267, !llvm.loop !268

for.end33:                                        ; preds = %for.cond26
  br label %if.end34, !dbg !270

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !271
  br label %if.end34

if.end34:                                         ; preds = %if.else, %for.end33
  %17 = load i32*, i32** %buffer, align 8, !dbg !273
  %18 = bitcast i32* %17 to i8*, !dbg !273
  call void @free(i8* %18) #5, !dbg !274
  br label %if.end35, !dbg !275

if.end35:                                         ; preds = %if.end34, %if.end
  ret void, !dbg !276
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !277 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !278, metadata !DIExpression()), !dbg !279
  store i32 -1, i32* %data, align 4, !dbg !280
  %0 = load i32, i32* @globalFalse, align 4, !dbg !281
  %tobool = icmp ne i32 %0, 0, !dbg !281
  br i1 %tobool, label %if.then, label %if.else, !dbg !283

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !284
  br label %if.end, !dbg !286

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !287
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalTrue, align 4, !dbg !289
  %tobool1 = icmp ne i32 %1, 0, !dbg !289
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !291

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !292, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !296, metadata !DIExpression()), !dbg !297
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !298
  %2 = bitcast i8* %call to i32*, !dbg !299
  store i32* %2, i32** %buffer, align 8, !dbg !297
  %3 = load i32*, i32** %buffer, align 8, !dbg !300
  %cmp = icmp eq i32* %3, null, !dbg !302
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !303

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !304
  unreachable, !dbg !304

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !306
  br label %for.cond, !dbg !308

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !309
  %cmp5 = icmp slt i32 %4, 10, !dbg !311
  br i1 %cmp5, label %for.body, label %for.end, !dbg !312

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !313
  %6 = load i32, i32* %i, align 4, !dbg !315
  %idxprom = sext i32 %6 to i64, !dbg !313
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !313
  store i32 0, i32* %arrayidx, align 4, !dbg !316
  br label %for.inc, !dbg !317

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !318
  %inc = add nsw i32 %7, 1, !dbg !318
  store i32 %inc, i32* %i, align 4, !dbg !318
  br label %for.cond, !dbg !319, !llvm.loop !320

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !322
  %cmp6 = icmp sge i32 %8, 0, !dbg !324
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !325

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !326
  %10 = load i32, i32* %data, align 4, !dbg !328
  %idxprom8 = sext i32 %10 to i64, !dbg !326
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !326
  store i32 1, i32* %arrayidx9, align 4, !dbg !329
  store i32 0, i32* %i, align 4, !dbg !330
  br label %for.cond10, !dbg !332

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !333
  %cmp11 = icmp slt i32 %11, 10, !dbg !335
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !336

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !337
  %13 = load i32, i32* %i, align 4, !dbg !339
  %idxprom13 = sext i32 %13 to i64, !dbg !337
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !337
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !337
  call void @printIntLine(i32 %14), !dbg !340
  br label %for.inc15, !dbg !341

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !342
  %inc16 = add nsw i32 %15, 1, !dbg !342
  store i32 %inc16, i32* %i, align 4, !dbg !342
  br label %for.cond10, !dbg !343, !llvm.loop !344

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !346

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !347
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !349
  %17 = bitcast i32* %16 to i8*, !dbg !349
  call void @free(i8* %17) #5, !dbg !350
  br label %if.end20, !dbg !351

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !352
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !353 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !354, metadata !DIExpression()), !dbg !355
  store i32 -1, i32* %data, align 4, !dbg !356
  %0 = load i32, i32* @globalTrue, align 4, !dbg !357
  %tobool = icmp ne i32 %0, 0, !dbg !357
  br i1 %tobool, label %if.then, label %if.end, !dbg !359

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !360
  br label %if.end, !dbg !362

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !363
  %tobool1 = icmp ne i32 %1, 0, !dbg !363
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !365

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !366, metadata !DIExpression()), !dbg !369
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !370, metadata !DIExpression()), !dbg !371
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !372
  %2 = bitcast i8* %call to i32*, !dbg !373
  store i32* %2, i32** %buffer, align 8, !dbg !371
  %3 = load i32*, i32** %buffer, align 8, !dbg !374
  %cmp = icmp eq i32* %3, null, !dbg !376
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !377

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !378
  unreachable, !dbg !378

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !380
  br label %for.cond, !dbg !382

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !383
  %cmp5 = icmp slt i32 %4, 10, !dbg !385
  br i1 %cmp5, label %for.body, label %for.end, !dbg !386

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !387
  %6 = load i32, i32* %i, align 4, !dbg !389
  %idxprom = sext i32 %6 to i64, !dbg !387
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !387
  store i32 0, i32* %arrayidx, align 4, !dbg !390
  br label %for.inc, !dbg !391

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !392
  %inc = add nsw i32 %7, 1, !dbg !392
  store i32 %inc, i32* %i, align 4, !dbg !392
  br label %for.cond, !dbg !393, !llvm.loop !394

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !396
  %cmp6 = icmp sge i32 %8, 0, !dbg !398
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !399

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !400
  %10 = load i32, i32* %data, align 4, !dbg !402
  %idxprom8 = sext i32 %10 to i64, !dbg !400
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !400
  store i32 1, i32* %arrayidx9, align 4, !dbg !403
  store i32 0, i32* %i, align 4, !dbg !404
  br label %for.cond10, !dbg !406

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !407
  %cmp11 = icmp slt i32 %11, 10, !dbg !409
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !410

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !411
  %13 = load i32, i32* %i, align 4, !dbg !413
  %idxprom13 = sext i32 %13 to i64, !dbg !411
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !411
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !411
  call void @printIntLine(i32 %14), !dbg !414
  br label %for.inc15, !dbg !415

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !416
  %inc16 = add nsw i32 %15, 1, !dbg !416
  store i32 %inc16, i32* %i, align 4, !dbg !416
  br label %for.cond10, !dbg !417, !llvm.loop !418

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !420

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !421
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !423
  %17 = bitcast i32* %16 to i8*, !dbg !423
  call void @free(i8* %17) #5, !dbg !424
  br label %if.end19, !dbg !425

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !426
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !6, !7}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 14, scope: !25)
!27 = !DILocation(line: 31, column: 5, scope: !25)
!28 = !DILocation(line: 32, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!30 = !DILocation(line: 32, column: 8, scope: !14)
!31 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 35, type: !4)
!32 = distinct !DILexicalBlock(scope: !33, file: !15, line: 34, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 33, column: 5)
!34 = !DILocation(line: 35, column: 17, scope: !32)
!35 = !DILocalVariable(name: "buffer", scope: !32, file: !15, line: 36, type: !6)
!36 = !DILocation(line: 36, column: 19, scope: !32)
!37 = !DILocation(line: 36, column: 35, scope: !32)
!38 = !DILocation(line: 36, column: 28, scope: !32)
!39 = !DILocation(line: 37, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !15, line: 37, column: 17)
!41 = !DILocation(line: 37, column: 24, scope: !40)
!42 = !DILocation(line: 37, column: 17, scope: !32)
!43 = !DILocation(line: 37, column: 34, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 37, column: 33)
!45 = !DILocation(line: 39, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !32, file: !15, line: 39, column: 13)
!47 = !DILocation(line: 39, column: 18, scope: !46)
!48 = !DILocation(line: 39, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 13)
!50 = !DILocation(line: 39, column: 27, scope: !49)
!51 = !DILocation(line: 39, column: 13, scope: !46)
!52 = !DILocation(line: 41, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 40, column: 13)
!54 = !DILocation(line: 41, column: 24, scope: !53)
!55 = !DILocation(line: 41, column: 27, scope: !53)
!56 = !DILocation(line: 42, column: 13, scope: !53)
!57 = !DILocation(line: 39, column: 34, scope: !49)
!58 = !DILocation(line: 39, column: 13, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 42, column: 13, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 45, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !32, file: !15, line: 45, column: 17)
!64 = !DILocation(line: 45, column: 22, scope: !63)
!65 = !DILocation(line: 45, column: 17, scope: !32)
!66 = !DILocation(line: 47, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 46, column: 13)
!68 = !DILocation(line: 47, column: 24, scope: !67)
!69 = !DILocation(line: 47, column: 30, scope: !67)
!70 = !DILocation(line: 49, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 49, column: 17)
!72 = !DILocation(line: 49, column: 21, scope: !71)
!73 = !DILocation(line: 49, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !15, line: 49, column: 17)
!75 = !DILocation(line: 49, column: 30, scope: !74)
!76 = !DILocation(line: 49, column: 17, scope: !71)
!77 = !DILocation(line: 51, column: 34, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 50, column: 17)
!79 = !DILocation(line: 51, column: 41, scope: !78)
!80 = !DILocation(line: 51, column: 21, scope: !78)
!81 = !DILocation(line: 52, column: 17, scope: !78)
!82 = !DILocation(line: 49, column: 37, scope: !74)
!83 = !DILocation(line: 49, column: 17, scope: !74)
!84 = distinct !{!84, !76, !85, !61}
!85 = !DILocation(line: 52, column: 17, scope: !71)
!86 = !DILocation(line: 53, column: 13, scope: !67)
!87 = !DILocation(line: 56, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !63, file: !15, line: 55, column: 13)
!89 = !DILocation(line: 58, column: 18, scope: !32)
!90 = !DILocation(line: 58, column: 13, scope: !32)
!91 = !DILocation(line: 60, column: 5, scope: !33)
!92 = !DILocation(line: 61, column: 1, scope: !14)
!93 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_10_good", scope: !15, file: !15, line: 245, type: !16, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 247, column: 5, scope: !93)
!95 = !DILocation(line: 248, column: 5, scope: !93)
!96 = !DILocation(line: 249, column: 5, scope: !93)
!97 = !DILocation(line: 250, column: 5, scope: !93)
!98 = !DILocation(line: 251, column: 1, scope: !93)
!99 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 262, type: !100, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!4, !4, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !15, line: 262, type: !4)
!106 = !DILocation(line: 262, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !15, line: 262, type: !102)
!108 = !DILocation(line: 262, column: 27, scope: !99)
!109 = !DILocation(line: 265, column: 22, scope: !99)
!110 = !DILocation(line: 265, column: 12, scope: !99)
!111 = !DILocation(line: 265, column: 5, scope: !99)
!112 = !DILocation(line: 267, column: 5, scope: !99)
!113 = !DILocation(line: 268, column: 5, scope: !99)
!114 = !DILocation(line: 269, column: 5, scope: !99)
!115 = !DILocation(line: 272, column: 5, scope: !99)
!116 = !DILocation(line: 273, column: 5, scope: !99)
!117 = !DILocation(line: 274, column: 5, scope: !99)
!118 = !DILocation(line: 276, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 70, type: !4)
!121 = !DILocation(line: 70, column: 9, scope: !119)
!122 = !DILocation(line: 72, column: 10, scope: !119)
!123 = !DILocation(line: 73, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !15, line: 73, column: 8)
!125 = !DILocation(line: 73, column: 8, scope: !119)
!126 = !DILocation(line: 76, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 74, column: 5)
!128 = !DILocation(line: 76, column: 14, scope: !127)
!129 = !DILocation(line: 77, column: 5, scope: !127)
!130 = !DILocation(line: 78, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !119, file: !15, line: 78, column: 8)
!132 = !DILocation(line: 78, column: 8, scope: !119)
!133 = !DILocation(line: 81, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !15, line: 79, column: 5)
!135 = !DILocation(line: 82, column: 5, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !137, file: !15, line: 86, type: !4)
!137 = distinct !DILexicalBlock(scope: !138, file: !15, line: 85, column: 9)
!138 = distinct !DILexicalBlock(scope: !131, file: !15, line: 84, column: 5)
!139 = !DILocation(line: 86, column: 17, scope: !137)
!140 = !DILocalVariable(name: "buffer", scope: !137, file: !15, line: 87, type: !6)
!141 = !DILocation(line: 87, column: 19, scope: !137)
!142 = !DILocation(line: 87, column: 35, scope: !137)
!143 = !DILocation(line: 87, column: 28, scope: !137)
!144 = !DILocation(line: 88, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !137, file: !15, line: 88, column: 17)
!146 = !DILocation(line: 88, column: 24, scope: !145)
!147 = !DILocation(line: 88, column: 17, scope: !137)
!148 = !DILocation(line: 88, column: 34, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 88, column: 33)
!150 = !DILocation(line: 90, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !137, file: !15, line: 90, column: 13)
!152 = !DILocation(line: 90, column: 18, scope: !151)
!153 = !DILocation(line: 90, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !15, line: 90, column: 13)
!155 = !DILocation(line: 90, column: 27, scope: !154)
!156 = !DILocation(line: 90, column: 13, scope: !151)
!157 = !DILocation(line: 92, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 91, column: 13)
!159 = !DILocation(line: 92, column: 24, scope: !158)
!160 = !DILocation(line: 92, column: 27, scope: !158)
!161 = !DILocation(line: 93, column: 13, scope: !158)
!162 = !DILocation(line: 90, column: 34, scope: !154)
!163 = !DILocation(line: 90, column: 13, scope: !154)
!164 = distinct !{!164, !156, !165, !61}
!165 = !DILocation(line: 93, column: 13, scope: !151)
!166 = !DILocation(line: 95, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !137, file: !15, line: 95, column: 17)
!168 = !DILocation(line: 95, column: 22, scope: !167)
!169 = !DILocation(line: 95, column: 27, scope: !167)
!170 = !DILocation(line: 95, column: 30, scope: !167)
!171 = !DILocation(line: 95, column: 35, scope: !167)
!172 = !DILocation(line: 95, column: 17, scope: !137)
!173 = !DILocation(line: 97, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !167, file: !15, line: 96, column: 13)
!175 = !DILocation(line: 97, column: 24, scope: !174)
!176 = !DILocation(line: 97, column: 30, scope: !174)
!177 = !DILocation(line: 99, column: 23, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !15, line: 99, column: 17)
!179 = !DILocation(line: 99, column: 21, scope: !178)
!180 = !DILocation(line: 99, column: 28, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !15, line: 99, column: 17)
!182 = !DILocation(line: 99, column: 30, scope: !181)
!183 = !DILocation(line: 99, column: 17, scope: !178)
!184 = !DILocation(line: 101, column: 34, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !15, line: 100, column: 17)
!186 = !DILocation(line: 101, column: 41, scope: !185)
!187 = !DILocation(line: 101, column: 21, scope: !185)
!188 = !DILocation(line: 102, column: 17, scope: !185)
!189 = !DILocation(line: 99, column: 37, scope: !181)
!190 = !DILocation(line: 99, column: 17, scope: !181)
!191 = distinct !{!191, !183, !192, !61}
!192 = !DILocation(line: 102, column: 17, scope: !178)
!193 = !DILocation(line: 103, column: 13, scope: !174)
!194 = !DILocation(line: 106, column: 17, scope: !195)
!195 = distinct !DILexicalBlock(scope: !167, file: !15, line: 105, column: 13)
!196 = !DILocation(line: 108, column: 18, scope: !137)
!197 = !DILocation(line: 108, column: 13, scope: !137)
!198 = !DILocation(line: 111, column: 1, scope: !119)
!199 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!200 = !DILocalVariable(name: "data", scope: !199, file: !15, line: 116, type: !4)
!201 = !DILocation(line: 116, column: 9, scope: !199)
!202 = !DILocation(line: 118, column: 10, scope: !199)
!203 = !DILocation(line: 119, column: 8, scope: !204)
!204 = distinct !DILexicalBlock(scope: !199, file: !15, line: 119, column: 8)
!205 = !DILocation(line: 119, column: 8, scope: !199)
!206 = !DILocation(line: 122, column: 16, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !15, line: 120, column: 5)
!208 = !DILocation(line: 122, column: 14, scope: !207)
!209 = !DILocation(line: 123, column: 5, scope: !207)
!210 = !DILocation(line: 124, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !199, file: !15, line: 124, column: 8)
!212 = !DILocation(line: 124, column: 8, scope: !199)
!213 = !DILocalVariable(name: "i", scope: !214, file: !15, line: 127, type: !4)
!214 = distinct !DILexicalBlock(scope: !215, file: !15, line: 126, column: 9)
!215 = distinct !DILexicalBlock(scope: !211, file: !15, line: 125, column: 5)
!216 = !DILocation(line: 127, column: 17, scope: !214)
!217 = !DILocalVariable(name: "buffer", scope: !214, file: !15, line: 128, type: !6)
!218 = !DILocation(line: 128, column: 19, scope: !214)
!219 = !DILocation(line: 128, column: 35, scope: !214)
!220 = !DILocation(line: 128, column: 28, scope: !214)
!221 = !DILocation(line: 129, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !214, file: !15, line: 129, column: 17)
!223 = !DILocation(line: 129, column: 24, scope: !222)
!224 = !DILocation(line: 129, column: 17, scope: !214)
!225 = !DILocation(line: 129, column: 34, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !15, line: 129, column: 33)
!227 = !DILocation(line: 131, column: 20, scope: !228)
!228 = distinct !DILexicalBlock(scope: !214, file: !15, line: 131, column: 13)
!229 = !DILocation(line: 131, column: 18, scope: !228)
!230 = !DILocation(line: 131, column: 25, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !15, line: 131, column: 13)
!232 = !DILocation(line: 131, column: 27, scope: !231)
!233 = !DILocation(line: 131, column: 13, scope: !228)
!234 = !DILocation(line: 133, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !15, line: 132, column: 13)
!236 = !DILocation(line: 133, column: 24, scope: !235)
!237 = !DILocation(line: 133, column: 27, scope: !235)
!238 = !DILocation(line: 134, column: 13, scope: !235)
!239 = !DILocation(line: 131, column: 34, scope: !231)
!240 = !DILocation(line: 131, column: 13, scope: !231)
!241 = distinct !{!241, !233, !242, !61}
!242 = !DILocation(line: 134, column: 13, scope: !228)
!243 = !DILocation(line: 136, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !214, file: !15, line: 136, column: 17)
!245 = !DILocation(line: 136, column: 22, scope: !244)
!246 = !DILocation(line: 136, column: 27, scope: !244)
!247 = !DILocation(line: 136, column: 30, scope: !244)
!248 = !DILocation(line: 136, column: 35, scope: !244)
!249 = !DILocation(line: 136, column: 17, scope: !214)
!250 = !DILocation(line: 138, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !244, file: !15, line: 137, column: 13)
!252 = !DILocation(line: 138, column: 24, scope: !251)
!253 = !DILocation(line: 138, column: 30, scope: !251)
!254 = !DILocation(line: 140, column: 23, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !15, line: 140, column: 17)
!256 = !DILocation(line: 140, column: 21, scope: !255)
!257 = !DILocation(line: 140, column: 28, scope: !258)
!258 = distinct !DILexicalBlock(scope: !255, file: !15, line: 140, column: 17)
!259 = !DILocation(line: 140, column: 30, scope: !258)
!260 = !DILocation(line: 140, column: 17, scope: !255)
!261 = !DILocation(line: 142, column: 34, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !15, line: 141, column: 17)
!263 = !DILocation(line: 142, column: 41, scope: !262)
!264 = !DILocation(line: 142, column: 21, scope: !262)
!265 = !DILocation(line: 143, column: 17, scope: !262)
!266 = !DILocation(line: 140, column: 37, scope: !258)
!267 = !DILocation(line: 140, column: 17, scope: !258)
!268 = distinct !{!268, !260, !269, !61}
!269 = !DILocation(line: 143, column: 17, scope: !255)
!270 = !DILocation(line: 144, column: 13, scope: !251)
!271 = !DILocation(line: 147, column: 17, scope: !272)
!272 = distinct !DILexicalBlock(scope: !244, file: !15, line: 146, column: 13)
!273 = !DILocation(line: 149, column: 18, scope: !214)
!274 = !DILocation(line: 149, column: 13, scope: !214)
!275 = !DILocation(line: 151, column: 5, scope: !215)
!276 = !DILocation(line: 152, column: 1, scope: !199)
!277 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 155, type: !16, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!278 = !DILocalVariable(name: "data", scope: !277, file: !15, line: 157, type: !4)
!279 = !DILocation(line: 157, column: 9, scope: !277)
!280 = !DILocation(line: 159, column: 10, scope: !277)
!281 = !DILocation(line: 160, column: 8, scope: !282)
!282 = distinct !DILexicalBlock(scope: !277, file: !15, line: 160, column: 8)
!283 = !DILocation(line: 160, column: 8, scope: !277)
!284 = !DILocation(line: 163, column: 9, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !15, line: 161, column: 5)
!286 = !DILocation(line: 164, column: 5, scope: !285)
!287 = !DILocation(line: 169, column: 14, scope: !288)
!288 = distinct !DILexicalBlock(scope: !282, file: !15, line: 166, column: 5)
!289 = !DILocation(line: 171, column: 8, scope: !290)
!290 = distinct !DILexicalBlock(scope: !277, file: !15, line: 171, column: 8)
!291 = !DILocation(line: 171, column: 8, scope: !277)
!292 = !DILocalVariable(name: "i", scope: !293, file: !15, line: 174, type: !4)
!293 = distinct !DILexicalBlock(scope: !294, file: !15, line: 173, column: 9)
!294 = distinct !DILexicalBlock(scope: !290, file: !15, line: 172, column: 5)
!295 = !DILocation(line: 174, column: 17, scope: !293)
!296 = !DILocalVariable(name: "buffer", scope: !293, file: !15, line: 175, type: !6)
!297 = !DILocation(line: 175, column: 19, scope: !293)
!298 = !DILocation(line: 175, column: 35, scope: !293)
!299 = !DILocation(line: 175, column: 28, scope: !293)
!300 = !DILocation(line: 176, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !293, file: !15, line: 176, column: 17)
!302 = !DILocation(line: 176, column: 24, scope: !301)
!303 = !DILocation(line: 176, column: 17, scope: !293)
!304 = !DILocation(line: 176, column: 34, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !15, line: 176, column: 33)
!306 = !DILocation(line: 178, column: 20, scope: !307)
!307 = distinct !DILexicalBlock(scope: !293, file: !15, line: 178, column: 13)
!308 = !DILocation(line: 178, column: 18, scope: !307)
!309 = !DILocation(line: 178, column: 25, scope: !310)
!310 = distinct !DILexicalBlock(scope: !307, file: !15, line: 178, column: 13)
!311 = !DILocation(line: 178, column: 27, scope: !310)
!312 = !DILocation(line: 178, column: 13, scope: !307)
!313 = !DILocation(line: 180, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !15, line: 179, column: 13)
!315 = !DILocation(line: 180, column: 24, scope: !314)
!316 = !DILocation(line: 180, column: 27, scope: !314)
!317 = !DILocation(line: 181, column: 13, scope: !314)
!318 = !DILocation(line: 178, column: 34, scope: !310)
!319 = !DILocation(line: 178, column: 13, scope: !310)
!320 = distinct !{!320, !312, !321, !61}
!321 = !DILocation(line: 181, column: 13, scope: !307)
!322 = !DILocation(line: 184, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !293, file: !15, line: 184, column: 17)
!324 = !DILocation(line: 184, column: 22, scope: !323)
!325 = !DILocation(line: 184, column: 17, scope: !293)
!326 = !DILocation(line: 186, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !323, file: !15, line: 185, column: 13)
!328 = !DILocation(line: 186, column: 24, scope: !327)
!329 = !DILocation(line: 186, column: 30, scope: !327)
!330 = !DILocation(line: 188, column: 23, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !15, line: 188, column: 17)
!332 = !DILocation(line: 188, column: 21, scope: !331)
!333 = !DILocation(line: 188, column: 28, scope: !334)
!334 = distinct !DILexicalBlock(scope: !331, file: !15, line: 188, column: 17)
!335 = !DILocation(line: 188, column: 30, scope: !334)
!336 = !DILocation(line: 188, column: 17, scope: !331)
!337 = !DILocation(line: 190, column: 34, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !15, line: 189, column: 17)
!339 = !DILocation(line: 190, column: 41, scope: !338)
!340 = !DILocation(line: 190, column: 21, scope: !338)
!341 = !DILocation(line: 191, column: 17, scope: !338)
!342 = !DILocation(line: 188, column: 37, scope: !334)
!343 = !DILocation(line: 188, column: 17, scope: !334)
!344 = distinct !{!344, !336, !345, !61}
!345 = !DILocation(line: 191, column: 17, scope: !331)
!346 = !DILocation(line: 192, column: 13, scope: !327)
!347 = !DILocation(line: 195, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !323, file: !15, line: 194, column: 13)
!349 = !DILocation(line: 197, column: 18, scope: !293)
!350 = !DILocation(line: 197, column: 13, scope: !293)
!351 = !DILocation(line: 199, column: 5, scope: !294)
!352 = !DILocation(line: 200, column: 1, scope: !277)
!353 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 203, type: !16, scopeLine: 204, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!354 = !DILocalVariable(name: "data", scope: !353, file: !15, line: 205, type: !4)
!355 = !DILocation(line: 205, column: 9, scope: !353)
!356 = !DILocation(line: 207, column: 10, scope: !353)
!357 = !DILocation(line: 208, column: 8, scope: !358)
!358 = distinct !DILexicalBlock(scope: !353, file: !15, line: 208, column: 8)
!359 = !DILocation(line: 208, column: 8, scope: !353)
!360 = !DILocation(line: 212, column: 14, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !15, line: 209, column: 5)
!362 = !DILocation(line: 213, column: 5, scope: !361)
!363 = !DILocation(line: 214, column: 8, scope: !364)
!364 = distinct !DILexicalBlock(scope: !353, file: !15, line: 214, column: 8)
!365 = !DILocation(line: 214, column: 8, scope: !353)
!366 = !DILocalVariable(name: "i", scope: !367, file: !15, line: 217, type: !4)
!367 = distinct !DILexicalBlock(scope: !368, file: !15, line: 216, column: 9)
!368 = distinct !DILexicalBlock(scope: !364, file: !15, line: 215, column: 5)
!369 = !DILocation(line: 217, column: 17, scope: !367)
!370 = !DILocalVariable(name: "buffer", scope: !367, file: !15, line: 218, type: !6)
!371 = !DILocation(line: 218, column: 19, scope: !367)
!372 = !DILocation(line: 218, column: 35, scope: !367)
!373 = !DILocation(line: 218, column: 28, scope: !367)
!374 = !DILocation(line: 219, column: 17, scope: !375)
!375 = distinct !DILexicalBlock(scope: !367, file: !15, line: 219, column: 17)
!376 = !DILocation(line: 219, column: 24, scope: !375)
!377 = !DILocation(line: 219, column: 17, scope: !367)
!378 = !DILocation(line: 219, column: 34, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !15, line: 219, column: 33)
!380 = !DILocation(line: 221, column: 20, scope: !381)
!381 = distinct !DILexicalBlock(scope: !367, file: !15, line: 221, column: 13)
!382 = !DILocation(line: 221, column: 18, scope: !381)
!383 = !DILocation(line: 221, column: 25, scope: !384)
!384 = distinct !DILexicalBlock(scope: !381, file: !15, line: 221, column: 13)
!385 = !DILocation(line: 221, column: 27, scope: !384)
!386 = !DILocation(line: 221, column: 13, scope: !381)
!387 = !DILocation(line: 223, column: 17, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !15, line: 222, column: 13)
!389 = !DILocation(line: 223, column: 24, scope: !388)
!390 = !DILocation(line: 223, column: 27, scope: !388)
!391 = !DILocation(line: 224, column: 13, scope: !388)
!392 = !DILocation(line: 221, column: 34, scope: !384)
!393 = !DILocation(line: 221, column: 13, scope: !384)
!394 = distinct !{!394, !386, !395, !61}
!395 = !DILocation(line: 224, column: 13, scope: !381)
!396 = !DILocation(line: 227, column: 17, scope: !397)
!397 = distinct !DILexicalBlock(scope: !367, file: !15, line: 227, column: 17)
!398 = !DILocation(line: 227, column: 22, scope: !397)
!399 = !DILocation(line: 227, column: 17, scope: !367)
!400 = !DILocation(line: 229, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !15, line: 228, column: 13)
!402 = !DILocation(line: 229, column: 24, scope: !401)
!403 = !DILocation(line: 229, column: 30, scope: !401)
!404 = !DILocation(line: 231, column: 23, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !15, line: 231, column: 17)
!406 = !DILocation(line: 231, column: 21, scope: !405)
!407 = !DILocation(line: 231, column: 28, scope: !408)
!408 = distinct !DILexicalBlock(scope: !405, file: !15, line: 231, column: 17)
!409 = !DILocation(line: 231, column: 30, scope: !408)
!410 = !DILocation(line: 231, column: 17, scope: !405)
!411 = !DILocation(line: 233, column: 34, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !15, line: 232, column: 17)
!413 = !DILocation(line: 233, column: 41, scope: !412)
!414 = !DILocation(line: 233, column: 21, scope: !412)
!415 = !DILocation(line: 234, column: 17, scope: !412)
!416 = !DILocation(line: 231, column: 37, scope: !408)
!417 = !DILocation(line: 231, column: 17, scope: !408)
!418 = distinct !{!418, !410, !419, !61}
!419 = !DILocation(line: 234, column: 17, scope: !405)
!420 = !DILocation(line: 235, column: 13, scope: !401)
!421 = !DILocation(line: 238, column: 17, scope: !422)
!422 = distinct !DILexicalBlock(scope: !397, file: !15, line: 237, column: 13)
!423 = !DILocation(line: 240, column: 18, scope: !367)
!424 = !DILocation(line: 240, column: 13, scope: !367)
!425 = !DILocation(line: 242, column: 5, scope: !368)
!426 = !DILocation(line: 243, column: 1, scope: !353)
