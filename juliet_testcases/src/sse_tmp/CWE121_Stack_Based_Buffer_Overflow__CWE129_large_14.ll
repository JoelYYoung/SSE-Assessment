; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* @globalFive, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !23
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !26
  %cmp1 = icmp eq i32 %1, 5, !dbg !28
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !29

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !34, metadata !DIExpression()), !dbg !38
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !38
  %3 = load i32, i32* %data, align 4, !dbg !39
  %cmp3 = icmp sge i32 %3, 0, !dbg !41
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !42

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !43
  %idxprom = sext i32 %4 to i64, !dbg !45
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !45
  store i32 1, i32* %arrayidx, align 4, !dbg !46
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !50
  %cmp5 = icmp slt i32 %5, 10, !dbg !52
  br i1 %cmp5, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !54
  %idxprom6 = sext i32 %6 to i64, !dbg !56
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !56
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !56
  call void @printIntLine(i32 %7), !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %8, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !64

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !65
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !67

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14_good() #0 !dbg !69 {
entry:
  call void @goodB2G1(), !dbg !70
  call void @goodB2G2(), !dbg !71
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #5, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !95 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32 -1, i32* %data, align 4, !dbg !98
  %0 = load i32, i32* @globalFive, align 4, !dbg !99
  %cmp = icmp eq i32 %0, 5, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !103
  br label %if.end, !dbg !105

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !106
  %cmp1 = icmp ne i32 %1, 5, !dbg !108
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !109

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !110
  br label %if.end11, !dbg !112

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !113, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !117, metadata !DIExpression()), !dbg !118
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !118
  %3 = load i32, i32* %data, align 4, !dbg !119
  %cmp3 = icmp sge i32 %3, 0, !dbg !121
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !122

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !123
  %cmp4 = icmp slt i32 %4, 10, !dbg !124
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !125

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !126
  %idxprom = sext i32 %5 to i64, !dbg !128
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !128
  store i32 1, i32* %arrayidx, align 4, !dbg !129
  store i32 0, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !133
  %cmp6 = icmp slt i32 %6, 10, !dbg !135
  br i1 %cmp6, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !137
  %idxprom7 = sext i32 %7 to i64, !dbg !139
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !139
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !139
  call void @printIntLine(i32 %8), !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !142
  %inc = add nsw i32 %9, 1, !dbg !142
  store i32 %inc, i32* %i, align 4, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !146

if.else9:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !147
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then2
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !150 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !151, metadata !DIExpression()), !dbg !152
  store i32 -1, i32* %data, align 4, !dbg !153
  %0 = load i32, i32* @globalFive, align 4, !dbg !154
  %cmp = icmp eq i32 %0, 5, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !158
  br label %if.end, !dbg !160

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !161
  %cmp1 = icmp eq i32 %1, 5, !dbg !163
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !164

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !165, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !169, metadata !DIExpression()), !dbg !170
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !170
  %3 = load i32, i32* %data, align 4, !dbg !171
  %cmp3 = icmp sge i32 %3, 0, !dbg !173
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !174

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !175
  %cmp4 = icmp slt i32 %4, 10, !dbg !176
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !177

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !178
  %idxprom = sext i32 %5 to i64, !dbg !180
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !180
  store i32 1, i32* %arrayidx, align 4, !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !185
  %cmp6 = icmp slt i32 %6, 10, !dbg !187
  br i1 %cmp6, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !189
  %idxprom7 = sext i32 %7 to i64, !dbg !191
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !191
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !191
  call void @printIntLine(i32 %8), !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !194
  %inc = add nsw i32 %9, 1, !dbg !194
  store i32 %inc, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !198

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !199
  br label %if.end9

if.end9:                                          ; preds = %if.else, %for.end
  br label %if.end10, !dbg !201

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  %0 = load i32, i32* @globalFive, align 4, !dbg !207
  %cmp = icmp ne i32 %0, 5, !dbg !209
  br i1 %cmp, label %if.then, label %if.else, !dbg !210

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !211
  br label %if.end, !dbg !213

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !214
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !216
  %cmp1 = icmp eq i32 %1, 5, !dbg !218
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !219

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !220, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !224, metadata !DIExpression()), !dbg !225
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !225
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !225
  %3 = load i32, i32* %data, align 4, !dbg !226
  %cmp3 = icmp sge i32 %3, 0, !dbg !228
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !229

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !230
  %idxprom = sext i32 %4 to i64, !dbg !232
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !232
  store i32 1, i32* %arrayidx, align 4, !dbg !233
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !236

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !237
  %cmp5 = icmp slt i32 %5, 10, !dbg !239
  br i1 %cmp5, label %for.body, label %for.end, !dbg !240

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !241
  %idxprom6 = sext i32 %6 to i64, !dbg !243
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !243
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !243
  call void @printIntLine(i32 %7), !dbg !244
  br label %for.inc, !dbg !245

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !246
  %inc = add nsw i32 %8, 1, !dbg !246
  store i32 %inc, i32* %i, align 4, !dbg !246
  br label %for.cond, !dbg !247, !llvm.loop !248

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !250

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !251
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !253

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !254
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !255 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 -1, i32* %data, align 4, !dbg !258
  %0 = load i32, i32* @globalFive, align 4, !dbg !259
  %cmp = icmp eq i32 %0, 5, !dbg !261
  br i1 %cmp, label %if.then, label %if.end, !dbg !262

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !263
  br label %if.end, !dbg !265

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !266
  %cmp1 = icmp eq i32 %1, 5, !dbg !268
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !269

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !270, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !274, metadata !DIExpression()), !dbg !275
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !275
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !275
  %3 = load i32, i32* %data, align 4, !dbg !276
  %cmp3 = icmp sge i32 %3, 0, !dbg !278
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !279

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !280
  %idxprom = sext i32 %4 to i64, !dbg !282
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !282
  store i32 1, i32* %arrayidx, align 4, !dbg !283
  store i32 0, i32* %i, align 4, !dbg !284
  br label %for.cond, !dbg !286

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !287
  %cmp5 = icmp slt i32 %5, 10, !dbg !289
  br i1 %cmp5, label %for.body, label %for.end, !dbg !290

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !291
  %idxprom6 = sext i32 %6 to i64, !dbg !293
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !293
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !293
  call void @printIntLine(i32 %7), !dbg !294
  br label %for.inc, !dbg !295

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !296
  %inc = add nsw i32 %8, 1, !dbg !296
  store i32 %inc, i32* %i, align 4, !dbg !296
  br label %for.cond, !dbg !297, !llvm.loop !298

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !300

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !301
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !303

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !304
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 18, scope: !20)
!22 = !DILocation(line: 27, column: 8, scope: !11)
!23 = !DILocation(line: 30, column: 14, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !12, line: 28, column: 5)
!25 = !DILocation(line: 31, column: 5, scope: !24)
!26 = !DILocation(line: 32, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!28 = !DILocation(line: 32, column: 18, scope: !27)
!29 = !DILocation(line: 32, column: 8, scope: !11)
!30 = !DILocalVariable(name: "i", scope: !31, file: !12, line: 35, type: !16)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 34, column: 9)
!32 = distinct !DILexicalBlock(scope: !27, file: !12, line: 33, column: 5)
!33 = !DILocation(line: 35, column: 17, scope: !31)
!34 = !DILocalVariable(name: "buffer", scope: !31, file: !12, line: 36, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 36, column: 17, scope: !31)
!39 = !DILocation(line: 39, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !31, file: !12, line: 39, column: 17)
!41 = !DILocation(line: 39, column: 22, scope: !40)
!42 = !DILocation(line: 39, column: 17, scope: !31)
!43 = !DILocation(line: 41, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 40, column: 13)
!45 = !DILocation(line: 41, column: 17, scope: !44)
!46 = !DILocation(line: 41, column: 30, scope: !44)
!47 = !DILocation(line: 43, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 43, column: 17)
!49 = !DILocation(line: 43, column: 21, scope: !48)
!50 = !DILocation(line: 43, column: 28, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 43, column: 17)
!52 = !DILocation(line: 43, column: 30, scope: !51)
!53 = !DILocation(line: 43, column: 17, scope: !48)
!54 = !DILocation(line: 45, column: 41, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 44, column: 17)
!56 = !DILocation(line: 45, column: 34, scope: !55)
!57 = !DILocation(line: 45, column: 21, scope: !55)
!58 = !DILocation(line: 46, column: 17, scope: !55)
!59 = !DILocation(line: 43, column: 37, scope: !51)
!60 = !DILocation(line: 43, column: 17, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 46, column: 17, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 47, column: 13, scope: !44)
!65 = !DILocation(line: 50, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !40, file: !12, line: 49, column: 13)
!67 = !DILocation(line: 53, column: 5, scope: !32)
!68 = !DILocation(line: 54, column: 1, scope: !11)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_14_good", scope: !12, file: !12, line: 210, type: !13, scopeLine: 211, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 212, column: 5, scope: !69)
!71 = !DILocation(line: 213, column: 5, scope: !69)
!72 = !DILocation(line: 214, column: 5, scope: !69)
!73 = !DILocation(line: 215, column: 5, scope: !69)
!74 = !DILocation(line: 216, column: 1, scope: !69)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 227, type: !76, scopeLine: 228, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!16, !16, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 227, type: !16)
!82 = !DILocation(line: 227, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 227, type: !78)
!84 = !DILocation(line: 227, column: 27, scope: !75)
!85 = !DILocation(line: 230, column: 22, scope: !75)
!86 = !DILocation(line: 230, column: 12, scope: !75)
!87 = !DILocation(line: 230, column: 5, scope: !75)
!88 = !DILocation(line: 232, column: 5, scope: !75)
!89 = !DILocation(line: 233, column: 5, scope: !75)
!90 = !DILocation(line: 234, column: 5, scope: !75)
!91 = !DILocation(line: 237, column: 5, scope: !75)
!92 = !DILocation(line: 238, column: 5, scope: !75)
!93 = !DILocation(line: 239, column: 5, scope: !75)
!94 = !DILocation(line: 241, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 63, type: !16)
!97 = !DILocation(line: 63, column: 9, scope: !95)
!98 = !DILocation(line: 65, column: 10, scope: !95)
!99 = !DILocation(line: 66, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !12, line: 66, column: 8)
!101 = !DILocation(line: 66, column: 18, scope: !100)
!102 = !DILocation(line: 66, column: 8, scope: !95)
!103 = !DILocation(line: 69, column: 14, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !12, line: 67, column: 5)
!105 = !DILocation(line: 70, column: 5, scope: !104)
!106 = !DILocation(line: 71, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !95, file: !12, line: 71, column: 8)
!108 = !DILocation(line: 71, column: 18, scope: !107)
!109 = !DILocation(line: 71, column: 8, scope: !95)
!110 = !DILocation(line: 74, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 72, column: 5)
!112 = !DILocation(line: 75, column: 5, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !114, file: !12, line: 79, type: !16)
!114 = distinct !DILexicalBlock(scope: !115, file: !12, line: 78, column: 9)
!115 = distinct !DILexicalBlock(scope: !107, file: !12, line: 77, column: 5)
!116 = !DILocation(line: 79, column: 17, scope: !114)
!117 = !DILocalVariable(name: "buffer", scope: !114, file: !12, line: 80, type: !35)
!118 = !DILocation(line: 80, column: 17, scope: !114)
!119 = !DILocation(line: 82, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !12, line: 82, column: 17)
!121 = !DILocation(line: 82, column: 22, scope: !120)
!122 = !DILocation(line: 82, column: 27, scope: !120)
!123 = !DILocation(line: 82, column: 30, scope: !120)
!124 = !DILocation(line: 82, column: 35, scope: !120)
!125 = !DILocation(line: 82, column: 17, scope: !114)
!126 = !DILocation(line: 84, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !12, line: 83, column: 13)
!128 = !DILocation(line: 84, column: 17, scope: !127)
!129 = !DILocation(line: 84, column: 30, scope: !127)
!130 = !DILocation(line: 86, column: 23, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !12, line: 86, column: 17)
!132 = !DILocation(line: 86, column: 21, scope: !131)
!133 = !DILocation(line: 86, column: 28, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 86, column: 17)
!135 = !DILocation(line: 86, column: 30, scope: !134)
!136 = !DILocation(line: 86, column: 17, scope: !131)
!137 = !DILocation(line: 88, column: 41, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 87, column: 17)
!139 = !DILocation(line: 88, column: 34, scope: !138)
!140 = !DILocation(line: 88, column: 21, scope: !138)
!141 = !DILocation(line: 89, column: 17, scope: !138)
!142 = !DILocation(line: 86, column: 37, scope: !134)
!143 = !DILocation(line: 86, column: 17, scope: !134)
!144 = distinct !{!144, !136, !145, !63}
!145 = !DILocation(line: 89, column: 17, scope: !131)
!146 = !DILocation(line: 90, column: 13, scope: !127)
!147 = !DILocation(line: 93, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !120, file: !12, line: 92, column: 13)
!149 = !DILocation(line: 97, column: 1, scope: !95)
!150 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocalVariable(name: "data", scope: !150, file: !12, line: 102, type: !16)
!152 = !DILocation(line: 102, column: 9, scope: !150)
!153 = !DILocation(line: 104, column: 10, scope: !150)
!154 = !DILocation(line: 105, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !12, line: 105, column: 8)
!156 = !DILocation(line: 105, column: 18, scope: !155)
!157 = !DILocation(line: 105, column: 8, scope: !150)
!158 = !DILocation(line: 108, column: 14, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 106, column: 5)
!160 = !DILocation(line: 109, column: 5, scope: !159)
!161 = !DILocation(line: 110, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !150, file: !12, line: 110, column: 8)
!163 = !DILocation(line: 110, column: 18, scope: !162)
!164 = !DILocation(line: 110, column: 8, scope: !150)
!165 = !DILocalVariable(name: "i", scope: !166, file: !12, line: 113, type: !16)
!166 = distinct !DILexicalBlock(scope: !167, file: !12, line: 112, column: 9)
!167 = distinct !DILexicalBlock(scope: !162, file: !12, line: 111, column: 5)
!168 = !DILocation(line: 113, column: 17, scope: !166)
!169 = !DILocalVariable(name: "buffer", scope: !166, file: !12, line: 114, type: !35)
!170 = !DILocation(line: 114, column: 17, scope: !166)
!171 = !DILocation(line: 116, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !166, file: !12, line: 116, column: 17)
!173 = !DILocation(line: 116, column: 22, scope: !172)
!174 = !DILocation(line: 116, column: 27, scope: !172)
!175 = !DILocation(line: 116, column: 30, scope: !172)
!176 = !DILocation(line: 116, column: 35, scope: !172)
!177 = !DILocation(line: 116, column: 17, scope: !166)
!178 = !DILocation(line: 118, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !172, file: !12, line: 117, column: 13)
!180 = !DILocation(line: 118, column: 17, scope: !179)
!181 = !DILocation(line: 118, column: 30, scope: !179)
!182 = !DILocation(line: 120, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !12, line: 120, column: 17)
!184 = !DILocation(line: 120, column: 21, scope: !183)
!185 = !DILocation(line: 120, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !12, line: 120, column: 17)
!187 = !DILocation(line: 120, column: 30, scope: !186)
!188 = !DILocation(line: 120, column: 17, scope: !183)
!189 = !DILocation(line: 122, column: 41, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !12, line: 121, column: 17)
!191 = !DILocation(line: 122, column: 34, scope: !190)
!192 = !DILocation(line: 122, column: 21, scope: !190)
!193 = !DILocation(line: 123, column: 17, scope: !190)
!194 = !DILocation(line: 120, column: 37, scope: !186)
!195 = !DILocation(line: 120, column: 17, scope: !186)
!196 = distinct !{!196, !188, !197, !63}
!197 = !DILocation(line: 123, column: 17, scope: !183)
!198 = !DILocation(line: 124, column: 13, scope: !179)
!199 = !DILocation(line: 127, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !172, file: !12, line: 126, column: 13)
!201 = !DILocation(line: 130, column: 5, scope: !167)
!202 = !DILocation(line: 131, column: 1, scope: !150)
!203 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 134, type: !13, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!204 = !DILocalVariable(name: "data", scope: !203, file: !12, line: 136, type: !16)
!205 = !DILocation(line: 136, column: 9, scope: !203)
!206 = !DILocation(line: 138, column: 10, scope: !203)
!207 = !DILocation(line: 139, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !12, line: 139, column: 8)
!209 = !DILocation(line: 139, column: 18, scope: !208)
!210 = !DILocation(line: 139, column: 8, scope: !203)
!211 = !DILocation(line: 142, column: 9, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !12, line: 140, column: 5)
!213 = !DILocation(line: 143, column: 5, scope: !212)
!214 = !DILocation(line: 148, column: 14, scope: !215)
!215 = distinct !DILexicalBlock(scope: !208, file: !12, line: 145, column: 5)
!216 = !DILocation(line: 150, column: 8, scope: !217)
!217 = distinct !DILexicalBlock(scope: !203, file: !12, line: 150, column: 8)
!218 = !DILocation(line: 150, column: 18, scope: !217)
!219 = !DILocation(line: 150, column: 8, scope: !203)
!220 = !DILocalVariable(name: "i", scope: !221, file: !12, line: 153, type: !16)
!221 = distinct !DILexicalBlock(scope: !222, file: !12, line: 152, column: 9)
!222 = distinct !DILexicalBlock(scope: !217, file: !12, line: 151, column: 5)
!223 = !DILocation(line: 153, column: 17, scope: !221)
!224 = !DILocalVariable(name: "buffer", scope: !221, file: !12, line: 154, type: !35)
!225 = !DILocation(line: 154, column: 17, scope: !221)
!226 = !DILocation(line: 157, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !221, file: !12, line: 157, column: 17)
!228 = !DILocation(line: 157, column: 22, scope: !227)
!229 = !DILocation(line: 157, column: 17, scope: !221)
!230 = !DILocation(line: 159, column: 24, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !12, line: 158, column: 13)
!232 = !DILocation(line: 159, column: 17, scope: !231)
!233 = !DILocation(line: 159, column: 30, scope: !231)
!234 = !DILocation(line: 161, column: 23, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !12, line: 161, column: 17)
!236 = !DILocation(line: 161, column: 21, scope: !235)
!237 = !DILocation(line: 161, column: 28, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !12, line: 161, column: 17)
!239 = !DILocation(line: 161, column: 30, scope: !238)
!240 = !DILocation(line: 161, column: 17, scope: !235)
!241 = !DILocation(line: 163, column: 41, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !12, line: 162, column: 17)
!243 = !DILocation(line: 163, column: 34, scope: !242)
!244 = !DILocation(line: 163, column: 21, scope: !242)
!245 = !DILocation(line: 164, column: 17, scope: !242)
!246 = !DILocation(line: 161, column: 37, scope: !238)
!247 = !DILocation(line: 161, column: 17, scope: !238)
!248 = distinct !{!248, !240, !249, !63}
!249 = !DILocation(line: 164, column: 17, scope: !235)
!250 = !DILocation(line: 165, column: 13, scope: !231)
!251 = !DILocation(line: 168, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !227, file: !12, line: 167, column: 13)
!253 = !DILocation(line: 171, column: 5, scope: !222)
!254 = !DILocation(line: 172, column: 1, scope: !203)
!255 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 175, type: !13, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!256 = !DILocalVariable(name: "data", scope: !255, file: !12, line: 177, type: !16)
!257 = !DILocation(line: 177, column: 9, scope: !255)
!258 = !DILocation(line: 179, column: 10, scope: !255)
!259 = !DILocation(line: 180, column: 8, scope: !260)
!260 = distinct !DILexicalBlock(scope: !255, file: !12, line: 180, column: 8)
!261 = !DILocation(line: 180, column: 18, scope: !260)
!262 = !DILocation(line: 180, column: 8, scope: !255)
!263 = !DILocation(line: 184, column: 14, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !12, line: 181, column: 5)
!265 = !DILocation(line: 185, column: 5, scope: !264)
!266 = !DILocation(line: 186, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !255, file: !12, line: 186, column: 8)
!268 = !DILocation(line: 186, column: 18, scope: !267)
!269 = !DILocation(line: 186, column: 8, scope: !255)
!270 = !DILocalVariable(name: "i", scope: !271, file: !12, line: 189, type: !16)
!271 = distinct !DILexicalBlock(scope: !272, file: !12, line: 188, column: 9)
!272 = distinct !DILexicalBlock(scope: !267, file: !12, line: 187, column: 5)
!273 = !DILocation(line: 189, column: 17, scope: !271)
!274 = !DILocalVariable(name: "buffer", scope: !271, file: !12, line: 190, type: !35)
!275 = !DILocation(line: 190, column: 17, scope: !271)
!276 = !DILocation(line: 193, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !271, file: !12, line: 193, column: 17)
!278 = !DILocation(line: 193, column: 22, scope: !277)
!279 = !DILocation(line: 193, column: 17, scope: !271)
!280 = !DILocation(line: 195, column: 24, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !12, line: 194, column: 13)
!282 = !DILocation(line: 195, column: 17, scope: !281)
!283 = !DILocation(line: 195, column: 30, scope: !281)
!284 = !DILocation(line: 197, column: 23, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !12, line: 197, column: 17)
!286 = !DILocation(line: 197, column: 21, scope: !285)
!287 = !DILocation(line: 197, column: 28, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !12, line: 197, column: 17)
!289 = !DILocation(line: 197, column: 30, scope: !288)
!290 = !DILocation(line: 197, column: 17, scope: !285)
!291 = !DILocation(line: 199, column: 41, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !12, line: 198, column: 17)
!293 = !DILocation(line: 199, column: 34, scope: !292)
!294 = !DILocation(line: 199, column: 21, scope: !292)
!295 = !DILocation(line: 200, column: 17, scope: !292)
!296 = !DILocation(line: 197, column: 37, scope: !288)
!297 = !DILocation(line: 197, column: 17, scope: !288)
!298 = distinct !{!298, !290, !299, !63}
!299 = !DILocation(line: 200, column: 17, scope: !285)
!300 = !DILocation(line: 201, column: 13, scope: !281)
!301 = !DILocation(line: 204, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !277, file: !12, line: 203, column: 13)
!303 = !DILocation(line: 207, column: 5, scope: !272)
!304 = !DILocation(line: 208, column: 1, scope: !255)
