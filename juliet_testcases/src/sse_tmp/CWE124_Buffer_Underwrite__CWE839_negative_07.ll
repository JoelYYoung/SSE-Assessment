; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %0 = load i32, i32* @staticFive, align 4, !dbg !22
  %cmp = icmp eq i32 %0, 5, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !26
  br label %if.end, !dbg !28

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp1 = icmp eq i32 %1, 5, !dbg !31
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !32

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !37, metadata !DIExpression()), !dbg !41
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !41
  %3 = load i32, i32* %data, align 4, !dbg !42
  %cmp3 = icmp slt i32 %3, 10, !dbg !44
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !45

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !46
  %idxprom = sext i32 %4 to i64, !dbg !48
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !48
  store i32 1, i32* %arrayidx, align 4, !dbg !49
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !53
  %cmp5 = icmp slt i32 %5, 10, !dbg !55
  br i1 %cmp5, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !57
  %idxprom6 = sext i32 %6 to i64, !dbg !59
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !59
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !59
  call void @printIntLine(i32 %7), !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !62
  %inc = add nsw i32 %8, 1, !dbg !62
  store i32 %inc, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !67

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !68
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !70

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_07_good() #0 !dbg !72 {
entry:
  call void @goodB2G1(), !dbg !73
  call void @goodB2G2(), !dbg !74
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__CWE839_negative_07_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  call void @CWE124_Buffer_Underwrite__CWE839_negative_07_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !98 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 -1, i32* %data, align 4, !dbg !101
  %0 = load i32, i32* @staticFive, align 4, !dbg !102
  %cmp = icmp eq i32 %0, 5, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !106
  br label %if.end, !dbg !108

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !109
  %cmp1 = icmp ne i32 %1, 5, !dbg !111
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !112

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !113
  br label %if.end11, !dbg !115

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !116, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !121
  %3 = load i32, i32* %data, align 4, !dbg !122
  %cmp3 = icmp sge i32 %3, 0, !dbg !124
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !125

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !126
  %cmp4 = icmp slt i32 %4, 10, !dbg !127
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !128

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !129
  %idxprom = sext i32 %5 to i64, !dbg !131
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !131
  store i32 1, i32* %arrayidx, align 4, !dbg !132
  store i32 0, i32* %i, align 4, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !136
  %cmp6 = icmp slt i32 %6, 10, !dbg !138
  br i1 %cmp6, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !140
  %idxprom7 = sext i32 %7 to i64, !dbg !142
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !142
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !142
  call void @printIntLine(i32 %8), !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !145
  %inc = add nsw i32 %9, 1, !dbg !145
  store i32 %inc, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !149

if.else9:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !150
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then2
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !153 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !154, metadata !DIExpression()), !dbg !155
  store i32 -1, i32* %data, align 4, !dbg !156
  %0 = load i32, i32* @staticFive, align 4, !dbg !157
  %cmp = icmp eq i32 %0, 5, !dbg !159
  br i1 %cmp, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !161
  br label %if.end, !dbg !163

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !164
  %cmp1 = icmp eq i32 %1, 5, !dbg !166
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !167

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !172, metadata !DIExpression()), !dbg !173
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !173
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !173
  %3 = load i32, i32* %data, align 4, !dbg !174
  %cmp3 = icmp sge i32 %3, 0, !dbg !176
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !177

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !178
  %cmp4 = icmp slt i32 %4, 10, !dbg !179
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !180

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !181
  %idxprom = sext i32 %5 to i64, !dbg !183
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !183
  store i32 1, i32* %arrayidx, align 4, !dbg !184
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !188
  %cmp6 = icmp slt i32 %6, 10, !dbg !190
  br i1 %cmp6, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !192
  %idxprom7 = sext i32 %7 to i64, !dbg !194
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !194
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !194
  call void @printIntLine(i32 %8), !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %9, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !201

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !202
  br label %if.end9

if.end9:                                          ; preds = %if.else, %for.end
  br label %if.end10, !dbg !204

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !205
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !206 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 -1, i32* %data, align 4, !dbg !209
  %0 = load i32, i32* @staticFive, align 4, !dbg !210
  %cmp = icmp ne i32 %0, 5, !dbg !212
  br i1 %cmp, label %if.then, label %if.else, !dbg !213

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !214
  br label %if.end, !dbg !216

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !217
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !219
  %cmp1 = icmp eq i32 %1, 5, !dbg !221
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !222

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !223, metadata !DIExpression()), !dbg !226
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !227, metadata !DIExpression()), !dbg !228
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !228
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !228
  %3 = load i32, i32* %data, align 4, !dbg !229
  %cmp3 = icmp slt i32 %3, 10, !dbg !231
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !232

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !233
  %idxprom = sext i32 %4 to i64, !dbg !235
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !235
  store i32 1, i32* %arrayidx, align 4, !dbg !236
  store i32 0, i32* %i, align 4, !dbg !237
  br label %for.cond, !dbg !239

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !240
  %cmp5 = icmp slt i32 %5, 10, !dbg !242
  br i1 %cmp5, label %for.body, label %for.end, !dbg !243

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !244
  %idxprom6 = sext i32 %6 to i64, !dbg !246
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !246
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !246
  call void @printIntLine(i32 %7), !dbg !247
  br label %for.inc, !dbg !248

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !249
  %inc = add nsw i32 %8, 1, !dbg !249
  store i32 %inc, i32* %i, align 4, !dbg !249
  br label %for.cond, !dbg !250, !llvm.loop !251

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !253

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !254
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !256

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !257
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !258 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !259, metadata !DIExpression()), !dbg !260
  store i32 -1, i32* %data, align 4, !dbg !261
  %0 = load i32, i32* @staticFive, align 4, !dbg !262
  %cmp = icmp eq i32 %0, 5, !dbg !264
  br i1 %cmp, label %if.then, label %if.end, !dbg !265

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !266
  br label %if.end, !dbg !268

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !269
  %cmp1 = icmp eq i32 %1, 5, !dbg !271
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !272

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !273, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !277, metadata !DIExpression()), !dbg !278
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !278
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !278
  %3 = load i32, i32* %data, align 4, !dbg !279
  %cmp3 = icmp slt i32 %3, 10, !dbg !281
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !282

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !283
  %idxprom = sext i32 %4 to i64, !dbg !285
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !285
  store i32 1, i32* %arrayidx, align 4, !dbg !286
  store i32 0, i32* %i, align 4, !dbg !287
  br label %for.cond, !dbg !289

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !290
  %cmp5 = icmp slt i32 %5, 10, !dbg !292
  br i1 %cmp5, label %for.body, label %for.end, !dbg !293

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !294
  %idxprom6 = sext i32 %6 to i64, !dbg !296
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !296
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !296
  call void @printIntLine(i32 %7), !dbg !297
  br label %for.inc, !dbg !298

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !299
  %inc = add nsw i32 %8, 1, !dbg !299
  store i32 %inc, i32* %i, align 4, !dbg !299
  br label %for.cond, !dbg !300, !llvm.loop !301

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !303

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !304
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !306

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !307
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !9)
!20 = !DILocation(line: 29, column: 9, scope: !16)
!21 = !DILocation(line: 31, column: 10, scope: !16)
!22 = !DILocation(line: 32, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!24 = !DILocation(line: 32, column: 18, scope: !23)
!25 = !DILocation(line: 32, column: 8, scope: !16)
!26 = !DILocation(line: 35, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !8, line: 33, column: 5)
!28 = !DILocation(line: 36, column: 5, scope: !27)
!29 = !DILocation(line: 37, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !8, line: 37, column: 8)
!31 = !DILocation(line: 37, column: 18, scope: !30)
!32 = !DILocation(line: 37, column: 8, scope: !16)
!33 = !DILocalVariable(name: "i", scope: !34, file: !8, line: 40, type: !9)
!34 = distinct !DILexicalBlock(scope: !35, file: !8, line: 39, column: 9)
!35 = distinct !DILexicalBlock(scope: !30, file: !8, line: 38, column: 5)
!36 = !DILocation(line: 40, column: 17, scope: !34)
!37 = !DILocalVariable(name: "buffer", scope: !34, file: !8, line: 41, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 320, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 10)
!41 = !DILocation(line: 41, column: 17, scope: !34)
!42 = !DILocation(line: 44, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !8, line: 44, column: 17)
!44 = !DILocation(line: 44, column: 22, scope: !43)
!45 = !DILocation(line: 44, column: 17, scope: !34)
!46 = !DILocation(line: 46, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !8, line: 45, column: 13)
!48 = !DILocation(line: 46, column: 17, scope: !47)
!49 = !DILocation(line: 46, column: 30, scope: !47)
!50 = !DILocation(line: 48, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !8, line: 48, column: 17)
!52 = !DILocation(line: 48, column: 21, scope: !51)
!53 = !DILocation(line: 48, column: 28, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !8, line: 48, column: 17)
!55 = !DILocation(line: 48, column: 30, scope: !54)
!56 = !DILocation(line: 48, column: 17, scope: !51)
!57 = !DILocation(line: 50, column: 41, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !8, line: 49, column: 17)
!59 = !DILocation(line: 50, column: 34, scope: !58)
!60 = !DILocation(line: 50, column: 21, scope: !58)
!61 = !DILocation(line: 51, column: 17, scope: !58)
!62 = !DILocation(line: 48, column: 37, scope: !54)
!63 = !DILocation(line: 48, column: 17, scope: !54)
!64 = distinct !{!64, !56, !65, !66}
!65 = !DILocation(line: 51, column: 17, scope: !51)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 52, column: 13, scope: !47)
!68 = !DILocation(line: 55, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !43, file: !8, line: 54, column: 13)
!70 = !DILocation(line: 58, column: 5, scope: !35)
!71 = !DILocation(line: 59, column: 1, scope: !16)
!72 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_07_good", scope: !8, file: !8, line: 215, type: !17, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 217, column: 5, scope: !72)
!74 = !DILocation(line: 218, column: 5, scope: !72)
!75 = !DILocation(line: 219, column: 5, scope: !72)
!76 = !DILocation(line: 220, column: 5, scope: !72)
!77 = !DILocation(line: 221, column: 1, scope: !72)
!78 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 232, type: !79, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!9, !9, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !8, line: 232, type: !9)
!85 = !DILocation(line: 232, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !8, line: 232, type: !81)
!87 = !DILocation(line: 232, column: 27, scope: !78)
!88 = !DILocation(line: 235, column: 22, scope: !78)
!89 = !DILocation(line: 235, column: 12, scope: !78)
!90 = !DILocation(line: 235, column: 5, scope: !78)
!91 = !DILocation(line: 237, column: 5, scope: !78)
!92 = !DILocation(line: 238, column: 5, scope: !78)
!93 = !DILocation(line: 239, column: 5, scope: !78)
!94 = !DILocation(line: 242, column: 5, scope: !78)
!95 = !DILocation(line: 243, column: 5, scope: !78)
!96 = !DILocation(line: 244, column: 5, scope: !78)
!97 = !DILocation(line: 246, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodB2G1", scope: !8, file: !8, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !8, line: 68, type: !9)
!100 = !DILocation(line: 68, column: 9, scope: !98)
!101 = !DILocation(line: 70, column: 10, scope: !98)
!102 = !DILocation(line: 71, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !8, line: 71, column: 8)
!104 = !DILocation(line: 71, column: 18, scope: !103)
!105 = !DILocation(line: 71, column: 8, scope: !98)
!106 = !DILocation(line: 74, column: 14, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !8, line: 72, column: 5)
!108 = !DILocation(line: 75, column: 5, scope: !107)
!109 = !DILocation(line: 76, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !98, file: !8, line: 76, column: 8)
!111 = !DILocation(line: 76, column: 18, scope: !110)
!112 = !DILocation(line: 76, column: 8, scope: !98)
!113 = !DILocation(line: 79, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !8, line: 77, column: 5)
!115 = !DILocation(line: 80, column: 5, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !8, line: 84, type: !9)
!117 = distinct !DILexicalBlock(scope: !118, file: !8, line: 83, column: 9)
!118 = distinct !DILexicalBlock(scope: !110, file: !8, line: 82, column: 5)
!119 = !DILocation(line: 84, column: 17, scope: !117)
!120 = !DILocalVariable(name: "buffer", scope: !117, file: !8, line: 85, type: !38)
!121 = !DILocation(line: 85, column: 17, scope: !117)
!122 = !DILocation(line: 87, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !8, line: 87, column: 17)
!124 = !DILocation(line: 87, column: 22, scope: !123)
!125 = !DILocation(line: 87, column: 27, scope: !123)
!126 = !DILocation(line: 87, column: 30, scope: !123)
!127 = !DILocation(line: 87, column: 35, scope: !123)
!128 = !DILocation(line: 87, column: 17, scope: !117)
!129 = !DILocation(line: 89, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !123, file: !8, line: 88, column: 13)
!131 = !DILocation(line: 89, column: 17, scope: !130)
!132 = !DILocation(line: 89, column: 30, scope: !130)
!133 = !DILocation(line: 91, column: 23, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !8, line: 91, column: 17)
!135 = !DILocation(line: 91, column: 21, scope: !134)
!136 = !DILocation(line: 91, column: 28, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !8, line: 91, column: 17)
!138 = !DILocation(line: 91, column: 30, scope: !137)
!139 = !DILocation(line: 91, column: 17, scope: !134)
!140 = !DILocation(line: 93, column: 41, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !8, line: 92, column: 17)
!142 = !DILocation(line: 93, column: 34, scope: !141)
!143 = !DILocation(line: 93, column: 21, scope: !141)
!144 = !DILocation(line: 94, column: 17, scope: !141)
!145 = !DILocation(line: 91, column: 37, scope: !137)
!146 = !DILocation(line: 91, column: 17, scope: !137)
!147 = distinct !{!147, !139, !148, !66}
!148 = !DILocation(line: 94, column: 17, scope: !134)
!149 = !DILocation(line: 95, column: 13, scope: !130)
!150 = !DILocation(line: 98, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !123, file: !8, line: 97, column: 13)
!152 = !DILocation(line: 102, column: 1, scope: !98)
!153 = distinct !DISubprogram(name: "goodB2G2", scope: !8, file: !8, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!154 = !DILocalVariable(name: "data", scope: !153, file: !8, line: 107, type: !9)
!155 = !DILocation(line: 107, column: 9, scope: !153)
!156 = !DILocation(line: 109, column: 10, scope: !153)
!157 = !DILocation(line: 110, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !8, line: 110, column: 8)
!159 = !DILocation(line: 110, column: 18, scope: !158)
!160 = !DILocation(line: 110, column: 8, scope: !153)
!161 = !DILocation(line: 113, column: 14, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !8, line: 111, column: 5)
!163 = !DILocation(line: 114, column: 5, scope: !162)
!164 = !DILocation(line: 115, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !153, file: !8, line: 115, column: 8)
!166 = !DILocation(line: 115, column: 18, scope: !165)
!167 = !DILocation(line: 115, column: 8, scope: !153)
!168 = !DILocalVariable(name: "i", scope: !169, file: !8, line: 118, type: !9)
!169 = distinct !DILexicalBlock(scope: !170, file: !8, line: 117, column: 9)
!170 = distinct !DILexicalBlock(scope: !165, file: !8, line: 116, column: 5)
!171 = !DILocation(line: 118, column: 17, scope: !169)
!172 = !DILocalVariable(name: "buffer", scope: !169, file: !8, line: 119, type: !38)
!173 = !DILocation(line: 119, column: 17, scope: !169)
!174 = !DILocation(line: 121, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !169, file: !8, line: 121, column: 17)
!176 = !DILocation(line: 121, column: 22, scope: !175)
!177 = !DILocation(line: 121, column: 27, scope: !175)
!178 = !DILocation(line: 121, column: 30, scope: !175)
!179 = !DILocation(line: 121, column: 35, scope: !175)
!180 = !DILocation(line: 121, column: 17, scope: !169)
!181 = !DILocation(line: 123, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !175, file: !8, line: 122, column: 13)
!183 = !DILocation(line: 123, column: 17, scope: !182)
!184 = !DILocation(line: 123, column: 30, scope: !182)
!185 = !DILocation(line: 125, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !8, line: 125, column: 17)
!187 = !DILocation(line: 125, column: 21, scope: !186)
!188 = !DILocation(line: 125, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !8, line: 125, column: 17)
!190 = !DILocation(line: 125, column: 30, scope: !189)
!191 = !DILocation(line: 125, column: 17, scope: !186)
!192 = !DILocation(line: 127, column: 41, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !8, line: 126, column: 17)
!194 = !DILocation(line: 127, column: 34, scope: !193)
!195 = !DILocation(line: 127, column: 21, scope: !193)
!196 = !DILocation(line: 128, column: 17, scope: !193)
!197 = !DILocation(line: 125, column: 37, scope: !189)
!198 = !DILocation(line: 125, column: 17, scope: !189)
!199 = distinct !{!199, !191, !200, !66}
!200 = !DILocation(line: 128, column: 17, scope: !186)
!201 = !DILocation(line: 129, column: 13, scope: !182)
!202 = !DILocation(line: 132, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !175, file: !8, line: 131, column: 13)
!204 = !DILocation(line: 135, column: 5, scope: !170)
!205 = !DILocation(line: 136, column: 1, scope: !153)
!206 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 139, type: !17, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!207 = !DILocalVariable(name: "data", scope: !206, file: !8, line: 141, type: !9)
!208 = !DILocation(line: 141, column: 9, scope: !206)
!209 = !DILocation(line: 143, column: 10, scope: !206)
!210 = !DILocation(line: 144, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !8, line: 144, column: 8)
!212 = !DILocation(line: 144, column: 18, scope: !211)
!213 = !DILocation(line: 144, column: 8, scope: !206)
!214 = !DILocation(line: 147, column: 9, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !8, line: 145, column: 5)
!216 = !DILocation(line: 148, column: 5, scope: !215)
!217 = !DILocation(line: 153, column: 14, scope: !218)
!218 = distinct !DILexicalBlock(scope: !211, file: !8, line: 150, column: 5)
!219 = !DILocation(line: 155, column: 8, scope: !220)
!220 = distinct !DILexicalBlock(scope: !206, file: !8, line: 155, column: 8)
!221 = !DILocation(line: 155, column: 18, scope: !220)
!222 = !DILocation(line: 155, column: 8, scope: !206)
!223 = !DILocalVariable(name: "i", scope: !224, file: !8, line: 158, type: !9)
!224 = distinct !DILexicalBlock(scope: !225, file: !8, line: 157, column: 9)
!225 = distinct !DILexicalBlock(scope: !220, file: !8, line: 156, column: 5)
!226 = !DILocation(line: 158, column: 17, scope: !224)
!227 = !DILocalVariable(name: "buffer", scope: !224, file: !8, line: 159, type: !38)
!228 = !DILocation(line: 159, column: 17, scope: !224)
!229 = !DILocation(line: 162, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !224, file: !8, line: 162, column: 17)
!231 = !DILocation(line: 162, column: 22, scope: !230)
!232 = !DILocation(line: 162, column: 17, scope: !224)
!233 = !DILocation(line: 164, column: 24, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !8, line: 163, column: 13)
!235 = !DILocation(line: 164, column: 17, scope: !234)
!236 = !DILocation(line: 164, column: 30, scope: !234)
!237 = !DILocation(line: 166, column: 23, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !8, line: 166, column: 17)
!239 = !DILocation(line: 166, column: 21, scope: !238)
!240 = !DILocation(line: 166, column: 28, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !8, line: 166, column: 17)
!242 = !DILocation(line: 166, column: 30, scope: !241)
!243 = !DILocation(line: 166, column: 17, scope: !238)
!244 = !DILocation(line: 168, column: 41, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !8, line: 167, column: 17)
!246 = !DILocation(line: 168, column: 34, scope: !245)
!247 = !DILocation(line: 168, column: 21, scope: !245)
!248 = !DILocation(line: 169, column: 17, scope: !245)
!249 = !DILocation(line: 166, column: 37, scope: !241)
!250 = !DILocation(line: 166, column: 17, scope: !241)
!251 = distinct !{!251, !243, !252, !66}
!252 = !DILocation(line: 169, column: 17, scope: !238)
!253 = !DILocation(line: 170, column: 13, scope: !234)
!254 = !DILocation(line: 173, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !230, file: !8, line: 172, column: 13)
!256 = !DILocation(line: 176, column: 5, scope: !225)
!257 = !DILocation(line: 177, column: 1, scope: !206)
!258 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 180, type: !17, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!259 = !DILocalVariable(name: "data", scope: !258, file: !8, line: 182, type: !9)
!260 = !DILocation(line: 182, column: 9, scope: !258)
!261 = !DILocation(line: 184, column: 10, scope: !258)
!262 = !DILocation(line: 185, column: 8, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !8, line: 185, column: 8)
!264 = !DILocation(line: 185, column: 18, scope: !263)
!265 = !DILocation(line: 185, column: 8, scope: !258)
!266 = !DILocation(line: 189, column: 14, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !8, line: 186, column: 5)
!268 = !DILocation(line: 190, column: 5, scope: !267)
!269 = !DILocation(line: 191, column: 8, scope: !270)
!270 = distinct !DILexicalBlock(scope: !258, file: !8, line: 191, column: 8)
!271 = !DILocation(line: 191, column: 18, scope: !270)
!272 = !DILocation(line: 191, column: 8, scope: !258)
!273 = !DILocalVariable(name: "i", scope: !274, file: !8, line: 194, type: !9)
!274 = distinct !DILexicalBlock(scope: !275, file: !8, line: 193, column: 9)
!275 = distinct !DILexicalBlock(scope: !270, file: !8, line: 192, column: 5)
!276 = !DILocation(line: 194, column: 17, scope: !274)
!277 = !DILocalVariable(name: "buffer", scope: !274, file: !8, line: 195, type: !38)
!278 = !DILocation(line: 195, column: 17, scope: !274)
!279 = !DILocation(line: 198, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !274, file: !8, line: 198, column: 17)
!281 = !DILocation(line: 198, column: 22, scope: !280)
!282 = !DILocation(line: 198, column: 17, scope: !274)
!283 = !DILocation(line: 200, column: 24, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !8, line: 199, column: 13)
!285 = !DILocation(line: 200, column: 17, scope: !284)
!286 = !DILocation(line: 200, column: 30, scope: !284)
!287 = !DILocation(line: 202, column: 23, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !8, line: 202, column: 17)
!289 = !DILocation(line: 202, column: 21, scope: !288)
!290 = !DILocation(line: 202, column: 28, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !8, line: 202, column: 17)
!292 = !DILocation(line: 202, column: 30, scope: !291)
!293 = !DILocation(line: 202, column: 17, scope: !288)
!294 = !DILocation(line: 204, column: 41, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !8, line: 203, column: 17)
!296 = !DILocation(line: 204, column: 34, scope: !295)
!297 = !DILocation(line: 204, column: 21, scope: !295)
!298 = !DILocation(line: 205, column: 17, scope: !295)
!299 = !DILocation(line: 202, column: 37, scope: !291)
!300 = !DILocation(line: 202, column: 17, scope: !291)
!301 = distinct !{!301, !293, !302, !66}
!302 = !DILocation(line: 205, column: 17, scope: !288)
!303 = !DILocation(line: 206, column: 13, scope: !284)
!304 = !DILocation(line: 209, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !280, file: !8, line: 208, column: 13)
!306 = !DILocation(line: 212, column: 5, scope: !275)
!307 = !DILocation(line: 213, column: 1, scope: !258)
