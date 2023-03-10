; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fscanf_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fscanf_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fscanf_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i12 = alloca i32, align 4
  %buffer13 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !19
  %tobool = icmp ne i32 %call, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.else, !dbg !21

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !22
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !24
  br label %if.end, !dbg !25

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !26
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call2 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !28
  %tobool3 = icmp ne i32 %call2, 0, !dbg !28
  br i1 %tobool3, label %if.then4, label %if.else11, !dbg !30

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !35, metadata !DIExpression()), !dbg !39
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !39
  %2 = load i32, i32* %data, align 4, !dbg !40
  %cmp = icmp slt i32 %2, 10, !dbg !42
  br i1 %cmp, label %if.then5, label %if.else9, !dbg !43

if.then5:                                         ; preds = %if.then4
  %3 = load i32, i32* %data, align 4, !dbg !44
  %idxprom = sext i32 %3 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !46
  store i32 1, i32* %arrayidx, align 4, !dbg !47
  store i32 0, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.then5
  %4 = load i32, i32* %i, align 4, !dbg !51
  %cmp6 = icmp slt i32 %4, 10, !dbg !53
  br i1 %cmp6, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !55
  %idxprom7 = sext i32 %5 to i64, !dbg !57
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !57
  %6 = load i32, i32* %arrayidx8, align 4, !dbg !57
  call void @printIntLine(i32 %6), !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !60
  %inc = add nsw i32 %7, 1, !dbg !60
  store i32 %inc, i32* %i, align 4, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !65

if.else9:                                         ; preds = %if.then4
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %if.end29, !dbg !68

if.else11:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i12, metadata !69, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer13, metadata !73, metadata !DIExpression()), !dbg !74
  %8 = bitcast [10 x i32]* %buffer13 to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !74
  %9 = load i32, i32* %data, align 4, !dbg !75
  %cmp14 = icmp sge i32 %9, 0, !dbg !77
  br i1 %cmp14, label %land.lhs.true, label %if.else27, !dbg !78

land.lhs.true:                                    ; preds = %if.else11
  %10 = load i32, i32* %data, align 4, !dbg !79
  %cmp15 = icmp slt i32 %10, 10, !dbg !80
  br i1 %cmp15, label %if.then16, label %if.else27, !dbg !81

if.then16:                                        ; preds = %land.lhs.true
  %11 = load i32, i32* %data, align 4, !dbg !82
  %idxprom17 = sext i32 %11 to i64, !dbg !84
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer13, i64 0, i64 %idxprom17, !dbg !84
  store i32 1, i32* %arrayidx18, align 4, !dbg !85
  store i32 0, i32* %i12, align 4, !dbg !86
  br label %for.cond19, !dbg !88

for.cond19:                                       ; preds = %for.inc24, %if.then16
  %12 = load i32, i32* %i12, align 4, !dbg !89
  %cmp20 = icmp slt i32 %12, 10, !dbg !91
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !92

for.body21:                                       ; preds = %for.cond19
  %13 = load i32, i32* %i12, align 4, !dbg !93
  %idxprom22 = sext i32 %13 to i64, !dbg !95
  %arrayidx23 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer13, i64 0, i64 %idxprom22, !dbg !95
  %14 = load i32, i32* %arrayidx23, align 4, !dbg !95
  call void @printIntLine(i32 %14), !dbg !96
  br label %for.inc24, !dbg !97

for.inc24:                                        ; preds = %for.body21
  %15 = load i32, i32* %i12, align 4, !dbg !98
  %inc25 = add nsw i32 %15, 1, !dbg !98
  store i32 %inc25, i32* %i12, align 4, !dbg !98
  br label %for.cond19, !dbg !99, !llvm.loop !100

for.end26:                                        ; preds = %for.cond19
  br label %if.end28, !dbg !102

if.else27:                                        ; preds = %land.lhs.true, %if.else11
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %for.end26
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.end10
  ret void, !dbg !105
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fscanf_12_good() #0 !dbg !106 {
entry:
  call void @goodB2G(), !dbg !107
  call void @goodG2B(), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !110 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !116, metadata !DIExpression()), !dbg !117
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call i64 @time(i64* null) #5, !dbg !120
  %conv = trunc i64 %call to i32, !dbg !121
  call void @srand(i32 %conv) #5, !dbg !122
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !123
  call void @CWE124_Buffer_Underwrite__CWE839_fscanf_12_good(), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !126
  call void @CWE124_Buffer_Underwrite__CWE839_fscanf_12_bad(), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !128
  ret i32 0, !dbg !129
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !130 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i14 = alloca i32, align 4
  %buffer15 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 -1, i32* %data, align 4, !dbg !133
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !134
  %tobool = icmp ne i32 %call, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !137
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !139
  br label %if.end, !dbg !140

if.else:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !141
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !143
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call3 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !144
  %tobool4 = icmp ne i32 %call3, 0, !dbg !144
  br i1 %tobool4, label %if.then5, label %if.else13, !dbg !146

if.then5:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !151, metadata !DIExpression()), !dbg !152
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !152
  %3 = load i32, i32* %data, align 4, !dbg !153
  %cmp = icmp sge i32 %3, 0, !dbg !155
  br i1 %cmp, label %land.lhs.true, label %if.else11, !dbg !156

land.lhs.true:                                    ; preds = %if.then5
  %4 = load i32, i32* %data, align 4, !dbg !157
  %cmp6 = icmp slt i32 %4, 10, !dbg !158
  br i1 %cmp6, label %if.then7, label %if.else11, !dbg !159

if.then7:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !160
  %idxprom = sext i32 %5 to i64, !dbg !162
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !162
  store i32 1, i32* %arrayidx, align 4, !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.then7
  %6 = load i32, i32* %i, align 4, !dbg !167
  %cmp8 = icmp slt i32 %6, 10, !dbg !169
  br i1 %cmp8, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !171
  %idxprom9 = sext i32 %7 to i64, !dbg !173
  %arrayidx10 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom9, !dbg !173
  %8 = load i32, i32* %arrayidx10, align 4, !dbg !173
  call void @printIntLine(i32 %8), !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !176
  %inc = add nsw i32 %9, 1, !dbg !176
  store i32 %inc, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  br label %if.end12, !dbg !180

if.else11:                                        ; preds = %land.lhs.true, %if.then5
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !181
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %for.end
  br label %if.end32, !dbg !183

if.else13:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i14, metadata !184, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer15, metadata !188, metadata !DIExpression()), !dbg !189
  %10 = bitcast [10 x i32]* %buffer15 to i8*, !dbg !189
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !189
  %11 = load i32, i32* %data, align 4, !dbg !190
  %cmp16 = icmp sge i32 %11, 0, !dbg !192
  br i1 %cmp16, label %land.lhs.true17, label %if.else30, !dbg !193

land.lhs.true17:                                  ; preds = %if.else13
  %12 = load i32, i32* %data, align 4, !dbg !194
  %cmp18 = icmp slt i32 %12, 10, !dbg !195
  br i1 %cmp18, label %if.then19, label %if.else30, !dbg !196

if.then19:                                        ; preds = %land.lhs.true17
  %13 = load i32, i32* %data, align 4, !dbg !197
  %idxprom20 = sext i32 %13 to i64, !dbg !199
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer15, i64 0, i64 %idxprom20, !dbg !199
  store i32 1, i32* %arrayidx21, align 4, !dbg !200
  store i32 0, i32* %i14, align 4, !dbg !201
  br label %for.cond22, !dbg !203

for.cond22:                                       ; preds = %for.inc27, %if.then19
  %14 = load i32, i32* %i14, align 4, !dbg !204
  %cmp23 = icmp slt i32 %14, 10, !dbg !206
  br i1 %cmp23, label %for.body24, label %for.end29, !dbg !207

for.body24:                                       ; preds = %for.cond22
  %15 = load i32, i32* %i14, align 4, !dbg !208
  %idxprom25 = sext i32 %15 to i64, !dbg !210
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer15, i64 0, i64 %idxprom25, !dbg !210
  %16 = load i32, i32* %arrayidx26, align 4, !dbg !210
  call void @printIntLine(i32 %16), !dbg !211
  br label %for.inc27, !dbg !212

for.inc27:                                        ; preds = %for.body24
  %17 = load i32, i32* %i14, align 4, !dbg !213
  %inc28 = add nsw i32 %17, 1, !dbg !213
  store i32 %inc28, i32* %i14, align 4, !dbg !213
  br label %for.cond22, !dbg !214, !llvm.loop !215

for.end29:                                        ; preds = %for.cond22
  br label %if.end31, !dbg !217

if.else30:                                        ; preds = %land.lhs.true17, %if.else13
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !218
  br label %if.end31

if.end31:                                         ; preds = %if.else30, %for.end29
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end12
  ret void, !dbg !220
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !221 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i11 = alloca i32, align 4
  %buffer12 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !222, metadata !DIExpression()), !dbg !223
  store i32 -1, i32* %data, align 4, !dbg !224
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !225
  %tobool = icmp ne i32 %call, 0, !dbg !225
  br i1 %tobool, label %if.then, label %if.else, !dbg !227

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !228
  br label %if.end, !dbg !230

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !231
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !233
  %tobool2 = icmp ne i32 %call1, 0, !dbg !233
  br i1 %tobool2, label %if.then3, label %if.else10, !dbg !235

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !236, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !240, metadata !DIExpression()), !dbg !241
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !241
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !241
  %1 = load i32, i32* %data, align 4, !dbg !242
  %cmp = icmp slt i32 %1, 10, !dbg !244
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !245

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !246
  %idxprom = sext i32 %2 to i64, !dbg !248
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !248
  store i32 1, i32* %arrayidx, align 4, !dbg !249
  store i32 0, i32* %i, align 4, !dbg !250
  br label %for.cond, !dbg !252

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !253
  %cmp5 = icmp slt i32 %3, 10, !dbg !255
  br i1 %cmp5, label %for.body, label %for.end, !dbg !256

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !257
  %idxprom6 = sext i32 %4 to i64, !dbg !259
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !259
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !259
  call void @printIntLine(i32 %5), !dbg !260
  br label %for.inc, !dbg !261

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !262
  %inc = add nsw i32 %6, 1, !dbg !262
  store i32 %inc, i32* %i, align 4, !dbg !262
  br label %for.cond, !dbg !263, !llvm.loop !264

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !266

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !267
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end27, !dbg !269

if.else10:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !270, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer12, metadata !274, metadata !DIExpression()), !dbg !275
  %7 = bitcast [10 x i32]* %buffer12 to i8*, !dbg !275
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !275
  %8 = load i32, i32* %data, align 4, !dbg !276
  %cmp13 = icmp slt i32 %8, 10, !dbg !278
  br i1 %cmp13, label %if.then14, label %if.else25, !dbg !279

if.then14:                                        ; preds = %if.else10
  %9 = load i32, i32* %data, align 4, !dbg !280
  %idxprom15 = sext i32 %9 to i64, !dbg !282
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom15, !dbg !282
  store i32 1, i32* %arrayidx16, align 4, !dbg !283
  store i32 0, i32* %i11, align 4, !dbg !284
  br label %for.cond17, !dbg !286

for.cond17:                                       ; preds = %for.inc22, %if.then14
  %10 = load i32, i32* %i11, align 4, !dbg !287
  %cmp18 = icmp slt i32 %10, 10, !dbg !289
  br i1 %cmp18, label %for.body19, label %for.end24, !dbg !290

for.body19:                                       ; preds = %for.cond17
  %11 = load i32, i32* %i11, align 4, !dbg !291
  %idxprom20 = sext i32 %11 to i64, !dbg !293
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom20, !dbg !293
  %12 = load i32, i32* %arrayidx21, align 4, !dbg !293
  call void @printIntLine(i32 %12), !dbg !294
  br label %for.inc22, !dbg !295

for.inc22:                                        ; preds = %for.body19
  %13 = load i32, i32* %i11, align 4, !dbg !296
  %inc23 = add nsw i32 %13, 1, !dbg !296
  store i32 %inc23, i32* %i11, align 4, !dbg !296
  br label %for.cond17, !dbg !297, !llvm.loop !298

for.end24:                                        ; preds = %for.cond17
  br label %if.end26, !dbg !300

if.else25:                                        ; preds = %if.else10
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !301
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end24
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end9
  ret void, !dbg !303
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fscanf_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fscanf_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fscanf_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 8, scope: !11)
!22 = !DILocation(line: 30, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !12, line: 28, column: 5)
!24 = !DILocation(line: 30, column: 9, scope: !23)
!25 = !DILocation(line: 31, column: 5, scope: !23)
!26 = !DILocation(line: 36, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !12, line: 33, column: 5)
!28 = !DILocation(line: 38, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 8)
!30 = !DILocation(line: 38, column: 8, scope: !11)
!31 = !DILocalVariable(name: "i", scope: !32, file: !12, line: 41, type: !16)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 40, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 39, column: 5)
!34 = !DILocation(line: 41, column: 17, scope: !32)
!35 = !DILocalVariable(name: "buffer", scope: !32, file: !12, line: 42, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 10)
!39 = !DILocation(line: 42, column: 17, scope: !32)
!40 = !DILocation(line: 45, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !12, line: 45, column: 17)
!42 = !DILocation(line: 45, column: 22, scope: !41)
!43 = !DILocation(line: 45, column: 17, scope: !32)
!44 = !DILocation(line: 47, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 46, column: 13)
!46 = !DILocation(line: 47, column: 17, scope: !45)
!47 = !DILocation(line: 47, column: 30, scope: !45)
!48 = !DILocation(line: 49, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 49, column: 17)
!50 = !DILocation(line: 49, column: 21, scope: !49)
!51 = !DILocation(line: 49, column: 28, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 49, column: 17)
!53 = !DILocation(line: 49, column: 30, scope: !52)
!54 = !DILocation(line: 49, column: 17, scope: !49)
!55 = !DILocation(line: 51, column: 41, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 50, column: 17)
!57 = !DILocation(line: 51, column: 34, scope: !56)
!58 = !DILocation(line: 51, column: 21, scope: !56)
!59 = !DILocation(line: 52, column: 17, scope: !56)
!60 = !DILocation(line: 49, column: 37, scope: !52)
!61 = !DILocation(line: 49, column: 17, scope: !52)
!62 = distinct !{!62, !54, !63, !64}
!63 = !DILocation(line: 52, column: 17, scope: !49)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 53, column: 13, scope: !45)
!66 = !DILocation(line: 56, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !41, file: !12, line: 55, column: 13)
!68 = !DILocation(line: 59, column: 5, scope: !33)
!69 = !DILocalVariable(name: "i", scope: !70, file: !12, line: 63, type: !16)
!70 = distinct !DILexicalBlock(scope: !71, file: !12, line: 62, column: 9)
!71 = distinct !DILexicalBlock(scope: !29, file: !12, line: 61, column: 5)
!72 = !DILocation(line: 63, column: 17, scope: !70)
!73 = !DILocalVariable(name: "buffer", scope: !70, file: !12, line: 64, type: !36)
!74 = !DILocation(line: 64, column: 17, scope: !70)
!75 = !DILocation(line: 66, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !70, file: !12, line: 66, column: 17)
!77 = !DILocation(line: 66, column: 22, scope: !76)
!78 = !DILocation(line: 66, column: 27, scope: !76)
!79 = !DILocation(line: 66, column: 30, scope: !76)
!80 = !DILocation(line: 66, column: 35, scope: !76)
!81 = !DILocation(line: 66, column: 17, scope: !70)
!82 = !DILocation(line: 68, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !76, file: !12, line: 67, column: 13)
!84 = !DILocation(line: 68, column: 17, scope: !83)
!85 = !DILocation(line: 68, column: 30, scope: !83)
!86 = !DILocation(line: 70, column: 23, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 70, column: 17)
!88 = !DILocation(line: 70, column: 21, scope: !87)
!89 = !DILocation(line: 70, column: 28, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 70, column: 17)
!91 = !DILocation(line: 70, column: 30, scope: !90)
!92 = !DILocation(line: 70, column: 17, scope: !87)
!93 = !DILocation(line: 72, column: 41, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !12, line: 71, column: 17)
!95 = !DILocation(line: 72, column: 34, scope: !94)
!96 = !DILocation(line: 72, column: 21, scope: !94)
!97 = !DILocation(line: 73, column: 17, scope: !94)
!98 = !DILocation(line: 70, column: 37, scope: !90)
!99 = !DILocation(line: 70, column: 17, scope: !90)
!100 = distinct !{!100, !92, !101, !64}
!101 = !DILocation(line: 73, column: 17, scope: !87)
!102 = !DILocation(line: 74, column: 13, scope: !83)
!103 = !DILocation(line: 77, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !76, file: !12, line: 76, column: 13)
!105 = !DILocation(line: 81, column: 1, scope: !11)
!106 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fscanf_12_good", scope: !12, file: !12, line: 215, type: !13, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocation(line: 217, column: 5, scope: !106)
!108 = !DILocation(line: 218, column: 5, scope: !106)
!109 = !DILocation(line: 219, column: 1, scope: !106)
!110 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 230, type: !111, scopeLine: 231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DISubroutineType(types: !112)
!112 = !{!16, !16, !113}
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!116 = !DILocalVariable(name: "argc", arg: 1, scope: !110, file: !12, line: 230, type: !16)
!117 = !DILocation(line: 230, column: 14, scope: !110)
!118 = !DILocalVariable(name: "argv", arg: 2, scope: !110, file: !12, line: 230, type: !113)
!119 = !DILocation(line: 230, column: 27, scope: !110)
!120 = !DILocation(line: 233, column: 22, scope: !110)
!121 = !DILocation(line: 233, column: 12, scope: !110)
!122 = !DILocation(line: 233, column: 5, scope: !110)
!123 = !DILocation(line: 235, column: 5, scope: !110)
!124 = !DILocation(line: 236, column: 5, scope: !110)
!125 = !DILocation(line: 237, column: 5, scope: !110)
!126 = !DILocation(line: 240, column: 5, scope: !110)
!127 = !DILocation(line: 241, column: 5, scope: !110)
!128 = !DILocation(line: 242, column: 5, scope: !110)
!129 = !DILocation(line: 244, column: 5, scope: !110)
!130 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "data", scope: !130, file: !12, line: 92, type: !16)
!132 = !DILocation(line: 92, column: 9, scope: !130)
!133 = !DILocation(line: 94, column: 10, scope: !130)
!134 = !DILocation(line: 95, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !12, line: 95, column: 8)
!136 = !DILocation(line: 95, column: 8, scope: !130)
!137 = !DILocation(line: 98, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 96, column: 5)
!139 = !DILocation(line: 98, column: 9, scope: !138)
!140 = !DILocation(line: 99, column: 5, scope: !138)
!141 = !DILocation(line: 103, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !12, line: 101, column: 5)
!143 = !DILocation(line: 103, column: 9, scope: !142)
!144 = !DILocation(line: 105, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !130, file: !12, line: 105, column: 8)
!146 = !DILocation(line: 105, column: 8, scope: !130)
!147 = !DILocalVariable(name: "i", scope: !148, file: !12, line: 108, type: !16)
!148 = distinct !DILexicalBlock(scope: !149, file: !12, line: 107, column: 9)
!149 = distinct !DILexicalBlock(scope: !145, file: !12, line: 106, column: 5)
!150 = !DILocation(line: 108, column: 17, scope: !148)
!151 = !DILocalVariable(name: "buffer", scope: !148, file: !12, line: 109, type: !36)
!152 = !DILocation(line: 109, column: 17, scope: !148)
!153 = !DILocation(line: 111, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !148, file: !12, line: 111, column: 17)
!155 = !DILocation(line: 111, column: 22, scope: !154)
!156 = !DILocation(line: 111, column: 27, scope: !154)
!157 = !DILocation(line: 111, column: 30, scope: !154)
!158 = !DILocation(line: 111, column: 35, scope: !154)
!159 = !DILocation(line: 111, column: 17, scope: !148)
!160 = !DILocation(line: 113, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !12, line: 112, column: 13)
!162 = !DILocation(line: 113, column: 17, scope: !161)
!163 = !DILocation(line: 113, column: 30, scope: !161)
!164 = !DILocation(line: 115, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 115, column: 17)
!166 = !DILocation(line: 115, column: 21, scope: !165)
!167 = !DILocation(line: 115, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 115, column: 17)
!169 = !DILocation(line: 115, column: 30, scope: !168)
!170 = !DILocation(line: 115, column: 17, scope: !165)
!171 = !DILocation(line: 117, column: 41, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !12, line: 116, column: 17)
!173 = !DILocation(line: 117, column: 34, scope: !172)
!174 = !DILocation(line: 117, column: 21, scope: !172)
!175 = !DILocation(line: 118, column: 17, scope: !172)
!176 = !DILocation(line: 115, column: 37, scope: !168)
!177 = !DILocation(line: 115, column: 17, scope: !168)
!178 = distinct !{!178, !170, !179, !64}
!179 = !DILocation(line: 118, column: 17, scope: !165)
!180 = !DILocation(line: 119, column: 13, scope: !161)
!181 = !DILocation(line: 122, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !154, file: !12, line: 121, column: 13)
!183 = !DILocation(line: 125, column: 5, scope: !149)
!184 = !DILocalVariable(name: "i", scope: !185, file: !12, line: 129, type: !16)
!185 = distinct !DILexicalBlock(scope: !186, file: !12, line: 128, column: 9)
!186 = distinct !DILexicalBlock(scope: !145, file: !12, line: 127, column: 5)
!187 = !DILocation(line: 129, column: 17, scope: !185)
!188 = !DILocalVariable(name: "buffer", scope: !185, file: !12, line: 130, type: !36)
!189 = !DILocation(line: 130, column: 17, scope: !185)
!190 = !DILocation(line: 132, column: 17, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !12, line: 132, column: 17)
!192 = !DILocation(line: 132, column: 22, scope: !191)
!193 = !DILocation(line: 132, column: 27, scope: !191)
!194 = !DILocation(line: 132, column: 30, scope: !191)
!195 = !DILocation(line: 132, column: 35, scope: !191)
!196 = !DILocation(line: 132, column: 17, scope: !185)
!197 = !DILocation(line: 134, column: 24, scope: !198)
!198 = distinct !DILexicalBlock(scope: !191, file: !12, line: 133, column: 13)
!199 = !DILocation(line: 134, column: 17, scope: !198)
!200 = !DILocation(line: 134, column: 30, scope: !198)
!201 = !DILocation(line: 136, column: 23, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !12, line: 136, column: 17)
!203 = !DILocation(line: 136, column: 21, scope: !202)
!204 = !DILocation(line: 136, column: 28, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !12, line: 136, column: 17)
!206 = !DILocation(line: 136, column: 30, scope: !205)
!207 = !DILocation(line: 136, column: 17, scope: !202)
!208 = !DILocation(line: 138, column: 41, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !12, line: 137, column: 17)
!210 = !DILocation(line: 138, column: 34, scope: !209)
!211 = !DILocation(line: 138, column: 21, scope: !209)
!212 = !DILocation(line: 139, column: 17, scope: !209)
!213 = !DILocation(line: 136, column: 37, scope: !205)
!214 = !DILocation(line: 136, column: 17, scope: !205)
!215 = distinct !{!215, !207, !216, !64}
!216 = !DILocation(line: 139, column: 17, scope: !202)
!217 = !DILocation(line: 140, column: 13, scope: !198)
!218 = !DILocation(line: 143, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !191, file: !12, line: 142, column: 13)
!220 = !DILocation(line: 147, column: 1, scope: !130)
!221 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 152, type: !13, scopeLine: 153, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!222 = !DILocalVariable(name: "data", scope: !221, file: !12, line: 154, type: !16)
!223 = !DILocation(line: 154, column: 9, scope: !221)
!224 = !DILocation(line: 156, column: 10, scope: !221)
!225 = !DILocation(line: 157, column: 8, scope: !226)
!226 = distinct !DILexicalBlock(scope: !221, file: !12, line: 157, column: 8)
!227 = !DILocation(line: 157, column: 8, scope: !221)
!228 = !DILocation(line: 161, column: 14, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !12, line: 158, column: 5)
!230 = !DILocation(line: 162, column: 5, scope: !229)
!231 = !DILocation(line: 167, column: 14, scope: !232)
!232 = distinct !DILexicalBlock(scope: !226, file: !12, line: 164, column: 5)
!233 = !DILocation(line: 169, column: 8, scope: !234)
!234 = distinct !DILexicalBlock(scope: !221, file: !12, line: 169, column: 8)
!235 = !DILocation(line: 169, column: 8, scope: !221)
!236 = !DILocalVariable(name: "i", scope: !237, file: !12, line: 172, type: !16)
!237 = distinct !DILexicalBlock(scope: !238, file: !12, line: 171, column: 9)
!238 = distinct !DILexicalBlock(scope: !234, file: !12, line: 170, column: 5)
!239 = !DILocation(line: 172, column: 17, scope: !237)
!240 = !DILocalVariable(name: "buffer", scope: !237, file: !12, line: 173, type: !36)
!241 = !DILocation(line: 173, column: 17, scope: !237)
!242 = !DILocation(line: 176, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !237, file: !12, line: 176, column: 17)
!244 = !DILocation(line: 176, column: 22, scope: !243)
!245 = !DILocation(line: 176, column: 17, scope: !237)
!246 = !DILocation(line: 178, column: 24, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !12, line: 177, column: 13)
!248 = !DILocation(line: 178, column: 17, scope: !247)
!249 = !DILocation(line: 178, column: 30, scope: !247)
!250 = !DILocation(line: 180, column: 23, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !12, line: 180, column: 17)
!252 = !DILocation(line: 180, column: 21, scope: !251)
!253 = !DILocation(line: 180, column: 28, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !12, line: 180, column: 17)
!255 = !DILocation(line: 180, column: 30, scope: !254)
!256 = !DILocation(line: 180, column: 17, scope: !251)
!257 = !DILocation(line: 182, column: 41, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !12, line: 181, column: 17)
!259 = !DILocation(line: 182, column: 34, scope: !258)
!260 = !DILocation(line: 182, column: 21, scope: !258)
!261 = !DILocation(line: 183, column: 17, scope: !258)
!262 = !DILocation(line: 180, column: 37, scope: !254)
!263 = !DILocation(line: 180, column: 17, scope: !254)
!264 = distinct !{!264, !256, !265, !64}
!265 = !DILocation(line: 183, column: 17, scope: !251)
!266 = !DILocation(line: 184, column: 13, scope: !247)
!267 = !DILocation(line: 187, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !243, file: !12, line: 186, column: 13)
!269 = !DILocation(line: 190, column: 5, scope: !238)
!270 = !DILocalVariable(name: "i", scope: !271, file: !12, line: 194, type: !16)
!271 = distinct !DILexicalBlock(scope: !272, file: !12, line: 193, column: 9)
!272 = distinct !DILexicalBlock(scope: !234, file: !12, line: 192, column: 5)
!273 = !DILocation(line: 194, column: 17, scope: !271)
!274 = !DILocalVariable(name: "buffer", scope: !271, file: !12, line: 195, type: !36)
!275 = !DILocation(line: 195, column: 17, scope: !271)
!276 = !DILocation(line: 198, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !271, file: !12, line: 198, column: 17)
!278 = !DILocation(line: 198, column: 22, scope: !277)
!279 = !DILocation(line: 198, column: 17, scope: !271)
!280 = !DILocation(line: 200, column: 24, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !12, line: 199, column: 13)
!282 = !DILocation(line: 200, column: 17, scope: !281)
!283 = !DILocation(line: 200, column: 30, scope: !281)
!284 = !DILocation(line: 202, column: 23, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !12, line: 202, column: 17)
!286 = !DILocation(line: 202, column: 21, scope: !285)
!287 = !DILocation(line: 202, column: 28, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !12, line: 202, column: 17)
!289 = !DILocation(line: 202, column: 30, scope: !288)
!290 = !DILocation(line: 202, column: 17, scope: !285)
!291 = !DILocation(line: 204, column: 41, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !12, line: 203, column: 17)
!293 = !DILocation(line: 204, column: 34, scope: !292)
!294 = !DILocation(line: 204, column: 21, scope: !292)
!295 = !DILocation(line: 205, column: 17, scope: !292)
!296 = !DILocation(line: 202, column: 37, scope: !288)
!297 = !DILocation(line: 202, column: 17, scope: !288)
!298 = distinct !{!298, !290, !299, !64}
!299 = !DILocation(line: 205, column: 17, scope: !285)
!300 = !DILocation(line: 206, column: 13, scope: !281)
!301 = !DILocation(line: 209, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !277, file: !12, line: 208, column: 13)
!303 = !DILocation(line: 213, column: 1, scope: !221)
