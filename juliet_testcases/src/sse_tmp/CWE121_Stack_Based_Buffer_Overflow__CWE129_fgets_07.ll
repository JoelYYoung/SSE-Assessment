; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@staticFive = internal global i32 5, align 4, !dbg !0
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07_bad() #0 !dbg !17 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 -1, i32* %data, align 4, !dbg !22
  %0 = load i32, i32* @staticFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end5, !dbg !26

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !27, metadata !DIExpression()), !dbg !34
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !34
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !35
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !37
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !38
  %cmp1 = icmp ne i8* %call, null, !dbg !39
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !40

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !41
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !43
  store i32 %call4, i32* %data, align 4, !dbg !44
  br label %if.end, !dbg !45

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !48

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFive, align 4, !dbg !49
  %cmp6 = icmp eq i32 %3, 5, !dbg !51
  br i1 %cmp6, label %if.then7, label %if.end15, !dbg !52

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !53, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !57, metadata !DIExpression()), !dbg !61
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !61
  %5 = load i32, i32* %data, align 4, !dbg !62
  %cmp8 = icmp sge i32 %5, 0, !dbg !64
  br i1 %cmp8, label %if.then9, label %if.else13, !dbg !65

if.then9:                                         ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !66
  %idxprom = sext i32 %6 to i64, !dbg !68
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !68
  store i32 1, i32* %arrayidx, align 4, !dbg !69
  store i32 0, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %if.then9
  %7 = load i32, i32* %i, align 4, !dbg !73
  %cmp10 = icmp slt i32 %7, 10, !dbg !75
  br i1 %cmp10, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !77
  %idxprom11 = sext i32 %8 to i64, !dbg !79
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom11, !dbg !79
  %9 = load i32, i32* %arrayidx12, align 4, !dbg !79
  call void @printIntLine(i32 %9), !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !82
  %inc = add nsw i32 %10, 1, !dbg !82
  store i32 %inc, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  br label %if.end14, !dbg !87

if.else13:                                        ; preds = %if.then7
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %for.end
  br label %if.end15, !dbg !90

if.end15:                                         ; preds = %if.end14, %if.end5
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07_good() #0 !dbg !92 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07_bad(), !dbg !114
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !121
  %cmp = icmp eq i32 %0, 5, !dbg !123
  br i1 %cmp, label %if.then, label %if.end5, !dbg !124

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !125, metadata !DIExpression()), !dbg !128
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !128
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !129
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !131
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !132
  %cmp1 = icmp ne i8* %call, null, !dbg !133
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !134

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !135
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !137
  store i32 %call4, i32* %data, align 4, !dbg !138
  br label %if.end, !dbg !139

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !140
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !142

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFive, align 4, !dbg !143
  %cmp6 = icmp ne i32 %3, 5, !dbg !145
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !146

if.then7:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !147
  br label %if.end17, !dbg !149

if.else8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !150, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !154, metadata !DIExpression()), !dbg !155
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !155
  %5 = load i32, i32* %data, align 4, !dbg !156
  %cmp9 = icmp sge i32 %5, 0, !dbg !158
  br i1 %cmp9, label %land.lhs.true, label %if.else15, !dbg !159

land.lhs.true:                                    ; preds = %if.else8
  %6 = load i32, i32* %data, align 4, !dbg !160
  %cmp10 = icmp slt i32 %6, 10, !dbg !161
  br i1 %cmp10, label %if.then11, label %if.else15, !dbg !162

if.then11:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !163
  %idxprom = sext i32 %7 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !165
  store i32 1, i32* %arrayidx, align 4, !dbg !166
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %if.then11
  %8 = load i32, i32* %i, align 4, !dbg !170
  %cmp12 = icmp slt i32 %8, 10, !dbg !172
  br i1 %cmp12, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !174
  %idxprom13 = sext i32 %9 to i64, !dbg !176
  %arrayidx14 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom13, !dbg !176
  %10 = load i32, i32* %arrayidx14, align 4, !dbg !176
  call void @printIntLine(i32 %10), !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !179
  %inc = add nsw i32 %11, 1, !dbg !179
  store i32 %inc, i32* %i, align 4, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  br label %if.end16, !dbg !183

if.else15:                                        ; preds = %land.lhs.true, %if.else8
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !184
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %for.end
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then7
  ret void, !dbg !186
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !187 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 -1, i32* %data, align 4, !dbg !190
  %0 = load i32, i32* @staticFive, align 4, !dbg !191
  %cmp = icmp eq i32 %0, 5, !dbg !193
  br i1 %cmp, label %if.then, label %if.end5, !dbg !194

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !195, metadata !DIExpression()), !dbg !198
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !198
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !199
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !201
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !202
  %cmp1 = icmp ne i8* %call, null, !dbg !203
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !204

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !205
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !207
  store i32 %call4, i32* %data, align 4, !dbg !208
  br label %if.end, !dbg !209

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !210
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !212

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFive, align 4, !dbg !213
  %cmp6 = icmp eq i32 %3, 5, !dbg !215
  br i1 %cmp6, label %if.then7, label %if.end16, !dbg !216

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !217, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !221, metadata !DIExpression()), !dbg !222
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !222
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !222
  %5 = load i32, i32* %data, align 4, !dbg !223
  %cmp8 = icmp sge i32 %5, 0, !dbg !225
  br i1 %cmp8, label %land.lhs.true, label %if.else14, !dbg !226

land.lhs.true:                                    ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !227
  %cmp9 = icmp slt i32 %6, 10, !dbg !228
  br i1 %cmp9, label %if.then10, label %if.else14, !dbg !229

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !230
  %idxprom = sext i32 %7 to i64, !dbg !232
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !232
  store i32 1, i32* %arrayidx, align 4, !dbg !233
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !236

for.cond:                                         ; preds = %for.inc, %if.then10
  %8 = load i32, i32* %i, align 4, !dbg !237
  %cmp11 = icmp slt i32 %8, 10, !dbg !239
  br i1 %cmp11, label %for.body, label %for.end, !dbg !240

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !241
  %idxprom12 = sext i32 %9 to i64, !dbg !243
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !243
  %10 = load i32, i32* %arrayidx13, align 4, !dbg !243
  call void @printIntLine(i32 %10), !dbg !244
  br label %for.inc, !dbg !245

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !246
  %inc = add nsw i32 %11, 1, !dbg !246
  store i32 %inc, i32* %i, align 4, !dbg !246
  br label %for.cond, !dbg !247, !llvm.loop !248

for.end:                                          ; preds = %for.cond
  br label %if.end15, !dbg !250

if.else14:                                        ; preds = %land.lhs.true, %if.then7
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !251
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %for.end
  br label %if.end16, !dbg !253

if.end16:                                         ; preds = %if.end15, %if.end5
  ret void, !dbg !254
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !255 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 -1, i32* %data, align 4, !dbg !258
  %0 = load i32, i32* @staticFive, align 4, !dbg !259
  %cmp = icmp ne i32 %0, 5, !dbg !261
  br i1 %cmp, label %if.then, label %if.else, !dbg !262

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !263
  br label %if.end, !dbg !265

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !266
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !268
  %cmp1 = icmp eq i32 %1, 5, !dbg !270
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !271

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !272, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !276, metadata !DIExpression()), !dbg !277
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !277
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !277
  %3 = load i32, i32* %data, align 4, !dbg !278
  %cmp3 = icmp sge i32 %3, 0, !dbg !280
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !281

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !282
  %idxprom = sext i32 %4 to i64, !dbg !284
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !284
  store i32 1, i32* %arrayidx, align 4, !dbg !285
  store i32 0, i32* %i, align 4, !dbg !286
  br label %for.cond, !dbg !288

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !289
  %cmp5 = icmp slt i32 %5, 10, !dbg !291
  br i1 %cmp5, label %for.body, label %for.end, !dbg !292

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !293
  %idxprom6 = sext i32 %6 to i64, !dbg !295
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !295
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !295
  call void @printIntLine(i32 %7), !dbg !296
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !298
  %inc = add nsw i32 %8, 1, !dbg !298
  store i32 %inc, i32* %i, align 4, !dbg !298
  br label %for.cond, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !302

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !303
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !305

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !306
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !307 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !308, metadata !DIExpression()), !dbg !309
  store i32 -1, i32* %data, align 4, !dbg !310
  %0 = load i32, i32* @staticFive, align 4, !dbg !311
  %cmp = icmp eq i32 %0, 5, !dbg !313
  br i1 %cmp, label %if.then, label %if.end, !dbg !314

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !315
  br label %if.end, !dbg !317

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !318
  %cmp1 = icmp eq i32 %1, 5, !dbg !320
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !321

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !322, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !326, metadata !DIExpression()), !dbg !327
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !327
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !327
  %3 = load i32, i32* %data, align 4, !dbg !328
  %cmp3 = icmp sge i32 %3, 0, !dbg !330
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !331

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !332
  %idxprom = sext i32 %4 to i64, !dbg !334
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !334
  store i32 1, i32* %arrayidx, align 4, !dbg !335
  store i32 0, i32* %i, align 4, !dbg !336
  br label %for.cond, !dbg !338

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !339
  %cmp5 = icmp slt i32 %5, 10, !dbg !341
  br i1 %cmp5, label %for.body, label %for.end, !dbg !342

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !343
  %idxprom6 = sext i32 %6 to i64, !dbg !345
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !345
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !345
  call void @printIntLine(i32 %7), !dbg !346
  br label %for.inc, !dbg !347

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !348
  %inc = add nsw i32 %8, 1, !dbg !348
  store i32 %inc, i32* %i, align 4, !dbg !348
  br label %for.cond, !dbg !349, !llvm.loop !350

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !352

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !353
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !355

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !356
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
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07.c", directory: "/home/joelyang/SSE-Assessment")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07_bad", scope: !9, file: !9, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !17, file: !9, line: 31, type: !10)
!21 = !DILocation(line: 31, column: 9, scope: !17)
!22 = !DILocation(line: 33, column: 10, scope: !17)
!23 = !DILocation(line: 34, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !9, line: 34, column: 8)
!25 = !DILocation(line: 34, column: 18, scope: !24)
!26 = !DILocation(line: 34, column: 8, scope: !17)
!27 = !DILocalVariable(name: "inputBuffer", scope: !28, file: !9, line: 37, type: !30)
!28 = distinct !DILexicalBlock(scope: !29, file: !9, line: 36, column: 9)
!29 = distinct !DILexicalBlock(scope: !24, file: !9, line: 35, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 112, elements: !32)
!31 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!32 = !{!33}
!33 = !DISubrange(count: 14)
!34 = !DILocation(line: 37, column: 18, scope: !28)
!35 = !DILocation(line: 39, column: 23, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !9, line: 39, column: 17)
!37 = !DILocation(line: 39, column: 53, scope: !36)
!38 = !DILocation(line: 39, column: 17, scope: !36)
!39 = !DILocation(line: 39, column: 60, scope: !36)
!40 = !DILocation(line: 39, column: 17, scope: !28)
!41 = !DILocation(line: 42, column: 29, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !9, line: 40, column: 13)
!43 = !DILocation(line: 42, column: 24, scope: !42)
!44 = !DILocation(line: 42, column: 22, scope: !42)
!45 = !DILocation(line: 43, column: 13, scope: !42)
!46 = !DILocation(line: 46, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !9, line: 45, column: 13)
!48 = !DILocation(line: 49, column: 5, scope: !29)
!49 = !DILocation(line: 50, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !17, file: !9, line: 50, column: 8)
!51 = !DILocation(line: 50, column: 18, scope: !50)
!52 = !DILocation(line: 50, column: 8, scope: !17)
!53 = !DILocalVariable(name: "i", scope: !54, file: !9, line: 53, type: !10)
!54 = distinct !DILexicalBlock(scope: !55, file: !9, line: 52, column: 9)
!55 = distinct !DILexicalBlock(scope: !50, file: !9, line: 51, column: 5)
!56 = !DILocation(line: 53, column: 17, scope: !54)
!57 = !DILocalVariable(name: "buffer", scope: !54, file: !9, line: 54, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 10)
!61 = !DILocation(line: 54, column: 17, scope: !54)
!62 = !DILocation(line: 57, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !54, file: !9, line: 57, column: 17)
!64 = !DILocation(line: 57, column: 22, scope: !63)
!65 = !DILocation(line: 57, column: 17, scope: !54)
!66 = !DILocation(line: 59, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !9, line: 58, column: 13)
!68 = !DILocation(line: 59, column: 17, scope: !67)
!69 = !DILocation(line: 59, column: 30, scope: !67)
!70 = !DILocation(line: 61, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !9, line: 61, column: 17)
!72 = !DILocation(line: 61, column: 21, scope: !71)
!73 = !DILocation(line: 61, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !9, line: 61, column: 17)
!75 = !DILocation(line: 61, column: 30, scope: !74)
!76 = !DILocation(line: 61, column: 17, scope: !71)
!77 = !DILocation(line: 63, column: 41, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !9, line: 62, column: 17)
!79 = !DILocation(line: 63, column: 34, scope: !78)
!80 = !DILocation(line: 63, column: 21, scope: !78)
!81 = !DILocation(line: 64, column: 17, scope: !78)
!82 = !DILocation(line: 61, column: 37, scope: !74)
!83 = !DILocation(line: 61, column: 17, scope: !74)
!84 = distinct !{!84, !76, !85, !86}
!85 = !DILocation(line: 64, column: 17, scope: !71)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 65, column: 13, scope: !67)
!88 = !DILocation(line: 68, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !63, file: !9, line: 67, column: 13)
!90 = !DILocation(line: 71, column: 5, scope: !55)
!91 = !DILocation(line: 72, column: 1, scope: !17)
!92 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_07_good", scope: !9, file: !9, line: 250, type: !18, scopeLine: 251, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 252, column: 5, scope: !92)
!94 = !DILocation(line: 253, column: 5, scope: !92)
!95 = !DILocation(line: 254, column: 5, scope: !92)
!96 = !DILocation(line: 255, column: 5, scope: !92)
!97 = !DILocation(line: 256, column: 1, scope: !92)
!98 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 267, type: !99, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DISubroutineType(types: !100)
!100 = !{!10, !10, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !9, line: 267, type: !10)
!104 = !DILocation(line: 267, column: 14, scope: !98)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !9, line: 267, type: !101)
!106 = !DILocation(line: 267, column: 27, scope: !98)
!107 = !DILocation(line: 270, column: 22, scope: !98)
!108 = !DILocation(line: 270, column: 12, scope: !98)
!109 = !DILocation(line: 270, column: 5, scope: !98)
!110 = !DILocation(line: 272, column: 5, scope: !98)
!111 = !DILocation(line: 273, column: 5, scope: !98)
!112 = !DILocation(line: 274, column: 5, scope: !98)
!113 = !DILocation(line: 277, column: 5, scope: !98)
!114 = !DILocation(line: 278, column: 5, scope: !98)
!115 = !DILocation(line: 279, column: 5, scope: !98)
!116 = !DILocation(line: 281, column: 5, scope: !98)
!117 = distinct !DISubprogram(name: "goodB2G1", scope: !9, file: !9, line: 79, type: !18, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !9, line: 81, type: !10)
!119 = !DILocation(line: 81, column: 9, scope: !117)
!120 = !DILocation(line: 83, column: 10, scope: !117)
!121 = !DILocation(line: 84, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !9, line: 84, column: 8)
!123 = !DILocation(line: 84, column: 18, scope: !122)
!124 = !DILocation(line: 84, column: 8, scope: !117)
!125 = !DILocalVariable(name: "inputBuffer", scope: !126, file: !9, line: 87, type: !30)
!126 = distinct !DILexicalBlock(scope: !127, file: !9, line: 86, column: 9)
!127 = distinct !DILexicalBlock(scope: !122, file: !9, line: 85, column: 5)
!128 = !DILocation(line: 87, column: 18, scope: !126)
!129 = !DILocation(line: 89, column: 23, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !9, line: 89, column: 17)
!131 = !DILocation(line: 89, column: 53, scope: !130)
!132 = !DILocation(line: 89, column: 17, scope: !130)
!133 = !DILocation(line: 89, column: 60, scope: !130)
!134 = !DILocation(line: 89, column: 17, scope: !126)
!135 = !DILocation(line: 92, column: 29, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !9, line: 90, column: 13)
!137 = !DILocation(line: 92, column: 24, scope: !136)
!138 = !DILocation(line: 92, column: 22, scope: !136)
!139 = !DILocation(line: 93, column: 13, scope: !136)
!140 = !DILocation(line: 96, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !130, file: !9, line: 95, column: 13)
!142 = !DILocation(line: 99, column: 5, scope: !127)
!143 = !DILocation(line: 100, column: 8, scope: !144)
!144 = distinct !DILexicalBlock(scope: !117, file: !9, line: 100, column: 8)
!145 = !DILocation(line: 100, column: 18, scope: !144)
!146 = !DILocation(line: 100, column: 8, scope: !117)
!147 = !DILocation(line: 103, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !9, line: 101, column: 5)
!149 = !DILocation(line: 104, column: 5, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !151, file: !9, line: 108, type: !10)
!151 = distinct !DILexicalBlock(scope: !152, file: !9, line: 107, column: 9)
!152 = distinct !DILexicalBlock(scope: !144, file: !9, line: 106, column: 5)
!153 = !DILocation(line: 108, column: 17, scope: !151)
!154 = !DILocalVariable(name: "buffer", scope: !151, file: !9, line: 109, type: !58)
!155 = !DILocation(line: 109, column: 17, scope: !151)
!156 = !DILocation(line: 111, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !151, file: !9, line: 111, column: 17)
!158 = !DILocation(line: 111, column: 22, scope: !157)
!159 = !DILocation(line: 111, column: 27, scope: !157)
!160 = !DILocation(line: 111, column: 30, scope: !157)
!161 = !DILocation(line: 111, column: 35, scope: !157)
!162 = !DILocation(line: 111, column: 17, scope: !151)
!163 = !DILocation(line: 113, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !9, line: 112, column: 13)
!165 = !DILocation(line: 113, column: 17, scope: !164)
!166 = !DILocation(line: 113, column: 30, scope: !164)
!167 = !DILocation(line: 115, column: 23, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !9, line: 115, column: 17)
!169 = !DILocation(line: 115, column: 21, scope: !168)
!170 = !DILocation(line: 115, column: 28, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !9, line: 115, column: 17)
!172 = !DILocation(line: 115, column: 30, scope: !171)
!173 = !DILocation(line: 115, column: 17, scope: !168)
!174 = !DILocation(line: 117, column: 41, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !9, line: 116, column: 17)
!176 = !DILocation(line: 117, column: 34, scope: !175)
!177 = !DILocation(line: 117, column: 21, scope: !175)
!178 = !DILocation(line: 118, column: 17, scope: !175)
!179 = !DILocation(line: 115, column: 37, scope: !171)
!180 = !DILocation(line: 115, column: 17, scope: !171)
!181 = distinct !{!181, !173, !182, !86}
!182 = !DILocation(line: 118, column: 17, scope: !168)
!183 = !DILocation(line: 119, column: 13, scope: !164)
!184 = !DILocation(line: 122, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !157, file: !9, line: 121, column: 13)
!186 = !DILocation(line: 126, column: 1, scope: !117)
!187 = distinct !DISubprogram(name: "goodB2G2", scope: !9, file: !9, line: 129, type: !18, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocalVariable(name: "data", scope: !187, file: !9, line: 131, type: !10)
!189 = !DILocation(line: 131, column: 9, scope: !187)
!190 = !DILocation(line: 133, column: 10, scope: !187)
!191 = !DILocation(line: 134, column: 8, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !9, line: 134, column: 8)
!193 = !DILocation(line: 134, column: 18, scope: !192)
!194 = !DILocation(line: 134, column: 8, scope: !187)
!195 = !DILocalVariable(name: "inputBuffer", scope: !196, file: !9, line: 137, type: !30)
!196 = distinct !DILexicalBlock(scope: !197, file: !9, line: 136, column: 9)
!197 = distinct !DILexicalBlock(scope: !192, file: !9, line: 135, column: 5)
!198 = !DILocation(line: 137, column: 18, scope: !196)
!199 = !DILocation(line: 139, column: 23, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !9, line: 139, column: 17)
!201 = !DILocation(line: 139, column: 53, scope: !200)
!202 = !DILocation(line: 139, column: 17, scope: !200)
!203 = !DILocation(line: 139, column: 60, scope: !200)
!204 = !DILocation(line: 139, column: 17, scope: !196)
!205 = !DILocation(line: 142, column: 29, scope: !206)
!206 = distinct !DILexicalBlock(scope: !200, file: !9, line: 140, column: 13)
!207 = !DILocation(line: 142, column: 24, scope: !206)
!208 = !DILocation(line: 142, column: 22, scope: !206)
!209 = !DILocation(line: 143, column: 13, scope: !206)
!210 = !DILocation(line: 146, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !200, file: !9, line: 145, column: 13)
!212 = !DILocation(line: 149, column: 5, scope: !197)
!213 = !DILocation(line: 150, column: 8, scope: !214)
!214 = distinct !DILexicalBlock(scope: !187, file: !9, line: 150, column: 8)
!215 = !DILocation(line: 150, column: 18, scope: !214)
!216 = !DILocation(line: 150, column: 8, scope: !187)
!217 = !DILocalVariable(name: "i", scope: !218, file: !9, line: 153, type: !10)
!218 = distinct !DILexicalBlock(scope: !219, file: !9, line: 152, column: 9)
!219 = distinct !DILexicalBlock(scope: !214, file: !9, line: 151, column: 5)
!220 = !DILocation(line: 153, column: 17, scope: !218)
!221 = !DILocalVariable(name: "buffer", scope: !218, file: !9, line: 154, type: !58)
!222 = !DILocation(line: 154, column: 17, scope: !218)
!223 = !DILocation(line: 156, column: 17, scope: !224)
!224 = distinct !DILexicalBlock(scope: !218, file: !9, line: 156, column: 17)
!225 = !DILocation(line: 156, column: 22, scope: !224)
!226 = !DILocation(line: 156, column: 27, scope: !224)
!227 = !DILocation(line: 156, column: 30, scope: !224)
!228 = !DILocation(line: 156, column: 35, scope: !224)
!229 = !DILocation(line: 156, column: 17, scope: !218)
!230 = !DILocation(line: 158, column: 24, scope: !231)
!231 = distinct !DILexicalBlock(scope: !224, file: !9, line: 157, column: 13)
!232 = !DILocation(line: 158, column: 17, scope: !231)
!233 = !DILocation(line: 158, column: 30, scope: !231)
!234 = !DILocation(line: 160, column: 23, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !9, line: 160, column: 17)
!236 = !DILocation(line: 160, column: 21, scope: !235)
!237 = !DILocation(line: 160, column: 28, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !9, line: 160, column: 17)
!239 = !DILocation(line: 160, column: 30, scope: !238)
!240 = !DILocation(line: 160, column: 17, scope: !235)
!241 = !DILocation(line: 162, column: 41, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !9, line: 161, column: 17)
!243 = !DILocation(line: 162, column: 34, scope: !242)
!244 = !DILocation(line: 162, column: 21, scope: !242)
!245 = !DILocation(line: 163, column: 17, scope: !242)
!246 = !DILocation(line: 160, column: 37, scope: !238)
!247 = !DILocation(line: 160, column: 17, scope: !238)
!248 = distinct !{!248, !240, !249, !86}
!249 = !DILocation(line: 163, column: 17, scope: !235)
!250 = !DILocation(line: 164, column: 13, scope: !231)
!251 = !DILocation(line: 167, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !224, file: !9, line: 166, column: 13)
!253 = !DILocation(line: 170, column: 5, scope: !219)
!254 = !DILocation(line: 171, column: 1, scope: !187)
!255 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 174, type: !18, scopeLine: 175, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!256 = !DILocalVariable(name: "data", scope: !255, file: !9, line: 176, type: !10)
!257 = !DILocation(line: 176, column: 9, scope: !255)
!258 = !DILocation(line: 178, column: 10, scope: !255)
!259 = !DILocation(line: 179, column: 8, scope: !260)
!260 = distinct !DILexicalBlock(scope: !255, file: !9, line: 179, column: 8)
!261 = !DILocation(line: 179, column: 18, scope: !260)
!262 = !DILocation(line: 179, column: 8, scope: !255)
!263 = !DILocation(line: 182, column: 9, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !9, line: 180, column: 5)
!265 = !DILocation(line: 183, column: 5, scope: !264)
!266 = !DILocation(line: 188, column: 14, scope: !267)
!267 = distinct !DILexicalBlock(scope: !260, file: !9, line: 185, column: 5)
!268 = !DILocation(line: 190, column: 8, scope: !269)
!269 = distinct !DILexicalBlock(scope: !255, file: !9, line: 190, column: 8)
!270 = !DILocation(line: 190, column: 18, scope: !269)
!271 = !DILocation(line: 190, column: 8, scope: !255)
!272 = !DILocalVariable(name: "i", scope: !273, file: !9, line: 193, type: !10)
!273 = distinct !DILexicalBlock(scope: !274, file: !9, line: 192, column: 9)
!274 = distinct !DILexicalBlock(scope: !269, file: !9, line: 191, column: 5)
!275 = !DILocation(line: 193, column: 17, scope: !273)
!276 = !DILocalVariable(name: "buffer", scope: !273, file: !9, line: 194, type: !58)
!277 = !DILocation(line: 194, column: 17, scope: !273)
!278 = !DILocation(line: 197, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !273, file: !9, line: 197, column: 17)
!280 = !DILocation(line: 197, column: 22, scope: !279)
!281 = !DILocation(line: 197, column: 17, scope: !273)
!282 = !DILocation(line: 199, column: 24, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !9, line: 198, column: 13)
!284 = !DILocation(line: 199, column: 17, scope: !283)
!285 = !DILocation(line: 199, column: 30, scope: !283)
!286 = !DILocation(line: 201, column: 23, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !9, line: 201, column: 17)
!288 = !DILocation(line: 201, column: 21, scope: !287)
!289 = !DILocation(line: 201, column: 28, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !9, line: 201, column: 17)
!291 = !DILocation(line: 201, column: 30, scope: !290)
!292 = !DILocation(line: 201, column: 17, scope: !287)
!293 = !DILocation(line: 203, column: 41, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !9, line: 202, column: 17)
!295 = !DILocation(line: 203, column: 34, scope: !294)
!296 = !DILocation(line: 203, column: 21, scope: !294)
!297 = !DILocation(line: 204, column: 17, scope: !294)
!298 = !DILocation(line: 201, column: 37, scope: !290)
!299 = !DILocation(line: 201, column: 17, scope: !290)
!300 = distinct !{!300, !292, !301, !86}
!301 = !DILocation(line: 204, column: 17, scope: !287)
!302 = !DILocation(line: 205, column: 13, scope: !283)
!303 = !DILocation(line: 208, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !279, file: !9, line: 207, column: 13)
!305 = !DILocation(line: 211, column: 5, scope: !274)
!306 = !DILocation(line: 212, column: 1, scope: !255)
!307 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 215, type: !18, scopeLine: 216, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!308 = !DILocalVariable(name: "data", scope: !307, file: !9, line: 217, type: !10)
!309 = !DILocation(line: 217, column: 9, scope: !307)
!310 = !DILocation(line: 219, column: 10, scope: !307)
!311 = !DILocation(line: 220, column: 8, scope: !312)
!312 = distinct !DILexicalBlock(scope: !307, file: !9, line: 220, column: 8)
!313 = !DILocation(line: 220, column: 18, scope: !312)
!314 = !DILocation(line: 220, column: 8, scope: !307)
!315 = !DILocation(line: 224, column: 14, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !9, line: 221, column: 5)
!317 = !DILocation(line: 225, column: 5, scope: !316)
!318 = !DILocation(line: 226, column: 8, scope: !319)
!319 = distinct !DILexicalBlock(scope: !307, file: !9, line: 226, column: 8)
!320 = !DILocation(line: 226, column: 18, scope: !319)
!321 = !DILocation(line: 226, column: 8, scope: !307)
!322 = !DILocalVariable(name: "i", scope: !323, file: !9, line: 229, type: !10)
!323 = distinct !DILexicalBlock(scope: !324, file: !9, line: 228, column: 9)
!324 = distinct !DILexicalBlock(scope: !319, file: !9, line: 227, column: 5)
!325 = !DILocation(line: 229, column: 17, scope: !323)
!326 = !DILocalVariable(name: "buffer", scope: !323, file: !9, line: 230, type: !58)
!327 = !DILocation(line: 230, column: 17, scope: !323)
!328 = !DILocation(line: 233, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !323, file: !9, line: 233, column: 17)
!330 = !DILocation(line: 233, column: 22, scope: !329)
!331 = !DILocation(line: 233, column: 17, scope: !323)
!332 = !DILocation(line: 235, column: 24, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !9, line: 234, column: 13)
!334 = !DILocation(line: 235, column: 17, scope: !333)
!335 = !DILocation(line: 235, column: 30, scope: !333)
!336 = !DILocation(line: 237, column: 23, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !9, line: 237, column: 17)
!338 = !DILocation(line: 237, column: 21, scope: !337)
!339 = !DILocation(line: 237, column: 28, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !9, line: 237, column: 17)
!341 = !DILocation(line: 237, column: 30, scope: !340)
!342 = !DILocation(line: 237, column: 17, scope: !337)
!343 = !DILocation(line: 239, column: 41, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !9, line: 238, column: 17)
!345 = !DILocation(line: 239, column: 34, scope: !344)
!346 = !DILocation(line: 239, column: 21, scope: !344)
!347 = !DILocation(line: 240, column: 17, scope: !344)
!348 = !DILocation(line: 237, column: 37, scope: !340)
!349 = !DILocation(line: 237, column: 17, scope: !340)
!350 = distinct !{!350, !342, !351, !86}
!351 = !DILocation(line: 240, column: 17, scope: !337)
!352 = !DILocation(line: 241, column: 13, scope: !333)
!353 = !DILocation(line: 244, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !329, file: !9, line: 243, column: 13)
!355 = !DILocation(line: 247, column: 5, scope: !324)
!356 = !DILocation(line: 248, column: 1, scope: !307)
