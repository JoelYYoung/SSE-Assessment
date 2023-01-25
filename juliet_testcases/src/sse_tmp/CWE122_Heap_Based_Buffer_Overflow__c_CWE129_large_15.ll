; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  store i32 10, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %buffer, align 8, !dbg !26
  %1 = load i32*, i32** %buffer, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !38
  %cmp1 = icmp slt i32 %2, 10, !dbg !40
  br i1 %cmp1, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !42
  %4 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %4 to i64, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %5, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !52
  %cmp2 = icmp sge i32 %6, 0, !dbg !54
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !55

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !56
  %8 = load i32, i32* %data, align 4, !dbg !58
  %idxprom4 = sext i32 %8 to i64, !dbg !56
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !56
  store i32 1, i32* %arrayidx5, align 4, !dbg !59
  store i32 0, i32* %i, align 4, !dbg !60
  br label %for.cond6, !dbg !62

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !63
  %cmp7 = icmp slt i32 %9, 10, !dbg !65
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !66

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !67
  %11 = load i32, i32* %i, align 4, !dbg !69
  %idxprom9 = sext i32 %11 to i64, !dbg !67
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !67
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !67
  call void @printIntLine(i32 %12), !dbg !70
  br label %for.inc11, !dbg !71

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !72
  %inc12 = add nsw i32 %13, 1, !dbg !72
  store i32 %inc12, i32* %i, align 4, !dbg !72
  br label %for.cond6, !dbg !73, !llvm.loop !74

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !76

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !77
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !79
  %15 = bitcast i32* %14 to i8*, !dbg !79
  call void @free(i8* %15) #5, !dbg !80
  ret void, !dbg !81
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_good() #0 !dbg !82 {
entry:
  call void @goodB2G1(), !dbg !83
  call void @goodB2G2(), !dbg !84
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #5, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #5, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !108 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %data, align 4, !dbg !111
  store i32 10, i32* %data, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata i32* %i, metadata !113, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !118
  %0 = bitcast i8* %call to i32*, !dbg !119
  store i32* %0, i32** %buffer, align 8, !dbg !117
  %1 = load i32*, i32** %buffer, align 8, !dbg !120
  %cmp = icmp eq i32* %1, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !129
  %cmp1 = icmp slt i32 %2, 10, !dbg !131
  br i1 %cmp1, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !133
  %4 = load i32, i32* %i, align 4, !dbg !135
  %idxprom = sext i32 %4 to i64, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !138
  %inc = add nsw i32 %5, 1, !dbg !138
  store i32 %inc, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !142
  %cmp2 = icmp sge i32 %6, 0, !dbg !144
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !145

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !146
  %cmp3 = icmp slt i32 %7, 10, !dbg !147
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !148

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !149
  %9 = load i32, i32* %data, align 4, !dbg !151
  %idxprom5 = sext i32 %9 to i64, !dbg !149
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !149
  store i32 1, i32* %arrayidx6, align 4, !dbg !152
  store i32 0, i32* %i, align 4, !dbg !153
  br label %for.cond7, !dbg !155

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !156
  %cmp8 = icmp slt i32 %10, 10, !dbg !158
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !159

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !160
  %12 = load i32, i32* %i, align 4, !dbg !162
  %idxprom10 = sext i32 %12 to i64, !dbg !160
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !160
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !160
  call void @printIntLine(i32 %13), !dbg !163
  br label %for.inc12, !dbg !164

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !165
  %inc13 = add nsw i32 %14, 1, !dbg !165
  store i32 %inc13, i32* %i, align 4, !dbg !165
  br label %for.cond7, !dbg !166, !llvm.loop !167

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !169

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !170
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !172
  %16 = bitcast i32* %15 to i8*, !dbg !172
  call void @free(i8* %16) #5, !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !175 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !176, metadata !DIExpression()), !dbg !177
  store i32 -1, i32* %data, align 4, !dbg !178
  store i32 10, i32* %data, align 4, !dbg !179
  call void @llvm.dbg.declare(metadata i32* %i, metadata !180, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !183, metadata !DIExpression()), !dbg !184
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !185
  %0 = bitcast i8* %call to i32*, !dbg !186
  store i32* %0, i32** %buffer, align 8, !dbg !184
  %1 = load i32*, i32** %buffer, align 8, !dbg !187
  %cmp = icmp eq i32* %1, null, !dbg !189
  br i1 %cmp, label %if.then, label %if.end, !dbg !190

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !191
  unreachable, !dbg !191

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !195

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !196
  %cmp1 = icmp slt i32 %2, 10, !dbg !198
  br i1 %cmp1, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !200
  %4 = load i32, i32* %i, align 4, !dbg !202
  %idxprom = sext i32 %4 to i64, !dbg !200
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !200
  store i32 0, i32* %arrayidx, align 4, !dbg !203
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !205
  %inc = add nsw i32 %5, 1, !dbg !205
  store i32 %inc, i32* %i, align 4, !dbg !205
  br label %for.cond, !dbg !206, !llvm.loop !207

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !209
  %cmp2 = icmp sge i32 %6, 0, !dbg !211
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !212

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !213
  %cmp3 = icmp slt i32 %7, 10, !dbg !214
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !215

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !216
  %9 = load i32, i32* %data, align 4, !dbg !218
  %idxprom5 = sext i32 %9 to i64, !dbg !216
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !216
  store i32 1, i32* %arrayidx6, align 4, !dbg !219
  store i32 0, i32* %i, align 4, !dbg !220
  br label %for.cond7, !dbg !222

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !223
  %cmp8 = icmp slt i32 %10, 10, !dbg !225
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !226

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !227
  %12 = load i32, i32* %i, align 4, !dbg !229
  %idxprom10 = sext i32 %12 to i64, !dbg !227
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !227
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !227
  call void @printIntLine(i32 %13), !dbg !230
  br label %for.inc12, !dbg !231

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !232
  %inc13 = add nsw i32 %14, 1, !dbg !232
  store i32 %inc13, i32* %i, align 4, !dbg !232
  br label %for.cond7, !dbg !233, !llvm.loop !234

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !236

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !237
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !239
  %16 = bitcast i32* %15 to i8*, !dbg !239
  call void @free(i8* %16) #5, !dbg !240
  ret void, !dbg !241
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !242 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !243, metadata !DIExpression()), !dbg !244
  store i32 -1, i32* %data, align 4, !dbg !245
  store i32 7, i32* %data, align 4, !dbg !246
  call void @llvm.dbg.declare(metadata i32* %i, metadata !247, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !250, metadata !DIExpression()), !dbg !251
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !252
  %0 = bitcast i8* %call to i32*, !dbg !253
  store i32* %0, i32** %buffer, align 8, !dbg !251
  %1 = load i32*, i32** %buffer, align 8, !dbg !254
  %cmp = icmp eq i32* %1, null, !dbg !256
  br i1 %cmp, label %if.then, label %if.end, !dbg !257

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !258
  unreachable, !dbg !258

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !260
  br label %for.cond, !dbg !262

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !263
  %cmp1 = icmp slt i32 %2, 10, !dbg !265
  br i1 %cmp1, label %for.body, label %for.end, !dbg !266

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !267
  %4 = load i32, i32* %i, align 4, !dbg !269
  %idxprom = sext i32 %4 to i64, !dbg !267
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !267
  store i32 0, i32* %arrayidx, align 4, !dbg !270
  br label %for.inc, !dbg !271

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !272
  %inc = add nsw i32 %5, 1, !dbg !272
  store i32 %inc, i32* %i, align 4, !dbg !272
  br label %for.cond, !dbg !273, !llvm.loop !274

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !276
  %cmp2 = icmp sge i32 %6, 0, !dbg !278
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !279

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !280
  %8 = load i32, i32* %data, align 4, !dbg !282
  %idxprom4 = sext i32 %8 to i64, !dbg !280
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !280
  store i32 1, i32* %arrayidx5, align 4, !dbg !283
  store i32 0, i32* %i, align 4, !dbg !284
  br label %for.cond6, !dbg !286

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !287
  %cmp7 = icmp slt i32 %9, 10, !dbg !289
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !290

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !291
  %11 = load i32, i32* %i, align 4, !dbg !293
  %idxprom9 = sext i32 %11 to i64, !dbg !291
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !291
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !291
  call void @printIntLine(i32 %12), !dbg !294
  br label %for.inc11, !dbg !295

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !296
  %inc12 = add nsw i32 %13, 1, !dbg !296
  store i32 %inc12, i32* %i, align 4, !dbg !296
  br label %for.cond6, !dbg !297, !llvm.loop !298

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !300

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !301
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !303
  %15 = bitcast i32* %14 to i8*, !dbg !303
  call void @free(i8* %15) #5, !dbg !304
  ret void, !dbg !305
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !306 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !307, metadata !DIExpression()), !dbg !308
  store i32 -1, i32* %data, align 4, !dbg !309
  store i32 7, i32* %data, align 4, !dbg !310
  call void @llvm.dbg.declare(metadata i32* %i, metadata !311, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !314, metadata !DIExpression()), !dbg !315
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !316
  %0 = bitcast i8* %call to i32*, !dbg !317
  store i32* %0, i32** %buffer, align 8, !dbg !315
  %1 = load i32*, i32** %buffer, align 8, !dbg !318
  %cmp = icmp eq i32* %1, null, !dbg !320
  br i1 %cmp, label %if.then, label %if.end, !dbg !321

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !322
  unreachable, !dbg !322

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !324
  br label %for.cond, !dbg !326

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !327
  %cmp1 = icmp slt i32 %2, 10, !dbg !329
  br i1 %cmp1, label %for.body, label %for.end, !dbg !330

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !331
  %4 = load i32, i32* %i, align 4, !dbg !333
  %idxprom = sext i32 %4 to i64, !dbg !331
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !331
  store i32 0, i32* %arrayidx, align 4, !dbg !334
  br label %for.inc, !dbg !335

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !336
  %inc = add nsw i32 %5, 1, !dbg !336
  store i32 %inc, i32* %i, align 4, !dbg !336
  br label %for.cond, !dbg !337, !llvm.loop !338

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !340
  %cmp2 = icmp sge i32 %6, 0, !dbg !342
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !343

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !344
  %8 = load i32, i32* %data, align 4, !dbg !346
  %idxprom4 = sext i32 %8 to i64, !dbg !344
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !344
  store i32 1, i32* %arrayidx5, align 4, !dbg !347
  store i32 0, i32* %i, align 4, !dbg !348
  br label %for.cond6, !dbg !350

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !351
  %cmp7 = icmp slt i32 %9, 10, !dbg !353
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !354

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !355
  %11 = load i32, i32* %i, align 4, !dbg !357
  %idxprom9 = sext i32 %11 to i64, !dbg !355
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !355
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !355
  call void @printIntLine(i32 %12), !dbg !358
  br label %for.inc11, !dbg !359

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !360
  %inc12 = add nsw i32 %13, 1, !dbg !360
  store i32 %inc12, i32* %i, align 4, !dbg !360
  br label %for.cond6, !dbg !361, !llvm.loop !362

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !364

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !365
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !367
  %15 = bitcast i32* %14 to i8*, !dbg !367
  call void @free(i8* %15) #5, !dbg !368
  ret void, !dbg !369
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 31, column: 14, scope: !14)
!22 = !DILocalVariable(name: "i", scope: !23, file: !15, line: 42, type: !5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!24 = !DILocation(line: 42, column: 13, scope: !23)
!25 = !DILocalVariable(name: "buffer", scope: !23, file: !15, line: 43, type: !4)
!26 = !DILocation(line: 43, column: 15, scope: !23)
!27 = !DILocation(line: 43, column: 31, scope: !23)
!28 = !DILocation(line: 43, column: 24, scope: !23)
!29 = !DILocation(line: 44, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !15, line: 44, column: 13)
!31 = !DILocation(line: 44, column: 20, scope: !30)
!32 = !DILocation(line: 44, column: 13, scope: !23)
!33 = !DILocation(line: 44, column: 30, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 44, column: 29)
!35 = !DILocation(line: 46, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !23, file: !15, line: 46, column: 9)
!37 = !DILocation(line: 46, column: 14, scope: !36)
!38 = !DILocation(line: 46, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !15, line: 46, column: 9)
!40 = !DILocation(line: 46, column: 23, scope: !39)
!41 = !DILocation(line: 46, column: 9, scope: !36)
!42 = !DILocation(line: 48, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 47, column: 9)
!44 = !DILocation(line: 48, column: 20, scope: !43)
!45 = !DILocation(line: 48, column: 23, scope: !43)
!46 = !DILocation(line: 49, column: 9, scope: !43)
!47 = !DILocation(line: 46, column: 30, scope: !39)
!48 = !DILocation(line: 46, column: 9, scope: !39)
!49 = distinct !{!49, !41, !50, !51}
!50 = !DILocation(line: 49, column: 9, scope: !36)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 52, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !23, file: !15, line: 52, column: 13)
!54 = !DILocation(line: 52, column: 18, scope: !53)
!55 = !DILocation(line: 52, column: 13, scope: !23)
!56 = !DILocation(line: 54, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !15, line: 53, column: 9)
!58 = !DILocation(line: 54, column: 20, scope: !57)
!59 = !DILocation(line: 54, column: 26, scope: !57)
!60 = !DILocation(line: 56, column: 19, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 56, column: 13)
!62 = !DILocation(line: 56, column: 17, scope: !61)
!63 = !DILocation(line: 56, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !15, line: 56, column: 13)
!65 = !DILocation(line: 56, column: 26, scope: !64)
!66 = !DILocation(line: 56, column: 13, scope: !61)
!67 = !DILocation(line: 58, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 57, column: 13)
!69 = !DILocation(line: 58, column: 37, scope: !68)
!70 = !DILocation(line: 58, column: 17, scope: !68)
!71 = !DILocation(line: 59, column: 13, scope: !68)
!72 = !DILocation(line: 56, column: 33, scope: !64)
!73 = !DILocation(line: 56, column: 13, scope: !64)
!74 = distinct !{!74, !66, !75, !51}
!75 = !DILocation(line: 59, column: 13, scope: !61)
!76 = !DILocation(line: 60, column: 9, scope: !57)
!77 = !DILocation(line: 63, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !53, file: !15, line: 62, column: 9)
!79 = !DILocation(line: 65, column: 14, scope: !23)
!80 = !DILocation(line: 65, column: 9, scope: !23)
!81 = !DILocation(line: 73, column: 1, scope: !14)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_good", scope: !15, file: !15, line: 295, type: !16, scopeLine: 296, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 297, column: 5, scope: !82)
!84 = !DILocation(line: 298, column: 5, scope: !82)
!85 = !DILocation(line: 299, column: 5, scope: !82)
!86 = !DILocation(line: 300, column: 5, scope: !82)
!87 = !DILocation(line: 301, column: 1, scope: !82)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 312, type: !89, scopeLine: 313, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!5, !5, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 312, type: !5)
!95 = !DILocation(line: 312, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 312, type: !91)
!97 = !DILocation(line: 312, column: 27, scope: !88)
!98 = !DILocation(line: 315, column: 22, scope: !88)
!99 = !DILocation(line: 315, column: 12, scope: !88)
!100 = !DILocation(line: 315, column: 5, scope: !88)
!101 = !DILocation(line: 317, column: 5, scope: !88)
!102 = !DILocation(line: 318, column: 5, scope: !88)
!103 = !DILocation(line: 319, column: 5, scope: !88)
!104 = !DILocation(line: 322, column: 5, scope: !88)
!105 = !DILocation(line: 323, column: 5, scope: !88)
!106 = !DILocation(line: 324, column: 5, scope: !88)
!107 = !DILocation(line: 326, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 82, type: !5)
!110 = !DILocation(line: 82, column: 9, scope: !108)
!111 = !DILocation(line: 84, column: 10, scope: !108)
!112 = !DILocation(line: 89, column: 14, scope: !108)
!113 = !DILocalVariable(name: "i", scope: !114, file: !15, line: 104, type: !5)
!114 = distinct !DILexicalBlock(scope: !108, file: !15, line: 103, column: 5)
!115 = !DILocation(line: 104, column: 13, scope: !114)
!116 = !DILocalVariable(name: "buffer", scope: !114, file: !15, line: 105, type: !4)
!117 = !DILocation(line: 105, column: 15, scope: !114)
!118 = !DILocation(line: 105, column: 31, scope: !114)
!119 = !DILocation(line: 105, column: 24, scope: !114)
!120 = !DILocation(line: 106, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !114, file: !15, line: 106, column: 13)
!122 = !DILocation(line: 106, column: 20, scope: !121)
!123 = !DILocation(line: 106, column: 13, scope: !114)
!124 = !DILocation(line: 106, column: 30, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 106, column: 29)
!126 = !DILocation(line: 108, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !114, file: !15, line: 108, column: 9)
!128 = !DILocation(line: 108, column: 14, scope: !127)
!129 = !DILocation(line: 108, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !15, line: 108, column: 9)
!131 = !DILocation(line: 108, column: 23, scope: !130)
!132 = !DILocation(line: 108, column: 9, scope: !127)
!133 = !DILocation(line: 110, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !15, line: 109, column: 9)
!135 = !DILocation(line: 110, column: 20, scope: !134)
!136 = !DILocation(line: 110, column: 23, scope: !134)
!137 = !DILocation(line: 111, column: 9, scope: !134)
!138 = !DILocation(line: 108, column: 30, scope: !130)
!139 = !DILocation(line: 108, column: 9, scope: !130)
!140 = distinct !{!140, !132, !141, !51}
!141 = !DILocation(line: 111, column: 9, scope: !127)
!142 = !DILocation(line: 113, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !114, file: !15, line: 113, column: 13)
!144 = !DILocation(line: 113, column: 18, scope: !143)
!145 = !DILocation(line: 113, column: 23, scope: !143)
!146 = !DILocation(line: 113, column: 26, scope: !143)
!147 = !DILocation(line: 113, column: 31, scope: !143)
!148 = !DILocation(line: 113, column: 13, scope: !114)
!149 = !DILocation(line: 115, column: 13, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !15, line: 114, column: 9)
!151 = !DILocation(line: 115, column: 20, scope: !150)
!152 = !DILocation(line: 115, column: 26, scope: !150)
!153 = !DILocation(line: 117, column: 19, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 117, column: 13)
!155 = !DILocation(line: 117, column: 17, scope: !154)
!156 = !DILocation(line: 117, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !15, line: 117, column: 13)
!158 = !DILocation(line: 117, column: 26, scope: !157)
!159 = !DILocation(line: 117, column: 13, scope: !154)
!160 = !DILocation(line: 119, column: 30, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !15, line: 118, column: 13)
!162 = !DILocation(line: 119, column: 37, scope: !161)
!163 = !DILocation(line: 119, column: 17, scope: !161)
!164 = !DILocation(line: 120, column: 13, scope: !161)
!165 = !DILocation(line: 117, column: 33, scope: !157)
!166 = !DILocation(line: 117, column: 13, scope: !157)
!167 = distinct !{!167, !159, !168, !51}
!168 = !DILocation(line: 120, column: 13, scope: !154)
!169 = !DILocation(line: 121, column: 9, scope: !150)
!170 = !DILocation(line: 124, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !143, file: !15, line: 123, column: 9)
!172 = !DILocation(line: 126, column: 14, scope: !114)
!173 = !DILocation(line: 126, column: 9, scope: !114)
!174 = !DILocation(line: 130, column: 1, scope: !108)
!175 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 133, type: !16, scopeLine: 134, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!176 = !DILocalVariable(name: "data", scope: !175, file: !15, line: 135, type: !5)
!177 = !DILocation(line: 135, column: 9, scope: !175)
!178 = !DILocation(line: 137, column: 10, scope: !175)
!179 = !DILocation(line: 142, column: 14, scope: !175)
!180 = !DILocalVariable(name: "i", scope: !181, file: !15, line: 153, type: !5)
!181 = distinct !DILexicalBlock(scope: !175, file: !15, line: 152, column: 5)
!182 = !DILocation(line: 153, column: 13, scope: !181)
!183 = !DILocalVariable(name: "buffer", scope: !181, file: !15, line: 154, type: !4)
!184 = !DILocation(line: 154, column: 15, scope: !181)
!185 = !DILocation(line: 154, column: 31, scope: !181)
!186 = !DILocation(line: 154, column: 24, scope: !181)
!187 = !DILocation(line: 155, column: 13, scope: !188)
!188 = distinct !DILexicalBlock(scope: !181, file: !15, line: 155, column: 13)
!189 = !DILocation(line: 155, column: 20, scope: !188)
!190 = !DILocation(line: 155, column: 13, scope: !181)
!191 = !DILocation(line: 155, column: 30, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !15, line: 155, column: 29)
!193 = !DILocation(line: 157, column: 16, scope: !194)
!194 = distinct !DILexicalBlock(scope: !181, file: !15, line: 157, column: 9)
!195 = !DILocation(line: 157, column: 14, scope: !194)
!196 = !DILocation(line: 157, column: 21, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !15, line: 157, column: 9)
!198 = !DILocation(line: 157, column: 23, scope: !197)
!199 = !DILocation(line: 157, column: 9, scope: !194)
!200 = !DILocation(line: 159, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !15, line: 158, column: 9)
!202 = !DILocation(line: 159, column: 20, scope: !201)
!203 = !DILocation(line: 159, column: 23, scope: !201)
!204 = !DILocation(line: 160, column: 9, scope: !201)
!205 = !DILocation(line: 157, column: 30, scope: !197)
!206 = !DILocation(line: 157, column: 9, scope: !197)
!207 = distinct !{!207, !199, !208, !51}
!208 = !DILocation(line: 160, column: 9, scope: !194)
!209 = !DILocation(line: 162, column: 13, scope: !210)
!210 = distinct !DILexicalBlock(scope: !181, file: !15, line: 162, column: 13)
!211 = !DILocation(line: 162, column: 18, scope: !210)
!212 = !DILocation(line: 162, column: 23, scope: !210)
!213 = !DILocation(line: 162, column: 26, scope: !210)
!214 = !DILocation(line: 162, column: 31, scope: !210)
!215 = !DILocation(line: 162, column: 13, scope: !181)
!216 = !DILocation(line: 164, column: 13, scope: !217)
!217 = distinct !DILexicalBlock(scope: !210, file: !15, line: 163, column: 9)
!218 = !DILocation(line: 164, column: 20, scope: !217)
!219 = !DILocation(line: 164, column: 26, scope: !217)
!220 = !DILocation(line: 166, column: 19, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !15, line: 166, column: 13)
!222 = !DILocation(line: 166, column: 17, scope: !221)
!223 = !DILocation(line: 166, column: 24, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !15, line: 166, column: 13)
!225 = !DILocation(line: 166, column: 26, scope: !224)
!226 = !DILocation(line: 166, column: 13, scope: !221)
!227 = !DILocation(line: 168, column: 30, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !15, line: 167, column: 13)
!229 = !DILocation(line: 168, column: 37, scope: !228)
!230 = !DILocation(line: 168, column: 17, scope: !228)
!231 = !DILocation(line: 169, column: 13, scope: !228)
!232 = !DILocation(line: 166, column: 33, scope: !224)
!233 = !DILocation(line: 166, column: 13, scope: !224)
!234 = distinct !{!234, !226, !235, !51}
!235 = !DILocation(line: 169, column: 13, scope: !221)
!236 = !DILocation(line: 170, column: 9, scope: !217)
!237 = !DILocation(line: 173, column: 13, scope: !238)
!238 = distinct !DILexicalBlock(scope: !210, file: !15, line: 172, column: 9)
!239 = !DILocation(line: 175, column: 14, scope: !181)
!240 = !DILocation(line: 175, column: 9, scope: !181)
!241 = !DILocation(line: 183, column: 1, scope: !175)
!242 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 186, type: !16, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!243 = !DILocalVariable(name: "data", scope: !242, file: !15, line: 188, type: !5)
!244 = !DILocation(line: 188, column: 9, scope: !242)
!245 = !DILocation(line: 190, column: 10, scope: !242)
!246 = !DILocation(line: 200, column: 14, scope: !242)
!247 = !DILocalVariable(name: "i", scope: !248, file: !15, line: 207, type: !5)
!248 = distinct !DILexicalBlock(scope: !242, file: !15, line: 206, column: 5)
!249 = !DILocation(line: 207, column: 13, scope: !248)
!250 = !DILocalVariable(name: "buffer", scope: !248, file: !15, line: 208, type: !4)
!251 = !DILocation(line: 208, column: 15, scope: !248)
!252 = !DILocation(line: 208, column: 31, scope: !248)
!253 = !DILocation(line: 208, column: 24, scope: !248)
!254 = !DILocation(line: 209, column: 13, scope: !255)
!255 = distinct !DILexicalBlock(scope: !248, file: !15, line: 209, column: 13)
!256 = !DILocation(line: 209, column: 20, scope: !255)
!257 = !DILocation(line: 209, column: 13, scope: !248)
!258 = !DILocation(line: 209, column: 30, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !15, line: 209, column: 29)
!260 = !DILocation(line: 211, column: 16, scope: !261)
!261 = distinct !DILexicalBlock(scope: !248, file: !15, line: 211, column: 9)
!262 = !DILocation(line: 211, column: 14, scope: !261)
!263 = !DILocation(line: 211, column: 21, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !15, line: 211, column: 9)
!265 = !DILocation(line: 211, column: 23, scope: !264)
!266 = !DILocation(line: 211, column: 9, scope: !261)
!267 = !DILocation(line: 213, column: 13, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !15, line: 212, column: 9)
!269 = !DILocation(line: 213, column: 20, scope: !268)
!270 = !DILocation(line: 213, column: 23, scope: !268)
!271 = !DILocation(line: 214, column: 9, scope: !268)
!272 = !DILocation(line: 211, column: 30, scope: !264)
!273 = !DILocation(line: 211, column: 9, scope: !264)
!274 = distinct !{!274, !266, !275, !51}
!275 = !DILocation(line: 214, column: 9, scope: !261)
!276 = !DILocation(line: 217, column: 13, scope: !277)
!277 = distinct !DILexicalBlock(scope: !248, file: !15, line: 217, column: 13)
!278 = !DILocation(line: 217, column: 18, scope: !277)
!279 = !DILocation(line: 217, column: 13, scope: !248)
!280 = !DILocation(line: 219, column: 13, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !15, line: 218, column: 9)
!282 = !DILocation(line: 219, column: 20, scope: !281)
!283 = !DILocation(line: 219, column: 26, scope: !281)
!284 = !DILocation(line: 221, column: 19, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !15, line: 221, column: 13)
!286 = !DILocation(line: 221, column: 17, scope: !285)
!287 = !DILocation(line: 221, column: 24, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !15, line: 221, column: 13)
!289 = !DILocation(line: 221, column: 26, scope: !288)
!290 = !DILocation(line: 221, column: 13, scope: !285)
!291 = !DILocation(line: 223, column: 30, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !15, line: 222, column: 13)
!293 = !DILocation(line: 223, column: 37, scope: !292)
!294 = !DILocation(line: 223, column: 17, scope: !292)
!295 = !DILocation(line: 224, column: 13, scope: !292)
!296 = !DILocation(line: 221, column: 33, scope: !288)
!297 = !DILocation(line: 221, column: 13, scope: !288)
!298 = distinct !{!298, !290, !299, !51}
!299 = !DILocation(line: 224, column: 13, scope: !285)
!300 = !DILocation(line: 225, column: 9, scope: !281)
!301 = !DILocation(line: 228, column: 13, scope: !302)
!302 = distinct !DILexicalBlock(scope: !277, file: !15, line: 227, column: 9)
!303 = !DILocation(line: 230, column: 14, scope: !248)
!304 = !DILocation(line: 230, column: 9, scope: !248)
!305 = !DILocation(line: 238, column: 1, scope: !242)
!306 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 241, type: !16, scopeLine: 242, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!307 = !DILocalVariable(name: "data", scope: !306, file: !15, line: 243, type: !5)
!308 = !DILocation(line: 243, column: 9, scope: !306)
!309 = !DILocation(line: 245, column: 10, scope: !306)
!310 = !DILocation(line: 251, column: 14, scope: !306)
!311 = !DILocalVariable(name: "i", scope: !312, file: !15, line: 262, type: !5)
!312 = distinct !DILexicalBlock(scope: !306, file: !15, line: 261, column: 5)
!313 = !DILocation(line: 262, column: 13, scope: !312)
!314 = !DILocalVariable(name: "buffer", scope: !312, file: !15, line: 263, type: !4)
!315 = !DILocation(line: 263, column: 15, scope: !312)
!316 = !DILocation(line: 263, column: 31, scope: !312)
!317 = !DILocation(line: 263, column: 24, scope: !312)
!318 = !DILocation(line: 264, column: 13, scope: !319)
!319 = distinct !DILexicalBlock(scope: !312, file: !15, line: 264, column: 13)
!320 = !DILocation(line: 264, column: 20, scope: !319)
!321 = !DILocation(line: 264, column: 13, scope: !312)
!322 = !DILocation(line: 264, column: 30, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !15, line: 264, column: 29)
!324 = !DILocation(line: 266, column: 16, scope: !325)
!325 = distinct !DILexicalBlock(scope: !312, file: !15, line: 266, column: 9)
!326 = !DILocation(line: 266, column: 14, scope: !325)
!327 = !DILocation(line: 266, column: 21, scope: !328)
!328 = distinct !DILexicalBlock(scope: !325, file: !15, line: 266, column: 9)
!329 = !DILocation(line: 266, column: 23, scope: !328)
!330 = !DILocation(line: 266, column: 9, scope: !325)
!331 = !DILocation(line: 268, column: 13, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !15, line: 267, column: 9)
!333 = !DILocation(line: 268, column: 20, scope: !332)
!334 = !DILocation(line: 268, column: 23, scope: !332)
!335 = !DILocation(line: 269, column: 9, scope: !332)
!336 = !DILocation(line: 266, column: 30, scope: !328)
!337 = !DILocation(line: 266, column: 9, scope: !328)
!338 = distinct !{!338, !330, !339, !51}
!339 = !DILocation(line: 269, column: 9, scope: !325)
!340 = !DILocation(line: 272, column: 13, scope: !341)
!341 = distinct !DILexicalBlock(scope: !312, file: !15, line: 272, column: 13)
!342 = !DILocation(line: 272, column: 18, scope: !341)
!343 = !DILocation(line: 272, column: 13, scope: !312)
!344 = !DILocation(line: 274, column: 13, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !15, line: 273, column: 9)
!346 = !DILocation(line: 274, column: 20, scope: !345)
!347 = !DILocation(line: 274, column: 26, scope: !345)
!348 = !DILocation(line: 276, column: 19, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !15, line: 276, column: 13)
!350 = !DILocation(line: 276, column: 17, scope: !349)
!351 = !DILocation(line: 276, column: 24, scope: !352)
!352 = distinct !DILexicalBlock(scope: !349, file: !15, line: 276, column: 13)
!353 = !DILocation(line: 276, column: 26, scope: !352)
!354 = !DILocation(line: 276, column: 13, scope: !349)
!355 = !DILocation(line: 278, column: 30, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !15, line: 277, column: 13)
!357 = !DILocation(line: 278, column: 37, scope: !356)
!358 = !DILocation(line: 278, column: 17, scope: !356)
!359 = !DILocation(line: 279, column: 13, scope: !356)
!360 = !DILocation(line: 276, column: 33, scope: !352)
!361 = !DILocation(line: 276, column: 13, scope: !352)
!362 = distinct !{!362, !354, !363, !51}
!363 = !DILocation(line: 279, column: 13, scope: !349)
!364 = !DILocation(line: 280, column: 9, scope: !345)
!365 = !DILocation(line: 283, column: 13, scope: !366)
!366 = distinct !DILexicalBlock(scope: !341, file: !15, line: 282, column: 9)
!367 = !DILocation(line: 285, column: 14, scope: !312)
!368 = !DILocation(line: 285, column: 9, scope: !312)
!369 = !DILocation(line: 293, column: 1, scope: !306)
