; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !11
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !14
@goodG2BStatic = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 -1, i32* %data, align 4, !dbg !29
  %call = call i32 @rand() #5, !dbg !30
  %and = and i32 %call, 1, !dbg !30
  %tobool = icmp ne i32 %and, 0, !dbg !30
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !30

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !30
  %shl = shl i32 %call1, 30, !dbg !30
  %call2 = call i32 @rand() #5, !dbg !30
  %shl3 = shl i32 %call2, 15, !dbg !30
  %xor = xor i32 %shl, %shl3, !dbg !30
  %call4 = call i32 @rand() #5, !dbg !30
  %xor5 = xor i32 %xor, %call4, !dbg !30
  br label %cond.end, !dbg !30

cond.false:                                       ; preds = %entry
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
  store i32 %cond, i32* %data, align 4, !dbg !31
  store i32 1, i32* @badStatic, align 4, !dbg !32
  %0 = load i32, i32* %data, align 4, !dbg !33
  call void @badSink(i32 %0), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !36 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i32, i32* @badStatic, align 4, !dbg !41
  %tobool = icmp ne i32 %0, 0, !dbg !41
  br i1 %tobool, label %if.then, label %if.end16, !dbg !43

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !50
  %1 = bitcast i8* %call to i32*, !dbg !51
  store i32* %1, i32** %buffer, align 8, !dbg !49
  %2 = load i32*, i32** %buffer, align 8, !dbg !52
  %cmp = icmp eq i32* %2, null, !dbg !54
  br i1 %cmp, label %if.then1, label %if.end, !dbg !55

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !61
  %cmp2 = icmp slt i32 %3, 10, !dbg !63
  br i1 %cmp2, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !65
  %5 = load i32, i32* %i, align 4, !dbg !67
  %idxprom = sext i32 %5 to i64, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !70
  %inc = add nsw i32 %6, 1, !dbg !70
  store i32 %inc, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !75
  %cmp3 = icmp sge i32 %7, 0, !dbg !77
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !78

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !79
  %9 = load i32, i32* %data.addr, align 4, !dbg !81
  %idxprom5 = sext i32 %9 to i64, !dbg !79
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !79
  store i32 1, i32* %arrayidx6, align 4, !dbg !82
  store i32 0, i32* %i, align 4, !dbg !83
  br label %for.cond7, !dbg !85

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !86
  %cmp8 = icmp slt i32 %10, 10, !dbg !88
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !89

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !90
  %12 = load i32, i32* %i, align 4, !dbg !92
  %idxprom10 = sext i32 %12 to i64, !dbg !90
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !90
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !90
  call void @printIntLine(i32 %13), !dbg !93
  br label %for.inc12, !dbg !94

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !95
  %inc13 = add nsw i32 %14, 1, !dbg !95
  store i32 %inc13, i32* %i, align 4, !dbg !95
  br label %for.cond7, !dbg !96, !llvm.loop !97

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !99

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !100
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !102
  %16 = bitcast i32* %15 to i8*, !dbg !102
  call void @free(i8* %16) #5, !dbg !103
  br label %if.end16, !dbg !104

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_good() #0 !dbg !106 {
entry:
  call void @goodB2G1(), !dbg !107
  call void @goodB2G2(), !dbg !108
  call void @goodG2B(), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !111 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %call = call i64 @time(i64* null) #5, !dbg !121
  %conv = trunc i64 %call to i32, !dbg !122
  call void @srand(i32 %conv) #5, !dbg !123
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !124
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_good(), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !127
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_bad(), !dbg !128
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !129
  ret i32 0, !dbg !130
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !131 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 -1, i32* %data, align 4, !dbg !134
  %call = call i32 @rand() #5, !dbg !135
  %and = and i32 %call, 1, !dbg !135
  %tobool = icmp ne i32 %and, 0, !dbg !135
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !135

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !135
  %shl = shl i32 %call1, 30, !dbg !135
  %call2 = call i32 @rand() #5, !dbg !135
  %shl3 = shl i32 %call2, 15, !dbg !135
  %xor = xor i32 %shl, %shl3, !dbg !135
  %call4 = call i32 @rand() #5, !dbg !135
  %xor5 = xor i32 %xor, %call4, !dbg !135
  br label %cond.end, !dbg !135

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !135
  %shl7 = shl i32 %call6, 30, !dbg !135
  %call8 = call i32 @rand() #5, !dbg !135
  %shl9 = shl i32 %call8, 15, !dbg !135
  %xor10 = xor i32 %shl7, %shl9, !dbg !135
  %call11 = call i32 @rand() #5, !dbg !135
  %xor12 = xor i32 %xor10, %call11, !dbg !135
  %sub = sub i32 0, %xor12, !dbg !135
  %sub13 = sub i32 %sub, 1, !dbg !135
  br label %cond.end, !dbg !135

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !135
  store i32 %cond, i32* %data, align 4, !dbg !136
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !137
  %0 = load i32, i32* %data, align 4, !dbg !138
  call void @goodB2G1Sink(i32 %0), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !141 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !144
  %tobool = icmp ne i32 %0, 0, !dbg !144
  br i1 %tobool, label %if.then, label %if.else, !dbg !146

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !147
  br label %if.end18, !dbg !149

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !150, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !154, metadata !DIExpression()), !dbg !155
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !156
  %1 = bitcast i8* %call to i32*, !dbg !157
  store i32* %1, i32** %buffer, align 8, !dbg !155
  %2 = load i32*, i32** %buffer, align 8, !dbg !158
  %cmp = icmp eq i32* %2, null, !dbg !160
  br i1 %cmp, label %if.then1, label %if.end, !dbg !161

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !162
  unreachable, !dbg !162

if.end:                                           ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !167
  %cmp2 = icmp slt i32 %3, 10, !dbg !169
  br i1 %cmp2, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !171
  %5 = load i32, i32* %i, align 4, !dbg !173
  %idxprom = sext i32 %5 to i64, !dbg !171
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !171
  store i32 0, i32* %arrayidx, align 4, !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !176
  %inc = add nsw i32 %6, 1, !dbg !176
  store i32 %inc, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !180
  %cmp3 = icmp sge i32 %7, 0, !dbg !182
  br i1 %cmp3, label %land.lhs.true, label %if.else16, !dbg !183

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !184
  %cmp4 = icmp slt i32 %8, 10, !dbg !185
  br i1 %cmp4, label %if.then5, label %if.else16, !dbg !186

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !187
  %10 = load i32, i32* %data.addr, align 4, !dbg !189
  %idxprom6 = sext i32 %10 to i64, !dbg !187
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !187
  store i32 1, i32* %arrayidx7, align 4, !dbg !190
  store i32 0, i32* %i, align 4, !dbg !191
  br label %for.cond8, !dbg !193

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !194
  %cmp9 = icmp slt i32 %11, 10, !dbg !196
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !197

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !198
  %13 = load i32, i32* %i, align 4, !dbg !200
  %idxprom11 = sext i32 %13 to i64, !dbg !198
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !198
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !198
  call void @printIntLine(i32 %14), !dbg !201
  br label %for.inc13, !dbg !202

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !203
  %inc14 = add nsw i32 %15, 1, !dbg !203
  store i32 %inc14, i32* %i, align 4, !dbg !203
  br label %for.cond8, !dbg !204, !llvm.loop !205

for.end15:                                        ; preds = %for.cond8
  br label %if.end17, !dbg !207

if.else16:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !208
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !210
  %17 = bitcast i32* %16 to i8*, !dbg !210
  call void @free(i8* %17) #5, !dbg !211
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then
  ret void, !dbg !212
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !213 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !214, metadata !DIExpression()), !dbg !215
  store i32 -1, i32* %data, align 4, !dbg !216
  %call = call i32 @rand() #5, !dbg !217
  %and = and i32 %call, 1, !dbg !217
  %tobool = icmp ne i32 %and, 0, !dbg !217
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !217

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !217
  %shl = shl i32 %call1, 30, !dbg !217
  %call2 = call i32 @rand() #5, !dbg !217
  %shl3 = shl i32 %call2, 15, !dbg !217
  %xor = xor i32 %shl, %shl3, !dbg !217
  %call4 = call i32 @rand() #5, !dbg !217
  %xor5 = xor i32 %xor, %call4, !dbg !217
  br label %cond.end, !dbg !217

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !217
  %shl7 = shl i32 %call6, 30, !dbg !217
  %call8 = call i32 @rand() #5, !dbg !217
  %shl9 = shl i32 %call8, 15, !dbg !217
  %xor10 = xor i32 %shl7, %shl9, !dbg !217
  %call11 = call i32 @rand() #5, !dbg !217
  %xor12 = xor i32 %xor10, %call11, !dbg !217
  %sub = sub i32 0, %xor12, !dbg !217
  %sub13 = sub i32 %sub, 1, !dbg !217
  br label %cond.end, !dbg !217

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !217
  store i32 %cond, i32* %data, align 4, !dbg !218
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !219
  %0 = load i32, i32* %data, align 4, !dbg !220
  call void @goodB2G2Sink(i32 %0), !dbg !221
  ret void, !dbg !222
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !223 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !224, metadata !DIExpression()), !dbg !225
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !226
  %tobool = icmp ne i32 %0, 0, !dbg !226
  br i1 %tobool, label %if.then, label %if.end17, !dbg !228

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !229, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !233, metadata !DIExpression()), !dbg !234
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !235
  %1 = bitcast i8* %call to i32*, !dbg !236
  store i32* %1, i32** %buffer, align 8, !dbg !234
  %2 = load i32*, i32** %buffer, align 8, !dbg !237
  %cmp = icmp eq i32* %2, null, !dbg !239
  br i1 %cmp, label %if.then1, label %if.end, !dbg !240

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !241
  unreachable, !dbg !241

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !243
  br label %for.cond, !dbg !245

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !246
  %cmp2 = icmp slt i32 %3, 10, !dbg !248
  br i1 %cmp2, label %for.body, label %for.end, !dbg !249

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !250
  %5 = load i32, i32* %i, align 4, !dbg !252
  %idxprom = sext i32 %5 to i64, !dbg !250
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !250
  store i32 0, i32* %arrayidx, align 4, !dbg !253
  br label %for.inc, !dbg !254

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !255
  %inc = add nsw i32 %6, 1, !dbg !255
  store i32 %inc, i32* %i, align 4, !dbg !255
  br label %for.cond, !dbg !256, !llvm.loop !257

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !259
  %cmp3 = icmp sge i32 %7, 0, !dbg !261
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !262

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !263
  %cmp4 = icmp slt i32 %8, 10, !dbg !264
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !265

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !266
  %10 = load i32, i32* %data.addr, align 4, !dbg !268
  %idxprom6 = sext i32 %10 to i64, !dbg !266
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !266
  store i32 1, i32* %arrayidx7, align 4, !dbg !269
  store i32 0, i32* %i, align 4, !dbg !270
  br label %for.cond8, !dbg !272

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !273
  %cmp9 = icmp slt i32 %11, 10, !dbg !275
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !276

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !277
  %13 = load i32, i32* %i, align 4, !dbg !279
  %idxprom11 = sext i32 %13 to i64, !dbg !277
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !277
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !277
  call void @printIntLine(i32 %14), !dbg !280
  br label %for.inc13, !dbg !281

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !282
  %inc14 = add nsw i32 %15, 1, !dbg !282
  store i32 %inc14, i32* %i, align 4, !dbg !282
  br label %for.cond8, !dbg !283, !llvm.loop !284

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !286

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !287
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !289
  %17 = bitcast i32* %16 to i8*, !dbg !289
  call void @free(i8* %17) #5, !dbg !290
  br label %if.end17, !dbg !291

if.end17:                                         ; preds = %if.end16, %entry
  ret void, !dbg !292
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !293 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !294, metadata !DIExpression()), !dbg !295
  store i32 -1, i32* %data, align 4, !dbg !296
  store i32 7, i32* %data, align 4, !dbg !297
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !298
  %0 = load i32, i32* %data, align 4, !dbg !299
  call void @goodG2BSink(i32 %0), !dbg !300
  ret void, !dbg !301
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !302 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !303, metadata !DIExpression()), !dbg !304
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !305
  %tobool = icmp ne i32 %0, 0, !dbg !305
  br i1 %tobool, label %if.then, label %if.end16, !dbg !307

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !308, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !312, metadata !DIExpression()), !dbg !313
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !314
  %1 = bitcast i8* %call to i32*, !dbg !315
  store i32* %1, i32** %buffer, align 8, !dbg !313
  %2 = load i32*, i32** %buffer, align 8, !dbg !316
  %cmp = icmp eq i32* %2, null, !dbg !318
  br i1 %cmp, label %if.then1, label %if.end, !dbg !319

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !320
  unreachable, !dbg !320

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !322
  br label %for.cond, !dbg !324

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !325
  %cmp2 = icmp slt i32 %3, 10, !dbg !327
  br i1 %cmp2, label %for.body, label %for.end, !dbg !328

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !329
  %5 = load i32, i32* %i, align 4, !dbg !331
  %idxprom = sext i32 %5 to i64, !dbg !329
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !329
  store i32 0, i32* %arrayidx, align 4, !dbg !332
  br label %for.inc, !dbg !333

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !334
  %inc = add nsw i32 %6, 1, !dbg !334
  store i32 %inc, i32* %i, align 4, !dbg !334
  br label %for.cond, !dbg !335, !llvm.loop !336

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !338
  %cmp3 = icmp sge i32 %7, 0, !dbg !340
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !341

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !342
  %9 = load i32, i32* %data.addr, align 4, !dbg !344
  %idxprom5 = sext i32 %9 to i64, !dbg !342
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !342
  store i32 1, i32* %arrayidx6, align 4, !dbg !345
  store i32 0, i32* %i, align 4, !dbg !346
  br label %for.cond7, !dbg !348

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !349
  %cmp8 = icmp slt i32 %10, 10, !dbg !351
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !352

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !353
  %12 = load i32, i32* %i, align 4, !dbg !355
  %idxprom10 = sext i32 %12 to i64, !dbg !353
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !353
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !353
  call void @printIntLine(i32 %13), !dbg !356
  br label %for.inc12, !dbg !357

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !358
  %inc13 = add nsw i32 %14, 1, !dbg !358
  store i32 %inc13, i32* %i, align 4, !dbg !358
  br label %for.cond7, !dbg !359, !llvm.loop !360

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !362

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !363
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !365
  %16 = bitcast i32* %15 to i8*, !dbg !365
  call void @free(i8* %16) #5, !dbg !366
  br label %if.end16, !dbg !367

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !368
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 23, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !8, !9}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !14, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !13, line: 74, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !13, line: 75, type: !6, isLocal: true, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !13, line: 76, type: !6, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_bad", scope: !13, file: !13, line: 58, type: !25, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !13, line: 60, type: !6)
!28 = !DILocation(line: 60, column: 9, scope: !24)
!29 = !DILocation(line: 62, column: 10, scope: !24)
!30 = !DILocation(line: 64, column: 12, scope: !24)
!31 = !DILocation(line: 64, column: 10, scope: !24)
!32 = !DILocation(line: 65, column: 15, scope: !24)
!33 = !DILocation(line: 66, column: 13, scope: !24)
!34 = !DILocation(line: 66, column: 5, scope: !24)
!35 = !DILocation(line: 67, column: 1, scope: !24)
!36 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 25, type: !37, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !6}
!39 = !DILocalVariable(name: "data", arg: 1, scope: !36, file: !13, line: 25, type: !6)
!40 = !DILocation(line: 25, column: 25, scope: !36)
!41 = !DILocation(line: 27, column: 8, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !13, line: 27, column: 8)
!43 = !DILocation(line: 27, column: 8, scope: !36)
!44 = !DILocalVariable(name: "i", scope: !45, file: !13, line: 30, type: !6)
!45 = distinct !DILexicalBlock(scope: !46, file: !13, line: 29, column: 9)
!46 = distinct !DILexicalBlock(scope: !42, file: !13, line: 28, column: 5)
!47 = !DILocation(line: 30, column: 17, scope: !45)
!48 = !DILocalVariable(name: "buffer", scope: !45, file: !13, line: 31, type: !8)
!49 = !DILocation(line: 31, column: 19, scope: !45)
!50 = !DILocation(line: 31, column: 35, scope: !45)
!51 = !DILocation(line: 31, column: 28, scope: !45)
!52 = !DILocation(line: 32, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !13, line: 32, column: 17)
!54 = !DILocation(line: 32, column: 24, scope: !53)
!55 = !DILocation(line: 32, column: 17, scope: !45)
!56 = !DILocation(line: 32, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !13, line: 32, column: 33)
!58 = !DILocation(line: 34, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !45, file: !13, line: 34, column: 13)
!60 = !DILocation(line: 34, column: 18, scope: !59)
!61 = !DILocation(line: 34, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !13, line: 34, column: 13)
!63 = !DILocation(line: 34, column: 27, scope: !62)
!64 = !DILocation(line: 34, column: 13, scope: !59)
!65 = !DILocation(line: 36, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !13, line: 35, column: 13)
!67 = !DILocation(line: 36, column: 24, scope: !66)
!68 = !DILocation(line: 36, column: 27, scope: !66)
!69 = !DILocation(line: 37, column: 13, scope: !66)
!70 = !DILocation(line: 34, column: 34, scope: !62)
!71 = !DILocation(line: 34, column: 13, scope: !62)
!72 = distinct !{!72, !64, !73, !74}
!73 = !DILocation(line: 37, column: 13, scope: !59)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 40, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !45, file: !13, line: 40, column: 17)
!77 = !DILocation(line: 40, column: 22, scope: !76)
!78 = !DILocation(line: 40, column: 17, scope: !45)
!79 = !DILocation(line: 42, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !13, line: 41, column: 13)
!81 = !DILocation(line: 42, column: 24, scope: !80)
!82 = !DILocation(line: 42, column: 30, scope: !80)
!83 = !DILocation(line: 44, column: 23, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !13, line: 44, column: 17)
!85 = !DILocation(line: 44, column: 21, scope: !84)
!86 = !DILocation(line: 44, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !13, line: 44, column: 17)
!88 = !DILocation(line: 44, column: 30, scope: !87)
!89 = !DILocation(line: 44, column: 17, scope: !84)
!90 = !DILocation(line: 46, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !13, line: 45, column: 17)
!92 = !DILocation(line: 46, column: 41, scope: !91)
!93 = !DILocation(line: 46, column: 21, scope: !91)
!94 = !DILocation(line: 47, column: 17, scope: !91)
!95 = !DILocation(line: 44, column: 37, scope: !87)
!96 = !DILocation(line: 44, column: 17, scope: !87)
!97 = distinct !{!97, !89, !98, !74}
!98 = !DILocation(line: 47, column: 17, scope: !84)
!99 = !DILocation(line: 48, column: 13, scope: !80)
!100 = !DILocation(line: 51, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !76, file: !13, line: 50, column: 13)
!102 = !DILocation(line: 53, column: 18, scope: !45)
!103 = !DILocation(line: 53, column: 13, scope: !45)
!104 = !DILocation(line: 55, column: 5, scope: !46)
!105 = !DILocation(line: 56, column: 1, scope: !36)
!106 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_good", scope: !13, file: !13, line: 217, type: !25, scopeLine: 218, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocation(line: 219, column: 5, scope: !106)
!108 = !DILocation(line: 220, column: 5, scope: !106)
!109 = !DILocation(line: 221, column: 5, scope: !106)
!110 = !DILocation(line: 222, column: 1, scope: !106)
!111 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 233, type: !112, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DISubroutineType(types: !113)
!113 = !{!6, !6, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!117 = !DILocalVariable(name: "argc", arg: 1, scope: !111, file: !13, line: 233, type: !6)
!118 = !DILocation(line: 233, column: 14, scope: !111)
!119 = !DILocalVariable(name: "argv", arg: 2, scope: !111, file: !13, line: 233, type: !114)
!120 = !DILocation(line: 233, column: 27, scope: !111)
!121 = !DILocation(line: 236, column: 22, scope: !111)
!122 = !DILocation(line: 236, column: 12, scope: !111)
!123 = !DILocation(line: 236, column: 5, scope: !111)
!124 = !DILocation(line: 238, column: 5, scope: !111)
!125 = !DILocation(line: 239, column: 5, scope: !111)
!126 = !DILocation(line: 240, column: 5, scope: !111)
!127 = !DILocation(line: 243, column: 5, scope: !111)
!128 = !DILocation(line: 244, column: 5, scope: !111)
!129 = !DILocation(line: 245, column: 5, scope: !111)
!130 = !DILocation(line: 247, column: 5, scope: !111)
!131 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 116, type: !25, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocalVariable(name: "data", scope: !131, file: !13, line: 118, type: !6)
!133 = !DILocation(line: 118, column: 9, scope: !131)
!134 = !DILocation(line: 120, column: 10, scope: !131)
!135 = !DILocation(line: 122, column: 12, scope: !131)
!136 = !DILocation(line: 122, column: 10, scope: !131)
!137 = !DILocation(line: 123, column: 20, scope: !131)
!138 = !DILocation(line: 124, column: 18, scope: !131)
!139 = !DILocation(line: 124, column: 5, scope: !131)
!140 = !DILocation(line: 125, column: 1, scope: !131)
!141 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !13, file: !13, line: 79, type: !37, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!142 = !DILocalVariable(name: "data", arg: 1, scope: !141, file: !13, line: 79, type: !6)
!143 = !DILocation(line: 79, column: 30, scope: !141)
!144 = !DILocation(line: 81, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !13, line: 81, column: 8)
!146 = !DILocation(line: 81, column: 8, scope: !141)
!147 = !DILocation(line: 84, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !13, line: 82, column: 5)
!149 = !DILocation(line: 85, column: 5, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !151, file: !13, line: 89, type: !6)
!151 = distinct !DILexicalBlock(scope: !152, file: !13, line: 88, column: 9)
!152 = distinct !DILexicalBlock(scope: !145, file: !13, line: 87, column: 5)
!153 = !DILocation(line: 89, column: 17, scope: !151)
!154 = !DILocalVariable(name: "buffer", scope: !151, file: !13, line: 90, type: !8)
!155 = !DILocation(line: 90, column: 19, scope: !151)
!156 = !DILocation(line: 90, column: 35, scope: !151)
!157 = !DILocation(line: 90, column: 28, scope: !151)
!158 = !DILocation(line: 91, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !13, line: 91, column: 17)
!160 = !DILocation(line: 91, column: 24, scope: !159)
!161 = !DILocation(line: 91, column: 17, scope: !151)
!162 = !DILocation(line: 91, column: 34, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !13, line: 91, column: 33)
!164 = !DILocation(line: 93, column: 20, scope: !165)
!165 = distinct !DILexicalBlock(scope: !151, file: !13, line: 93, column: 13)
!166 = !DILocation(line: 93, column: 18, scope: !165)
!167 = !DILocation(line: 93, column: 25, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !13, line: 93, column: 13)
!169 = !DILocation(line: 93, column: 27, scope: !168)
!170 = !DILocation(line: 93, column: 13, scope: !165)
!171 = !DILocation(line: 95, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !13, line: 94, column: 13)
!173 = !DILocation(line: 95, column: 24, scope: !172)
!174 = !DILocation(line: 95, column: 27, scope: !172)
!175 = !DILocation(line: 96, column: 13, scope: !172)
!176 = !DILocation(line: 93, column: 34, scope: !168)
!177 = !DILocation(line: 93, column: 13, scope: !168)
!178 = distinct !{!178, !170, !179, !74}
!179 = !DILocation(line: 96, column: 13, scope: !165)
!180 = !DILocation(line: 98, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !151, file: !13, line: 98, column: 17)
!182 = !DILocation(line: 98, column: 22, scope: !181)
!183 = !DILocation(line: 98, column: 27, scope: !181)
!184 = !DILocation(line: 98, column: 30, scope: !181)
!185 = !DILocation(line: 98, column: 35, scope: !181)
!186 = !DILocation(line: 98, column: 17, scope: !151)
!187 = !DILocation(line: 100, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !181, file: !13, line: 99, column: 13)
!189 = !DILocation(line: 100, column: 24, scope: !188)
!190 = !DILocation(line: 100, column: 30, scope: !188)
!191 = !DILocation(line: 102, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !13, line: 102, column: 17)
!193 = !DILocation(line: 102, column: 21, scope: !192)
!194 = !DILocation(line: 102, column: 28, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !13, line: 102, column: 17)
!196 = !DILocation(line: 102, column: 30, scope: !195)
!197 = !DILocation(line: 102, column: 17, scope: !192)
!198 = !DILocation(line: 104, column: 34, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !13, line: 103, column: 17)
!200 = !DILocation(line: 104, column: 41, scope: !199)
!201 = !DILocation(line: 104, column: 21, scope: !199)
!202 = !DILocation(line: 105, column: 17, scope: !199)
!203 = !DILocation(line: 102, column: 37, scope: !195)
!204 = !DILocation(line: 102, column: 17, scope: !195)
!205 = distinct !{!205, !197, !206, !74}
!206 = !DILocation(line: 105, column: 17, scope: !192)
!207 = !DILocation(line: 106, column: 13, scope: !188)
!208 = !DILocation(line: 109, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !181, file: !13, line: 108, column: 13)
!210 = !DILocation(line: 111, column: 18, scope: !151)
!211 = !DILocation(line: 111, column: 13, scope: !151)
!212 = !DILocation(line: 114, column: 1, scope: !141)
!213 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 160, type: !25, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!214 = !DILocalVariable(name: "data", scope: !213, file: !13, line: 162, type: !6)
!215 = !DILocation(line: 162, column: 9, scope: !213)
!216 = !DILocation(line: 164, column: 10, scope: !213)
!217 = !DILocation(line: 166, column: 12, scope: !213)
!218 = !DILocation(line: 166, column: 10, scope: !213)
!219 = !DILocation(line: 167, column: 20, scope: !213)
!220 = !DILocation(line: 168, column: 18, scope: !213)
!221 = !DILocation(line: 168, column: 5, scope: !213)
!222 = !DILocation(line: 169, column: 1, scope: !213)
!223 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !13, file: !13, line: 128, type: !37, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!224 = !DILocalVariable(name: "data", arg: 1, scope: !223, file: !13, line: 128, type: !6)
!225 = !DILocation(line: 128, column: 30, scope: !223)
!226 = !DILocation(line: 130, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !13, line: 130, column: 8)
!228 = !DILocation(line: 130, column: 8, scope: !223)
!229 = !DILocalVariable(name: "i", scope: !230, file: !13, line: 133, type: !6)
!230 = distinct !DILexicalBlock(scope: !231, file: !13, line: 132, column: 9)
!231 = distinct !DILexicalBlock(scope: !227, file: !13, line: 131, column: 5)
!232 = !DILocation(line: 133, column: 17, scope: !230)
!233 = !DILocalVariable(name: "buffer", scope: !230, file: !13, line: 134, type: !8)
!234 = !DILocation(line: 134, column: 19, scope: !230)
!235 = !DILocation(line: 134, column: 35, scope: !230)
!236 = !DILocation(line: 134, column: 28, scope: !230)
!237 = !DILocation(line: 135, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !230, file: !13, line: 135, column: 17)
!239 = !DILocation(line: 135, column: 24, scope: !238)
!240 = !DILocation(line: 135, column: 17, scope: !230)
!241 = !DILocation(line: 135, column: 34, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !13, line: 135, column: 33)
!243 = !DILocation(line: 137, column: 20, scope: !244)
!244 = distinct !DILexicalBlock(scope: !230, file: !13, line: 137, column: 13)
!245 = !DILocation(line: 137, column: 18, scope: !244)
!246 = !DILocation(line: 137, column: 25, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !13, line: 137, column: 13)
!248 = !DILocation(line: 137, column: 27, scope: !247)
!249 = !DILocation(line: 137, column: 13, scope: !244)
!250 = !DILocation(line: 139, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !13, line: 138, column: 13)
!252 = !DILocation(line: 139, column: 24, scope: !251)
!253 = !DILocation(line: 139, column: 27, scope: !251)
!254 = !DILocation(line: 140, column: 13, scope: !251)
!255 = !DILocation(line: 137, column: 34, scope: !247)
!256 = !DILocation(line: 137, column: 13, scope: !247)
!257 = distinct !{!257, !249, !258, !74}
!258 = !DILocation(line: 140, column: 13, scope: !244)
!259 = !DILocation(line: 142, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !230, file: !13, line: 142, column: 17)
!261 = !DILocation(line: 142, column: 22, scope: !260)
!262 = !DILocation(line: 142, column: 27, scope: !260)
!263 = !DILocation(line: 142, column: 30, scope: !260)
!264 = !DILocation(line: 142, column: 35, scope: !260)
!265 = !DILocation(line: 142, column: 17, scope: !230)
!266 = !DILocation(line: 144, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !260, file: !13, line: 143, column: 13)
!268 = !DILocation(line: 144, column: 24, scope: !267)
!269 = !DILocation(line: 144, column: 30, scope: !267)
!270 = !DILocation(line: 146, column: 23, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !13, line: 146, column: 17)
!272 = !DILocation(line: 146, column: 21, scope: !271)
!273 = !DILocation(line: 146, column: 28, scope: !274)
!274 = distinct !DILexicalBlock(scope: !271, file: !13, line: 146, column: 17)
!275 = !DILocation(line: 146, column: 30, scope: !274)
!276 = !DILocation(line: 146, column: 17, scope: !271)
!277 = !DILocation(line: 148, column: 34, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !13, line: 147, column: 17)
!279 = !DILocation(line: 148, column: 41, scope: !278)
!280 = !DILocation(line: 148, column: 21, scope: !278)
!281 = !DILocation(line: 149, column: 17, scope: !278)
!282 = !DILocation(line: 146, column: 37, scope: !274)
!283 = !DILocation(line: 146, column: 17, scope: !274)
!284 = distinct !{!284, !276, !285, !74}
!285 = !DILocation(line: 149, column: 17, scope: !271)
!286 = !DILocation(line: 150, column: 13, scope: !267)
!287 = !DILocation(line: 153, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !260, file: !13, line: 152, column: 13)
!289 = !DILocation(line: 155, column: 18, scope: !230)
!290 = !DILocation(line: 155, column: 13, scope: !230)
!291 = !DILocation(line: 157, column: 5, scope: !231)
!292 = !DILocation(line: 158, column: 1, scope: !223)
!293 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 205, type: !25, scopeLine: 206, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!294 = !DILocalVariable(name: "data", scope: !293, file: !13, line: 207, type: !6)
!295 = !DILocation(line: 207, column: 9, scope: !293)
!296 = !DILocation(line: 209, column: 10, scope: !293)
!297 = !DILocation(line: 212, column: 10, scope: !293)
!298 = !DILocation(line: 213, column: 19, scope: !293)
!299 = !DILocation(line: 214, column: 17, scope: !293)
!300 = !DILocation(line: 214, column: 5, scope: !293)
!301 = !DILocation(line: 215, column: 1, scope: !293)
!302 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 172, type: !37, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!303 = !DILocalVariable(name: "data", arg: 1, scope: !302, file: !13, line: 172, type: !6)
!304 = !DILocation(line: 172, column: 29, scope: !302)
!305 = !DILocation(line: 174, column: 8, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !13, line: 174, column: 8)
!307 = !DILocation(line: 174, column: 8, scope: !302)
!308 = !DILocalVariable(name: "i", scope: !309, file: !13, line: 177, type: !6)
!309 = distinct !DILexicalBlock(scope: !310, file: !13, line: 176, column: 9)
!310 = distinct !DILexicalBlock(scope: !306, file: !13, line: 175, column: 5)
!311 = !DILocation(line: 177, column: 17, scope: !309)
!312 = !DILocalVariable(name: "buffer", scope: !309, file: !13, line: 178, type: !8)
!313 = !DILocation(line: 178, column: 19, scope: !309)
!314 = !DILocation(line: 178, column: 35, scope: !309)
!315 = !DILocation(line: 178, column: 28, scope: !309)
!316 = !DILocation(line: 179, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !309, file: !13, line: 179, column: 17)
!318 = !DILocation(line: 179, column: 24, scope: !317)
!319 = !DILocation(line: 179, column: 17, scope: !309)
!320 = !DILocation(line: 179, column: 34, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !13, line: 179, column: 33)
!322 = !DILocation(line: 181, column: 20, scope: !323)
!323 = distinct !DILexicalBlock(scope: !309, file: !13, line: 181, column: 13)
!324 = !DILocation(line: 181, column: 18, scope: !323)
!325 = !DILocation(line: 181, column: 25, scope: !326)
!326 = distinct !DILexicalBlock(scope: !323, file: !13, line: 181, column: 13)
!327 = !DILocation(line: 181, column: 27, scope: !326)
!328 = !DILocation(line: 181, column: 13, scope: !323)
!329 = !DILocation(line: 183, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !13, line: 182, column: 13)
!331 = !DILocation(line: 183, column: 24, scope: !330)
!332 = !DILocation(line: 183, column: 27, scope: !330)
!333 = !DILocation(line: 184, column: 13, scope: !330)
!334 = !DILocation(line: 181, column: 34, scope: !326)
!335 = !DILocation(line: 181, column: 13, scope: !326)
!336 = distinct !{!336, !328, !337, !74}
!337 = !DILocation(line: 184, column: 13, scope: !323)
!338 = !DILocation(line: 187, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !309, file: !13, line: 187, column: 17)
!340 = !DILocation(line: 187, column: 22, scope: !339)
!341 = !DILocation(line: 187, column: 17, scope: !309)
!342 = !DILocation(line: 189, column: 17, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !13, line: 188, column: 13)
!344 = !DILocation(line: 189, column: 24, scope: !343)
!345 = !DILocation(line: 189, column: 30, scope: !343)
!346 = !DILocation(line: 191, column: 23, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !13, line: 191, column: 17)
!348 = !DILocation(line: 191, column: 21, scope: !347)
!349 = !DILocation(line: 191, column: 28, scope: !350)
!350 = distinct !DILexicalBlock(scope: !347, file: !13, line: 191, column: 17)
!351 = !DILocation(line: 191, column: 30, scope: !350)
!352 = !DILocation(line: 191, column: 17, scope: !347)
!353 = !DILocation(line: 193, column: 34, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !13, line: 192, column: 17)
!355 = !DILocation(line: 193, column: 41, scope: !354)
!356 = !DILocation(line: 193, column: 21, scope: !354)
!357 = !DILocation(line: 194, column: 17, scope: !354)
!358 = !DILocation(line: 191, column: 37, scope: !350)
!359 = !DILocation(line: 191, column: 17, scope: !350)
!360 = distinct !{!360, !352, !361, !74}
!361 = !DILocation(line: 194, column: 17, scope: !347)
!362 = !DILocation(line: 195, column: 13, scope: !343)
!363 = !DILocation(line: 198, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !339, file: !13, line: 197, column: 13)
!365 = !DILocation(line: 200, column: 18, scope: !309)
!366 = !DILocation(line: 200, column: 13, scope: !309)
!367 = !DILocation(line: 202, column: 5, scope: !310)
!368 = !DILocation(line: 203, column: 1, scope: !302)
