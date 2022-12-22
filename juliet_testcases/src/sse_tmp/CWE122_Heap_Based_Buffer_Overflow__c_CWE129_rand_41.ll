; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
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
  %0 = load i32, i32* %data, align 4, !dbg !23
  call void @badSink(i32 %0), !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !26 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !34, metadata !DIExpression()), !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !36
  %0 = bitcast i8* %call to i32*, !dbg !37
  store i32* %0, i32** %buffer, align 8, !dbg !35
  %1 = load i32*, i32** %buffer, align 8, !dbg !38
  %cmp = icmp eq i32* %1, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !47
  %cmp1 = icmp slt i32 %2, 10, !dbg !49
  br i1 %cmp1, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !51
  %4 = load i32, i32* %i, align 4, !dbg !53
  %idxprom = sext i32 %4 to i64, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !56
  %inc = add nsw i32 %5, 1, !dbg !56
  store i32 %inc, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !61
  %cmp2 = icmp sge i32 %6, 0, !dbg !63
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !64

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !65
  %8 = load i32, i32* %data.addr, align 4, !dbg !67
  %idxprom4 = sext i32 %8 to i64, !dbg !65
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !65
  store i32 1, i32* %arrayidx5, align 4, !dbg !68
  store i32 0, i32* %i, align 4, !dbg !69
  br label %for.cond6, !dbg !71

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !72
  %cmp7 = icmp slt i32 %9, 10, !dbg !74
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !75

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !76
  %11 = load i32, i32* %i, align 4, !dbg !78
  %idxprom9 = sext i32 %11 to i64, !dbg !76
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !76
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !76
  call void @printIntLine(i32 %12), !dbg !79
  br label %for.inc11, !dbg !80

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !81
  %inc12 = add nsw i32 %13, 1, !dbg !81
  store i32 %inc12, i32* %i, align 4, !dbg !81
  br label %for.cond6, !dbg !82, !llvm.loop !83

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !85

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !88
  %15 = bitcast i32* %14 to i8*, !dbg !88
  call void @free(i8* %15) #5, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41_good() #0 !dbg !91 {
entry:
  call void @goodB2G(), !dbg !92
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #5, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #5, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
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
define internal void @goodB2G() #0 !dbg !115 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %data, align 4, !dbg !118
  %call = call i32 @rand() #5, !dbg !119
  %and = and i32 %call, 1, !dbg !119
  %tobool = icmp ne i32 %and, 0, !dbg !119
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !119

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !119
  %shl = shl i32 %call1, 30, !dbg !119
  %call2 = call i32 @rand() #5, !dbg !119
  %shl3 = shl i32 %call2, 15, !dbg !119
  %xor = xor i32 %shl, %shl3, !dbg !119
  %call4 = call i32 @rand() #5, !dbg !119
  %xor5 = xor i32 %xor, %call4, !dbg !119
  br label %cond.end, !dbg !119

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !119
  %shl7 = shl i32 %call6, 30, !dbg !119
  %call8 = call i32 @rand() #5, !dbg !119
  %shl9 = shl i32 %call8, 15, !dbg !119
  %xor10 = xor i32 %shl7, %shl9, !dbg !119
  %call11 = call i32 @rand() #5, !dbg !119
  %xor12 = xor i32 %xor10, %call11, !dbg !119
  %sub = sub i32 0, %xor12, !dbg !119
  %sub13 = sub i32 %sub, 1, !dbg !119
  br label %cond.end, !dbg !119

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !119
  store i32 %cond, i32* %data, align 4, !dbg !120
  %0 = load i32, i32* %data, align 4, !dbg !121
  call void @goodB2GSink(i32 %0), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !124 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !130, metadata !DIExpression()), !dbg !131
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !132
  %0 = bitcast i8* %call to i32*, !dbg !133
  store i32* %0, i32** %buffer, align 8, !dbg !131
  %1 = load i32*, i32** %buffer, align 8, !dbg !134
  %cmp = icmp eq i32* %1, null, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !143
  %cmp1 = icmp slt i32 %2, 10, !dbg !145
  br i1 %cmp1, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !147
  %4 = load i32, i32* %i, align 4, !dbg !149
  %idxprom = sext i32 %4 to i64, !dbg !147
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !147
  store i32 0, i32* %arrayidx, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !152
  %inc = add nsw i32 %5, 1, !dbg !152
  store i32 %inc, i32* %i, align 4, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !156
  %cmp2 = icmp sge i32 %6, 0, !dbg !158
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !159

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !160
  %cmp3 = icmp slt i32 %7, 10, !dbg !161
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !162

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !163
  %9 = load i32, i32* %data.addr, align 4, !dbg !165
  %idxprom5 = sext i32 %9 to i64, !dbg !163
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !163
  store i32 1, i32* %arrayidx6, align 4, !dbg !166
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond7, !dbg !169

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !170
  %cmp8 = icmp slt i32 %10, 10, !dbg !172
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !173

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !174
  %12 = load i32, i32* %i, align 4, !dbg !176
  %idxprom10 = sext i32 %12 to i64, !dbg !174
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !174
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !174
  call void @printIntLine(i32 %13), !dbg !177
  br label %for.inc12, !dbg !178

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !179
  %inc13 = add nsw i32 %14, 1, !dbg !179
  store i32 %inc13, i32* %i, align 4, !dbg !179
  br label %for.cond7, !dbg !180, !llvm.loop !181

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !183

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !184
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !186
  %16 = bitcast i32* %15 to i8*, !dbg !186
  call void @free(i8* %16) #5, !dbg !187
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !189 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !190, metadata !DIExpression()), !dbg !191
  store i32 -1, i32* %data, align 4, !dbg !192
  store i32 7, i32* %data, align 4, !dbg !193
  %0 = load i32, i32* %data, align 4, !dbg !194
  call void @goodG2BSink(i32 %0), !dbg !195
  ret void, !dbg !196
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !197 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i32* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !203, metadata !DIExpression()), !dbg !204
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !205
  %0 = bitcast i8* %call to i32*, !dbg !206
  store i32* %0, i32** %buffer, align 8, !dbg !204
  %1 = load i32*, i32** %buffer, align 8, !dbg !207
  %cmp = icmp eq i32* %1, null, !dbg !209
  br i1 %cmp, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !211
  unreachable, !dbg !211

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !216
  %cmp1 = icmp slt i32 %2, 10, !dbg !218
  br i1 %cmp1, label %for.body, label %for.end, !dbg !219

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !220
  %4 = load i32, i32* %i, align 4, !dbg !222
  %idxprom = sext i32 %4 to i64, !dbg !220
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !220
  store i32 0, i32* %arrayidx, align 4, !dbg !223
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !225
  %inc = add nsw i32 %5, 1, !dbg !225
  store i32 %inc, i32* %i, align 4, !dbg !225
  br label %for.cond, !dbg !226, !llvm.loop !227

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !229
  %cmp2 = icmp sge i32 %6, 0, !dbg !231
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !232

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !233
  %8 = load i32, i32* %data.addr, align 4, !dbg !235
  %idxprom4 = sext i32 %8 to i64, !dbg !233
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !233
  store i32 1, i32* %arrayidx5, align 4, !dbg !236
  store i32 0, i32* %i, align 4, !dbg !237
  br label %for.cond6, !dbg !239

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !240
  %cmp7 = icmp slt i32 %9, 10, !dbg !242
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !243

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !244
  %11 = load i32, i32* %i, align 4, !dbg !246
  %idxprom9 = sext i32 %11 to i64, !dbg !244
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !244
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !244
  call void @printIntLine(i32 %12), !dbg !247
  br label %for.inc11, !dbg !248

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !249
  %inc12 = add nsw i32 %13, 1, !dbg !249
  store i32 %inc12, i32* %i, align 4, !dbg !249
  br label %for.cond6, !dbg !250, !llvm.loop !251

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !253

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !254
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !256
  %15 = bitcast i32* %14 to i8*, !dbg !256
  call void @free(i8* %15) #5, !dbg !257
  ret void, !dbg !258
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41_bad", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 54, type: !4)
!19 = !DILocation(line: 54, column: 9, scope: !14)
!20 = !DILocation(line: 56, column: 10, scope: !14)
!21 = !DILocation(line: 58, column: 12, scope: !14)
!22 = !DILocation(line: 58, column: 10, scope: !14)
!23 = !DILocation(line: 59, column: 13, scope: !14)
!24 = !DILocation(line: 59, column: 5, scope: !14)
!25 = !DILocation(line: 60, column: 1, scope: !14)
!26 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 22, type: !27, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !4}
!29 = !DILocalVariable(name: "data", arg: 1, scope: !26, file: !15, line: 22, type: !4)
!30 = !DILocation(line: 22, column: 25, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 25, type: !4)
!32 = distinct !DILexicalBlock(scope: !26, file: !15, line: 24, column: 5)
!33 = !DILocation(line: 25, column: 13, scope: !32)
!34 = !DILocalVariable(name: "buffer", scope: !32, file: !15, line: 26, type: !6)
!35 = !DILocation(line: 26, column: 15, scope: !32)
!36 = !DILocation(line: 26, column: 31, scope: !32)
!37 = !DILocation(line: 26, column: 24, scope: !32)
!38 = !DILocation(line: 27, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !15, line: 27, column: 13)
!40 = !DILocation(line: 27, column: 20, scope: !39)
!41 = !DILocation(line: 27, column: 13, scope: !32)
!42 = !DILocation(line: 27, column: 30, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 27, column: 29)
!44 = !DILocation(line: 29, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !32, file: !15, line: 29, column: 9)
!46 = !DILocation(line: 29, column: 14, scope: !45)
!47 = !DILocation(line: 29, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !15, line: 29, column: 9)
!49 = !DILocation(line: 29, column: 23, scope: !48)
!50 = !DILocation(line: 29, column: 9, scope: !45)
!51 = !DILocation(line: 31, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 30, column: 9)
!53 = !DILocation(line: 31, column: 20, scope: !52)
!54 = !DILocation(line: 31, column: 23, scope: !52)
!55 = !DILocation(line: 32, column: 9, scope: !52)
!56 = !DILocation(line: 29, column: 30, scope: !48)
!57 = !DILocation(line: 29, column: 9, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 32, column: 9, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 35, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !32, file: !15, line: 35, column: 13)
!63 = !DILocation(line: 35, column: 18, scope: !62)
!64 = !DILocation(line: 35, column: 13, scope: !32)
!65 = !DILocation(line: 37, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 36, column: 9)
!67 = !DILocation(line: 37, column: 20, scope: !66)
!68 = !DILocation(line: 37, column: 26, scope: !66)
!69 = !DILocation(line: 39, column: 19, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 39, column: 13)
!71 = !DILocation(line: 39, column: 17, scope: !70)
!72 = !DILocation(line: 39, column: 24, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !15, line: 39, column: 13)
!74 = !DILocation(line: 39, column: 26, scope: !73)
!75 = !DILocation(line: 39, column: 13, scope: !70)
!76 = !DILocation(line: 41, column: 30, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 40, column: 13)
!78 = !DILocation(line: 41, column: 37, scope: !77)
!79 = !DILocation(line: 41, column: 17, scope: !77)
!80 = !DILocation(line: 42, column: 13, scope: !77)
!81 = !DILocation(line: 39, column: 33, scope: !73)
!82 = !DILocation(line: 39, column: 13, scope: !73)
!83 = distinct !{!83, !75, !84, !60}
!84 = !DILocation(line: 42, column: 13, scope: !70)
!85 = !DILocation(line: 43, column: 9, scope: !66)
!86 = !DILocation(line: 46, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !62, file: !15, line: 45, column: 9)
!88 = !DILocation(line: 48, column: 14, scope: !32)
!89 = !DILocation(line: 48, column: 9, scope: !32)
!90 = !DILocation(line: 50, column: 1, scope: !26)
!91 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_41_good", scope: !15, file: !15, line: 148, type: !16, scopeLine: 149, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 150, column: 5, scope: !91)
!93 = !DILocation(line: 151, column: 5, scope: !91)
!94 = !DILocation(line: 152, column: 1, scope: !91)
!95 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 163, type: !96, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!4, !4, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !15, line: 163, type: !4)
!102 = !DILocation(line: 163, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !15, line: 163, type: !98)
!104 = !DILocation(line: 163, column: 27, scope: !95)
!105 = !DILocation(line: 166, column: 22, scope: !95)
!106 = !DILocation(line: 166, column: 12, scope: !95)
!107 = !DILocation(line: 166, column: 5, scope: !95)
!108 = !DILocation(line: 168, column: 5, scope: !95)
!109 = !DILocation(line: 169, column: 5, scope: !95)
!110 = !DILocation(line: 170, column: 5, scope: !95)
!111 = !DILocation(line: 173, column: 5, scope: !95)
!112 = !DILocation(line: 174, column: 5, scope: !95)
!113 = !DILocation(line: 175, column: 5, scope: !95)
!114 = !DILocation(line: 177, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 138, type: !16, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 140, type: !4)
!117 = !DILocation(line: 140, column: 9, scope: !115)
!118 = !DILocation(line: 142, column: 10, scope: !115)
!119 = !DILocation(line: 144, column: 12, scope: !115)
!120 = !DILocation(line: 144, column: 10, scope: !115)
!121 = !DILocation(line: 145, column: 17, scope: !115)
!122 = !DILocation(line: 145, column: 5, scope: !115)
!123 = !DILocation(line: 146, column: 1, scope: !115)
!124 = distinct !DISubprogram(name: "goodB2GSink", scope: !15, file: !15, line: 109, type: !27, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", arg: 1, scope: !124, file: !15, line: 109, type: !4)
!126 = !DILocation(line: 109, column: 29, scope: !124)
!127 = !DILocalVariable(name: "i", scope: !128, file: !15, line: 112, type: !4)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 111, column: 5)
!129 = !DILocation(line: 112, column: 13, scope: !128)
!130 = !DILocalVariable(name: "buffer", scope: !128, file: !15, line: 113, type: !6)
!131 = !DILocation(line: 113, column: 15, scope: !128)
!132 = !DILocation(line: 113, column: 31, scope: !128)
!133 = !DILocation(line: 113, column: 24, scope: !128)
!134 = !DILocation(line: 114, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !128, file: !15, line: 114, column: 13)
!136 = !DILocation(line: 114, column: 20, scope: !135)
!137 = !DILocation(line: 114, column: 13, scope: !128)
!138 = !DILocation(line: 114, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !15, line: 114, column: 29)
!140 = !DILocation(line: 116, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !128, file: !15, line: 116, column: 9)
!142 = !DILocation(line: 116, column: 14, scope: !141)
!143 = !DILocation(line: 116, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !15, line: 116, column: 9)
!145 = !DILocation(line: 116, column: 23, scope: !144)
!146 = !DILocation(line: 116, column: 9, scope: !141)
!147 = !DILocation(line: 118, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !15, line: 117, column: 9)
!149 = !DILocation(line: 118, column: 20, scope: !148)
!150 = !DILocation(line: 118, column: 23, scope: !148)
!151 = !DILocation(line: 119, column: 9, scope: !148)
!152 = !DILocation(line: 116, column: 30, scope: !144)
!153 = !DILocation(line: 116, column: 9, scope: !144)
!154 = distinct !{!154, !146, !155, !60}
!155 = !DILocation(line: 119, column: 9, scope: !141)
!156 = !DILocation(line: 121, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !128, file: !15, line: 121, column: 13)
!158 = !DILocation(line: 121, column: 18, scope: !157)
!159 = !DILocation(line: 121, column: 23, scope: !157)
!160 = !DILocation(line: 121, column: 26, scope: !157)
!161 = !DILocation(line: 121, column: 31, scope: !157)
!162 = !DILocation(line: 121, column: 13, scope: !128)
!163 = !DILocation(line: 123, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !15, line: 122, column: 9)
!165 = !DILocation(line: 123, column: 20, scope: !164)
!166 = !DILocation(line: 123, column: 26, scope: !164)
!167 = !DILocation(line: 125, column: 19, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 125, column: 13)
!169 = !DILocation(line: 125, column: 17, scope: !168)
!170 = !DILocation(line: 125, column: 24, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !15, line: 125, column: 13)
!172 = !DILocation(line: 125, column: 26, scope: !171)
!173 = !DILocation(line: 125, column: 13, scope: !168)
!174 = !DILocation(line: 127, column: 30, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !15, line: 126, column: 13)
!176 = !DILocation(line: 127, column: 37, scope: !175)
!177 = !DILocation(line: 127, column: 17, scope: !175)
!178 = !DILocation(line: 128, column: 13, scope: !175)
!179 = !DILocation(line: 125, column: 33, scope: !171)
!180 = !DILocation(line: 125, column: 13, scope: !171)
!181 = distinct !{!181, !173, !182, !60}
!182 = !DILocation(line: 128, column: 13, scope: !168)
!183 = !DILocation(line: 129, column: 9, scope: !164)
!184 = !DILocation(line: 132, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !157, file: !15, line: 131, column: 9)
!186 = !DILocation(line: 134, column: 14, scope: !128)
!187 = !DILocation(line: 134, column: 9, scope: !128)
!188 = !DILocation(line: 136, column: 1, scope: !124)
!189 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 97, type: !16, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!190 = !DILocalVariable(name: "data", scope: !189, file: !15, line: 99, type: !4)
!191 = !DILocation(line: 99, column: 9, scope: !189)
!192 = !DILocation(line: 101, column: 10, scope: !189)
!193 = !DILocation(line: 104, column: 10, scope: !189)
!194 = !DILocation(line: 105, column: 17, scope: !189)
!195 = !DILocation(line: 105, column: 5, scope: !189)
!196 = !DILocation(line: 106, column: 1, scope: !189)
!197 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 67, type: !27, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!198 = !DILocalVariable(name: "data", arg: 1, scope: !197, file: !15, line: 67, type: !4)
!199 = !DILocation(line: 67, column: 29, scope: !197)
!200 = !DILocalVariable(name: "i", scope: !201, file: !15, line: 70, type: !4)
!201 = distinct !DILexicalBlock(scope: !197, file: !15, line: 69, column: 5)
!202 = !DILocation(line: 70, column: 13, scope: !201)
!203 = !DILocalVariable(name: "buffer", scope: !201, file: !15, line: 71, type: !6)
!204 = !DILocation(line: 71, column: 15, scope: !201)
!205 = !DILocation(line: 71, column: 31, scope: !201)
!206 = !DILocation(line: 71, column: 24, scope: !201)
!207 = !DILocation(line: 72, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !201, file: !15, line: 72, column: 13)
!209 = !DILocation(line: 72, column: 20, scope: !208)
!210 = !DILocation(line: 72, column: 13, scope: !201)
!211 = !DILocation(line: 72, column: 30, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !15, line: 72, column: 29)
!213 = !DILocation(line: 74, column: 16, scope: !214)
!214 = distinct !DILexicalBlock(scope: !201, file: !15, line: 74, column: 9)
!215 = !DILocation(line: 74, column: 14, scope: !214)
!216 = !DILocation(line: 74, column: 21, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !15, line: 74, column: 9)
!218 = !DILocation(line: 74, column: 23, scope: !217)
!219 = !DILocation(line: 74, column: 9, scope: !214)
!220 = !DILocation(line: 76, column: 13, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !15, line: 75, column: 9)
!222 = !DILocation(line: 76, column: 20, scope: !221)
!223 = !DILocation(line: 76, column: 23, scope: !221)
!224 = !DILocation(line: 77, column: 9, scope: !221)
!225 = !DILocation(line: 74, column: 30, scope: !217)
!226 = !DILocation(line: 74, column: 9, scope: !217)
!227 = distinct !{!227, !219, !228, !60}
!228 = !DILocation(line: 77, column: 9, scope: !214)
!229 = !DILocation(line: 80, column: 13, scope: !230)
!230 = distinct !DILexicalBlock(scope: !201, file: !15, line: 80, column: 13)
!231 = !DILocation(line: 80, column: 18, scope: !230)
!232 = !DILocation(line: 80, column: 13, scope: !201)
!233 = !DILocation(line: 82, column: 13, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !15, line: 81, column: 9)
!235 = !DILocation(line: 82, column: 20, scope: !234)
!236 = !DILocation(line: 82, column: 26, scope: !234)
!237 = !DILocation(line: 84, column: 19, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !15, line: 84, column: 13)
!239 = !DILocation(line: 84, column: 17, scope: !238)
!240 = !DILocation(line: 84, column: 24, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !15, line: 84, column: 13)
!242 = !DILocation(line: 84, column: 26, scope: !241)
!243 = !DILocation(line: 84, column: 13, scope: !238)
!244 = !DILocation(line: 86, column: 30, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !15, line: 85, column: 13)
!246 = !DILocation(line: 86, column: 37, scope: !245)
!247 = !DILocation(line: 86, column: 17, scope: !245)
!248 = !DILocation(line: 87, column: 13, scope: !245)
!249 = !DILocation(line: 84, column: 33, scope: !241)
!250 = !DILocation(line: 84, column: 13, scope: !241)
!251 = distinct !{!251, !243, !252, !60}
!252 = !DILocation(line: 87, column: 13, scope: !238)
!253 = !DILocation(line: 88, column: 9, scope: !234)
!254 = !DILocation(line: 91, column: 13, scope: !255)
!255 = distinct !DILexicalBlock(scope: !230, file: !15, line: 90, column: 9)
!256 = !DILocation(line: 93, column: 14, scope: !201)
!257 = !DILocation(line: 93, column: 9, scope: !201)
!258 = !DILocation(line: 95, column: 1, scope: !197)
