; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17_bad() #0 !dbg !12 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i7 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !31, metadata !DIExpression()), !dbg !38
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !39
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !41
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !42
  %cmp1 = icmp ne i8* %call, null, !dbg !43
  br i1 %cmp1, label %if.then, label %if.else, !dbg !44

if.then:                                          ; preds = %for.body
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !45
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !47
  store i32 %call3, i32* %data, align 4, !dbg !48
  br label %if.end, !dbg !49

if.else:                                          ; preds = %for.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !50
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %3, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !58
  br label %for.cond4, !dbg !60

for.cond4:                                        ; preds = %for.inc20, %for.end
  %4 = load i32, i32* %j, align 4, !dbg !61
  %cmp5 = icmp slt i32 %4, 1, !dbg !63
  br i1 %cmp5, label %for.body6, label %for.end22, !dbg !64

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !65, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !69, metadata !DIExpression()), !dbg !73
  %5 = bitcast [10 x i32]* %buffer to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false), !dbg !73
  %6 = load i32, i32* %data, align 4, !dbg !74
  %cmp8 = icmp sge i32 %6, 0, !dbg !76
  br i1 %cmp8, label %if.then9, label %if.else18, !dbg !77

if.then9:                                         ; preds = %for.body6
  %7 = load i32, i32* %data, align 4, !dbg !78
  %idxprom = sext i32 %7 to i64, !dbg !80
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !80
  store i32 1, i32* %arrayidx, align 4, !dbg !81
  store i32 0, i32* %i7, align 4, !dbg !82
  br label %for.cond10, !dbg !84

for.cond10:                                       ; preds = %for.inc15, %if.then9
  %8 = load i32, i32* %i7, align 4, !dbg !85
  %cmp11 = icmp slt i32 %8, 10, !dbg !87
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !88

for.body12:                                       ; preds = %for.cond10
  %9 = load i32, i32* %i7, align 4, !dbg !89
  %idxprom13 = sext i32 %9 to i64, !dbg !91
  %arrayidx14 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom13, !dbg !91
  %10 = load i32, i32* %arrayidx14, align 4, !dbg !91
  call void @printIntLine(i32 %10), !dbg !92
  br label %for.inc15, !dbg !93

for.inc15:                                        ; preds = %for.body12
  %11 = load i32, i32* %i7, align 4, !dbg !94
  %inc16 = add nsw i32 %11, 1, !dbg !94
  store i32 %inc16, i32* %i7, align 4, !dbg !94
  br label %for.cond10, !dbg !95, !llvm.loop !96

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !98

if.else18:                                        ; preds = %for.body6
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  br label %for.inc20, !dbg !101

for.inc20:                                        ; preds = %if.end19
  %12 = load i32, i32* %j, align 4, !dbg !102
  %inc21 = add nsw i32 %12, 1, !dbg !102
  store i32 %inc21, i32* %j, align 4, !dbg !102
  br label %for.cond4, !dbg !103, !llvm.loop !104

for.end22:                                        ; preds = %for.cond4
  ret void, !dbg !106
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17_good() #0 !dbg !107 {
entry:
  call void @goodB2G(), !dbg !108
  call void @goodG2B(), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !111 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !116, metadata !DIExpression()), !dbg !117
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call i64 @time(i64* null) #7, !dbg !120
  %conv = trunc i64 %call to i32, !dbg !121
  call void @srand(i32 %conv) #7, !dbg !122
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !123
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17_good(), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17_bad(), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !128
  ret i32 0, !dbg !129
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !130 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i7 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i32* %k, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i32* %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 -1, i32* %data, align 4, !dbg !137
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !141
  %cmp = icmp slt i32 %0, 1, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !145, metadata !DIExpression()), !dbg !148
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !148
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !149
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !151
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !152
  %cmp1 = icmp ne i8* %call, null, !dbg !153
  br i1 %cmp1, label %if.then, label %if.else, !dbg !154

if.then:                                          ; preds = %for.body
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !157
  store i32 %call3, i32* %data, align 4, !dbg !158
  br label %if.end, !dbg !159

if.else:                                          ; preds = %for.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !160
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !163
  %inc = add nsw i32 %3, 1, !dbg !163
  store i32 %inc, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !167
  br label %for.cond4, !dbg !169

for.cond4:                                        ; preds = %for.inc21, %for.end
  %4 = load i32, i32* %k, align 4, !dbg !170
  %cmp5 = icmp slt i32 %4, 1, !dbg !172
  br i1 %cmp5, label %for.body6, label %for.end23, !dbg !173

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !174, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !178, metadata !DIExpression()), !dbg !179
  %5 = bitcast [10 x i32]* %buffer to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false), !dbg !179
  %6 = load i32, i32* %data, align 4, !dbg !180
  %cmp8 = icmp sge i32 %6, 0, !dbg !182
  br i1 %cmp8, label %land.lhs.true, label %if.else19, !dbg !183

land.lhs.true:                                    ; preds = %for.body6
  %7 = load i32, i32* %data, align 4, !dbg !184
  %cmp9 = icmp slt i32 %7, 10, !dbg !185
  br i1 %cmp9, label %if.then10, label %if.else19, !dbg !186

if.then10:                                        ; preds = %land.lhs.true
  %8 = load i32, i32* %data, align 4, !dbg !187
  %idxprom = sext i32 %8 to i64, !dbg !189
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !189
  store i32 1, i32* %arrayidx, align 4, !dbg !190
  store i32 0, i32* %i7, align 4, !dbg !191
  br label %for.cond11, !dbg !193

for.cond11:                                       ; preds = %for.inc16, %if.then10
  %9 = load i32, i32* %i7, align 4, !dbg !194
  %cmp12 = icmp slt i32 %9, 10, !dbg !196
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !197

for.body13:                                       ; preds = %for.cond11
  %10 = load i32, i32* %i7, align 4, !dbg !198
  %idxprom14 = sext i32 %10 to i64, !dbg !200
  %arrayidx15 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom14, !dbg !200
  %11 = load i32, i32* %arrayidx15, align 4, !dbg !200
  call void @printIntLine(i32 %11), !dbg !201
  br label %for.inc16, !dbg !202

for.inc16:                                        ; preds = %for.body13
  %12 = load i32, i32* %i7, align 4, !dbg !203
  %inc17 = add nsw i32 %12, 1, !dbg !203
  store i32 %inc17, i32* %i7, align 4, !dbg !203
  br label %for.cond11, !dbg !204, !llvm.loop !205

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !207

if.else19:                                        ; preds = %land.lhs.true, %for.body6
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !208
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  br label %for.inc21, !dbg !210

for.inc21:                                        ; preds = %if.end20
  %13 = load i32, i32* %k, align 4, !dbg !211
  %inc22 = add nsw i32 %13, 1, !dbg !211
  store i32 %inc22, i32* %k, align 4, !dbg !211
  br label %for.cond4, !dbg !212, !llvm.loop !213

for.end23:                                        ; preds = %for.cond4
  ret void, !dbg !215
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !216 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata i32* %j, metadata !219, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata i32* %data, metadata !221, metadata !DIExpression()), !dbg !222
  store i32 -1, i32* %data, align 4, !dbg !223
  store i32 0, i32* %h, align 4, !dbg !224
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !227
  %cmp = icmp slt i32 %0, 1, !dbg !229
  br i1 %cmp, label %for.body, label %for.end, !dbg !230

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !231
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !234
  %inc = add nsw i32 %1, 1, !dbg !234
  store i32 %inc, i32* %h, align 4, !dbg !234
  br label %for.cond, !dbg !235, !llvm.loop !236

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !238
  br label %for.cond1, !dbg !240

for.cond1:                                        ; preds = %for.inc13, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !241
  %cmp2 = icmp slt i32 %2, 1, !dbg !243
  br i1 %cmp2, label %for.body3, label %for.end15, !dbg !244

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !245, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !249, metadata !DIExpression()), !dbg !250
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !250
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !250
  %4 = load i32, i32* %data, align 4, !dbg !251
  %cmp4 = icmp sge i32 %4, 0, !dbg !253
  br i1 %cmp4, label %if.then, label %if.else, !dbg !254

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !255
  %idxprom = sext i32 %5 to i64, !dbg !257
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !257
  store i32 1, i32* %arrayidx, align 4, !dbg !258
  store i32 0, i32* %i, align 4, !dbg !259
  br label %for.cond5, !dbg !261

for.cond5:                                        ; preds = %for.inc10, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !262
  %cmp6 = icmp slt i32 %6, 10, !dbg !264
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !265

for.body7:                                        ; preds = %for.cond5
  %7 = load i32, i32* %i, align 4, !dbg !266
  %idxprom8 = sext i32 %7 to i64, !dbg !268
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !268
  %8 = load i32, i32* %arrayidx9, align 4, !dbg !268
  call void @printIntLine(i32 %8), !dbg !269
  br label %for.inc10, !dbg !270

for.inc10:                                        ; preds = %for.body7
  %9 = load i32, i32* %i, align 4, !dbg !271
  %inc11 = add nsw i32 %9, 1, !dbg !271
  store i32 %inc11, i32* %i, align 4, !dbg !271
  br label %for.cond5, !dbg !272, !llvm.loop !273

for.end12:                                        ; preds = %for.cond5
  br label %if.end, !dbg !275

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !276
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end12
  br label %for.inc13, !dbg !278

for.inc13:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !279
  %inc14 = add nsw i32 %10, 1, !dbg !279
  store i32 %inc14, i32* %j, align 4, !dbg !279
  br label %for.cond1, !dbg !280, !llvm.loop !281

for.end15:                                        ; preds = %for.cond1
  ret void, !dbg !283
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "i", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocalVariable(name: "j", scope: !12, file: !13, line: 26, type: !17)
!20 = !DILocation(line: 26, column: 11, scope: !12)
!21 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 27, type: !17)
!22 = !DILocation(line: 27, column: 9, scope: !12)
!23 = !DILocation(line: 29, column: 10, scope: !12)
!24 = !DILocation(line: 30, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !12, file: !13, line: 30, column: 5)
!26 = !DILocation(line: 30, column: 9, scope: !25)
!27 = !DILocation(line: 30, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !13, line: 30, column: 5)
!29 = !DILocation(line: 30, column: 18, scope: !28)
!30 = !DILocation(line: 30, column: 5, scope: !25)
!31 = !DILocalVariable(name: "inputBuffer", scope: !32, file: !13, line: 33, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !13, line: 32, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !13, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 112, elements: !36)
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = !{!37}
!37 = !DISubrange(count: 14)
!38 = !DILocation(line: 33, column: 18, scope: !32)
!39 = !DILocation(line: 35, column: 23, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !13, line: 35, column: 17)
!41 = !DILocation(line: 35, column: 53, scope: !40)
!42 = !DILocation(line: 35, column: 17, scope: !40)
!43 = !DILocation(line: 35, column: 60, scope: !40)
!44 = !DILocation(line: 35, column: 17, scope: !32)
!45 = !DILocation(line: 38, column: 29, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !13, line: 36, column: 13)
!47 = !DILocation(line: 38, column: 24, scope: !46)
!48 = !DILocation(line: 38, column: 22, scope: !46)
!49 = !DILocation(line: 39, column: 13, scope: !46)
!50 = !DILocation(line: 42, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !40, file: !13, line: 41, column: 13)
!52 = !DILocation(line: 45, column: 5, scope: !33)
!53 = !DILocation(line: 30, column: 24, scope: !28)
!54 = !DILocation(line: 30, column: 5, scope: !28)
!55 = distinct !{!55, !30, !56, !57}
!56 = !DILocation(line: 45, column: 5, scope: !25)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 46, column: 11, scope: !59)
!59 = distinct !DILexicalBlock(scope: !12, file: !13, line: 46, column: 5)
!60 = !DILocation(line: 46, column: 9, scope: !59)
!61 = !DILocation(line: 46, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !13, line: 46, column: 5)
!63 = !DILocation(line: 46, column: 18, scope: !62)
!64 = !DILocation(line: 46, column: 5, scope: !59)
!65 = !DILocalVariable(name: "i", scope: !66, file: !13, line: 49, type: !17)
!66 = distinct !DILexicalBlock(scope: !67, file: !13, line: 48, column: 9)
!67 = distinct !DILexicalBlock(scope: !62, file: !13, line: 47, column: 5)
!68 = !DILocation(line: 49, column: 17, scope: !66)
!69 = !DILocalVariable(name: "buffer", scope: !66, file: !13, line: 50, type: !70)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 10)
!73 = !DILocation(line: 50, column: 17, scope: !66)
!74 = !DILocation(line: 53, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !66, file: !13, line: 53, column: 17)
!76 = !DILocation(line: 53, column: 22, scope: !75)
!77 = !DILocation(line: 53, column: 17, scope: !66)
!78 = !DILocation(line: 55, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !13, line: 54, column: 13)
!80 = !DILocation(line: 55, column: 17, scope: !79)
!81 = !DILocation(line: 55, column: 30, scope: !79)
!82 = !DILocation(line: 57, column: 23, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !13, line: 57, column: 17)
!84 = !DILocation(line: 57, column: 21, scope: !83)
!85 = !DILocation(line: 57, column: 28, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !13, line: 57, column: 17)
!87 = !DILocation(line: 57, column: 30, scope: !86)
!88 = !DILocation(line: 57, column: 17, scope: !83)
!89 = !DILocation(line: 59, column: 41, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !13, line: 58, column: 17)
!91 = !DILocation(line: 59, column: 34, scope: !90)
!92 = !DILocation(line: 59, column: 21, scope: !90)
!93 = !DILocation(line: 60, column: 17, scope: !90)
!94 = !DILocation(line: 57, column: 37, scope: !86)
!95 = !DILocation(line: 57, column: 17, scope: !86)
!96 = distinct !{!96, !88, !97, !57}
!97 = !DILocation(line: 60, column: 17, scope: !83)
!98 = !DILocation(line: 61, column: 13, scope: !79)
!99 = !DILocation(line: 64, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !75, file: !13, line: 63, column: 13)
!101 = !DILocation(line: 67, column: 5, scope: !67)
!102 = !DILocation(line: 46, column: 24, scope: !62)
!103 = !DILocation(line: 46, column: 5, scope: !62)
!104 = distinct !{!104, !64, !105, !57}
!105 = !DILocation(line: 67, column: 5, scope: !59)
!106 = !DILocation(line: 68, column: 1, scope: !12)
!107 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_17_good", scope: !13, file: !13, line: 157, type: !14, scopeLine: 158, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocation(line: 159, column: 5, scope: !107)
!109 = !DILocation(line: 160, column: 5, scope: !107)
!110 = !DILocation(line: 161, column: 1, scope: !107)
!111 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 172, type: !112, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DISubroutineType(types: !113)
!113 = !{!17, !17, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!116 = !DILocalVariable(name: "argc", arg: 1, scope: !111, file: !13, line: 172, type: !17)
!117 = !DILocation(line: 172, column: 14, scope: !111)
!118 = !DILocalVariable(name: "argv", arg: 2, scope: !111, file: !13, line: 172, type: !114)
!119 = !DILocation(line: 172, column: 27, scope: !111)
!120 = !DILocation(line: 175, column: 22, scope: !111)
!121 = !DILocation(line: 175, column: 12, scope: !111)
!122 = !DILocation(line: 175, column: 5, scope: !111)
!123 = !DILocation(line: 177, column: 5, scope: !111)
!124 = !DILocation(line: 178, column: 5, scope: !111)
!125 = !DILocation(line: 179, column: 5, scope: !111)
!126 = !DILocation(line: 182, column: 5, scope: !111)
!127 = !DILocation(line: 183, column: 5, scope: !111)
!128 = !DILocation(line: 184, column: 5, scope: !111)
!129 = !DILocation(line: 186, column: 5, scope: !111)
!130 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 75, type: !14, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "i", scope: !130, file: !13, line: 77, type: !17)
!132 = !DILocation(line: 77, column: 9, scope: !130)
!133 = !DILocalVariable(name: "k", scope: !130, file: !13, line: 77, type: !17)
!134 = !DILocation(line: 77, column: 11, scope: !130)
!135 = !DILocalVariable(name: "data", scope: !130, file: !13, line: 78, type: !17)
!136 = !DILocation(line: 78, column: 9, scope: !130)
!137 = !DILocation(line: 80, column: 10, scope: !130)
!138 = !DILocation(line: 81, column: 11, scope: !139)
!139 = distinct !DILexicalBlock(scope: !130, file: !13, line: 81, column: 5)
!140 = !DILocation(line: 81, column: 9, scope: !139)
!141 = !DILocation(line: 81, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !13, line: 81, column: 5)
!143 = !DILocation(line: 81, column: 18, scope: !142)
!144 = !DILocation(line: 81, column: 5, scope: !139)
!145 = !DILocalVariable(name: "inputBuffer", scope: !146, file: !13, line: 84, type: !34)
!146 = distinct !DILexicalBlock(scope: !147, file: !13, line: 83, column: 9)
!147 = distinct !DILexicalBlock(scope: !142, file: !13, line: 82, column: 5)
!148 = !DILocation(line: 84, column: 18, scope: !146)
!149 = !DILocation(line: 86, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !13, line: 86, column: 17)
!151 = !DILocation(line: 86, column: 53, scope: !150)
!152 = !DILocation(line: 86, column: 17, scope: !150)
!153 = !DILocation(line: 86, column: 60, scope: !150)
!154 = !DILocation(line: 86, column: 17, scope: !146)
!155 = !DILocation(line: 89, column: 29, scope: !156)
!156 = distinct !DILexicalBlock(scope: !150, file: !13, line: 87, column: 13)
!157 = !DILocation(line: 89, column: 24, scope: !156)
!158 = !DILocation(line: 89, column: 22, scope: !156)
!159 = !DILocation(line: 90, column: 13, scope: !156)
!160 = !DILocation(line: 93, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !150, file: !13, line: 92, column: 13)
!162 = !DILocation(line: 96, column: 5, scope: !147)
!163 = !DILocation(line: 81, column: 24, scope: !142)
!164 = !DILocation(line: 81, column: 5, scope: !142)
!165 = distinct !{!165, !144, !166, !57}
!166 = !DILocation(line: 96, column: 5, scope: !139)
!167 = !DILocation(line: 97, column: 11, scope: !168)
!168 = distinct !DILexicalBlock(scope: !130, file: !13, line: 97, column: 5)
!169 = !DILocation(line: 97, column: 9, scope: !168)
!170 = !DILocation(line: 97, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !13, line: 97, column: 5)
!172 = !DILocation(line: 97, column: 18, scope: !171)
!173 = !DILocation(line: 97, column: 5, scope: !168)
!174 = !DILocalVariable(name: "i", scope: !175, file: !13, line: 100, type: !17)
!175 = distinct !DILexicalBlock(scope: !176, file: !13, line: 99, column: 9)
!176 = distinct !DILexicalBlock(scope: !171, file: !13, line: 98, column: 5)
!177 = !DILocation(line: 100, column: 17, scope: !175)
!178 = !DILocalVariable(name: "buffer", scope: !175, file: !13, line: 101, type: !70)
!179 = !DILocation(line: 101, column: 17, scope: !175)
!180 = !DILocation(line: 103, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !175, file: !13, line: 103, column: 17)
!182 = !DILocation(line: 103, column: 22, scope: !181)
!183 = !DILocation(line: 103, column: 27, scope: !181)
!184 = !DILocation(line: 103, column: 30, scope: !181)
!185 = !DILocation(line: 103, column: 35, scope: !181)
!186 = !DILocation(line: 103, column: 17, scope: !175)
!187 = !DILocation(line: 105, column: 24, scope: !188)
!188 = distinct !DILexicalBlock(scope: !181, file: !13, line: 104, column: 13)
!189 = !DILocation(line: 105, column: 17, scope: !188)
!190 = !DILocation(line: 105, column: 30, scope: !188)
!191 = !DILocation(line: 107, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !13, line: 107, column: 17)
!193 = !DILocation(line: 107, column: 21, scope: !192)
!194 = !DILocation(line: 107, column: 28, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !13, line: 107, column: 17)
!196 = !DILocation(line: 107, column: 30, scope: !195)
!197 = !DILocation(line: 107, column: 17, scope: !192)
!198 = !DILocation(line: 109, column: 41, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !13, line: 108, column: 17)
!200 = !DILocation(line: 109, column: 34, scope: !199)
!201 = !DILocation(line: 109, column: 21, scope: !199)
!202 = !DILocation(line: 110, column: 17, scope: !199)
!203 = !DILocation(line: 107, column: 37, scope: !195)
!204 = !DILocation(line: 107, column: 17, scope: !195)
!205 = distinct !{!205, !197, !206, !57}
!206 = !DILocation(line: 110, column: 17, scope: !192)
!207 = !DILocation(line: 111, column: 13, scope: !188)
!208 = !DILocation(line: 114, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !181, file: !13, line: 113, column: 13)
!210 = !DILocation(line: 117, column: 5, scope: !176)
!211 = !DILocation(line: 97, column: 24, scope: !171)
!212 = !DILocation(line: 97, column: 5, scope: !171)
!213 = distinct !{!213, !173, !214, !57}
!214 = !DILocation(line: 117, column: 5, scope: !168)
!215 = !DILocation(line: 118, column: 1, scope: !130)
!216 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 121, type: !14, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!217 = !DILocalVariable(name: "h", scope: !216, file: !13, line: 123, type: !17)
!218 = !DILocation(line: 123, column: 9, scope: !216)
!219 = !DILocalVariable(name: "j", scope: !216, file: !13, line: 123, type: !17)
!220 = !DILocation(line: 123, column: 11, scope: !216)
!221 = !DILocalVariable(name: "data", scope: !216, file: !13, line: 124, type: !17)
!222 = !DILocation(line: 124, column: 9, scope: !216)
!223 = !DILocation(line: 126, column: 10, scope: !216)
!224 = !DILocation(line: 127, column: 11, scope: !225)
!225 = distinct !DILexicalBlock(scope: !216, file: !13, line: 127, column: 5)
!226 = !DILocation(line: 127, column: 9, scope: !225)
!227 = !DILocation(line: 127, column: 16, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !13, line: 127, column: 5)
!229 = !DILocation(line: 127, column: 18, scope: !228)
!230 = !DILocation(line: 127, column: 5, scope: !225)
!231 = !DILocation(line: 131, column: 14, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !13, line: 128, column: 5)
!233 = !DILocation(line: 132, column: 5, scope: !232)
!234 = !DILocation(line: 127, column: 24, scope: !228)
!235 = !DILocation(line: 127, column: 5, scope: !228)
!236 = distinct !{!236, !230, !237, !57}
!237 = !DILocation(line: 132, column: 5, scope: !225)
!238 = !DILocation(line: 133, column: 11, scope: !239)
!239 = distinct !DILexicalBlock(scope: !216, file: !13, line: 133, column: 5)
!240 = !DILocation(line: 133, column: 9, scope: !239)
!241 = !DILocation(line: 133, column: 16, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !13, line: 133, column: 5)
!243 = !DILocation(line: 133, column: 18, scope: !242)
!244 = !DILocation(line: 133, column: 5, scope: !239)
!245 = !DILocalVariable(name: "i", scope: !246, file: !13, line: 136, type: !17)
!246 = distinct !DILexicalBlock(scope: !247, file: !13, line: 135, column: 9)
!247 = distinct !DILexicalBlock(scope: !242, file: !13, line: 134, column: 5)
!248 = !DILocation(line: 136, column: 17, scope: !246)
!249 = !DILocalVariable(name: "buffer", scope: !246, file: !13, line: 137, type: !70)
!250 = !DILocation(line: 137, column: 17, scope: !246)
!251 = !DILocation(line: 140, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !246, file: !13, line: 140, column: 17)
!253 = !DILocation(line: 140, column: 22, scope: !252)
!254 = !DILocation(line: 140, column: 17, scope: !246)
!255 = !DILocation(line: 142, column: 24, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !13, line: 141, column: 13)
!257 = !DILocation(line: 142, column: 17, scope: !256)
!258 = !DILocation(line: 142, column: 30, scope: !256)
!259 = !DILocation(line: 144, column: 23, scope: !260)
!260 = distinct !DILexicalBlock(scope: !256, file: !13, line: 144, column: 17)
!261 = !DILocation(line: 144, column: 21, scope: !260)
!262 = !DILocation(line: 144, column: 28, scope: !263)
!263 = distinct !DILexicalBlock(scope: !260, file: !13, line: 144, column: 17)
!264 = !DILocation(line: 144, column: 30, scope: !263)
!265 = !DILocation(line: 144, column: 17, scope: !260)
!266 = !DILocation(line: 146, column: 41, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !13, line: 145, column: 17)
!268 = !DILocation(line: 146, column: 34, scope: !267)
!269 = !DILocation(line: 146, column: 21, scope: !267)
!270 = !DILocation(line: 147, column: 17, scope: !267)
!271 = !DILocation(line: 144, column: 37, scope: !263)
!272 = !DILocation(line: 144, column: 17, scope: !263)
!273 = distinct !{!273, !265, !274, !57}
!274 = !DILocation(line: 147, column: 17, scope: !260)
!275 = !DILocation(line: 148, column: 13, scope: !256)
!276 = !DILocation(line: 151, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !252, file: !13, line: 150, column: 13)
!278 = !DILocation(line: 154, column: 5, scope: !247)
!279 = !DILocation(line: 133, column: 24, scope: !242)
!280 = !DILocation(line: 133, column: 5, scope: !242)
!281 = distinct !{!281, !244, !282, !57}
!282 = !DILocation(line: 154, column: 5, scope: !239)
!283 = !DILocation(line: 155, column: 1, scope: !216)
