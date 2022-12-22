; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %0 = load i32, i32* @staticTrue, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !29
  %and = and i32 %call, 1, !dbg !29
  %tobool1 = icmp ne i32 %and, 0, !dbg !29
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !29

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand() #5, !dbg !29
  %shl = shl i32 %call2, 30, !dbg !29
  %call3 = call i32 @rand() #5, !dbg !29
  %shl4 = shl i32 %call3, 15, !dbg !29
  %xor = xor i32 %shl, %shl4, !dbg !29
  %call5 = call i32 @rand() #5, !dbg !29
  %xor6 = xor i32 %xor, %call5, !dbg !29
  br label %cond.end, !dbg !29

cond.false:                                       ; preds = %if.then
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
  store i32 %cond, i32* %data, align 4, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool15 = icmp ne i32 %1, 0, !dbg !33
  br i1 %tobool15, label %if.then16, label %if.end34, !dbg !35

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !36, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !40, metadata !DIExpression()), !dbg !41
  %call17 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !42
  %2 = bitcast i8* %call17 to i32*, !dbg !43
  store i32* %2, i32** %buffer, align 8, !dbg !41
  %3 = load i32*, i32** %buffer, align 8, !dbg !44
  %cmp = icmp eq i32* %3, null, !dbg !46
  br i1 %cmp, label %if.then18, label %if.end19, !dbg !47

if.then18:                                        ; preds = %if.then16
  call void @exit(i32 -1) #6, !dbg !48
  unreachable, !dbg !48

if.end19:                                         ; preds = %if.then16
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end19
  %4 = load i32, i32* %i, align 4, !dbg !53
  %cmp20 = icmp slt i32 %4, 10, !dbg !55
  br i1 %cmp20, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !57
  %6 = load i32, i32* %i, align 4, !dbg !59
  %idxprom = sext i32 %6 to i64, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !62
  %inc = add nsw i32 %7, 1, !dbg !62
  store i32 %inc, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !67
  %cmp21 = icmp sge i32 %8, 0, !dbg !69
  br i1 %cmp21, label %if.then22, label %if.else, !dbg !70

if.then22:                                        ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !71
  %10 = load i32, i32* %data, align 4, !dbg !73
  %idxprom23 = sext i32 %10 to i64, !dbg !71
  %arrayidx24 = getelementptr inbounds i32, i32* %9, i64 %idxprom23, !dbg !71
  store i32 1, i32* %arrayidx24, align 4, !dbg !74
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond25, !dbg !77

for.cond25:                                       ; preds = %for.inc30, %if.then22
  %11 = load i32, i32* %i, align 4, !dbg !78
  %cmp26 = icmp slt i32 %11, 10, !dbg !80
  br i1 %cmp26, label %for.body27, label %for.end32, !dbg !81

for.body27:                                       ; preds = %for.cond25
  %12 = load i32*, i32** %buffer, align 8, !dbg !82
  %13 = load i32, i32* %i, align 4, !dbg !84
  %idxprom28 = sext i32 %13 to i64, !dbg !82
  %arrayidx29 = getelementptr inbounds i32, i32* %12, i64 %idxprom28, !dbg !82
  %14 = load i32, i32* %arrayidx29, align 4, !dbg !82
  call void @printIntLine(i32 %14), !dbg !85
  br label %for.inc30, !dbg !86

for.inc30:                                        ; preds = %for.body27
  %15 = load i32, i32* %i, align 4, !dbg !87
  %inc31 = add nsw i32 %15, 1, !dbg !87
  store i32 %inc31, i32* %i, align 4, !dbg !87
  br label %for.cond25, !dbg !88, !llvm.loop !89

for.end32:                                        ; preds = %for.cond25
  br label %if.end33, !dbg !91

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !92
  br label %if.end33

if.end33:                                         ; preds = %if.else, %for.end32
  %16 = load i32*, i32** %buffer, align 8, !dbg !94
  %17 = bitcast i32* %16 to i8*, !dbg !94
  call void @free(i8* %17) #5, !dbg !95
  br label %if.end34, !dbg !96

if.end34:                                         ; preds = %if.end33, %if.end
  ret void, !dbg !97
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05_good() #0 !dbg !98 {
entry:
  call void @goodB2G1(), !dbg !99
  call void @goodB2G2(), !dbg !100
  call void @goodG2B1(), !dbg !101
  call void @goodG2B2(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* null) #5, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #5, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 -1, i32* %data, align 4, !dbg !127
  %0 = load i32, i32* @staticTrue, align 4, !dbg !128
  %tobool = icmp ne i32 %0, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !131
  %and = and i32 %call, 1, !dbg !131
  %tobool1 = icmp ne i32 %and, 0, !dbg !131
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !131

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand() #5, !dbg !131
  %shl = shl i32 %call2, 30, !dbg !131
  %call3 = call i32 @rand() #5, !dbg !131
  %shl4 = shl i32 %call3, 15, !dbg !131
  %xor = xor i32 %shl, %shl4, !dbg !131
  %call5 = call i32 @rand() #5, !dbg !131
  %xor6 = xor i32 %xor, %call5, !dbg !131
  br label %cond.end, !dbg !131

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand() #5, !dbg !131
  %shl8 = shl i32 %call7, 30, !dbg !131
  %call9 = call i32 @rand() #5, !dbg !131
  %shl10 = shl i32 %call9, 15, !dbg !131
  %xor11 = xor i32 %shl8, %shl10, !dbg !131
  %call12 = call i32 @rand() #5, !dbg !131
  %xor13 = xor i32 %xor11, %call12, !dbg !131
  %sub = sub i32 0, %xor13, !dbg !131
  %sub14 = sub i32 %sub, 1, !dbg !131
  br label %cond.end, !dbg !131

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !131
  store i32 %cond, i32* %data, align 4, !dbg !133
  br label %if.end, !dbg !134

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !135
  %tobool15 = icmp ne i32 %1, 0, !dbg !135
  br i1 %tobool15, label %if.then16, label %if.else, !dbg !137

if.then16:                                        ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !138
  br label %if.end36, !dbg !140

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !141, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !145, metadata !DIExpression()), !dbg !146
  %call17 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !147
  %2 = bitcast i8* %call17 to i32*, !dbg !148
  store i32* %2, i32** %buffer, align 8, !dbg !146
  %3 = load i32*, i32** %buffer, align 8, !dbg !149
  %cmp = icmp eq i32* %3, null, !dbg !151
  br i1 %cmp, label %if.then18, label %if.end19, !dbg !152

if.then18:                                        ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !153
  unreachable, !dbg !153

if.end19:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %if.end19
  %4 = load i32, i32* %i, align 4, !dbg !158
  %cmp20 = icmp slt i32 %4, 10, !dbg !160
  br i1 %cmp20, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !162
  %6 = load i32, i32* %i, align 4, !dbg !164
  %idxprom = sext i32 %6 to i64, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !167
  %inc = add nsw i32 %7, 1, !dbg !167
  store i32 %inc, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !171
  %cmp21 = icmp sge i32 %8, 0, !dbg !173
  br i1 %cmp21, label %land.lhs.true, label %if.else34, !dbg !174

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !175
  %cmp22 = icmp slt i32 %9, 10, !dbg !176
  br i1 %cmp22, label %if.then23, label %if.else34, !dbg !177

if.then23:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !178
  %11 = load i32, i32* %data, align 4, !dbg !180
  %idxprom24 = sext i32 %11 to i64, !dbg !178
  %arrayidx25 = getelementptr inbounds i32, i32* %10, i64 %idxprom24, !dbg !178
  store i32 1, i32* %arrayidx25, align 4, !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond26, !dbg !184

for.cond26:                                       ; preds = %for.inc31, %if.then23
  %12 = load i32, i32* %i, align 4, !dbg !185
  %cmp27 = icmp slt i32 %12, 10, !dbg !187
  br i1 %cmp27, label %for.body28, label %for.end33, !dbg !188

for.body28:                                       ; preds = %for.cond26
  %13 = load i32*, i32** %buffer, align 8, !dbg !189
  %14 = load i32, i32* %i, align 4, !dbg !191
  %idxprom29 = sext i32 %14 to i64, !dbg !189
  %arrayidx30 = getelementptr inbounds i32, i32* %13, i64 %idxprom29, !dbg !189
  %15 = load i32, i32* %arrayidx30, align 4, !dbg !189
  call void @printIntLine(i32 %15), !dbg !192
  br label %for.inc31, !dbg !193

for.inc31:                                        ; preds = %for.body28
  %16 = load i32, i32* %i, align 4, !dbg !194
  %inc32 = add nsw i32 %16, 1, !dbg !194
  store i32 %inc32, i32* %i, align 4, !dbg !194
  br label %for.cond26, !dbg !195, !llvm.loop !196

for.end33:                                        ; preds = %for.cond26
  br label %if.end35, !dbg !198

if.else34:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !199
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %for.end33
  %17 = load i32*, i32** %buffer, align 8, !dbg !201
  %18 = bitcast i32* %17 to i8*, !dbg !201
  call void @free(i8* %18) #5, !dbg !202
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then16
  ret void, !dbg !203
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !204 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !205, metadata !DIExpression()), !dbg !206
  store i32 -1, i32* %data, align 4, !dbg !207
  %0 = load i32, i32* @staticTrue, align 4, !dbg !208
  %tobool = icmp ne i32 %0, 0, !dbg !208
  br i1 %tobool, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !211
  %and = and i32 %call, 1, !dbg !211
  %tobool1 = icmp ne i32 %and, 0, !dbg !211
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !211

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand() #5, !dbg !211
  %shl = shl i32 %call2, 30, !dbg !211
  %call3 = call i32 @rand() #5, !dbg !211
  %shl4 = shl i32 %call3, 15, !dbg !211
  %xor = xor i32 %shl, %shl4, !dbg !211
  %call5 = call i32 @rand() #5, !dbg !211
  %xor6 = xor i32 %xor, %call5, !dbg !211
  br label %cond.end, !dbg !211

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand() #5, !dbg !211
  %shl8 = shl i32 %call7, 30, !dbg !211
  %call9 = call i32 @rand() #5, !dbg !211
  %shl10 = shl i32 %call9, 15, !dbg !211
  %xor11 = xor i32 %shl8, %shl10, !dbg !211
  %call12 = call i32 @rand() #5, !dbg !211
  %xor13 = xor i32 %xor11, %call12, !dbg !211
  %sub = sub i32 0, %xor13, !dbg !211
  %sub14 = sub i32 %sub, 1, !dbg !211
  br label %cond.end, !dbg !211

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !211
  store i32 %cond, i32* %data, align 4, !dbg !213
  br label %if.end, !dbg !214

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !215
  %tobool15 = icmp ne i32 %1, 0, !dbg !215
  br i1 %tobool15, label %if.then16, label %if.end35, !dbg !217

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !218, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !222, metadata !DIExpression()), !dbg !223
  %call17 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !224
  %2 = bitcast i8* %call17 to i32*, !dbg !225
  store i32* %2, i32** %buffer, align 8, !dbg !223
  %3 = load i32*, i32** %buffer, align 8, !dbg !226
  %cmp = icmp eq i32* %3, null, !dbg !228
  br i1 %cmp, label %if.then18, label %if.end19, !dbg !229

if.then18:                                        ; preds = %if.then16
  call void @exit(i32 -1) #6, !dbg !230
  unreachable, !dbg !230

if.end19:                                         ; preds = %if.then16
  store i32 0, i32* %i, align 4, !dbg !232
  br label %for.cond, !dbg !234

for.cond:                                         ; preds = %for.inc, %if.end19
  %4 = load i32, i32* %i, align 4, !dbg !235
  %cmp20 = icmp slt i32 %4, 10, !dbg !237
  br i1 %cmp20, label %for.body, label %for.end, !dbg !238

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !239
  %6 = load i32, i32* %i, align 4, !dbg !241
  %idxprom = sext i32 %6 to i64, !dbg !239
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !239
  store i32 0, i32* %arrayidx, align 4, !dbg !242
  br label %for.inc, !dbg !243

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !244
  %inc = add nsw i32 %7, 1, !dbg !244
  store i32 %inc, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !245, !llvm.loop !246

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !248
  %cmp21 = icmp sge i32 %8, 0, !dbg !250
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !251

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !252
  %cmp22 = icmp slt i32 %9, 10, !dbg !253
  br i1 %cmp22, label %if.then23, label %if.else, !dbg !254

if.then23:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !255
  %11 = load i32, i32* %data, align 4, !dbg !257
  %idxprom24 = sext i32 %11 to i64, !dbg !255
  %arrayidx25 = getelementptr inbounds i32, i32* %10, i64 %idxprom24, !dbg !255
  store i32 1, i32* %arrayidx25, align 4, !dbg !258
  store i32 0, i32* %i, align 4, !dbg !259
  br label %for.cond26, !dbg !261

for.cond26:                                       ; preds = %for.inc31, %if.then23
  %12 = load i32, i32* %i, align 4, !dbg !262
  %cmp27 = icmp slt i32 %12, 10, !dbg !264
  br i1 %cmp27, label %for.body28, label %for.end33, !dbg !265

for.body28:                                       ; preds = %for.cond26
  %13 = load i32*, i32** %buffer, align 8, !dbg !266
  %14 = load i32, i32* %i, align 4, !dbg !268
  %idxprom29 = sext i32 %14 to i64, !dbg !266
  %arrayidx30 = getelementptr inbounds i32, i32* %13, i64 %idxprom29, !dbg !266
  %15 = load i32, i32* %arrayidx30, align 4, !dbg !266
  call void @printIntLine(i32 %15), !dbg !269
  br label %for.inc31, !dbg !270

for.inc31:                                        ; preds = %for.body28
  %16 = load i32, i32* %i, align 4, !dbg !271
  %inc32 = add nsw i32 %16, 1, !dbg !271
  store i32 %inc32, i32* %i, align 4, !dbg !271
  br label %for.cond26, !dbg !272, !llvm.loop !273

for.end33:                                        ; preds = %for.cond26
  br label %if.end34, !dbg !275

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !276
  br label %if.end34

if.end34:                                         ; preds = %if.else, %for.end33
  %17 = load i32*, i32** %buffer, align 8, !dbg !278
  %18 = bitcast i32* %17 to i8*, !dbg !278
  call void @free(i8* %18) #5, !dbg !279
  br label %if.end35, !dbg !280

if.end35:                                         ; preds = %if.end34, %if.end
  ret void, !dbg !281
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !282 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !283, metadata !DIExpression()), !dbg !284
  store i32 -1, i32* %data, align 4, !dbg !285
  %0 = load i32, i32* @staticFalse, align 4, !dbg !286
  %tobool = icmp ne i32 %0, 0, !dbg !286
  br i1 %tobool, label %if.then, label %if.else, !dbg !288

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !289
  br label %if.end, !dbg !291

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !292
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !294
  %tobool1 = icmp ne i32 %1, 0, !dbg !294
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !296

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !297, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !301, metadata !DIExpression()), !dbg !302
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !303
  %2 = bitcast i8* %call to i32*, !dbg !304
  store i32* %2, i32** %buffer, align 8, !dbg !302
  %3 = load i32*, i32** %buffer, align 8, !dbg !305
  %cmp = icmp eq i32* %3, null, !dbg !307
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !308

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !309
  unreachable, !dbg !309

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !311
  br label %for.cond, !dbg !313

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !314
  %cmp5 = icmp slt i32 %4, 10, !dbg !316
  br i1 %cmp5, label %for.body, label %for.end, !dbg !317

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !318
  %6 = load i32, i32* %i, align 4, !dbg !320
  %idxprom = sext i32 %6 to i64, !dbg !318
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !318
  store i32 0, i32* %arrayidx, align 4, !dbg !321
  br label %for.inc, !dbg !322

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !323
  %inc = add nsw i32 %7, 1, !dbg !323
  store i32 %inc, i32* %i, align 4, !dbg !323
  br label %for.cond, !dbg !324, !llvm.loop !325

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !327
  %cmp6 = icmp sge i32 %8, 0, !dbg !329
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !330

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !331
  %10 = load i32, i32* %data, align 4, !dbg !333
  %idxprom8 = sext i32 %10 to i64, !dbg !331
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !331
  store i32 1, i32* %arrayidx9, align 4, !dbg !334
  store i32 0, i32* %i, align 4, !dbg !335
  br label %for.cond10, !dbg !337

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !338
  %cmp11 = icmp slt i32 %11, 10, !dbg !340
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !341

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !342
  %13 = load i32, i32* %i, align 4, !dbg !344
  %idxprom13 = sext i32 %13 to i64, !dbg !342
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !342
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !342
  call void @printIntLine(i32 %14), !dbg !345
  br label %for.inc15, !dbg !346

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !347
  %inc16 = add nsw i32 %15, 1, !dbg !347
  store i32 %inc16, i32* %i, align 4, !dbg !347
  br label %for.cond10, !dbg !348, !llvm.loop !349

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !351

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !352
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !354
  %17 = bitcast i32* %16 to i8*, !dbg !354
  call void @free(i8* %17) #5, !dbg !355
  br label %if.end20, !dbg !356

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !357
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !358 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !359, metadata !DIExpression()), !dbg !360
  store i32 -1, i32* %data, align 4, !dbg !361
  %0 = load i32, i32* @staticTrue, align 4, !dbg !362
  %tobool = icmp ne i32 %0, 0, !dbg !362
  br i1 %tobool, label %if.then, label %if.end, !dbg !364

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !365
  br label %if.end, !dbg !367

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !368
  %tobool1 = icmp ne i32 %1, 0, !dbg !368
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !370

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !371, metadata !DIExpression()), !dbg !374
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !375, metadata !DIExpression()), !dbg !376
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !377
  %2 = bitcast i8* %call to i32*, !dbg !378
  store i32* %2, i32** %buffer, align 8, !dbg !376
  %3 = load i32*, i32** %buffer, align 8, !dbg !379
  %cmp = icmp eq i32* %3, null, !dbg !381
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !382

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !383
  unreachable, !dbg !383

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !385
  br label %for.cond, !dbg !387

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !388
  %cmp5 = icmp slt i32 %4, 10, !dbg !390
  br i1 %cmp5, label %for.body, label %for.end, !dbg !391

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !392
  %6 = load i32, i32* %i, align 4, !dbg !394
  %idxprom = sext i32 %6 to i64, !dbg !392
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !392
  store i32 0, i32* %arrayidx, align 4, !dbg !395
  br label %for.inc, !dbg !396

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !397
  %inc = add nsw i32 %7, 1, !dbg !397
  store i32 %inc, i32* %i, align 4, !dbg !397
  br label %for.cond, !dbg !398, !llvm.loop !399

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !401
  %cmp6 = icmp sge i32 %8, 0, !dbg !403
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !404

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !405
  %10 = load i32, i32* %data, align 4, !dbg !407
  %idxprom8 = sext i32 %10 to i64, !dbg !405
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !405
  store i32 1, i32* %arrayidx9, align 4, !dbg !408
  store i32 0, i32* %i, align 4, !dbg !409
  br label %for.cond10, !dbg !411

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !412
  %cmp11 = icmp slt i32 %11, 10, !dbg !414
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !415

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !416
  %13 = load i32, i32* %i, align 4, !dbg !418
  %idxprom13 = sext i32 %13 to i64, !dbg !416
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !416
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !416
  call void @printIntLine(i32 %14), !dbg !419
  br label %for.inc15, !dbg !420

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !421
  %inc16 = add nsw i32 %15, 1, !dbg !421
  store i32 %inc16, i32* %i, align 4, !dbg !421
  br label %for.cond10, !dbg !422, !llvm.loop !423

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !425

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !426
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !428
  %17 = bitcast i32* %16 to i8*, !dbg !428
  call void @free(i8* %17) #5, !dbg !429
  br label %if.end19, !dbg !430

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !431
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 23, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !8, !9}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 24, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05_bad", scope: !13, file: !13, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 30, type: !6)
!24 = !DILocation(line: 30, column: 9, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 8, scope: !20)
!29 = !DILocation(line: 36, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!31 = !DILocation(line: 36, column: 14, scope: !30)
!32 = !DILocation(line: 37, column: 5, scope: !30)
!33 = !DILocation(line: 38, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !20, file: !13, line: 38, column: 8)
!35 = !DILocation(line: 38, column: 8, scope: !20)
!36 = !DILocalVariable(name: "i", scope: !37, file: !13, line: 41, type: !6)
!37 = distinct !DILexicalBlock(scope: !38, file: !13, line: 40, column: 9)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 39, column: 5)
!39 = !DILocation(line: 41, column: 17, scope: !37)
!40 = !DILocalVariable(name: "buffer", scope: !37, file: !13, line: 42, type: !8)
!41 = !DILocation(line: 42, column: 19, scope: !37)
!42 = !DILocation(line: 42, column: 35, scope: !37)
!43 = !DILocation(line: 42, column: 28, scope: !37)
!44 = !DILocation(line: 43, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !37, file: !13, line: 43, column: 17)
!46 = !DILocation(line: 43, column: 24, scope: !45)
!47 = !DILocation(line: 43, column: 17, scope: !37)
!48 = !DILocation(line: 43, column: 34, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !13, line: 43, column: 33)
!50 = !DILocation(line: 45, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !37, file: !13, line: 45, column: 13)
!52 = !DILocation(line: 45, column: 18, scope: !51)
!53 = !DILocation(line: 45, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !13, line: 45, column: 13)
!55 = !DILocation(line: 45, column: 27, scope: !54)
!56 = !DILocation(line: 45, column: 13, scope: !51)
!57 = !DILocation(line: 47, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !13, line: 46, column: 13)
!59 = !DILocation(line: 47, column: 24, scope: !58)
!60 = !DILocation(line: 47, column: 27, scope: !58)
!61 = !DILocation(line: 48, column: 13, scope: !58)
!62 = !DILocation(line: 45, column: 34, scope: !54)
!63 = !DILocation(line: 45, column: 13, scope: !54)
!64 = distinct !{!64, !56, !65, !66}
!65 = !DILocation(line: 48, column: 13, scope: !51)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 51, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !37, file: !13, line: 51, column: 17)
!69 = !DILocation(line: 51, column: 22, scope: !68)
!70 = !DILocation(line: 51, column: 17, scope: !37)
!71 = !DILocation(line: 53, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !13, line: 52, column: 13)
!73 = !DILocation(line: 53, column: 24, scope: !72)
!74 = !DILocation(line: 53, column: 30, scope: !72)
!75 = !DILocation(line: 55, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !13, line: 55, column: 17)
!77 = !DILocation(line: 55, column: 21, scope: !76)
!78 = !DILocation(line: 55, column: 28, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !13, line: 55, column: 17)
!80 = !DILocation(line: 55, column: 30, scope: !79)
!81 = !DILocation(line: 55, column: 17, scope: !76)
!82 = !DILocation(line: 57, column: 34, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !13, line: 56, column: 17)
!84 = !DILocation(line: 57, column: 41, scope: !83)
!85 = !DILocation(line: 57, column: 21, scope: !83)
!86 = !DILocation(line: 58, column: 17, scope: !83)
!87 = !DILocation(line: 55, column: 37, scope: !79)
!88 = !DILocation(line: 55, column: 17, scope: !79)
!89 = distinct !{!89, !81, !90, !66}
!90 = !DILocation(line: 58, column: 17, scope: !76)
!91 = !DILocation(line: 59, column: 13, scope: !72)
!92 = !DILocation(line: 62, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !68, file: !13, line: 61, column: 13)
!94 = !DILocation(line: 64, column: 18, scope: !37)
!95 = !DILocation(line: 64, column: 13, scope: !37)
!96 = !DILocation(line: 66, column: 5, scope: !38)
!97 = !DILocation(line: 67, column: 1, scope: !20)
!98 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_05_good", scope: !13, file: !13, line: 251, type: !21, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocation(line: 253, column: 5, scope: !98)
!100 = !DILocation(line: 254, column: 5, scope: !98)
!101 = !DILocation(line: 255, column: 5, scope: !98)
!102 = !DILocation(line: 256, column: 5, scope: !98)
!103 = !DILocation(line: 257, column: 1, scope: !98)
!104 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 268, type: !105, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DISubroutineType(types: !106)
!106 = !{!6, !6, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !13, line: 268, type: !6)
!111 = !DILocation(line: 268, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !13, line: 268, type: !107)
!113 = !DILocation(line: 268, column: 27, scope: !104)
!114 = !DILocation(line: 271, column: 22, scope: !104)
!115 = !DILocation(line: 271, column: 12, scope: !104)
!116 = !DILocation(line: 271, column: 5, scope: !104)
!117 = !DILocation(line: 273, column: 5, scope: !104)
!118 = !DILocation(line: 274, column: 5, scope: !104)
!119 = !DILocation(line: 275, column: 5, scope: !104)
!120 = !DILocation(line: 278, column: 5, scope: !104)
!121 = !DILocation(line: 279, column: 5, scope: !104)
!122 = !DILocation(line: 280, column: 5, scope: !104)
!123 = !DILocation(line: 282, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 74, type: !21, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !13, line: 76, type: !6)
!126 = !DILocation(line: 76, column: 9, scope: !124)
!127 = !DILocation(line: 78, column: 10, scope: !124)
!128 = !DILocation(line: 79, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !13, line: 79, column: 8)
!130 = !DILocation(line: 79, column: 8, scope: !124)
!131 = !DILocation(line: 82, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !13, line: 80, column: 5)
!133 = !DILocation(line: 82, column: 14, scope: !132)
!134 = !DILocation(line: 83, column: 5, scope: !132)
!135 = !DILocation(line: 84, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !124, file: !13, line: 84, column: 8)
!137 = !DILocation(line: 84, column: 8, scope: !124)
!138 = !DILocation(line: 87, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !13, line: 85, column: 5)
!140 = !DILocation(line: 88, column: 5, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !142, file: !13, line: 92, type: !6)
!142 = distinct !DILexicalBlock(scope: !143, file: !13, line: 91, column: 9)
!143 = distinct !DILexicalBlock(scope: !136, file: !13, line: 90, column: 5)
!144 = !DILocation(line: 92, column: 17, scope: !142)
!145 = !DILocalVariable(name: "buffer", scope: !142, file: !13, line: 93, type: !8)
!146 = !DILocation(line: 93, column: 19, scope: !142)
!147 = !DILocation(line: 93, column: 35, scope: !142)
!148 = !DILocation(line: 93, column: 28, scope: !142)
!149 = !DILocation(line: 94, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !142, file: !13, line: 94, column: 17)
!151 = !DILocation(line: 94, column: 24, scope: !150)
!152 = !DILocation(line: 94, column: 17, scope: !142)
!153 = !DILocation(line: 94, column: 34, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !13, line: 94, column: 33)
!155 = !DILocation(line: 96, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !142, file: !13, line: 96, column: 13)
!157 = !DILocation(line: 96, column: 18, scope: !156)
!158 = !DILocation(line: 96, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !13, line: 96, column: 13)
!160 = !DILocation(line: 96, column: 27, scope: !159)
!161 = !DILocation(line: 96, column: 13, scope: !156)
!162 = !DILocation(line: 98, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !13, line: 97, column: 13)
!164 = !DILocation(line: 98, column: 24, scope: !163)
!165 = !DILocation(line: 98, column: 27, scope: !163)
!166 = !DILocation(line: 99, column: 13, scope: !163)
!167 = !DILocation(line: 96, column: 34, scope: !159)
!168 = !DILocation(line: 96, column: 13, scope: !159)
!169 = distinct !{!169, !161, !170, !66}
!170 = !DILocation(line: 99, column: 13, scope: !156)
!171 = !DILocation(line: 101, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !142, file: !13, line: 101, column: 17)
!173 = !DILocation(line: 101, column: 22, scope: !172)
!174 = !DILocation(line: 101, column: 27, scope: !172)
!175 = !DILocation(line: 101, column: 30, scope: !172)
!176 = !DILocation(line: 101, column: 35, scope: !172)
!177 = !DILocation(line: 101, column: 17, scope: !142)
!178 = !DILocation(line: 103, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !172, file: !13, line: 102, column: 13)
!180 = !DILocation(line: 103, column: 24, scope: !179)
!181 = !DILocation(line: 103, column: 30, scope: !179)
!182 = !DILocation(line: 105, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !13, line: 105, column: 17)
!184 = !DILocation(line: 105, column: 21, scope: !183)
!185 = !DILocation(line: 105, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !13, line: 105, column: 17)
!187 = !DILocation(line: 105, column: 30, scope: !186)
!188 = !DILocation(line: 105, column: 17, scope: !183)
!189 = !DILocation(line: 107, column: 34, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !13, line: 106, column: 17)
!191 = !DILocation(line: 107, column: 41, scope: !190)
!192 = !DILocation(line: 107, column: 21, scope: !190)
!193 = !DILocation(line: 108, column: 17, scope: !190)
!194 = !DILocation(line: 105, column: 37, scope: !186)
!195 = !DILocation(line: 105, column: 17, scope: !186)
!196 = distinct !{!196, !188, !197, !66}
!197 = !DILocation(line: 108, column: 17, scope: !183)
!198 = !DILocation(line: 109, column: 13, scope: !179)
!199 = !DILocation(line: 112, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !172, file: !13, line: 111, column: 13)
!201 = !DILocation(line: 114, column: 18, scope: !142)
!202 = !DILocation(line: 114, column: 13, scope: !142)
!203 = !DILocation(line: 117, column: 1, scope: !124)
!204 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 120, type: !21, scopeLine: 121, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!205 = !DILocalVariable(name: "data", scope: !204, file: !13, line: 122, type: !6)
!206 = !DILocation(line: 122, column: 9, scope: !204)
!207 = !DILocation(line: 124, column: 10, scope: !204)
!208 = !DILocation(line: 125, column: 8, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !13, line: 125, column: 8)
!210 = !DILocation(line: 125, column: 8, scope: !204)
!211 = !DILocation(line: 128, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !13, line: 126, column: 5)
!213 = !DILocation(line: 128, column: 14, scope: !212)
!214 = !DILocation(line: 129, column: 5, scope: !212)
!215 = !DILocation(line: 130, column: 8, scope: !216)
!216 = distinct !DILexicalBlock(scope: !204, file: !13, line: 130, column: 8)
!217 = !DILocation(line: 130, column: 8, scope: !204)
!218 = !DILocalVariable(name: "i", scope: !219, file: !13, line: 133, type: !6)
!219 = distinct !DILexicalBlock(scope: !220, file: !13, line: 132, column: 9)
!220 = distinct !DILexicalBlock(scope: !216, file: !13, line: 131, column: 5)
!221 = !DILocation(line: 133, column: 17, scope: !219)
!222 = !DILocalVariable(name: "buffer", scope: !219, file: !13, line: 134, type: !8)
!223 = !DILocation(line: 134, column: 19, scope: !219)
!224 = !DILocation(line: 134, column: 35, scope: !219)
!225 = !DILocation(line: 134, column: 28, scope: !219)
!226 = !DILocation(line: 135, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !219, file: !13, line: 135, column: 17)
!228 = !DILocation(line: 135, column: 24, scope: !227)
!229 = !DILocation(line: 135, column: 17, scope: !219)
!230 = !DILocation(line: 135, column: 34, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !13, line: 135, column: 33)
!232 = !DILocation(line: 137, column: 20, scope: !233)
!233 = distinct !DILexicalBlock(scope: !219, file: !13, line: 137, column: 13)
!234 = !DILocation(line: 137, column: 18, scope: !233)
!235 = !DILocation(line: 137, column: 25, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !13, line: 137, column: 13)
!237 = !DILocation(line: 137, column: 27, scope: !236)
!238 = !DILocation(line: 137, column: 13, scope: !233)
!239 = !DILocation(line: 139, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !13, line: 138, column: 13)
!241 = !DILocation(line: 139, column: 24, scope: !240)
!242 = !DILocation(line: 139, column: 27, scope: !240)
!243 = !DILocation(line: 140, column: 13, scope: !240)
!244 = !DILocation(line: 137, column: 34, scope: !236)
!245 = !DILocation(line: 137, column: 13, scope: !236)
!246 = distinct !{!246, !238, !247, !66}
!247 = !DILocation(line: 140, column: 13, scope: !233)
!248 = !DILocation(line: 142, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !219, file: !13, line: 142, column: 17)
!250 = !DILocation(line: 142, column: 22, scope: !249)
!251 = !DILocation(line: 142, column: 27, scope: !249)
!252 = !DILocation(line: 142, column: 30, scope: !249)
!253 = !DILocation(line: 142, column: 35, scope: !249)
!254 = !DILocation(line: 142, column: 17, scope: !219)
!255 = !DILocation(line: 144, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !249, file: !13, line: 143, column: 13)
!257 = !DILocation(line: 144, column: 24, scope: !256)
!258 = !DILocation(line: 144, column: 30, scope: !256)
!259 = !DILocation(line: 146, column: 23, scope: !260)
!260 = distinct !DILexicalBlock(scope: !256, file: !13, line: 146, column: 17)
!261 = !DILocation(line: 146, column: 21, scope: !260)
!262 = !DILocation(line: 146, column: 28, scope: !263)
!263 = distinct !DILexicalBlock(scope: !260, file: !13, line: 146, column: 17)
!264 = !DILocation(line: 146, column: 30, scope: !263)
!265 = !DILocation(line: 146, column: 17, scope: !260)
!266 = !DILocation(line: 148, column: 34, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !13, line: 147, column: 17)
!268 = !DILocation(line: 148, column: 41, scope: !267)
!269 = !DILocation(line: 148, column: 21, scope: !267)
!270 = !DILocation(line: 149, column: 17, scope: !267)
!271 = !DILocation(line: 146, column: 37, scope: !263)
!272 = !DILocation(line: 146, column: 17, scope: !263)
!273 = distinct !{!273, !265, !274, !66}
!274 = !DILocation(line: 149, column: 17, scope: !260)
!275 = !DILocation(line: 150, column: 13, scope: !256)
!276 = !DILocation(line: 153, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !249, file: !13, line: 152, column: 13)
!278 = !DILocation(line: 155, column: 18, scope: !219)
!279 = !DILocation(line: 155, column: 13, scope: !219)
!280 = !DILocation(line: 157, column: 5, scope: !220)
!281 = !DILocation(line: 158, column: 1, scope: !204)
!282 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 161, type: !21, scopeLine: 162, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!283 = !DILocalVariable(name: "data", scope: !282, file: !13, line: 163, type: !6)
!284 = !DILocation(line: 163, column: 9, scope: !282)
!285 = !DILocation(line: 165, column: 10, scope: !282)
!286 = !DILocation(line: 166, column: 8, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !13, line: 166, column: 8)
!288 = !DILocation(line: 166, column: 8, scope: !282)
!289 = !DILocation(line: 169, column: 9, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !13, line: 167, column: 5)
!291 = !DILocation(line: 170, column: 5, scope: !290)
!292 = !DILocation(line: 175, column: 14, scope: !293)
!293 = distinct !DILexicalBlock(scope: !287, file: !13, line: 172, column: 5)
!294 = !DILocation(line: 177, column: 8, scope: !295)
!295 = distinct !DILexicalBlock(scope: !282, file: !13, line: 177, column: 8)
!296 = !DILocation(line: 177, column: 8, scope: !282)
!297 = !DILocalVariable(name: "i", scope: !298, file: !13, line: 180, type: !6)
!298 = distinct !DILexicalBlock(scope: !299, file: !13, line: 179, column: 9)
!299 = distinct !DILexicalBlock(scope: !295, file: !13, line: 178, column: 5)
!300 = !DILocation(line: 180, column: 17, scope: !298)
!301 = !DILocalVariable(name: "buffer", scope: !298, file: !13, line: 181, type: !8)
!302 = !DILocation(line: 181, column: 19, scope: !298)
!303 = !DILocation(line: 181, column: 35, scope: !298)
!304 = !DILocation(line: 181, column: 28, scope: !298)
!305 = !DILocation(line: 182, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !298, file: !13, line: 182, column: 17)
!307 = !DILocation(line: 182, column: 24, scope: !306)
!308 = !DILocation(line: 182, column: 17, scope: !298)
!309 = !DILocation(line: 182, column: 34, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !13, line: 182, column: 33)
!311 = !DILocation(line: 184, column: 20, scope: !312)
!312 = distinct !DILexicalBlock(scope: !298, file: !13, line: 184, column: 13)
!313 = !DILocation(line: 184, column: 18, scope: !312)
!314 = !DILocation(line: 184, column: 25, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !13, line: 184, column: 13)
!316 = !DILocation(line: 184, column: 27, scope: !315)
!317 = !DILocation(line: 184, column: 13, scope: !312)
!318 = !DILocation(line: 186, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !13, line: 185, column: 13)
!320 = !DILocation(line: 186, column: 24, scope: !319)
!321 = !DILocation(line: 186, column: 27, scope: !319)
!322 = !DILocation(line: 187, column: 13, scope: !319)
!323 = !DILocation(line: 184, column: 34, scope: !315)
!324 = !DILocation(line: 184, column: 13, scope: !315)
!325 = distinct !{!325, !317, !326, !66}
!326 = !DILocation(line: 187, column: 13, scope: !312)
!327 = !DILocation(line: 190, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !298, file: !13, line: 190, column: 17)
!329 = !DILocation(line: 190, column: 22, scope: !328)
!330 = !DILocation(line: 190, column: 17, scope: !298)
!331 = !DILocation(line: 192, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !13, line: 191, column: 13)
!333 = !DILocation(line: 192, column: 24, scope: !332)
!334 = !DILocation(line: 192, column: 30, scope: !332)
!335 = !DILocation(line: 194, column: 23, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !13, line: 194, column: 17)
!337 = !DILocation(line: 194, column: 21, scope: !336)
!338 = !DILocation(line: 194, column: 28, scope: !339)
!339 = distinct !DILexicalBlock(scope: !336, file: !13, line: 194, column: 17)
!340 = !DILocation(line: 194, column: 30, scope: !339)
!341 = !DILocation(line: 194, column: 17, scope: !336)
!342 = !DILocation(line: 196, column: 34, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !13, line: 195, column: 17)
!344 = !DILocation(line: 196, column: 41, scope: !343)
!345 = !DILocation(line: 196, column: 21, scope: !343)
!346 = !DILocation(line: 197, column: 17, scope: !343)
!347 = !DILocation(line: 194, column: 37, scope: !339)
!348 = !DILocation(line: 194, column: 17, scope: !339)
!349 = distinct !{!349, !341, !350, !66}
!350 = !DILocation(line: 197, column: 17, scope: !336)
!351 = !DILocation(line: 198, column: 13, scope: !332)
!352 = !DILocation(line: 201, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !328, file: !13, line: 200, column: 13)
!354 = !DILocation(line: 203, column: 18, scope: !298)
!355 = !DILocation(line: 203, column: 13, scope: !298)
!356 = !DILocation(line: 205, column: 5, scope: !299)
!357 = !DILocation(line: 206, column: 1, scope: !282)
!358 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 209, type: !21, scopeLine: 210, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!359 = !DILocalVariable(name: "data", scope: !358, file: !13, line: 211, type: !6)
!360 = !DILocation(line: 211, column: 9, scope: !358)
!361 = !DILocation(line: 213, column: 10, scope: !358)
!362 = !DILocation(line: 214, column: 8, scope: !363)
!363 = distinct !DILexicalBlock(scope: !358, file: !13, line: 214, column: 8)
!364 = !DILocation(line: 214, column: 8, scope: !358)
!365 = !DILocation(line: 218, column: 14, scope: !366)
!366 = distinct !DILexicalBlock(scope: !363, file: !13, line: 215, column: 5)
!367 = !DILocation(line: 219, column: 5, scope: !366)
!368 = !DILocation(line: 220, column: 8, scope: !369)
!369 = distinct !DILexicalBlock(scope: !358, file: !13, line: 220, column: 8)
!370 = !DILocation(line: 220, column: 8, scope: !358)
!371 = !DILocalVariable(name: "i", scope: !372, file: !13, line: 223, type: !6)
!372 = distinct !DILexicalBlock(scope: !373, file: !13, line: 222, column: 9)
!373 = distinct !DILexicalBlock(scope: !369, file: !13, line: 221, column: 5)
!374 = !DILocation(line: 223, column: 17, scope: !372)
!375 = !DILocalVariable(name: "buffer", scope: !372, file: !13, line: 224, type: !8)
!376 = !DILocation(line: 224, column: 19, scope: !372)
!377 = !DILocation(line: 224, column: 35, scope: !372)
!378 = !DILocation(line: 224, column: 28, scope: !372)
!379 = !DILocation(line: 225, column: 17, scope: !380)
!380 = distinct !DILexicalBlock(scope: !372, file: !13, line: 225, column: 17)
!381 = !DILocation(line: 225, column: 24, scope: !380)
!382 = !DILocation(line: 225, column: 17, scope: !372)
!383 = !DILocation(line: 225, column: 34, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !13, line: 225, column: 33)
!385 = !DILocation(line: 227, column: 20, scope: !386)
!386 = distinct !DILexicalBlock(scope: !372, file: !13, line: 227, column: 13)
!387 = !DILocation(line: 227, column: 18, scope: !386)
!388 = !DILocation(line: 227, column: 25, scope: !389)
!389 = distinct !DILexicalBlock(scope: !386, file: !13, line: 227, column: 13)
!390 = !DILocation(line: 227, column: 27, scope: !389)
!391 = !DILocation(line: 227, column: 13, scope: !386)
!392 = !DILocation(line: 229, column: 17, scope: !393)
!393 = distinct !DILexicalBlock(scope: !389, file: !13, line: 228, column: 13)
!394 = !DILocation(line: 229, column: 24, scope: !393)
!395 = !DILocation(line: 229, column: 27, scope: !393)
!396 = !DILocation(line: 230, column: 13, scope: !393)
!397 = !DILocation(line: 227, column: 34, scope: !389)
!398 = !DILocation(line: 227, column: 13, scope: !389)
!399 = distinct !{!399, !391, !400, !66}
!400 = !DILocation(line: 230, column: 13, scope: !386)
!401 = !DILocation(line: 233, column: 17, scope: !402)
!402 = distinct !DILexicalBlock(scope: !372, file: !13, line: 233, column: 17)
!403 = !DILocation(line: 233, column: 22, scope: !402)
!404 = !DILocation(line: 233, column: 17, scope: !372)
!405 = !DILocation(line: 235, column: 17, scope: !406)
!406 = distinct !DILexicalBlock(scope: !402, file: !13, line: 234, column: 13)
!407 = !DILocation(line: 235, column: 24, scope: !406)
!408 = !DILocation(line: 235, column: 30, scope: !406)
!409 = !DILocation(line: 237, column: 23, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !13, line: 237, column: 17)
!411 = !DILocation(line: 237, column: 21, scope: !410)
!412 = !DILocation(line: 237, column: 28, scope: !413)
!413 = distinct !DILexicalBlock(scope: !410, file: !13, line: 237, column: 17)
!414 = !DILocation(line: 237, column: 30, scope: !413)
!415 = !DILocation(line: 237, column: 17, scope: !410)
!416 = !DILocation(line: 239, column: 34, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !13, line: 238, column: 17)
!418 = !DILocation(line: 239, column: 41, scope: !417)
!419 = !DILocation(line: 239, column: 21, scope: !417)
!420 = !DILocation(line: 240, column: 17, scope: !417)
!421 = !DILocation(line: 237, column: 37, scope: !413)
!422 = !DILocation(line: 237, column: 17, scope: !413)
!423 = distinct !{!423, !415, !424, !66}
!424 = !DILocation(line: 240, column: 17, scope: !410)
!425 = !DILocation(line: 241, column: 13, scope: !406)
!426 = !DILocation(line: 244, column: 17, scope: !427)
!427 = distinct !DILexicalBlock(scope: !402, file: !13, line: 243, column: 13)
!428 = !DILocation(line: 246, column: 18, scope: !372)
!429 = !DILocation(line: 246, column: 13, scope: !372)
!430 = !DILocation(line: 248, column: 5, scope: !373)
!431 = !DILocation(line: 249, column: 1, scope: !358)
