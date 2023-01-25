; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !25
  %and = and i32 %call, 1, !dbg !25
  %tobool = icmp ne i32 %and, 0, !dbg !25
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !25

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand() #5, !dbg !25
  %shl = shl i32 %call1, 30, !dbg !25
  %call2 = call i32 @rand() #5, !dbg !25
  %shl3 = shl i32 %call2, 15, !dbg !25
  %xor = xor i32 %shl, %shl3, !dbg !25
  %call4 = call i32 @rand() #5, !dbg !25
  %xor5 = xor i32 %xor, %call4, !dbg !25
  br label %cond.end, !dbg !25

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand() #5, !dbg !25
  %shl7 = shl i32 %call6, 30, !dbg !25
  %call8 = call i32 @rand() #5, !dbg !25
  %shl9 = shl i32 %call8, 15, !dbg !25
  %xor10 = xor i32 %shl7, %shl9, !dbg !25
  %call11 = call i32 @rand() #5, !dbg !25
  %xor12 = xor i32 %xor10, %call11, !dbg !25
  %sub = sub i32 0, %xor12, !dbg !25
  %sub13 = sub i32 %sub, 1, !dbg !25
  br label %cond.end, !dbg !25

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !25
  store i32 %cond, i32* %data, align 4, !dbg !27
  br label %if.end, !dbg !28

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !29
  %cmp14 = icmp eq i32 %1, 5, !dbg !31
  br i1 %cmp14, label %if.then15, label %if.end34, !dbg !32

if.then15:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !37, metadata !DIExpression()), !dbg !38
  %call16 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !39
  %2 = bitcast i8* %call16 to i32*, !dbg !40
  store i32* %2, i32** %buffer, align 8, !dbg !38
  %3 = load i32*, i32** %buffer, align 8, !dbg !41
  %cmp17 = icmp eq i32* %3, null, !dbg !43
  br i1 %cmp17, label %if.then18, label %if.end19, !dbg !44

if.then18:                                        ; preds = %if.then15
  call void @exit(i32 -1) #6, !dbg !45
  unreachable, !dbg !45

if.end19:                                         ; preds = %if.then15
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end19
  %4 = load i32, i32* %i, align 4, !dbg !50
  %cmp20 = icmp slt i32 %4, 10, !dbg !52
  br i1 %cmp20, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !54
  %6 = load i32, i32* %i, align 4, !dbg !56
  %idxprom = sext i32 %6 to i64, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %7, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !64
  %cmp21 = icmp sge i32 %8, 0, !dbg !66
  br i1 %cmp21, label %if.then22, label %if.else, !dbg !67

if.then22:                                        ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !68
  %10 = load i32, i32* %data, align 4, !dbg !70
  %idxprom23 = sext i32 %10 to i64, !dbg !68
  %arrayidx24 = getelementptr inbounds i32, i32* %9, i64 %idxprom23, !dbg !68
  store i32 1, i32* %arrayidx24, align 4, !dbg !71
  store i32 0, i32* %i, align 4, !dbg !72
  br label %for.cond25, !dbg !74

for.cond25:                                       ; preds = %for.inc30, %if.then22
  %11 = load i32, i32* %i, align 4, !dbg !75
  %cmp26 = icmp slt i32 %11, 10, !dbg !77
  br i1 %cmp26, label %for.body27, label %for.end32, !dbg !78

for.body27:                                       ; preds = %for.cond25
  %12 = load i32*, i32** %buffer, align 8, !dbg !79
  %13 = load i32, i32* %i, align 4, !dbg !81
  %idxprom28 = sext i32 %13 to i64, !dbg !79
  %arrayidx29 = getelementptr inbounds i32, i32* %12, i64 %idxprom28, !dbg !79
  %14 = load i32, i32* %arrayidx29, align 4, !dbg !79
  call void @printIntLine(i32 %14), !dbg !82
  br label %for.inc30, !dbg !83

for.inc30:                                        ; preds = %for.body27
  %15 = load i32, i32* %i, align 4, !dbg !84
  %inc31 = add nsw i32 %15, 1, !dbg !84
  store i32 %inc31, i32* %i, align 4, !dbg !84
  br label %for.cond25, !dbg !85, !llvm.loop !86

for.end32:                                        ; preds = %for.cond25
  br label %if.end33, !dbg !88

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !89
  br label %if.end33

if.end33:                                         ; preds = %if.else, %for.end32
  %16 = load i32*, i32** %buffer, align 8, !dbg !91
  %17 = bitcast i32* %16 to i8*, !dbg !91
  call void @free(i8* %17) #5, !dbg !92
  br label %if.end34, !dbg !93

if.end34:                                         ; preds = %if.end33, %if.end
  ret void, !dbg !94
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13_good() #0 !dbg !95 {
entry:
  call void @goodB2G1(), !dbg !96
  call void @goodB2G2(), !dbg !97
  call void @goodG2B1(), !dbg !98
  call void @goodG2B2(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* null) #5, !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #5, !dbg !113
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !121 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i32 -1, i32* %data, align 4, !dbg !124
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !125
  %cmp = icmp eq i32 %0, 5, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !129
  %and = and i32 %call, 1, !dbg !129
  %tobool = icmp ne i32 %and, 0, !dbg !129
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !129

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand() #5, !dbg !129
  %shl = shl i32 %call1, 30, !dbg !129
  %call2 = call i32 @rand() #5, !dbg !129
  %shl3 = shl i32 %call2, 15, !dbg !129
  %xor = xor i32 %shl, %shl3, !dbg !129
  %call4 = call i32 @rand() #5, !dbg !129
  %xor5 = xor i32 %xor, %call4, !dbg !129
  br label %cond.end, !dbg !129

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand() #5, !dbg !129
  %shl7 = shl i32 %call6, 30, !dbg !129
  %call8 = call i32 @rand() #5, !dbg !129
  %shl9 = shl i32 %call8, 15, !dbg !129
  %xor10 = xor i32 %shl7, %shl9, !dbg !129
  %call11 = call i32 @rand() #5, !dbg !129
  %xor12 = xor i32 %xor10, %call11, !dbg !129
  %sub = sub i32 0, %xor12, !dbg !129
  %sub13 = sub i32 %sub, 1, !dbg !129
  br label %cond.end, !dbg !129

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !129
  store i32 %cond, i32* %data, align 4, !dbg !131
  br label %if.end, !dbg !132

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !133
  %cmp14 = icmp ne i32 %1, 5, !dbg !135
  br i1 %cmp14, label %if.then15, label %if.else, !dbg !136

if.then15:                                        ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !137
  br label %if.end36, !dbg !139

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !140, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !144, metadata !DIExpression()), !dbg !145
  %call16 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !146
  %2 = bitcast i8* %call16 to i32*, !dbg !147
  store i32* %2, i32** %buffer, align 8, !dbg !145
  %3 = load i32*, i32** %buffer, align 8, !dbg !148
  %cmp17 = icmp eq i32* %3, null, !dbg !150
  br i1 %cmp17, label %if.then18, label %if.end19, !dbg !151

if.then18:                                        ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !152
  unreachable, !dbg !152

if.end19:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end19
  %4 = load i32, i32* %i, align 4, !dbg !157
  %cmp20 = icmp slt i32 %4, 10, !dbg !159
  br i1 %cmp20, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !161
  %6 = load i32, i32* %i, align 4, !dbg !163
  %idxprom = sext i32 %6 to i64, !dbg !161
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !161
  store i32 0, i32* %arrayidx, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !166
  %inc = add nsw i32 %7, 1, !dbg !166
  store i32 %inc, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !170
  %cmp21 = icmp sge i32 %8, 0, !dbg !172
  br i1 %cmp21, label %land.lhs.true, label %if.else34, !dbg !173

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !174
  %cmp22 = icmp slt i32 %9, 10, !dbg !175
  br i1 %cmp22, label %if.then23, label %if.else34, !dbg !176

if.then23:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !177
  %11 = load i32, i32* %data, align 4, !dbg !179
  %idxprom24 = sext i32 %11 to i64, !dbg !177
  %arrayidx25 = getelementptr inbounds i32, i32* %10, i64 %idxprom24, !dbg !177
  store i32 1, i32* %arrayidx25, align 4, !dbg !180
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond26, !dbg !183

for.cond26:                                       ; preds = %for.inc31, %if.then23
  %12 = load i32, i32* %i, align 4, !dbg !184
  %cmp27 = icmp slt i32 %12, 10, !dbg !186
  br i1 %cmp27, label %for.body28, label %for.end33, !dbg !187

for.body28:                                       ; preds = %for.cond26
  %13 = load i32*, i32** %buffer, align 8, !dbg !188
  %14 = load i32, i32* %i, align 4, !dbg !190
  %idxprom29 = sext i32 %14 to i64, !dbg !188
  %arrayidx30 = getelementptr inbounds i32, i32* %13, i64 %idxprom29, !dbg !188
  %15 = load i32, i32* %arrayidx30, align 4, !dbg !188
  call void @printIntLine(i32 %15), !dbg !191
  br label %for.inc31, !dbg !192

for.inc31:                                        ; preds = %for.body28
  %16 = load i32, i32* %i, align 4, !dbg !193
  %inc32 = add nsw i32 %16, 1, !dbg !193
  store i32 %inc32, i32* %i, align 4, !dbg !193
  br label %for.cond26, !dbg !194, !llvm.loop !195

for.end33:                                        ; preds = %for.cond26
  br label %if.end35, !dbg !197

if.else34:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !198
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %for.end33
  %17 = load i32*, i32** %buffer, align 8, !dbg !200
  %18 = bitcast i32* %17 to i8*, !dbg !200
  call void @free(i8* %18) #5, !dbg !201
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then15
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !207
  %cmp = icmp eq i32 %0, 5, !dbg !209
  br i1 %cmp, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !211
  %and = and i32 %call, 1, !dbg !211
  %tobool = icmp ne i32 %and, 0, !dbg !211
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !211

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand() #5, !dbg !211
  %shl = shl i32 %call1, 30, !dbg !211
  %call2 = call i32 @rand() #5, !dbg !211
  %shl3 = shl i32 %call2, 15, !dbg !211
  %xor = xor i32 %shl, %shl3, !dbg !211
  %call4 = call i32 @rand() #5, !dbg !211
  %xor5 = xor i32 %xor, %call4, !dbg !211
  br label %cond.end, !dbg !211

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand() #5, !dbg !211
  %shl7 = shl i32 %call6, 30, !dbg !211
  %call8 = call i32 @rand() #5, !dbg !211
  %shl9 = shl i32 %call8, 15, !dbg !211
  %xor10 = xor i32 %shl7, %shl9, !dbg !211
  %call11 = call i32 @rand() #5, !dbg !211
  %xor12 = xor i32 %xor10, %call11, !dbg !211
  %sub = sub i32 0, %xor12, !dbg !211
  %sub13 = sub i32 %sub, 1, !dbg !211
  br label %cond.end, !dbg !211

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !211
  store i32 %cond, i32* %data, align 4, !dbg !213
  br label %if.end, !dbg !214

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !215
  %cmp14 = icmp eq i32 %1, 5, !dbg !217
  br i1 %cmp14, label %if.then15, label %if.end35, !dbg !218

if.then15:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !219, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !223, metadata !DIExpression()), !dbg !224
  %call16 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !225
  %2 = bitcast i8* %call16 to i32*, !dbg !226
  store i32* %2, i32** %buffer, align 8, !dbg !224
  %3 = load i32*, i32** %buffer, align 8, !dbg !227
  %cmp17 = icmp eq i32* %3, null, !dbg !229
  br i1 %cmp17, label %if.then18, label %if.end19, !dbg !230

if.then18:                                        ; preds = %if.then15
  call void @exit(i32 -1) #6, !dbg !231
  unreachable, !dbg !231

if.end19:                                         ; preds = %if.then15
  store i32 0, i32* %i, align 4, !dbg !233
  br label %for.cond, !dbg !235

for.cond:                                         ; preds = %for.inc, %if.end19
  %4 = load i32, i32* %i, align 4, !dbg !236
  %cmp20 = icmp slt i32 %4, 10, !dbg !238
  br i1 %cmp20, label %for.body, label %for.end, !dbg !239

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !240
  %6 = load i32, i32* %i, align 4, !dbg !242
  %idxprom = sext i32 %6 to i64, !dbg !240
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !240
  store i32 0, i32* %arrayidx, align 4, !dbg !243
  br label %for.inc, !dbg !244

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !245
  %inc = add nsw i32 %7, 1, !dbg !245
  store i32 %inc, i32* %i, align 4, !dbg !245
  br label %for.cond, !dbg !246, !llvm.loop !247

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !249
  %cmp21 = icmp sge i32 %8, 0, !dbg !251
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !252

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !253
  %cmp22 = icmp slt i32 %9, 10, !dbg !254
  br i1 %cmp22, label %if.then23, label %if.else, !dbg !255

if.then23:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !256
  %11 = load i32, i32* %data, align 4, !dbg !258
  %idxprom24 = sext i32 %11 to i64, !dbg !256
  %arrayidx25 = getelementptr inbounds i32, i32* %10, i64 %idxprom24, !dbg !256
  store i32 1, i32* %arrayidx25, align 4, !dbg !259
  store i32 0, i32* %i, align 4, !dbg !260
  br label %for.cond26, !dbg !262

for.cond26:                                       ; preds = %for.inc31, %if.then23
  %12 = load i32, i32* %i, align 4, !dbg !263
  %cmp27 = icmp slt i32 %12, 10, !dbg !265
  br i1 %cmp27, label %for.body28, label %for.end33, !dbg !266

for.body28:                                       ; preds = %for.cond26
  %13 = load i32*, i32** %buffer, align 8, !dbg !267
  %14 = load i32, i32* %i, align 4, !dbg !269
  %idxprom29 = sext i32 %14 to i64, !dbg !267
  %arrayidx30 = getelementptr inbounds i32, i32* %13, i64 %idxprom29, !dbg !267
  %15 = load i32, i32* %arrayidx30, align 4, !dbg !267
  call void @printIntLine(i32 %15), !dbg !270
  br label %for.inc31, !dbg !271

for.inc31:                                        ; preds = %for.body28
  %16 = load i32, i32* %i, align 4, !dbg !272
  %inc32 = add nsw i32 %16, 1, !dbg !272
  store i32 %inc32, i32* %i, align 4, !dbg !272
  br label %for.cond26, !dbg !273, !llvm.loop !274

for.end33:                                        ; preds = %for.cond26
  br label %if.end34, !dbg !276

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !277
  br label %if.end34

if.end34:                                         ; preds = %if.else, %for.end33
  %17 = load i32*, i32** %buffer, align 8, !dbg !279
  %18 = bitcast i32* %17 to i8*, !dbg !279
  call void @free(i8* %18) #5, !dbg !280
  br label %if.end35, !dbg !281

if.end35:                                         ; preds = %if.end34, %if.end
  ret void, !dbg !282
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !283 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !284, metadata !DIExpression()), !dbg !285
  store i32 -1, i32* %data, align 4, !dbg !286
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !287
  %cmp = icmp ne i32 %0, 5, !dbg !289
  br i1 %cmp, label %if.then, label %if.else, !dbg !290

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !291
  br label %if.end, !dbg !293

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !294
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !296
  %cmp1 = icmp eq i32 %1, 5, !dbg !298
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !299

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !300, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !304, metadata !DIExpression()), !dbg !305
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !306
  %2 = bitcast i8* %call to i32*, !dbg !307
  store i32* %2, i32** %buffer, align 8, !dbg !305
  %3 = load i32*, i32** %buffer, align 8, !dbg !308
  %cmp3 = icmp eq i32* %3, null, !dbg !310
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !311

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !312
  unreachable, !dbg !312

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !314
  br label %for.cond, !dbg !316

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !317
  %cmp6 = icmp slt i32 %4, 10, !dbg !319
  br i1 %cmp6, label %for.body, label %for.end, !dbg !320

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !321
  %6 = load i32, i32* %i, align 4, !dbg !323
  %idxprom = sext i32 %6 to i64, !dbg !321
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !321
  store i32 0, i32* %arrayidx, align 4, !dbg !324
  br label %for.inc, !dbg !325

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !326
  %inc = add nsw i32 %7, 1, !dbg !326
  store i32 %inc, i32* %i, align 4, !dbg !326
  br label %for.cond, !dbg !327, !llvm.loop !328

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !330
  %cmp7 = icmp sge i32 %8, 0, !dbg !332
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !333

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !334
  %10 = load i32, i32* %data, align 4, !dbg !336
  %idxprom9 = sext i32 %10 to i64, !dbg !334
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !334
  store i32 1, i32* %arrayidx10, align 4, !dbg !337
  store i32 0, i32* %i, align 4, !dbg !338
  br label %for.cond11, !dbg !340

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !341
  %cmp12 = icmp slt i32 %11, 10, !dbg !343
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !344

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !345
  %13 = load i32, i32* %i, align 4, !dbg !347
  %idxprom14 = sext i32 %13 to i64, !dbg !345
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !345
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !345
  call void @printIntLine(i32 %14), !dbg !348
  br label %for.inc16, !dbg !349

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !350
  %inc17 = add nsw i32 %15, 1, !dbg !350
  store i32 %inc17, i32* %i, align 4, !dbg !350
  br label %for.cond11, !dbg !351, !llvm.loop !352

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !354

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !355
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !357
  %17 = bitcast i32* %16 to i8*, !dbg !357
  call void @free(i8* %17) #5, !dbg !358
  br label %if.end21, !dbg !359

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !360
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !361 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !362, metadata !DIExpression()), !dbg !363
  store i32 -1, i32* %data, align 4, !dbg !364
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !365
  %cmp = icmp eq i32 %0, 5, !dbg !367
  br i1 %cmp, label %if.then, label %if.end, !dbg !368

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !369
  br label %if.end, !dbg !371

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !372
  %cmp1 = icmp eq i32 %1, 5, !dbg !374
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !375

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !376, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !380, metadata !DIExpression()), !dbg !381
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !382
  %2 = bitcast i8* %call to i32*, !dbg !383
  store i32* %2, i32** %buffer, align 8, !dbg !381
  %3 = load i32*, i32** %buffer, align 8, !dbg !384
  %cmp3 = icmp eq i32* %3, null, !dbg !386
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !387

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !388
  unreachable, !dbg !388

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !390
  br label %for.cond, !dbg !392

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !393
  %cmp6 = icmp slt i32 %4, 10, !dbg !395
  br i1 %cmp6, label %for.body, label %for.end, !dbg !396

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !397
  %6 = load i32, i32* %i, align 4, !dbg !399
  %idxprom = sext i32 %6 to i64, !dbg !397
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !397
  store i32 0, i32* %arrayidx, align 4, !dbg !400
  br label %for.inc, !dbg !401

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !402
  %inc = add nsw i32 %7, 1, !dbg !402
  store i32 %inc, i32* %i, align 4, !dbg !402
  br label %for.cond, !dbg !403, !llvm.loop !404

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !406
  %cmp7 = icmp sge i32 %8, 0, !dbg !408
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !409

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !410
  %10 = load i32, i32* %data, align 4, !dbg !412
  %idxprom9 = sext i32 %10 to i64, !dbg !410
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !410
  store i32 1, i32* %arrayidx10, align 4, !dbg !413
  store i32 0, i32* %i, align 4, !dbg !414
  br label %for.cond11, !dbg !416

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !417
  %cmp12 = icmp slt i32 %11, 10, !dbg !419
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !420

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !421
  %13 = load i32, i32* %i, align 4, !dbg !423
  %idxprom14 = sext i32 %13 to i64, !dbg !421
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !421
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !421
  call void @printIntLine(i32 %14), !dbg !424
  br label %for.inc16, !dbg !425

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !426
  %inc17 = add nsw i32 %15, 1, !dbg !426
  store i32 %inc17, i32* %i, align 4, !dbg !426
  br label %for.cond11, !dbg !427, !llvm.loop !428

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !430

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !431
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !433
  %17 = bitcast i32* %16 to i8*, !dbg !433
  call void @free(i8* %17) #5, !dbg !434
  br label %if.end20, !dbg !435

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !436
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 25, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocation(line: 30, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 14, scope: !26)
!28 = !DILocation(line: 31, column: 5, scope: !26)
!29 = !DILocation(line: 32, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!31 = !DILocation(line: 32, column: 25, scope: !30)
!32 = !DILocation(line: 32, column: 8, scope: !14)
!33 = !DILocalVariable(name: "i", scope: !34, file: !15, line: 35, type: !4)
!34 = distinct !DILexicalBlock(scope: !35, file: !15, line: 34, column: 9)
!35 = distinct !DILexicalBlock(scope: !30, file: !15, line: 33, column: 5)
!36 = !DILocation(line: 35, column: 17, scope: !34)
!37 = !DILocalVariable(name: "buffer", scope: !34, file: !15, line: 36, type: !6)
!38 = !DILocation(line: 36, column: 19, scope: !34)
!39 = !DILocation(line: 36, column: 35, scope: !34)
!40 = !DILocation(line: 36, column: 28, scope: !34)
!41 = !DILocation(line: 37, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !34, file: !15, line: 37, column: 17)
!43 = !DILocation(line: 37, column: 24, scope: !42)
!44 = !DILocation(line: 37, column: 17, scope: !34)
!45 = !DILocation(line: 37, column: 34, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 37, column: 33)
!47 = !DILocation(line: 39, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !15, line: 39, column: 13)
!49 = !DILocation(line: 39, column: 18, scope: !48)
!50 = !DILocation(line: 39, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 39, column: 13)
!52 = !DILocation(line: 39, column: 27, scope: !51)
!53 = !DILocation(line: 39, column: 13, scope: !48)
!54 = !DILocation(line: 41, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 40, column: 13)
!56 = !DILocation(line: 41, column: 24, scope: !55)
!57 = !DILocation(line: 41, column: 27, scope: !55)
!58 = !DILocation(line: 42, column: 13, scope: !55)
!59 = !DILocation(line: 39, column: 34, scope: !51)
!60 = !DILocation(line: 39, column: 13, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 42, column: 13, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 45, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !34, file: !15, line: 45, column: 17)
!66 = !DILocation(line: 45, column: 22, scope: !65)
!67 = !DILocation(line: 45, column: 17, scope: !34)
!68 = !DILocation(line: 47, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 46, column: 13)
!70 = !DILocation(line: 47, column: 24, scope: !69)
!71 = !DILocation(line: 47, column: 30, scope: !69)
!72 = !DILocation(line: 49, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 49, column: 17)
!74 = !DILocation(line: 49, column: 21, scope: !73)
!75 = !DILocation(line: 49, column: 28, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !15, line: 49, column: 17)
!77 = !DILocation(line: 49, column: 30, scope: !76)
!78 = !DILocation(line: 49, column: 17, scope: !73)
!79 = !DILocation(line: 51, column: 34, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 50, column: 17)
!81 = !DILocation(line: 51, column: 41, scope: !80)
!82 = !DILocation(line: 51, column: 21, scope: !80)
!83 = !DILocation(line: 52, column: 17, scope: !80)
!84 = !DILocation(line: 49, column: 37, scope: !76)
!85 = !DILocation(line: 49, column: 17, scope: !76)
!86 = distinct !{!86, !78, !87, !63}
!87 = !DILocation(line: 52, column: 17, scope: !73)
!88 = !DILocation(line: 53, column: 13, scope: !69)
!89 = !DILocation(line: 56, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !65, file: !15, line: 55, column: 13)
!91 = !DILocation(line: 58, column: 18, scope: !34)
!92 = !DILocation(line: 58, column: 13, scope: !34)
!93 = !DILocation(line: 60, column: 5, scope: !35)
!94 = !DILocation(line: 61, column: 1, scope: !14)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_13_good", scope: !15, file: !15, line: 245, type: !16, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 247, column: 5, scope: !95)
!97 = !DILocation(line: 248, column: 5, scope: !95)
!98 = !DILocation(line: 249, column: 5, scope: !95)
!99 = !DILocation(line: 250, column: 5, scope: !95)
!100 = !DILocation(line: 251, column: 1, scope: !95)
!101 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 262, type: !102, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!4, !4, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !15, line: 262, type: !4)
!108 = !DILocation(line: 262, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !15, line: 262, type: !104)
!110 = !DILocation(line: 262, column: 27, scope: !101)
!111 = !DILocation(line: 265, column: 22, scope: !101)
!112 = !DILocation(line: 265, column: 12, scope: !101)
!113 = !DILocation(line: 265, column: 5, scope: !101)
!114 = !DILocation(line: 267, column: 5, scope: !101)
!115 = !DILocation(line: 268, column: 5, scope: !101)
!116 = !DILocation(line: 269, column: 5, scope: !101)
!117 = !DILocation(line: 272, column: 5, scope: !101)
!118 = !DILocation(line: 273, column: 5, scope: !101)
!119 = !DILocation(line: 274, column: 5, scope: !101)
!120 = !DILocation(line: 276, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !15, line: 70, type: !4)
!123 = !DILocation(line: 70, column: 9, scope: !121)
!124 = !DILocation(line: 72, column: 10, scope: !121)
!125 = !DILocation(line: 73, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !15, line: 73, column: 8)
!127 = !DILocation(line: 73, column: 25, scope: !126)
!128 = !DILocation(line: 73, column: 8, scope: !121)
!129 = !DILocation(line: 76, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 74, column: 5)
!131 = !DILocation(line: 76, column: 14, scope: !130)
!132 = !DILocation(line: 77, column: 5, scope: !130)
!133 = !DILocation(line: 78, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !121, file: !15, line: 78, column: 8)
!135 = !DILocation(line: 78, column: 25, scope: !134)
!136 = !DILocation(line: 78, column: 8, scope: !121)
!137 = !DILocation(line: 81, column: 9, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !15, line: 79, column: 5)
!139 = !DILocation(line: 82, column: 5, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !15, line: 86, type: !4)
!141 = distinct !DILexicalBlock(scope: !142, file: !15, line: 85, column: 9)
!142 = distinct !DILexicalBlock(scope: !134, file: !15, line: 84, column: 5)
!143 = !DILocation(line: 86, column: 17, scope: !141)
!144 = !DILocalVariable(name: "buffer", scope: !141, file: !15, line: 87, type: !6)
!145 = !DILocation(line: 87, column: 19, scope: !141)
!146 = !DILocation(line: 87, column: 35, scope: !141)
!147 = !DILocation(line: 87, column: 28, scope: !141)
!148 = !DILocation(line: 88, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !141, file: !15, line: 88, column: 17)
!150 = !DILocation(line: 88, column: 24, scope: !149)
!151 = !DILocation(line: 88, column: 17, scope: !141)
!152 = !DILocation(line: 88, column: 34, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 88, column: 33)
!154 = !DILocation(line: 90, column: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !141, file: !15, line: 90, column: 13)
!156 = !DILocation(line: 90, column: 18, scope: !155)
!157 = !DILocation(line: 90, column: 25, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !15, line: 90, column: 13)
!159 = !DILocation(line: 90, column: 27, scope: !158)
!160 = !DILocation(line: 90, column: 13, scope: !155)
!161 = !DILocation(line: 92, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !15, line: 91, column: 13)
!163 = !DILocation(line: 92, column: 24, scope: !162)
!164 = !DILocation(line: 92, column: 27, scope: !162)
!165 = !DILocation(line: 93, column: 13, scope: !162)
!166 = !DILocation(line: 90, column: 34, scope: !158)
!167 = !DILocation(line: 90, column: 13, scope: !158)
!168 = distinct !{!168, !160, !169, !63}
!169 = !DILocation(line: 93, column: 13, scope: !155)
!170 = !DILocation(line: 95, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !141, file: !15, line: 95, column: 17)
!172 = !DILocation(line: 95, column: 22, scope: !171)
!173 = !DILocation(line: 95, column: 27, scope: !171)
!174 = !DILocation(line: 95, column: 30, scope: !171)
!175 = !DILocation(line: 95, column: 35, scope: !171)
!176 = !DILocation(line: 95, column: 17, scope: !141)
!177 = !DILocation(line: 97, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !15, line: 96, column: 13)
!179 = !DILocation(line: 97, column: 24, scope: !178)
!180 = !DILocation(line: 97, column: 30, scope: !178)
!181 = !DILocation(line: 99, column: 23, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 99, column: 17)
!183 = !DILocation(line: 99, column: 21, scope: !182)
!184 = !DILocation(line: 99, column: 28, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !15, line: 99, column: 17)
!186 = !DILocation(line: 99, column: 30, scope: !185)
!187 = !DILocation(line: 99, column: 17, scope: !182)
!188 = !DILocation(line: 101, column: 34, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 100, column: 17)
!190 = !DILocation(line: 101, column: 41, scope: !189)
!191 = !DILocation(line: 101, column: 21, scope: !189)
!192 = !DILocation(line: 102, column: 17, scope: !189)
!193 = !DILocation(line: 99, column: 37, scope: !185)
!194 = !DILocation(line: 99, column: 17, scope: !185)
!195 = distinct !{!195, !187, !196, !63}
!196 = !DILocation(line: 102, column: 17, scope: !182)
!197 = !DILocation(line: 103, column: 13, scope: !178)
!198 = !DILocation(line: 106, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !171, file: !15, line: 105, column: 13)
!200 = !DILocation(line: 108, column: 18, scope: !141)
!201 = !DILocation(line: 108, column: 13, scope: !141)
!202 = !DILocation(line: 111, column: 1, scope: !121)
!203 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!204 = !DILocalVariable(name: "data", scope: !203, file: !15, line: 116, type: !4)
!205 = !DILocation(line: 116, column: 9, scope: !203)
!206 = !DILocation(line: 118, column: 10, scope: !203)
!207 = !DILocation(line: 119, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !15, line: 119, column: 8)
!209 = !DILocation(line: 119, column: 25, scope: !208)
!210 = !DILocation(line: 119, column: 8, scope: !203)
!211 = !DILocation(line: 122, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !15, line: 120, column: 5)
!213 = !DILocation(line: 122, column: 14, scope: !212)
!214 = !DILocation(line: 123, column: 5, scope: !212)
!215 = !DILocation(line: 124, column: 8, scope: !216)
!216 = distinct !DILexicalBlock(scope: !203, file: !15, line: 124, column: 8)
!217 = !DILocation(line: 124, column: 25, scope: !216)
!218 = !DILocation(line: 124, column: 8, scope: !203)
!219 = !DILocalVariable(name: "i", scope: !220, file: !15, line: 127, type: !4)
!220 = distinct !DILexicalBlock(scope: !221, file: !15, line: 126, column: 9)
!221 = distinct !DILexicalBlock(scope: !216, file: !15, line: 125, column: 5)
!222 = !DILocation(line: 127, column: 17, scope: !220)
!223 = !DILocalVariable(name: "buffer", scope: !220, file: !15, line: 128, type: !6)
!224 = !DILocation(line: 128, column: 19, scope: !220)
!225 = !DILocation(line: 128, column: 35, scope: !220)
!226 = !DILocation(line: 128, column: 28, scope: !220)
!227 = !DILocation(line: 129, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !220, file: !15, line: 129, column: 17)
!229 = !DILocation(line: 129, column: 24, scope: !228)
!230 = !DILocation(line: 129, column: 17, scope: !220)
!231 = !DILocation(line: 129, column: 34, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !15, line: 129, column: 33)
!233 = !DILocation(line: 131, column: 20, scope: !234)
!234 = distinct !DILexicalBlock(scope: !220, file: !15, line: 131, column: 13)
!235 = !DILocation(line: 131, column: 18, scope: !234)
!236 = !DILocation(line: 131, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !15, line: 131, column: 13)
!238 = !DILocation(line: 131, column: 27, scope: !237)
!239 = !DILocation(line: 131, column: 13, scope: !234)
!240 = !DILocation(line: 133, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !15, line: 132, column: 13)
!242 = !DILocation(line: 133, column: 24, scope: !241)
!243 = !DILocation(line: 133, column: 27, scope: !241)
!244 = !DILocation(line: 134, column: 13, scope: !241)
!245 = !DILocation(line: 131, column: 34, scope: !237)
!246 = !DILocation(line: 131, column: 13, scope: !237)
!247 = distinct !{!247, !239, !248, !63}
!248 = !DILocation(line: 134, column: 13, scope: !234)
!249 = !DILocation(line: 136, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !220, file: !15, line: 136, column: 17)
!251 = !DILocation(line: 136, column: 22, scope: !250)
!252 = !DILocation(line: 136, column: 27, scope: !250)
!253 = !DILocation(line: 136, column: 30, scope: !250)
!254 = !DILocation(line: 136, column: 35, scope: !250)
!255 = !DILocation(line: 136, column: 17, scope: !220)
!256 = !DILocation(line: 138, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !250, file: !15, line: 137, column: 13)
!258 = !DILocation(line: 138, column: 24, scope: !257)
!259 = !DILocation(line: 138, column: 30, scope: !257)
!260 = !DILocation(line: 140, column: 23, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !15, line: 140, column: 17)
!262 = !DILocation(line: 140, column: 21, scope: !261)
!263 = !DILocation(line: 140, column: 28, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !15, line: 140, column: 17)
!265 = !DILocation(line: 140, column: 30, scope: !264)
!266 = !DILocation(line: 140, column: 17, scope: !261)
!267 = !DILocation(line: 142, column: 34, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !15, line: 141, column: 17)
!269 = !DILocation(line: 142, column: 41, scope: !268)
!270 = !DILocation(line: 142, column: 21, scope: !268)
!271 = !DILocation(line: 143, column: 17, scope: !268)
!272 = !DILocation(line: 140, column: 37, scope: !264)
!273 = !DILocation(line: 140, column: 17, scope: !264)
!274 = distinct !{!274, !266, !275, !63}
!275 = !DILocation(line: 143, column: 17, scope: !261)
!276 = !DILocation(line: 144, column: 13, scope: !257)
!277 = !DILocation(line: 147, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !250, file: !15, line: 146, column: 13)
!279 = !DILocation(line: 149, column: 18, scope: !220)
!280 = !DILocation(line: 149, column: 13, scope: !220)
!281 = !DILocation(line: 151, column: 5, scope: !221)
!282 = !DILocation(line: 152, column: 1, scope: !203)
!283 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 155, type: !16, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!284 = !DILocalVariable(name: "data", scope: !283, file: !15, line: 157, type: !4)
!285 = !DILocation(line: 157, column: 9, scope: !283)
!286 = !DILocation(line: 159, column: 10, scope: !283)
!287 = !DILocation(line: 160, column: 8, scope: !288)
!288 = distinct !DILexicalBlock(scope: !283, file: !15, line: 160, column: 8)
!289 = !DILocation(line: 160, column: 25, scope: !288)
!290 = !DILocation(line: 160, column: 8, scope: !283)
!291 = !DILocation(line: 163, column: 9, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !15, line: 161, column: 5)
!293 = !DILocation(line: 164, column: 5, scope: !292)
!294 = !DILocation(line: 169, column: 14, scope: !295)
!295 = distinct !DILexicalBlock(scope: !288, file: !15, line: 166, column: 5)
!296 = !DILocation(line: 171, column: 8, scope: !297)
!297 = distinct !DILexicalBlock(scope: !283, file: !15, line: 171, column: 8)
!298 = !DILocation(line: 171, column: 25, scope: !297)
!299 = !DILocation(line: 171, column: 8, scope: !283)
!300 = !DILocalVariable(name: "i", scope: !301, file: !15, line: 174, type: !4)
!301 = distinct !DILexicalBlock(scope: !302, file: !15, line: 173, column: 9)
!302 = distinct !DILexicalBlock(scope: !297, file: !15, line: 172, column: 5)
!303 = !DILocation(line: 174, column: 17, scope: !301)
!304 = !DILocalVariable(name: "buffer", scope: !301, file: !15, line: 175, type: !6)
!305 = !DILocation(line: 175, column: 19, scope: !301)
!306 = !DILocation(line: 175, column: 35, scope: !301)
!307 = !DILocation(line: 175, column: 28, scope: !301)
!308 = !DILocation(line: 176, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !301, file: !15, line: 176, column: 17)
!310 = !DILocation(line: 176, column: 24, scope: !309)
!311 = !DILocation(line: 176, column: 17, scope: !301)
!312 = !DILocation(line: 176, column: 34, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !15, line: 176, column: 33)
!314 = !DILocation(line: 178, column: 20, scope: !315)
!315 = distinct !DILexicalBlock(scope: !301, file: !15, line: 178, column: 13)
!316 = !DILocation(line: 178, column: 18, scope: !315)
!317 = !DILocation(line: 178, column: 25, scope: !318)
!318 = distinct !DILexicalBlock(scope: !315, file: !15, line: 178, column: 13)
!319 = !DILocation(line: 178, column: 27, scope: !318)
!320 = !DILocation(line: 178, column: 13, scope: !315)
!321 = !DILocation(line: 180, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !15, line: 179, column: 13)
!323 = !DILocation(line: 180, column: 24, scope: !322)
!324 = !DILocation(line: 180, column: 27, scope: !322)
!325 = !DILocation(line: 181, column: 13, scope: !322)
!326 = !DILocation(line: 178, column: 34, scope: !318)
!327 = !DILocation(line: 178, column: 13, scope: !318)
!328 = distinct !{!328, !320, !329, !63}
!329 = !DILocation(line: 181, column: 13, scope: !315)
!330 = !DILocation(line: 184, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !301, file: !15, line: 184, column: 17)
!332 = !DILocation(line: 184, column: 22, scope: !331)
!333 = !DILocation(line: 184, column: 17, scope: !301)
!334 = !DILocation(line: 186, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !15, line: 185, column: 13)
!336 = !DILocation(line: 186, column: 24, scope: !335)
!337 = !DILocation(line: 186, column: 30, scope: !335)
!338 = !DILocation(line: 188, column: 23, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !15, line: 188, column: 17)
!340 = !DILocation(line: 188, column: 21, scope: !339)
!341 = !DILocation(line: 188, column: 28, scope: !342)
!342 = distinct !DILexicalBlock(scope: !339, file: !15, line: 188, column: 17)
!343 = !DILocation(line: 188, column: 30, scope: !342)
!344 = !DILocation(line: 188, column: 17, scope: !339)
!345 = !DILocation(line: 190, column: 34, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !15, line: 189, column: 17)
!347 = !DILocation(line: 190, column: 41, scope: !346)
!348 = !DILocation(line: 190, column: 21, scope: !346)
!349 = !DILocation(line: 191, column: 17, scope: !346)
!350 = !DILocation(line: 188, column: 37, scope: !342)
!351 = !DILocation(line: 188, column: 17, scope: !342)
!352 = distinct !{!352, !344, !353, !63}
!353 = !DILocation(line: 191, column: 17, scope: !339)
!354 = !DILocation(line: 192, column: 13, scope: !335)
!355 = !DILocation(line: 195, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !331, file: !15, line: 194, column: 13)
!357 = !DILocation(line: 197, column: 18, scope: !301)
!358 = !DILocation(line: 197, column: 13, scope: !301)
!359 = !DILocation(line: 199, column: 5, scope: !302)
!360 = !DILocation(line: 200, column: 1, scope: !283)
!361 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 203, type: !16, scopeLine: 204, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!362 = !DILocalVariable(name: "data", scope: !361, file: !15, line: 205, type: !4)
!363 = !DILocation(line: 205, column: 9, scope: !361)
!364 = !DILocation(line: 207, column: 10, scope: !361)
!365 = !DILocation(line: 208, column: 8, scope: !366)
!366 = distinct !DILexicalBlock(scope: !361, file: !15, line: 208, column: 8)
!367 = !DILocation(line: 208, column: 25, scope: !366)
!368 = !DILocation(line: 208, column: 8, scope: !361)
!369 = !DILocation(line: 212, column: 14, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !15, line: 209, column: 5)
!371 = !DILocation(line: 213, column: 5, scope: !370)
!372 = !DILocation(line: 214, column: 8, scope: !373)
!373 = distinct !DILexicalBlock(scope: !361, file: !15, line: 214, column: 8)
!374 = !DILocation(line: 214, column: 25, scope: !373)
!375 = !DILocation(line: 214, column: 8, scope: !361)
!376 = !DILocalVariable(name: "i", scope: !377, file: !15, line: 217, type: !4)
!377 = distinct !DILexicalBlock(scope: !378, file: !15, line: 216, column: 9)
!378 = distinct !DILexicalBlock(scope: !373, file: !15, line: 215, column: 5)
!379 = !DILocation(line: 217, column: 17, scope: !377)
!380 = !DILocalVariable(name: "buffer", scope: !377, file: !15, line: 218, type: !6)
!381 = !DILocation(line: 218, column: 19, scope: !377)
!382 = !DILocation(line: 218, column: 35, scope: !377)
!383 = !DILocation(line: 218, column: 28, scope: !377)
!384 = !DILocation(line: 219, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !377, file: !15, line: 219, column: 17)
!386 = !DILocation(line: 219, column: 24, scope: !385)
!387 = !DILocation(line: 219, column: 17, scope: !377)
!388 = !DILocation(line: 219, column: 34, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !15, line: 219, column: 33)
!390 = !DILocation(line: 221, column: 20, scope: !391)
!391 = distinct !DILexicalBlock(scope: !377, file: !15, line: 221, column: 13)
!392 = !DILocation(line: 221, column: 18, scope: !391)
!393 = !DILocation(line: 221, column: 25, scope: !394)
!394 = distinct !DILexicalBlock(scope: !391, file: !15, line: 221, column: 13)
!395 = !DILocation(line: 221, column: 27, scope: !394)
!396 = !DILocation(line: 221, column: 13, scope: !391)
!397 = !DILocation(line: 223, column: 17, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !15, line: 222, column: 13)
!399 = !DILocation(line: 223, column: 24, scope: !398)
!400 = !DILocation(line: 223, column: 27, scope: !398)
!401 = !DILocation(line: 224, column: 13, scope: !398)
!402 = !DILocation(line: 221, column: 34, scope: !394)
!403 = !DILocation(line: 221, column: 13, scope: !394)
!404 = distinct !{!404, !396, !405, !63}
!405 = !DILocation(line: 224, column: 13, scope: !391)
!406 = !DILocation(line: 227, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !377, file: !15, line: 227, column: 17)
!408 = !DILocation(line: 227, column: 22, scope: !407)
!409 = !DILocation(line: 227, column: 17, scope: !377)
!410 = !DILocation(line: 229, column: 17, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !15, line: 228, column: 13)
!412 = !DILocation(line: 229, column: 24, scope: !411)
!413 = !DILocation(line: 229, column: 30, scope: !411)
!414 = !DILocation(line: 231, column: 23, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !15, line: 231, column: 17)
!416 = !DILocation(line: 231, column: 21, scope: !415)
!417 = !DILocation(line: 231, column: 28, scope: !418)
!418 = distinct !DILexicalBlock(scope: !415, file: !15, line: 231, column: 17)
!419 = !DILocation(line: 231, column: 30, scope: !418)
!420 = !DILocation(line: 231, column: 17, scope: !415)
!421 = !DILocation(line: 233, column: 34, scope: !422)
!422 = distinct !DILexicalBlock(scope: !418, file: !15, line: 232, column: 17)
!423 = !DILocation(line: 233, column: 41, scope: !422)
!424 = !DILocation(line: 233, column: 21, scope: !422)
!425 = !DILocation(line: 234, column: 17, scope: !422)
!426 = !DILocation(line: 231, column: 37, scope: !418)
!427 = !DILocation(line: 231, column: 17, scope: !418)
!428 = distinct !{!428, !420, !429, !63}
!429 = !DILocation(line: 234, column: 17, scope: !415)
!430 = !DILocation(line: 235, column: 13, scope: !411)
!431 = !DILocation(line: 238, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !407, file: !15, line: 237, column: 13)
!433 = !DILocation(line: 240, column: 18, scope: !377)
!434 = !DILocation(line: 240, column: 13, scope: !377)
!435 = !DILocation(line: 242, column: 5, scope: !378)
!436 = !DILocation(line: 243, column: 1, scope: !361)
