; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  store i32 10, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !29, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !31
  %0 = bitcast i8* %call to i32*, !dbg !32
  store i32* %0, i32** %buffer, align 8, !dbg !30
  %1 = load i32*, i32** %buffer, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !42
  %cmp1 = icmp slt i32 %2, 10, !dbg !44
  br i1 %cmp1, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !46
  %4 = load i32, i32* %i, align 4, !dbg !48
  %idxprom = sext i32 %4 to i64, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %5, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !56
  %cmp2 = icmp sge i32 %6, 0, !dbg !58
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !59

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !60
  %8 = load i32, i32* %data, align 4, !dbg !62
  %idxprom4 = sext i32 %8 to i64, !dbg !60
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !60
  store i32 1, i32* %arrayidx5, align 4, !dbg !63
  store i32 0, i32* %i, align 4, !dbg !64
  br label %for.cond6, !dbg !66

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !67
  %cmp7 = icmp slt i32 %9, 10, !dbg !69
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !70

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !71
  %11 = load i32, i32* %i, align 4, !dbg !73
  %idxprom9 = sext i32 %11 to i64, !dbg !71
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !71
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !71
  call void @printIntLine(i32 %12), !dbg !74
  br label %for.inc11, !dbg !75

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !76
  %inc12 = add nsw i32 %13, 1, !dbg !76
  store i32 %inc12, i32* %i, align 4, !dbg !76
  br label %for.cond6, !dbg !77, !llvm.loop !78

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !80

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !81
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !83
  %15 = bitcast i32* %14 to i8*, !dbg !83
  call void @free(i8* %15) #5, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03_good() #0 !dbg !86 {
entry:
  call void @goodB2G1(), !dbg !87
  call void @goodB2G2(), !dbg !88
  call void @goodG2B1(), !dbg !89
  call void @goodG2B2(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #5, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #5, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !112 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 -1, i32* %data, align 4, !dbg !115
  store i32 10, i32* %data, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %i, metadata !119, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !124, metadata !DIExpression()), !dbg !125
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !126
  %0 = bitcast i8* %call to i32*, !dbg !127
  store i32* %0, i32** %buffer, align 8, !dbg !125
  %1 = load i32*, i32** %buffer, align 8, !dbg !128
  %cmp = icmp eq i32* %1, null, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !137
  %cmp1 = icmp slt i32 %2, 10, !dbg !139
  br i1 %cmp1, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !141
  %4 = load i32, i32* %i, align 4, !dbg !143
  %idxprom = sext i32 %4 to i64, !dbg !141
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !146
  %inc = add nsw i32 %5, 1, !dbg !146
  store i32 %inc, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !150
  %cmp2 = icmp sge i32 %6, 0, !dbg !152
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !153

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !154
  %cmp3 = icmp slt i32 %7, 10, !dbg !155
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !156

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !157
  %9 = load i32, i32* %data, align 4, !dbg !159
  %idxprom5 = sext i32 %9 to i64, !dbg !157
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !157
  store i32 1, i32* %arrayidx6, align 4, !dbg !160
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond7, !dbg !163

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !164
  %cmp8 = icmp slt i32 %10, 10, !dbg !166
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !167

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !168
  %12 = load i32, i32* %i, align 4, !dbg !170
  %idxprom10 = sext i32 %12 to i64, !dbg !168
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !168
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !168
  call void @printIntLine(i32 %13), !dbg !171
  br label %for.inc12, !dbg !172

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !173
  %inc13 = add nsw i32 %14, 1, !dbg !173
  store i32 %inc13, i32* %i, align 4, !dbg !173
  br label %for.cond7, !dbg !174, !llvm.loop !175

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !177

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !178
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !180
  %16 = bitcast i32* %15 to i8*, !dbg !180
  call void @free(i8* %16) #5, !dbg !181
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !183 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !184, metadata !DIExpression()), !dbg !185
  store i32 -1, i32* %data, align 4, !dbg !186
  store i32 10, i32* %data, align 4, !dbg !187
  call void @llvm.dbg.declare(metadata i32* %i, metadata !190, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !195, metadata !DIExpression()), !dbg !196
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !197
  %0 = bitcast i8* %call to i32*, !dbg !198
  store i32* %0, i32** %buffer, align 8, !dbg !196
  %1 = load i32*, i32** %buffer, align 8, !dbg !199
  %cmp = icmp eq i32* %1, null, !dbg !201
  br i1 %cmp, label %if.then, label %if.end, !dbg !202

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !203
  unreachable, !dbg !203

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !205
  br label %for.cond, !dbg !207

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !208
  %cmp1 = icmp slt i32 %2, 10, !dbg !210
  br i1 %cmp1, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !212
  %4 = load i32, i32* %i, align 4, !dbg !214
  %idxprom = sext i32 %4 to i64, !dbg !212
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !212
  store i32 0, i32* %arrayidx, align 4, !dbg !215
  br label %for.inc, !dbg !216

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !217
  %inc = add nsw i32 %5, 1, !dbg !217
  store i32 %inc, i32* %i, align 4, !dbg !217
  br label %for.cond, !dbg !218, !llvm.loop !219

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !221
  %cmp2 = icmp sge i32 %6, 0, !dbg !223
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !224

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !225
  %cmp3 = icmp slt i32 %7, 10, !dbg !226
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !227

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !228
  %9 = load i32, i32* %data, align 4, !dbg !230
  %idxprom5 = sext i32 %9 to i64, !dbg !228
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !228
  store i32 1, i32* %arrayidx6, align 4, !dbg !231
  store i32 0, i32* %i, align 4, !dbg !232
  br label %for.cond7, !dbg !234

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !235
  %cmp8 = icmp slt i32 %10, 10, !dbg !237
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !238

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !239
  %12 = load i32, i32* %i, align 4, !dbg !241
  %idxprom10 = sext i32 %12 to i64, !dbg !239
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !239
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !239
  call void @printIntLine(i32 %13), !dbg !242
  br label %for.inc12, !dbg !243

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !244
  %inc13 = add nsw i32 %14, 1, !dbg !244
  store i32 %inc13, i32* %i, align 4, !dbg !244
  br label %for.cond7, !dbg !245, !llvm.loop !246

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !248

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !249
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !251
  %16 = bitcast i32* %15 to i8*, !dbg !251
  call void @free(i8* %16) #5, !dbg !252
  ret void, !dbg !253
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !254 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !255, metadata !DIExpression()), !dbg !256
  store i32 -1, i32* %data, align 4, !dbg !257
  store i32 7, i32* %data, align 4, !dbg !258
  call void @llvm.dbg.declare(metadata i32* %i, metadata !261, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !266, metadata !DIExpression()), !dbg !267
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !268
  %0 = bitcast i8* %call to i32*, !dbg !269
  store i32* %0, i32** %buffer, align 8, !dbg !267
  %1 = load i32*, i32** %buffer, align 8, !dbg !270
  %cmp = icmp eq i32* %1, null, !dbg !272
  br i1 %cmp, label %if.then, label %if.end, !dbg !273

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !274
  unreachable, !dbg !274

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !276
  br label %for.cond, !dbg !278

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !279
  %cmp1 = icmp slt i32 %2, 10, !dbg !281
  br i1 %cmp1, label %for.body, label %for.end, !dbg !282

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !283
  %4 = load i32, i32* %i, align 4, !dbg !285
  %idxprom = sext i32 %4 to i64, !dbg !283
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !283
  store i32 0, i32* %arrayidx, align 4, !dbg !286
  br label %for.inc, !dbg !287

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !288
  %inc = add nsw i32 %5, 1, !dbg !288
  store i32 %inc, i32* %i, align 4, !dbg !288
  br label %for.cond, !dbg !289, !llvm.loop !290

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !292
  %cmp2 = icmp sge i32 %6, 0, !dbg !294
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !295

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !296
  %8 = load i32, i32* %data, align 4, !dbg !298
  %idxprom4 = sext i32 %8 to i64, !dbg !296
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !296
  store i32 1, i32* %arrayidx5, align 4, !dbg !299
  store i32 0, i32* %i, align 4, !dbg !300
  br label %for.cond6, !dbg !302

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !303
  %cmp7 = icmp slt i32 %9, 10, !dbg !305
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !306

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !307
  %11 = load i32, i32* %i, align 4, !dbg !309
  %idxprom9 = sext i32 %11 to i64, !dbg !307
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !307
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !307
  call void @printIntLine(i32 %12), !dbg !310
  br label %for.inc11, !dbg !311

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !312
  %inc12 = add nsw i32 %13, 1, !dbg !312
  store i32 %inc12, i32* %i, align 4, !dbg !312
  br label %for.cond6, !dbg !313, !llvm.loop !314

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !316

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !317
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !319
  %15 = bitcast i32* %14 to i8*, !dbg !319
  call void @free(i8* %15) #5, !dbg !320
  ret void, !dbg !321
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !322 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !323, metadata !DIExpression()), !dbg !324
  store i32 -1, i32* %data, align 4, !dbg !325
  store i32 7, i32* %data, align 4, !dbg !326
  call void @llvm.dbg.declare(metadata i32* %i, metadata !329, metadata !DIExpression()), !dbg !333
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !334, metadata !DIExpression()), !dbg !335
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !336
  %0 = bitcast i8* %call to i32*, !dbg !337
  store i32* %0, i32** %buffer, align 8, !dbg !335
  %1 = load i32*, i32** %buffer, align 8, !dbg !338
  %cmp = icmp eq i32* %1, null, !dbg !340
  br i1 %cmp, label %if.then, label %if.end, !dbg !341

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !342
  unreachable, !dbg !342

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !344
  br label %for.cond, !dbg !346

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !347
  %cmp1 = icmp slt i32 %2, 10, !dbg !349
  br i1 %cmp1, label %for.body, label %for.end, !dbg !350

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !351
  %4 = load i32, i32* %i, align 4, !dbg !353
  %idxprom = sext i32 %4 to i64, !dbg !351
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !351
  store i32 0, i32* %arrayidx, align 4, !dbg !354
  br label %for.inc, !dbg !355

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !356
  %inc = add nsw i32 %5, 1, !dbg !356
  store i32 %inc, i32* %i, align 4, !dbg !356
  br label %for.cond, !dbg !357, !llvm.loop !358

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !360
  %cmp2 = icmp sge i32 %6, 0, !dbg !362
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !363

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !364
  %8 = load i32, i32* %data, align 4, !dbg !366
  %idxprom4 = sext i32 %8 to i64, !dbg !364
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !364
  store i32 1, i32* %arrayidx5, align 4, !dbg !367
  store i32 0, i32* %i, align 4, !dbg !368
  br label %for.cond6, !dbg !370

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !371
  %cmp7 = icmp slt i32 %9, 10, !dbg !373
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !374

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !375
  %11 = load i32, i32* %i, align 4, !dbg !377
  %idxprom9 = sext i32 %11 to i64, !dbg !375
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !375
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !375
  call void @printIntLine(i32 %12), !dbg !378
  br label %for.inc11, !dbg !379

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !380
  %inc12 = add nsw i32 %13, 1, !dbg !380
  store i32 %inc12, i32* %i, align 4, !dbg !380
  br label %for.cond6, !dbg !381, !llvm.loop !382

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !384

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !385
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !387
  %15 = bitcast i32* %14 to i8*, !dbg !387
  call void @free(i8* %15) #5, !dbg !388
  ret void, !dbg !389
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 30, column: 14, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 28, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!24 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 35, type: !5)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 34, column: 9)
!26 = distinct !DILexicalBlock(scope: !27, file: !15, line: 33, column: 5)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!28 = !DILocation(line: 35, column: 17, scope: !25)
!29 = !DILocalVariable(name: "buffer", scope: !25, file: !15, line: 36, type: !4)
!30 = !DILocation(line: 36, column: 19, scope: !25)
!31 = !DILocation(line: 36, column: 35, scope: !25)
!32 = !DILocation(line: 36, column: 28, scope: !25)
!33 = !DILocation(line: 37, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !25, file: !15, line: 37, column: 17)
!35 = !DILocation(line: 37, column: 24, scope: !34)
!36 = !DILocation(line: 37, column: 17, scope: !25)
!37 = !DILocation(line: 37, column: 34, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 37, column: 33)
!39 = !DILocation(line: 39, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !25, file: !15, line: 39, column: 13)
!41 = !DILocation(line: 39, column: 18, scope: !40)
!42 = !DILocation(line: 39, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !15, line: 39, column: 13)
!44 = !DILocation(line: 39, column: 27, scope: !43)
!45 = !DILocation(line: 39, column: 13, scope: !40)
!46 = !DILocation(line: 41, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 40, column: 13)
!48 = !DILocation(line: 41, column: 24, scope: !47)
!49 = !DILocation(line: 41, column: 27, scope: !47)
!50 = !DILocation(line: 42, column: 13, scope: !47)
!51 = !DILocation(line: 39, column: 34, scope: !43)
!52 = !DILocation(line: 39, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 42, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 45, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !25, file: !15, line: 45, column: 17)
!58 = !DILocation(line: 45, column: 22, scope: !57)
!59 = !DILocation(line: 45, column: 17, scope: !25)
!60 = !DILocation(line: 47, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 46, column: 13)
!62 = !DILocation(line: 47, column: 24, scope: !61)
!63 = !DILocation(line: 47, column: 30, scope: !61)
!64 = !DILocation(line: 49, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 49, column: 17)
!66 = !DILocation(line: 49, column: 21, scope: !65)
!67 = !DILocation(line: 49, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !15, line: 49, column: 17)
!69 = !DILocation(line: 49, column: 30, scope: !68)
!70 = !DILocation(line: 49, column: 17, scope: !65)
!71 = !DILocation(line: 51, column: 34, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !15, line: 50, column: 17)
!73 = !DILocation(line: 51, column: 41, scope: !72)
!74 = !DILocation(line: 51, column: 21, scope: !72)
!75 = !DILocation(line: 52, column: 17, scope: !72)
!76 = !DILocation(line: 49, column: 37, scope: !68)
!77 = !DILocation(line: 49, column: 17, scope: !68)
!78 = distinct !{!78, !70, !79, !55}
!79 = !DILocation(line: 52, column: 17, scope: !65)
!80 = !DILocation(line: 53, column: 13, scope: !61)
!81 = !DILocation(line: 56, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !57, file: !15, line: 55, column: 13)
!83 = !DILocation(line: 58, column: 18, scope: !25)
!84 = !DILocation(line: 58, column: 13, scope: !25)
!85 = !DILocation(line: 61, column: 1, scope: !14)
!86 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_03_good", scope: !15, file: !15, line: 245, type: !16, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 247, column: 5, scope: !86)
!88 = !DILocation(line: 248, column: 5, scope: !86)
!89 = !DILocation(line: 249, column: 5, scope: !86)
!90 = !DILocation(line: 250, column: 5, scope: !86)
!91 = !DILocation(line: 251, column: 1, scope: !86)
!92 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 262, type: !93, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!5, !5, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !15, line: 262, type: !5)
!99 = !DILocation(line: 262, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !15, line: 262, type: !95)
!101 = !DILocation(line: 262, column: 27, scope: !92)
!102 = !DILocation(line: 265, column: 22, scope: !92)
!103 = !DILocation(line: 265, column: 12, scope: !92)
!104 = !DILocation(line: 265, column: 5, scope: !92)
!105 = !DILocation(line: 267, column: 5, scope: !92)
!106 = !DILocation(line: 268, column: 5, scope: !92)
!107 = !DILocation(line: 269, column: 5, scope: !92)
!108 = !DILocation(line: 272, column: 5, scope: !92)
!109 = !DILocation(line: 273, column: 5, scope: !92)
!110 = !DILocation(line: 274, column: 5, scope: !92)
!111 = !DILocation(line: 276, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 70, type: !5)
!114 = !DILocation(line: 70, column: 9, scope: !112)
!115 = !DILocation(line: 72, column: 10, scope: !112)
!116 = !DILocation(line: 76, column: 14, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !15, line: 74, column: 5)
!118 = distinct !DILexicalBlock(scope: !112, file: !15, line: 73, column: 8)
!119 = !DILocalVariable(name: "i", scope: !120, file: !15, line: 86, type: !5)
!120 = distinct !DILexicalBlock(scope: !121, file: !15, line: 85, column: 9)
!121 = distinct !DILexicalBlock(scope: !122, file: !15, line: 84, column: 5)
!122 = distinct !DILexicalBlock(scope: !112, file: !15, line: 78, column: 8)
!123 = !DILocation(line: 86, column: 17, scope: !120)
!124 = !DILocalVariable(name: "buffer", scope: !120, file: !15, line: 87, type: !4)
!125 = !DILocation(line: 87, column: 19, scope: !120)
!126 = !DILocation(line: 87, column: 35, scope: !120)
!127 = !DILocation(line: 87, column: 28, scope: !120)
!128 = !DILocation(line: 88, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !120, file: !15, line: 88, column: 17)
!130 = !DILocation(line: 88, column: 24, scope: !129)
!131 = !DILocation(line: 88, column: 17, scope: !120)
!132 = !DILocation(line: 88, column: 34, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 88, column: 33)
!134 = !DILocation(line: 90, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !120, file: !15, line: 90, column: 13)
!136 = !DILocation(line: 90, column: 18, scope: !135)
!137 = !DILocation(line: 90, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !15, line: 90, column: 13)
!139 = !DILocation(line: 90, column: 27, scope: !138)
!140 = !DILocation(line: 90, column: 13, scope: !135)
!141 = !DILocation(line: 92, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !15, line: 91, column: 13)
!143 = !DILocation(line: 92, column: 24, scope: !142)
!144 = !DILocation(line: 92, column: 27, scope: !142)
!145 = !DILocation(line: 93, column: 13, scope: !142)
!146 = !DILocation(line: 90, column: 34, scope: !138)
!147 = !DILocation(line: 90, column: 13, scope: !138)
!148 = distinct !{!148, !140, !149, !55}
!149 = !DILocation(line: 93, column: 13, scope: !135)
!150 = !DILocation(line: 95, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !120, file: !15, line: 95, column: 17)
!152 = !DILocation(line: 95, column: 22, scope: !151)
!153 = !DILocation(line: 95, column: 27, scope: !151)
!154 = !DILocation(line: 95, column: 30, scope: !151)
!155 = !DILocation(line: 95, column: 35, scope: !151)
!156 = !DILocation(line: 95, column: 17, scope: !120)
!157 = !DILocation(line: 97, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !15, line: 96, column: 13)
!159 = !DILocation(line: 97, column: 24, scope: !158)
!160 = !DILocation(line: 97, column: 30, scope: !158)
!161 = !DILocation(line: 99, column: 23, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !15, line: 99, column: 17)
!163 = !DILocation(line: 99, column: 21, scope: !162)
!164 = !DILocation(line: 99, column: 28, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !15, line: 99, column: 17)
!166 = !DILocation(line: 99, column: 30, scope: !165)
!167 = !DILocation(line: 99, column: 17, scope: !162)
!168 = !DILocation(line: 101, column: 34, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !15, line: 100, column: 17)
!170 = !DILocation(line: 101, column: 41, scope: !169)
!171 = !DILocation(line: 101, column: 21, scope: !169)
!172 = !DILocation(line: 102, column: 17, scope: !169)
!173 = !DILocation(line: 99, column: 37, scope: !165)
!174 = !DILocation(line: 99, column: 17, scope: !165)
!175 = distinct !{!175, !167, !176, !55}
!176 = !DILocation(line: 102, column: 17, scope: !162)
!177 = !DILocation(line: 103, column: 13, scope: !158)
!178 = !DILocation(line: 106, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !151, file: !15, line: 105, column: 13)
!180 = !DILocation(line: 108, column: 18, scope: !120)
!181 = !DILocation(line: 108, column: 13, scope: !120)
!182 = !DILocation(line: 111, column: 1, scope: !112)
!183 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!184 = !DILocalVariable(name: "data", scope: !183, file: !15, line: 116, type: !5)
!185 = !DILocation(line: 116, column: 9, scope: !183)
!186 = !DILocation(line: 118, column: 10, scope: !183)
!187 = !DILocation(line: 122, column: 14, scope: !188)
!188 = distinct !DILexicalBlock(scope: !189, file: !15, line: 120, column: 5)
!189 = distinct !DILexicalBlock(scope: !183, file: !15, line: 119, column: 8)
!190 = !DILocalVariable(name: "i", scope: !191, file: !15, line: 127, type: !5)
!191 = distinct !DILexicalBlock(scope: !192, file: !15, line: 126, column: 9)
!192 = distinct !DILexicalBlock(scope: !193, file: !15, line: 125, column: 5)
!193 = distinct !DILexicalBlock(scope: !183, file: !15, line: 124, column: 8)
!194 = !DILocation(line: 127, column: 17, scope: !191)
!195 = !DILocalVariable(name: "buffer", scope: !191, file: !15, line: 128, type: !4)
!196 = !DILocation(line: 128, column: 19, scope: !191)
!197 = !DILocation(line: 128, column: 35, scope: !191)
!198 = !DILocation(line: 128, column: 28, scope: !191)
!199 = !DILocation(line: 129, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !191, file: !15, line: 129, column: 17)
!201 = !DILocation(line: 129, column: 24, scope: !200)
!202 = !DILocation(line: 129, column: 17, scope: !191)
!203 = !DILocation(line: 129, column: 34, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !15, line: 129, column: 33)
!205 = !DILocation(line: 131, column: 20, scope: !206)
!206 = distinct !DILexicalBlock(scope: !191, file: !15, line: 131, column: 13)
!207 = !DILocation(line: 131, column: 18, scope: !206)
!208 = !DILocation(line: 131, column: 25, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !15, line: 131, column: 13)
!210 = !DILocation(line: 131, column: 27, scope: !209)
!211 = !DILocation(line: 131, column: 13, scope: !206)
!212 = !DILocation(line: 133, column: 17, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !15, line: 132, column: 13)
!214 = !DILocation(line: 133, column: 24, scope: !213)
!215 = !DILocation(line: 133, column: 27, scope: !213)
!216 = !DILocation(line: 134, column: 13, scope: !213)
!217 = !DILocation(line: 131, column: 34, scope: !209)
!218 = !DILocation(line: 131, column: 13, scope: !209)
!219 = distinct !{!219, !211, !220, !55}
!220 = !DILocation(line: 134, column: 13, scope: !206)
!221 = !DILocation(line: 136, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !191, file: !15, line: 136, column: 17)
!223 = !DILocation(line: 136, column: 22, scope: !222)
!224 = !DILocation(line: 136, column: 27, scope: !222)
!225 = !DILocation(line: 136, column: 30, scope: !222)
!226 = !DILocation(line: 136, column: 35, scope: !222)
!227 = !DILocation(line: 136, column: 17, scope: !191)
!228 = !DILocation(line: 138, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !222, file: !15, line: 137, column: 13)
!230 = !DILocation(line: 138, column: 24, scope: !229)
!231 = !DILocation(line: 138, column: 30, scope: !229)
!232 = !DILocation(line: 140, column: 23, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !15, line: 140, column: 17)
!234 = !DILocation(line: 140, column: 21, scope: !233)
!235 = !DILocation(line: 140, column: 28, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !15, line: 140, column: 17)
!237 = !DILocation(line: 140, column: 30, scope: !236)
!238 = !DILocation(line: 140, column: 17, scope: !233)
!239 = !DILocation(line: 142, column: 34, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !15, line: 141, column: 17)
!241 = !DILocation(line: 142, column: 41, scope: !240)
!242 = !DILocation(line: 142, column: 21, scope: !240)
!243 = !DILocation(line: 143, column: 17, scope: !240)
!244 = !DILocation(line: 140, column: 37, scope: !236)
!245 = !DILocation(line: 140, column: 17, scope: !236)
!246 = distinct !{!246, !238, !247, !55}
!247 = !DILocation(line: 143, column: 17, scope: !233)
!248 = !DILocation(line: 144, column: 13, scope: !229)
!249 = !DILocation(line: 147, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !222, file: !15, line: 146, column: 13)
!251 = !DILocation(line: 149, column: 18, scope: !191)
!252 = !DILocation(line: 149, column: 13, scope: !191)
!253 = !DILocation(line: 152, column: 1, scope: !183)
!254 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 155, type: !16, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!255 = !DILocalVariable(name: "data", scope: !254, file: !15, line: 157, type: !5)
!256 = !DILocation(line: 157, column: 9, scope: !254)
!257 = !DILocation(line: 159, column: 10, scope: !254)
!258 = !DILocation(line: 169, column: 14, scope: !259)
!259 = distinct !DILexicalBlock(scope: !260, file: !15, line: 166, column: 5)
!260 = distinct !DILexicalBlock(scope: !254, file: !15, line: 160, column: 8)
!261 = !DILocalVariable(name: "i", scope: !262, file: !15, line: 174, type: !5)
!262 = distinct !DILexicalBlock(scope: !263, file: !15, line: 173, column: 9)
!263 = distinct !DILexicalBlock(scope: !264, file: !15, line: 172, column: 5)
!264 = distinct !DILexicalBlock(scope: !254, file: !15, line: 171, column: 8)
!265 = !DILocation(line: 174, column: 17, scope: !262)
!266 = !DILocalVariable(name: "buffer", scope: !262, file: !15, line: 175, type: !4)
!267 = !DILocation(line: 175, column: 19, scope: !262)
!268 = !DILocation(line: 175, column: 35, scope: !262)
!269 = !DILocation(line: 175, column: 28, scope: !262)
!270 = !DILocation(line: 176, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !262, file: !15, line: 176, column: 17)
!272 = !DILocation(line: 176, column: 24, scope: !271)
!273 = !DILocation(line: 176, column: 17, scope: !262)
!274 = !DILocation(line: 176, column: 34, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !15, line: 176, column: 33)
!276 = !DILocation(line: 178, column: 20, scope: !277)
!277 = distinct !DILexicalBlock(scope: !262, file: !15, line: 178, column: 13)
!278 = !DILocation(line: 178, column: 18, scope: !277)
!279 = !DILocation(line: 178, column: 25, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !15, line: 178, column: 13)
!281 = !DILocation(line: 178, column: 27, scope: !280)
!282 = !DILocation(line: 178, column: 13, scope: !277)
!283 = !DILocation(line: 180, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !15, line: 179, column: 13)
!285 = !DILocation(line: 180, column: 24, scope: !284)
!286 = !DILocation(line: 180, column: 27, scope: !284)
!287 = !DILocation(line: 181, column: 13, scope: !284)
!288 = !DILocation(line: 178, column: 34, scope: !280)
!289 = !DILocation(line: 178, column: 13, scope: !280)
!290 = distinct !{!290, !282, !291, !55}
!291 = !DILocation(line: 181, column: 13, scope: !277)
!292 = !DILocation(line: 184, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !262, file: !15, line: 184, column: 17)
!294 = !DILocation(line: 184, column: 22, scope: !293)
!295 = !DILocation(line: 184, column: 17, scope: !262)
!296 = !DILocation(line: 186, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !15, line: 185, column: 13)
!298 = !DILocation(line: 186, column: 24, scope: !297)
!299 = !DILocation(line: 186, column: 30, scope: !297)
!300 = !DILocation(line: 188, column: 23, scope: !301)
!301 = distinct !DILexicalBlock(scope: !297, file: !15, line: 188, column: 17)
!302 = !DILocation(line: 188, column: 21, scope: !301)
!303 = !DILocation(line: 188, column: 28, scope: !304)
!304 = distinct !DILexicalBlock(scope: !301, file: !15, line: 188, column: 17)
!305 = !DILocation(line: 188, column: 30, scope: !304)
!306 = !DILocation(line: 188, column: 17, scope: !301)
!307 = !DILocation(line: 190, column: 34, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !15, line: 189, column: 17)
!309 = !DILocation(line: 190, column: 41, scope: !308)
!310 = !DILocation(line: 190, column: 21, scope: !308)
!311 = !DILocation(line: 191, column: 17, scope: !308)
!312 = !DILocation(line: 188, column: 37, scope: !304)
!313 = !DILocation(line: 188, column: 17, scope: !304)
!314 = distinct !{!314, !306, !315, !55}
!315 = !DILocation(line: 191, column: 17, scope: !301)
!316 = !DILocation(line: 192, column: 13, scope: !297)
!317 = !DILocation(line: 195, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !293, file: !15, line: 194, column: 13)
!319 = !DILocation(line: 197, column: 18, scope: !262)
!320 = !DILocation(line: 197, column: 13, scope: !262)
!321 = !DILocation(line: 200, column: 1, scope: !254)
!322 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 203, type: !16, scopeLine: 204, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!323 = !DILocalVariable(name: "data", scope: !322, file: !15, line: 205, type: !5)
!324 = !DILocation(line: 205, column: 9, scope: !322)
!325 = !DILocation(line: 207, column: 10, scope: !322)
!326 = !DILocation(line: 212, column: 14, scope: !327)
!327 = distinct !DILexicalBlock(scope: !328, file: !15, line: 209, column: 5)
!328 = distinct !DILexicalBlock(scope: !322, file: !15, line: 208, column: 8)
!329 = !DILocalVariable(name: "i", scope: !330, file: !15, line: 217, type: !5)
!330 = distinct !DILexicalBlock(scope: !331, file: !15, line: 216, column: 9)
!331 = distinct !DILexicalBlock(scope: !332, file: !15, line: 215, column: 5)
!332 = distinct !DILexicalBlock(scope: !322, file: !15, line: 214, column: 8)
!333 = !DILocation(line: 217, column: 17, scope: !330)
!334 = !DILocalVariable(name: "buffer", scope: !330, file: !15, line: 218, type: !4)
!335 = !DILocation(line: 218, column: 19, scope: !330)
!336 = !DILocation(line: 218, column: 35, scope: !330)
!337 = !DILocation(line: 218, column: 28, scope: !330)
!338 = !DILocation(line: 219, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !330, file: !15, line: 219, column: 17)
!340 = !DILocation(line: 219, column: 24, scope: !339)
!341 = !DILocation(line: 219, column: 17, scope: !330)
!342 = !DILocation(line: 219, column: 34, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !15, line: 219, column: 33)
!344 = !DILocation(line: 221, column: 20, scope: !345)
!345 = distinct !DILexicalBlock(scope: !330, file: !15, line: 221, column: 13)
!346 = !DILocation(line: 221, column: 18, scope: !345)
!347 = !DILocation(line: 221, column: 25, scope: !348)
!348 = distinct !DILexicalBlock(scope: !345, file: !15, line: 221, column: 13)
!349 = !DILocation(line: 221, column: 27, scope: !348)
!350 = !DILocation(line: 221, column: 13, scope: !345)
!351 = !DILocation(line: 223, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !15, line: 222, column: 13)
!353 = !DILocation(line: 223, column: 24, scope: !352)
!354 = !DILocation(line: 223, column: 27, scope: !352)
!355 = !DILocation(line: 224, column: 13, scope: !352)
!356 = !DILocation(line: 221, column: 34, scope: !348)
!357 = !DILocation(line: 221, column: 13, scope: !348)
!358 = distinct !{!358, !350, !359, !55}
!359 = !DILocation(line: 224, column: 13, scope: !345)
!360 = !DILocation(line: 227, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !330, file: !15, line: 227, column: 17)
!362 = !DILocation(line: 227, column: 22, scope: !361)
!363 = !DILocation(line: 227, column: 17, scope: !330)
!364 = !DILocation(line: 229, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !15, line: 228, column: 13)
!366 = !DILocation(line: 229, column: 24, scope: !365)
!367 = !DILocation(line: 229, column: 30, scope: !365)
!368 = !DILocation(line: 231, column: 23, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !15, line: 231, column: 17)
!370 = !DILocation(line: 231, column: 21, scope: !369)
!371 = !DILocation(line: 231, column: 28, scope: !372)
!372 = distinct !DILexicalBlock(scope: !369, file: !15, line: 231, column: 17)
!373 = !DILocation(line: 231, column: 30, scope: !372)
!374 = !DILocation(line: 231, column: 17, scope: !369)
!375 = !DILocation(line: 233, column: 34, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !15, line: 232, column: 17)
!377 = !DILocation(line: 233, column: 41, scope: !376)
!378 = !DILocation(line: 233, column: 21, scope: !376)
!379 = !DILocation(line: 234, column: 17, scope: !376)
!380 = !DILocation(line: 231, column: 37, scope: !372)
!381 = !DILocation(line: 231, column: 17, scope: !372)
!382 = distinct !{!382, !374, !383, !55}
!383 = !DILocation(line: 234, column: 17, scope: !369)
!384 = !DILocation(line: 235, column: 13, scope: !365)
!385 = !DILocation(line: 238, column: 17, scope: !386)
!386 = distinct !DILexicalBlock(scope: !361, file: !15, line: 237, column: 13)
!387 = !DILocation(line: 240, column: 18, scope: !330)
!388 = !DILocation(line: 240, column: 13, scope: !330)
!389 = !DILocation(line: 243, column: 1, scope: !322)
