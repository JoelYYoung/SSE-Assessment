; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@globalFive = external dso_local global i32, align 4
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* @globalFive, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 5, !dbg !22
  br i1 %cmp, label %if.then, label %if.end5, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !24, metadata !DIExpression()), !dbg !31
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !31
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !32
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !34
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !35
  %cmp1 = icmp ne i8* %call, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !37

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !38
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !40
  store i32 %call4, i32* %data, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !45

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFive, align 4, !dbg !46
  %cmp6 = icmp eq i32 %3, 5, !dbg !48
  br i1 %cmp6, label %if.then7, label %if.end15, !dbg !49

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !50, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !54, metadata !DIExpression()), !dbg !58
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !58
  %5 = load i32, i32* %data, align 4, !dbg !59
  %cmp8 = icmp sge i32 %5, 0, !dbg !61
  br i1 %cmp8, label %if.then9, label %if.else13, !dbg !62

if.then9:                                         ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !63
  %idxprom = sext i32 %6 to i64, !dbg !65
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !65
  store i32 1, i32* %arrayidx, align 4, !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %if.then9
  %7 = load i32, i32* %i, align 4, !dbg !70
  %cmp10 = icmp slt i32 %7, 10, !dbg !72
  br i1 %cmp10, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !74
  %idxprom11 = sext i32 %8 to i64, !dbg !76
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom11, !dbg !76
  %9 = load i32, i32* %arrayidx12, align 4, !dbg !76
  call void @printIntLine(i32 %9), !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !79
  %inc = add nsw i32 %10, 1, !dbg !79
  store i32 %inc, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  br label %if.end14, !dbg !84

if.else13:                                        ; preds = %if.then7
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %for.end
  br label %if.end15, !dbg !87

if.end15:                                         ; preds = %if.end14, %if.end5
  ret void, !dbg !88
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14_good() #0 !dbg !89 {
entry:
  call void @goodB2G1(), !dbg !90
  call void @goodB2G2(), !dbg !91
  call void @goodG2B1(), !dbg !92
  call void @goodG2B2(), !dbg !93
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #7, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #7, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !114 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 -1, i32* %data, align 4, !dbg !117
  %0 = load i32, i32* @globalFive, align 4, !dbg !118
  %cmp = icmp eq i32 %0, 5, !dbg !120
  br i1 %cmp, label %if.then, label %if.end5, !dbg !121

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !122, metadata !DIExpression()), !dbg !125
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !125
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !126
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !128
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !129
  %cmp1 = icmp ne i8* %call, null, !dbg !130
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !131

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !132
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !134
  store i32 %call4, i32* %data, align 4, !dbg !135
  br label %if.end, !dbg !136

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !137
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !139

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFive, align 4, !dbg !140
  %cmp6 = icmp ne i32 %3, 5, !dbg !142
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !143

if.then7:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !144
  br label %if.end17, !dbg !146

if.else8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !151, metadata !DIExpression()), !dbg !152
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !152
  %5 = load i32, i32* %data, align 4, !dbg !153
  %cmp9 = icmp sge i32 %5, 0, !dbg !155
  br i1 %cmp9, label %land.lhs.true, label %if.else15, !dbg !156

land.lhs.true:                                    ; preds = %if.else8
  %6 = load i32, i32* %data, align 4, !dbg !157
  %cmp10 = icmp slt i32 %6, 10, !dbg !158
  br i1 %cmp10, label %if.then11, label %if.else15, !dbg !159

if.then11:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !160
  %idxprom = sext i32 %7 to i64, !dbg !162
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !162
  store i32 1, i32* %arrayidx, align 4, !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.then11
  %8 = load i32, i32* %i, align 4, !dbg !167
  %cmp12 = icmp slt i32 %8, 10, !dbg !169
  br i1 %cmp12, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !171
  %idxprom13 = sext i32 %9 to i64, !dbg !173
  %arrayidx14 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom13, !dbg !173
  %10 = load i32, i32* %arrayidx14, align 4, !dbg !173
  call void @printIntLine(i32 %10), !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !176
  %inc = add nsw i32 %11, 1, !dbg !176
  store i32 %inc, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  br label %if.end16, !dbg !180

if.else15:                                        ; preds = %land.lhs.true, %if.else8
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !181
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %for.end
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then7
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !184 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !185, metadata !DIExpression()), !dbg !186
  store i32 -1, i32* %data, align 4, !dbg !187
  %0 = load i32, i32* @globalFive, align 4, !dbg !188
  %cmp = icmp eq i32 %0, 5, !dbg !190
  br i1 %cmp, label %if.then, label %if.end5, !dbg !191

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !192, metadata !DIExpression()), !dbg !195
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !195
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !195
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !196
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !198
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !199
  %cmp1 = icmp ne i8* %call, null, !dbg !200
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !201

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !202
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !204
  store i32 %call4, i32* %data, align 4, !dbg !205
  br label %if.end, !dbg !206

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !207
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !209

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFive, align 4, !dbg !210
  %cmp6 = icmp eq i32 %3, 5, !dbg !212
  br i1 %cmp6, label %if.then7, label %if.end16, !dbg !213

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !214, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !218, metadata !DIExpression()), !dbg !219
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !219
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !219
  %5 = load i32, i32* %data, align 4, !dbg !220
  %cmp8 = icmp sge i32 %5, 0, !dbg !222
  br i1 %cmp8, label %land.lhs.true, label %if.else14, !dbg !223

land.lhs.true:                                    ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !224
  %cmp9 = icmp slt i32 %6, 10, !dbg !225
  br i1 %cmp9, label %if.then10, label %if.else14, !dbg !226

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !227
  %idxprom = sext i32 %7 to i64, !dbg !229
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !229
  store i32 1, i32* %arrayidx, align 4, !dbg !230
  store i32 0, i32* %i, align 4, !dbg !231
  br label %for.cond, !dbg !233

for.cond:                                         ; preds = %for.inc, %if.then10
  %8 = load i32, i32* %i, align 4, !dbg !234
  %cmp11 = icmp slt i32 %8, 10, !dbg !236
  br i1 %cmp11, label %for.body, label %for.end, !dbg !237

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !238
  %idxprom12 = sext i32 %9 to i64, !dbg !240
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !240
  %10 = load i32, i32* %arrayidx13, align 4, !dbg !240
  call void @printIntLine(i32 %10), !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !243
  %inc = add nsw i32 %11, 1, !dbg !243
  store i32 %inc, i32* %i, align 4, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  br label %if.end15, !dbg !247

if.else14:                                        ; preds = %land.lhs.true, %if.then7
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !248
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %for.end
  br label %if.end16, !dbg !250

if.end16:                                         ; preds = %if.end15, %if.end5
  ret void, !dbg !251
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !252 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %data, align 4, !dbg !255
  %0 = load i32, i32* @globalFive, align 4, !dbg !256
  %cmp = icmp ne i32 %0, 5, !dbg !258
  br i1 %cmp, label %if.then, label %if.else, !dbg !259

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !260
  br label %if.end, !dbg !262

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !263
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !265
  %cmp1 = icmp eq i32 %1, 5, !dbg !267
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !268

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !269, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !273, metadata !DIExpression()), !dbg !274
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !274
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !274
  %3 = load i32, i32* %data, align 4, !dbg !275
  %cmp3 = icmp sge i32 %3, 0, !dbg !277
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !278

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !279
  %idxprom = sext i32 %4 to i64, !dbg !281
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !281
  store i32 1, i32* %arrayidx, align 4, !dbg !282
  store i32 0, i32* %i, align 4, !dbg !283
  br label %for.cond, !dbg !285

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !286
  %cmp5 = icmp slt i32 %5, 10, !dbg !288
  br i1 %cmp5, label %for.body, label %for.end, !dbg !289

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !290
  %idxprom6 = sext i32 %6 to i64, !dbg !292
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !292
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !292
  call void @printIntLine(i32 %7), !dbg !293
  br label %for.inc, !dbg !294

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !295
  %inc = add nsw i32 %8, 1, !dbg !295
  store i32 %inc, i32* %i, align 4, !dbg !295
  br label %for.cond, !dbg !296, !llvm.loop !297

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !299

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !300
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !302

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !303
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !304 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !305, metadata !DIExpression()), !dbg !306
  store i32 -1, i32* %data, align 4, !dbg !307
  %0 = load i32, i32* @globalFive, align 4, !dbg !308
  %cmp = icmp eq i32 %0, 5, !dbg !310
  br i1 %cmp, label %if.then, label %if.end, !dbg !311

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !312
  br label %if.end, !dbg !314

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !315
  %cmp1 = icmp eq i32 %1, 5, !dbg !317
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !318

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !319, metadata !DIExpression()), !dbg !322
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !323, metadata !DIExpression()), !dbg !324
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !324
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !324
  %3 = load i32, i32* %data, align 4, !dbg !325
  %cmp3 = icmp sge i32 %3, 0, !dbg !327
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !328

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !329
  %idxprom = sext i32 %4 to i64, !dbg !331
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !331
  store i32 1, i32* %arrayidx, align 4, !dbg !332
  store i32 0, i32* %i, align 4, !dbg !333
  br label %for.cond, !dbg !335

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !336
  %cmp5 = icmp slt i32 %5, 10, !dbg !338
  br i1 %cmp5, label %for.body, label %for.end, !dbg !339

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !340
  %idxprom6 = sext i32 %6 to i64, !dbg !342
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !342
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !342
  call void @printIntLine(i32 %7), !dbg !343
  br label %for.inc, !dbg !344

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !345
  %inc = add nsw i32 %8, 1, !dbg !345
  store i32 %inc, i32* %i, align 4, !dbg !345
  br label %for.cond, !dbg !346, !llvm.loop !347

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !349

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !350
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !352

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !353
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocation(line: 29, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!22 = !DILocation(line: 29, column: 18, scope: !21)
!23 = !DILocation(line: 29, column: 8, scope: !12)
!24 = !DILocalVariable(name: "inputBuffer", scope: !25, file: !13, line: 32, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !13, line: 31, column: 9)
!26 = distinct !DILexicalBlock(scope: !21, file: !13, line: 30, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 112, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DILocation(line: 32, column: 18, scope: !25)
!32 = !DILocation(line: 34, column: 23, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !13, line: 34, column: 17)
!34 = !DILocation(line: 34, column: 53, scope: !33)
!35 = !DILocation(line: 34, column: 17, scope: !33)
!36 = !DILocation(line: 34, column: 60, scope: !33)
!37 = !DILocation(line: 34, column: 17, scope: !25)
!38 = !DILocation(line: 37, column: 29, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !13, line: 35, column: 13)
!40 = !DILocation(line: 37, column: 24, scope: !39)
!41 = !DILocation(line: 37, column: 22, scope: !39)
!42 = !DILocation(line: 38, column: 13, scope: !39)
!43 = !DILocation(line: 41, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !13, line: 40, column: 13)
!45 = !DILocation(line: 44, column: 5, scope: !26)
!46 = !DILocation(line: 45, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!48 = !DILocation(line: 45, column: 18, scope: !47)
!49 = !DILocation(line: 45, column: 8, scope: !12)
!50 = !DILocalVariable(name: "i", scope: !51, file: !13, line: 48, type: !17)
!51 = distinct !DILexicalBlock(scope: !52, file: !13, line: 47, column: 9)
!52 = distinct !DILexicalBlock(scope: !47, file: !13, line: 46, column: 5)
!53 = !DILocation(line: 48, column: 17, scope: !51)
!54 = !DILocalVariable(name: "buffer", scope: !51, file: !13, line: 49, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 10)
!58 = !DILocation(line: 49, column: 17, scope: !51)
!59 = !DILocation(line: 52, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !13, line: 52, column: 17)
!61 = !DILocation(line: 52, column: 22, scope: !60)
!62 = !DILocation(line: 52, column: 17, scope: !51)
!63 = !DILocation(line: 54, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !13, line: 53, column: 13)
!65 = !DILocation(line: 54, column: 17, scope: !64)
!66 = !DILocation(line: 54, column: 30, scope: !64)
!67 = !DILocation(line: 56, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !13, line: 56, column: 17)
!69 = !DILocation(line: 56, column: 21, scope: !68)
!70 = !DILocation(line: 56, column: 28, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !13, line: 56, column: 17)
!72 = !DILocation(line: 56, column: 30, scope: !71)
!73 = !DILocation(line: 56, column: 17, scope: !68)
!74 = !DILocation(line: 58, column: 41, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !13, line: 57, column: 17)
!76 = !DILocation(line: 58, column: 34, scope: !75)
!77 = !DILocation(line: 58, column: 21, scope: !75)
!78 = !DILocation(line: 59, column: 17, scope: !75)
!79 = !DILocation(line: 56, column: 37, scope: !71)
!80 = !DILocation(line: 56, column: 17, scope: !71)
!81 = distinct !{!81, !73, !82, !83}
!82 = !DILocation(line: 59, column: 17, scope: !68)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 60, column: 13, scope: !64)
!85 = !DILocation(line: 63, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !60, file: !13, line: 62, column: 13)
!87 = !DILocation(line: 66, column: 5, scope: !52)
!88 = !DILocation(line: 67, column: 1, scope: !12)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_14_good", scope: !13, file: !13, line: 245, type: !14, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 247, column: 5, scope: !89)
!91 = !DILocation(line: 248, column: 5, scope: !89)
!92 = !DILocation(line: 249, column: 5, scope: !89)
!93 = !DILocation(line: 250, column: 5, scope: !89)
!94 = !DILocation(line: 251, column: 1, scope: !89)
!95 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 262, type: !96, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!17, !17, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !13, line: 262, type: !17)
!101 = !DILocation(line: 262, column: 14, scope: !95)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !13, line: 262, type: !98)
!103 = !DILocation(line: 262, column: 27, scope: !95)
!104 = !DILocation(line: 265, column: 22, scope: !95)
!105 = !DILocation(line: 265, column: 12, scope: !95)
!106 = !DILocation(line: 265, column: 5, scope: !95)
!107 = !DILocation(line: 267, column: 5, scope: !95)
!108 = !DILocation(line: 268, column: 5, scope: !95)
!109 = !DILocation(line: 269, column: 5, scope: !95)
!110 = !DILocation(line: 272, column: 5, scope: !95)
!111 = !DILocation(line: 273, column: 5, scope: !95)
!112 = !DILocation(line: 274, column: 5, scope: !95)
!113 = !DILocation(line: 276, column: 5, scope: !95)
!114 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 74, type: !14, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !13, line: 76, type: !17)
!116 = !DILocation(line: 76, column: 9, scope: !114)
!117 = !DILocation(line: 78, column: 10, scope: !114)
!118 = !DILocation(line: 79, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !13, line: 79, column: 8)
!120 = !DILocation(line: 79, column: 18, scope: !119)
!121 = !DILocation(line: 79, column: 8, scope: !114)
!122 = !DILocalVariable(name: "inputBuffer", scope: !123, file: !13, line: 82, type: !27)
!123 = distinct !DILexicalBlock(scope: !124, file: !13, line: 81, column: 9)
!124 = distinct !DILexicalBlock(scope: !119, file: !13, line: 80, column: 5)
!125 = !DILocation(line: 82, column: 18, scope: !123)
!126 = !DILocation(line: 84, column: 23, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !13, line: 84, column: 17)
!128 = !DILocation(line: 84, column: 53, scope: !127)
!129 = !DILocation(line: 84, column: 17, scope: !127)
!130 = !DILocation(line: 84, column: 60, scope: !127)
!131 = !DILocation(line: 84, column: 17, scope: !123)
!132 = !DILocation(line: 87, column: 29, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !13, line: 85, column: 13)
!134 = !DILocation(line: 87, column: 24, scope: !133)
!135 = !DILocation(line: 87, column: 22, scope: !133)
!136 = !DILocation(line: 88, column: 13, scope: !133)
!137 = !DILocation(line: 91, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !127, file: !13, line: 90, column: 13)
!139 = !DILocation(line: 94, column: 5, scope: !124)
!140 = !DILocation(line: 95, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !114, file: !13, line: 95, column: 8)
!142 = !DILocation(line: 95, column: 18, scope: !141)
!143 = !DILocation(line: 95, column: 8, scope: !114)
!144 = !DILocation(line: 98, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !13, line: 96, column: 5)
!146 = !DILocation(line: 99, column: 5, scope: !145)
!147 = !DILocalVariable(name: "i", scope: !148, file: !13, line: 103, type: !17)
!148 = distinct !DILexicalBlock(scope: !149, file: !13, line: 102, column: 9)
!149 = distinct !DILexicalBlock(scope: !141, file: !13, line: 101, column: 5)
!150 = !DILocation(line: 103, column: 17, scope: !148)
!151 = !DILocalVariable(name: "buffer", scope: !148, file: !13, line: 104, type: !55)
!152 = !DILocation(line: 104, column: 17, scope: !148)
!153 = !DILocation(line: 106, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !148, file: !13, line: 106, column: 17)
!155 = !DILocation(line: 106, column: 22, scope: !154)
!156 = !DILocation(line: 106, column: 27, scope: !154)
!157 = !DILocation(line: 106, column: 30, scope: !154)
!158 = !DILocation(line: 106, column: 35, scope: !154)
!159 = !DILocation(line: 106, column: 17, scope: !148)
!160 = !DILocation(line: 108, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !13, line: 107, column: 13)
!162 = !DILocation(line: 108, column: 17, scope: !161)
!163 = !DILocation(line: 108, column: 30, scope: !161)
!164 = !DILocation(line: 110, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !13, line: 110, column: 17)
!166 = !DILocation(line: 110, column: 21, scope: !165)
!167 = !DILocation(line: 110, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !13, line: 110, column: 17)
!169 = !DILocation(line: 110, column: 30, scope: !168)
!170 = !DILocation(line: 110, column: 17, scope: !165)
!171 = !DILocation(line: 112, column: 41, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !13, line: 111, column: 17)
!173 = !DILocation(line: 112, column: 34, scope: !172)
!174 = !DILocation(line: 112, column: 21, scope: !172)
!175 = !DILocation(line: 113, column: 17, scope: !172)
!176 = !DILocation(line: 110, column: 37, scope: !168)
!177 = !DILocation(line: 110, column: 17, scope: !168)
!178 = distinct !{!178, !170, !179, !83}
!179 = !DILocation(line: 113, column: 17, scope: !165)
!180 = !DILocation(line: 114, column: 13, scope: !161)
!181 = !DILocation(line: 117, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !154, file: !13, line: 116, column: 13)
!183 = !DILocation(line: 121, column: 1, scope: !114)
!184 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 124, type: !14, scopeLine: 125, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!185 = !DILocalVariable(name: "data", scope: !184, file: !13, line: 126, type: !17)
!186 = !DILocation(line: 126, column: 9, scope: !184)
!187 = !DILocation(line: 128, column: 10, scope: !184)
!188 = !DILocation(line: 129, column: 8, scope: !189)
!189 = distinct !DILexicalBlock(scope: !184, file: !13, line: 129, column: 8)
!190 = !DILocation(line: 129, column: 18, scope: !189)
!191 = !DILocation(line: 129, column: 8, scope: !184)
!192 = !DILocalVariable(name: "inputBuffer", scope: !193, file: !13, line: 132, type: !27)
!193 = distinct !DILexicalBlock(scope: !194, file: !13, line: 131, column: 9)
!194 = distinct !DILexicalBlock(scope: !189, file: !13, line: 130, column: 5)
!195 = !DILocation(line: 132, column: 18, scope: !193)
!196 = !DILocation(line: 134, column: 23, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !13, line: 134, column: 17)
!198 = !DILocation(line: 134, column: 53, scope: !197)
!199 = !DILocation(line: 134, column: 17, scope: !197)
!200 = !DILocation(line: 134, column: 60, scope: !197)
!201 = !DILocation(line: 134, column: 17, scope: !193)
!202 = !DILocation(line: 137, column: 29, scope: !203)
!203 = distinct !DILexicalBlock(scope: !197, file: !13, line: 135, column: 13)
!204 = !DILocation(line: 137, column: 24, scope: !203)
!205 = !DILocation(line: 137, column: 22, scope: !203)
!206 = !DILocation(line: 138, column: 13, scope: !203)
!207 = !DILocation(line: 141, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !197, file: !13, line: 140, column: 13)
!209 = !DILocation(line: 144, column: 5, scope: !194)
!210 = !DILocation(line: 145, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !184, file: !13, line: 145, column: 8)
!212 = !DILocation(line: 145, column: 18, scope: !211)
!213 = !DILocation(line: 145, column: 8, scope: !184)
!214 = !DILocalVariable(name: "i", scope: !215, file: !13, line: 148, type: !17)
!215 = distinct !DILexicalBlock(scope: !216, file: !13, line: 147, column: 9)
!216 = distinct !DILexicalBlock(scope: !211, file: !13, line: 146, column: 5)
!217 = !DILocation(line: 148, column: 17, scope: !215)
!218 = !DILocalVariable(name: "buffer", scope: !215, file: !13, line: 149, type: !55)
!219 = !DILocation(line: 149, column: 17, scope: !215)
!220 = !DILocation(line: 151, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !215, file: !13, line: 151, column: 17)
!222 = !DILocation(line: 151, column: 22, scope: !221)
!223 = !DILocation(line: 151, column: 27, scope: !221)
!224 = !DILocation(line: 151, column: 30, scope: !221)
!225 = !DILocation(line: 151, column: 35, scope: !221)
!226 = !DILocation(line: 151, column: 17, scope: !215)
!227 = !DILocation(line: 153, column: 24, scope: !228)
!228 = distinct !DILexicalBlock(scope: !221, file: !13, line: 152, column: 13)
!229 = !DILocation(line: 153, column: 17, scope: !228)
!230 = !DILocation(line: 153, column: 30, scope: !228)
!231 = !DILocation(line: 155, column: 23, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !13, line: 155, column: 17)
!233 = !DILocation(line: 155, column: 21, scope: !232)
!234 = !DILocation(line: 155, column: 28, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !13, line: 155, column: 17)
!236 = !DILocation(line: 155, column: 30, scope: !235)
!237 = !DILocation(line: 155, column: 17, scope: !232)
!238 = !DILocation(line: 157, column: 41, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !13, line: 156, column: 17)
!240 = !DILocation(line: 157, column: 34, scope: !239)
!241 = !DILocation(line: 157, column: 21, scope: !239)
!242 = !DILocation(line: 158, column: 17, scope: !239)
!243 = !DILocation(line: 155, column: 37, scope: !235)
!244 = !DILocation(line: 155, column: 17, scope: !235)
!245 = distinct !{!245, !237, !246, !83}
!246 = !DILocation(line: 158, column: 17, scope: !232)
!247 = !DILocation(line: 159, column: 13, scope: !228)
!248 = !DILocation(line: 162, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !221, file: !13, line: 161, column: 13)
!250 = !DILocation(line: 165, column: 5, scope: !216)
!251 = !DILocation(line: 166, column: 1, scope: !184)
!252 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 169, type: !14, scopeLine: 170, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!253 = !DILocalVariable(name: "data", scope: !252, file: !13, line: 171, type: !17)
!254 = !DILocation(line: 171, column: 9, scope: !252)
!255 = !DILocation(line: 173, column: 10, scope: !252)
!256 = !DILocation(line: 174, column: 8, scope: !257)
!257 = distinct !DILexicalBlock(scope: !252, file: !13, line: 174, column: 8)
!258 = !DILocation(line: 174, column: 18, scope: !257)
!259 = !DILocation(line: 174, column: 8, scope: !252)
!260 = !DILocation(line: 177, column: 9, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !13, line: 175, column: 5)
!262 = !DILocation(line: 178, column: 5, scope: !261)
!263 = !DILocation(line: 183, column: 14, scope: !264)
!264 = distinct !DILexicalBlock(scope: !257, file: !13, line: 180, column: 5)
!265 = !DILocation(line: 185, column: 8, scope: !266)
!266 = distinct !DILexicalBlock(scope: !252, file: !13, line: 185, column: 8)
!267 = !DILocation(line: 185, column: 18, scope: !266)
!268 = !DILocation(line: 185, column: 8, scope: !252)
!269 = !DILocalVariable(name: "i", scope: !270, file: !13, line: 188, type: !17)
!270 = distinct !DILexicalBlock(scope: !271, file: !13, line: 187, column: 9)
!271 = distinct !DILexicalBlock(scope: !266, file: !13, line: 186, column: 5)
!272 = !DILocation(line: 188, column: 17, scope: !270)
!273 = !DILocalVariable(name: "buffer", scope: !270, file: !13, line: 189, type: !55)
!274 = !DILocation(line: 189, column: 17, scope: !270)
!275 = !DILocation(line: 192, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !270, file: !13, line: 192, column: 17)
!277 = !DILocation(line: 192, column: 22, scope: !276)
!278 = !DILocation(line: 192, column: 17, scope: !270)
!279 = !DILocation(line: 194, column: 24, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !13, line: 193, column: 13)
!281 = !DILocation(line: 194, column: 17, scope: !280)
!282 = !DILocation(line: 194, column: 30, scope: !280)
!283 = !DILocation(line: 196, column: 23, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !13, line: 196, column: 17)
!285 = !DILocation(line: 196, column: 21, scope: !284)
!286 = !DILocation(line: 196, column: 28, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !13, line: 196, column: 17)
!288 = !DILocation(line: 196, column: 30, scope: !287)
!289 = !DILocation(line: 196, column: 17, scope: !284)
!290 = !DILocation(line: 198, column: 41, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !13, line: 197, column: 17)
!292 = !DILocation(line: 198, column: 34, scope: !291)
!293 = !DILocation(line: 198, column: 21, scope: !291)
!294 = !DILocation(line: 199, column: 17, scope: !291)
!295 = !DILocation(line: 196, column: 37, scope: !287)
!296 = !DILocation(line: 196, column: 17, scope: !287)
!297 = distinct !{!297, !289, !298, !83}
!298 = !DILocation(line: 199, column: 17, scope: !284)
!299 = !DILocation(line: 200, column: 13, scope: !280)
!300 = !DILocation(line: 203, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !276, file: !13, line: 202, column: 13)
!302 = !DILocation(line: 206, column: 5, scope: !271)
!303 = !DILocation(line: 207, column: 1, scope: !252)
!304 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 210, type: !14, scopeLine: 211, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!305 = !DILocalVariable(name: "data", scope: !304, file: !13, line: 212, type: !17)
!306 = !DILocation(line: 212, column: 9, scope: !304)
!307 = !DILocation(line: 214, column: 10, scope: !304)
!308 = !DILocation(line: 215, column: 8, scope: !309)
!309 = distinct !DILexicalBlock(scope: !304, file: !13, line: 215, column: 8)
!310 = !DILocation(line: 215, column: 18, scope: !309)
!311 = !DILocation(line: 215, column: 8, scope: !304)
!312 = !DILocation(line: 219, column: 14, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !13, line: 216, column: 5)
!314 = !DILocation(line: 220, column: 5, scope: !313)
!315 = !DILocation(line: 221, column: 8, scope: !316)
!316 = distinct !DILexicalBlock(scope: !304, file: !13, line: 221, column: 8)
!317 = !DILocation(line: 221, column: 18, scope: !316)
!318 = !DILocation(line: 221, column: 8, scope: !304)
!319 = !DILocalVariable(name: "i", scope: !320, file: !13, line: 224, type: !17)
!320 = distinct !DILexicalBlock(scope: !321, file: !13, line: 223, column: 9)
!321 = distinct !DILexicalBlock(scope: !316, file: !13, line: 222, column: 5)
!322 = !DILocation(line: 224, column: 17, scope: !320)
!323 = !DILocalVariable(name: "buffer", scope: !320, file: !13, line: 225, type: !55)
!324 = !DILocation(line: 225, column: 17, scope: !320)
!325 = !DILocation(line: 228, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !320, file: !13, line: 228, column: 17)
!327 = !DILocation(line: 228, column: 22, scope: !326)
!328 = !DILocation(line: 228, column: 17, scope: !320)
!329 = !DILocation(line: 230, column: 24, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !13, line: 229, column: 13)
!331 = !DILocation(line: 230, column: 17, scope: !330)
!332 = !DILocation(line: 230, column: 30, scope: !330)
!333 = !DILocation(line: 232, column: 23, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !13, line: 232, column: 17)
!335 = !DILocation(line: 232, column: 21, scope: !334)
!336 = !DILocation(line: 232, column: 28, scope: !337)
!337 = distinct !DILexicalBlock(scope: !334, file: !13, line: 232, column: 17)
!338 = !DILocation(line: 232, column: 30, scope: !337)
!339 = !DILocation(line: 232, column: 17, scope: !334)
!340 = !DILocation(line: 234, column: 41, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !13, line: 233, column: 17)
!342 = !DILocation(line: 234, column: 34, scope: !341)
!343 = !DILocation(line: 234, column: 21, scope: !341)
!344 = !DILocation(line: 235, column: 17, scope: !341)
!345 = !DILocation(line: 232, column: 37, scope: !337)
!346 = !DILocation(line: 232, column: 17, scope: !337)
!347 = distinct !{!347, !339, !348, !83}
!348 = !DILocation(line: 235, column: 17, scope: !334)
!349 = !DILocation(line: 236, column: 13, scope: !330)
!350 = !DILocation(line: 239, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !326, file: !13, line: 238, column: 13)
!352 = !DILocation(line: 242, column: 5, scope: !321)
!353 = !DILocation(line: 243, column: 1, scope: !304)
