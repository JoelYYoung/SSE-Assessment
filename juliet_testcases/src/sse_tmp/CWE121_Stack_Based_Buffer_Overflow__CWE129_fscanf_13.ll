; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !23
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !25
  br label %if.end, !dbg !26

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !27
  %cmp1 = icmp eq i32 %2, 5, !dbg !29
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !30

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !35, metadata !DIExpression()), !dbg !39
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !39
  %4 = load i32, i32* %data, align 4, !dbg !40
  %cmp3 = icmp sge i32 %4, 0, !dbg !42
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !43

if.then4:                                         ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !44
  %idxprom = sext i32 %5 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !46
  store i32 1, i32* %arrayidx, align 4, !dbg !47
  store i32 0, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.then4
  %6 = load i32, i32* %i, align 4, !dbg !51
  %cmp5 = icmp slt i32 %6, 10, !dbg !53
  br i1 %cmp5, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !55
  %idxprom6 = sext i32 %7 to i64, !dbg !57
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !57
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !57
  call void @printIntLine(i32 %8), !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !60
  %inc = add nsw i32 %9, 1, !dbg !60
  store i32 %inc, i32* %i, align 4, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !65

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !68

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13_good() #0 !dbg !70 {
entry:
  call void @goodB2G1(), !dbg !71
  call void @goodB2G2(), !dbg !72
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !96 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32 -1, i32* %data, align 4, !dbg !99
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !100
  %cmp = icmp eq i32 %0, 5, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !104
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !106
  br label %if.end, !dbg !107

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !108
  %cmp1 = icmp ne i32 %2, 5, !dbg !110
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !111

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !112
  br label %if.end11, !dbg !114

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !115, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !119, metadata !DIExpression()), !dbg !120
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !120
  %4 = load i32, i32* %data, align 4, !dbg !121
  %cmp3 = icmp sge i32 %4, 0, !dbg !123
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !124

land.lhs.true:                                    ; preds = %if.else
  %5 = load i32, i32* %data, align 4, !dbg !125
  %cmp4 = icmp slt i32 %5, 10, !dbg !126
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !127

if.then5:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !128
  %idxprom = sext i32 %6 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !130
  store i32 1, i32* %arrayidx, align 4, !dbg !131
  store i32 0, i32* %i, align 4, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.then5
  %7 = load i32, i32* %i, align 4, !dbg !135
  %cmp6 = icmp slt i32 %7, 10, !dbg !137
  br i1 %cmp6, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !139
  %idxprom7 = sext i32 %8 to i64, !dbg !141
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !141
  %9 = load i32, i32* %arrayidx8, align 4, !dbg !141
  call void @printIntLine(i32 %9), !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !144
  %inc = add nsw i32 %10, 1, !dbg !144
  store i32 %inc, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !148

if.else9:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !149
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then2
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !152 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !153, metadata !DIExpression()), !dbg !154
  store i32 -1, i32* %data, align 4, !dbg !155
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !156
  %cmp = icmp eq i32 %0, 5, !dbg !158
  br i1 %cmp, label %if.then, label %if.end, !dbg !159

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !160
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !162
  br label %if.end, !dbg !163

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !164
  %cmp1 = icmp eq i32 %2, 5, !dbg !166
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !167

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !172, metadata !DIExpression()), !dbg !173
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !173
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !173
  %4 = load i32, i32* %data, align 4, !dbg !174
  %cmp3 = icmp sge i32 %4, 0, !dbg !176
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !177

land.lhs.true:                                    ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !178
  %cmp4 = icmp slt i32 %5, 10, !dbg !179
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !180

if.then5:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !181
  %idxprom = sext i32 %6 to i64, !dbg !183
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !183
  store i32 1, i32* %arrayidx, align 4, !dbg !184
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.then5
  %7 = load i32, i32* %i, align 4, !dbg !188
  %cmp6 = icmp slt i32 %7, 10, !dbg !190
  br i1 %cmp6, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !192
  %idxprom7 = sext i32 %8 to i64, !dbg !194
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !194
  %9 = load i32, i32* %arrayidx8, align 4, !dbg !194
  call void @printIntLine(i32 %9), !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %10, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !201

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !202
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
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !210
  %cmp = icmp ne i32 %0, 5, !dbg !212
  br i1 %cmp, label %if.then, label %if.else, !dbg !213

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !214
  br label %if.end, !dbg !216

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !217
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !219
  %cmp1 = icmp eq i32 %1, 5, !dbg !221
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !222

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !223, metadata !DIExpression()), !dbg !226
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !227, metadata !DIExpression()), !dbg !228
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !228
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !228
  %3 = load i32, i32* %data, align 4, !dbg !229
  %cmp3 = icmp sge i32 %3, 0, !dbg !231
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
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !254
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
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !262
  %cmp = icmp eq i32 %0, 5, !dbg !264
  br i1 %cmp, label %if.then, label %if.end, !dbg !265

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !266
  br label %if.end, !dbg !268

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !269
  %cmp1 = icmp eq i32 %1, 5, !dbg !271
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !272

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !273, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !277, metadata !DIExpression()), !dbg !278
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !278
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !278
  %3 = load i32, i32* %data, align 4, !dbg !279
  %cmp3 = icmp sge i32 %3, 0, !dbg !281
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
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !304
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !306

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !307
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 25, scope: !20)
!22 = !DILocation(line: 27, column: 8, scope: !11)
!23 = !DILocation(line: 30, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !12, line: 28, column: 5)
!25 = !DILocation(line: 30, column: 9, scope: !24)
!26 = !DILocation(line: 31, column: 5, scope: !24)
!27 = !DILocation(line: 32, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!29 = !DILocation(line: 32, column: 25, scope: !28)
!30 = !DILocation(line: 32, column: 8, scope: !11)
!31 = !DILocalVariable(name: "i", scope: !32, file: !12, line: 35, type: !16)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 34, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !12, line: 33, column: 5)
!34 = !DILocation(line: 35, column: 17, scope: !32)
!35 = !DILocalVariable(name: "buffer", scope: !32, file: !12, line: 36, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 10)
!39 = !DILocation(line: 36, column: 17, scope: !32)
!40 = !DILocation(line: 39, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !12, line: 39, column: 17)
!42 = !DILocation(line: 39, column: 22, scope: !41)
!43 = !DILocation(line: 39, column: 17, scope: !32)
!44 = !DILocation(line: 41, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 40, column: 13)
!46 = !DILocation(line: 41, column: 17, scope: !45)
!47 = !DILocation(line: 41, column: 30, scope: !45)
!48 = !DILocation(line: 43, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 43, column: 17)
!50 = !DILocation(line: 43, column: 21, scope: !49)
!51 = !DILocation(line: 43, column: 28, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 43, column: 17)
!53 = !DILocation(line: 43, column: 30, scope: !52)
!54 = !DILocation(line: 43, column: 17, scope: !49)
!55 = !DILocation(line: 45, column: 41, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 44, column: 17)
!57 = !DILocation(line: 45, column: 34, scope: !56)
!58 = !DILocation(line: 45, column: 21, scope: !56)
!59 = !DILocation(line: 46, column: 17, scope: !56)
!60 = !DILocation(line: 43, column: 37, scope: !52)
!61 = !DILocation(line: 43, column: 17, scope: !52)
!62 = distinct !{!62, !54, !63, !64}
!63 = !DILocation(line: 46, column: 17, scope: !49)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 47, column: 13, scope: !45)
!66 = !DILocation(line: 50, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !41, file: !12, line: 49, column: 13)
!68 = !DILocation(line: 53, column: 5, scope: !33)
!69 = !DILocation(line: 54, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_13_good", scope: !12, file: !12, line: 210, type: !13, scopeLine: 211, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 212, column: 5, scope: !70)
!72 = !DILocation(line: 213, column: 5, scope: !70)
!73 = !DILocation(line: 214, column: 5, scope: !70)
!74 = !DILocation(line: 215, column: 5, scope: !70)
!75 = !DILocation(line: 216, column: 1, scope: !70)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 227, type: !77, scopeLine: 228, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!16, !16, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 227, type: !16)
!83 = !DILocation(line: 227, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 227, type: !79)
!85 = !DILocation(line: 227, column: 27, scope: !76)
!86 = !DILocation(line: 230, column: 22, scope: !76)
!87 = !DILocation(line: 230, column: 12, scope: !76)
!88 = !DILocation(line: 230, column: 5, scope: !76)
!89 = !DILocation(line: 232, column: 5, scope: !76)
!90 = !DILocation(line: 233, column: 5, scope: !76)
!91 = !DILocation(line: 234, column: 5, scope: !76)
!92 = !DILocation(line: 237, column: 5, scope: !76)
!93 = !DILocation(line: 238, column: 5, scope: !76)
!94 = !DILocation(line: 239, column: 5, scope: !76)
!95 = !DILocation(line: 241, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 63, type: !16)
!98 = !DILocation(line: 63, column: 9, scope: !96)
!99 = !DILocation(line: 65, column: 10, scope: !96)
!100 = !DILocation(line: 66, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !12, line: 66, column: 8)
!102 = !DILocation(line: 66, column: 25, scope: !101)
!103 = !DILocation(line: 66, column: 8, scope: !96)
!104 = !DILocation(line: 69, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !12, line: 67, column: 5)
!106 = !DILocation(line: 69, column: 9, scope: !105)
!107 = !DILocation(line: 70, column: 5, scope: !105)
!108 = !DILocation(line: 71, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !96, file: !12, line: 71, column: 8)
!110 = !DILocation(line: 71, column: 25, scope: !109)
!111 = !DILocation(line: 71, column: 8, scope: !96)
!112 = !DILocation(line: 74, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 72, column: 5)
!114 = !DILocation(line: 75, column: 5, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !12, line: 79, type: !16)
!116 = distinct !DILexicalBlock(scope: !117, file: !12, line: 78, column: 9)
!117 = distinct !DILexicalBlock(scope: !109, file: !12, line: 77, column: 5)
!118 = !DILocation(line: 79, column: 17, scope: !116)
!119 = !DILocalVariable(name: "buffer", scope: !116, file: !12, line: 80, type: !36)
!120 = !DILocation(line: 80, column: 17, scope: !116)
!121 = !DILocation(line: 82, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !12, line: 82, column: 17)
!123 = !DILocation(line: 82, column: 22, scope: !122)
!124 = !DILocation(line: 82, column: 27, scope: !122)
!125 = !DILocation(line: 82, column: 30, scope: !122)
!126 = !DILocation(line: 82, column: 35, scope: !122)
!127 = !DILocation(line: 82, column: 17, scope: !116)
!128 = !DILocation(line: 84, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !122, file: !12, line: 83, column: 13)
!130 = !DILocation(line: 84, column: 17, scope: !129)
!131 = !DILocation(line: 84, column: 30, scope: !129)
!132 = !DILocation(line: 86, column: 23, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 86, column: 17)
!134 = !DILocation(line: 86, column: 21, scope: !133)
!135 = !DILocation(line: 86, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 86, column: 17)
!137 = !DILocation(line: 86, column: 30, scope: !136)
!138 = !DILocation(line: 86, column: 17, scope: !133)
!139 = !DILocation(line: 88, column: 41, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !12, line: 87, column: 17)
!141 = !DILocation(line: 88, column: 34, scope: !140)
!142 = !DILocation(line: 88, column: 21, scope: !140)
!143 = !DILocation(line: 89, column: 17, scope: !140)
!144 = !DILocation(line: 86, column: 37, scope: !136)
!145 = !DILocation(line: 86, column: 17, scope: !136)
!146 = distinct !{!146, !138, !147, !64}
!147 = !DILocation(line: 89, column: 17, scope: !133)
!148 = !DILocation(line: 90, column: 13, scope: !129)
!149 = !DILocation(line: 93, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !122, file: !12, line: 92, column: 13)
!151 = !DILocation(line: 97, column: 1, scope: !96)
!152 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocalVariable(name: "data", scope: !152, file: !12, line: 102, type: !16)
!154 = !DILocation(line: 102, column: 9, scope: !152)
!155 = !DILocation(line: 104, column: 10, scope: !152)
!156 = !DILocation(line: 105, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !12, line: 105, column: 8)
!158 = !DILocation(line: 105, column: 25, scope: !157)
!159 = !DILocation(line: 105, column: 8, scope: !152)
!160 = !DILocation(line: 108, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !12, line: 106, column: 5)
!162 = !DILocation(line: 108, column: 9, scope: !161)
!163 = !DILocation(line: 109, column: 5, scope: !161)
!164 = !DILocation(line: 110, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !152, file: !12, line: 110, column: 8)
!166 = !DILocation(line: 110, column: 25, scope: !165)
!167 = !DILocation(line: 110, column: 8, scope: !152)
!168 = !DILocalVariable(name: "i", scope: !169, file: !12, line: 113, type: !16)
!169 = distinct !DILexicalBlock(scope: !170, file: !12, line: 112, column: 9)
!170 = distinct !DILexicalBlock(scope: !165, file: !12, line: 111, column: 5)
!171 = !DILocation(line: 113, column: 17, scope: !169)
!172 = !DILocalVariable(name: "buffer", scope: !169, file: !12, line: 114, type: !36)
!173 = !DILocation(line: 114, column: 17, scope: !169)
!174 = !DILocation(line: 116, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !169, file: !12, line: 116, column: 17)
!176 = !DILocation(line: 116, column: 22, scope: !175)
!177 = !DILocation(line: 116, column: 27, scope: !175)
!178 = !DILocation(line: 116, column: 30, scope: !175)
!179 = !DILocation(line: 116, column: 35, scope: !175)
!180 = !DILocation(line: 116, column: 17, scope: !169)
!181 = !DILocation(line: 118, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !175, file: !12, line: 117, column: 13)
!183 = !DILocation(line: 118, column: 17, scope: !182)
!184 = !DILocation(line: 118, column: 30, scope: !182)
!185 = !DILocation(line: 120, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !12, line: 120, column: 17)
!187 = !DILocation(line: 120, column: 21, scope: !186)
!188 = !DILocation(line: 120, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !12, line: 120, column: 17)
!190 = !DILocation(line: 120, column: 30, scope: !189)
!191 = !DILocation(line: 120, column: 17, scope: !186)
!192 = !DILocation(line: 122, column: 41, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !12, line: 121, column: 17)
!194 = !DILocation(line: 122, column: 34, scope: !193)
!195 = !DILocation(line: 122, column: 21, scope: !193)
!196 = !DILocation(line: 123, column: 17, scope: !193)
!197 = !DILocation(line: 120, column: 37, scope: !189)
!198 = !DILocation(line: 120, column: 17, scope: !189)
!199 = distinct !{!199, !191, !200, !64}
!200 = !DILocation(line: 123, column: 17, scope: !186)
!201 = !DILocation(line: 124, column: 13, scope: !182)
!202 = !DILocation(line: 127, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !175, file: !12, line: 126, column: 13)
!204 = !DILocation(line: 130, column: 5, scope: !170)
!205 = !DILocation(line: 131, column: 1, scope: !152)
!206 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 134, type: !13, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!207 = !DILocalVariable(name: "data", scope: !206, file: !12, line: 136, type: !16)
!208 = !DILocation(line: 136, column: 9, scope: !206)
!209 = !DILocation(line: 138, column: 10, scope: !206)
!210 = !DILocation(line: 139, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !12, line: 139, column: 8)
!212 = !DILocation(line: 139, column: 25, scope: !211)
!213 = !DILocation(line: 139, column: 8, scope: !206)
!214 = !DILocation(line: 142, column: 9, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !12, line: 140, column: 5)
!216 = !DILocation(line: 143, column: 5, scope: !215)
!217 = !DILocation(line: 148, column: 14, scope: !218)
!218 = distinct !DILexicalBlock(scope: !211, file: !12, line: 145, column: 5)
!219 = !DILocation(line: 150, column: 8, scope: !220)
!220 = distinct !DILexicalBlock(scope: !206, file: !12, line: 150, column: 8)
!221 = !DILocation(line: 150, column: 25, scope: !220)
!222 = !DILocation(line: 150, column: 8, scope: !206)
!223 = !DILocalVariable(name: "i", scope: !224, file: !12, line: 153, type: !16)
!224 = distinct !DILexicalBlock(scope: !225, file: !12, line: 152, column: 9)
!225 = distinct !DILexicalBlock(scope: !220, file: !12, line: 151, column: 5)
!226 = !DILocation(line: 153, column: 17, scope: !224)
!227 = !DILocalVariable(name: "buffer", scope: !224, file: !12, line: 154, type: !36)
!228 = !DILocation(line: 154, column: 17, scope: !224)
!229 = !DILocation(line: 157, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !224, file: !12, line: 157, column: 17)
!231 = !DILocation(line: 157, column: 22, scope: !230)
!232 = !DILocation(line: 157, column: 17, scope: !224)
!233 = !DILocation(line: 159, column: 24, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !12, line: 158, column: 13)
!235 = !DILocation(line: 159, column: 17, scope: !234)
!236 = !DILocation(line: 159, column: 30, scope: !234)
!237 = !DILocation(line: 161, column: 23, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !12, line: 161, column: 17)
!239 = !DILocation(line: 161, column: 21, scope: !238)
!240 = !DILocation(line: 161, column: 28, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !12, line: 161, column: 17)
!242 = !DILocation(line: 161, column: 30, scope: !241)
!243 = !DILocation(line: 161, column: 17, scope: !238)
!244 = !DILocation(line: 163, column: 41, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !12, line: 162, column: 17)
!246 = !DILocation(line: 163, column: 34, scope: !245)
!247 = !DILocation(line: 163, column: 21, scope: !245)
!248 = !DILocation(line: 164, column: 17, scope: !245)
!249 = !DILocation(line: 161, column: 37, scope: !241)
!250 = !DILocation(line: 161, column: 17, scope: !241)
!251 = distinct !{!251, !243, !252, !64}
!252 = !DILocation(line: 164, column: 17, scope: !238)
!253 = !DILocation(line: 165, column: 13, scope: !234)
!254 = !DILocation(line: 168, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !230, file: !12, line: 167, column: 13)
!256 = !DILocation(line: 171, column: 5, scope: !225)
!257 = !DILocation(line: 172, column: 1, scope: !206)
!258 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 175, type: !13, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!259 = !DILocalVariable(name: "data", scope: !258, file: !12, line: 177, type: !16)
!260 = !DILocation(line: 177, column: 9, scope: !258)
!261 = !DILocation(line: 179, column: 10, scope: !258)
!262 = !DILocation(line: 180, column: 8, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !12, line: 180, column: 8)
!264 = !DILocation(line: 180, column: 25, scope: !263)
!265 = !DILocation(line: 180, column: 8, scope: !258)
!266 = !DILocation(line: 184, column: 14, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !12, line: 181, column: 5)
!268 = !DILocation(line: 185, column: 5, scope: !267)
!269 = !DILocation(line: 186, column: 8, scope: !270)
!270 = distinct !DILexicalBlock(scope: !258, file: !12, line: 186, column: 8)
!271 = !DILocation(line: 186, column: 25, scope: !270)
!272 = !DILocation(line: 186, column: 8, scope: !258)
!273 = !DILocalVariable(name: "i", scope: !274, file: !12, line: 189, type: !16)
!274 = distinct !DILexicalBlock(scope: !275, file: !12, line: 188, column: 9)
!275 = distinct !DILexicalBlock(scope: !270, file: !12, line: 187, column: 5)
!276 = !DILocation(line: 189, column: 17, scope: !274)
!277 = !DILocalVariable(name: "buffer", scope: !274, file: !12, line: 190, type: !36)
!278 = !DILocation(line: 190, column: 17, scope: !274)
!279 = !DILocation(line: 193, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !274, file: !12, line: 193, column: 17)
!281 = !DILocation(line: 193, column: 22, scope: !280)
!282 = !DILocation(line: 193, column: 17, scope: !274)
!283 = !DILocation(line: 195, column: 24, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !12, line: 194, column: 13)
!285 = !DILocation(line: 195, column: 17, scope: !284)
!286 = !DILocation(line: 195, column: 30, scope: !284)
!287 = !DILocation(line: 197, column: 23, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !12, line: 197, column: 17)
!289 = !DILocation(line: 197, column: 21, scope: !288)
!290 = !DILocation(line: 197, column: 28, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !12, line: 197, column: 17)
!292 = !DILocation(line: 197, column: 30, scope: !291)
!293 = !DILocation(line: 197, column: 17, scope: !288)
!294 = !DILocation(line: 199, column: 41, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !12, line: 198, column: 17)
!296 = !DILocation(line: 199, column: 34, scope: !295)
!297 = !DILocation(line: 199, column: 21, scope: !295)
!298 = !DILocation(line: 200, column: 17, scope: !295)
!299 = !DILocation(line: 197, column: 37, scope: !291)
!300 = !DILocation(line: 197, column: 17, scope: !291)
!301 = distinct !{!301, !293, !302, !64}
!302 = !DILocation(line: 200, column: 17, scope: !288)
!303 = !DILocation(line: 201, column: 13, scope: !284)
!304 = !DILocation(line: 204, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !280, file: !12, line: 203, column: 13)
!306 = !DILocation(line: 207, column: 5, scope: !275)
!307 = !DILocation(line: 208, column: 1, scope: !258)
