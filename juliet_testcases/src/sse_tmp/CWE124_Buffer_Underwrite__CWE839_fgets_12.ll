; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_12_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i18 = alloca i32, align 4
  %buffer19 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.else5, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !23, metadata !DIExpression()), !dbg !30
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !30
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !31
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !33
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !34
  %cmp = icmp ne i8* %call1, null, !dbg !35
  br i1 %cmp, label %if.then2, label %if.else, !dbg !36

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !39
  store i32 %call4, i32* %data, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end6, !dbg !44

if.else5:                                         ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !45
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.end
  %call7 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !47
  %tobool8 = icmp ne i32 %call7, 0, !dbg !47
  br i1 %tobool8, label %if.then9, label %if.else17, !dbg !49

if.then9:                                         ; preds = %if.end6
  call void @llvm.dbg.declare(metadata i32* %i, metadata !50, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !54, metadata !DIExpression()), !dbg !58
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !58
  %3 = load i32, i32* %data, align 4, !dbg !59
  %cmp10 = icmp slt i32 %3, 10, !dbg !61
  br i1 %cmp10, label %if.then11, label %if.else15, !dbg !62

if.then11:                                        ; preds = %if.then9
  %4 = load i32, i32* %data, align 4, !dbg !63
  %idxprom = sext i32 %4 to i64, !dbg !65
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !65
  store i32 1, i32* %arrayidx, align 4, !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %if.then11
  %5 = load i32, i32* %i, align 4, !dbg !70
  %cmp12 = icmp slt i32 %5, 10, !dbg !72
  br i1 %cmp12, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !74
  %idxprom13 = sext i32 %6 to i64, !dbg !76
  %arrayidx14 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom13, !dbg !76
  %7 = load i32, i32* %arrayidx14, align 4, !dbg !76
  call void @printIntLine(i32 %7), !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !79
  %inc = add nsw i32 %8, 1, !dbg !79
  store i32 %inc, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  br label %if.end16, !dbg !84

if.else15:                                        ; preds = %if.then9
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %for.end
  br label %if.end35, !dbg !87

if.else17:                                        ; preds = %if.end6
  call void @llvm.dbg.declare(metadata i32* %i18, metadata !88, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer19, metadata !92, metadata !DIExpression()), !dbg !93
  %9 = bitcast [10 x i32]* %buffer19 to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 40, i1 false), !dbg !93
  %10 = load i32, i32* %data, align 4, !dbg !94
  %cmp20 = icmp sge i32 %10, 0, !dbg !96
  br i1 %cmp20, label %land.lhs.true, label %if.else33, !dbg !97

land.lhs.true:                                    ; preds = %if.else17
  %11 = load i32, i32* %data, align 4, !dbg !98
  %cmp21 = icmp slt i32 %11, 10, !dbg !99
  br i1 %cmp21, label %if.then22, label %if.else33, !dbg !100

if.then22:                                        ; preds = %land.lhs.true
  %12 = load i32, i32* %data, align 4, !dbg !101
  %idxprom23 = sext i32 %12 to i64, !dbg !103
  %arrayidx24 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer19, i64 0, i64 %idxprom23, !dbg !103
  store i32 1, i32* %arrayidx24, align 4, !dbg !104
  store i32 0, i32* %i18, align 4, !dbg !105
  br label %for.cond25, !dbg !107

for.cond25:                                       ; preds = %for.inc30, %if.then22
  %13 = load i32, i32* %i18, align 4, !dbg !108
  %cmp26 = icmp slt i32 %13, 10, !dbg !110
  br i1 %cmp26, label %for.body27, label %for.end32, !dbg !111

for.body27:                                       ; preds = %for.cond25
  %14 = load i32, i32* %i18, align 4, !dbg !112
  %idxprom28 = sext i32 %14 to i64, !dbg !114
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer19, i64 0, i64 %idxprom28, !dbg !114
  %15 = load i32, i32* %arrayidx29, align 4, !dbg !114
  call void @printIntLine(i32 %15), !dbg !115
  br label %for.inc30, !dbg !116

for.inc30:                                        ; preds = %for.body27
  %16 = load i32, i32* %i18, align 4, !dbg !117
  %inc31 = add nsw i32 %16, 1, !dbg !117
  store i32 %inc31, i32* %i18, align 4, !dbg !117
  br label %for.cond25, !dbg !118, !llvm.loop !119

for.end32:                                        ; preds = %for.cond25
  br label %if.end34, !dbg !121

if.else33:                                        ; preds = %land.lhs.true, %if.else17
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !122
  br label %if.end34

if.end34:                                         ; preds = %if.else33, %for.end32
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end16
  ret void, !dbg !124
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #2

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_12_good() #0 !dbg !125 {
entry:
  call void @goodB2G(), !dbg !126
  call void @goodG2B(), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !129 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !134, metadata !DIExpression()), !dbg !135
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !136, metadata !DIExpression()), !dbg !137
  %call = call i64 @time(i64* null) #7, !dbg !138
  %conv = trunc i64 %call to i32, !dbg !139
  call void @srand(i32 %conv) #7, !dbg !140
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !141
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_12_good(), !dbg !142
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !143
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !144
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_12_bad(), !dbg !145
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !146
  ret i32 0, !dbg !147
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %inputBuffer6 = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i28 = alloca i32, align 4
  %buffer29 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 -1, i32* %data, align 4, !dbg !151
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !152
  %tobool = icmp ne i32 %call, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.else5, !dbg !154

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !155, metadata !DIExpression()), !dbg !158
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !158
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !161
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !162
  %cmp = icmp ne i8* %call1, null, !dbg !163
  br i1 %cmp, label %if.then2, label %if.else, !dbg !164

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !165
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !167
  store i32 %call4, i32* %data, align 4, !dbg !168
  br label %if.end, !dbg !169

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !170
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end15, !dbg !172

if.else5:                                         ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer6, metadata !173, metadata !DIExpression()), !dbg !176
  %2 = bitcast [14 x i8]* %inputBuffer6 to i8*, !dbg !176
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !176
  %arraydecay7 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer6, i64 0, i64 0, !dbg !177
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !179
  %call8 = call i8* @fgets(i8* %arraydecay7, i32 14, %struct._IO_FILE* %3), !dbg !180
  %cmp9 = icmp ne i8* %call8, null, !dbg !181
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !182

if.then10:                                        ; preds = %if.else5
  %arraydecay11 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer6, i64 0, i64 0, !dbg !183
  %call12 = call i32 @atoi(i8* %arraydecay11) #6, !dbg !185
  store i32 %call12, i32* %data, align 4, !dbg !186
  br label %if.end14, !dbg !187

if.else13:                                        ; preds = %if.else5
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !188
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end
  %call16 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !190
  %tobool17 = icmp ne i32 %call16, 0, !dbg !190
  br i1 %tobool17, label %if.then18, label %if.else27, !dbg !192

if.then18:                                        ; preds = %if.end15
  call void @llvm.dbg.declare(metadata i32* %i, metadata !193, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !197, metadata !DIExpression()), !dbg !198
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !198
  %5 = load i32, i32* %data, align 4, !dbg !199
  %cmp19 = icmp sge i32 %5, 0, !dbg !201
  br i1 %cmp19, label %land.lhs.true, label %if.else25, !dbg !202

land.lhs.true:                                    ; preds = %if.then18
  %6 = load i32, i32* %data, align 4, !dbg !203
  %cmp20 = icmp slt i32 %6, 10, !dbg !204
  br i1 %cmp20, label %if.then21, label %if.else25, !dbg !205

if.then21:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !206
  %idxprom = sext i32 %7 to i64, !dbg !208
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !208
  store i32 1, i32* %arrayidx, align 4, !dbg !209
  store i32 0, i32* %i, align 4, !dbg !210
  br label %for.cond, !dbg !212

for.cond:                                         ; preds = %for.inc, %if.then21
  %8 = load i32, i32* %i, align 4, !dbg !213
  %cmp22 = icmp slt i32 %8, 10, !dbg !215
  br i1 %cmp22, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !217
  %idxprom23 = sext i32 %9 to i64, !dbg !219
  %arrayidx24 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom23, !dbg !219
  %10 = load i32, i32* %arrayidx24, align 4, !dbg !219
  call void @printIntLine(i32 %10), !dbg !220
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !222
  %inc = add nsw i32 %11, 1, !dbg !222
  store i32 %inc, i32* %i, align 4, !dbg !222
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  br label %if.end26, !dbg !226

if.else25:                                        ; preds = %land.lhs.true, %if.then18
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !227
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end
  br label %if.end46, !dbg !229

if.else27:                                        ; preds = %if.end15
  call void @llvm.dbg.declare(metadata i32* %i28, metadata !230, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer29, metadata !234, metadata !DIExpression()), !dbg !235
  %12 = bitcast [10 x i32]* %buffer29 to i8*, !dbg !235
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !235
  %13 = load i32, i32* %data, align 4, !dbg !236
  %cmp30 = icmp sge i32 %13, 0, !dbg !238
  br i1 %cmp30, label %land.lhs.true31, label %if.else44, !dbg !239

land.lhs.true31:                                  ; preds = %if.else27
  %14 = load i32, i32* %data, align 4, !dbg !240
  %cmp32 = icmp slt i32 %14, 10, !dbg !241
  br i1 %cmp32, label %if.then33, label %if.else44, !dbg !242

if.then33:                                        ; preds = %land.lhs.true31
  %15 = load i32, i32* %data, align 4, !dbg !243
  %idxprom34 = sext i32 %15 to i64, !dbg !245
  %arrayidx35 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer29, i64 0, i64 %idxprom34, !dbg !245
  store i32 1, i32* %arrayidx35, align 4, !dbg !246
  store i32 0, i32* %i28, align 4, !dbg !247
  br label %for.cond36, !dbg !249

for.cond36:                                       ; preds = %for.inc41, %if.then33
  %16 = load i32, i32* %i28, align 4, !dbg !250
  %cmp37 = icmp slt i32 %16, 10, !dbg !252
  br i1 %cmp37, label %for.body38, label %for.end43, !dbg !253

for.body38:                                       ; preds = %for.cond36
  %17 = load i32, i32* %i28, align 4, !dbg !254
  %idxprom39 = sext i32 %17 to i64, !dbg !256
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer29, i64 0, i64 %idxprom39, !dbg !256
  %18 = load i32, i32* %arrayidx40, align 4, !dbg !256
  call void @printIntLine(i32 %18), !dbg !257
  br label %for.inc41, !dbg !258

for.inc41:                                        ; preds = %for.body38
  %19 = load i32, i32* %i28, align 4, !dbg !259
  %inc42 = add nsw i32 %19, 1, !dbg !259
  store i32 %inc42, i32* %i28, align 4, !dbg !259
  br label %for.cond36, !dbg !260, !llvm.loop !261

for.end43:                                        ; preds = %for.cond36
  br label %if.end45, !dbg !263

if.else44:                                        ; preds = %land.lhs.true31, %if.else27
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !264
  br label %if.end45

if.end45:                                         ; preds = %if.else44, %for.end43
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.end26
  ret void, !dbg !266
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !267 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i11 = alloca i32, align 4
  %buffer12 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !268, metadata !DIExpression()), !dbg !269
  store i32 -1, i32* %data, align 4, !dbg !270
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !271
  %tobool = icmp ne i32 %call, 0, !dbg !271
  br i1 %tobool, label %if.then, label %if.else, !dbg !273

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !274
  br label %if.end, !dbg !276

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !277
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !279
  %tobool2 = icmp ne i32 %call1, 0, !dbg !279
  br i1 %tobool2, label %if.then3, label %if.else10, !dbg !281

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !282, metadata !DIExpression()), !dbg !285
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !286, metadata !DIExpression()), !dbg !287
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !287
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !287
  %1 = load i32, i32* %data, align 4, !dbg !288
  %cmp = icmp slt i32 %1, 10, !dbg !290
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !291

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !292
  %idxprom = sext i32 %2 to i64, !dbg !294
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !294
  store i32 1, i32* %arrayidx, align 4, !dbg !295
  store i32 0, i32* %i, align 4, !dbg !296
  br label %for.cond, !dbg !298

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !299
  %cmp5 = icmp slt i32 %3, 10, !dbg !301
  br i1 %cmp5, label %for.body, label %for.end, !dbg !302

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !303
  %idxprom6 = sext i32 %4 to i64, !dbg !305
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !305
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !305
  call void @printIntLine(i32 %5), !dbg !306
  br label %for.inc, !dbg !307

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !308
  %inc = add nsw i32 %6, 1, !dbg !308
  store i32 %inc, i32* %i, align 4, !dbg !308
  br label %for.cond, !dbg !309, !llvm.loop !310

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !312

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !313
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end27, !dbg !315

if.else10:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !316, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer12, metadata !320, metadata !DIExpression()), !dbg !321
  %7 = bitcast [10 x i32]* %buffer12 to i8*, !dbg !321
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !321
  %8 = load i32, i32* %data, align 4, !dbg !322
  %cmp13 = icmp slt i32 %8, 10, !dbg !324
  br i1 %cmp13, label %if.then14, label %if.else25, !dbg !325

if.then14:                                        ; preds = %if.else10
  %9 = load i32, i32* %data, align 4, !dbg !326
  %idxprom15 = sext i32 %9 to i64, !dbg !328
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom15, !dbg !328
  store i32 1, i32* %arrayidx16, align 4, !dbg !329
  store i32 0, i32* %i11, align 4, !dbg !330
  br label %for.cond17, !dbg !332

for.cond17:                                       ; preds = %for.inc22, %if.then14
  %10 = load i32, i32* %i11, align 4, !dbg !333
  %cmp18 = icmp slt i32 %10, 10, !dbg !335
  br i1 %cmp18, label %for.body19, label %for.end24, !dbg !336

for.body19:                                       ; preds = %for.cond17
  %11 = load i32, i32* %i11, align 4, !dbg !337
  %idxprom20 = sext i32 %11 to i64, !dbg !339
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom20, !dbg !339
  %12 = load i32, i32* %arrayidx21, align 4, !dbg !339
  call void @printIntLine(i32 %12), !dbg !340
  br label %for.inc22, !dbg !341

for.inc22:                                        ; preds = %for.body19
  %13 = load i32, i32* %i11, align 4, !dbg !342
  %inc23 = add nsw i32 %13, 1, !dbg !342
  store i32 %inc23, i32* %i11, align 4, !dbg !342
  br label %for.cond17, !dbg !343, !llvm.loop !344

for.end24:                                        ; preds = %for.cond17
  br label %if.end26, !dbg !346

if.else25:                                        ; preds = %if.else10
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !347
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end24
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end9
  ret void, !dbg !349
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_12_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_12.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocation(line: 29, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!22 = !DILocation(line: 29, column: 8, scope: !12)
!23 = !DILocalVariable(name: "inputBuffer", scope: !24, file: !13, line: 32, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !13, line: 31, column: 9)
!25 = distinct !DILexicalBlock(scope: !21, file: !13, line: 30, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 112, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 14)
!30 = !DILocation(line: 32, column: 18, scope: !24)
!31 = !DILocation(line: 34, column: 23, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !13, line: 34, column: 17)
!33 = !DILocation(line: 34, column: 53, scope: !32)
!34 = !DILocation(line: 34, column: 17, scope: !32)
!35 = !DILocation(line: 34, column: 60, scope: !32)
!36 = !DILocation(line: 34, column: 17, scope: !24)
!37 = !DILocation(line: 37, column: 29, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !13, line: 35, column: 13)
!39 = !DILocation(line: 37, column: 24, scope: !38)
!40 = !DILocation(line: 37, column: 22, scope: !38)
!41 = !DILocation(line: 38, column: 13, scope: !38)
!42 = !DILocation(line: 41, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !32, file: !13, line: 40, column: 13)
!44 = !DILocation(line: 44, column: 5, scope: !25)
!45 = !DILocation(line: 49, column: 14, scope: !46)
!46 = distinct !DILexicalBlock(scope: !21, file: !13, line: 46, column: 5)
!47 = !DILocation(line: 51, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !12, file: !13, line: 51, column: 8)
!49 = !DILocation(line: 51, column: 8, scope: !12)
!50 = !DILocalVariable(name: "i", scope: !51, file: !13, line: 54, type: !17)
!51 = distinct !DILexicalBlock(scope: !52, file: !13, line: 53, column: 9)
!52 = distinct !DILexicalBlock(scope: !48, file: !13, line: 52, column: 5)
!53 = !DILocation(line: 54, column: 17, scope: !51)
!54 = !DILocalVariable(name: "buffer", scope: !51, file: !13, line: 55, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 10)
!58 = !DILocation(line: 55, column: 17, scope: !51)
!59 = !DILocation(line: 58, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !13, line: 58, column: 17)
!61 = !DILocation(line: 58, column: 22, scope: !60)
!62 = !DILocation(line: 58, column: 17, scope: !51)
!63 = !DILocation(line: 60, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !13, line: 59, column: 13)
!65 = !DILocation(line: 60, column: 17, scope: !64)
!66 = !DILocation(line: 60, column: 30, scope: !64)
!67 = !DILocation(line: 62, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !13, line: 62, column: 17)
!69 = !DILocation(line: 62, column: 21, scope: !68)
!70 = !DILocation(line: 62, column: 28, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !13, line: 62, column: 17)
!72 = !DILocation(line: 62, column: 30, scope: !71)
!73 = !DILocation(line: 62, column: 17, scope: !68)
!74 = !DILocation(line: 64, column: 41, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !13, line: 63, column: 17)
!76 = !DILocation(line: 64, column: 34, scope: !75)
!77 = !DILocation(line: 64, column: 21, scope: !75)
!78 = !DILocation(line: 65, column: 17, scope: !75)
!79 = !DILocation(line: 62, column: 37, scope: !71)
!80 = !DILocation(line: 62, column: 17, scope: !71)
!81 = distinct !{!81, !73, !82, !83}
!82 = !DILocation(line: 65, column: 17, scope: !68)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 66, column: 13, scope: !64)
!85 = !DILocation(line: 69, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !60, file: !13, line: 68, column: 13)
!87 = !DILocation(line: 72, column: 5, scope: !52)
!88 = !DILocalVariable(name: "i", scope: !89, file: !13, line: 76, type: !17)
!89 = distinct !DILexicalBlock(scope: !90, file: !13, line: 75, column: 9)
!90 = distinct !DILexicalBlock(scope: !48, file: !13, line: 74, column: 5)
!91 = !DILocation(line: 76, column: 17, scope: !89)
!92 = !DILocalVariable(name: "buffer", scope: !89, file: !13, line: 77, type: !55)
!93 = !DILocation(line: 77, column: 17, scope: !89)
!94 = !DILocation(line: 79, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !13, line: 79, column: 17)
!96 = !DILocation(line: 79, column: 22, scope: !95)
!97 = !DILocation(line: 79, column: 27, scope: !95)
!98 = !DILocation(line: 79, column: 30, scope: !95)
!99 = !DILocation(line: 79, column: 35, scope: !95)
!100 = !DILocation(line: 79, column: 17, scope: !89)
!101 = !DILocation(line: 81, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !13, line: 80, column: 13)
!103 = !DILocation(line: 81, column: 17, scope: !102)
!104 = !DILocation(line: 81, column: 30, scope: !102)
!105 = !DILocation(line: 83, column: 23, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !13, line: 83, column: 17)
!107 = !DILocation(line: 83, column: 21, scope: !106)
!108 = !DILocation(line: 83, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !13, line: 83, column: 17)
!110 = !DILocation(line: 83, column: 30, scope: !109)
!111 = !DILocation(line: 83, column: 17, scope: !106)
!112 = !DILocation(line: 85, column: 41, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !13, line: 84, column: 17)
!114 = !DILocation(line: 85, column: 34, scope: !113)
!115 = !DILocation(line: 85, column: 21, scope: !113)
!116 = !DILocation(line: 86, column: 17, scope: !113)
!117 = !DILocation(line: 83, column: 37, scope: !109)
!118 = !DILocation(line: 83, column: 17, scope: !109)
!119 = distinct !{!119, !111, !120, !83}
!120 = !DILocation(line: 86, column: 17, scope: !106)
!121 = !DILocation(line: 87, column: 13, scope: !102)
!122 = !DILocation(line: 90, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !95, file: !13, line: 89, column: 13)
!124 = !DILocation(line: 94, column: 1, scope: !12)
!125 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_12_good", scope: !13, file: !13, line: 250, type: !14, scopeLine: 251, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocation(line: 252, column: 5, scope: !125)
!127 = !DILocation(line: 253, column: 5, scope: !125)
!128 = !DILocation(line: 254, column: 1, scope: !125)
!129 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 265, type: !130, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DISubroutineType(types: !131)
!131 = !{!17, !17, !132}
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !133, size: 64)
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!134 = !DILocalVariable(name: "argc", arg: 1, scope: !129, file: !13, line: 265, type: !17)
!135 = !DILocation(line: 265, column: 14, scope: !129)
!136 = !DILocalVariable(name: "argv", arg: 2, scope: !129, file: !13, line: 265, type: !132)
!137 = !DILocation(line: 265, column: 27, scope: !129)
!138 = !DILocation(line: 268, column: 22, scope: !129)
!139 = !DILocation(line: 268, column: 12, scope: !129)
!140 = !DILocation(line: 268, column: 5, scope: !129)
!141 = !DILocation(line: 270, column: 5, scope: !129)
!142 = !DILocation(line: 271, column: 5, scope: !129)
!143 = !DILocation(line: 272, column: 5, scope: !129)
!144 = !DILocation(line: 275, column: 5, scope: !129)
!145 = !DILocation(line: 276, column: 5, scope: !129)
!146 = !DILocation(line: 277, column: 5, scope: !129)
!147 = !DILocation(line: 279, column: 5, scope: !129)
!148 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 103, type: !14, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", scope: !148, file: !13, line: 105, type: !17)
!150 = !DILocation(line: 105, column: 9, scope: !148)
!151 = !DILocation(line: 107, column: 10, scope: !148)
!152 = !DILocation(line: 108, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !13, line: 108, column: 8)
!154 = !DILocation(line: 108, column: 8, scope: !148)
!155 = !DILocalVariable(name: "inputBuffer", scope: !156, file: !13, line: 111, type: !26)
!156 = distinct !DILexicalBlock(scope: !157, file: !13, line: 110, column: 9)
!157 = distinct !DILexicalBlock(scope: !153, file: !13, line: 109, column: 5)
!158 = !DILocation(line: 111, column: 18, scope: !156)
!159 = !DILocation(line: 113, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !13, line: 113, column: 17)
!161 = !DILocation(line: 113, column: 53, scope: !160)
!162 = !DILocation(line: 113, column: 17, scope: !160)
!163 = !DILocation(line: 113, column: 60, scope: !160)
!164 = !DILocation(line: 113, column: 17, scope: !156)
!165 = !DILocation(line: 116, column: 29, scope: !166)
!166 = distinct !DILexicalBlock(scope: !160, file: !13, line: 114, column: 13)
!167 = !DILocation(line: 116, column: 24, scope: !166)
!168 = !DILocation(line: 116, column: 22, scope: !166)
!169 = !DILocation(line: 117, column: 13, scope: !166)
!170 = !DILocation(line: 120, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !160, file: !13, line: 119, column: 13)
!172 = !DILocation(line: 123, column: 5, scope: !157)
!173 = !DILocalVariable(name: "inputBuffer", scope: !174, file: !13, line: 127, type: !26)
!174 = distinct !DILexicalBlock(scope: !175, file: !13, line: 126, column: 9)
!175 = distinct !DILexicalBlock(scope: !153, file: !13, line: 125, column: 5)
!176 = !DILocation(line: 127, column: 18, scope: !174)
!177 = !DILocation(line: 129, column: 23, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !13, line: 129, column: 17)
!179 = !DILocation(line: 129, column: 53, scope: !178)
!180 = !DILocation(line: 129, column: 17, scope: !178)
!181 = !DILocation(line: 129, column: 60, scope: !178)
!182 = !DILocation(line: 129, column: 17, scope: !174)
!183 = !DILocation(line: 132, column: 29, scope: !184)
!184 = distinct !DILexicalBlock(scope: !178, file: !13, line: 130, column: 13)
!185 = !DILocation(line: 132, column: 24, scope: !184)
!186 = !DILocation(line: 132, column: 22, scope: !184)
!187 = !DILocation(line: 133, column: 13, scope: !184)
!188 = !DILocation(line: 136, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !178, file: !13, line: 135, column: 13)
!190 = !DILocation(line: 140, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !148, file: !13, line: 140, column: 8)
!192 = !DILocation(line: 140, column: 8, scope: !148)
!193 = !DILocalVariable(name: "i", scope: !194, file: !13, line: 143, type: !17)
!194 = distinct !DILexicalBlock(scope: !195, file: !13, line: 142, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !13, line: 141, column: 5)
!196 = !DILocation(line: 143, column: 17, scope: !194)
!197 = !DILocalVariable(name: "buffer", scope: !194, file: !13, line: 144, type: !55)
!198 = !DILocation(line: 144, column: 17, scope: !194)
!199 = !DILocation(line: 146, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !194, file: !13, line: 146, column: 17)
!201 = !DILocation(line: 146, column: 22, scope: !200)
!202 = !DILocation(line: 146, column: 27, scope: !200)
!203 = !DILocation(line: 146, column: 30, scope: !200)
!204 = !DILocation(line: 146, column: 35, scope: !200)
!205 = !DILocation(line: 146, column: 17, scope: !194)
!206 = !DILocation(line: 148, column: 24, scope: !207)
!207 = distinct !DILexicalBlock(scope: !200, file: !13, line: 147, column: 13)
!208 = !DILocation(line: 148, column: 17, scope: !207)
!209 = !DILocation(line: 148, column: 30, scope: !207)
!210 = !DILocation(line: 150, column: 23, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !13, line: 150, column: 17)
!212 = !DILocation(line: 150, column: 21, scope: !211)
!213 = !DILocation(line: 150, column: 28, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !13, line: 150, column: 17)
!215 = !DILocation(line: 150, column: 30, scope: !214)
!216 = !DILocation(line: 150, column: 17, scope: !211)
!217 = !DILocation(line: 152, column: 41, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !13, line: 151, column: 17)
!219 = !DILocation(line: 152, column: 34, scope: !218)
!220 = !DILocation(line: 152, column: 21, scope: !218)
!221 = !DILocation(line: 153, column: 17, scope: !218)
!222 = !DILocation(line: 150, column: 37, scope: !214)
!223 = !DILocation(line: 150, column: 17, scope: !214)
!224 = distinct !{!224, !216, !225, !83}
!225 = !DILocation(line: 153, column: 17, scope: !211)
!226 = !DILocation(line: 154, column: 13, scope: !207)
!227 = !DILocation(line: 157, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !200, file: !13, line: 156, column: 13)
!229 = !DILocation(line: 160, column: 5, scope: !195)
!230 = !DILocalVariable(name: "i", scope: !231, file: !13, line: 164, type: !17)
!231 = distinct !DILexicalBlock(scope: !232, file: !13, line: 163, column: 9)
!232 = distinct !DILexicalBlock(scope: !191, file: !13, line: 162, column: 5)
!233 = !DILocation(line: 164, column: 17, scope: !231)
!234 = !DILocalVariable(name: "buffer", scope: !231, file: !13, line: 165, type: !55)
!235 = !DILocation(line: 165, column: 17, scope: !231)
!236 = !DILocation(line: 167, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !231, file: !13, line: 167, column: 17)
!238 = !DILocation(line: 167, column: 22, scope: !237)
!239 = !DILocation(line: 167, column: 27, scope: !237)
!240 = !DILocation(line: 167, column: 30, scope: !237)
!241 = !DILocation(line: 167, column: 35, scope: !237)
!242 = !DILocation(line: 167, column: 17, scope: !231)
!243 = !DILocation(line: 169, column: 24, scope: !244)
!244 = distinct !DILexicalBlock(scope: !237, file: !13, line: 168, column: 13)
!245 = !DILocation(line: 169, column: 17, scope: !244)
!246 = !DILocation(line: 169, column: 30, scope: !244)
!247 = !DILocation(line: 171, column: 23, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !13, line: 171, column: 17)
!249 = !DILocation(line: 171, column: 21, scope: !248)
!250 = !DILocation(line: 171, column: 28, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !13, line: 171, column: 17)
!252 = !DILocation(line: 171, column: 30, scope: !251)
!253 = !DILocation(line: 171, column: 17, scope: !248)
!254 = !DILocation(line: 173, column: 41, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !13, line: 172, column: 17)
!256 = !DILocation(line: 173, column: 34, scope: !255)
!257 = !DILocation(line: 173, column: 21, scope: !255)
!258 = !DILocation(line: 174, column: 17, scope: !255)
!259 = !DILocation(line: 171, column: 37, scope: !251)
!260 = !DILocation(line: 171, column: 17, scope: !251)
!261 = distinct !{!261, !253, !262, !83}
!262 = !DILocation(line: 174, column: 17, scope: !248)
!263 = !DILocation(line: 175, column: 13, scope: !244)
!264 = !DILocation(line: 178, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !237, file: !13, line: 177, column: 13)
!266 = !DILocation(line: 182, column: 1, scope: !148)
!267 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 187, type: !14, scopeLine: 188, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!268 = !DILocalVariable(name: "data", scope: !267, file: !13, line: 189, type: !17)
!269 = !DILocation(line: 189, column: 9, scope: !267)
!270 = !DILocation(line: 191, column: 10, scope: !267)
!271 = !DILocation(line: 192, column: 8, scope: !272)
!272 = distinct !DILexicalBlock(scope: !267, file: !13, line: 192, column: 8)
!273 = !DILocation(line: 192, column: 8, scope: !267)
!274 = !DILocation(line: 196, column: 14, scope: !275)
!275 = distinct !DILexicalBlock(scope: !272, file: !13, line: 193, column: 5)
!276 = !DILocation(line: 197, column: 5, scope: !275)
!277 = !DILocation(line: 202, column: 14, scope: !278)
!278 = distinct !DILexicalBlock(scope: !272, file: !13, line: 199, column: 5)
!279 = !DILocation(line: 204, column: 8, scope: !280)
!280 = distinct !DILexicalBlock(scope: !267, file: !13, line: 204, column: 8)
!281 = !DILocation(line: 204, column: 8, scope: !267)
!282 = !DILocalVariable(name: "i", scope: !283, file: !13, line: 207, type: !17)
!283 = distinct !DILexicalBlock(scope: !284, file: !13, line: 206, column: 9)
!284 = distinct !DILexicalBlock(scope: !280, file: !13, line: 205, column: 5)
!285 = !DILocation(line: 207, column: 17, scope: !283)
!286 = !DILocalVariable(name: "buffer", scope: !283, file: !13, line: 208, type: !55)
!287 = !DILocation(line: 208, column: 17, scope: !283)
!288 = !DILocation(line: 211, column: 17, scope: !289)
!289 = distinct !DILexicalBlock(scope: !283, file: !13, line: 211, column: 17)
!290 = !DILocation(line: 211, column: 22, scope: !289)
!291 = !DILocation(line: 211, column: 17, scope: !283)
!292 = !DILocation(line: 213, column: 24, scope: !293)
!293 = distinct !DILexicalBlock(scope: !289, file: !13, line: 212, column: 13)
!294 = !DILocation(line: 213, column: 17, scope: !293)
!295 = !DILocation(line: 213, column: 30, scope: !293)
!296 = !DILocation(line: 215, column: 23, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !13, line: 215, column: 17)
!298 = !DILocation(line: 215, column: 21, scope: !297)
!299 = !DILocation(line: 215, column: 28, scope: !300)
!300 = distinct !DILexicalBlock(scope: !297, file: !13, line: 215, column: 17)
!301 = !DILocation(line: 215, column: 30, scope: !300)
!302 = !DILocation(line: 215, column: 17, scope: !297)
!303 = !DILocation(line: 217, column: 41, scope: !304)
!304 = distinct !DILexicalBlock(scope: !300, file: !13, line: 216, column: 17)
!305 = !DILocation(line: 217, column: 34, scope: !304)
!306 = !DILocation(line: 217, column: 21, scope: !304)
!307 = !DILocation(line: 218, column: 17, scope: !304)
!308 = !DILocation(line: 215, column: 37, scope: !300)
!309 = !DILocation(line: 215, column: 17, scope: !300)
!310 = distinct !{!310, !302, !311, !83}
!311 = !DILocation(line: 218, column: 17, scope: !297)
!312 = !DILocation(line: 219, column: 13, scope: !293)
!313 = !DILocation(line: 222, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !289, file: !13, line: 221, column: 13)
!315 = !DILocation(line: 225, column: 5, scope: !284)
!316 = !DILocalVariable(name: "i", scope: !317, file: !13, line: 229, type: !17)
!317 = distinct !DILexicalBlock(scope: !318, file: !13, line: 228, column: 9)
!318 = distinct !DILexicalBlock(scope: !280, file: !13, line: 227, column: 5)
!319 = !DILocation(line: 229, column: 17, scope: !317)
!320 = !DILocalVariable(name: "buffer", scope: !317, file: !13, line: 230, type: !55)
!321 = !DILocation(line: 230, column: 17, scope: !317)
!322 = !DILocation(line: 233, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !317, file: !13, line: 233, column: 17)
!324 = !DILocation(line: 233, column: 22, scope: !323)
!325 = !DILocation(line: 233, column: 17, scope: !317)
!326 = !DILocation(line: 235, column: 24, scope: !327)
!327 = distinct !DILexicalBlock(scope: !323, file: !13, line: 234, column: 13)
!328 = !DILocation(line: 235, column: 17, scope: !327)
!329 = !DILocation(line: 235, column: 30, scope: !327)
!330 = !DILocation(line: 237, column: 23, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !13, line: 237, column: 17)
!332 = !DILocation(line: 237, column: 21, scope: !331)
!333 = !DILocation(line: 237, column: 28, scope: !334)
!334 = distinct !DILexicalBlock(scope: !331, file: !13, line: 237, column: 17)
!335 = !DILocation(line: 237, column: 30, scope: !334)
!336 = !DILocation(line: 237, column: 17, scope: !331)
!337 = !DILocation(line: 239, column: 41, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !13, line: 238, column: 17)
!339 = !DILocation(line: 239, column: 34, scope: !338)
!340 = !DILocation(line: 239, column: 21, scope: !338)
!341 = !DILocation(line: 240, column: 17, scope: !338)
!342 = !DILocation(line: 237, column: 37, scope: !334)
!343 = !DILocation(line: 237, column: 17, scope: !334)
!344 = distinct !{!344, !336, !345, !83}
!345 = !DILocation(line: 240, column: 17, scope: !331)
!346 = !DILocation(line: 241, column: 13, scope: !327)
!347 = !DILocation(line: 244, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !323, file: !13, line: 243, column: 13)
!349 = !DILocation(line: 248, column: 1, scope: !267)
