; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@staticFive = internal global i32 5, align 4, !dbg !0
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  %0 = load i32, i32* @staticFive, align 4, !dbg !24
  %cmp = icmp eq i32 %0, 5, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !28
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp1 = icmp eq i32 %2, 5, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !35

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !36, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !40, metadata !DIExpression()), !dbg !41
  %call3 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !42
  %3 = bitcast i8* %call3 to i32*, !dbg !43
  store i32* %3, i32** %buffer, align 8, !dbg !41
  %4 = load i32*, i32** %buffer, align 8, !dbg !44
  %cmp4 = icmp eq i32* %4, null, !dbg !46
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !47

if.then5:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !48
  unreachable, !dbg !48

if.end6:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end6
  %5 = load i32, i32* %i, align 4, !dbg !53
  %cmp7 = icmp slt i32 %5, 10, !dbg !55
  br i1 %cmp7, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !57
  %7 = load i32, i32* %i, align 4, !dbg !59
  %idxprom = sext i32 %7 to i64, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !62
  %inc = add nsw i32 %8, 1, !dbg !62
  store i32 %inc, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data, align 4, !dbg !67
  %cmp8 = icmp sge i32 %9, 0, !dbg !69
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !70

if.then9:                                         ; preds = %for.end
  %10 = load i32*, i32** %buffer, align 8, !dbg !71
  %11 = load i32, i32* %data, align 4, !dbg !73
  %idxprom10 = sext i32 %11 to i64, !dbg !71
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !71
  store i32 1, i32* %arrayidx11, align 4, !dbg !74
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond12, !dbg !77

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %12 = load i32, i32* %i, align 4, !dbg !78
  %cmp13 = icmp slt i32 %12, 10, !dbg !80
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !81

for.body14:                                       ; preds = %for.cond12
  %13 = load i32*, i32** %buffer, align 8, !dbg !82
  %14 = load i32, i32* %i, align 4, !dbg !84
  %idxprom15 = sext i32 %14 to i64, !dbg !82
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %idxprom15, !dbg !82
  %15 = load i32, i32* %arrayidx16, align 4, !dbg !82
  call void @printIntLine(i32 %15), !dbg !85
  br label %for.inc17, !dbg !86

for.inc17:                                        ; preds = %for.body14
  %16 = load i32, i32* %i, align 4, !dbg !87
  %inc18 = add nsw i32 %16, 1, !dbg !87
  store i32 %inc18, i32* %i, align 4, !dbg !87
  br label %for.cond12, !dbg !88, !llvm.loop !89

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !91

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %17 = load i32*, i32** %buffer, align 8, !dbg !94
  %18 = bitcast i32* %17 to i8*, !dbg !94
  call void @free(i8* %18) #5, !dbg !95
  br label %if.end21, !dbg !96

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !97
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07_good() #0 !dbg !98 {
entry:
  call void @goodB2G1(), !dbg !99
  call void @goodB2G2(), !dbg !100
  call void @goodG2B1(), !dbg !101
  call void @goodG2B2(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* null) #5, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #5, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 -1, i32* %data, align 4, !dbg !127
  %0 = load i32, i32* @staticFive, align 4, !dbg !128
  %cmp = icmp eq i32 %0, 5, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !132
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !134
  br label %if.end, !dbg !135

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !136
  %cmp1 = icmp ne i32 %2, 5, !dbg !138
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !139

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !140
  br label %if.end23, !dbg !142

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !143, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !147, metadata !DIExpression()), !dbg !148
  %call3 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !149
  %3 = bitcast i8* %call3 to i32*, !dbg !150
  store i32* %3, i32** %buffer, align 8, !dbg !148
  %4 = load i32*, i32** %buffer, align 8, !dbg !151
  %cmp4 = icmp eq i32* %4, null, !dbg !153
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !154

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !155
  unreachable, !dbg !155

if.end6:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %if.end6
  %5 = load i32, i32* %i, align 4, !dbg !160
  %cmp7 = icmp slt i32 %5, 10, !dbg !162
  br i1 %cmp7, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !164
  %7 = load i32, i32* %i, align 4, !dbg !166
  %idxprom = sext i32 %7 to i64, !dbg !164
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !164
  store i32 0, i32* %arrayidx, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !169
  %inc = add nsw i32 %8, 1, !dbg !169
  store i32 %inc, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data, align 4, !dbg !173
  %cmp8 = icmp sge i32 %9, 0, !dbg !175
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !176

land.lhs.true:                                    ; preds = %for.end
  %10 = load i32, i32* %data, align 4, !dbg !177
  %cmp9 = icmp slt i32 %10, 10, !dbg !178
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !179

if.then10:                                        ; preds = %land.lhs.true
  %11 = load i32*, i32** %buffer, align 8, !dbg !180
  %12 = load i32, i32* %data, align 4, !dbg !182
  %idxprom11 = sext i32 %12 to i64, !dbg !180
  %arrayidx12 = getelementptr inbounds i32, i32* %11, i64 %idxprom11, !dbg !180
  store i32 1, i32* %arrayidx12, align 4, !dbg !183
  store i32 0, i32* %i, align 4, !dbg !184
  br label %for.cond13, !dbg !186

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %13 = load i32, i32* %i, align 4, !dbg !187
  %cmp14 = icmp slt i32 %13, 10, !dbg !189
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !190

for.body15:                                       ; preds = %for.cond13
  %14 = load i32*, i32** %buffer, align 8, !dbg !191
  %15 = load i32, i32* %i, align 4, !dbg !193
  %idxprom16 = sext i32 %15 to i64, !dbg !191
  %arrayidx17 = getelementptr inbounds i32, i32* %14, i64 %idxprom16, !dbg !191
  %16 = load i32, i32* %arrayidx17, align 4, !dbg !191
  call void @printIntLine(i32 %16), !dbg !194
  br label %for.inc18, !dbg !195

for.inc18:                                        ; preds = %for.body15
  %17 = load i32, i32* %i, align 4, !dbg !196
  %inc19 = add nsw i32 %17, 1, !dbg !196
  store i32 %inc19, i32* %i, align 4, !dbg !196
  br label %for.cond13, !dbg !197, !llvm.loop !198

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !200

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !201
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %18 = load i32*, i32** %buffer, align 8, !dbg !203
  %19 = bitcast i32* %18 to i8*, !dbg !203
  call void @free(i8* %19) #5, !dbg !204
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then2
  ret void, !dbg !205
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !206 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 -1, i32* %data, align 4, !dbg !209
  %0 = load i32, i32* @staticFive, align 4, !dbg !210
  %cmp = icmp eq i32 %0, 5, !dbg !212
  br i1 %cmp, label %if.then, label %if.end, !dbg !213

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !214
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !216
  br label %if.end, !dbg !217

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !218
  %cmp1 = icmp eq i32 %2, 5, !dbg !220
  br i1 %cmp1, label %if.then2, label %if.end22, !dbg !221

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !222, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !226, metadata !DIExpression()), !dbg !227
  %call3 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !228
  %3 = bitcast i8* %call3 to i32*, !dbg !229
  store i32* %3, i32** %buffer, align 8, !dbg !227
  %4 = load i32*, i32** %buffer, align 8, !dbg !230
  %cmp4 = icmp eq i32* %4, null, !dbg !232
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !233

if.then5:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !234
  unreachable, !dbg !234

if.end6:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond, !dbg !238

for.cond:                                         ; preds = %for.inc, %if.end6
  %5 = load i32, i32* %i, align 4, !dbg !239
  %cmp7 = icmp slt i32 %5, 10, !dbg !241
  br i1 %cmp7, label %for.body, label %for.end, !dbg !242

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !243
  %7 = load i32, i32* %i, align 4, !dbg !245
  %idxprom = sext i32 %7 to i64, !dbg !243
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !243
  store i32 0, i32* %arrayidx, align 4, !dbg !246
  br label %for.inc, !dbg !247

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !248
  %inc = add nsw i32 %8, 1, !dbg !248
  store i32 %inc, i32* %i, align 4, !dbg !248
  br label %for.cond, !dbg !249, !llvm.loop !250

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data, align 4, !dbg !252
  %cmp8 = icmp sge i32 %9, 0, !dbg !254
  br i1 %cmp8, label %land.lhs.true, label %if.else, !dbg !255

land.lhs.true:                                    ; preds = %for.end
  %10 = load i32, i32* %data, align 4, !dbg !256
  %cmp9 = icmp slt i32 %10, 10, !dbg !257
  br i1 %cmp9, label %if.then10, label %if.else, !dbg !258

if.then10:                                        ; preds = %land.lhs.true
  %11 = load i32*, i32** %buffer, align 8, !dbg !259
  %12 = load i32, i32* %data, align 4, !dbg !261
  %idxprom11 = sext i32 %12 to i64, !dbg !259
  %arrayidx12 = getelementptr inbounds i32, i32* %11, i64 %idxprom11, !dbg !259
  store i32 1, i32* %arrayidx12, align 4, !dbg !262
  store i32 0, i32* %i, align 4, !dbg !263
  br label %for.cond13, !dbg !265

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %13 = load i32, i32* %i, align 4, !dbg !266
  %cmp14 = icmp slt i32 %13, 10, !dbg !268
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !269

for.body15:                                       ; preds = %for.cond13
  %14 = load i32*, i32** %buffer, align 8, !dbg !270
  %15 = load i32, i32* %i, align 4, !dbg !272
  %idxprom16 = sext i32 %15 to i64, !dbg !270
  %arrayidx17 = getelementptr inbounds i32, i32* %14, i64 %idxprom16, !dbg !270
  %16 = load i32, i32* %arrayidx17, align 4, !dbg !270
  call void @printIntLine(i32 %16), !dbg !273
  br label %for.inc18, !dbg !274

for.inc18:                                        ; preds = %for.body15
  %17 = load i32, i32* %i, align 4, !dbg !275
  %inc19 = add nsw i32 %17, 1, !dbg !275
  store i32 %inc19, i32* %i, align 4, !dbg !275
  br label %for.cond13, !dbg !276, !llvm.loop !277

for.end20:                                        ; preds = %for.cond13
  br label %if.end21, !dbg !279

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !280
  br label %if.end21

if.end21:                                         ; preds = %if.else, %for.end20
  %18 = load i32*, i32** %buffer, align 8, !dbg !282
  %19 = bitcast i32* %18 to i8*, !dbg !282
  call void @free(i8* %19) #5, !dbg !283
  br label %if.end22, !dbg !284

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !285
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !286 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !287, metadata !DIExpression()), !dbg !288
  store i32 -1, i32* %data, align 4, !dbg !289
  %0 = load i32, i32* @staticFive, align 4, !dbg !290
  %cmp = icmp ne i32 %0, 5, !dbg !292
  br i1 %cmp, label %if.then, label %if.else, !dbg !293

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !294
  br label %if.end, !dbg !296

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !297
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !299
  %cmp1 = icmp eq i32 %1, 5, !dbg !301
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !302

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !303, metadata !DIExpression()), !dbg !306
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !307, metadata !DIExpression()), !dbg !308
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !309
  %2 = bitcast i8* %call to i32*, !dbg !310
  store i32* %2, i32** %buffer, align 8, !dbg !308
  %3 = load i32*, i32** %buffer, align 8, !dbg !311
  %cmp3 = icmp eq i32* %3, null, !dbg !313
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !314

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !315
  unreachable, !dbg !315

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !317
  br label %for.cond, !dbg !319

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !320
  %cmp6 = icmp slt i32 %4, 10, !dbg !322
  br i1 %cmp6, label %for.body, label %for.end, !dbg !323

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !324
  %6 = load i32, i32* %i, align 4, !dbg !326
  %idxprom = sext i32 %6 to i64, !dbg !324
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !324
  store i32 0, i32* %arrayidx, align 4, !dbg !327
  br label %for.inc, !dbg !328

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !329
  %inc = add nsw i32 %7, 1, !dbg !329
  store i32 %inc, i32* %i, align 4, !dbg !329
  br label %for.cond, !dbg !330, !llvm.loop !331

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !333
  %cmp7 = icmp sge i32 %8, 0, !dbg !335
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !336

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !337
  %10 = load i32, i32* %data, align 4, !dbg !339
  %idxprom9 = sext i32 %10 to i64, !dbg !337
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !337
  store i32 1, i32* %arrayidx10, align 4, !dbg !340
  store i32 0, i32* %i, align 4, !dbg !341
  br label %for.cond11, !dbg !343

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !344
  %cmp12 = icmp slt i32 %11, 10, !dbg !346
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !347

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !348
  %13 = load i32, i32* %i, align 4, !dbg !350
  %idxprom14 = sext i32 %13 to i64, !dbg !348
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !348
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !348
  call void @printIntLine(i32 %14), !dbg !351
  br label %for.inc16, !dbg !352

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !353
  %inc17 = add nsw i32 %15, 1, !dbg !353
  store i32 %inc17, i32* %i, align 4, !dbg !353
  br label %for.cond11, !dbg !354, !llvm.loop !355

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !357

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !358
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !360
  %17 = bitcast i32* %16 to i8*, !dbg !360
  call void @free(i8* %17) #5, !dbg !361
  br label %if.end21, !dbg !362

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !363
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !364 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !365, metadata !DIExpression()), !dbg !366
  store i32 -1, i32* %data, align 4, !dbg !367
  %0 = load i32, i32* @staticFive, align 4, !dbg !368
  %cmp = icmp eq i32 %0, 5, !dbg !370
  br i1 %cmp, label %if.then, label %if.end, !dbg !371

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !372
  br label %if.end, !dbg !374

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !375
  %cmp1 = icmp eq i32 %1, 5, !dbg !377
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !378

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !379, metadata !DIExpression()), !dbg !382
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !383, metadata !DIExpression()), !dbg !384
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !385
  %2 = bitcast i8* %call to i32*, !dbg !386
  store i32* %2, i32** %buffer, align 8, !dbg !384
  %3 = load i32*, i32** %buffer, align 8, !dbg !387
  %cmp3 = icmp eq i32* %3, null, !dbg !389
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !390

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !391
  unreachable, !dbg !391

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !393
  br label %for.cond, !dbg !395

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !396
  %cmp6 = icmp slt i32 %4, 10, !dbg !398
  br i1 %cmp6, label %for.body, label %for.end, !dbg !399

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !400
  %6 = load i32, i32* %i, align 4, !dbg !402
  %idxprom = sext i32 %6 to i64, !dbg !400
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !400
  store i32 0, i32* %arrayidx, align 4, !dbg !403
  br label %for.inc, !dbg !404

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !405
  %inc = add nsw i32 %7, 1, !dbg !405
  store i32 %inc, i32* %i, align 4, !dbg !405
  br label %for.cond, !dbg !406, !llvm.loop !407

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !409
  %cmp7 = icmp sge i32 %8, 0, !dbg !411
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !412

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !413
  %10 = load i32, i32* %data, align 4, !dbg !415
  %idxprom9 = sext i32 %10 to i64, !dbg !413
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !413
  store i32 1, i32* %arrayidx10, align 4, !dbg !416
  store i32 0, i32* %i, align 4, !dbg !417
  br label %for.cond11, !dbg !419

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !420
  %cmp12 = icmp slt i32 %11, 10, !dbg !422
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !423

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !424
  %13 = load i32, i32* %i, align 4, !dbg !426
  %idxprom14 = sext i32 %13 to i64, !dbg !424
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !424
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !424
  call void @printIntLine(i32 %14), !dbg !427
  br label %for.inc16, !dbg !428

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !429
  %inc17 = add nsw i32 %15, 1, !dbg !429
  store i32 %inc17, i32* %i, align 4, !dbg !429
  br label %for.cond11, !dbg !430, !llvm.loop !431

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !433

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !434
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !436
  %17 = bitcast i32* %16 to i8*, !dbg !436
  call void @free(i8* %17) #5, !dbg !437
  br label %if.end20, !dbg !438

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !439
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07_bad", scope: !11, file: !11, line: 27, type: !19, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !11, line: 29, type: !7)
!22 = !DILocation(line: 29, column: 9, scope: !18)
!23 = !DILocation(line: 31, column: 10, scope: !18)
!24 = !DILocation(line: 32, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !11, line: 32, column: 8)
!26 = !DILocation(line: 32, column: 18, scope: !25)
!27 = !DILocation(line: 32, column: 8, scope: !18)
!28 = !DILocation(line: 35, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !11, line: 33, column: 5)
!30 = !DILocation(line: 35, column: 9, scope: !29)
!31 = !DILocation(line: 36, column: 5, scope: !29)
!32 = !DILocation(line: 37, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !11, line: 37, column: 8)
!34 = !DILocation(line: 37, column: 18, scope: !33)
!35 = !DILocation(line: 37, column: 8, scope: !18)
!36 = !DILocalVariable(name: "i", scope: !37, file: !11, line: 40, type: !7)
!37 = distinct !DILexicalBlock(scope: !38, file: !11, line: 39, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !11, line: 38, column: 5)
!39 = !DILocation(line: 40, column: 17, scope: !37)
!40 = !DILocalVariable(name: "buffer", scope: !37, file: !11, line: 41, type: !6)
!41 = !DILocation(line: 41, column: 19, scope: !37)
!42 = !DILocation(line: 41, column: 35, scope: !37)
!43 = !DILocation(line: 41, column: 28, scope: !37)
!44 = !DILocation(line: 42, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !37, file: !11, line: 42, column: 17)
!46 = !DILocation(line: 42, column: 24, scope: !45)
!47 = !DILocation(line: 42, column: 17, scope: !37)
!48 = !DILocation(line: 42, column: 34, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !11, line: 42, column: 33)
!50 = !DILocation(line: 44, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !37, file: !11, line: 44, column: 13)
!52 = !DILocation(line: 44, column: 18, scope: !51)
!53 = !DILocation(line: 44, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !11, line: 44, column: 13)
!55 = !DILocation(line: 44, column: 27, scope: !54)
!56 = !DILocation(line: 44, column: 13, scope: !51)
!57 = !DILocation(line: 46, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !11, line: 45, column: 13)
!59 = !DILocation(line: 46, column: 24, scope: !58)
!60 = !DILocation(line: 46, column: 27, scope: !58)
!61 = !DILocation(line: 47, column: 13, scope: !58)
!62 = !DILocation(line: 44, column: 34, scope: !54)
!63 = !DILocation(line: 44, column: 13, scope: !54)
!64 = distinct !{!64, !56, !65, !66}
!65 = !DILocation(line: 47, column: 13, scope: !51)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 50, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !37, file: !11, line: 50, column: 17)
!69 = !DILocation(line: 50, column: 22, scope: !68)
!70 = !DILocation(line: 50, column: 17, scope: !37)
!71 = !DILocation(line: 52, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !11, line: 51, column: 13)
!73 = !DILocation(line: 52, column: 24, scope: !72)
!74 = !DILocation(line: 52, column: 30, scope: !72)
!75 = !DILocation(line: 54, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !11, line: 54, column: 17)
!77 = !DILocation(line: 54, column: 21, scope: !76)
!78 = !DILocation(line: 54, column: 28, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !11, line: 54, column: 17)
!80 = !DILocation(line: 54, column: 30, scope: !79)
!81 = !DILocation(line: 54, column: 17, scope: !76)
!82 = !DILocation(line: 56, column: 34, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !11, line: 55, column: 17)
!84 = !DILocation(line: 56, column: 41, scope: !83)
!85 = !DILocation(line: 56, column: 21, scope: !83)
!86 = !DILocation(line: 57, column: 17, scope: !83)
!87 = !DILocation(line: 54, column: 37, scope: !79)
!88 = !DILocation(line: 54, column: 17, scope: !79)
!89 = distinct !{!89, !81, !90, !66}
!90 = !DILocation(line: 57, column: 17, scope: !76)
!91 = !DILocation(line: 58, column: 13, scope: !72)
!92 = !DILocation(line: 61, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !68, file: !11, line: 60, column: 13)
!94 = !DILocation(line: 63, column: 18, scope: !37)
!95 = !DILocation(line: 63, column: 13, scope: !37)
!96 = !DILocation(line: 65, column: 5, scope: !38)
!97 = !DILocation(line: 66, column: 1, scope: !18)
!98 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_07_good", scope: !11, file: !11, line: 250, type: !19, scopeLine: 251, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocation(line: 252, column: 5, scope: !98)
!100 = !DILocation(line: 253, column: 5, scope: !98)
!101 = !DILocation(line: 254, column: 5, scope: !98)
!102 = !DILocation(line: 255, column: 5, scope: !98)
!103 = !DILocation(line: 256, column: 1, scope: !98)
!104 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 267, type: !105, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DISubroutineType(types: !106)
!106 = !{!7, !7, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !11, line: 267, type: !7)
!111 = !DILocation(line: 267, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !11, line: 267, type: !107)
!113 = !DILocation(line: 267, column: 27, scope: !104)
!114 = !DILocation(line: 270, column: 22, scope: !104)
!115 = !DILocation(line: 270, column: 12, scope: !104)
!116 = !DILocation(line: 270, column: 5, scope: !104)
!117 = !DILocation(line: 272, column: 5, scope: !104)
!118 = !DILocation(line: 273, column: 5, scope: !104)
!119 = !DILocation(line: 274, column: 5, scope: !104)
!120 = !DILocation(line: 277, column: 5, scope: !104)
!121 = !DILocation(line: 278, column: 5, scope: !104)
!122 = !DILocation(line: 279, column: 5, scope: !104)
!123 = !DILocation(line: 281, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 73, type: !19, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !11, line: 75, type: !7)
!126 = !DILocation(line: 75, column: 9, scope: !124)
!127 = !DILocation(line: 77, column: 10, scope: !124)
!128 = !DILocation(line: 78, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !11, line: 78, column: 8)
!130 = !DILocation(line: 78, column: 18, scope: !129)
!131 = !DILocation(line: 78, column: 8, scope: !124)
!132 = !DILocation(line: 81, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !11, line: 79, column: 5)
!134 = !DILocation(line: 81, column: 9, scope: !133)
!135 = !DILocation(line: 82, column: 5, scope: !133)
!136 = !DILocation(line: 83, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !124, file: !11, line: 83, column: 8)
!138 = !DILocation(line: 83, column: 18, scope: !137)
!139 = !DILocation(line: 83, column: 8, scope: !124)
!140 = !DILocation(line: 86, column: 9, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !11, line: 84, column: 5)
!142 = !DILocation(line: 87, column: 5, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !144, file: !11, line: 91, type: !7)
!144 = distinct !DILexicalBlock(scope: !145, file: !11, line: 90, column: 9)
!145 = distinct !DILexicalBlock(scope: !137, file: !11, line: 89, column: 5)
!146 = !DILocation(line: 91, column: 17, scope: !144)
!147 = !DILocalVariable(name: "buffer", scope: !144, file: !11, line: 92, type: !6)
!148 = !DILocation(line: 92, column: 19, scope: !144)
!149 = !DILocation(line: 92, column: 35, scope: !144)
!150 = !DILocation(line: 92, column: 28, scope: !144)
!151 = !DILocation(line: 93, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !144, file: !11, line: 93, column: 17)
!153 = !DILocation(line: 93, column: 24, scope: !152)
!154 = !DILocation(line: 93, column: 17, scope: !144)
!155 = !DILocation(line: 93, column: 34, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !11, line: 93, column: 33)
!157 = !DILocation(line: 95, column: 20, scope: !158)
!158 = distinct !DILexicalBlock(scope: !144, file: !11, line: 95, column: 13)
!159 = !DILocation(line: 95, column: 18, scope: !158)
!160 = !DILocation(line: 95, column: 25, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !11, line: 95, column: 13)
!162 = !DILocation(line: 95, column: 27, scope: !161)
!163 = !DILocation(line: 95, column: 13, scope: !158)
!164 = !DILocation(line: 97, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !11, line: 96, column: 13)
!166 = !DILocation(line: 97, column: 24, scope: !165)
!167 = !DILocation(line: 97, column: 27, scope: !165)
!168 = !DILocation(line: 98, column: 13, scope: !165)
!169 = !DILocation(line: 95, column: 34, scope: !161)
!170 = !DILocation(line: 95, column: 13, scope: !161)
!171 = distinct !{!171, !163, !172, !66}
!172 = !DILocation(line: 98, column: 13, scope: !158)
!173 = !DILocation(line: 100, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !144, file: !11, line: 100, column: 17)
!175 = !DILocation(line: 100, column: 22, scope: !174)
!176 = !DILocation(line: 100, column: 27, scope: !174)
!177 = !DILocation(line: 100, column: 30, scope: !174)
!178 = !DILocation(line: 100, column: 35, scope: !174)
!179 = !DILocation(line: 100, column: 17, scope: !144)
!180 = !DILocation(line: 102, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !174, file: !11, line: 101, column: 13)
!182 = !DILocation(line: 102, column: 24, scope: !181)
!183 = !DILocation(line: 102, column: 30, scope: !181)
!184 = !DILocation(line: 104, column: 23, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !11, line: 104, column: 17)
!186 = !DILocation(line: 104, column: 21, scope: !185)
!187 = !DILocation(line: 104, column: 28, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !11, line: 104, column: 17)
!189 = !DILocation(line: 104, column: 30, scope: !188)
!190 = !DILocation(line: 104, column: 17, scope: !185)
!191 = !DILocation(line: 106, column: 34, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !11, line: 105, column: 17)
!193 = !DILocation(line: 106, column: 41, scope: !192)
!194 = !DILocation(line: 106, column: 21, scope: !192)
!195 = !DILocation(line: 107, column: 17, scope: !192)
!196 = !DILocation(line: 104, column: 37, scope: !188)
!197 = !DILocation(line: 104, column: 17, scope: !188)
!198 = distinct !{!198, !190, !199, !66}
!199 = !DILocation(line: 107, column: 17, scope: !185)
!200 = !DILocation(line: 108, column: 13, scope: !181)
!201 = !DILocation(line: 111, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !174, file: !11, line: 110, column: 13)
!203 = !DILocation(line: 113, column: 18, scope: !144)
!204 = !DILocation(line: 113, column: 13, scope: !144)
!205 = !DILocation(line: 116, column: 1, scope: !124)
!206 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 119, type: !19, scopeLine: 120, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!207 = !DILocalVariable(name: "data", scope: !206, file: !11, line: 121, type: !7)
!208 = !DILocation(line: 121, column: 9, scope: !206)
!209 = !DILocation(line: 123, column: 10, scope: !206)
!210 = !DILocation(line: 124, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !11, line: 124, column: 8)
!212 = !DILocation(line: 124, column: 18, scope: !211)
!213 = !DILocation(line: 124, column: 8, scope: !206)
!214 = !DILocation(line: 127, column: 16, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !11, line: 125, column: 5)
!216 = !DILocation(line: 127, column: 9, scope: !215)
!217 = !DILocation(line: 128, column: 5, scope: !215)
!218 = !DILocation(line: 129, column: 8, scope: !219)
!219 = distinct !DILexicalBlock(scope: !206, file: !11, line: 129, column: 8)
!220 = !DILocation(line: 129, column: 18, scope: !219)
!221 = !DILocation(line: 129, column: 8, scope: !206)
!222 = !DILocalVariable(name: "i", scope: !223, file: !11, line: 132, type: !7)
!223 = distinct !DILexicalBlock(scope: !224, file: !11, line: 131, column: 9)
!224 = distinct !DILexicalBlock(scope: !219, file: !11, line: 130, column: 5)
!225 = !DILocation(line: 132, column: 17, scope: !223)
!226 = !DILocalVariable(name: "buffer", scope: !223, file: !11, line: 133, type: !6)
!227 = !DILocation(line: 133, column: 19, scope: !223)
!228 = !DILocation(line: 133, column: 35, scope: !223)
!229 = !DILocation(line: 133, column: 28, scope: !223)
!230 = !DILocation(line: 134, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !223, file: !11, line: 134, column: 17)
!232 = !DILocation(line: 134, column: 24, scope: !231)
!233 = !DILocation(line: 134, column: 17, scope: !223)
!234 = !DILocation(line: 134, column: 34, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !11, line: 134, column: 33)
!236 = !DILocation(line: 136, column: 20, scope: !237)
!237 = distinct !DILexicalBlock(scope: !223, file: !11, line: 136, column: 13)
!238 = !DILocation(line: 136, column: 18, scope: !237)
!239 = !DILocation(line: 136, column: 25, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !11, line: 136, column: 13)
!241 = !DILocation(line: 136, column: 27, scope: !240)
!242 = !DILocation(line: 136, column: 13, scope: !237)
!243 = !DILocation(line: 138, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !11, line: 137, column: 13)
!245 = !DILocation(line: 138, column: 24, scope: !244)
!246 = !DILocation(line: 138, column: 27, scope: !244)
!247 = !DILocation(line: 139, column: 13, scope: !244)
!248 = !DILocation(line: 136, column: 34, scope: !240)
!249 = !DILocation(line: 136, column: 13, scope: !240)
!250 = distinct !{!250, !242, !251, !66}
!251 = !DILocation(line: 139, column: 13, scope: !237)
!252 = !DILocation(line: 141, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !223, file: !11, line: 141, column: 17)
!254 = !DILocation(line: 141, column: 22, scope: !253)
!255 = !DILocation(line: 141, column: 27, scope: !253)
!256 = !DILocation(line: 141, column: 30, scope: !253)
!257 = !DILocation(line: 141, column: 35, scope: !253)
!258 = !DILocation(line: 141, column: 17, scope: !223)
!259 = !DILocation(line: 143, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !253, file: !11, line: 142, column: 13)
!261 = !DILocation(line: 143, column: 24, scope: !260)
!262 = !DILocation(line: 143, column: 30, scope: !260)
!263 = !DILocation(line: 145, column: 23, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !11, line: 145, column: 17)
!265 = !DILocation(line: 145, column: 21, scope: !264)
!266 = !DILocation(line: 145, column: 28, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !11, line: 145, column: 17)
!268 = !DILocation(line: 145, column: 30, scope: !267)
!269 = !DILocation(line: 145, column: 17, scope: !264)
!270 = !DILocation(line: 147, column: 34, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !11, line: 146, column: 17)
!272 = !DILocation(line: 147, column: 41, scope: !271)
!273 = !DILocation(line: 147, column: 21, scope: !271)
!274 = !DILocation(line: 148, column: 17, scope: !271)
!275 = !DILocation(line: 145, column: 37, scope: !267)
!276 = !DILocation(line: 145, column: 17, scope: !267)
!277 = distinct !{!277, !269, !278, !66}
!278 = !DILocation(line: 148, column: 17, scope: !264)
!279 = !DILocation(line: 149, column: 13, scope: !260)
!280 = !DILocation(line: 152, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !253, file: !11, line: 151, column: 13)
!282 = !DILocation(line: 154, column: 18, scope: !223)
!283 = !DILocation(line: 154, column: 13, scope: !223)
!284 = !DILocation(line: 156, column: 5, scope: !224)
!285 = !DILocation(line: 157, column: 1, scope: !206)
!286 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 160, type: !19, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!287 = !DILocalVariable(name: "data", scope: !286, file: !11, line: 162, type: !7)
!288 = !DILocation(line: 162, column: 9, scope: !286)
!289 = !DILocation(line: 164, column: 10, scope: !286)
!290 = !DILocation(line: 165, column: 8, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !11, line: 165, column: 8)
!292 = !DILocation(line: 165, column: 18, scope: !291)
!293 = !DILocation(line: 165, column: 8, scope: !286)
!294 = !DILocation(line: 168, column: 9, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !11, line: 166, column: 5)
!296 = !DILocation(line: 169, column: 5, scope: !295)
!297 = !DILocation(line: 174, column: 14, scope: !298)
!298 = distinct !DILexicalBlock(scope: !291, file: !11, line: 171, column: 5)
!299 = !DILocation(line: 176, column: 8, scope: !300)
!300 = distinct !DILexicalBlock(scope: !286, file: !11, line: 176, column: 8)
!301 = !DILocation(line: 176, column: 18, scope: !300)
!302 = !DILocation(line: 176, column: 8, scope: !286)
!303 = !DILocalVariable(name: "i", scope: !304, file: !11, line: 179, type: !7)
!304 = distinct !DILexicalBlock(scope: !305, file: !11, line: 178, column: 9)
!305 = distinct !DILexicalBlock(scope: !300, file: !11, line: 177, column: 5)
!306 = !DILocation(line: 179, column: 17, scope: !304)
!307 = !DILocalVariable(name: "buffer", scope: !304, file: !11, line: 180, type: !6)
!308 = !DILocation(line: 180, column: 19, scope: !304)
!309 = !DILocation(line: 180, column: 35, scope: !304)
!310 = !DILocation(line: 180, column: 28, scope: !304)
!311 = !DILocation(line: 181, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !304, file: !11, line: 181, column: 17)
!313 = !DILocation(line: 181, column: 24, scope: !312)
!314 = !DILocation(line: 181, column: 17, scope: !304)
!315 = !DILocation(line: 181, column: 34, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !11, line: 181, column: 33)
!317 = !DILocation(line: 183, column: 20, scope: !318)
!318 = distinct !DILexicalBlock(scope: !304, file: !11, line: 183, column: 13)
!319 = !DILocation(line: 183, column: 18, scope: !318)
!320 = !DILocation(line: 183, column: 25, scope: !321)
!321 = distinct !DILexicalBlock(scope: !318, file: !11, line: 183, column: 13)
!322 = !DILocation(line: 183, column: 27, scope: !321)
!323 = !DILocation(line: 183, column: 13, scope: !318)
!324 = !DILocation(line: 185, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !11, line: 184, column: 13)
!326 = !DILocation(line: 185, column: 24, scope: !325)
!327 = !DILocation(line: 185, column: 27, scope: !325)
!328 = !DILocation(line: 186, column: 13, scope: !325)
!329 = !DILocation(line: 183, column: 34, scope: !321)
!330 = !DILocation(line: 183, column: 13, scope: !321)
!331 = distinct !{!331, !323, !332, !66}
!332 = !DILocation(line: 186, column: 13, scope: !318)
!333 = !DILocation(line: 189, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !304, file: !11, line: 189, column: 17)
!335 = !DILocation(line: 189, column: 22, scope: !334)
!336 = !DILocation(line: 189, column: 17, scope: !304)
!337 = !DILocation(line: 191, column: 17, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !11, line: 190, column: 13)
!339 = !DILocation(line: 191, column: 24, scope: !338)
!340 = !DILocation(line: 191, column: 30, scope: !338)
!341 = !DILocation(line: 193, column: 23, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !11, line: 193, column: 17)
!343 = !DILocation(line: 193, column: 21, scope: !342)
!344 = !DILocation(line: 193, column: 28, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !11, line: 193, column: 17)
!346 = !DILocation(line: 193, column: 30, scope: !345)
!347 = !DILocation(line: 193, column: 17, scope: !342)
!348 = !DILocation(line: 195, column: 34, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !11, line: 194, column: 17)
!350 = !DILocation(line: 195, column: 41, scope: !349)
!351 = !DILocation(line: 195, column: 21, scope: !349)
!352 = !DILocation(line: 196, column: 17, scope: !349)
!353 = !DILocation(line: 193, column: 37, scope: !345)
!354 = !DILocation(line: 193, column: 17, scope: !345)
!355 = distinct !{!355, !347, !356, !66}
!356 = !DILocation(line: 196, column: 17, scope: !342)
!357 = !DILocation(line: 197, column: 13, scope: !338)
!358 = !DILocation(line: 200, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !334, file: !11, line: 199, column: 13)
!360 = !DILocation(line: 202, column: 18, scope: !304)
!361 = !DILocation(line: 202, column: 13, scope: !304)
!362 = !DILocation(line: 204, column: 5, scope: !305)
!363 = !DILocation(line: 205, column: 1, scope: !286)
!364 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 208, type: !19, scopeLine: 209, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!365 = !DILocalVariable(name: "data", scope: !364, file: !11, line: 210, type: !7)
!366 = !DILocation(line: 210, column: 9, scope: !364)
!367 = !DILocation(line: 212, column: 10, scope: !364)
!368 = !DILocation(line: 213, column: 8, scope: !369)
!369 = distinct !DILexicalBlock(scope: !364, file: !11, line: 213, column: 8)
!370 = !DILocation(line: 213, column: 18, scope: !369)
!371 = !DILocation(line: 213, column: 8, scope: !364)
!372 = !DILocation(line: 217, column: 14, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !11, line: 214, column: 5)
!374 = !DILocation(line: 218, column: 5, scope: !373)
!375 = !DILocation(line: 219, column: 8, scope: !376)
!376 = distinct !DILexicalBlock(scope: !364, file: !11, line: 219, column: 8)
!377 = !DILocation(line: 219, column: 18, scope: !376)
!378 = !DILocation(line: 219, column: 8, scope: !364)
!379 = !DILocalVariable(name: "i", scope: !380, file: !11, line: 222, type: !7)
!380 = distinct !DILexicalBlock(scope: !381, file: !11, line: 221, column: 9)
!381 = distinct !DILexicalBlock(scope: !376, file: !11, line: 220, column: 5)
!382 = !DILocation(line: 222, column: 17, scope: !380)
!383 = !DILocalVariable(name: "buffer", scope: !380, file: !11, line: 223, type: !6)
!384 = !DILocation(line: 223, column: 19, scope: !380)
!385 = !DILocation(line: 223, column: 35, scope: !380)
!386 = !DILocation(line: 223, column: 28, scope: !380)
!387 = !DILocation(line: 224, column: 17, scope: !388)
!388 = distinct !DILexicalBlock(scope: !380, file: !11, line: 224, column: 17)
!389 = !DILocation(line: 224, column: 24, scope: !388)
!390 = !DILocation(line: 224, column: 17, scope: !380)
!391 = !DILocation(line: 224, column: 34, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !11, line: 224, column: 33)
!393 = !DILocation(line: 226, column: 20, scope: !394)
!394 = distinct !DILexicalBlock(scope: !380, file: !11, line: 226, column: 13)
!395 = !DILocation(line: 226, column: 18, scope: !394)
!396 = !DILocation(line: 226, column: 25, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !11, line: 226, column: 13)
!398 = !DILocation(line: 226, column: 27, scope: !397)
!399 = !DILocation(line: 226, column: 13, scope: !394)
!400 = !DILocation(line: 228, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !11, line: 227, column: 13)
!402 = !DILocation(line: 228, column: 24, scope: !401)
!403 = !DILocation(line: 228, column: 27, scope: !401)
!404 = !DILocation(line: 229, column: 13, scope: !401)
!405 = !DILocation(line: 226, column: 34, scope: !397)
!406 = !DILocation(line: 226, column: 13, scope: !397)
!407 = distinct !{!407, !399, !408, !66}
!408 = !DILocation(line: 229, column: 13, scope: !394)
!409 = !DILocation(line: 232, column: 17, scope: !410)
!410 = distinct !DILexicalBlock(scope: !380, file: !11, line: 232, column: 17)
!411 = !DILocation(line: 232, column: 22, scope: !410)
!412 = !DILocation(line: 232, column: 17, scope: !380)
!413 = !DILocation(line: 234, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !11, line: 233, column: 13)
!415 = !DILocation(line: 234, column: 24, scope: !414)
!416 = !DILocation(line: 234, column: 30, scope: !414)
!417 = !DILocation(line: 236, column: 23, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !11, line: 236, column: 17)
!419 = !DILocation(line: 236, column: 21, scope: !418)
!420 = !DILocation(line: 236, column: 28, scope: !421)
!421 = distinct !DILexicalBlock(scope: !418, file: !11, line: 236, column: 17)
!422 = !DILocation(line: 236, column: 30, scope: !421)
!423 = !DILocation(line: 236, column: 17, scope: !418)
!424 = !DILocation(line: 238, column: 34, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !11, line: 237, column: 17)
!426 = !DILocation(line: 238, column: 41, scope: !425)
!427 = !DILocation(line: 238, column: 21, scope: !425)
!428 = !DILocation(line: 239, column: 17, scope: !425)
!429 = !DILocation(line: 236, column: 37, scope: !421)
!430 = !DILocation(line: 236, column: 17, scope: !421)
!431 = distinct !{!431, !423, !432, !66}
!432 = !DILocation(line: 239, column: 17, scope: !418)
!433 = !DILocation(line: 240, column: 13, scope: !414)
!434 = !DILocation(line: 243, column: 17, scope: !435)
!435 = distinct !DILexicalBlock(scope: !410, file: !11, line: 242, column: 13)
!436 = !DILocation(line: 245, column: 18, scope: !380)
!437 = !DILocation(line: 245, column: 13, scope: !380)
!438 = !DILocation(line: 247, column: 5, scope: !381)
!439 = !DILocation(line: 248, column: 1, scope: !364)
