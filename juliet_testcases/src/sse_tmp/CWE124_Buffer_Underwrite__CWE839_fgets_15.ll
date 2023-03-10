; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_15.c"
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_15_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !20, metadata !DIExpression()), !dbg !26
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !27
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !29
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !30
  %cmp = icmp ne i8* %call, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !35
  store i32 %call2, i32* %data, align 4, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !40, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !43, metadata !DIExpression()), !dbg !47
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !47
  %3 = load i32, i32* %data, align 4, !dbg !48
  %cmp3 = icmp slt i32 %3, 10, !dbg !50
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !51

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !52
  %idxprom = sext i32 %4 to i64, !dbg !54
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !54
  store i32 1, i32* %arrayidx, align 4, !dbg !55
  store i32 0, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !59
  %cmp5 = icmp slt i32 %5, 10, !dbg !61
  br i1 %cmp5, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !63
  %idxprom6 = sext i32 %6 to i64, !dbg !65
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !65
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !65
  call void @printIntLine(i32 %7), !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !68
  %inc = add nsw i32 %8, 1, !dbg !68
  store i32 %inc, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !73

if.else8:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  ret void, !dbg !76
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_15_good() #0 !dbg !77 {
entry:
  call void @goodB2G1(), !dbg !78
  call void @goodB2G2(), !dbg !79
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_15_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_15_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !102 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 -1, i32* %data, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !108
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !109
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !111
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !112
  %cmp = icmp ne i8* %call, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !115
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !117
  store i32 %call2, i32* %data, align 4, !dbg !118
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !125, metadata !DIExpression()), !dbg !126
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !126
  %3 = load i32, i32* %data, align 4, !dbg !127
  %cmp3 = icmp sge i32 %3, 0, !dbg !129
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !130

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !131
  %cmp4 = icmp slt i32 %4, 10, !dbg !132
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !133

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !134
  %idxprom = sext i32 %5 to i64, !dbg !136
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !136
  store i32 1, i32* %arrayidx, align 4, !dbg !137
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !141
  %cmp6 = icmp slt i32 %6, 10, !dbg !143
  br i1 %cmp6, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !145
  %idxprom7 = sext i32 %7 to i64, !dbg !147
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !147
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !147
  call void @printIntLine(i32 %8), !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !150
  %inc = add nsw i32 %9, 1, !dbg !150
  store i32 %inc, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !154

if.else9:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !155
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !158 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !159, metadata !DIExpression()), !dbg !160
  store i32 -1, i32* %data, align 4, !dbg !161
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !162, metadata !DIExpression()), !dbg !164
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !164
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !165
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !167
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !168
  %cmp = icmp ne i8* %call, null, !dbg !169
  br i1 %cmp, label %if.then, label %if.else, !dbg !170

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !171
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !173
  store i32 %call2, i32* %data, align 4, !dbg !174
  br label %if.end, !dbg !175

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !176
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !178, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !181, metadata !DIExpression()), !dbg !182
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !182
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !182
  %3 = load i32, i32* %data, align 4, !dbg !183
  %cmp3 = icmp sge i32 %3, 0, !dbg !185
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !186

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !187
  %cmp4 = icmp slt i32 %4, 10, !dbg !188
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !189

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !190
  %idxprom = sext i32 %5 to i64, !dbg !192
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !192
  store i32 1, i32* %arrayidx, align 4, !dbg !193
  store i32 0, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !197
  %cmp6 = icmp slt i32 %6, 10, !dbg !199
  br i1 %cmp6, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !201
  %idxprom7 = sext i32 %7 to i64, !dbg !203
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !203
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !203
  call void @printIntLine(i32 %8), !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !206
  %inc = add nsw i32 %9, 1, !dbg !206
  store i32 %inc, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !210

if.else9:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !211
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !213
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !214 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 -1, i32* %data, align 4, !dbg !217
  store i32 7, i32* %data, align 4, !dbg !218
  call void @llvm.dbg.declare(metadata i32* %i, metadata !219, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !223
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !223
  %1 = load i32, i32* %data, align 4, !dbg !224
  %cmp = icmp slt i32 %1, 10, !dbg !226
  br i1 %cmp, label %if.then, label %if.else, !dbg !227

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !228
  %idxprom = sext i32 %2 to i64, !dbg !230
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !230
  store i32 1, i32* %arrayidx, align 4, !dbg !231
  store i32 0, i32* %i, align 4, !dbg !232
  br label %for.cond, !dbg !234

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !235
  %cmp1 = icmp slt i32 %3, 10, !dbg !237
  br i1 %cmp1, label %for.body, label %for.end, !dbg !238

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !239
  %idxprom2 = sext i32 %4 to i64, !dbg !241
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !241
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !241
  call void @printIntLine(i32 %5), !dbg !242
  br label %for.inc, !dbg !243

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !244
  %inc = add nsw i32 %6, 1, !dbg !244
  store i32 %inc, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !245, !llvm.loop !246

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !248

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !249
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !251
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !252 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %data, align 4, !dbg !255
  store i32 7, i32* %data, align 4, !dbg !256
  call void @llvm.dbg.declare(metadata i32* %i, metadata !257, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !260, metadata !DIExpression()), !dbg !261
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !261
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !261
  %1 = load i32, i32* %data, align 4, !dbg !262
  %cmp = icmp slt i32 %1, 10, !dbg !264
  br i1 %cmp, label %if.then, label %if.else, !dbg !265

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !266
  %idxprom = sext i32 %2 to i64, !dbg !268
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !268
  store i32 1, i32* %arrayidx, align 4, !dbg !269
  store i32 0, i32* %i, align 4, !dbg !270
  br label %for.cond, !dbg !272

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !273
  %cmp1 = icmp slt i32 %3, 10, !dbg !275
  br i1 %cmp1, label %for.body, label %for.end, !dbg !276

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !277
  %idxprom2 = sext i32 %4 to i64, !dbg !279
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !279
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !279
  call void @printIntLine(i32 %5), !dbg !280
  br label %for.inc, !dbg !281

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !282
  %inc = add nsw i32 %6, 1, !dbg !282
  store i32 %inc, i32* %i, align 4, !dbg !282
  br label %for.cond, !dbg !283, !llvm.loop !284

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !286

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !287
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !289
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_15_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_15.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 33, type: !22)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 32, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DILocation(line: 33, column: 14, scope: !21)
!27 = !DILocation(line: 35, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 35, column: 13)
!29 = !DILocation(line: 35, column: 49, scope: !28)
!30 = !DILocation(line: 35, column: 13, scope: !28)
!31 = !DILocation(line: 35, column: 56, scope: !28)
!32 = !DILocation(line: 35, column: 13, scope: !21)
!33 = !DILocation(line: 38, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 36, column: 9)
!35 = !DILocation(line: 38, column: 20, scope: !34)
!36 = !DILocation(line: 38, column: 18, scope: !34)
!37 = !DILocation(line: 39, column: 9, scope: !34)
!38 = !DILocation(line: 42, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !13, line: 41, column: 9)
!40 = !DILocalVariable(name: "i", scope: !41, file: !13, line: 55, type: !17)
!41 = distinct !DILexicalBlock(scope: !12, file: !13, line: 54, column: 5)
!42 = !DILocation(line: 55, column: 13, scope: !41)
!43 = !DILocalVariable(name: "buffer", scope: !41, file: !13, line: 56, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 10)
!47 = !DILocation(line: 56, column: 13, scope: !41)
!48 = !DILocation(line: 59, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !13, line: 59, column: 13)
!50 = !DILocation(line: 59, column: 18, scope: !49)
!51 = !DILocation(line: 59, column: 13, scope: !41)
!52 = !DILocation(line: 61, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !13, line: 60, column: 9)
!54 = !DILocation(line: 61, column: 13, scope: !53)
!55 = !DILocation(line: 61, column: 26, scope: !53)
!56 = !DILocation(line: 63, column: 19, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !13, line: 63, column: 13)
!58 = !DILocation(line: 63, column: 17, scope: !57)
!59 = !DILocation(line: 63, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !13, line: 63, column: 13)
!61 = !DILocation(line: 63, column: 26, scope: !60)
!62 = !DILocation(line: 63, column: 13, scope: !57)
!63 = !DILocation(line: 65, column: 37, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !13, line: 64, column: 13)
!65 = !DILocation(line: 65, column: 30, scope: !64)
!66 = !DILocation(line: 65, column: 17, scope: !64)
!67 = !DILocation(line: 66, column: 13, scope: !64)
!68 = !DILocation(line: 63, column: 33, scope: !60)
!69 = !DILocation(line: 63, column: 13, scope: !60)
!70 = distinct !{!70, !62, !71, !72}
!71 = !DILocation(line: 66, column: 13, scope: !57)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 67, column: 9, scope: !53)
!74 = !DILocation(line: 70, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !49, file: !13, line: 69, column: 9)
!76 = !DILocation(line: 79, column: 1, scope: !12)
!77 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_15_good", scope: !13, file: !13, line: 295, type: !14, scopeLine: 296, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 297, column: 5, scope: !77)
!79 = !DILocation(line: 298, column: 5, scope: !77)
!80 = !DILocation(line: 299, column: 5, scope: !77)
!81 = !DILocation(line: 300, column: 5, scope: !77)
!82 = !DILocation(line: 301, column: 1, scope: !77)
!83 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 312, type: !84, scopeLine: 313, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!17, !17, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !13, line: 312, type: !17)
!89 = !DILocation(line: 312, column: 14, scope: !83)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !13, line: 312, type: !86)
!91 = !DILocation(line: 312, column: 27, scope: !83)
!92 = !DILocation(line: 315, column: 22, scope: !83)
!93 = !DILocation(line: 315, column: 12, scope: !83)
!94 = !DILocation(line: 315, column: 5, scope: !83)
!95 = !DILocation(line: 317, column: 5, scope: !83)
!96 = !DILocation(line: 318, column: 5, scope: !83)
!97 = !DILocation(line: 319, column: 5, scope: !83)
!98 = !DILocation(line: 322, column: 5, scope: !83)
!99 = !DILocation(line: 323, column: 5, scope: !83)
!100 = !DILocation(line: 324, column: 5, scope: !83)
!101 = !DILocation(line: 326, column: 5, scope: !83)
!102 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 86, type: !14, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !13, line: 88, type: !17)
!104 = !DILocation(line: 88, column: 9, scope: !102)
!105 = !DILocation(line: 90, column: 10, scope: !102)
!106 = !DILocalVariable(name: "inputBuffer", scope: !107, file: !13, line: 95, type: !22)
!107 = distinct !DILexicalBlock(scope: !102, file: !13, line: 94, column: 5)
!108 = !DILocation(line: 95, column: 14, scope: !107)
!109 = !DILocation(line: 97, column: 19, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !13, line: 97, column: 13)
!111 = !DILocation(line: 97, column: 49, scope: !110)
!112 = !DILocation(line: 97, column: 13, scope: !110)
!113 = !DILocation(line: 97, column: 56, scope: !110)
!114 = !DILocation(line: 97, column: 13, scope: !107)
!115 = !DILocation(line: 100, column: 25, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !13, line: 98, column: 9)
!117 = !DILocation(line: 100, column: 20, scope: !116)
!118 = !DILocation(line: 100, column: 18, scope: !116)
!119 = !DILocation(line: 101, column: 9, scope: !116)
!120 = !DILocation(line: 104, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !110, file: !13, line: 103, column: 9)
!122 = !DILocalVariable(name: "i", scope: !123, file: !13, line: 121, type: !17)
!123 = distinct !DILexicalBlock(scope: !102, file: !13, line: 120, column: 5)
!124 = !DILocation(line: 121, column: 13, scope: !123)
!125 = !DILocalVariable(name: "buffer", scope: !123, file: !13, line: 122, type: !44)
!126 = !DILocation(line: 122, column: 13, scope: !123)
!127 = !DILocation(line: 124, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !13, line: 124, column: 13)
!129 = !DILocation(line: 124, column: 18, scope: !128)
!130 = !DILocation(line: 124, column: 23, scope: !128)
!131 = !DILocation(line: 124, column: 26, scope: !128)
!132 = !DILocation(line: 124, column: 31, scope: !128)
!133 = !DILocation(line: 124, column: 13, scope: !123)
!134 = !DILocation(line: 126, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !128, file: !13, line: 125, column: 9)
!136 = !DILocation(line: 126, column: 13, scope: !135)
!137 = !DILocation(line: 126, column: 26, scope: !135)
!138 = !DILocation(line: 128, column: 19, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !13, line: 128, column: 13)
!140 = !DILocation(line: 128, column: 17, scope: !139)
!141 = !DILocation(line: 128, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !13, line: 128, column: 13)
!143 = !DILocation(line: 128, column: 26, scope: !142)
!144 = !DILocation(line: 128, column: 13, scope: !139)
!145 = !DILocation(line: 130, column: 37, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !13, line: 129, column: 13)
!147 = !DILocation(line: 130, column: 30, scope: !146)
!148 = !DILocation(line: 130, column: 17, scope: !146)
!149 = !DILocation(line: 131, column: 13, scope: !146)
!150 = !DILocation(line: 128, column: 33, scope: !142)
!151 = !DILocation(line: 128, column: 13, scope: !142)
!152 = distinct !{!152, !144, !153, !72}
!153 = !DILocation(line: 131, column: 13, scope: !139)
!154 = !DILocation(line: 132, column: 9, scope: !135)
!155 = !DILocation(line: 135, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !128, file: !13, line: 134, column: 9)
!157 = !DILocation(line: 140, column: 1, scope: !102)
!158 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 143, type: !14, scopeLine: 144, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!159 = !DILocalVariable(name: "data", scope: !158, file: !13, line: 145, type: !17)
!160 = !DILocation(line: 145, column: 9, scope: !158)
!161 = !DILocation(line: 147, column: 10, scope: !158)
!162 = !DILocalVariable(name: "inputBuffer", scope: !163, file: !13, line: 152, type: !22)
!163 = distinct !DILexicalBlock(scope: !158, file: !13, line: 151, column: 5)
!164 = !DILocation(line: 152, column: 14, scope: !163)
!165 = !DILocation(line: 154, column: 19, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !13, line: 154, column: 13)
!167 = !DILocation(line: 154, column: 49, scope: !166)
!168 = !DILocation(line: 154, column: 13, scope: !166)
!169 = !DILocation(line: 154, column: 56, scope: !166)
!170 = !DILocation(line: 154, column: 13, scope: !163)
!171 = !DILocation(line: 157, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !166, file: !13, line: 155, column: 9)
!173 = !DILocation(line: 157, column: 20, scope: !172)
!174 = !DILocation(line: 157, column: 18, scope: !172)
!175 = !DILocation(line: 158, column: 9, scope: !172)
!176 = !DILocation(line: 161, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !166, file: !13, line: 160, column: 9)
!178 = !DILocalVariable(name: "i", scope: !179, file: !13, line: 174, type: !17)
!179 = distinct !DILexicalBlock(scope: !158, file: !13, line: 173, column: 5)
!180 = !DILocation(line: 174, column: 13, scope: !179)
!181 = !DILocalVariable(name: "buffer", scope: !179, file: !13, line: 175, type: !44)
!182 = !DILocation(line: 175, column: 13, scope: !179)
!183 = !DILocation(line: 177, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !179, file: !13, line: 177, column: 13)
!185 = !DILocation(line: 177, column: 18, scope: !184)
!186 = !DILocation(line: 177, column: 23, scope: !184)
!187 = !DILocation(line: 177, column: 26, scope: !184)
!188 = !DILocation(line: 177, column: 31, scope: !184)
!189 = !DILocation(line: 177, column: 13, scope: !179)
!190 = !DILocation(line: 179, column: 20, scope: !191)
!191 = distinct !DILexicalBlock(scope: !184, file: !13, line: 178, column: 9)
!192 = !DILocation(line: 179, column: 13, scope: !191)
!193 = !DILocation(line: 179, column: 26, scope: !191)
!194 = !DILocation(line: 181, column: 19, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !13, line: 181, column: 13)
!196 = !DILocation(line: 181, column: 17, scope: !195)
!197 = !DILocation(line: 181, column: 24, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !13, line: 181, column: 13)
!199 = !DILocation(line: 181, column: 26, scope: !198)
!200 = !DILocation(line: 181, column: 13, scope: !195)
!201 = !DILocation(line: 183, column: 37, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !13, line: 182, column: 13)
!203 = !DILocation(line: 183, column: 30, scope: !202)
!204 = !DILocation(line: 183, column: 17, scope: !202)
!205 = !DILocation(line: 184, column: 13, scope: !202)
!206 = !DILocation(line: 181, column: 33, scope: !198)
!207 = !DILocation(line: 181, column: 13, scope: !198)
!208 = distinct !{!208, !200, !209, !72}
!209 = !DILocation(line: 184, column: 13, scope: !195)
!210 = !DILocation(line: 185, column: 9, scope: !191)
!211 = !DILocation(line: 188, column: 13, scope: !212)
!212 = distinct !DILexicalBlock(scope: !184, file: !13, line: 187, column: 9)
!213 = !DILocation(line: 197, column: 1, scope: !158)
!214 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 200, type: !14, scopeLine: 201, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!215 = !DILocalVariable(name: "data", scope: !214, file: !13, line: 202, type: !17)
!216 = !DILocation(line: 202, column: 9, scope: !214)
!217 = !DILocation(line: 204, column: 10, scope: !214)
!218 = !DILocation(line: 214, column: 14, scope: !214)
!219 = !DILocalVariable(name: "i", scope: !220, file: !13, line: 221, type: !17)
!220 = distinct !DILexicalBlock(scope: !214, file: !13, line: 220, column: 5)
!221 = !DILocation(line: 221, column: 13, scope: !220)
!222 = !DILocalVariable(name: "buffer", scope: !220, file: !13, line: 222, type: !44)
!223 = !DILocation(line: 222, column: 13, scope: !220)
!224 = !DILocation(line: 225, column: 13, scope: !225)
!225 = distinct !DILexicalBlock(scope: !220, file: !13, line: 225, column: 13)
!226 = !DILocation(line: 225, column: 18, scope: !225)
!227 = !DILocation(line: 225, column: 13, scope: !220)
!228 = !DILocation(line: 227, column: 20, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !13, line: 226, column: 9)
!230 = !DILocation(line: 227, column: 13, scope: !229)
!231 = !DILocation(line: 227, column: 26, scope: !229)
!232 = !DILocation(line: 229, column: 19, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !13, line: 229, column: 13)
!234 = !DILocation(line: 229, column: 17, scope: !233)
!235 = !DILocation(line: 229, column: 24, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !13, line: 229, column: 13)
!237 = !DILocation(line: 229, column: 26, scope: !236)
!238 = !DILocation(line: 229, column: 13, scope: !233)
!239 = !DILocation(line: 231, column: 37, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !13, line: 230, column: 13)
!241 = !DILocation(line: 231, column: 30, scope: !240)
!242 = !DILocation(line: 231, column: 17, scope: !240)
!243 = !DILocation(line: 232, column: 13, scope: !240)
!244 = !DILocation(line: 229, column: 33, scope: !236)
!245 = !DILocation(line: 229, column: 13, scope: !236)
!246 = distinct !{!246, !238, !247, !72}
!247 = !DILocation(line: 232, column: 13, scope: !233)
!248 = !DILocation(line: 233, column: 9, scope: !229)
!249 = !DILocation(line: 236, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !225, file: !13, line: 235, column: 9)
!251 = !DILocation(line: 245, column: 1, scope: !214)
!252 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 248, type: !14, scopeLine: 249, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!253 = !DILocalVariable(name: "data", scope: !252, file: !13, line: 250, type: !17)
!254 = !DILocation(line: 250, column: 9, scope: !252)
!255 = !DILocation(line: 252, column: 10, scope: !252)
!256 = !DILocation(line: 258, column: 14, scope: !252)
!257 = !DILocalVariable(name: "i", scope: !258, file: !13, line: 269, type: !17)
!258 = distinct !DILexicalBlock(scope: !252, file: !13, line: 268, column: 5)
!259 = !DILocation(line: 269, column: 13, scope: !258)
!260 = !DILocalVariable(name: "buffer", scope: !258, file: !13, line: 270, type: !44)
!261 = !DILocation(line: 270, column: 13, scope: !258)
!262 = !DILocation(line: 273, column: 13, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !13, line: 273, column: 13)
!264 = !DILocation(line: 273, column: 18, scope: !263)
!265 = !DILocation(line: 273, column: 13, scope: !258)
!266 = !DILocation(line: 275, column: 20, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !13, line: 274, column: 9)
!268 = !DILocation(line: 275, column: 13, scope: !267)
!269 = !DILocation(line: 275, column: 26, scope: !267)
!270 = !DILocation(line: 277, column: 19, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !13, line: 277, column: 13)
!272 = !DILocation(line: 277, column: 17, scope: !271)
!273 = !DILocation(line: 277, column: 24, scope: !274)
!274 = distinct !DILexicalBlock(scope: !271, file: !13, line: 277, column: 13)
!275 = !DILocation(line: 277, column: 26, scope: !274)
!276 = !DILocation(line: 277, column: 13, scope: !271)
!277 = !DILocation(line: 279, column: 37, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !13, line: 278, column: 13)
!279 = !DILocation(line: 279, column: 30, scope: !278)
!280 = !DILocation(line: 279, column: 17, scope: !278)
!281 = !DILocation(line: 280, column: 13, scope: !278)
!282 = !DILocation(line: 277, column: 33, scope: !274)
!283 = !DILocation(line: 277, column: 13, scope: !274)
!284 = distinct !{!284, !276, !285, !72}
!285 = !DILocation(line: 280, column: 13, scope: !271)
!286 = !DILocation(line: 281, column: 9, scope: !267)
!287 = !DILocation(line: 284, column: 13, scope: !288)
!288 = distinct !DILexicalBlock(scope: !263, file: !13, line: 283, column: 9)
!289 = !DILocation(line: 293, column: 1, scope: !252)
