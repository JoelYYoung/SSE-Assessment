; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !20, metadata !DIExpression()), !dbg !28
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !28
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !29
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !31
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !32
  %cmp = icmp ne i8* %call, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !37
  store i32 %call2, i32* %data, align 4, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !47, metadata !DIExpression()), !dbg !51
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !51
  %3 = load i32, i32* %data, align 4, !dbg !52
  %cmp3 = icmp sge i32 %3, 0, !dbg !54
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !55

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !56
  %idxprom = sext i32 %4 to i64, !dbg !58
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !58
  store i32 1, i32* %arrayidx, align 4, !dbg !59
  store i32 0, i32* %i, align 4, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !63
  %cmp5 = icmp slt i32 %5, 10, !dbg !65
  br i1 %cmp5, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !67
  %idxprom6 = sext i32 %6 to i64, !dbg !69
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !69
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !69
  call void @printIntLine(i32 %7), !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !72
  %inc = add nsw i32 %8, 1, !dbg !72
  store i32 %inc, i32* %i, align 4, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !77

if.else8:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  ret void, !dbg !80
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02_good() #0 !dbg !81 {
entry:
  call void @goodB2G1(), !dbg !82
  call void @goodB2G2(), !dbg !83
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %data, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !110, metadata !DIExpression()), !dbg !114
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !114
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !115
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !117
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !118
  %cmp = icmp ne i8* %call, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !121
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !123
  store i32 %call2, i32* %data, align 4, !dbg !124
  br label %if.end, !dbg !125

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !128, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !133, metadata !DIExpression()), !dbg !134
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !134
  %3 = load i32, i32* %data, align 4, !dbg !135
  %cmp3 = icmp sge i32 %3, 0, !dbg !137
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !138

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !139
  %cmp4 = icmp slt i32 %4, 10, !dbg !140
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !141

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !142
  %idxprom = sext i32 %5 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  store i32 1, i32* %arrayidx, align 4, !dbg !145
  store i32 0, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !149
  %cmp6 = icmp slt i32 %6, 10, !dbg !151
  br i1 %cmp6, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !153
  %idxprom7 = sext i32 %7 to i64, !dbg !155
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !155
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !155
  call void @printIntLine(i32 %8), !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !158
  %inc = add nsw i32 %9, 1, !dbg !158
  store i32 %inc, i32* %i, align 4, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !162

if.else9:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !163
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !166 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !167, metadata !DIExpression()), !dbg !168
  store i32 -1, i32* %data, align 4, !dbg !169
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !170, metadata !DIExpression()), !dbg !174
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !174
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !175
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !177
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !178
  %cmp = icmp ne i8* %call, null, !dbg !179
  br i1 %cmp, label %if.then, label %if.else, !dbg !180

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !181
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !183
  store i32 %call2, i32* %data, align 4, !dbg !184
  br label %if.end, !dbg !185

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !186
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !188, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !193, metadata !DIExpression()), !dbg !194
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !194
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !194
  %3 = load i32, i32* %data, align 4, !dbg !195
  %cmp3 = icmp sge i32 %3, 0, !dbg !197
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !198

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !199
  %cmp4 = icmp slt i32 %4, 10, !dbg !200
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !201

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !202
  %idxprom = sext i32 %5 to i64, !dbg !204
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !204
  store i32 1, i32* %arrayidx, align 4, !dbg !205
  store i32 0, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !208

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !209
  %cmp6 = icmp slt i32 %6, 10, !dbg !211
  br i1 %cmp6, label %for.body, label %for.end, !dbg !212

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !213
  %idxprom7 = sext i32 %7 to i64, !dbg !215
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !215
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !215
  call void @printIntLine(i32 %8), !dbg !216
  br label %for.inc, !dbg !217

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !218
  %inc = add nsw i32 %9, 1, !dbg !218
  store i32 %inc, i32* %i, align 4, !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !222

if.else9:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !223
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !225
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !226 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !227, metadata !DIExpression()), !dbg !228
  store i32 -1, i32* %data, align 4, !dbg !229
  store i32 7, i32* %data, align 4, !dbg !230
  call void @llvm.dbg.declare(metadata i32* %i, metadata !233, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !238, metadata !DIExpression()), !dbg !239
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !239
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !239
  %1 = load i32, i32* %data, align 4, !dbg !240
  %cmp = icmp sge i32 %1, 0, !dbg !242
  br i1 %cmp, label %if.then, label %if.else, !dbg !243

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !244
  %idxprom = sext i32 %2 to i64, !dbg !246
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !246
  store i32 1, i32* %arrayidx, align 4, !dbg !247
  store i32 0, i32* %i, align 4, !dbg !248
  br label %for.cond, !dbg !250

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !251
  %cmp1 = icmp slt i32 %3, 10, !dbg !253
  br i1 %cmp1, label %for.body, label %for.end, !dbg !254

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !255
  %idxprom2 = sext i32 %4 to i64, !dbg !257
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !257
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !257
  call void @printIntLine(i32 %5), !dbg !258
  br label %for.inc, !dbg !259

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !260
  %inc = add nsw i32 %6, 1, !dbg !260
  store i32 %inc, i32* %i, align 4, !dbg !260
  br label %for.cond, !dbg !261, !llvm.loop !262

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !264

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !265
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !267
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !268 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !269, metadata !DIExpression()), !dbg !270
  store i32 -1, i32* %data, align 4, !dbg !271
  store i32 7, i32* %data, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata i32* %i, metadata !275, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !280, metadata !DIExpression()), !dbg !281
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !281
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !281
  %1 = load i32, i32* %data, align 4, !dbg !282
  %cmp = icmp sge i32 %1, 0, !dbg !284
  br i1 %cmp, label %if.then, label %if.else, !dbg !285

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !286
  %idxprom = sext i32 %2 to i64, !dbg !288
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !288
  store i32 1, i32* %arrayidx, align 4, !dbg !289
  store i32 0, i32* %i, align 4, !dbg !290
  br label %for.cond, !dbg !292

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !293
  %cmp1 = icmp slt i32 %3, 10, !dbg !295
  br i1 %cmp1, label %for.body, label %for.end, !dbg !296

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !297
  %idxprom2 = sext i32 %4 to i64, !dbg !299
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !299
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !299
  call void @printIntLine(i32 %5), !dbg !300
  br label %for.inc, !dbg !301

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !302
  %inc = add nsw i32 %6, 1, !dbg !302
  store i32 %inc, i32* %i, align 4, !dbg !302
  br label %for.cond, !dbg !303, !llvm.loop !304

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !306

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !307
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !309
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02.c", directory: "/root/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 32, type: !24)
!21 = distinct !DILexicalBlock(scope: !22, file: !13, line: 31, column: 9)
!22 = distinct !DILexicalBlock(scope: !23, file: !13, line: 30, column: 5)
!23 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 112, elements: !26)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !{!27}
!27 = !DISubrange(count: 14)
!28 = !DILocation(line: 32, column: 18, scope: !21)
!29 = !DILocation(line: 34, column: 23, scope: !30)
!30 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 17)
!31 = !DILocation(line: 34, column: 53, scope: !30)
!32 = !DILocation(line: 34, column: 17, scope: !30)
!33 = !DILocation(line: 34, column: 60, scope: !30)
!34 = !DILocation(line: 34, column: 17, scope: !21)
!35 = !DILocation(line: 37, column: 29, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !13, line: 35, column: 13)
!37 = !DILocation(line: 37, column: 24, scope: !36)
!38 = !DILocation(line: 37, column: 22, scope: !36)
!39 = !DILocation(line: 38, column: 13, scope: !36)
!40 = !DILocation(line: 41, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !30, file: !13, line: 40, column: 13)
!42 = !DILocalVariable(name: "i", scope: !43, file: !13, line: 48, type: !17)
!43 = distinct !DILexicalBlock(scope: !44, file: !13, line: 47, column: 9)
!44 = distinct !DILexicalBlock(scope: !45, file: !13, line: 46, column: 5)
!45 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!46 = !DILocation(line: 48, column: 17, scope: !43)
!47 = !DILocalVariable(name: "buffer", scope: !43, file: !13, line: 49, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 10)
!51 = !DILocation(line: 49, column: 17, scope: !43)
!52 = !DILocation(line: 52, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !43, file: !13, line: 52, column: 17)
!54 = !DILocation(line: 52, column: 22, scope: !53)
!55 = !DILocation(line: 52, column: 17, scope: !43)
!56 = !DILocation(line: 54, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !13, line: 53, column: 13)
!58 = !DILocation(line: 54, column: 17, scope: !57)
!59 = !DILocation(line: 54, column: 30, scope: !57)
!60 = !DILocation(line: 56, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !13, line: 56, column: 17)
!62 = !DILocation(line: 56, column: 21, scope: !61)
!63 = !DILocation(line: 56, column: 28, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !13, line: 56, column: 17)
!65 = !DILocation(line: 56, column: 30, scope: !64)
!66 = !DILocation(line: 56, column: 17, scope: !61)
!67 = !DILocation(line: 58, column: 41, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !13, line: 57, column: 17)
!69 = !DILocation(line: 58, column: 34, scope: !68)
!70 = !DILocation(line: 58, column: 21, scope: !68)
!71 = !DILocation(line: 59, column: 17, scope: !68)
!72 = !DILocation(line: 56, column: 37, scope: !64)
!73 = !DILocation(line: 56, column: 17, scope: !64)
!74 = distinct !{!74, !66, !75, !76}
!75 = !DILocation(line: 59, column: 17, scope: !61)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 60, column: 13, scope: !57)
!78 = !DILocation(line: 63, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !53, file: !13, line: 62, column: 13)
!80 = !DILocation(line: 67, column: 1, scope: !12)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_02_good", scope: !13, file: !13, line: 245, type: !14, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 247, column: 5, scope: !81)
!83 = !DILocation(line: 248, column: 5, scope: !81)
!84 = !DILocation(line: 249, column: 5, scope: !81)
!85 = !DILocation(line: 250, column: 5, scope: !81)
!86 = !DILocation(line: 251, column: 1, scope: !81)
!87 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 262, type: !88, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!17, !17, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !13, line: 262, type: !17)
!93 = !DILocation(line: 262, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !13, line: 262, type: !90)
!95 = !DILocation(line: 262, column: 27, scope: !87)
!96 = !DILocation(line: 265, column: 22, scope: !87)
!97 = !DILocation(line: 265, column: 12, scope: !87)
!98 = !DILocation(line: 265, column: 5, scope: !87)
!99 = !DILocation(line: 267, column: 5, scope: !87)
!100 = !DILocation(line: 268, column: 5, scope: !87)
!101 = !DILocation(line: 269, column: 5, scope: !87)
!102 = !DILocation(line: 272, column: 5, scope: !87)
!103 = !DILocation(line: 273, column: 5, scope: !87)
!104 = !DILocation(line: 274, column: 5, scope: !87)
!105 = !DILocation(line: 276, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 74, type: !14, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !13, line: 76, type: !17)
!108 = !DILocation(line: 76, column: 9, scope: !106)
!109 = !DILocation(line: 78, column: 10, scope: !106)
!110 = !DILocalVariable(name: "inputBuffer", scope: !111, file: !13, line: 82, type: !24)
!111 = distinct !DILexicalBlock(scope: !112, file: !13, line: 81, column: 9)
!112 = distinct !DILexicalBlock(scope: !113, file: !13, line: 80, column: 5)
!113 = distinct !DILexicalBlock(scope: !106, file: !13, line: 79, column: 8)
!114 = !DILocation(line: 82, column: 18, scope: !111)
!115 = !DILocation(line: 84, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !13, line: 84, column: 17)
!117 = !DILocation(line: 84, column: 53, scope: !116)
!118 = !DILocation(line: 84, column: 17, scope: !116)
!119 = !DILocation(line: 84, column: 60, scope: !116)
!120 = !DILocation(line: 84, column: 17, scope: !111)
!121 = !DILocation(line: 87, column: 29, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !13, line: 85, column: 13)
!123 = !DILocation(line: 87, column: 24, scope: !122)
!124 = !DILocation(line: 87, column: 22, scope: !122)
!125 = !DILocation(line: 88, column: 13, scope: !122)
!126 = !DILocation(line: 91, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !116, file: !13, line: 90, column: 13)
!128 = !DILocalVariable(name: "i", scope: !129, file: !13, line: 103, type: !17)
!129 = distinct !DILexicalBlock(scope: !130, file: !13, line: 102, column: 9)
!130 = distinct !DILexicalBlock(scope: !131, file: !13, line: 101, column: 5)
!131 = distinct !DILexicalBlock(scope: !106, file: !13, line: 95, column: 8)
!132 = !DILocation(line: 103, column: 17, scope: !129)
!133 = !DILocalVariable(name: "buffer", scope: !129, file: !13, line: 104, type: !48)
!134 = !DILocation(line: 104, column: 17, scope: !129)
!135 = !DILocation(line: 106, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !129, file: !13, line: 106, column: 17)
!137 = !DILocation(line: 106, column: 22, scope: !136)
!138 = !DILocation(line: 106, column: 27, scope: !136)
!139 = !DILocation(line: 106, column: 30, scope: !136)
!140 = !DILocation(line: 106, column: 35, scope: !136)
!141 = !DILocation(line: 106, column: 17, scope: !129)
!142 = !DILocation(line: 108, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !13, line: 107, column: 13)
!144 = !DILocation(line: 108, column: 17, scope: !143)
!145 = !DILocation(line: 108, column: 30, scope: !143)
!146 = !DILocation(line: 110, column: 23, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !13, line: 110, column: 17)
!148 = !DILocation(line: 110, column: 21, scope: !147)
!149 = !DILocation(line: 110, column: 28, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !13, line: 110, column: 17)
!151 = !DILocation(line: 110, column: 30, scope: !150)
!152 = !DILocation(line: 110, column: 17, scope: !147)
!153 = !DILocation(line: 112, column: 41, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !13, line: 111, column: 17)
!155 = !DILocation(line: 112, column: 34, scope: !154)
!156 = !DILocation(line: 112, column: 21, scope: !154)
!157 = !DILocation(line: 113, column: 17, scope: !154)
!158 = !DILocation(line: 110, column: 37, scope: !150)
!159 = !DILocation(line: 110, column: 17, scope: !150)
!160 = distinct !{!160, !152, !161, !76}
!161 = !DILocation(line: 113, column: 17, scope: !147)
!162 = !DILocation(line: 114, column: 13, scope: !143)
!163 = !DILocation(line: 117, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !136, file: !13, line: 116, column: 13)
!165 = !DILocation(line: 121, column: 1, scope: !106)
!166 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 124, type: !14, scopeLine: 125, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!167 = !DILocalVariable(name: "data", scope: !166, file: !13, line: 126, type: !17)
!168 = !DILocation(line: 126, column: 9, scope: !166)
!169 = !DILocation(line: 128, column: 10, scope: !166)
!170 = !DILocalVariable(name: "inputBuffer", scope: !171, file: !13, line: 132, type: !24)
!171 = distinct !DILexicalBlock(scope: !172, file: !13, line: 131, column: 9)
!172 = distinct !DILexicalBlock(scope: !173, file: !13, line: 130, column: 5)
!173 = distinct !DILexicalBlock(scope: !166, file: !13, line: 129, column: 8)
!174 = !DILocation(line: 132, column: 18, scope: !171)
!175 = !DILocation(line: 134, column: 23, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !13, line: 134, column: 17)
!177 = !DILocation(line: 134, column: 53, scope: !176)
!178 = !DILocation(line: 134, column: 17, scope: !176)
!179 = !DILocation(line: 134, column: 60, scope: !176)
!180 = !DILocation(line: 134, column: 17, scope: !171)
!181 = !DILocation(line: 137, column: 29, scope: !182)
!182 = distinct !DILexicalBlock(scope: !176, file: !13, line: 135, column: 13)
!183 = !DILocation(line: 137, column: 24, scope: !182)
!184 = !DILocation(line: 137, column: 22, scope: !182)
!185 = !DILocation(line: 138, column: 13, scope: !182)
!186 = !DILocation(line: 141, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !176, file: !13, line: 140, column: 13)
!188 = !DILocalVariable(name: "i", scope: !189, file: !13, line: 148, type: !17)
!189 = distinct !DILexicalBlock(scope: !190, file: !13, line: 147, column: 9)
!190 = distinct !DILexicalBlock(scope: !191, file: !13, line: 146, column: 5)
!191 = distinct !DILexicalBlock(scope: !166, file: !13, line: 145, column: 8)
!192 = !DILocation(line: 148, column: 17, scope: !189)
!193 = !DILocalVariable(name: "buffer", scope: !189, file: !13, line: 149, type: !48)
!194 = !DILocation(line: 149, column: 17, scope: !189)
!195 = !DILocation(line: 151, column: 17, scope: !196)
!196 = distinct !DILexicalBlock(scope: !189, file: !13, line: 151, column: 17)
!197 = !DILocation(line: 151, column: 22, scope: !196)
!198 = !DILocation(line: 151, column: 27, scope: !196)
!199 = !DILocation(line: 151, column: 30, scope: !196)
!200 = !DILocation(line: 151, column: 35, scope: !196)
!201 = !DILocation(line: 151, column: 17, scope: !189)
!202 = !DILocation(line: 153, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !196, file: !13, line: 152, column: 13)
!204 = !DILocation(line: 153, column: 17, scope: !203)
!205 = !DILocation(line: 153, column: 30, scope: !203)
!206 = !DILocation(line: 155, column: 23, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !13, line: 155, column: 17)
!208 = !DILocation(line: 155, column: 21, scope: !207)
!209 = !DILocation(line: 155, column: 28, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !13, line: 155, column: 17)
!211 = !DILocation(line: 155, column: 30, scope: !210)
!212 = !DILocation(line: 155, column: 17, scope: !207)
!213 = !DILocation(line: 157, column: 41, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !13, line: 156, column: 17)
!215 = !DILocation(line: 157, column: 34, scope: !214)
!216 = !DILocation(line: 157, column: 21, scope: !214)
!217 = !DILocation(line: 158, column: 17, scope: !214)
!218 = !DILocation(line: 155, column: 37, scope: !210)
!219 = !DILocation(line: 155, column: 17, scope: !210)
!220 = distinct !{!220, !212, !221, !76}
!221 = !DILocation(line: 158, column: 17, scope: !207)
!222 = !DILocation(line: 159, column: 13, scope: !203)
!223 = !DILocation(line: 162, column: 17, scope: !224)
!224 = distinct !DILexicalBlock(scope: !196, file: !13, line: 161, column: 13)
!225 = !DILocation(line: 166, column: 1, scope: !166)
!226 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 169, type: !14, scopeLine: 170, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!227 = !DILocalVariable(name: "data", scope: !226, file: !13, line: 171, type: !17)
!228 = !DILocation(line: 171, column: 9, scope: !226)
!229 = !DILocation(line: 173, column: 10, scope: !226)
!230 = !DILocation(line: 183, column: 14, scope: !231)
!231 = distinct !DILexicalBlock(scope: !232, file: !13, line: 180, column: 5)
!232 = distinct !DILexicalBlock(scope: !226, file: !13, line: 174, column: 8)
!233 = !DILocalVariable(name: "i", scope: !234, file: !13, line: 188, type: !17)
!234 = distinct !DILexicalBlock(scope: !235, file: !13, line: 187, column: 9)
!235 = distinct !DILexicalBlock(scope: !236, file: !13, line: 186, column: 5)
!236 = distinct !DILexicalBlock(scope: !226, file: !13, line: 185, column: 8)
!237 = !DILocation(line: 188, column: 17, scope: !234)
!238 = !DILocalVariable(name: "buffer", scope: !234, file: !13, line: 189, type: !48)
!239 = !DILocation(line: 189, column: 17, scope: !234)
!240 = !DILocation(line: 192, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !234, file: !13, line: 192, column: 17)
!242 = !DILocation(line: 192, column: 22, scope: !241)
!243 = !DILocation(line: 192, column: 17, scope: !234)
!244 = !DILocation(line: 194, column: 24, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !13, line: 193, column: 13)
!246 = !DILocation(line: 194, column: 17, scope: !245)
!247 = !DILocation(line: 194, column: 30, scope: !245)
!248 = !DILocation(line: 196, column: 23, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !13, line: 196, column: 17)
!250 = !DILocation(line: 196, column: 21, scope: !249)
!251 = !DILocation(line: 196, column: 28, scope: !252)
!252 = distinct !DILexicalBlock(scope: !249, file: !13, line: 196, column: 17)
!253 = !DILocation(line: 196, column: 30, scope: !252)
!254 = !DILocation(line: 196, column: 17, scope: !249)
!255 = !DILocation(line: 198, column: 41, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !13, line: 197, column: 17)
!257 = !DILocation(line: 198, column: 34, scope: !256)
!258 = !DILocation(line: 198, column: 21, scope: !256)
!259 = !DILocation(line: 199, column: 17, scope: !256)
!260 = !DILocation(line: 196, column: 37, scope: !252)
!261 = !DILocation(line: 196, column: 17, scope: !252)
!262 = distinct !{!262, !254, !263, !76}
!263 = !DILocation(line: 199, column: 17, scope: !249)
!264 = !DILocation(line: 200, column: 13, scope: !245)
!265 = !DILocation(line: 203, column: 17, scope: !266)
!266 = distinct !DILexicalBlock(scope: !241, file: !13, line: 202, column: 13)
!267 = !DILocation(line: 207, column: 1, scope: !226)
!268 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 210, type: !14, scopeLine: 211, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!269 = !DILocalVariable(name: "data", scope: !268, file: !13, line: 212, type: !17)
!270 = !DILocation(line: 212, column: 9, scope: !268)
!271 = !DILocation(line: 214, column: 10, scope: !268)
!272 = !DILocation(line: 219, column: 14, scope: !273)
!273 = distinct !DILexicalBlock(scope: !274, file: !13, line: 216, column: 5)
!274 = distinct !DILexicalBlock(scope: !268, file: !13, line: 215, column: 8)
!275 = !DILocalVariable(name: "i", scope: !276, file: !13, line: 224, type: !17)
!276 = distinct !DILexicalBlock(scope: !277, file: !13, line: 223, column: 9)
!277 = distinct !DILexicalBlock(scope: !278, file: !13, line: 222, column: 5)
!278 = distinct !DILexicalBlock(scope: !268, file: !13, line: 221, column: 8)
!279 = !DILocation(line: 224, column: 17, scope: !276)
!280 = !DILocalVariable(name: "buffer", scope: !276, file: !13, line: 225, type: !48)
!281 = !DILocation(line: 225, column: 17, scope: !276)
!282 = !DILocation(line: 228, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !276, file: !13, line: 228, column: 17)
!284 = !DILocation(line: 228, column: 22, scope: !283)
!285 = !DILocation(line: 228, column: 17, scope: !276)
!286 = !DILocation(line: 230, column: 24, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !13, line: 229, column: 13)
!288 = !DILocation(line: 230, column: 17, scope: !287)
!289 = !DILocation(line: 230, column: 30, scope: !287)
!290 = !DILocation(line: 232, column: 23, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !13, line: 232, column: 17)
!292 = !DILocation(line: 232, column: 21, scope: !291)
!293 = !DILocation(line: 232, column: 28, scope: !294)
!294 = distinct !DILexicalBlock(scope: !291, file: !13, line: 232, column: 17)
!295 = !DILocation(line: 232, column: 30, scope: !294)
!296 = !DILocation(line: 232, column: 17, scope: !291)
!297 = !DILocation(line: 234, column: 41, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !13, line: 233, column: 17)
!299 = !DILocation(line: 234, column: 34, scope: !298)
!300 = !DILocation(line: 234, column: 21, scope: !298)
!301 = !DILocation(line: 235, column: 17, scope: !298)
!302 = !DILocation(line: 232, column: 37, scope: !294)
!303 = !DILocation(line: 232, column: 17, scope: !294)
!304 = distinct !{!304, !296, !305, !76}
!305 = !DILocation(line: 235, column: 17, scope: !291)
!306 = !DILocation(line: 236, column: 13, scope: !287)
!307 = !DILocation(line: 239, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !283, file: !13, line: 238, column: 13)
!309 = !DILocation(line: 243, column: 1, scope: !268)
