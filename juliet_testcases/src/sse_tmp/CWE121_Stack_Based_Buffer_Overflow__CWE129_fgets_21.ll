; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@badStatic = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !9
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !13
@goodG2BStatic = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 -1, i32* %data, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !29, metadata !DIExpression()), !dbg !35
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !38
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !39
  %cmp = icmp ne i8* %call, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !42
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !44
  store i32 %call2, i32* %data, align 4, !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 1, i32* @badStatic, align 4, !dbg !49
  %2 = load i32, i32* %data, align 4, !dbg !50
  call void @badSink(i32 %2), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* @badStatic, align 4, !dbg !58
  %tobool = icmp ne i32 %0, 0, !dbg !58
  br i1 %tobool, label %if.then, label %if.end5, !dbg !60

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !61, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !65, metadata !DIExpression()), !dbg !69
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !69
  %2 = load i32, i32* %data.addr, align 4, !dbg !70
  %cmp = icmp sge i32 %2, 0, !dbg !72
  br i1 %cmp, label %if.then1, label %if.else, !dbg !73

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !74
  %idxprom = sext i32 %3 to i64, !dbg !76
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !76
  store i32 1, i32* %arrayidx, align 4, !dbg !77
  store i32 0, i32* %i, align 4, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !81
  %cmp2 = icmp slt i32 %4, 10, !dbg !83
  br i1 %cmp2, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !85
  %idxprom3 = sext i32 %5 to i64, !dbg !87
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !87
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !87
  call void @printIntLine(i32 %6), !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !90
  %inc = add nsw i32 %7, 1, !dbg !90
  store i32 %inc, i32* %i, align 4, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !95

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !98

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21_good() #0 !dbg !100 {
entry:
  call void @goodB2G1(), !dbg !101
  call void @goodB2G2(), !dbg !102
  call void @goodG2B(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* null) #7, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #7, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 -1, i32* %data, align 4, !dbg !127
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !128, metadata !DIExpression()), !dbg !130
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !130
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !131
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !133
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !134
  %cmp = icmp ne i8* %call, null, !dbg !135
  br i1 %cmp, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !137
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !139
  store i32 %call2, i32* %data, align 4, !dbg !140
  br label %if.end, !dbg !141

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !142
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !144
  %2 = load i32, i32* %data, align 4, !dbg !145
  call void @goodB2G1Sink(i32 %2), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !148 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !151
  %tobool = icmp ne i32 %0, 0, !dbg !151
  br i1 %tobool, label %if.then, label %if.else, !dbg !153

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !154
  br label %if.end7, !dbg !156

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !157, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !161, metadata !DIExpression()), !dbg !162
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !162
  %2 = load i32, i32* %data.addr, align 4, !dbg !163
  %cmp = icmp sge i32 %2, 0, !dbg !165
  br i1 %cmp, label %land.lhs.true, label %if.else6, !dbg !166

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !167
  %cmp1 = icmp slt i32 %3, 10, !dbg !168
  br i1 %cmp1, label %if.then2, label %if.else6, !dbg !169

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !170
  %idxprom = sext i32 %4 to i64, !dbg !172
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !172
  store i32 1, i32* %arrayidx, align 4, !dbg !173
  store i32 0, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !177
  %cmp3 = icmp slt i32 %5, 10, !dbg !179
  br i1 %cmp3, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !181
  %idxprom4 = sext i32 %6 to i64, !dbg !183
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !183
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !183
  call void @printIntLine(i32 %7), !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !186
  %inc = add nsw i32 %8, 1, !dbg !186
  store i32 %inc, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !190

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !191
  br label %if.end

if.end:                                           ; preds = %if.else6, %for.end
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !193
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !194 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !195, metadata !DIExpression()), !dbg !196
  store i32 -1, i32* %data, align 4, !dbg !197
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !198, metadata !DIExpression()), !dbg !200
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !200
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !200
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !201
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !203
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !204
  %cmp = icmp ne i8* %call, null, !dbg !205
  br i1 %cmp, label %if.then, label %if.else, !dbg !206

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !207
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !209
  store i32 %call2, i32* %data, align 4, !dbg !210
  br label %if.end, !dbg !211

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !212
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !214
  %2 = load i32, i32* %data, align 4, !dbg !215
  call void @goodB2G2Sink(i32 %2), !dbg !216
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !218 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !219, metadata !DIExpression()), !dbg !220
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !221
  %tobool = icmp ne i32 %0, 0, !dbg !221
  br i1 %tobool, label %if.then, label %if.end6, !dbg !223

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !224, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !228, metadata !DIExpression()), !dbg !229
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !229
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !229
  %2 = load i32, i32* %data.addr, align 4, !dbg !230
  %cmp = icmp sge i32 %2, 0, !dbg !232
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !233

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !234
  %cmp1 = icmp slt i32 %3, 10, !dbg !235
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !236

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !237
  %idxprom = sext i32 %4 to i64, !dbg !239
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !239
  store i32 1, i32* %arrayidx, align 4, !dbg !240
  store i32 0, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !243

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !244
  %cmp3 = icmp slt i32 %5, 10, !dbg !246
  br i1 %cmp3, label %for.body, label %for.end, !dbg !247

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !248
  %idxprom4 = sext i32 %6 to i64, !dbg !250
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !250
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !250
  call void @printIntLine(i32 %7), !dbg !251
  br label %for.inc, !dbg !252

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !253
  %inc = add nsw i32 %8, 1, !dbg !253
  store i32 %inc, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !254, !llvm.loop !255

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !257

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !258
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end6, !dbg !260

if.end6:                                          ; preds = %if.end, %entry
  ret void, !dbg !261
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !262 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 -1, i32* %data, align 4, !dbg !265
  store i32 7, i32* %data, align 4, !dbg !266
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !267
  %0 = load i32, i32* %data, align 4, !dbg !268
  call void @goodG2BSink(i32 %0), !dbg !269
  ret void, !dbg !270
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !271 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !272, metadata !DIExpression()), !dbg !273
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !274
  %tobool = icmp ne i32 %0, 0, !dbg !274
  br i1 %tobool, label %if.then, label %if.end5, !dbg !276

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !277, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !281, metadata !DIExpression()), !dbg !282
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !282
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !282
  %2 = load i32, i32* %data.addr, align 4, !dbg !283
  %cmp = icmp sge i32 %2, 0, !dbg !285
  br i1 %cmp, label %if.then1, label %if.else, !dbg !286

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !287
  %idxprom = sext i32 %3 to i64, !dbg !289
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !289
  store i32 1, i32* %arrayidx, align 4, !dbg !290
  store i32 0, i32* %i, align 4, !dbg !291
  br label %for.cond, !dbg !293

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !294
  %cmp2 = icmp slt i32 %4, 10, !dbg !296
  br i1 %cmp2, label %for.body, label %for.end, !dbg !297

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !298
  %idxprom3 = sext i32 %5 to i64, !dbg !300
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !300
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !300
  call void @printIntLine(i32 %6), !dbg !301
  br label %for.inc, !dbg !302

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !303
  %inc = add nsw i32 %7, 1, !dbg !303
  store i32 %inc, i32* %i, align 4, !dbg !303
  br label %for.cond, !dbg !304, !llvm.loop !305

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !307

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !308
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !310

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !311
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
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !13, !15}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !11, line: 80, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !11, line: 81, type: !12, isLocal: true, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !11, line: 82, type: !12, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21_bad", scope: !11, file: !11, line: 53, type: !24, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !11, line: 55, type: !12)
!27 = !DILocation(line: 55, column: 9, scope: !23)
!28 = !DILocation(line: 57, column: 10, scope: !23)
!29 = !DILocalVariable(name: "inputBuffer", scope: !30, file: !11, line: 59, type: !31)
!30 = distinct !DILexicalBlock(scope: !23, file: !11, line: 58, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 112, elements: !33)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !{!34}
!34 = !DISubrange(count: 14)
!35 = !DILocation(line: 59, column: 14, scope: !30)
!36 = !DILocation(line: 61, column: 19, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !11, line: 61, column: 13)
!38 = !DILocation(line: 61, column: 49, scope: !37)
!39 = !DILocation(line: 61, column: 13, scope: !37)
!40 = !DILocation(line: 61, column: 56, scope: !37)
!41 = !DILocation(line: 61, column: 13, scope: !30)
!42 = !DILocation(line: 64, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !11, line: 62, column: 9)
!44 = !DILocation(line: 64, column: 20, scope: !43)
!45 = !DILocation(line: 64, column: 18, scope: !43)
!46 = !DILocation(line: 65, column: 9, scope: !43)
!47 = !DILocation(line: 68, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !11, line: 67, column: 9)
!49 = !DILocation(line: 71, column: 15, scope: !23)
!50 = !DILocation(line: 72, column: 13, scope: !23)
!51 = !DILocation(line: 72, column: 5, scope: !23)
!52 = !DILocation(line: 73, column: 1, scope: !23)
!53 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 27, type: !54, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !12}
!56 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !11, line: 27, type: !12)
!57 = !DILocation(line: 27, column: 25, scope: !53)
!58 = !DILocation(line: 29, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !11, line: 29, column: 8)
!60 = !DILocation(line: 29, column: 8, scope: !53)
!61 = !DILocalVariable(name: "i", scope: !62, file: !11, line: 32, type: !12)
!62 = distinct !DILexicalBlock(scope: !63, file: !11, line: 31, column: 9)
!63 = distinct !DILexicalBlock(scope: !59, file: !11, line: 30, column: 5)
!64 = !DILocation(line: 32, column: 17, scope: !62)
!65 = !DILocalVariable(name: "buffer", scope: !62, file: !11, line: 33, type: !66)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 10)
!69 = !DILocation(line: 33, column: 17, scope: !62)
!70 = !DILocation(line: 36, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !62, file: !11, line: 36, column: 17)
!72 = !DILocation(line: 36, column: 22, scope: !71)
!73 = !DILocation(line: 36, column: 17, scope: !62)
!74 = !DILocation(line: 38, column: 24, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !11, line: 37, column: 13)
!76 = !DILocation(line: 38, column: 17, scope: !75)
!77 = !DILocation(line: 38, column: 30, scope: !75)
!78 = !DILocation(line: 40, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !11, line: 40, column: 17)
!80 = !DILocation(line: 40, column: 21, scope: !79)
!81 = !DILocation(line: 40, column: 28, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !11, line: 40, column: 17)
!83 = !DILocation(line: 40, column: 30, scope: !82)
!84 = !DILocation(line: 40, column: 17, scope: !79)
!85 = !DILocation(line: 42, column: 41, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !11, line: 41, column: 17)
!87 = !DILocation(line: 42, column: 34, scope: !86)
!88 = !DILocation(line: 42, column: 21, scope: !86)
!89 = !DILocation(line: 43, column: 17, scope: !86)
!90 = !DILocation(line: 40, column: 37, scope: !82)
!91 = !DILocation(line: 40, column: 17, scope: !82)
!92 = distinct !{!92, !84, !93, !94}
!93 = !DILocation(line: 43, column: 17, scope: !79)
!94 = !{!"llvm.loop.mustprogress"}
!95 = !DILocation(line: 44, column: 13, scope: !75)
!96 = !DILocation(line: 47, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !71, file: !11, line: 46, column: 13)
!98 = !DILocation(line: 50, column: 5, scope: !63)
!99 = !DILocation(line: 51, column: 1, scope: !53)
!100 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_21_good", scope: !11, file: !11, line: 224, type: !24, scopeLine: 225, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocation(line: 226, column: 5, scope: !100)
!102 = !DILocation(line: 227, column: 5, scope: !100)
!103 = !DILocation(line: 228, column: 5, scope: !100)
!104 = !DILocation(line: 229, column: 1, scope: !100)
!105 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 240, type: !106, scopeLine: 241, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DISubroutineType(types: !107)
!107 = !{!12, !12, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !11, line: 240, type: !12)
!111 = !DILocation(line: 240, column: 14, scope: !105)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !11, line: 240, type: !108)
!113 = !DILocation(line: 240, column: 27, scope: !105)
!114 = !DILocation(line: 243, column: 22, scope: !105)
!115 = !DILocation(line: 243, column: 12, scope: !105)
!116 = !DILocation(line: 243, column: 5, scope: !105)
!117 = !DILocation(line: 245, column: 5, scope: !105)
!118 = !DILocation(line: 246, column: 5, scope: !105)
!119 = !DILocation(line: 247, column: 5, scope: !105)
!120 = !DILocation(line: 250, column: 5, scope: !105)
!121 = !DILocation(line: 251, column: 5, scope: !105)
!122 = !DILocation(line: 252, column: 5, scope: !105)
!123 = !DILocation(line: 254, column: 5, scope: !105)
!124 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 115, type: !24, scopeLine: 116, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !11, line: 117, type: !12)
!126 = !DILocation(line: 117, column: 9, scope: !124)
!127 = !DILocation(line: 119, column: 10, scope: !124)
!128 = !DILocalVariable(name: "inputBuffer", scope: !129, file: !11, line: 121, type: !31)
!129 = distinct !DILexicalBlock(scope: !124, file: !11, line: 120, column: 5)
!130 = !DILocation(line: 121, column: 14, scope: !129)
!131 = !DILocation(line: 123, column: 19, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !11, line: 123, column: 13)
!133 = !DILocation(line: 123, column: 49, scope: !132)
!134 = !DILocation(line: 123, column: 13, scope: !132)
!135 = !DILocation(line: 123, column: 56, scope: !132)
!136 = !DILocation(line: 123, column: 13, scope: !129)
!137 = !DILocation(line: 126, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !11, line: 124, column: 9)
!139 = !DILocation(line: 126, column: 20, scope: !138)
!140 = !DILocation(line: 126, column: 18, scope: !138)
!141 = !DILocation(line: 127, column: 9, scope: !138)
!142 = !DILocation(line: 130, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !132, file: !11, line: 129, column: 9)
!144 = !DILocation(line: 133, column: 20, scope: !124)
!145 = !DILocation(line: 134, column: 18, scope: !124)
!146 = !DILocation(line: 134, column: 5, scope: !124)
!147 = !DILocation(line: 135, column: 1, scope: !124)
!148 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !11, file: !11, line: 85, type: !54, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DILocalVariable(name: "data", arg: 1, scope: !148, file: !11, line: 85, type: !12)
!150 = !DILocation(line: 85, column: 30, scope: !148)
!151 = !DILocation(line: 87, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !11, line: 87, column: 8)
!153 = !DILocation(line: 87, column: 8, scope: !148)
!154 = !DILocation(line: 90, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !11, line: 88, column: 5)
!156 = !DILocation(line: 91, column: 5, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !11, line: 95, type: !12)
!158 = distinct !DILexicalBlock(scope: !159, file: !11, line: 94, column: 9)
!159 = distinct !DILexicalBlock(scope: !152, file: !11, line: 93, column: 5)
!160 = !DILocation(line: 95, column: 17, scope: !158)
!161 = !DILocalVariable(name: "buffer", scope: !158, file: !11, line: 96, type: !66)
!162 = !DILocation(line: 96, column: 17, scope: !158)
!163 = !DILocation(line: 98, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !158, file: !11, line: 98, column: 17)
!165 = !DILocation(line: 98, column: 22, scope: !164)
!166 = !DILocation(line: 98, column: 27, scope: !164)
!167 = !DILocation(line: 98, column: 30, scope: !164)
!168 = !DILocation(line: 98, column: 35, scope: !164)
!169 = !DILocation(line: 98, column: 17, scope: !158)
!170 = !DILocation(line: 100, column: 24, scope: !171)
!171 = distinct !DILexicalBlock(scope: !164, file: !11, line: 99, column: 13)
!172 = !DILocation(line: 100, column: 17, scope: !171)
!173 = !DILocation(line: 100, column: 30, scope: !171)
!174 = !DILocation(line: 102, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !11, line: 102, column: 17)
!176 = !DILocation(line: 102, column: 21, scope: !175)
!177 = !DILocation(line: 102, column: 28, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !11, line: 102, column: 17)
!179 = !DILocation(line: 102, column: 30, scope: !178)
!180 = !DILocation(line: 102, column: 17, scope: !175)
!181 = !DILocation(line: 104, column: 41, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !11, line: 103, column: 17)
!183 = !DILocation(line: 104, column: 34, scope: !182)
!184 = !DILocation(line: 104, column: 21, scope: !182)
!185 = !DILocation(line: 105, column: 17, scope: !182)
!186 = !DILocation(line: 102, column: 37, scope: !178)
!187 = !DILocation(line: 102, column: 17, scope: !178)
!188 = distinct !{!188, !180, !189, !94}
!189 = !DILocation(line: 105, column: 17, scope: !175)
!190 = !DILocation(line: 106, column: 13, scope: !171)
!191 = !DILocation(line: 109, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !164, file: !11, line: 108, column: 13)
!193 = !DILocation(line: 113, column: 1, scope: !148)
!194 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 163, type: !24, scopeLine: 164, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!195 = !DILocalVariable(name: "data", scope: !194, file: !11, line: 165, type: !12)
!196 = !DILocation(line: 165, column: 9, scope: !194)
!197 = !DILocation(line: 167, column: 10, scope: !194)
!198 = !DILocalVariable(name: "inputBuffer", scope: !199, file: !11, line: 169, type: !31)
!199 = distinct !DILexicalBlock(scope: !194, file: !11, line: 168, column: 5)
!200 = !DILocation(line: 169, column: 14, scope: !199)
!201 = !DILocation(line: 171, column: 19, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !11, line: 171, column: 13)
!203 = !DILocation(line: 171, column: 49, scope: !202)
!204 = !DILocation(line: 171, column: 13, scope: !202)
!205 = !DILocation(line: 171, column: 56, scope: !202)
!206 = !DILocation(line: 171, column: 13, scope: !199)
!207 = !DILocation(line: 174, column: 25, scope: !208)
!208 = distinct !DILexicalBlock(scope: !202, file: !11, line: 172, column: 9)
!209 = !DILocation(line: 174, column: 20, scope: !208)
!210 = !DILocation(line: 174, column: 18, scope: !208)
!211 = !DILocation(line: 175, column: 9, scope: !208)
!212 = !DILocation(line: 178, column: 13, scope: !213)
!213 = distinct !DILexicalBlock(scope: !202, file: !11, line: 177, column: 9)
!214 = !DILocation(line: 181, column: 20, scope: !194)
!215 = !DILocation(line: 182, column: 18, scope: !194)
!216 = !DILocation(line: 182, column: 5, scope: !194)
!217 = !DILocation(line: 183, column: 1, scope: !194)
!218 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !11, file: !11, line: 138, type: !54, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!219 = !DILocalVariable(name: "data", arg: 1, scope: !218, file: !11, line: 138, type: !12)
!220 = !DILocation(line: 138, column: 30, scope: !218)
!221 = !DILocation(line: 140, column: 8, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !11, line: 140, column: 8)
!223 = !DILocation(line: 140, column: 8, scope: !218)
!224 = !DILocalVariable(name: "i", scope: !225, file: !11, line: 143, type: !12)
!225 = distinct !DILexicalBlock(scope: !226, file: !11, line: 142, column: 9)
!226 = distinct !DILexicalBlock(scope: !222, file: !11, line: 141, column: 5)
!227 = !DILocation(line: 143, column: 17, scope: !225)
!228 = !DILocalVariable(name: "buffer", scope: !225, file: !11, line: 144, type: !66)
!229 = !DILocation(line: 144, column: 17, scope: !225)
!230 = !DILocation(line: 146, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !225, file: !11, line: 146, column: 17)
!232 = !DILocation(line: 146, column: 22, scope: !231)
!233 = !DILocation(line: 146, column: 27, scope: !231)
!234 = !DILocation(line: 146, column: 30, scope: !231)
!235 = !DILocation(line: 146, column: 35, scope: !231)
!236 = !DILocation(line: 146, column: 17, scope: !225)
!237 = !DILocation(line: 148, column: 24, scope: !238)
!238 = distinct !DILexicalBlock(scope: !231, file: !11, line: 147, column: 13)
!239 = !DILocation(line: 148, column: 17, scope: !238)
!240 = !DILocation(line: 148, column: 30, scope: !238)
!241 = !DILocation(line: 150, column: 23, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !11, line: 150, column: 17)
!243 = !DILocation(line: 150, column: 21, scope: !242)
!244 = !DILocation(line: 150, column: 28, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !11, line: 150, column: 17)
!246 = !DILocation(line: 150, column: 30, scope: !245)
!247 = !DILocation(line: 150, column: 17, scope: !242)
!248 = !DILocation(line: 152, column: 41, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !11, line: 151, column: 17)
!250 = !DILocation(line: 152, column: 34, scope: !249)
!251 = !DILocation(line: 152, column: 21, scope: !249)
!252 = !DILocation(line: 153, column: 17, scope: !249)
!253 = !DILocation(line: 150, column: 37, scope: !245)
!254 = !DILocation(line: 150, column: 17, scope: !245)
!255 = distinct !{!255, !247, !256, !94}
!256 = !DILocation(line: 153, column: 17, scope: !242)
!257 = !DILocation(line: 154, column: 13, scope: !238)
!258 = !DILocation(line: 157, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !231, file: !11, line: 156, column: 13)
!260 = !DILocation(line: 160, column: 5, scope: !226)
!261 = !DILocation(line: 161, column: 1, scope: !218)
!262 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 212, type: !24, scopeLine: 213, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!263 = !DILocalVariable(name: "data", scope: !262, file: !11, line: 214, type: !12)
!264 = !DILocation(line: 214, column: 9, scope: !262)
!265 = !DILocation(line: 216, column: 10, scope: !262)
!266 = !DILocation(line: 219, column: 10, scope: !262)
!267 = !DILocation(line: 220, column: 19, scope: !262)
!268 = !DILocation(line: 221, column: 17, scope: !262)
!269 = !DILocation(line: 221, column: 5, scope: !262)
!270 = !DILocation(line: 222, column: 1, scope: !262)
!271 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 186, type: !54, scopeLine: 187, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!272 = !DILocalVariable(name: "data", arg: 1, scope: !271, file: !11, line: 186, type: !12)
!273 = !DILocation(line: 186, column: 29, scope: !271)
!274 = !DILocation(line: 188, column: 8, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !11, line: 188, column: 8)
!276 = !DILocation(line: 188, column: 8, scope: !271)
!277 = !DILocalVariable(name: "i", scope: !278, file: !11, line: 191, type: !12)
!278 = distinct !DILexicalBlock(scope: !279, file: !11, line: 190, column: 9)
!279 = distinct !DILexicalBlock(scope: !275, file: !11, line: 189, column: 5)
!280 = !DILocation(line: 191, column: 17, scope: !278)
!281 = !DILocalVariable(name: "buffer", scope: !278, file: !11, line: 192, type: !66)
!282 = !DILocation(line: 192, column: 17, scope: !278)
!283 = !DILocation(line: 195, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !278, file: !11, line: 195, column: 17)
!285 = !DILocation(line: 195, column: 22, scope: !284)
!286 = !DILocation(line: 195, column: 17, scope: !278)
!287 = !DILocation(line: 197, column: 24, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !11, line: 196, column: 13)
!289 = !DILocation(line: 197, column: 17, scope: !288)
!290 = !DILocation(line: 197, column: 30, scope: !288)
!291 = !DILocation(line: 199, column: 23, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !11, line: 199, column: 17)
!293 = !DILocation(line: 199, column: 21, scope: !292)
!294 = !DILocation(line: 199, column: 28, scope: !295)
!295 = distinct !DILexicalBlock(scope: !292, file: !11, line: 199, column: 17)
!296 = !DILocation(line: 199, column: 30, scope: !295)
!297 = !DILocation(line: 199, column: 17, scope: !292)
!298 = !DILocation(line: 201, column: 41, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !11, line: 200, column: 17)
!300 = !DILocation(line: 201, column: 34, scope: !299)
!301 = !DILocation(line: 201, column: 21, scope: !299)
!302 = !DILocation(line: 202, column: 17, scope: !299)
!303 = !DILocation(line: 199, column: 37, scope: !295)
!304 = !DILocation(line: 199, column: 17, scope: !295)
!305 = distinct !{!305, !297, !306, !94}
!306 = !DILocation(line: 202, column: 17, scope: !292)
!307 = !DILocation(line: 203, column: 13, scope: !288)
!308 = !DILocation(line: 206, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !284, file: !11, line: 205, column: 13)
!310 = !DILocation(line: 209, column: 5, scope: !279)
!311 = !DILocation(line: 210, column: 1, scope: !271)
