; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  %call = call i32 @rand() #5, !dbg !22
  %and = and i32 %call, 1, !dbg !22
  %tobool = icmp ne i32 %and, 0, !dbg !22
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !22

cond.true:                                        ; preds = %while.body
  %call1 = call i32 @rand() #5, !dbg !22
  %shl = shl i32 %call1, 30, !dbg !22
  %call2 = call i32 @rand() #5, !dbg !22
  %shl3 = shl i32 %call2, 15, !dbg !22
  %xor = xor i32 %shl, %shl3, !dbg !22
  %call4 = call i32 @rand() #5, !dbg !22
  %xor5 = xor i32 %xor, %call4, !dbg !22
  br label %cond.end, !dbg !22

cond.false:                                       ; preds = %while.body
  %call6 = call i32 @rand() #5, !dbg !22
  %shl7 = shl i32 %call6, 30, !dbg !22
  %call8 = call i32 @rand() #5, !dbg !22
  %shl9 = shl i32 %call8, 15, !dbg !22
  %xor10 = xor i32 %shl7, %shl9, !dbg !22
  %call11 = call i32 @rand() #5, !dbg !22
  %xor12 = xor i32 %xor10, %call11, !dbg !22
  %sub = sub i32 0, %xor12, !dbg !22
  %sub13 = sub i32 %sub, 1, !dbg !22
  br label %cond.end, !dbg !22

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !22
  store i32 %cond, i32* %data, align 4, !dbg !24
  br label %while.end, !dbg !25

while.end:                                        ; preds = %cond.end
  br label %while.body14, !dbg !26

while.body14:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !31, metadata !DIExpression()), !dbg !32
  %call15 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !33
  %0 = bitcast i8* %call15 to i32*, !dbg !34
  store i32* %0, i32** %buffer, align 8, !dbg !32
  %1 = load i32*, i32** %buffer, align 8, !dbg !35
  %cmp = icmp eq i32* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %while.body14
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %while.body14
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !44
  %cmp16 = icmp slt i32 %2, 10, !dbg !46
  br i1 %cmp16, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !48
  %4 = load i32, i32* %i, align 4, !dbg !50
  %idxprom = sext i32 %4 to i64, !dbg !48
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !48
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %5, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !58
  %cmp17 = icmp sge i32 %6, 0, !dbg !60
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !61

if.then18:                                        ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !62
  %8 = load i32, i32* %data, align 4, !dbg !64
  %idxprom19 = sext i32 %8 to i64, !dbg !62
  %arrayidx20 = getelementptr inbounds i32, i32* %7, i64 %idxprom19, !dbg !62
  store i32 1, i32* %arrayidx20, align 4, !dbg !65
  store i32 0, i32* %i, align 4, !dbg !66
  br label %for.cond21, !dbg !68

for.cond21:                                       ; preds = %for.inc26, %if.then18
  %9 = load i32, i32* %i, align 4, !dbg !69
  %cmp22 = icmp slt i32 %9, 10, !dbg !71
  br i1 %cmp22, label %for.body23, label %for.end28, !dbg !72

for.body23:                                       ; preds = %for.cond21
  %10 = load i32*, i32** %buffer, align 8, !dbg !73
  %11 = load i32, i32* %i, align 4, !dbg !75
  %idxprom24 = sext i32 %11 to i64, !dbg !73
  %arrayidx25 = getelementptr inbounds i32, i32* %10, i64 %idxprom24, !dbg !73
  %12 = load i32, i32* %arrayidx25, align 4, !dbg !73
  call void @printIntLine(i32 %12), !dbg !76
  br label %for.inc26, !dbg !77

for.inc26:                                        ; preds = %for.body23
  %13 = load i32, i32* %i, align 4, !dbg !78
  %inc27 = add nsw i32 %13, 1, !dbg !78
  store i32 %inc27, i32* %i, align 4, !dbg !78
  br label %for.cond21, !dbg !79, !llvm.loop !80

for.end28:                                        ; preds = %for.cond21
  br label %if.end29, !dbg !82

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !83
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end28
  %14 = load i32*, i32** %buffer, align 8, !dbg !85
  %15 = bitcast i32* %14 to i8*, !dbg !85
  call void @free(i8* %15) #5, !dbg !86
  br label %while.end30, !dbg !87

while.end30:                                      ; preds = %if.end29
  ret void, !dbg !88
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16_good() #0 !dbg !89 {
entry:
  call void @goodB2G(), !dbg !90
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #5, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #5, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !113 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 -1, i32* %data, align 4, !dbg !116
  br label %while.body, !dbg !117

while.body:                                       ; preds = %entry
  %call = call i32 @rand() #5, !dbg !118
  %and = and i32 %call, 1, !dbg !118
  %tobool = icmp ne i32 %and, 0, !dbg !118
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !118

cond.true:                                        ; preds = %while.body
  %call1 = call i32 @rand() #5, !dbg !118
  %shl = shl i32 %call1, 30, !dbg !118
  %call2 = call i32 @rand() #5, !dbg !118
  %shl3 = shl i32 %call2, 15, !dbg !118
  %xor = xor i32 %shl, %shl3, !dbg !118
  %call4 = call i32 @rand() #5, !dbg !118
  %xor5 = xor i32 %xor, %call4, !dbg !118
  br label %cond.end, !dbg !118

cond.false:                                       ; preds = %while.body
  %call6 = call i32 @rand() #5, !dbg !118
  %shl7 = shl i32 %call6, 30, !dbg !118
  %call8 = call i32 @rand() #5, !dbg !118
  %shl9 = shl i32 %call8, 15, !dbg !118
  %xor10 = xor i32 %shl7, %shl9, !dbg !118
  %call11 = call i32 @rand() #5, !dbg !118
  %xor12 = xor i32 %xor10, %call11, !dbg !118
  %sub = sub i32 0, %xor12, !dbg !118
  %sub13 = sub i32 %sub, 1, !dbg !118
  br label %cond.end, !dbg !118

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !118
  store i32 %cond, i32* %data, align 4, !dbg !120
  br label %while.end, !dbg !121

while.end:                                        ; preds = %cond.end
  br label %while.body14, !dbg !122

while.body14:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !123, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !127, metadata !DIExpression()), !dbg !128
  %call15 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !129
  %0 = bitcast i8* %call15 to i32*, !dbg !130
  store i32* %0, i32** %buffer, align 8, !dbg !128
  %1 = load i32*, i32** %buffer, align 8, !dbg !131
  %cmp = icmp eq i32* %1, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %while.body14
  call void @exit(i32 -1) #6, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %while.body14
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !140
  %cmp16 = icmp slt i32 %2, 10, !dbg !142
  br i1 %cmp16, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !144
  %4 = load i32, i32* %i, align 4, !dbg !146
  %idxprom = sext i32 %4 to i64, !dbg !144
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !144
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !149
  %inc = add nsw i32 %5, 1, !dbg !149
  store i32 %inc, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !153
  %cmp17 = icmp sge i32 %6, 0, !dbg !155
  br i1 %cmp17, label %land.lhs.true, label %if.else, !dbg !156

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !157
  %cmp18 = icmp slt i32 %7, 10, !dbg !158
  br i1 %cmp18, label %if.then19, label %if.else, !dbg !159

if.then19:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !160
  %9 = load i32, i32* %data, align 4, !dbg !162
  %idxprom20 = sext i32 %9 to i64, !dbg !160
  %arrayidx21 = getelementptr inbounds i32, i32* %8, i64 %idxprom20, !dbg !160
  store i32 1, i32* %arrayidx21, align 4, !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond22, !dbg !166

for.cond22:                                       ; preds = %for.inc27, %if.then19
  %10 = load i32, i32* %i, align 4, !dbg !167
  %cmp23 = icmp slt i32 %10, 10, !dbg !169
  br i1 %cmp23, label %for.body24, label %for.end29, !dbg !170

for.body24:                                       ; preds = %for.cond22
  %11 = load i32*, i32** %buffer, align 8, !dbg !171
  %12 = load i32, i32* %i, align 4, !dbg !173
  %idxprom25 = sext i32 %12 to i64, !dbg !171
  %arrayidx26 = getelementptr inbounds i32, i32* %11, i64 %idxprom25, !dbg !171
  %13 = load i32, i32* %arrayidx26, align 4, !dbg !171
  call void @printIntLine(i32 %13), !dbg !174
  br label %for.inc27, !dbg !175

for.inc27:                                        ; preds = %for.body24
  %14 = load i32, i32* %i, align 4, !dbg !176
  %inc28 = add nsw i32 %14, 1, !dbg !176
  store i32 %inc28, i32* %i, align 4, !dbg !176
  br label %for.cond22, !dbg !177, !llvm.loop !178

for.end29:                                        ; preds = %for.cond22
  br label %if.end30, !dbg !180

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !181
  br label %if.end30

if.end30:                                         ; preds = %if.else, %for.end29
  %15 = load i32*, i32** %buffer, align 8, !dbg !183
  %16 = bitcast i32* %15 to i8*, !dbg !183
  call void @free(i8* %16) #5, !dbg !184
  br label %while.end31, !dbg !185

while.end31:                                      ; preds = %if.end30
  ret void, !dbg !186
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !187 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 -1, i32* %data, align 4, !dbg !190
  br label %while.body, !dbg !191

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !192
  br label %while.end, !dbg !194

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !195

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !196, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !200, metadata !DIExpression()), !dbg !201
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !202
  %0 = bitcast i8* %call to i32*, !dbg !203
  store i32* %0, i32** %buffer, align 8, !dbg !201
  %1 = load i32*, i32** %buffer, align 8, !dbg !204
  %cmp = icmp eq i32* %1, null, !dbg !206
  br i1 %cmp, label %if.then, label %if.end, !dbg !207

if.then:                                          ; preds = %while.body1
  call void @exit(i32 -1) #6, !dbg !208
  unreachable, !dbg !208

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !210
  br label %for.cond, !dbg !212

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !213
  %cmp2 = icmp slt i32 %2, 10, !dbg !215
  br i1 %cmp2, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !217
  %4 = load i32, i32* %i, align 4, !dbg !219
  %idxprom = sext i32 %4 to i64, !dbg !217
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !217
  store i32 0, i32* %arrayidx, align 4, !dbg !220
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !222
  %inc = add nsw i32 %5, 1, !dbg !222
  store i32 %inc, i32* %i, align 4, !dbg !222
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !226
  %cmp3 = icmp sge i32 %6, 0, !dbg !228
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !229

if.then4:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !230
  %8 = load i32, i32* %data, align 4, !dbg !232
  %idxprom5 = sext i32 %8 to i64, !dbg !230
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %idxprom5, !dbg !230
  store i32 1, i32* %arrayidx6, align 4, !dbg !233
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond7, !dbg !236

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %9 = load i32, i32* %i, align 4, !dbg !237
  %cmp8 = icmp slt i32 %9, 10, !dbg !239
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !240

for.body9:                                        ; preds = %for.cond7
  %10 = load i32*, i32** %buffer, align 8, !dbg !241
  %11 = load i32, i32* %i, align 4, !dbg !243
  %idxprom10 = sext i32 %11 to i64, !dbg !241
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !241
  %12 = load i32, i32* %arrayidx11, align 4, !dbg !241
  call void @printIntLine(i32 %12), !dbg !244
  br label %for.inc12, !dbg !245

for.inc12:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !dbg !246
  %inc13 = add nsw i32 %13, 1, !dbg !246
  store i32 %inc13, i32* %i, align 4, !dbg !246
  br label %for.cond7, !dbg !247, !llvm.loop !248

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !250

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !251
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %14 = load i32*, i32** %buffer, align 8, !dbg !253
  %15 = bitcast i32* %14 to i8*, !dbg !253
  call void @free(i8* %15) #5, !dbg !254
  br label %while.end16, !dbg !255

while.end16:                                      ; preds = %if.end15
  ret void, !dbg !256
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILocation(line: 30, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!24 = !DILocation(line: 30, column: 14, scope: !23)
!25 = !DILocation(line: 31, column: 9, scope: !23)
!26 = !DILocation(line: 33, column: 5, scope: !14)
!27 = !DILocalVariable(name: "i", scope: !28, file: !15, line: 36, type: !4)
!28 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 9)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!30 = !DILocation(line: 36, column: 17, scope: !28)
!31 = !DILocalVariable(name: "buffer", scope: !28, file: !15, line: 37, type: !6)
!32 = !DILocation(line: 37, column: 19, scope: !28)
!33 = !DILocation(line: 37, column: 35, scope: !28)
!34 = !DILocation(line: 37, column: 28, scope: !28)
!35 = !DILocation(line: 38, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !15, line: 38, column: 17)
!37 = !DILocation(line: 38, column: 24, scope: !36)
!38 = !DILocation(line: 38, column: 17, scope: !28)
!39 = !DILocation(line: 38, column: 34, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 38, column: 33)
!41 = !DILocation(line: 40, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !28, file: !15, line: 40, column: 13)
!43 = !DILocation(line: 40, column: 18, scope: !42)
!44 = !DILocation(line: 40, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !15, line: 40, column: 13)
!46 = !DILocation(line: 40, column: 27, scope: !45)
!47 = !DILocation(line: 40, column: 13, scope: !42)
!48 = !DILocation(line: 42, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !15, line: 41, column: 13)
!50 = !DILocation(line: 42, column: 24, scope: !49)
!51 = !DILocation(line: 42, column: 27, scope: !49)
!52 = !DILocation(line: 43, column: 13, scope: !49)
!53 = !DILocation(line: 40, column: 34, scope: !45)
!54 = !DILocation(line: 40, column: 13, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 43, column: 13, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 46, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !28, file: !15, line: 46, column: 17)
!60 = !DILocation(line: 46, column: 22, scope: !59)
!61 = !DILocation(line: 46, column: 17, scope: !28)
!62 = !DILocation(line: 48, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !15, line: 47, column: 13)
!64 = !DILocation(line: 48, column: 24, scope: !63)
!65 = !DILocation(line: 48, column: 30, scope: !63)
!66 = !DILocation(line: 50, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 50, column: 17)
!68 = !DILocation(line: 50, column: 21, scope: !67)
!69 = !DILocation(line: 50, column: 28, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !15, line: 50, column: 17)
!71 = !DILocation(line: 50, column: 30, scope: !70)
!72 = !DILocation(line: 50, column: 17, scope: !67)
!73 = !DILocation(line: 52, column: 34, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 51, column: 17)
!75 = !DILocation(line: 52, column: 41, scope: !74)
!76 = !DILocation(line: 52, column: 21, scope: !74)
!77 = !DILocation(line: 53, column: 17, scope: !74)
!78 = !DILocation(line: 50, column: 37, scope: !70)
!79 = !DILocation(line: 50, column: 17, scope: !70)
!80 = distinct !{!80, !72, !81, !57}
!81 = !DILocation(line: 53, column: 17, scope: !67)
!82 = !DILocation(line: 54, column: 13, scope: !63)
!83 = !DILocation(line: 57, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !59, file: !15, line: 56, column: 13)
!85 = !DILocation(line: 59, column: 18, scope: !28)
!86 = !DILocation(line: 59, column: 13, scope: !28)
!87 = !DILocation(line: 61, column: 9, scope: !29)
!88 = !DILocation(line: 63, column: 1, scope: !14)
!89 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_16_good", scope: !15, file: !15, line: 157, type: !16, scopeLine: 158, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 159, column: 5, scope: !89)
!91 = !DILocation(line: 160, column: 5, scope: !89)
!92 = !DILocation(line: 161, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 172, type: !94, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!4, !4, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !15, line: 172, type: !4)
!100 = !DILocation(line: 172, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !15, line: 172, type: !96)
!102 = !DILocation(line: 172, column: 27, scope: !93)
!103 = !DILocation(line: 175, column: 22, scope: !93)
!104 = !DILocation(line: 175, column: 12, scope: !93)
!105 = !DILocation(line: 175, column: 5, scope: !93)
!106 = !DILocation(line: 177, column: 5, scope: !93)
!107 = !DILocation(line: 178, column: 5, scope: !93)
!108 = !DILocation(line: 179, column: 5, scope: !93)
!109 = !DILocation(line: 182, column: 5, scope: !93)
!110 = !DILocation(line: 183, column: 5, scope: !93)
!111 = !DILocation(line: 184, column: 5, scope: !93)
!112 = !DILocation(line: 186, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 72, type: !4)
!115 = !DILocation(line: 72, column: 9, scope: !113)
!116 = !DILocation(line: 74, column: 10, scope: !113)
!117 = !DILocation(line: 75, column: 5, scope: !113)
!118 = !DILocation(line: 78, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !15, line: 76, column: 5)
!120 = !DILocation(line: 78, column: 14, scope: !119)
!121 = !DILocation(line: 79, column: 9, scope: !119)
!122 = !DILocation(line: 81, column: 5, scope: !113)
!123 = !DILocalVariable(name: "i", scope: !124, file: !15, line: 84, type: !4)
!124 = distinct !DILexicalBlock(scope: !125, file: !15, line: 83, column: 9)
!125 = distinct !DILexicalBlock(scope: !113, file: !15, line: 82, column: 5)
!126 = !DILocation(line: 84, column: 17, scope: !124)
!127 = !DILocalVariable(name: "buffer", scope: !124, file: !15, line: 85, type: !6)
!128 = !DILocation(line: 85, column: 19, scope: !124)
!129 = !DILocation(line: 85, column: 35, scope: !124)
!130 = !DILocation(line: 85, column: 28, scope: !124)
!131 = !DILocation(line: 86, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !124, file: !15, line: 86, column: 17)
!133 = !DILocation(line: 86, column: 24, scope: !132)
!134 = !DILocation(line: 86, column: 17, scope: !124)
!135 = !DILocation(line: 86, column: 34, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 86, column: 33)
!137 = !DILocation(line: 88, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !124, file: !15, line: 88, column: 13)
!139 = !DILocation(line: 88, column: 18, scope: !138)
!140 = !DILocation(line: 88, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !15, line: 88, column: 13)
!142 = !DILocation(line: 88, column: 27, scope: !141)
!143 = !DILocation(line: 88, column: 13, scope: !138)
!144 = !DILocation(line: 90, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !15, line: 89, column: 13)
!146 = !DILocation(line: 90, column: 24, scope: !145)
!147 = !DILocation(line: 90, column: 27, scope: !145)
!148 = !DILocation(line: 91, column: 13, scope: !145)
!149 = !DILocation(line: 88, column: 34, scope: !141)
!150 = !DILocation(line: 88, column: 13, scope: !141)
!151 = distinct !{!151, !143, !152, !57}
!152 = !DILocation(line: 91, column: 13, scope: !138)
!153 = !DILocation(line: 93, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !124, file: !15, line: 93, column: 17)
!155 = !DILocation(line: 93, column: 22, scope: !154)
!156 = !DILocation(line: 93, column: 27, scope: !154)
!157 = !DILocation(line: 93, column: 30, scope: !154)
!158 = !DILocation(line: 93, column: 35, scope: !154)
!159 = !DILocation(line: 93, column: 17, scope: !124)
!160 = !DILocation(line: 95, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !15, line: 94, column: 13)
!162 = !DILocation(line: 95, column: 24, scope: !161)
!163 = !DILocation(line: 95, column: 30, scope: !161)
!164 = !DILocation(line: 97, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 97, column: 17)
!166 = !DILocation(line: 97, column: 21, scope: !165)
!167 = !DILocation(line: 97, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !15, line: 97, column: 17)
!169 = !DILocation(line: 97, column: 30, scope: !168)
!170 = !DILocation(line: 97, column: 17, scope: !165)
!171 = !DILocation(line: 99, column: 34, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !15, line: 98, column: 17)
!173 = !DILocation(line: 99, column: 41, scope: !172)
!174 = !DILocation(line: 99, column: 21, scope: !172)
!175 = !DILocation(line: 100, column: 17, scope: !172)
!176 = !DILocation(line: 97, column: 37, scope: !168)
!177 = !DILocation(line: 97, column: 17, scope: !168)
!178 = distinct !{!178, !170, !179, !57}
!179 = !DILocation(line: 100, column: 17, scope: !165)
!180 = !DILocation(line: 101, column: 13, scope: !161)
!181 = !DILocation(line: 104, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !154, file: !15, line: 103, column: 13)
!183 = !DILocation(line: 106, column: 18, scope: !124)
!184 = !DILocation(line: 106, column: 13, scope: !124)
!185 = !DILocation(line: 108, column: 9, scope: !125)
!186 = !DILocation(line: 110, column: 1, scope: !113)
!187 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 113, type: !16, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!188 = !DILocalVariable(name: "data", scope: !187, file: !15, line: 115, type: !4)
!189 = !DILocation(line: 115, column: 9, scope: !187)
!190 = !DILocation(line: 117, column: 10, scope: !187)
!191 = !DILocation(line: 118, column: 5, scope: !187)
!192 = !DILocation(line: 122, column: 14, scope: !193)
!193 = distinct !DILexicalBlock(scope: !187, file: !15, line: 119, column: 5)
!194 = !DILocation(line: 123, column: 9, scope: !193)
!195 = !DILocation(line: 125, column: 5, scope: !187)
!196 = !DILocalVariable(name: "i", scope: !197, file: !15, line: 128, type: !4)
!197 = distinct !DILexicalBlock(scope: !198, file: !15, line: 127, column: 9)
!198 = distinct !DILexicalBlock(scope: !187, file: !15, line: 126, column: 5)
!199 = !DILocation(line: 128, column: 17, scope: !197)
!200 = !DILocalVariable(name: "buffer", scope: !197, file: !15, line: 129, type: !6)
!201 = !DILocation(line: 129, column: 19, scope: !197)
!202 = !DILocation(line: 129, column: 35, scope: !197)
!203 = !DILocation(line: 129, column: 28, scope: !197)
!204 = !DILocation(line: 130, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !197, file: !15, line: 130, column: 17)
!206 = !DILocation(line: 130, column: 24, scope: !205)
!207 = !DILocation(line: 130, column: 17, scope: !197)
!208 = !DILocation(line: 130, column: 34, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !15, line: 130, column: 33)
!210 = !DILocation(line: 132, column: 20, scope: !211)
!211 = distinct !DILexicalBlock(scope: !197, file: !15, line: 132, column: 13)
!212 = !DILocation(line: 132, column: 18, scope: !211)
!213 = !DILocation(line: 132, column: 25, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !15, line: 132, column: 13)
!215 = !DILocation(line: 132, column: 27, scope: !214)
!216 = !DILocation(line: 132, column: 13, scope: !211)
!217 = !DILocation(line: 134, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !15, line: 133, column: 13)
!219 = !DILocation(line: 134, column: 24, scope: !218)
!220 = !DILocation(line: 134, column: 27, scope: !218)
!221 = !DILocation(line: 135, column: 13, scope: !218)
!222 = !DILocation(line: 132, column: 34, scope: !214)
!223 = !DILocation(line: 132, column: 13, scope: !214)
!224 = distinct !{!224, !216, !225, !57}
!225 = !DILocation(line: 135, column: 13, scope: !211)
!226 = !DILocation(line: 138, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !197, file: !15, line: 138, column: 17)
!228 = !DILocation(line: 138, column: 22, scope: !227)
!229 = !DILocation(line: 138, column: 17, scope: !197)
!230 = !DILocation(line: 140, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !15, line: 139, column: 13)
!232 = !DILocation(line: 140, column: 24, scope: !231)
!233 = !DILocation(line: 140, column: 30, scope: !231)
!234 = !DILocation(line: 142, column: 23, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !15, line: 142, column: 17)
!236 = !DILocation(line: 142, column: 21, scope: !235)
!237 = !DILocation(line: 142, column: 28, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !15, line: 142, column: 17)
!239 = !DILocation(line: 142, column: 30, scope: !238)
!240 = !DILocation(line: 142, column: 17, scope: !235)
!241 = !DILocation(line: 144, column: 34, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !15, line: 143, column: 17)
!243 = !DILocation(line: 144, column: 41, scope: !242)
!244 = !DILocation(line: 144, column: 21, scope: !242)
!245 = !DILocation(line: 145, column: 17, scope: !242)
!246 = !DILocation(line: 142, column: 37, scope: !238)
!247 = !DILocation(line: 142, column: 17, scope: !238)
!248 = distinct !{!248, !240, !249, !57}
!249 = !DILocation(line: 145, column: 17, scope: !235)
!250 = !DILocation(line: 146, column: 13, scope: !231)
!251 = !DILocation(line: 149, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !227, file: !15, line: 148, column: 13)
!253 = !DILocation(line: 151, column: 18, scope: !197)
!254 = !DILocation(line: 151, column: 13, scope: !197)
!255 = !DILocation(line: 153, column: 9, scope: !198)
!256 = !DILocation(line: 155, column: 1, scope: !187)
