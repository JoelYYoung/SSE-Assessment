; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %call = call i32 @rand() #5, !dbg !21
  %and = and i32 %call, 1, !dbg !21
  %tobool = icmp ne i32 %and, 0, !dbg !21
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !21

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !21
  %shl = shl i32 %call1, 30, !dbg !21
  %call2 = call i32 @rand() #5, !dbg !21
  %shl3 = shl i32 %call2, 15, !dbg !21
  %xor = xor i32 %shl, %shl3, !dbg !21
  %call4 = call i32 @rand() #5, !dbg !21
  %xor5 = xor i32 %xor, %call4, !dbg !21
  br label %cond.end, !dbg !21

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !21
  %shl7 = shl i32 %call6, 30, !dbg !21
  %call8 = call i32 @rand() #5, !dbg !21
  %shl9 = shl i32 %call8, 15, !dbg !21
  %xor10 = xor i32 %shl7, %shl9, !dbg !21
  %call11 = call i32 @rand() #5, !dbg !21
  %xor12 = xor i32 %xor10, %call11, !dbg !21
  %sub = sub i32 0, %xor12, !dbg !21
  %sub13 = sub i32 %sub, 1, !dbg !21
  br label %cond.end, !dbg !21

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !21
  store i32 %cond, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !26, metadata !DIExpression()), !dbg !27
  %call14 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !28
  %0 = bitcast i8* %call14 to i32*, !dbg !29
  store i32* %0, i32** %buffer, align 8, !dbg !27
  %1 = load i32*, i32** %buffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %cond.end
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !39
  %cmp15 = icmp slt i32 %2, 10, !dbg !41
  br i1 %cmp15, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !43
  %4 = load i32, i32* %i, align 4, !dbg !45
  %idxprom = sext i32 %4 to i64, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %5, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !53
  %cmp16 = icmp sge i32 %6, 0, !dbg !55
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !56

if.then17:                                        ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !57
  %8 = load i32, i32* %data, align 4, !dbg !59
  %idxprom18 = sext i32 %8 to i64, !dbg !57
  %arrayidx19 = getelementptr inbounds i32, i32* %7, i64 %idxprom18, !dbg !57
  store i32 1, i32* %arrayidx19, align 4, !dbg !60
  store i32 0, i32* %i, align 4, !dbg !61
  br label %for.cond20, !dbg !63

for.cond20:                                       ; preds = %for.inc25, %if.then17
  %9 = load i32, i32* %i, align 4, !dbg !64
  %cmp21 = icmp slt i32 %9, 10, !dbg !66
  br i1 %cmp21, label %for.body22, label %for.end27, !dbg !67

for.body22:                                       ; preds = %for.cond20
  %10 = load i32*, i32** %buffer, align 8, !dbg !68
  %11 = load i32, i32* %i, align 4, !dbg !70
  %idxprom23 = sext i32 %11 to i64, !dbg !68
  %arrayidx24 = getelementptr inbounds i32, i32* %10, i64 %idxprom23, !dbg !68
  %12 = load i32, i32* %arrayidx24, align 4, !dbg !68
  call void @printIntLine(i32 %12), !dbg !71
  br label %for.inc25, !dbg !72

for.inc25:                                        ; preds = %for.body22
  %13 = load i32, i32* %i, align 4, !dbg !73
  %inc26 = add nsw i32 %13, 1, !dbg !73
  store i32 %inc26, i32* %i, align 4, !dbg !73
  br label %for.cond20, !dbg !74, !llvm.loop !75

for.end27:                                        ; preds = %for.cond20
  br label %if.end28, !dbg !77

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !78
  br label %if.end28

if.end28:                                         ; preds = %if.else, %for.end27
  %14 = load i32*, i32** %buffer, align 8, !dbg !80
  %15 = bitcast i32* %14 to i8*, !dbg !80
  call void @free(i8* %15) #5, !dbg !81
  ret void, !dbg !82
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15_good() #0 !dbg !83 {
entry:
  call void @goodB2G1(), !dbg !84
  call void @goodB2G2(), !dbg !85
  call void @goodG2B1(), !dbg !86
  call void @goodG2B2(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #5, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #5, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !109 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %data, align 4, !dbg !112
  %call = call i32 @rand() #5, !dbg !113
  %and = and i32 %call, 1, !dbg !113
  %tobool = icmp ne i32 %and, 0, !dbg !113
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !113

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !113
  %shl = shl i32 %call1, 30, !dbg !113
  %call2 = call i32 @rand() #5, !dbg !113
  %shl3 = shl i32 %call2, 15, !dbg !113
  %xor = xor i32 %shl, %shl3, !dbg !113
  %call4 = call i32 @rand() #5, !dbg !113
  %xor5 = xor i32 %xor, %call4, !dbg !113
  br label %cond.end, !dbg !113

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !113
  %shl7 = shl i32 %call6, 30, !dbg !113
  %call8 = call i32 @rand() #5, !dbg !113
  %shl9 = shl i32 %call8, 15, !dbg !113
  %xor10 = xor i32 %shl7, %shl9, !dbg !113
  %call11 = call i32 @rand() #5, !dbg !113
  %xor12 = xor i32 %xor10, %call11, !dbg !113
  %sub = sub i32 0, %xor12, !dbg !113
  %sub13 = sub i32 %sub, 1, !dbg !113
  br label %cond.end, !dbg !113

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !113
  store i32 %cond, i32* %data, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata i32* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !118, metadata !DIExpression()), !dbg !119
  %call14 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !120
  %0 = bitcast i8* %call14 to i32*, !dbg !121
  store i32* %0, i32** %buffer, align 8, !dbg !119
  %1 = load i32*, i32** %buffer, align 8, !dbg !122
  %cmp = icmp eq i32* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %cond.end
  call void @exit(i32 -1) #6, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !131
  %cmp15 = icmp slt i32 %2, 10, !dbg !133
  br i1 %cmp15, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !135
  %4 = load i32, i32* %i, align 4, !dbg !137
  %idxprom = sext i32 %4 to i64, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !140
  %inc = add nsw i32 %5, 1, !dbg !140
  store i32 %inc, i32* %i, align 4, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !144
  %cmp16 = icmp sge i32 %6, 0, !dbg !146
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !147

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !148
  %cmp17 = icmp slt i32 %7, 10, !dbg !149
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !150

if.then18:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !151
  %9 = load i32, i32* %data, align 4, !dbg !153
  %idxprom19 = sext i32 %9 to i64, !dbg !151
  %arrayidx20 = getelementptr inbounds i32, i32* %8, i64 %idxprom19, !dbg !151
  store i32 1, i32* %arrayidx20, align 4, !dbg !154
  store i32 0, i32* %i, align 4, !dbg !155
  br label %for.cond21, !dbg !157

for.cond21:                                       ; preds = %for.inc26, %if.then18
  %10 = load i32, i32* %i, align 4, !dbg !158
  %cmp22 = icmp slt i32 %10, 10, !dbg !160
  br i1 %cmp22, label %for.body23, label %for.end28, !dbg !161

for.body23:                                       ; preds = %for.cond21
  %11 = load i32*, i32** %buffer, align 8, !dbg !162
  %12 = load i32, i32* %i, align 4, !dbg !164
  %idxprom24 = sext i32 %12 to i64, !dbg !162
  %arrayidx25 = getelementptr inbounds i32, i32* %11, i64 %idxprom24, !dbg !162
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !162
  call void @printIntLine(i32 %13), !dbg !165
  br label %for.inc26, !dbg !166

for.inc26:                                        ; preds = %for.body23
  %14 = load i32, i32* %i, align 4, !dbg !167
  %inc27 = add nsw i32 %14, 1, !dbg !167
  store i32 %inc27, i32* %i, align 4, !dbg !167
  br label %for.cond21, !dbg !168, !llvm.loop !169

for.end28:                                        ; preds = %for.cond21
  br label %if.end29, !dbg !171

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !172
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end28
  %15 = load i32*, i32** %buffer, align 8, !dbg !174
  %16 = bitcast i32* %15 to i8*, !dbg !174
  call void @free(i8* %16) #5, !dbg !175
  ret void, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !177 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !178, metadata !DIExpression()), !dbg !179
  store i32 -1, i32* %data, align 4, !dbg !180
  %call = call i32 @rand() #5, !dbg !181
  %and = and i32 %call, 1, !dbg !181
  %tobool = icmp ne i32 %and, 0, !dbg !181
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !181

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !181
  %shl = shl i32 %call1, 30, !dbg !181
  %call2 = call i32 @rand() #5, !dbg !181
  %shl3 = shl i32 %call2, 15, !dbg !181
  %xor = xor i32 %shl, %shl3, !dbg !181
  %call4 = call i32 @rand() #5, !dbg !181
  %xor5 = xor i32 %xor, %call4, !dbg !181
  br label %cond.end, !dbg !181

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !181
  %shl7 = shl i32 %call6, 30, !dbg !181
  %call8 = call i32 @rand() #5, !dbg !181
  %shl9 = shl i32 %call8, 15, !dbg !181
  %xor10 = xor i32 %shl7, %shl9, !dbg !181
  %call11 = call i32 @rand() #5, !dbg !181
  %xor12 = xor i32 %xor10, %call11, !dbg !181
  %sub = sub i32 0, %xor12, !dbg !181
  %sub13 = sub i32 %sub, 1, !dbg !181
  br label %cond.end, !dbg !181

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !181
  store i32 %cond, i32* %data, align 4, !dbg !182
  call void @llvm.dbg.declare(metadata i32* %i, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !186, metadata !DIExpression()), !dbg !187
  %call14 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !188
  %0 = bitcast i8* %call14 to i32*, !dbg !189
  store i32* %0, i32** %buffer, align 8, !dbg !187
  %1 = load i32*, i32** %buffer, align 8, !dbg !190
  %cmp = icmp eq i32* %1, null, !dbg !192
  br i1 %cmp, label %if.then, label %if.end, !dbg !193

if.then:                                          ; preds = %cond.end
  call void @exit(i32 -1) #6, !dbg !194
  unreachable, !dbg !194

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !196
  br label %for.cond, !dbg !198

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !199
  %cmp15 = icmp slt i32 %2, 10, !dbg !201
  br i1 %cmp15, label %for.body, label %for.end, !dbg !202

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !203
  %4 = load i32, i32* %i, align 4, !dbg !205
  %idxprom = sext i32 %4 to i64, !dbg !203
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !203
  store i32 0, i32* %arrayidx, align 4, !dbg !206
  br label %for.inc, !dbg !207

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !208
  %inc = add nsw i32 %5, 1, !dbg !208
  store i32 %inc, i32* %i, align 4, !dbg !208
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !212
  %cmp16 = icmp sge i32 %6, 0, !dbg !214
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !215

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !216
  %cmp17 = icmp slt i32 %7, 10, !dbg !217
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !218

if.then18:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !219
  %9 = load i32, i32* %data, align 4, !dbg !221
  %idxprom19 = sext i32 %9 to i64, !dbg !219
  %arrayidx20 = getelementptr inbounds i32, i32* %8, i64 %idxprom19, !dbg !219
  store i32 1, i32* %arrayidx20, align 4, !dbg !222
  store i32 0, i32* %i, align 4, !dbg !223
  br label %for.cond21, !dbg !225

for.cond21:                                       ; preds = %for.inc26, %if.then18
  %10 = load i32, i32* %i, align 4, !dbg !226
  %cmp22 = icmp slt i32 %10, 10, !dbg !228
  br i1 %cmp22, label %for.body23, label %for.end28, !dbg !229

for.body23:                                       ; preds = %for.cond21
  %11 = load i32*, i32** %buffer, align 8, !dbg !230
  %12 = load i32, i32* %i, align 4, !dbg !232
  %idxprom24 = sext i32 %12 to i64, !dbg !230
  %arrayidx25 = getelementptr inbounds i32, i32* %11, i64 %idxprom24, !dbg !230
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !230
  call void @printIntLine(i32 %13), !dbg !233
  br label %for.inc26, !dbg !234

for.inc26:                                        ; preds = %for.body23
  %14 = load i32, i32* %i, align 4, !dbg !235
  %inc27 = add nsw i32 %14, 1, !dbg !235
  store i32 %inc27, i32* %i, align 4, !dbg !235
  br label %for.cond21, !dbg !236, !llvm.loop !237

for.end28:                                        ; preds = %for.cond21
  br label %if.end29, !dbg !239

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !240
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end28
  %15 = load i32*, i32** %buffer, align 8, !dbg !242
  %16 = bitcast i32* %15 to i8*, !dbg !242
  call void @free(i8* %16) #5, !dbg !243
  ret void, !dbg !244
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !245 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !246, metadata !DIExpression()), !dbg !247
  store i32 -1, i32* %data, align 4, !dbg !248
  store i32 7, i32* %data, align 4, !dbg !249
  call void @llvm.dbg.declare(metadata i32* %i, metadata !250, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !253, metadata !DIExpression()), !dbg !254
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !255
  %0 = bitcast i8* %call to i32*, !dbg !256
  store i32* %0, i32** %buffer, align 8, !dbg !254
  %1 = load i32*, i32** %buffer, align 8, !dbg !257
  %cmp = icmp eq i32* %1, null, !dbg !259
  br i1 %cmp, label %if.then, label %if.end, !dbg !260

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !261
  unreachable, !dbg !261

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !263
  br label %for.cond, !dbg !265

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !266
  %cmp1 = icmp slt i32 %2, 10, !dbg !268
  br i1 %cmp1, label %for.body, label %for.end, !dbg !269

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !270
  %4 = load i32, i32* %i, align 4, !dbg !272
  %idxprom = sext i32 %4 to i64, !dbg !270
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !270
  store i32 0, i32* %arrayidx, align 4, !dbg !273
  br label %for.inc, !dbg !274

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !275
  %inc = add nsw i32 %5, 1, !dbg !275
  store i32 %inc, i32* %i, align 4, !dbg !275
  br label %for.cond, !dbg !276, !llvm.loop !277

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !279
  %cmp2 = icmp sge i32 %6, 0, !dbg !281
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !282

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !283
  %8 = load i32, i32* %data, align 4, !dbg !285
  %idxprom4 = sext i32 %8 to i64, !dbg !283
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !283
  store i32 1, i32* %arrayidx5, align 4, !dbg !286
  store i32 0, i32* %i, align 4, !dbg !287
  br label %for.cond6, !dbg !289

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !290
  %cmp7 = icmp slt i32 %9, 10, !dbg !292
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !293

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !294
  %11 = load i32, i32* %i, align 4, !dbg !296
  %idxprom9 = sext i32 %11 to i64, !dbg !294
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !294
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !294
  call void @printIntLine(i32 %12), !dbg !297
  br label %for.inc11, !dbg !298

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !299
  %inc12 = add nsw i32 %13, 1, !dbg !299
  store i32 %inc12, i32* %i, align 4, !dbg !299
  br label %for.cond6, !dbg !300, !llvm.loop !301

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !303

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !304
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !306
  %15 = bitcast i32* %14 to i8*, !dbg !306
  call void @free(i8* %15) #5, !dbg !307
  ret void, !dbg !308
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !309 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !310, metadata !DIExpression()), !dbg !311
  store i32 -1, i32* %data, align 4, !dbg !312
  store i32 7, i32* %data, align 4, !dbg !313
  call void @llvm.dbg.declare(metadata i32* %i, metadata !314, metadata !DIExpression()), !dbg !316
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !317, metadata !DIExpression()), !dbg !318
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !319
  %0 = bitcast i8* %call to i32*, !dbg !320
  store i32* %0, i32** %buffer, align 8, !dbg !318
  %1 = load i32*, i32** %buffer, align 8, !dbg !321
  %cmp = icmp eq i32* %1, null, !dbg !323
  br i1 %cmp, label %if.then, label %if.end, !dbg !324

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !325
  unreachable, !dbg !325

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !327
  br label %for.cond, !dbg !329

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !330
  %cmp1 = icmp slt i32 %2, 10, !dbg !332
  br i1 %cmp1, label %for.body, label %for.end, !dbg !333

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !334
  %4 = load i32, i32* %i, align 4, !dbg !336
  %idxprom = sext i32 %4 to i64, !dbg !334
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !334
  store i32 0, i32* %arrayidx, align 4, !dbg !337
  br label %for.inc, !dbg !338

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !339
  %inc = add nsw i32 %5, 1, !dbg !339
  store i32 %inc, i32* %i, align 4, !dbg !339
  br label %for.cond, !dbg !340, !llvm.loop !341

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !343
  %cmp2 = icmp sge i32 %6, 0, !dbg !345
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !346

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !347
  %8 = load i32, i32* %data, align 4, !dbg !349
  %idxprom4 = sext i32 %8 to i64, !dbg !347
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !347
  store i32 1, i32* %arrayidx5, align 4, !dbg !350
  store i32 0, i32* %i, align 4, !dbg !351
  br label %for.cond6, !dbg !353

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !354
  %cmp7 = icmp slt i32 %9, 10, !dbg !356
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !357

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !358
  %11 = load i32, i32* %i, align 4, !dbg !360
  %idxprom9 = sext i32 %11 to i64, !dbg !358
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !358
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !358
  call void @printIntLine(i32 %12), !dbg !361
  br label %for.inc11, !dbg !362

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !363
  %inc12 = add nsw i32 %13, 1, !dbg !363
  store i32 %inc12, i32* %i, align 4, !dbg !363
  br label %for.cond6, !dbg !364, !llvm.loop !365

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !367

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !368
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !370
  %15 = bitcast i32* %14 to i8*, !dbg !370
  call void @free(i8* %15) #5, !dbg !371
  ret void, !dbg !372
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 31, column: 16, scope: !14)
!22 = !DILocation(line: 31, column: 14, scope: !14)
!23 = !DILocalVariable(name: "i", scope: !24, file: !15, line: 42, type: !4)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!25 = !DILocation(line: 42, column: 13, scope: !24)
!26 = !DILocalVariable(name: "buffer", scope: !24, file: !15, line: 43, type: !6)
!27 = !DILocation(line: 43, column: 15, scope: !24)
!28 = !DILocation(line: 43, column: 31, scope: !24)
!29 = !DILocation(line: 43, column: 24, scope: !24)
!30 = !DILocation(line: 44, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !15, line: 44, column: 13)
!32 = !DILocation(line: 44, column: 20, scope: !31)
!33 = !DILocation(line: 44, column: 13, scope: !24)
!34 = !DILocation(line: 44, column: 30, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 44, column: 29)
!36 = !DILocation(line: 46, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !24, file: !15, line: 46, column: 9)
!38 = !DILocation(line: 46, column: 14, scope: !37)
!39 = !DILocation(line: 46, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 46, column: 9)
!41 = !DILocation(line: 46, column: 23, scope: !40)
!42 = !DILocation(line: 46, column: 9, scope: !37)
!43 = !DILocation(line: 48, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 47, column: 9)
!45 = !DILocation(line: 48, column: 20, scope: !44)
!46 = !DILocation(line: 48, column: 23, scope: !44)
!47 = !DILocation(line: 49, column: 9, scope: !44)
!48 = !DILocation(line: 46, column: 30, scope: !40)
!49 = !DILocation(line: 46, column: 9, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 49, column: 9, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 52, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !24, file: !15, line: 52, column: 13)
!55 = !DILocation(line: 52, column: 18, scope: !54)
!56 = !DILocation(line: 52, column: 13, scope: !24)
!57 = !DILocation(line: 54, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 53, column: 9)
!59 = !DILocation(line: 54, column: 20, scope: !58)
!60 = !DILocation(line: 54, column: 26, scope: !58)
!61 = !DILocation(line: 56, column: 19, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 56, column: 13)
!63 = !DILocation(line: 56, column: 17, scope: !62)
!64 = !DILocation(line: 56, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !15, line: 56, column: 13)
!66 = !DILocation(line: 56, column: 26, scope: !65)
!67 = !DILocation(line: 56, column: 13, scope: !62)
!68 = !DILocation(line: 58, column: 30, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 57, column: 13)
!70 = !DILocation(line: 58, column: 37, scope: !69)
!71 = !DILocation(line: 58, column: 17, scope: !69)
!72 = !DILocation(line: 59, column: 13, scope: !69)
!73 = !DILocation(line: 56, column: 33, scope: !65)
!74 = !DILocation(line: 56, column: 13, scope: !65)
!75 = distinct !{!75, !67, !76, !52}
!76 = !DILocation(line: 59, column: 13, scope: !62)
!77 = !DILocation(line: 60, column: 9, scope: !58)
!78 = !DILocation(line: 63, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !54, file: !15, line: 62, column: 9)
!80 = !DILocation(line: 65, column: 14, scope: !24)
!81 = !DILocation(line: 65, column: 9, scope: !24)
!82 = !DILocation(line: 73, column: 1, scope: !14)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_15_good", scope: !15, file: !15, line: 295, type: !16, scopeLine: 296, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 297, column: 5, scope: !83)
!85 = !DILocation(line: 298, column: 5, scope: !83)
!86 = !DILocation(line: 299, column: 5, scope: !83)
!87 = !DILocation(line: 300, column: 5, scope: !83)
!88 = !DILocation(line: 301, column: 1, scope: !83)
!89 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 312, type: !90, scopeLine: 313, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!4, !4, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !15, line: 312, type: !4)
!96 = !DILocation(line: 312, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !15, line: 312, type: !92)
!98 = !DILocation(line: 312, column: 27, scope: !89)
!99 = !DILocation(line: 315, column: 22, scope: !89)
!100 = !DILocation(line: 315, column: 12, scope: !89)
!101 = !DILocation(line: 315, column: 5, scope: !89)
!102 = !DILocation(line: 317, column: 5, scope: !89)
!103 = !DILocation(line: 318, column: 5, scope: !89)
!104 = !DILocation(line: 319, column: 5, scope: !89)
!105 = !DILocation(line: 322, column: 5, scope: !89)
!106 = !DILocation(line: 323, column: 5, scope: !89)
!107 = !DILocation(line: 324, column: 5, scope: !89)
!108 = !DILocation(line: 326, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 82, type: !4)
!111 = !DILocation(line: 82, column: 9, scope: !109)
!112 = !DILocation(line: 84, column: 10, scope: !109)
!113 = !DILocation(line: 89, column: 16, scope: !109)
!114 = !DILocation(line: 89, column: 14, scope: !109)
!115 = !DILocalVariable(name: "i", scope: !116, file: !15, line: 104, type: !4)
!116 = distinct !DILexicalBlock(scope: !109, file: !15, line: 103, column: 5)
!117 = !DILocation(line: 104, column: 13, scope: !116)
!118 = !DILocalVariable(name: "buffer", scope: !116, file: !15, line: 105, type: !6)
!119 = !DILocation(line: 105, column: 15, scope: !116)
!120 = !DILocation(line: 105, column: 31, scope: !116)
!121 = !DILocation(line: 105, column: 24, scope: !116)
!122 = !DILocation(line: 106, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !15, line: 106, column: 13)
!124 = !DILocation(line: 106, column: 20, scope: !123)
!125 = !DILocation(line: 106, column: 13, scope: !116)
!126 = !DILocation(line: 106, column: 30, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 106, column: 29)
!128 = !DILocation(line: 108, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !116, file: !15, line: 108, column: 9)
!130 = !DILocation(line: 108, column: 14, scope: !129)
!131 = !DILocation(line: 108, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !15, line: 108, column: 9)
!133 = !DILocation(line: 108, column: 23, scope: !132)
!134 = !DILocation(line: 108, column: 9, scope: !129)
!135 = !DILocation(line: 110, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 109, column: 9)
!137 = !DILocation(line: 110, column: 20, scope: !136)
!138 = !DILocation(line: 110, column: 23, scope: !136)
!139 = !DILocation(line: 111, column: 9, scope: !136)
!140 = !DILocation(line: 108, column: 30, scope: !132)
!141 = !DILocation(line: 108, column: 9, scope: !132)
!142 = distinct !{!142, !134, !143, !52}
!143 = !DILocation(line: 111, column: 9, scope: !129)
!144 = !DILocation(line: 113, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !116, file: !15, line: 113, column: 13)
!146 = !DILocation(line: 113, column: 18, scope: !145)
!147 = !DILocation(line: 113, column: 23, scope: !145)
!148 = !DILocation(line: 113, column: 26, scope: !145)
!149 = !DILocation(line: 113, column: 31, scope: !145)
!150 = !DILocation(line: 113, column: 13, scope: !116)
!151 = !DILocation(line: 115, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !145, file: !15, line: 114, column: 9)
!153 = !DILocation(line: 115, column: 20, scope: !152)
!154 = !DILocation(line: 115, column: 26, scope: !152)
!155 = !DILocation(line: 117, column: 19, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !15, line: 117, column: 13)
!157 = !DILocation(line: 117, column: 17, scope: !156)
!158 = !DILocation(line: 117, column: 24, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !15, line: 117, column: 13)
!160 = !DILocation(line: 117, column: 26, scope: !159)
!161 = !DILocation(line: 117, column: 13, scope: !156)
!162 = !DILocation(line: 119, column: 30, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !15, line: 118, column: 13)
!164 = !DILocation(line: 119, column: 37, scope: !163)
!165 = !DILocation(line: 119, column: 17, scope: !163)
!166 = !DILocation(line: 120, column: 13, scope: !163)
!167 = !DILocation(line: 117, column: 33, scope: !159)
!168 = !DILocation(line: 117, column: 13, scope: !159)
!169 = distinct !{!169, !161, !170, !52}
!170 = !DILocation(line: 120, column: 13, scope: !156)
!171 = !DILocation(line: 121, column: 9, scope: !152)
!172 = !DILocation(line: 124, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !145, file: !15, line: 123, column: 9)
!174 = !DILocation(line: 126, column: 14, scope: !116)
!175 = !DILocation(line: 126, column: 9, scope: !116)
!176 = !DILocation(line: 130, column: 1, scope: !109)
!177 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 133, type: !16, scopeLine: 134, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!178 = !DILocalVariable(name: "data", scope: !177, file: !15, line: 135, type: !4)
!179 = !DILocation(line: 135, column: 9, scope: !177)
!180 = !DILocation(line: 137, column: 10, scope: !177)
!181 = !DILocation(line: 142, column: 16, scope: !177)
!182 = !DILocation(line: 142, column: 14, scope: !177)
!183 = !DILocalVariable(name: "i", scope: !184, file: !15, line: 153, type: !4)
!184 = distinct !DILexicalBlock(scope: !177, file: !15, line: 152, column: 5)
!185 = !DILocation(line: 153, column: 13, scope: !184)
!186 = !DILocalVariable(name: "buffer", scope: !184, file: !15, line: 154, type: !6)
!187 = !DILocation(line: 154, column: 15, scope: !184)
!188 = !DILocation(line: 154, column: 31, scope: !184)
!189 = !DILocation(line: 154, column: 24, scope: !184)
!190 = !DILocation(line: 155, column: 13, scope: !191)
!191 = distinct !DILexicalBlock(scope: !184, file: !15, line: 155, column: 13)
!192 = !DILocation(line: 155, column: 20, scope: !191)
!193 = !DILocation(line: 155, column: 13, scope: !184)
!194 = !DILocation(line: 155, column: 30, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !15, line: 155, column: 29)
!196 = !DILocation(line: 157, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !184, file: !15, line: 157, column: 9)
!198 = !DILocation(line: 157, column: 14, scope: !197)
!199 = !DILocation(line: 157, column: 21, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !15, line: 157, column: 9)
!201 = !DILocation(line: 157, column: 23, scope: !200)
!202 = !DILocation(line: 157, column: 9, scope: !197)
!203 = !DILocation(line: 159, column: 13, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !15, line: 158, column: 9)
!205 = !DILocation(line: 159, column: 20, scope: !204)
!206 = !DILocation(line: 159, column: 23, scope: !204)
!207 = !DILocation(line: 160, column: 9, scope: !204)
!208 = !DILocation(line: 157, column: 30, scope: !200)
!209 = !DILocation(line: 157, column: 9, scope: !200)
!210 = distinct !{!210, !202, !211, !52}
!211 = !DILocation(line: 160, column: 9, scope: !197)
!212 = !DILocation(line: 162, column: 13, scope: !213)
!213 = distinct !DILexicalBlock(scope: !184, file: !15, line: 162, column: 13)
!214 = !DILocation(line: 162, column: 18, scope: !213)
!215 = !DILocation(line: 162, column: 23, scope: !213)
!216 = !DILocation(line: 162, column: 26, scope: !213)
!217 = !DILocation(line: 162, column: 31, scope: !213)
!218 = !DILocation(line: 162, column: 13, scope: !184)
!219 = !DILocation(line: 164, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !213, file: !15, line: 163, column: 9)
!221 = !DILocation(line: 164, column: 20, scope: !220)
!222 = !DILocation(line: 164, column: 26, scope: !220)
!223 = !DILocation(line: 166, column: 19, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !15, line: 166, column: 13)
!225 = !DILocation(line: 166, column: 17, scope: !224)
!226 = !DILocation(line: 166, column: 24, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !15, line: 166, column: 13)
!228 = !DILocation(line: 166, column: 26, scope: !227)
!229 = !DILocation(line: 166, column: 13, scope: !224)
!230 = !DILocation(line: 168, column: 30, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !15, line: 167, column: 13)
!232 = !DILocation(line: 168, column: 37, scope: !231)
!233 = !DILocation(line: 168, column: 17, scope: !231)
!234 = !DILocation(line: 169, column: 13, scope: !231)
!235 = !DILocation(line: 166, column: 33, scope: !227)
!236 = !DILocation(line: 166, column: 13, scope: !227)
!237 = distinct !{!237, !229, !238, !52}
!238 = !DILocation(line: 169, column: 13, scope: !224)
!239 = !DILocation(line: 170, column: 9, scope: !220)
!240 = !DILocation(line: 173, column: 13, scope: !241)
!241 = distinct !DILexicalBlock(scope: !213, file: !15, line: 172, column: 9)
!242 = !DILocation(line: 175, column: 14, scope: !184)
!243 = !DILocation(line: 175, column: 9, scope: !184)
!244 = !DILocation(line: 183, column: 1, scope: !177)
!245 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 186, type: !16, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!246 = !DILocalVariable(name: "data", scope: !245, file: !15, line: 188, type: !4)
!247 = !DILocation(line: 188, column: 9, scope: !245)
!248 = !DILocation(line: 190, column: 10, scope: !245)
!249 = !DILocation(line: 200, column: 14, scope: !245)
!250 = !DILocalVariable(name: "i", scope: !251, file: !15, line: 207, type: !4)
!251 = distinct !DILexicalBlock(scope: !245, file: !15, line: 206, column: 5)
!252 = !DILocation(line: 207, column: 13, scope: !251)
!253 = !DILocalVariable(name: "buffer", scope: !251, file: !15, line: 208, type: !6)
!254 = !DILocation(line: 208, column: 15, scope: !251)
!255 = !DILocation(line: 208, column: 31, scope: !251)
!256 = !DILocation(line: 208, column: 24, scope: !251)
!257 = !DILocation(line: 209, column: 13, scope: !258)
!258 = distinct !DILexicalBlock(scope: !251, file: !15, line: 209, column: 13)
!259 = !DILocation(line: 209, column: 20, scope: !258)
!260 = !DILocation(line: 209, column: 13, scope: !251)
!261 = !DILocation(line: 209, column: 30, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !15, line: 209, column: 29)
!263 = !DILocation(line: 211, column: 16, scope: !264)
!264 = distinct !DILexicalBlock(scope: !251, file: !15, line: 211, column: 9)
!265 = !DILocation(line: 211, column: 14, scope: !264)
!266 = !DILocation(line: 211, column: 21, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !15, line: 211, column: 9)
!268 = !DILocation(line: 211, column: 23, scope: !267)
!269 = !DILocation(line: 211, column: 9, scope: !264)
!270 = !DILocation(line: 213, column: 13, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !15, line: 212, column: 9)
!272 = !DILocation(line: 213, column: 20, scope: !271)
!273 = !DILocation(line: 213, column: 23, scope: !271)
!274 = !DILocation(line: 214, column: 9, scope: !271)
!275 = !DILocation(line: 211, column: 30, scope: !267)
!276 = !DILocation(line: 211, column: 9, scope: !267)
!277 = distinct !{!277, !269, !278, !52}
!278 = !DILocation(line: 214, column: 9, scope: !264)
!279 = !DILocation(line: 217, column: 13, scope: !280)
!280 = distinct !DILexicalBlock(scope: !251, file: !15, line: 217, column: 13)
!281 = !DILocation(line: 217, column: 18, scope: !280)
!282 = !DILocation(line: 217, column: 13, scope: !251)
!283 = !DILocation(line: 219, column: 13, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !15, line: 218, column: 9)
!285 = !DILocation(line: 219, column: 20, scope: !284)
!286 = !DILocation(line: 219, column: 26, scope: !284)
!287 = !DILocation(line: 221, column: 19, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !15, line: 221, column: 13)
!289 = !DILocation(line: 221, column: 17, scope: !288)
!290 = !DILocation(line: 221, column: 24, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !15, line: 221, column: 13)
!292 = !DILocation(line: 221, column: 26, scope: !291)
!293 = !DILocation(line: 221, column: 13, scope: !288)
!294 = !DILocation(line: 223, column: 30, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !15, line: 222, column: 13)
!296 = !DILocation(line: 223, column: 37, scope: !295)
!297 = !DILocation(line: 223, column: 17, scope: !295)
!298 = !DILocation(line: 224, column: 13, scope: !295)
!299 = !DILocation(line: 221, column: 33, scope: !291)
!300 = !DILocation(line: 221, column: 13, scope: !291)
!301 = distinct !{!301, !293, !302, !52}
!302 = !DILocation(line: 224, column: 13, scope: !288)
!303 = !DILocation(line: 225, column: 9, scope: !284)
!304 = !DILocation(line: 228, column: 13, scope: !305)
!305 = distinct !DILexicalBlock(scope: !280, file: !15, line: 227, column: 9)
!306 = !DILocation(line: 230, column: 14, scope: !251)
!307 = !DILocation(line: 230, column: 9, scope: !251)
!308 = !DILocation(line: 238, column: 1, scope: !245)
!309 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 241, type: !16, scopeLine: 242, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!310 = !DILocalVariable(name: "data", scope: !309, file: !15, line: 243, type: !4)
!311 = !DILocation(line: 243, column: 9, scope: !309)
!312 = !DILocation(line: 245, column: 10, scope: !309)
!313 = !DILocation(line: 251, column: 14, scope: !309)
!314 = !DILocalVariable(name: "i", scope: !315, file: !15, line: 262, type: !4)
!315 = distinct !DILexicalBlock(scope: !309, file: !15, line: 261, column: 5)
!316 = !DILocation(line: 262, column: 13, scope: !315)
!317 = !DILocalVariable(name: "buffer", scope: !315, file: !15, line: 263, type: !6)
!318 = !DILocation(line: 263, column: 15, scope: !315)
!319 = !DILocation(line: 263, column: 31, scope: !315)
!320 = !DILocation(line: 263, column: 24, scope: !315)
!321 = !DILocation(line: 264, column: 13, scope: !322)
!322 = distinct !DILexicalBlock(scope: !315, file: !15, line: 264, column: 13)
!323 = !DILocation(line: 264, column: 20, scope: !322)
!324 = !DILocation(line: 264, column: 13, scope: !315)
!325 = !DILocation(line: 264, column: 30, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !15, line: 264, column: 29)
!327 = !DILocation(line: 266, column: 16, scope: !328)
!328 = distinct !DILexicalBlock(scope: !315, file: !15, line: 266, column: 9)
!329 = !DILocation(line: 266, column: 14, scope: !328)
!330 = !DILocation(line: 266, column: 21, scope: !331)
!331 = distinct !DILexicalBlock(scope: !328, file: !15, line: 266, column: 9)
!332 = !DILocation(line: 266, column: 23, scope: !331)
!333 = !DILocation(line: 266, column: 9, scope: !328)
!334 = !DILocation(line: 268, column: 13, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !15, line: 267, column: 9)
!336 = !DILocation(line: 268, column: 20, scope: !335)
!337 = !DILocation(line: 268, column: 23, scope: !335)
!338 = !DILocation(line: 269, column: 9, scope: !335)
!339 = !DILocation(line: 266, column: 30, scope: !331)
!340 = !DILocation(line: 266, column: 9, scope: !331)
!341 = distinct !{!341, !333, !342, !52}
!342 = !DILocation(line: 269, column: 9, scope: !328)
!343 = !DILocation(line: 272, column: 13, scope: !344)
!344 = distinct !DILexicalBlock(scope: !315, file: !15, line: 272, column: 13)
!345 = !DILocation(line: 272, column: 18, scope: !344)
!346 = !DILocation(line: 272, column: 13, scope: !315)
!347 = !DILocation(line: 274, column: 13, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !15, line: 273, column: 9)
!349 = !DILocation(line: 274, column: 20, scope: !348)
!350 = !DILocation(line: 274, column: 26, scope: !348)
!351 = !DILocation(line: 276, column: 19, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !15, line: 276, column: 13)
!353 = !DILocation(line: 276, column: 17, scope: !352)
!354 = !DILocation(line: 276, column: 24, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !15, line: 276, column: 13)
!356 = !DILocation(line: 276, column: 26, scope: !355)
!357 = !DILocation(line: 276, column: 13, scope: !352)
!358 = !DILocation(line: 278, column: 30, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !15, line: 277, column: 13)
!360 = !DILocation(line: 278, column: 37, scope: !359)
!361 = !DILocation(line: 278, column: 17, scope: !359)
!362 = !DILocation(line: 279, column: 13, scope: !359)
!363 = !DILocation(line: 276, column: 33, scope: !355)
!364 = !DILocation(line: 276, column: 13, scope: !355)
!365 = distinct !{!365, !357, !366, !52}
!366 = !DILocation(line: 279, column: 13, scope: !352)
!367 = !DILocation(line: 280, column: 9, scope: !348)
!368 = !DILocation(line: 283, column: 13, scope: !369)
!369 = distinct !DILexicalBlock(scope: !344, file: !15, line: 282, column: 9)
!370 = !DILocation(line: 285, column: 14, scope: !315)
!371 = !DILocation(line: 285, column: 9, scope: !315)
!372 = !DILocation(line: 293, column: 1, scope: !309)
