; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_badData = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodG2BData = internal global i32 0, align 4, !dbg !11
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodB2GData = internal global i32 0, align 4, !dbg !14
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_bad() #0 !dbg !22 {
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
  %0 = load i32, i32* %data, align 4, !dbg !30
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_badData, align 4, !dbg !31
  call void @badSink(), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_good() #0 !dbg !34 {
entry:
  call void @goodG2B(), !dbg !35
  call void @goodB2G(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call i64 @time(i64* null) #5, !dbg !48
  %conv = trunc i64 %call to i32, !dbg !49
  call void @srand(i32 %conv) #5, !dbg !50
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_good(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_bad(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !56
  ret i32 0, !dbg !57
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !58 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_badData, align 4, !dbg !61
  store i32 %0, i32* %data, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata i32* %i, metadata !62, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !67
  %1 = bitcast i8* %call to i32*, !dbg !68
  store i32* %1, i32** %buffer, align 8, !dbg !66
  %2 = load i32*, i32** %buffer, align 8, !dbg !69
  %cmp = icmp eq i32* %2, null, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !72

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !78
  %cmp1 = icmp slt i32 %3, 10, !dbg !80
  br i1 %cmp1, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !82
  %5 = load i32, i32* %i, align 4, !dbg !84
  %idxprom = sext i32 %5 to i64, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !87
  %inc = add nsw i32 %6, 1, !dbg !87
  store i32 %inc, i32* %i, align 4, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !92
  %cmp2 = icmp sge i32 %7, 0, !dbg !94
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !95

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !96
  %9 = load i32, i32* %data, align 4, !dbg !98
  %idxprom4 = sext i32 %9 to i64, !dbg !96
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !96
  store i32 1, i32* %arrayidx5, align 4, !dbg !99
  store i32 0, i32* %i, align 4, !dbg !100
  br label %for.cond6, !dbg !102

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !103
  %cmp7 = icmp slt i32 %10, 10, !dbg !105
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !106

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !107
  %12 = load i32, i32* %i, align 4, !dbg !109
  %idxprom9 = sext i32 %12 to i64, !dbg !107
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !107
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !107
  call void @printIntLine(i32 %13), !dbg !110
  br label %for.inc11, !dbg !111

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !112
  %inc12 = add nsw i32 %14, 1, !dbg !112
  store i32 %inc12, i32* %i, align 4, !dbg !112
  br label %for.cond6, !dbg !113, !llvm.loop !114

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !116

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !119
  %16 = bitcast i32* %15 to i8*, !dbg !119
  call void @free(i8* %16) #5, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !122 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !123, metadata !DIExpression()), !dbg !124
  store i32 -1, i32* %data, align 4, !dbg !125
  store i32 7, i32* %data, align 4, !dbg !126
  %0 = load i32, i32* %data, align 4, !dbg !127
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodG2BData, align 4, !dbg !128
  call void @goodG2BSink(), !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !131 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !132, metadata !DIExpression()), !dbg !133
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodG2BData, align 4, !dbg !134
  store i32 %0, i32* %data, align 4, !dbg !133
  call void @llvm.dbg.declare(metadata i32* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !138, metadata !DIExpression()), !dbg !139
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !140
  %1 = bitcast i8* %call to i32*, !dbg !141
  store i32* %1, i32** %buffer, align 8, !dbg !139
  %2 = load i32*, i32** %buffer, align 8, !dbg !142
  %cmp = icmp eq i32* %2, null, !dbg !144
  br i1 %cmp, label %if.then, label %if.end, !dbg !145

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !146
  unreachable, !dbg !146

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !151
  %cmp1 = icmp slt i32 %3, 10, !dbg !153
  br i1 %cmp1, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !155
  %5 = load i32, i32* %i, align 4, !dbg !157
  %idxprom = sext i32 %5 to i64, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !160
  %inc = add nsw i32 %6, 1, !dbg !160
  store i32 %inc, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !164
  %cmp2 = icmp sge i32 %7, 0, !dbg !166
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !167

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !168
  %9 = load i32, i32* %data, align 4, !dbg !170
  %idxprom4 = sext i32 %9 to i64, !dbg !168
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !168
  store i32 1, i32* %arrayidx5, align 4, !dbg !171
  store i32 0, i32* %i, align 4, !dbg !172
  br label %for.cond6, !dbg !174

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !175
  %cmp7 = icmp slt i32 %10, 10, !dbg !177
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !178

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !179
  %12 = load i32, i32* %i, align 4, !dbg !181
  %idxprom9 = sext i32 %12 to i64, !dbg !179
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !179
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !179
  call void @printIntLine(i32 %13), !dbg !182
  br label %for.inc11, !dbg !183

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !184
  %inc12 = add nsw i32 %14, 1, !dbg !184
  store i32 %inc12, i32* %i, align 4, !dbg !184
  br label %for.cond6, !dbg !185, !llvm.loop !186

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !188

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !189
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !191
  %16 = bitcast i32* %15 to i8*, !dbg !191
  call void @free(i8* %16) #5, !dbg !192
  ret void, !dbg !193
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !194 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !195, metadata !DIExpression()), !dbg !196
  store i32 -1, i32* %data, align 4, !dbg !197
  %call = call i32 @rand() #5, !dbg !198
  %and = and i32 %call, 1, !dbg !198
  %tobool = icmp ne i32 %and, 0, !dbg !198
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !198

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !198
  %shl = shl i32 %call1, 30, !dbg !198
  %call2 = call i32 @rand() #5, !dbg !198
  %shl3 = shl i32 %call2, 15, !dbg !198
  %xor = xor i32 %shl, %shl3, !dbg !198
  %call4 = call i32 @rand() #5, !dbg !198
  %xor5 = xor i32 %xor, %call4, !dbg !198
  br label %cond.end, !dbg !198

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !198
  %shl7 = shl i32 %call6, 30, !dbg !198
  %call8 = call i32 @rand() #5, !dbg !198
  %shl9 = shl i32 %call8, 15, !dbg !198
  %xor10 = xor i32 %shl7, %shl9, !dbg !198
  %call11 = call i32 @rand() #5, !dbg !198
  %xor12 = xor i32 %xor10, %call11, !dbg !198
  %sub = sub i32 0, %xor12, !dbg !198
  %sub13 = sub i32 %sub, 1, !dbg !198
  br label %cond.end, !dbg !198

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !198
  store i32 %cond, i32* %data, align 4, !dbg !199
  %0 = load i32, i32* %data, align 4, !dbg !200
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodB2GData, align 4, !dbg !201
  call void @goodB2GSink(), !dbg !202
  ret void, !dbg !203
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !204 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !205, metadata !DIExpression()), !dbg !206
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodB2GData, align 4, !dbg !207
  store i32 %0, i32* %data, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata i32* %i, metadata !208, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !211, metadata !DIExpression()), !dbg !212
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !213
  %1 = bitcast i8* %call to i32*, !dbg !214
  store i32* %1, i32** %buffer, align 8, !dbg !212
  %2 = load i32*, i32** %buffer, align 8, !dbg !215
  %cmp = icmp eq i32* %2, null, !dbg !217
  br i1 %cmp, label %if.then, label %if.end, !dbg !218

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !219
  unreachable, !dbg !219

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !223

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !224
  %cmp1 = icmp slt i32 %3, 10, !dbg !226
  br i1 %cmp1, label %for.body, label %for.end, !dbg !227

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !228
  %5 = load i32, i32* %i, align 4, !dbg !230
  %idxprom = sext i32 %5 to i64, !dbg !228
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !228
  store i32 0, i32* %arrayidx, align 4, !dbg !231
  br label %for.inc, !dbg !232

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !233
  %inc = add nsw i32 %6, 1, !dbg !233
  store i32 %inc, i32* %i, align 4, !dbg !233
  br label %for.cond, !dbg !234, !llvm.loop !235

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !237
  %cmp2 = icmp sge i32 %7, 0, !dbg !239
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !240

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !241
  %cmp3 = icmp slt i32 %8, 10, !dbg !242
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !243

if.then4:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !244
  %10 = load i32, i32* %data, align 4, !dbg !246
  %idxprom5 = sext i32 %10 to i64, !dbg !244
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !244
  store i32 1, i32* %arrayidx6, align 4, !dbg !247
  store i32 0, i32* %i, align 4, !dbg !248
  br label %for.cond7, !dbg !250

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !251
  %cmp8 = icmp slt i32 %11, 10, !dbg !253
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !254

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !255
  %13 = load i32, i32* %i, align 4, !dbg !257
  %idxprom10 = sext i32 %13 to i64, !dbg !255
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !255
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !255
  call void @printIntLine(i32 %14), !dbg !258
  br label %for.inc12, !dbg !259

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !260
  %inc13 = add nsw i32 %15, 1, !dbg !260
  store i32 %inc13, i32* %i, align 4, !dbg !260
  br label %for.cond7, !dbg !261, !llvm.loop !262

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !264

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !265
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !267
  %17 = bitcast i32* %16 to i8*, !dbg !267
  call void @free(i8* %17) #5, !dbg !268
  ret void, !dbg !269
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_badData", scope: !2, file: !13, line: 20, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !8, !9}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !14}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodG2BData", scope: !2, file: !13, line: 21, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodB2GData", scope: !2, file: !13, line: 22, type: !6, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_bad", scope: !13, file: !13, line: 57, type: !23, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 59, type: !6)
!26 = !DILocation(line: 59, column: 9, scope: !22)
!27 = !DILocation(line: 61, column: 10, scope: !22)
!28 = !DILocation(line: 63, column: 12, scope: !22)
!29 = !DILocation(line: 63, column: 10, scope: !22)
!30 = !DILocation(line: 64, column: 67, scope: !22)
!31 = !DILocation(line: 64, column: 65, scope: !22)
!32 = !DILocation(line: 65, column: 5, scope: !22)
!33 = !DILocation(line: 66, column: 1, scope: !22)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_good", scope: !13, file: !13, line: 158, type: !23, scopeLine: 159, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DILocation(line: 160, column: 5, scope: !34)
!36 = !DILocation(line: 161, column: 5, scope: !34)
!37 = !DILocation(line: 162, column: 1, scope: !34)
!38 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 172, type: !39, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!6, !6, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !13, line: 172, type: !6)
!45 = !DILocation(line: 172, column: 14, scope: !38)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !13, line: 172, type: !41)
!47 = !DILocation(line: 172, column: 27, scope: !38)
!48 = !DILocation(line: 175, column: 22, scope: !38)
!49 = !DILocation(line: 175, column: 12, scope: !38)
!50 = !DILocation(line: 175, column: 5, scope: !38)
!51 = !DILocation(line: 177, column: 5, scope: !38)
!52 = !DILocation(line: 178, column: 5, scope: !38)
!53 = !DILocation(line: 179, column: 5, scope: !38)
!54 = !DILocation(line: 182, column: 5, scope: !38)
!55 = !DILocation(line: 183, column: 5, scope: !38)
!56 = !DILocation(line: 184, column: 5, scope: !38)
!57 = !DILocation(line: 186, column: 5, scope: !38)
!58 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocalVariable(name: "data", scope: !58, file: !13, line: 28, type: !6)
!60 = !DILocation(line: 28, column: 9, scope: !58)
!61 = !DILocation(line: 28, column: 16, scope: !58)
!62 = !DILocalVariable(name: "i", scope: !63, file: !13, line: 30, type: !6)
!63 = distinct !DILexicalBlock(scope: !58, file: !13, line: 29, column: 5)
!64 = !DILocation(line: 30, column: 13, scope: !63)
!65 = !DILocalVariable(name: "buffer", scope: !63, file: !13, line: 31, type: !8)
!66 = !DILocation(line: 31, column: 15, scope: !63)
!67 = !DILocation(line: 31, column: 31, scope: !63)
!68 = !DILocation(line: 31, column: 24, scope: !63)
!69 = !DILocation(line: 32, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !63, file: !13, line: 32, column: 13)
!71 = !DILocation(line: 32, column: 20, scope: !70)
!72 = !DILocation(line: 32, column: 13, scope: !63)
!73 = !DILocation(line: 32, column: 30, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !13, line: 32, column: 29)
!75 = !DILocation(line: 34, column: 16, scope: !76)
!76 = distinct !DILexicalBlock(scope: !63, file: !13, line: 34, column: 9)
!77 = !DILocation(line: 34, column: 14, scope: !76)
!78 = !DILocation(line: 34, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !13, line: 34, column: 9)
!80 = !DILocation(line: 34, column: 23, scope: !79)
!81 = !DILocation(line: 34, column: 9, scope: !76)
!82 = !DILocation(line: 36, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !13, line: 35, column: 9)
!84 = !DILocation(line: 36, column: 20, scope: !83)
!85 = !DILocation(line: 36, column: 23, scope: !83)
!86 = !DILocation(line: 37, column: 9, scope: !83)
!87 = !DILocation(line: 34, column: 30, scope: !79)
!88 = !DILocation(line: 34, column: 9, scope: !79)
!89 = distinct !{!89, !81, !90, !91}
!90 = !DILocation(line: 37, column: 9, scope: !76)
!91 = !{!"llvm.loop.mustprogress"}
!92 = !DILocation(line: 40, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !63, file: !13, line: 40, column: 13)
!94 = !DILocation(line: 40, column: 18, scope: !93)
!95 = !DILocation(line: 40, column: 13, scope: !63)
!96 = !DILocation(line: 42, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !13, line: 41, column: 9)
!98 = !DILocation(line: 42, column: 20, scope: !97)
!99 = !DILocation(line: 42, column: 26, scope: !97)
!100 = !DILocation(line: 44, column: 19, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !13, line: 44, column: 13)
!102 = !DILocation(line: 44, column: 17, scope: !101)
!103 = !DILocation(line: 44, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !13, line: 44, column: 13)
!105 = !DILocation(line: 44, column: 26, scope: !104)
!106 = !DILocation(line: 44, column: 13, scope: !101)
!107 = !DILocation(line: 46, column: 30, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !13, line: 45, column: 13)
!109 = !DILocation(line: 46, column: 37, scope: !108)
!110 = !DILocation(line: 46, column: 17, scope: !108)
!111 = !DILocation(line: 47, column: 13, scope: !108)
!112 = !DILocation(line: 44, column: 33, scope: !104)
!113 = !DILocation(line: 44, column: 13, scope: !104)
!114 = distinct !{!114, !106, !115, !91}
!115 = !DILocation(line: 47, column: 13, scope: !101)
!116 = !DILocation(line: 48, column: 9, scope: !97)
!117 = !DILocation(line: 51, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !93, file: !13, line: 50, column: 9)
!119 = !DILocation(line: 53, column: 14, scope: !63)
!120 = !DILocation(line: 53, column: 9, scope: !63)
!121 = !DILocation(line: 55, column: 1, scope: !58)
!122 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 104, type: !23, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DILocalVariable(name: "data", scope: !122, file: !13, line: 106, type: !6)
!124 = !DILocation(line: 106, column: 9, scope: !122)
!125 = !DILocation(line: 108, column: 10, scope: !122)
!126 = !DILocation(line: 111, column: 10, scope: !122)
!127 = !DILocation(line: 112, column: 71, scope: !122)
!128 = !DILocation(line: 112, column: 69, scope: !122)
!129 = !DILocation(line: 113, column: 5, scope: !122)
!130 = !DILocation(line: 114, column: 1, scope: !122)
!131 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 73, type: !23, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocalVariable(name: "data", scope: !131, file: !13, line: 75, type: !6)
!133 = !DILocation(line: 75, column: 9, scope: !131)
!134 = !DILocation(line: 75, column: 16, scope: !131)
!135 = !DILocalVariable(name: "i", scope: !136, file: !13, line: 77, type: !6)
!136 = distinct !DILexicalBlock(scope: !131, file: !13, line: 76, column: 5)
!137 = !DILocation(line: 77, column: 13, scope: !136)
!138 = !DILocalVariable(name: "buffer", scope: !136, file: !13, line: 78, type: !8)
!139 = !DILocation(line: 78, column: 15, scope: !136)
!140 = !DILocation(line: 78, column: 31, scope: !136)
!141 = !DILocation(line: 78, column: 24, scope: !136)
!142 = !DILocation(line: 79, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !13, line: 79, column: 13)
!144 = !DILocation(line: 79, column: 20, scope: !143)
!145 = !DILocation(line: 79, column: 13, scope: !136)
!146 = !DILocation(line: 79, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !13, line: 79, column: 29)
!148 = !DILocation(line: 81, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !136, file: !13, line: 81, column: 9)
!150 = !DILocation(line: 81, column: 14, scope: !149)
!151 = !DILocation(line: 81, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !13, line: 81, column: 9)
!153 = !DILocation(line: 81, column: 23, scope: !152)
!154 = !DILocation(line: 81, column: 9, scope: !149)
!155 = !DILocation(line: 83, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !13, line: 82, column: 9)
!157 = !DILocation(line: 83, column: 20, scope: !156)
!158 = !DILocation(line: 83, column: 23, scope: !156)
!159 = !DILocation(line: 84, column: 9, scope: !156)
!160 = !DILocation(line: 81, column: 30, scope: !152)
!161 = !DILocation(line: 81, column: 9, scope: !152)
!162 = distinct !{!162, !154, !163, !91}
!163 = !DILocation(line: 84, column: 9, scope: !149)
!164 = !DILocation(line: 87, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !136, file: !13, line: 87, column: 13)
!166 = !DILocation(line: 87, column: 18, scope: !165)
!167 = !DILocation(line: 87, column: 13, scope: !136)
!168 = !DILocation(line: 89, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !13, line: 88, column: 9)
!170 = !DILocation(line: 89, column: 20, scope: !169)
!171 = !DILocation(line: 89, column: 26, scope: !169)
!172 = !DILocation(line: 91, column: 19, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !13, line: 91, column: 13)
!174 = !DILocation(line: 91, column: 17, scope: !173)
!175 = !DILocation(line: 91, column: 24, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !13, line: 91, column: 13)
!177 = !DILocation(line: 91, column: 26, scope: !176)
!178 = !DILocation(line: 91, column: 13, scope: !173)
!179 = !DILocation(line: 93, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !13, line: 92, column: 13)
!181 = !DILocation(line: 93, column: 37, scope: !180)
!182 = !DILocation(line: 93, column: 17, scope: !180)
!183 = !DILocation(line: 94, column: 13, scope: !180)
!184 = !DILocation(line: 91, column: 33, scope: !176)
!185 = !DILocation(line: 91, column: 13, scope: !176)
!186 = distinct !{!186, !178, !187, !91}
!187 = !DILocation(line: 94, column: 13, scope: !173)
!188 = !DILocation(line: 95, column: 9, scope: !169)
!189 = !DILocation(line: 98, column: 13, scope: !190)
!190 = distinct !DILexicalBlock(scope: !165, file: !13, line: 97, column: 9)
!191 = !DILocation(line: 100, column: 14, scope: !136)
!192 = !DILocation(line: 100, column: 9, scope: !136)
!193 = !DILocation(line: 102, column: 1, scope: !131)
!194 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 147, type: !23, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!195 = !DILocalVariable(name: "data", scope: !194, file: !13, line: 149, type: !6)
!196 = !DILocation(line: 149, column: 9, scope: !194)
!197 = !DILocation(line: 151, column: 10, scope: !194)
!198 = !DILocation(line: 153, column: 12, scope: !194)
!199 = !DILocation(line: 153, column: 10, scope: !194)
!200 = !DILocation(line: 154, column: 71, scope: !194)
!201 = !DILocation(line: 154, column: 69, scope: !194)
!202 = !DILocation(line: 155, column: 5, scope: !194)
!203 = !DILocation(line: 156, column: 1, scope: !194)
!204 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 117, type: !23, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!205 = !DILocalVariable(name: "data", scope: !204, file: !13, line: 119, type: !6)
!206 = !DILocation(line: 119, column: 9, scope: !204)
!207 = !DILocation(line: 119, column: 16, scope: !204)
!208 = !DILocalVariable(name: "i", scope: !209, file: !13, line: 121, type: !6)
!209 = distinct !DILexicalBlock(scope: !204, file: !13, line: 120, column: 5)
!210 = !DILocation(line: 121, column: 13, scope: !209)
!211 = !DILocalVariable(name: "buffer", scope: !209, file: !13, line: 122, type: !8)
!212 = !DILocation(line: 122, column: 15, scope: !209)
!213 = !DILocation(line: 122, column: 31, scope: !209)
!214 = !DILocation(line: 122, column: 24, scope: !209)
!215 = !DILocation(line: 123, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !209, file: !13, line: 123, column: 13)
!217 = !DILocation(line: 123, column: 20, scope: !216)
!218 = !DILocation(line: 123, column: 13, scope: !209)
!219 = !DILocation(line: 123, column: 30, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !13, line: 123, column: 29)
!221 = !DILocation(line: 125, column: 16, scope: !222)
!222 = distinct !DILexicalBlock(scope: !209, file: !13, line: 125, column: 9)
!223 = !DILocation(line: 125, column: 14, scope: !222)
!224 = !DILocation(line: 125, column: 21, scope: !225)
!225 = distinct !DILexicalBlock(scope: !222, file: !13, line: 125, column: 9)
!226 = !DILocation(line: 125, column: 23, scope: !225)
!227 = !DILocation(line: 125, column: 9, scope: !222)
!228 = !DILocation(line: 127, column: 13, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !13, line: 126, column: 9)
!230 = !DILocation(line: 127, column: 20, scope: !229)
!231 = !DILocation(line: 127, column: 23, scope: !229)
!232 = !DILocation(line: 128, column: 9, scope: !229)
!233 = !DILocation(line: 125, column: 30, scope: !225)
!234 = !DILocation(line: 125, column: 9, scope: !225)
!235 = distinct !{!235, !227, !236, !91}
!236 = !DILocation(line: 128, column: 9, scope: !222)
!237 = !DILocation(line: 130, column: 13, scope: !238)
!238 = distinct !DILexicalBlock(scope: !209, file: !13, line: 130, column: 13)
!239 = !DILocation(line: 130, column: 18, scope: !238)
!240 = !DILocation(line: 130, column: 23, scope: !238)
!241 = !DILocation(line: 130, column: 26, scope: !238)
!242 = !DILocation(line: 130, column: 31, scope: !238)
!243 = !DILocation(line: 130, column: 13, scope: !209)
!244 = !DILocation(line: 132, column: 13, scope: !245)
!245 = distinct !DILexicalBlock(scope: !238, file: !13, line: 131, column: 9)
!246 = !DILocation(line: 132, column: 20, scope: !245)
!247 = !DILocation(line: 132, column: 26, scope: !245)
!248 = !DILocation(line: 134, column: 19, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !13, line: 134, column: 13)
!250 = !DILocation(line: 134, column: 17, scope: !249)
!251 = !DILocation(line: 134, column: 24, scope: !252)
!252 = distinct !DILexicalBlock(scope: !249, file: !13, line: 134, column: 13)
!253 = !DILocation(line: 134, column: 26, scope: !252)
!254 = !DILocation(line: 134, column: 13, scope: !249)
!255 = !DILocation(line: 136, column: 30, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !13, line: 135, column: 13)
!257 = !DILocation(line: 136, column: 37, scope: !256)
!258 = !DILocation(line: 136, column: 17, scope: !256)
!259 = !DILocation(line: 137, column: 13, scope: !256)
!260 = !DILocation(line: 134, column: 33, scope: !252)
!261 = !DILocation(line: 134, column: 13, scope: !252)
!262 = distinct !{!262, !254, !263, !91}
!263 = !DILocation(line: 137, column: 13, scope: !249)
!264 = !DILocation(line: 138, column: 9, scope: !245)
!265 = !DILocation(line: 141, column: 13, scope: !266)
!266 = distinct !DILexicalBlock(scope: !238, file: !13, line: 140, column: 9)
!267 = !DILocation(line: 143, column: 14, scope: !209)
!268 = !DILocation(line: 143, column: 9, scope: !209)
!269 = !DILocation(line: 145, column: 1, scope: !204)
