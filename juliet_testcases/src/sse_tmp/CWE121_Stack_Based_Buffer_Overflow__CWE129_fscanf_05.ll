; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  %0 = load i32, i32* @staticTrue, align 4, !dbg !24
  %tobool = icmp ne i32 %0, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !27
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !29
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool1 = icmp ne i32 %2, 0, !dbg !31
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !33

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !38, metadata !DIExpression()), !dbg !42
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !42
  %4 = load i32, i32* %data, align 4, !dbg !43
  %cmp = icmp sge i32 %4, 0, !dbg !45
  br i1 %cmp, label %if.then3, label %if.else, !dbg !46

if.then3:                                         ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !47
  %idxprom = sext i32 %5 to i64, !dbg !49
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !49
  store i32 1, i32* %arrayidx, align 4, !dbg !50
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.then3
  %6 = load i32, i32* %i, align 4, !dbg !54
  %cmp4 = icmp slt i32 %6, 10, !dbg !56
  br i1 %cmp4, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !58
  %idxprom5 = sext i32 %7 to i64, !dbg !60
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !60
  %8 = load i32, i32* %arrayidx6, align 4, !dbg !60
  call void @printIntLine(i32 %8), !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !63
  %inc = add nsw i32 %9, 1, !dbg !63
  store i32 %inc, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !68

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !71

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05_good() #0 !dbg !73 {
entry:
  call void @goodB2G1(), !dbg !74
  call void @goodB2G2(), !dbg !75
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #5, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #5, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !99 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %data, align 4, !dbg !102
  %0 = load i32, i32* @staticTrue, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !106
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !108
  br label %if.end, !dbg !109

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFalse, align 4, !dbg !110
  %tobool1 = icmp ne i32 %2, 0, !dbg !110
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !112

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !113
  br label %if.end10, !dbg !115

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !116, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !120, metadata !DIExpression()), !dbg !121
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !121
  %4 = load i32, i32* %data, align 4, !dbg !122
  %cmp = icmp sge i32 %4, 0, !dbg !124
  br i1 %cmp, label %land.lhs.true, label %if.else8, !dbg !125

land.lhs.true:                                    ; preds = %if.else
  %5 = load i32, i32* %data, align 4, !dbg !126
  %cmp3 = icmp slt i32 %5, 10, !dbg !127
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !128

if.then4:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !129
  %idxprom = sext i32 %6 to i64, !dbg !131
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !131
  store i32 1, i32* %arrayidx, align 4, !dbg !132
  store i32 0, i32* %i, align 4, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.then4
  %7 = load i32, i32* %i, align 4, !dbg !136
  %cmp5 = icmp slt i32 %7, 10, !dbg !138
  br i1 %cmp5, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !140
  %idxprom6 = sext i32 %8 to i64, !dbg !142
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !142
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !142
  call void @printIntLine(i32 %9), !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !145
  %inc = add nsw i32 %10, 1, !dbg !145
  store i32 %inc, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !149

if.else8:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !150
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then2
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !157
  %tobool = icmp ne i32 %0, 0, !dbg !157
  br i1 %tobool, label %if.then, label %if.end, !dbg !159

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !160
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !162
  br label %if.end, !dbg !163

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !164
  %tobool1 = icmp ne i32 %2, 0, !dbg !164
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !166

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !167, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !171, metadata !DIExpression()), !dbg !172
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !172
  %4 = load i32, i32* %data, align 4, !dbg !173
  %cmp = icmp sge i32 %4, 0, !dbg !175
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !176

land.lhs.true:                                    ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !177
  %cmp3 = icmp slt i32 %5, 10, !dbg !178
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !179

if.then4:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !180
  %idxprom = sext i32 %6 to i64, !dbg !182
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !182
  store i32 1, i32* %arrayidx, align 4, !dbg !183
  store i32 0, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.then4
  %7 = load i32, i32* %i, align 4, !dbg !187
  %cmp5 = icmp slt i32 %7, 10, !dbg !189
  br i1 %cmp5, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !191
  %idxprom6 = sext i32 %8 to i64, !dbg !193
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !193
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !193
  call void @printIntLine(i32 %9), !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !196
  %inc = add nsw i32 %10, 1, !dbg !196
  store i32 %inc, i32* %i, align 4, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !200

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !201
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !203

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !205 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !206, metadata !DIExpression()), !dbg !207
  store i32 -1, i32* %data, align 4, !dbg !208
  %0 = load i32, i32* @staticFalse, align 4, !dbg !209
  %tobool = icmp ne i32 %0, 0, !dbg !209
  br i1 %tobool, label %if.then, label %if.else, !dbg !211

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !212
  br label %if.end, !dbg !214

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !215
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !217
  %tobool1 = icmp ne i32 %1, 0, !dbg !217
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !219

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !220, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !224, metadata !DIExpression()), !dbg !225
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !225
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !225
  %3 = load i32, i32* %data, align 4, !dbg !226
  %cmp = icmp sge i32 %3, 0, !dbg !228
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !229

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !230
  %idxprom = sext i32 %4 to i64, !dbg !232
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !232
  store i32 1, i32* %arrayidx, align 4, !dbg !233
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !236

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !237
  %cmp4 = icmp slt i32 %5, 10, !dbg !239
  br i1 %cmp4, label %for.body, label %for.end, !dbg !240

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !241
  %idxprom5 = sext i32 %6 to i64, !dbg !243
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !243
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !243
  call void @printIntLine(i32 %7), !dbg !244
  br label %for.inc, !dbg !245

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !246
  %inc = add nsw i32 %8, 1, !dbg !246
  store i32 %inc, i32* %i, align 4, !dbg !246
  br label %for.cond, !dbg !247, !llvm.loop !248

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !250

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !251
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !253

if.end9:                                          ; preds = %if.end8, %if.end
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !259
  %tobool = icmp ne i32 %0, 0, !dbg !259
  br i1 %tobool, label %if.then, label %if.end, !dbg !261

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !262
  br label %if.end, !dbg !264

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !265
  %tobool1 = icmp ne i32 %1, 0, !dbg !265
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !267

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !268, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !272, metadata !DIExpression()), !dbg !273
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !273
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !273
  %3 = load i32, i32* %data, align 4, !dbg !274
  %cmp = icmp sge i32 %3, 0, !dbg !276
  br i1 %cmp, label %if.then3, label %if.else, !dbg !277

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !278
  %idxprom = sext i32 %4 to i64, !dbg !280
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !280
  store i32 1, i32* %arrayidx, align 4, !dbg !281
  store i32 0, i32* %i, align 4, !dbg !282
  br label %for.cond, !dbg !284

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !285
  %cmp4 = icmp slt i32 %5, 10, !dbg !287
  br i1 %cmp4, label %for.body, label %for.end, !dbg !288

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !289
  %idxprom5 = sext i32 %6 to i64, !dbg !291
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !291
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !291
  call void @printIntLine(i32 %7), !dbg !292
  br label %for.inc, !dbg !293

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !294
  %inc = add nsw i32 %8, 1, !dbg !294
  store i32 %inc, i32* %i, align 4, !dbg !294
  br label %for.cond, !dbg !295, !llvm.loop !296

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !298

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !299
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !301

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !302
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !11)
!22 = !DILocation(line: 30, column: 9, scope: !18)
!23 = !DILocation(line: 32, column: 10, scope: !18)
!24 = !DILocation(line: 33, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!26 = !DILocation(line: 33, column: 8, scope: !18)
!27 = !DILocation(line: 36, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !10, line: 34, column: 5)
!29 = !DILocation(line: 36, column: 9, scope: !28)
!30 = !DILocation(line: 37, column: 5, scope: !28)
!31 = !DILocation(line: 38, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !10, line: 38, column: 8)
!33 = !DILocation(line: 38, column: 8, scope: !18)
!34 = !DILocalVariable(name: "i", scope: !35, file: !10, line: 41, type: !11)
!35 = distinct !DILexicalBlock(scope: !36, file: !10, line: 40, column: 9)
!36 = distinct !DILexicalBlock(scope: !32, file: !10, line: 39, column: 5)
!37 = !DILocation(line: 41, column: 17, scope: !35)
!38 = !DILocalVariable(name: "buffer", scope: !35, file: !10, line: 42, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 10)
!42 = !DILocation(line: 42, column: 17, scope: !35)
!43 = !DILocation(line: 45, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !10, line: 45, column: 17)
!45 = !DILocation(line: 45, column: 22, scope: !44)
!46 = !DILocation(line: 45, column: 17, scope: !35)
!47 = !DILocation(line: 47, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !10, line: 46, column: 13)
!49 = !DILocation(line: 47, column: 17, scope: !48)
!50 = !DILocation(line: 47, column: 30, scope: !48)
!51 = !DILocation(line: 49, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !10, line: 49, column: 17)
!53 = !DILocation(line: 49, column: 21, scope: !52)
!54 = !DILocation(line: 49, column: 28, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !10, line: 49, column: 17)
!56 = !DILocation(line: 49, column: 30, scope: !55)
!57 = !DILocation(line: 49, column: 17, scope: !52)
!58 = !DILocation(line: 51, column: 41, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !10, line: 50, column: 17)
!60 = !DILocation(line: 51, column: 34, scope: !59)
!61 = !DILocation(line: 51, column: 21, scope: !59)
!62 = !DILocation(line: 52, column: 17, scope: !59)
!63 = !DILocation(line: 49, column: 37, scope: !55)
!64 = !DILocation(line: 49, column: 17, scope: !55)
!65 = distinct !{!65, !57, !66, !67}
!66 = !DILocation(line: 52, column: 17, scope: !52)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 53, column: 13, scope: !48)
!69 = !DILocation(line: 56, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !44, file: !10, line: 55, column: 13)
!71 = !DILocation(line: 59, column: 5, scope: !36)
!72 = !DILocation(line: 60, column: 1, scope: !18)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_05_good", scope: !10, file: !10, line: 216, type: !19, scopeLine: 217, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 218, column: 5, scope: !73)
!75 = !DILocation(line: 219, column: 5, scope: !73)
!76 = !DILocation(line: 220, column: 5, scope: !73)
!77 = !DILocation(line: 221, column: 5, scope: !73)
!78 = !DILocation(line: 222, column: 1, scope: !73)
!79 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 233, type: !80, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!11, !11, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !10, line: 233, type: !11)
!86 = !DILocation(line: 233, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !10, line: 233, type: !82)
!88 = !DILocation(line: 233, column: 27, scope: !79)
!89 = !DILocation(line: 236, column: 22, scope: !79)
!90 = !DILocation(line: 236, column: 12, scope: !79)
!91 = !DILocation(line: 236, column: 5, scope: !79)
!92 = !DILocation(line: 238, column: 5, scope: !79)
!93 = !DILocation(line: 239, column: 5, scope: !79)
!94 = !DILocation(line: 240, column: 5, scope: !79)
!95 = !DILocation(line: 243, column: 5, scope: !79)
!96 = !DILocation(line: 244, column: 5, scope: !79)
!97 = !DILocation(line: 245, column: 5, scope: !79)
!98 = !DILocation(line: 247, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 67, type: !19, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 69, type: !11)
!101 = !DILocation(line: 69, column: 9, scope: !99)
!102 = !DILocation(line: 71, column: 10, scope: !99)
!103 = !DILocation(line: 72, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !10, line: 72, column: 8)
!105 = !DILocation(line: 72, column: 8, scope: !99)
!106 = !DILocation(line: 75, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !10, line: 73, column: 5)
!108 = !DILocation(line: 75, column: 9, scope: !107)
!109 = !DILocation(line: 76, column: 5, scope: !107)
!110 = !DILocation(line: 77, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !10, line: 77, column: 8)
!112 = !DILocation(line: 77, column: 8, scope: !99)
!113 = !DILocation(line: 80, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !10, line: 78, column: 5)
!115 = !DILocation(line: 81, column: 5, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !10, line: 85, type: !11)
!117 = distinct !DILexicalBlock(scope: !118, file: !10, line: 84, column: 9)
!118 = distinct !DILexicalBlock(scope: !111, file: !10, line: 83, column: 5)
!119 = !DILocation(line: 85, column: 17, scope: !117)
!120 = !DILocalVariable(name: "buffer", scope: !117, file: !10, line: 86, type: !39)
!121 = !DILocation(line: 86, column: 17, scope: !117)
!122 = !DILocation(line: 88, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !10, line: 88, column: 17)
!124 = !DILocation(line: 88, column: 22, scope: !123)
!125 = !DILocation(line: 88, column: 27, scope: !123)
!126 = !DILocation(line: 88, column: 30, scope: !123)
!127 = !DILocation(line: 88, column: 35, scope: !123)
!128 = !DILocation(line: 88, column: 17, scope: !117)
!129 = !DILocation(line: 90, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !123, file: !10, line: 89, column: 13)
!131 = !DILocation(line: 90, column: 17, scope: !130)
!132 = !DILocation(line: 90, column: 30, scope: !130)
!133 = !DILocation(line: 92, column: 23, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !10, line: 92, column: 17)
!135 = !DILocation(line: 92, column: 21, scope: !134)
!136 = !DILocation(line: 92, column: 28, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !10, line: 92, column: 17)
!138 = !DILocation(line: 92, column: 30, scope: !137)
!139 = !DILocation(line: 92, column: 17, scope: !134)
!140 = !DILocation(line: 94, column: 41, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !10, line: 93, column: 17)
!142 = !DILocation(line: 94, column: 34, scope: !141)
!143 = !DILocation(line: 94, column: 21, scope: !141)
!144 = !DILocation(line: 95, column: 17, scope: !141)
!145 = !DILocation(line: 92, column: 37, scope: !137)
!146 = !DILocation(line: 92, column: 17, scope: !137)
!147 = distinct !{!147, !139, !148, !67}
!148 = !DILocation(line: 95, column: 17, scope: !134)
!149 = !DILocation(line: 96, column: 13, scope: !130)
!150 = !DILocation(line: 99, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !123, file: !10, line: 98, column: 13)
!152 = !DILocation(line: 103, column: 1, scope: !99)
!153 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 106, type: !19, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!154 = !DILocalVariable(name: "data", scope: !153, file: !10, line: 108, type: !11)
!155 = !DILocation(line: 108, column: 9, scope: !153)
!156 = !DILocation(line: 110, column: 10, scope: !153)
!157 = !DILocation(line: 111, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !10, line: 111, column: 8)
!159 = !DILocation(line: 111, column: 8, scope: !153)
!160 = !DILocation(line: 114, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !10, line: 112, column: 5)
!162 = !DILocation(line: 114, column: 9, scope: !161)
!163 = !DILocation(line: 115, column: 5, scope: !161)
!164 = !DILocation(line: 116, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !153, file: !10, line: 116, column: 8)
!166 = !DILocation(line: 116, column: 8, scope: !153)
!167 = !DILocalVariable(name: "i", scope: !168, file: !10, line: 119, type: !11)
!168 = distinct !DILexicalBlock(scope: !169, file: !10, line: 118, column: 9)
!169 = distinct !DILexicalBlock(scope: !165, file: !10, line: 117, column: 5)
!170 = !DILocation(line: 119, column: 17, scope: !168)
!171 = !DILocalVariable(name: "buffer", scope: !168, file: !10, line: 120, type: !39)
!172 = !DILocation(line: 120, column: 17, scope: !168)
!173 = !DILocation(line: 122, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !168, file: !10, line: 122, column: 17)
!175 = !DILocation(line: 122, column: 22, scope: !174)
!176 = !DILocation(line: 122, column: 27, scope: !174)
!177 = !DILocation(line: 122, column: 30, scope: !174)
!178 = !DILocation(line: 122, column: 35, scope: !174)
!179 = !DILocation(line: 122, column: 17, scope: !168)
!180 = !DILocation(line: 124, column: 24, scope: !181)
!181 = distinct !DILexicalBlock(scope: !174, file: !10, line: 123, column: 13)
!182 = !DILocation(line: 124, column: 17, scope: !181)
!183 = !DILocation(line: 124, column: 30, scope: !181)
!184 = !DILocation(line: 126, column: 23, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !10, line: 126, column: 17)
!186 = !DILocation(line: 126, column: 21, scope: !185)
!187 = !DILocation(line: 126, column: 28, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !10, line: 126, column: 17)
!189 = !DILocation(line: 126, column: 30, scope: !188)
!190 = !DILocation(line: 126, column: 17, scope: !185)
!191 = !DILocation(line: 128, column: 41, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !10, line: 127, column: 17)
!193 = !DILocation(line: 128, column: 34, scope: !192)
!194 = !DILocation(line: 128, column: 21, scope: !192)
!195 = !DILocation(line: 129, column: 17, scope: !192)
!196 = !DILocation(line: 126, column: 37, scope: !188)
!197 = !DILocation(line: 126, column: 17, scope: !188)
!198 = distinct !{!198, !190, !199, !67}
!199 = !DILocation(line: 129, column: 17, scope: !185)
!200 = !DILocation(line: 130, column: 13, scope: !181)
!201 = !DILocation(line: 133, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !174, file: !10, line: 132, column: 13)
!203 = !DILocation(line: 136, column: 5, scope: !169)
!204 = !DILocation(line: 137, column: 1, scope: !153)
!205 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 140, type: !19, scopeLine: 141, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!206 = !DILocalVariable(name: "data", scope: !205, file: !10, line: 142, type: !11)
!207 = !DILocation(line: 142, column: 9, scope: !205)
!208 = !DILocation(line: 144, column: 10, scope: !205)
!209 = !DILocation(line: 145, column: 8, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !10, line: 145, column: 8)
!211 = !DILocation(line: 145, column: 8, scope: !205)
!212 = !DILocation(line: 148, column: 9, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !10, line: 146, column: 5)
!214 = !DILocation(line: 149, column: 5, scope: !213)
!215 = !DILocation(line: 154, column: 14, scope: !216)
!216 = distinct !DILexicalBlock(scope: !210, file: !10, line: 151, column: 5)
!217 = !DILocation(line: 156, column: 8, scope: !218)
!218 = distinct !DILexicalBlock(scope: !205, file: !10, line: 156, column: 8)
!219 = !DILocation(line: 156, column: 8, scope: !205)
!220 = !DILocalVariable(name: "i", scope: !221, file: !10, line: 159, type: !11)
!221 = distinct !DILexicalBlock(scope: !222, file: !10, line: 158, column: 9)
!222 = distinct !DILexicalBlock(scope: !218, file: !10, line: 157, column: 5)
!223 = !DILocation(line: 159, column: 17, scope: !221)
!224 = !DILocalVariable(name: "buffer", scope: !221, file: !10, line: 160, type: !39)
!225 = !DILocation(line: 160, column: 17, scope: !221)
!226 = !DILocation(line: 163, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !221, file: !10, line: 163, column: 17)
!228 = !DILocation(line: 163, column: 22, scope: !227)
!229 = !DILocation(line: 163, column: 17, scope: !221)
!230 = !DILocation(line: 165, column: 24, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !10, line: 164, column: 13)
!232 = !DILocation(line: 165, column: 17, scope: !231)
!233 = !DILocation(line: 165, column: 30, scope: !231)
!234 = !DILocation(line: 167, column: 23, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !10, line: 167, column: 17)
!236 = !DILocation(line: 167, column: 21, scope: !235)
!237 = !DILocation(line: 167, column: 28, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !10, line: 167, column: 17)
!239 = !DILocation(line: 167, column: 30, scope: !238)
!240 = !DILocation(line: 167, column: 17, scope: !235)
!241 = !DILocation(line: 169, column: 41, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !10, line: 168, column: 17)
!243 = !DILocation(line: 169, column: 34, scope: !242)
!244 = !DILocation(line: 169, column: 21, scope: !242)
!245 = !DILocation(line: 170, column: 17, scope: !242)
!246 = !DILocation(line: 167, column: 37, scope: !238)
!247 = !DILocation(line: 167, column: 17, scope: !238)
!248 = distinct !{!248, !240, !249, !67}
!249 = !DILocation(line: 170, column: 17, scope: !235)
!250 = !DILocation(line: 171, column: 13, scope: !231)
!251 = !DILocation(line: 174, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !227, file: !10, line: 173, column: 13)
!253 = !DILocation(line: 177, column: 5, scope: !222)
!254 = !DILocation(line: 178, column: 1, scope: !205)
!255 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 181, type: !19, scopeLine: 182, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!256 = !DILocalVariable(name: "data", scope: !255, file: !10, line: 183, type: !11)
!257 = !DILocation(line: 183, column: 9, scope: !255)
!258 = !DILocation(line: 185, column: 10, scope: !255)
!259 = !DILocation(line: 186, column: 8, scope: !260)
!260 = distinct !DILexicalBlock(scope: !255, file: !10, line: 186, column: 8)
!261 = !DILocation(line: 186, column: 8, scope: !255)
!262 = !DILocation(line: 190, column: 14, scope: !263)
!263 = distinct !DILexicalBlock(scope: !260, file: !10, line: 187, column: 5)
!264 = !DILocation(line: 191, column: 5, scope: !263)
!265 = !DILocation(line: 192, column: 8, scope: !266)
!266 = distinct !DILexicalBlock(scope: !255, file: !10, line: 192, column: 8)
!267 = !DILocation(line: 192, column: 8, scope: !255)
!268 = !DILocalVariable(name: "i", scope: !269, file: !10, line: 195, type: !11)
!269 = distinct !DILexicalBlock(scope: !270, file: !10, line: 194, column: 9)
!270 = distinct !DILexicalBlock(scope: !266, file: !10, line: 193, column: 5)
!271 = !DILocation(line: 195, column: 17, scope: !269)
!272 = !DILocalVariable(name: "buffer", scope: !269, file: !10, line: 196, type: !39)
!273 = !DILocation(line: 196, column: 17, scope: !269)
!274 = !DILocation(line: 199, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !10, line: 199, column: 17)
!276 = !DILocation(line: 199, column: 22, scope: !275)
!277 = !DILocation(line: 199, column: 17, scope: !269)
!278 = !DILocation(line: 201, column: 24, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !10, line: 200, column: 13)
!280 = !DILocation(line: 201, column: 17, scope: !279)
!281 = !DILocation(line: 201, column: 30, scope: !279)
!282 = !DILocation(line: 203, column: 23, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !10, line: 203, column: 17)
!284 = !DILocation(line: 203, column: 21, scope: !283)
!285 = !DILocation(line: 203, column: 28, scope: !286)
!286 = distinct !DILexicalBlock(scope: !283, file: !10, line: 203, column: 17)
!287 = !DILocation(line: 203, column: 30, scope: !286)
!288 = !DILocation(line: 203, column: 17, scope: !283)
!289 = !DILocation(line: 205, column: 41, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !10, line: 204, column: 17)
!291 = !DILocation(line: 205, column: 34, scope: !290)
!292 = !DILocation(line: 205, column: 21, scope: !290)
!293 = !DILocation(line: 206, column: 17, scope: !290)
!294 = !DILocation(line: 203, column: 37, scope: !286)
!295 = !DILocation(line: 203, column: 17, scope: !286)
!296 = distinct !{!296, !288, !297, !67}
!297 = !DILocation(line: 206, column: 17, scope: !283)
!298 = !DILocation(line: 207, column: 13, scope: !279)
!299 = !DILocation(line: 210, column: 17, scope: !300)
!300 = distinct !DILexicalBlock(scope: !275, file: !10, line: 209, column: 13)
!301 = !DILocation(line: 213, column: 5, scope: !270)
!302 = !DILocation(line: 214, column: 1, scope: !255)
