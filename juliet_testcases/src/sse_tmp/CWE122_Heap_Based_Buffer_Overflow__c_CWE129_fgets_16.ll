; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !22, metadata !DIExpression()), !dbg !29
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !30
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !32
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !33
  %cmp = icmp ne i8* %call, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %while.body
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !38
  store i32 %call2, i32* %data, align 4, !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %while.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end, !dbg !43

while.end:                                        ; preds = %if.end
  br label %while.body3, !dbg !44

while.body3:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !49, metadata !DIExpression()), !dbg !50
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !51
  %2 = bitcast i8* %call4 to i32*, !dbg !52
  store i32* %2, i32** %buffer, align 8, !dbg !50
  %3 = load i32*, i32** %buffer, align 8, !dbg !53
  %cmp5 = icmp eq i32* %3, null, !dbg !55
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !56

if.then6:                                         ; preds = %while.body3
  call void @exit(i32 -1) #9, !dbg !57
  unreachable, !dbg !57

if.end7:                                          ; preds = %while.body3
  store i32 0, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end7
  %4 = load i32, i32* %i, align 4, !dbg !62
  %cmp8 = icmp slt i32 %4, 10, !dbg !64
  br i1 %cmp8, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !66
  %6 = load i32, i32* %i, align 4, !dbg !68
  %idxprom = sext i32 %6 to i64, !dbg !66
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !71
  %inc = add nsw i32 %7, 1, !dbg !71
  store i32 %inc, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !76
  %cmp9 = icmp sge i32 %8, 0, !dbg !78
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !79

if.then10:                                        ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !80
  %10 = load i32, i32* %data, align 4, !dbg !82
  %idxprom11 = sext i32 %10 to i64, !dbg !80
  %arrayidx12 = getelementptr inbounds i32, i32* %9, i64 %idxprom11, !dbg !80
  store i32 1, i32* %arrayidx12, align 4, !dbg !83
  store i32 0, i32* %i, align 4, !dbg !84
  br label %for.cond13, !dbg !86

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %11 = load i32, i32* %i, align 4, !dbg !87
  %cmp14 = icmp slt i32 %11, 10, !dbg !89
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !90

for.body15:                                       ; preds = %for.cond13
  %12 = load i32*, i32** %buffer, align 8, !dbg !91
  %13 = load i32, i32* %i, align 4, !dbg !93
  %idxprom16 = sext i32 %13 to i64, !dbg !91
  %arrayidx17 = getelementptr inbounds i32, i32* %12, i64 %idxprom16, !dbg !91
  %14 = load i32, i32* %arrayidx17, align 4, !dbg !91
  call void @printIntLine(i32 %14), !dbg !94
  br label %for.inc18, !dbg !95

for.inc18:                                        ; preds = %for.body15
  %15 = load i32, i32* %i, align 4, !dbg !96
  %inc19 = add nsw i32 %15, 1, !dbg !96
  store i32 %inc19, i32* %i, align 4, !dbg !96
  br label %for.cond13, !dbg !97, !llvm.loop !98

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !100

if.else21:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %16 = load i32*, i32** %buffer, align 8, !dbg !103
  %17 = bitcast i32* %16 to i8*, !dbg !103
  call void @free(i8* %17) #8, !dbg !104
  br label %while.end23, !dbg !105

while.end23:                                      ; preds = %if.end22
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

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16_good() #0 !dbg !107 {
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
  %call = call i64 @time(i64* null) #8, !dbg !120
  %conv = trunc i64 %call to i32, !dbg !121
  call void @srand(i32 %conv) #8, !dbg !122
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !123
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16_good(), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16_bad(), !dbg !127
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
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 -1, i32* %data, align 4, !dbg !133
  br label %while.body, !dbg !134

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !135, metadata !DIExpression()), !dbg !138
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !138
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !139
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !141
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !142
  %cmp = icmp ne i8* %call, null, !dbg !143
  br i1 %cmp, label %if.then, label %if.else, !dbg !144

if.then:                                          ; preds = %while.body
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !145
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !147
  store i32 %call2, i32* %data, align 4, !dbg !148
  br label %if.end, !dbg !149

if.else:                                          ; preds = %while.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !150
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end, !dbg !152

while.end:                                        ; preds = %if.end
  br label %while.body3, !dbg !153

while.body3:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !154, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !158, metadata !DIExpression()), !dbg !159
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !160
  %2 = bitcast i8* %call4 to i32*, !dbg !161
  store i32* %2, i32** %buffer, align 8, !dbg !159
  %3 = load i32*, i32** %buffer, align 8, !dbg !162
  %cmp5 = icmp eq i32* %3, null, !dbg !164
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !165

if.then6:                                         ; preds = %while.body3
  call void @exit(i32 -1) #9, !dbg !166
  unreachable, !dbg !166

if.end7:                                          ; preds = %while.body3
  store i32 0, i32* %i, align 4, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %if.end7
  %4 = load i32, i32* %i, align 4, !dbg !171
  %cmp8 = icmp slt i32 %4, 10, !dbg !173
  br i1 %cmp8, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !175
  %6 = load i32, i32* %i, align 4, !dbg !177
  %idxprom = sext i32 %6 to i64, !dbg !175
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !175
  store i32 0, i32* %arrayidx, align 4, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !180
  %inc = add nsw i32 %7, 1, !dbg !180
  store i32 %inc, i32* %i, align 4, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !184
  %cmp9 = icmp sge i32 %8, 0, !dbg !186
  br i1 %cmp9, label %land.lhs.true, label %if.else22, !dbg !187

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !188
  %cmp10 = icmp slt i32 %9, 10, !dbg !189
  br i1 %cmp10, label %if.then11, label %if.else22, !dbg !190

if.then11:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !191
  %11 = load i32, i32* %data, align 4, !dbg !193
  %idxprom12 = sext i32 %11 to i64, !dbg !191
  %arrayidx13 = getelementptr inbounds i32, i32* %10, i64 %idxprom12, !dbg !191
  store i32 1, i32* %arrayidx13, align 4, !dbg !194
  store i32 0, i32* %i, align 4, !dbg !195
  br label %for.cond14, !dbg !197

for.cond14:                                       ; preds = %for.inc19, %if.then11
  %12 = load i32, i32* %i, align 4, !dbg !198
  %cmp15 = icmp slt i32 %12, 10, !dbg !200
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !201

for.body16:                                       ; preds = %for.cond14
  %13 = load i32*, i32** %buffer, align 8, !dbg !202
  %14 = load i32, i32* %i, align 4, !dbg !204
  %idxprom17 = sext i32 %14 to i64, !dbg !202
  %arrayidx18 = getelementptr inbounds i32, i32* %13, i64 %idxprom17, !dbg !202
  %15 = load i32, i32* %arrayidx18, align 4, !dbg !202
  call void @printIntLine(i32 %15), !dbg !205
  br label %for.inc19, !dbg !206

for.inc19:                                        ; preds = %for.body16
  %16 = load i32, i32* %i, align 4, !dbg !207
  %inc20 = add nsw i32 %16, 1, !dbg !207
  store i32 %inc20, i32* %i, align 4, !dbg !207
  br label %for.cond14, !dbg !208, !llvm.loop !209

for.end21:                                        ; preds = %for.cond14
  br label %if.end23, !dbg !211

if.else22:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !212
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end21
  %17 = load i32*, i32** %buffer, align 8, !dbg !214
  %18 = bitcast i32* %17 to i8*, !dbg !214
  call void @free(i8* %18) #8, !dbg !215
  br label %while.end24, !dbg !216

while.end24:                                      ; preds = %if.end23
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !218 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 -1, i32* %data, align 4, !dbg !221
  br label %while.body, !dbg !222

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !223
  br label %while.end, !dbg !225

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !226

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !227, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !231, metadata !DIExpression()), !dbg !232
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !233
  %0 = bitcast i8* %call to i32*, !dbg !234
  store i32* %0, i32** %buffer, align 8, !dbg !232
  %1 = load i32*, i32** %buffer, align 8, !dbg !235
  %cmp = icmp eq i32* %1, null, !dbg !237
  br i1 %cmp, label %if.then, label %if.end, !dbg !238

if.then:                                          ; preds = %while.body1
  call void @exit(i32 -1) #9, !dbg !239
  unreachable, !dbg !239

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !243

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !244
  %cmp2 = icmp slt i32 %2, 10, !dbg !246
  br i1 %cmp2, label %for.body, label %for.end, !dbg !247

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !248
  %4 = load i32, i32* %i, align 4, !dbg !250
  %idxprom = sext i32 %4 to i64, !dbg !248
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !248
  store i32 0, i32* %arrayidx, align 4, !dbg !251
  br label %for.inc, !dbg !252

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !253
  %inc = add nsw i32 %5, 1, !dbg !253
  store i32 %inc, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !254, !llvm.loop !255

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !257
  %cmp3 = icmp sge i32 %6, 0, !dbg !259
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !260

if.then4:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !261
  %8 = load i32, i32* %data, align 4, !dbg !263
  %idxprom5 = sext i32 %8 to i64, !dbg !261
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %idxprom5, !dbg !261
  store i32 1, i32* %arrayidx6, align 4, !dbg !264
  store i32 0, i32* %i, align 4, !dbg !265
  br label %for.cond7, !dbg !267

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %9 = load i32, i32* %i, align 4, !dbg !268
  %cmp8 = icmp slt i32 %9, 10, !dbg !270
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !271

for.body9:                                        ; preds = %for.cond7
  %10 = load i32*, i32** %buffer, align 8, !dbg !272
  %11 = load i32, i32* %i, align 4, !dbg !274
  %idxprom10 = sext i32 %11 to i64, !dbg !272
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !272
  %12 = load i32, i32* %arrayidx11, align 4, !dbg !272
  call void @printIntLine(i32 %12), !dbg !275
  br label %for.inc12, !dbg !276

for.inc12:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !dbg !277
  %inc13 = add nsw i32 %13, 1, !dbg !277
  store i32 %inc13, i32* %i, align 4, !dbg !277
  br label %for.cond7, !dbg !278, !llvm.loop !279

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !281

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !282
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %14 = load i32*, i32** %buffer, align 8, !dbg !284
  %15 = bitcast i32* %14 to i8*, !dbg !284
  call void @free(i8* %15) #8, !dbg !285
  br label %while.end16, !dbg !286

while.end16:                                      ; preds = %if.end15
  ret void, !dbg !287
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !6)
!19 = !DILocation(line: 26, column: 9, scope: !14)
!20 = !DILocation(line: 28, column: 10, scope: !14)
!21 = !DILocation(line: 29, column: 5, scope: !14)
!22 = !DILocalVariable(name: "inputBuffer", scope: !23, file: !15, line: 32, type: !25)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 31, column: 9)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 112, elements: !27)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !{!28}
!28 = !DISubrange(count: 14)
!29 = !DILocation(line: 32, column: 18, scope: !23)
!30 = !DILocation(line: 34, column: 23, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !15, line: 34, column: 17)
!32 = !DILocation(line: 34, column: 53, scope: !31)
!33 = !DILocation(line: 34, column: 17, scope: !31)
!34 = !DILocation(line: 34, column: 60, scope: !31)
!35 = !DILocation(line: 34, column: 17, scope: !23)
!36 = !DILocation(line: 37, column: 29, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !15, line: 35, column: 13)
!38 = !DILocation(line: 37, column: 24, scope: !37)
!39 = !DILocation(line: 37, column: 22, scope: !37)
!40 = !DILocation(line: 38, column: 13, scope: !37)
!41 = !DILocation(line: 41, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !31, file: !15, line: 40, column: 13)
!43 = !DILocation(line: 44, column: 9, scope: !24)
!44 = !DILocation(line: 46, column: 5, scope: !14)
!45 = !DILocalVariable(name: "i", scope: !46, file: !15, line: 49, type: !6)
!46 = distinct !DILexicalBlock(scope: !47, file: !15, line: 48, column: 9)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 47, column: 5)
!48 = !DILocation(line: 49, column: 17, scope: !46)
!49 = !DILocalVariable(name: "buffer", scope: !46, file: !15, line: 50, type: !5)
!50 = !DILocation(line: 50, column: 19, scope: !46)
!51 = !DILocation(line: 50, column: 35, scope: !46)
!52 = !DILocation(line: 50, column: 28, scope: !46)
!53 = !DILocation(line: 51, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !46, file: !15, line: 51, column: 17)
!55 = !DILocation(line: 51, column: 24, scope: !54)
!56 = !DILocation(line: 51, column: 17, scope: !46)
!57 = !DILocation(line: 51, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 51, column: 33)
!59 = !DILocation(line: 53, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !46, file: !15, line: 53, column: 13)
!61 = !DILocation(line: 53, column: 18, scope: !60)
!62 = !DILocation(line: 53, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 53, column: 13)
!64 = !DILocation(line: 53, column: 27, scope: !63)
!65 = !DILocation(line: 53, column: 13, scope: !60)
!66 = !DILocation(line: 55, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 54, column: 13)
!68 = !DILocation(line: 55, column: 24, scope: !67)
!69 = !DILocation(line: 55, column: 27, scope: !67)
!70 = !DILocation(line: 56, column: 13, scope: !67)
!71 = !DILocation(line: 53, column: 34, scope: !63)
!72 = !DILocation(line: 53, column: 13, scope: !63)
!73 = distinct !{!73, !65, !74, !75}
!74 = !DILocation(line: 56, column: 13, scope: !60)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 59, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !46, file: !15, line: 59, column: 17)
!78 = !DILocation(line: 59, column: 22, scope: !77)
!79 = !DILocation(line: 59, column: 17, scope: !46)
!80 = !DILocation(line: 61, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 60, column: 13)
!82 = !DILocation(line: 61, column: 24, scope: !81)
!83 = !DILocation(line: 61, column: 30, scope: !81)
!84 = !DILocation(line: 63, column: 23, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 63, column: 17)
!86 = !DILocation(line: 63, column: 21, scope: !85)
!87 = !DILocation(line: 63, column: 28, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !15, line: 63, column: 17)
!89 = !DILocation(line: 63, column: 30, scope: !88)
!90 = !DILocation(line: 63, column: 17, scope: !85)
!91 = !DILocation(line: 65, column: 34, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 64, column: 17)
!93 = !DILocation(line: 65, column: 41, scope: !92)
!94 = !DILocation(line: 65, column: 21, scope: !92)
!95 = !DILocation(line: 66, column: 17, scope: !92)
!96 = !DILocation(line: 63, column: 37, scope: !88)
!97 = !DILocation(line: 63, column: 17, scope: !88)
!98 = distinct !{!98, !90, !99, !75}
!99 = !DILocation(line: 66, column: 17, scope: !85)
!100 = !DILocation(line: 67, column: 13, scope: !81)
!101 = !DILocation(line: 70, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !77, file: !15, line: 69, column: 13)
!103 = !DILocation(line: 72, column: 18, scope: !46)
!104 = !DILocation(line: 72, column: 13, scope: !46)
!105 = !DILocation(line: 74, column: 9, scope: !47)
!106 = !DILocation(line: 76, column: 1, scope: !14)
!107 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_16_good", scope: !15, file: !15, line: 181, type: !16, scopeLine: 182, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocation(line: 183, column: 5, scope: !107)
!109 = !DILocation(line: 184, column: 5, scope: !107)
!110 = !DILocation(line: 185, column: 1, scope: !107)
!111 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 196, type: !112, scopeLine: 197, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DISubroutineType(types: !113)
!113 = !{!6, !6, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!116 = !DILocalVariable(name: "argc", arg: 1, scope: !111, file: !15, line: 196, type: !6)
!117 = !DILocation(line: 196, column: 14, scope: !111)
!118 = !DILocalVariable(name: "argv", arg: 2, scope: !111, file: !15, line: 196, type: !114)
!119 = !DILocation(line: 196, column: 27, scope: !111)
!120 = !DILocation(line: 199, column: 22, scope: !111)
!121 = !DILocation(line: 199, column: 12, scope: !111)
!122 = !DILocation(line: 199, column: 5, scope: !111)
!123 = !DILocation(line: 201, column: 5, scope: !111)
!124 = !DILocation(line: 202, column: 5, scope: !111)
!125 = !DILocation(line: 203, column: 5, scope: !111)
!126 = !DILocation(line: 206, column: 5, scope: !111)
!127 = !DILocation(line: 207, column: 5, scope: !111)
!128 = !DILocation(line: 208, column: 5, scope: !111)
!129 = !DILocation(line: 210, column: 5, scope: !111)
!130 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 83, type: !16, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "data", scope: !130, file: !15, line: 85, type: !6)
!132 = !DILocation(line: 85, column: 9, scope: !130)
!133 = !DILocation(line: 87, column: 10, scope: !130)
!134 = !DILocation(line: 88, column: 5, scope: !130)
!135 = !DILocalVariable(name: "inputBuffer", scope: !136, file: !15, line: 91, type: !25)
!136 = distinct !DILexicalBlock(scope: !137, file: !15, line: 90, column: 9)
!137 = distinct !DILexicalBlock(scope: !130, file: !15, line: 89, column: 5)
!138 = !DILocation(line: 91, column: 18, scope: !136)
!139 = !DILocation(line: 93, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !15, line: 93, column: 17)
!141 = !DILocation(line: 93, column: 53, scope: !140)
!142 = !DILocation(line: 93, column: 17, scope: !140)
!143 = !DILocation(line: 93, column: 60, scope: !140)
!144 = !DILocation(line: 93, column: 17, scope: !136)
!145 = !DILocation(line: 96, column: 29, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !15, line: 94, column: 13)
!147 = !DILocation(line: 96, column: 24, scope: !146)
!148 = !DILocation(line: 96, column: 22, scope: !146)
!149 = !DILocation(line: 97, column: 13, scope: !146)
!150 = !DILocation(line: 100, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !140, file: !15, line: 99, column: 13)
!152 = !DILocation(line: 103, column: 9, scope: !137)
!153 = !DILocation(line: 105, column: 5, scope: !130)
!154 = !DILocalVariable(name: "i", scope: !155, file: !15, line: 108, type: !6)
!155 = distinct !DILexicalBlock(scope: !156, file: !15, line: 107, column: 9)
!156 = distinct !DILexicalBlock(scope: !130, file: !15, line: 106, column: 5)
!157 = !DILocation(line: 108, column: 17, scope: !155)
!158 = !DILocalVariable(name: "buffer", scope: !155, file: !15, line: 109, type: !5)
!159 = !DILocation(line: 109, column: 19, scope: !155)
!160 = !DILocation(line: 109, column: 35, scope: !155)
!161 = !DILocation(line: 109, column: 28, scope: !155)
!162 = !DILocation(line: 110, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !155, file: !15, line: 110, column: 17)
!164 = !DILocation(line: 110, column: 24, scope: !163)
!165 = !DILocation(line: 110, column: 17, scope: !155)
!166 = !DILocation(line: 110, column: 34, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 110, column: 33)
!168 = !DILocation(line: 112, column: 20, scope: !169)
!169 = distinct !DILexicalBlock(scope: !155, file: !15, line: 112, column: 13)
!170 = !DILocation(line: 112, column: 18, scope: !169)
!171 = !DILocation(line: 112, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !15, line: 112, column: 13)
!173 = !DILocation(line: 112, column: 27, scope: !172)
!174 = !DILocation(line: 112, column: 13, scope: !169)
!175 = !DILocation(line: 114, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 113, column: 13)
!177 = !DILocation(line: 114, column: 24, scope: !176)
!178 = !DILocation(line: 114, column: 27, scope: !176)
!179 = !DILocation(line: 115, column: 13, scope: !176)
!180 = !DILocation(line: 112, column: 34, scope: !172)
!181 = !DILocation(line: 112, column: 13, scope: !172)
!182 = distinct !{!182, !174, !183, !75}
!183 = !DILocation(line: 115, column: 13, scope: !169)
!184 = !DILocation(line: 117, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !155, file: !15, line: 117, column: 17)
!186 = !DILocation(line: 117, column: 22, scope: !185)
!187 = !DILocation(line: 117, column: 27, scope: !185)
!188 = !DILocation(line: 117, column: 30, scope: !185)
!189 = !DILocation(line: 117, column: 35, scope: !185)
!190 = !DILocation(line: 117, column: 17, scope: !155)
!191 = !DILocation(line: 119, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !185, file: !15, line: 118, column: 13)
!193 = !DILocation(line: 119, column: 24, scope: !192)
!194 = !DILocation(line: 119, column: 30, scope: !192)
!195 = !DILocation(line: 121, column: 23, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !15, line: 121, column: 17)
!197 = !DILocation(line: 121, column: 21, scope: !196)
!198 = !DILocation(line: 121, column: 28, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !15, line: 121, column: 17)
!200 = !DILocation(line: 121, column: 30, scope: !199)
!201 = !DILocation(line: 121, column: 17, scope: !196)
!202 = !DILocation(line: 123, column: 34, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !15, line: 122, column: 17)
!204 = !DILocation(line: 123, column: 41, scope: !203)
!205 = !DILocation(line: 123, column: 21, scope: !203)
!206 = !DILocation(line: 124, column: 17, scope: !203)
!207 = !DILocation(line: 121, column: 37, scope: !199)
!208 = !DILocation(line: 121, column: 17, scope: !199)
!209 = distinct !{!209, !201, !210, !75}
!210 = !DILocation(line: 124, column: 17, scope: !196)
!211 = !DILocation(line: 125, column: 13, scope: !192)
!212 = !DILocation(line: 128, column: 17, scope: !213)
!213 = distinct !DILexicalBlock(scope: !185, file: !15, line: 127, column: 13)
!214 = !DILocation(line: 130, column: 18, scope: !155)
!215 = !DILocation(line: 130, column: 13, scope: !155)
!216 = !DILocation(line: 132, column: 9, scope: !156)
!217 = !DILocation(line: 134, column: 1, scope: !130)
!218 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 137, type: !16, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!219 = !DILocalVariable(name: "data", scope: !218, file: !15, line: 139, type: !6)
!220 = !DILocation(line: 139, column: 9, scope: !218)
!221 = !DILocation(line: 141, column: 10, scope: !218)
!222 = !DILocation(line: 142, column: 5, scope: !218)
!223 = !DILocation(line: 146, column: 14, scope: !224)
!224 = distinct !DILexicalBlock(scope: !218, file: !15, line: 143, column: 5)
!225 = !DILocation(line: 147, column: 9, scope: !224)
!226 = !DILocation(line: 149, column: 5, scope: !218)
!227 = !DILocalVariable(name: "i", scope: !228, file: !15, line: 152, type: !6)
!228 = distinct !DILexicalBlock(scope: !229, file: !15, line: 151, column: 9)
!229 = distinct !DILexicalBlock(scope: !218, file: !15, line: 150, column: 5)
!230 = !DILocation(line: 152, column: 17, scope: !228)
!231 = !DILocalVariable(name: "buffer", scope: !228, file: !15, line: 153, type: !5)
!232 = !DILocation(line: 153, column: 19, scope: !228)
!233 = !DILocation(line: 153, column: 35, scope: !228)
!234 = !DILocation(line: 153, column: 28, scope: !228)
!235 = !DILocation(line: 154, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !228, file: !15, line: 154, column: 17)
!237 = !DILocation(line: 154, column: 24, scope: !236)
!238 = !DILocation(line: 154, column: 17, scope: !228)
!239 = !DILocation(line: 154, column: 34, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !15, line: 154, column: 33)
!241 = !DILocation(line: 156, column: 20, scope: !242)
!242 = distinct !DILexicalBlock(scope: !228, file: !15, line: 156, column: 13)
!243 = !DILocation(line: 156, column: 18, scope: !242)
!244 = !DILocation(line: 156, column: 25, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !15, line: 156, column: 13)
!246 = !DILocation(line: 156, column: 27, scope: !245)
!247 = !DILocation(line: 156, column: 13, scope: !242)
!248 = !DILocation(line: 158, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !15, line: 157, column: 13)
!250 = !DILocation(line: 158, column: 24, scope: !249)
!251 = !DILocation(line: 158, column: 27, scope: !249)
!252 = !DILocation(line: 159, column: 13, scope: !249)
!253 = !DILocation(line: 156, column: 34, scope: !245)
!254 = !DILocation(line: 156, column: 13, scope: !245)
!255 = distinct !{!255, !247, !256, !75}
!256 = !DILocation(line: 159, column: 13, scope: !242)
!257 = !DILocation(line: 162, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !228, file: !15, line: 162, column: 17)
!259 = !DILocation(line: 162, column: 22, scope: !258)
!260 = !DILocation(line: 162, column: 17, scope: !228)
!261 = !DILocation(line: 164, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !15, line: 163, column: 13)
!263 = !DILocation(line: 164, column: 24, scope: !262)
!264 = !DILocation(line: 164, column: 30, scope: !262)
!265 = !DILocation(line: 166, column: 23, scope: !266)
!266 = distinct !DILexicalBlock(scope: !262, file: !15, line: 166, column: 17)
!267 = !DILocation(line: 166, column: 21, scope: !266)
!268 = !DILocation(line: 166, column: 28, scope: !269)
!269 = distinct !DILexicalBlock(scope: !266, file: !15, line: 166, column: 17)
!270 = !DILocation(line: 166, column: 30, scope: !269)
!271 = !DILocation(line: 166, column: 17, scope: !266)
!272 = !DILocation(line: 168, column: 34, scope: !273)
!273 = distinct !DILexicalBlock(scope: !269, file: !15, line: 167, column: 17)
!274 = !DILocation(line: 168, column: 41, scope: !273)
!275 = !DILocation(line: 168, column: 21, scope: !273)
!276 = !DILocation(line: 169, column: 17, scope: !273)
!277 = !DILocation(line: 166, column: 37, scope: !269)
!278 = !DILocation(line: 166, column: 17, scope: !269)
!279 = distinct !{!279, !271, !280, !75}
!280 = !DILocation(line: 169, column: 17, scope: !266)
!281 = !DILocation(line: 170, column: 13, scope: !262)
!282 = !DILocation(line: 173, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !258, file: !15, line: 172, column: 13)
!284 = !DILocation(line: 175, column: 18, scope: !228)
!285 = !DILocation(line: 175, column: 13, scope: !228)
!286 = !DILocation(line: 177, column: 9, scope: !229)
!287 = !DILocation(line: 179, column: 1, scope: !218)
