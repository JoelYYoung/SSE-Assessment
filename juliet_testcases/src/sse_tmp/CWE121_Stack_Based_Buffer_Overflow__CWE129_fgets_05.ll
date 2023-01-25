; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@staticTrue = internal global i32 1, align 4, !dbg !0
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !9
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_bad() #0 !dbg !19 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  %0 = load i32, i32* @staticTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end4, !dbg !27

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !28, metadata !DIExpression()), !dbg !35
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !38
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !39
  %cmp = icmp ne i8* %call, null, !dbg !40
  br i1 %cmp, label %if.then1, label %if.else, !dbg !41

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !42
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !44
  store i32 %call3, i32* %data, align 4, !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !49

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !50
  %tobool5 = icmp ne i32 %3, 0, !dbg !50
  br i1 %tobool5, label %if.then6, label %if.end14, !dbg !52

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !53, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !57, metadata !DIExpression()), !dbg !61
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !61
  %5 = load i32, i32* %data, align 4, !dbg !62
  %cmp7 = icmp sge i32 %5, 0, !dbg !64
  br i1 %cmp7, label %if.then8, label %if.else12, !dbg !65

if.then8:                                         ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !66
  %idxprom = sext i32 %6 to i64, !dbg !68
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !68
  store i32 1, i32* %arrayidx, align 4, !dbg !69
  store i32 0, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %if.then8
  %7 = load i32, i32* %i, align 4, !dbg !73
  %cmp9 = icmp slt i32 %7, 10, !dbg !75
  br i1 %cmp9, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !77
  %idxprom10 = sext i32 %8 to i64, !dbg !79
  %arrayidx11 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom10, !dbg !79
  %9 = load i32, i32* %arrayidx11, align 4, !dbg !79
  call void @printIntLine(i32 %9), !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !82
  %inc = add nsw i32 %10, 1, !dbg !82
  store i32 %inc, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  br label %if.end13, !dbg !87

if.else12:                                        ; preds = %if.then6
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %for.end
  br label %if.end14, !dbg !90

if.end14:                                         ; preds = %if.end13, %if.end4
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_good() #0 !dbg !92 {
entry:
  call void @goodB2G1(), !dbg !93
  call void @goodB2G2(), !dbg !94
  call void @goodG2B1(), !dbg !95
  call void @goodG2B2(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #7, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #7, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !117 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 -1, i32* %data, align 4, !dbg !120
  %0 = load i32, i32* @staticTrue, align 4, !dbg !121
  %tobool = icmp ne i32 %0, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end4, !dbg !123

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !124, metadata !DIExpression()), !dbg !127
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !127
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !128
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !130
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !131
  %cmp = icmp ne i8* %call, null, !dbg !132
  br i1 %cmp, label %if.then1, label %if.else, !dbg !133

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !134
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !136
  store i32 %call3, i32* %data, align 4, !dbg !137
  br label %if.end, !dbg !138

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !141

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFalse, align 4, !dbg !142
  %tobool5 = icmp ne i32 %3, 0, !dbg !142
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !144

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !145
  br label %if.end16, !dbg !147

if.else7:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !152, metadata !DIExpression()), !dbg !153
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !153
  %5 = load i32, i32* %data, align 4, !dbg !154
  %cmp8 = icmp sge i32 %5, 0, !dbg !156
  br i1 %cmp8, label %land.lhs.true, label %if.else14, !dbg !157

land.lhs.true:                                    ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !158
  %cmp9 = icmp slt i32 %6, 10, !dbg !159
  br i1 %cmp9, label %if.then10, label %if.else14, !dbg !160

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !161
  %idxprom = sext i32 %7 to i64, !dbg !163
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !163
  store i32 1, i32* %arrayidx, align 4, !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.then10
  %8 = load i32, i32* %i, align 4, !dbg !168
  %cmp11 = icmp slt i32 %8, 10, !dbg !170
  br i1 %cmp11, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !172
  %idxprom12 = sext i32 %9 to i64, !dbg !174
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !174
  %10 = load i32, i32* %arrayidx13, align 4, !dbg !174
  call void @printIntLine(i32 %10), !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !177
  %inc = add nsw i32 %11, 1, !dbg !177
  store i32 %inc, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  br label %if.end15, !dbg !181

if.else14:                                        ; preds = %land.lhs.true, %if.else7
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !182
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %for.end
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then6
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 -1, i32* %data, align 4, !dbg !188
  %0 = load i32, i32* @staticTrue, align 4, !dbg !189
  %tobool = icmp ne i32 %0, 0, !dbg !189
  br i1 %tobool, label %if.then, label %if.end4, !dbg !191

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !192, metadata !DIExpression()), !dbg !195
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !195
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !195
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !196
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !198
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !199
  %cmp = icmp ne i8* %call, null, !dbg !200
  br i1 %cmp, label %if.then1, label %if.else, !dbg !201

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !202
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !204
  store i32 %call3, i32* %data, align 4, !dbg !205
  br label %if.end, !dbg !206

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !207
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !209

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !210
  %tobool5 = icmp ne i32 %3, 0, !dbg !210
  br i1 %tobool5, label %if.then6, label %if.end15, !dbg !212

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !213, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !217, metadata !DIExpression()), !dbg !218
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !218
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !218
  %5 = load i32, i32* %data, align 4, !dbg !219
  %cmp7 = icmp sge i32 %5, 0, !dbg !221
  br i1 %cmp7, label %land.lhs.true, label %if.else13, !dbg !222

land.lhs.true:                                    ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !223
  %cmp8 = icmp slt i32 %6, 10, !dbg !224
  br i1 %cmp8, label %if.then9, label %if.else13, !dbg !225

if.then9:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !226
  %idxprom = sext i32 %7 to i64, !dbg !228
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !228
  store i32 1, i32* %arrayidx, align 4, !dbg !229
  store i32 0, i32* %i, align 4, !dbg !230
  br label %for.cond, !dbg !232

for.cond:                                         ; preds = %for.inc, %if.then9
  %8 = load i32, i32* %i, align 4, !dbg !233
  %cmp10 = icmp slt i32 %8, 10, !dbg !235
  br i1 %cmp10, label %for.body, label %for.end, !dbg !236

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !237
  %idxprom11 = sext i32 %9 to i64, !dbg !239
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom11, !dbg !239
  %10 = load i32, i32* %arrayidx12, align 4, !dbg !239
  call void @printIntLine(i32 %10), !dbg !240
  br label %for.inc, !dbg !241

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !242
  %inc = add nsw i32 %11, 1, !dbg !242
  store i32 %inc, i32* %i, align 4, !dbg !242
  br label %for.cond, !dbg !243, !llvm.loop !244

for.end:                                          ; preds = %for.cond
  br label %if.end14, !dbg !246

if.else13:                                        ; preds = %land.lhs.true, %if.then6
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !247
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %for.end
  br label %if.end15, !dbg !249

if.end15:                                         ; preds = %if.end14, %if.end4
  ret void, !dbg !250
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !251 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 -1, i32* %data, align 4, !dbg !254
  %0 = load i32, i32* @staticFalse, align 4, !dbg !255
  %tobool = icmp ne i32 %0, 0, !dbg !255
  br i1 %tobool, label %if.then, label %if.else, !dbg !257

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !258
  br label %if.end, !dbg !260

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !261
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !263
  %tobool1 = icmp ne i32 %1, 0, !dbg !263
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !265

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !266, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !270, metadata !DIExpression()), !dbg !271
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !271
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !271
  %3 = load i32, i32* %data, align 4, !dbg !272
  %cmp = icmp sge i32 %3, 0, !dbg !274
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !275

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !276
  %idxprom = sext i32 %4 to i64, !dbg !278
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !278
  store i32 1, i32* %arrayidx, align 4, !dbg !279
  store i32 0, i32* %i, align 4, !dbg !280
  br label %for.cond, !dbg !282

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !283
  %cmp4 = icmp slt i32 %5, 10, !dbg !285
  br i1 %cmp4, label %for.body, label %for.end, !dbg !286

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !287
  %idxprom5 = sext i32 %6 to i64, !dbg !289
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !289
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !289
  call void @printIntLine(i32 %7), !dbg !290
  br label %for.inc, !dbg !291

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !292
  %inc = add nsw i32 %8, 1, !dbg !292
  store i32 %inc, i32* %i, align 4, !dbg !292
  br label %for.cond, !dbg !293, !llvm.loop !294

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !296

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !297
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !299

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !300
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !301 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !302, metadata !DIExpression()), !dbg !303
  store i32 -1, i32* %data, align 4, !dbg !304
  %0 = load i32, i32* @staticTrue, align 4, !dbg !305
  %tobool = icmp ne i32 %0, 0, !dbg !305
  br i1 %tobool, label %if.then, label %if.end, !dbg !307

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !308
  br label %if.end, !dbg !310

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !311
  %tobool1 = icmp ne i32 %1, 0, !dbg !311
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !313

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !314, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !318, metadata !DIExpression()), !dbg !319
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !319
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !319
  %3 = load i32, i32* %data, align 4, !dbg !320
  %cmp = icmp sge i32 %3, 0, !dbg !322
  br i1 %cmp, label %if.then3, label %if.else, !dbg !323

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !324
  %idxprom = sext i32 %4 to i64, !dbg !326
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !326
  store i32 1, i32* %arrayidx, align 4, !dbg !327
  store i32 0, i32* %i, align 4, !dbg !328
  br label %for.cond, !dbg !330

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !331
  %cmp4 = icmp slt i32 %5, 10, !dbg !333
  br i1 %cmp4, label %for.body, label %for.end, !dbg !334

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !335
  %idxprom5 = sext i32 %6 to i64, !dbg !337
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !337
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !337
  call void @printIntLine(i32 %7), !dbg !338
  br label %for.inc, !dbg !339

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !340
  %inc = add nsw i32 %8, 1, !dbg !340
  store i32 %inc, i32* %i, align 4, !dbg !340
  br label %for.cond, !dbg !341, !llvm.loop !342

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !344

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !345
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !347

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !348
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !11, line: 26, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_bad", scope: !11, file: !11, line: 30, type: !20, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 32, type: !12)
!23 = !DILocation(line: 32, column: 9, scope: !19)
!24 = !DILocation(line: 34, column: 10, scope: !19)
!25 = !DILocation(line: 35, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 35, column: 8)
!27 = !DILocation(line: 35, column: 8, scope: !19)
!28 = !DILocalVariable(name: "inputBuffer", scope: !29, file: !11, line: 38, type: !31)
!29 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 36, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 112, elements: !33)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !{!34}
!34 = !DISubrange(count: 14)
!35 = !DILocation(line: 38, column: 18, scope: !29)
!36 = !DILocation(line: 40, column: 23, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !11, line: 40, column: 17)
!38 = !DILocation(line: 40, column: 53, scope: !37)
!39 = !DILocation(line: 40, column: 17, scope: !37)
!40 = !DILocation(line: 40, column: 60, scope: !37)
!41 = !DILocation(line: 40, column: 17, scope: !29)
!42 = !DILocation(line: 43, column: 29, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !11, line: 41, column: 13)
!44 = !DILocation(line: 43, column: 24, scope: !43)
!45 = !DILocation(line: 43, column: 22, scope: !43)
!46 = !DILocation(line: 44, column: 13, scope: !43)
!47 = !DILocation(line: 47, column: 17, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !11, line: 46, column: 13)
!49 = !DILocation(line: 50, column: 5, scope: !30)
!50 = !DILocation(line: 51, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !19, file: !11, line: 51, column: 8)
!52 = !DILocation(line: 51, column: 8, scope: !19)
!53 = !DILocalVariable(name: "i", scope: !54, file: !11, line: 54, type: !12)
!54 = distinct !DILexicalBlock(scope: !55, file: !11, line: 53, column: 9)
!55 = distinct !DILexicalBlock(scope: !51, file: !11, line: 52, column: 5)
!56 = !DILocation(line: 54, column: 17, scope: !54)
!57 = !DILocalVariable(name: "buffer", scope: !54, file: !11, line: 55, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 10)
!61 = !DILocation(line: 55, column: 17, scope: !54)
!62 = !DILocation(line: 58, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !54, file: !11, line: 58, column: 17)
!64 = !DILocation(line: 58, column: 22, scope: !63)
!65 = !DILocation(line: 58, column: 17, scope: !54)
!66 = !DILocation(line: 60, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !11, line: 59, column: 13)
!68 = !DILocation(line: 60, column: 17, scope: !67)
!69 = !DILocation(line: 60, column: 30, scope: !67)
!70 = !DILocation(line: 62, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !11, line: 62, column: 17)
!72 = !DILocation(line: 62, column: 21, scope: !71)
!73 = !DILocation(line: 62, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !11, line: 62, column: 17)
!75 = !DILocation(line: 62, column: 30, scope: !74)
!76 = !DILocation(line: 62, column: 17, scope: !71)
!77 = !DILocation(line: 64, column: 41, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !11, line: 63, column: 17)
!79 = !DILocation(line: 64, column: 34, scope: !78)
!80 = !DILocation(line: 64, column: 21, scope: !78)
!81 = !DILocation(line: 65, column: 17, scope: !78)
!82 = !DILocation(line: 62, column: 37, scope: !74)
!83 = !DILocation(line: 62, column: 17, scope: !74)
!84 = distinct !{!84, !76, !85, !86}
!85 = !DILocation(line: 65, column: 17, scope: !71)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 66, column: 13, scope: !67)
!88 = !DILocation(line: 69, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !63, file: !11, line: 68, column: 13)
!90 = !DILocation(line: 72, column: 5, scope: !55)
!91 = !DILocation(line: 73, column: 1, scope: !19)
!92 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_good", scope: !11, file: !11, line: 251, type: !20, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 253, column: 5, scope: !92)
!94 = !DILocation(line: 254, column: 5, scope: !92)
!95 = !DILocation(line: 255, column: 5, scope: !92)
!96 = !DILocation(line: 256, column: 5, scope: !92)
!97 = !DILocation(line: 257, column: 1, scope: !92)
!98 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 268, type: !99, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DISubroutineType(types: !100)
!100 = !{!12, !12, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !11, line: 268, type: !12)
!104 = !DILocation(line: 268, column: 14, scope: !98)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !11, line: 268, type: !101)
!106 = !DILocation(line: 268, column: 27, scope: !98)
!107 = !DILocation(line: 271, column: 22, scope: !98)
!108 = !DILocation(line: 271, column: 12, scope: !98)
!109 = !DILocation(line: 271, column: 5, scope: !98)
!110 = !DILocation(line: 273, column: 5, scope: !98)
!111 = !DILocation(line: 274, column: 5, scope: !98)
!112 = !DILocation(line: 275, column: 5, scope: !98)
!113 = !DILocation(line: 278, column: 5, scope: !98)
!114 = !DILocation(line: 279, column: 5, scope: !98)
!115 = !DILocation(line: 280, column: 5, scope: !98)
!116 = !DILocation(line: 282, column: 5, scope: !98)
!117 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !11, line: 82, type: !12)
!119 = !DILocation(line: 82, column: 9, scope: !117)
!120 = !DILocation(line: 84, column: 10, scope: !117)
!121 = !DILocation(line: 85, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !11, line: 85, column: 8)
!123 = !DILocation(line: 85, column: 8, scope: !117)
!124 = !DILocalVariable(name: "inputBuffer", scope: !125, file: !11, line: 88, type: !31)
!125 = distinct !DILexicalBlock(scope: !126, file: !11, line: 87, column: 9)
!126 = distinct !DILexicalBlock(scope: !122, file: !11, line: 86, column: 5)
!127 = !DILocation(line: 88, column: 18, scope: !125)
!128 = !DILocation(line: 90, column: 23, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !11, line: 90, column: 17)
!130 = !DILocation(line: 90, column: 53, scope: !129)
!131 = !DILocation(line: 90, column: 17, scope: !129)
!132 = !DILocation(line: 90, column: 60, scope: !129)
!133 = !DILocation(line: 90, column: 17, scope: !125)
!134 = !DILocation(line: 93, column: 29, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !11, line: 91, column: 13)
!136 = !DILocation(line: 93, column: 24, scope: !135)
!137 = !DILocation(line: 93, column: 22, scope: !135)
!138 = !DILocation(line: 94, column: 13, scope: !135)
!139 = !DILocation(line: 97, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !129, file: !11, line: 96, column: 13)
!141 = !DILocation(line: 100, column: 5, scope: !126)
!142 = !DILocation(line: 101, column: 8, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !11, line: 101, column: 8)
!144 = !DILocation(line: 101, column: 8, scope: !117)
!145 = !DILocation(line: 104, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !11, line: 102, column: 5)
!147 = !DILocation(line: 105, column: 5, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !149, file: !11, line: 109, type: !12)
!149 = distinct !DILexicalBlock(scope: !150, file: !11, line: 108, column: 9)
!150 = distinct !DILexicalBlock(scope: !143, file: !11, line: 107, column: 5)
!151 = !DILocation(line: 109, column: 17, scope: !149)
!152 = !DILocalVariable(name: "buffer", scope: !149, file: !11, line: 110, type: !58)
!153 = !DILocation(line: 110, column: 17, scope: !149)
!154 = !DILocation(line: 112, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !11, line: 112, column: 17)
!156 = !DILocation(line: 112, column: 22, scope: !155)
!157 = !DILocation(line: 112, column: 27, scope: !155)
!158 = !DILocation(line: 112, column: 30, scope: !155)
!159 = !DILocation(line: 112, column: 35, scope: !155)
!160 = !DILocation(line: 112, column: 17, scope: !149)
!161 = !DILocation(line: 114, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !155, file: !11, line: 113, column: 13)
!163 = !DILocation(line: 114, column: 17, scope: !162)
!164 = !DILocation(line: 114, column: 30, scope: !162)
!165 = !DILocation(line: 116, column: 23, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !11, line: 116, column: 17)
!167 = !DILocation(line: 116, column: 21, scope: !166)
!168 = !DILocation(line: 116, column: 28, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !11, line: 116, column: 17)
!170 = !DILocation(line: 116, column: 30, scope: !169)
!171 = !DILocation(line: 116, column: 17, scope: !166)
!172 = !DILocation(line: 118, column: 41, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !11, line: 117, column: 17)
!174 = !DILocation(line: 118, column: 34, scope: !173)
!175 = !DILocation(line: 118, column: 21, scope: !173)
!176 = !DILocation(line: 119, column: 17, scope: !173)
!177 = !DILocation(line: 116, column: 37, scope: !169)
!178 = !DILocation(line: 116, column: 17, scope: !169)
!179 = distinct !{!179, !171, !180, !86}
!180 = !DILocation(line: 119, column: 17, scope: !166)
!181 = !DILocation(line: 120, column: 13, scope: !162)
!182 = !DILocation(line: 123, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !155, file: !11, line: 122, column: 13)
!184 = !DILocation(line: 127, column: 1, scope: !117)
!185 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 130, type: !20, scopeLine: 131, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!186 = !DILocalVariable(name: "data", scope: !185, file: !11, line: 132, type: !12)
!187 = !DILocation(line: 132, column: 9, scope: !185)
!188 = !DILocation(line: 134, column: 10, scope: !185)
!189 = !DILocation(line: 135, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !185, file: !11, line: 135, column: 8)
!191 = !DILocation(line: 135, column: 8, scope: !185)
!192 = !DILocalVariable(name: "inputBuffer", scope: !193, file: !11, line: 138, type: !31)
!193 = distinct !DILexicalBlock(scope: !194, file: !11, line: 137, column: 9)
!194 = distinct !DILexicalBlock(scope: !190, file: !11, line: 136, column: 5)
!195 = !DILocation(line: 138, column: 18, scope: !193)
!196 = !DILocation(line: 140, column: 23, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !11, line: 140, column: 17)
!198 = !DILocation(line: 140, column: 53, scope: !197)
!199 = !DILocation(line: 140, column: 17, scope: !197)
!200 = !DILocation(line: 140, column: 60, scope: !197)
!201 = !DILocation(line: 140, column: 17, scope: !193)
!202 = !DILocation(line: 143, column: 29, scope: !203)
!203 = distinct !DILexicalBlock(scope: !197, file: !11, line: 141, column: 13)
!204 = !DILocation(line: 143, column: 24, scope: !203)
!205 = !DILocation(line: 143, column: 22, scope: !203)
!206 = !DILocation(line: 144, column: 13, scope: !203)
!207 = !DILocation(line: 147, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !197, file: !11, line: 146, column: 13)
!209 = !DILocation(line: 150, column: 5, scope: !194)
!210 = !DILocation(line: 151, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !185, file: !11, line: 151, column: 8)
!212 = !DILocation(line: 151, column: 8, scope: !185)
!213 = !DILocalVariable(name: "i", scope: !214, file: !11, line: 154, type: !12)
!214 = distinct !DILexicalBlock(scope: !215, file: !11, line: 153, column: 9)
!215 = distinct !DILexicalBlock(scope: !211, file: !11, line: 152, column: 5)
!216 = !DILocation(line: 154, column: 17, scope: !214)
!217 = !DILocalVariable(name: "buffer", scope: !214, file: !11, line: 155, type: !58)
!218 = !DILocation(line: 155, column: 17, scope: !214)
!219 = !DILocation(line: 157, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !214, file: !11, line: 157, column: 17)
!221 = !DILocation(line: 157, column: 22, scope: !220)
!222 = !DILocation(line: 157, column: 27, scope: !220)
!223 = !DILocation(line: 157, column: 30, scope: !220)
!224 = !DILocation(line: 157, column: 35, scope: !220)
!225 = !DILocation(line: 157, column: 17, scope: !214)
!226 = !DILocation(line: 159, column: 24, scope: !227)
!227 = distinct !DILexicalBlock(scope: !220, file: !11, line: 158, column: 13)
!228 = !DILocation(line: 159, column: 17, scope: !227)
!229 = !DILocation(line: 159, column: 30, scope: !227)
!230 = !DILocation(line: 161, column: 23, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !11, line: 161, column: 17)
!232 = !DILocation(line: 161, column: 21, scope: !231)
!233 = !DILocation(line: 161, column: 28, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !11, line: 161, column: 17)
!235 = !DILocation(line: 161, column: 30, scope: !234)
!236 = !DILocation(line: 161, column: 17, scope: !231)
!237 = !DILocation(line: 163, column: 41, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !11, line: 162, column: 17)
!239 = !DILocation(line: 163, column: 34, scope: !238)
!240 = !DILocation(line: 163, column: 21, scope: !238)
!241 = !DILocation(line: 164, column: 17, scope: !238)
!242 = !DILocation(line: 161, column: 37, scope: !234)
!243 = !DILocation(line: 161, column: 17, scope: !234)
!244 = distinct !{!244, !236, !245, !86}
!245 = !DILocation(line: 164, column: 17, scope: !231)
!246 = !DILocation(line: 165, column: 13, scope: !227)
!247 = !DILocation(line: 168, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !220, file: !11, line: 167, column: 13)
!249 = !DILocation(line: 171, column: 5, scope: !215)
!250 = !DILocation(line: 172, column: 1, scope: !185)
!251 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 175, type: !20, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!252 = !DILocalVariable(name: "data", scope: !251, file: !11, line: 177, type: !12)
!253 = !DILocation(line: 177, column: 9, scope: !251)
!254 = !DILocation(line: 179, column: 10, scope: !251)
!255 = !DILocation(line: 180, column: 8, scope: !256)
!256 = distinct !DILexicalBlock(scope: !251, file: !11, line: 180, column: 8)
!257 = !DILocation(line: 180, column: 8, scope: !251)
!258 = !DILocation(line: 183, column: 9, scope: !259)
!259 = distinct !DILexicalBlock(scope: !256, file: !11, line: 181, column: 5)
!260 = !DILocation(line: 184, column: 5, scope: !259)
!261 = !DILocation(line: 189, column: 14, scope: !262)
!262 = distinct !DILexicalBlock(scope: !256, file: !11, line: 186, column: 5)
!263 = !DILocation(line: 191, column: 8, scope: !264)
!264 = distinct !DILexicalBlock(scope: !251, file: !11, line: 191, column: 8)
!265 = !DILocation(line: 191, column: 8, scope: !251)
!266 = !DILocalVariable(name: "i", scope: !267, file: !11, line: 194, type: !12)
!267 = distinct !DILexicalBlock(scope: !268, file: !11, line: 193, column: 9)
!268 = distinct !DILexicalBlock(scope: !264, file: !11, line: 192, column: 5)
!269 = !DILocation(line: 194, column: 17, scope: !267)
!270 = !DILocalVariable(name: "buffer", scope: !267, file: !11, line: 195, type: !58)
!271 = !DILocation(line: 195, column: 17, scope: !267)
!272 = !DILocation(line: 198, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !267, file: !11, line: 198, column: 17)
!274 = !DILocation(line: 198, column: 22, scope: !273)
!275 = !DILocation(line: 198, column: 17, scope: !267)
!276 = !DILocation(line: 200, column: 24, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !11, line: 199, column: 13)
!278 = !DILocation(line: 200, column: 17, scope: !277)
!279 = !DILocation(line: 200, column: 30, scope: !277)
!280 = !DILocation(line: 202, column: 23, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !11, line: 202, column: 17)
!282 = !DILocation(line: 202, column: 21, scope: !281)
!283 = !DILocation(line: 202, column: 28, scope: !284)
!284 = distinct !DILexicalBlock(scope: !281, file: !11, line: 202, column: 17)
!285 = !DILocation(line: 202, column: 30, scope: !284)
!286 = !DILocation(line: 202, column: 17, scope: !281)
!287 = !DILocation(line: 204, column: 41, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !11, line: 203, column: 17)
!289 = !DILocation(line: 204, column: 34, scope: !288)
!290 = !DILocation(line: 204, column: 21, scope: !288)
!291 = !DILocation(line: 205, column: 17, scope: !288)
!292 = !DILocation(line: 202, column: 37, scope: !284)
!293 = !DILocation(line: 202, column: 17, scope: !284)
!294 = distinct !{!294, !286, !295, !86}
!295 = !DILocation(line: 205, column: 17, scope: !281)
!296 = !DILocation(line: 206, column: 13, scope: !277)
!297 = !DILocation(line: 209, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !273, file: !11, line: 208, column: 13)
!299 = !DILocation(line: 212, column: 5, scope: !268)
!300 = !DILocation(line: 213, column: 1, scope: !251)
!301 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 216, type: !20, scopeLine: 217, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!302 = !DILocalVariable(name: "data", scope: !301, file: !11, line: 218, type: !12)
!303 = !DILocation(line: 218, column: 9, scope: !301)
!304 = !DILocation(line: 220, column: 10, scope: !301)
!305 = !DILocation(line: 221, column: 8, scope: !306)
!306 = distinct !DILexicalBlock(scope: !301, file: !11, line: 221, column: 8)
!307 = !DILocation(line: 221, column: 8, scope: !301)
!308 = !DILocation(line: 225, column: 14, scope: !309)
!309 = distinct !DILexicalBlock(scope: !306, file: !11, line: 222, column: 5)
!310 = !DILocation(line: 226, column: 5, scope: !309)
!311 = !DILocation(line: 227, column: 8, scope: !312)
!312 = distinct !DILexicalBlock(scope: !301, file: !11, line: 227, column: 8)
!313 = !DILocation(line: 227, column: 8, scope: !301)
!314 = !DILocalVariable(name: "i", scope: !315, file: !11, line: 230, type: !12)
!315 = distinct !DILexicalBlock(scope: !316, file: !11, line: 229, column: 9)
!316 = distinct !DILexicalBlock(scope: !312, file: !11, line: 228, column: 5)
!317 = !DILocation(line: 230, column: 17, scope: !315)
!318 = !DILocalVariable(name: "buffer", scope: !315, file: !11, line: 231, type: !58)
!319 = !DILocation(line: 231, column: 17, scope: !315)
!320 = !DILocation(line: 234, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !315, file: !11, line: 234, column: 17)
!322 = !DILocation(line: 234, column: 22, scope: !321)
!323 = !DILocation(line: 234, column: 17, scope: !315)
!324 = !DILocation(line: 236, column: 24, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !11, line: 235, column: 13)
!326 = !DILocation(line: 236, column: 17, scope: !325)
!327 = !DILocation(line: 236, column: 30, scope: !325)
!328 = !DILocation(line: 238, column: 23, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !11, line: 238, column: 17)
!330 = !DILocation(line: 238, column: 21, scope: !329)
!331 = !DILocation(line: 238, column: 28, scope: !332)
!332 = distinct !DILexicalBlock(scope: !329, file: !11, line: 238, column: 17)
!333 = !DILocation(line: 238, column: 30, scope: !332)
!334 = !DILocation(line: 238, column: 17, scope: !329)
!335 = !DILocation(line: 240, column: 41, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !11, line: 239, column: 17)
!337 = !DILocation(line: 240, column: 34, scope: !336)
!338 = !DILocation(line: 240, column: 21, scope: !336)
!339 = !DILocation(line: 241, column: 17, scope: !336)
!340 = !DILocation(line: 238, column: 37, scope: !332)
!341 = !DILocation(line: 238, column: 17, scope: !332)
!342 = distinct !{!342, !334, !343, !86}
!343 = !DILocation(line: 241, column: 17, scope: !329)
!344 = !DILocation(line: 242, column: 13, scope: !325)
!345 = !DILocation(line: 245, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !321, file: !11, line: 244, column: 13)
!347 = !DILocation(line: 248, column: 5, scope: !316)
!348 = !DILocation(line: 249, column: 1, scope: !301)
