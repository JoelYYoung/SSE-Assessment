; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !26
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !27
  %1 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !28
  %2 = load i32, i32* %data, align 4, !dbg !29
  call void %1(i32 %2), !dbg !28
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !31 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !37, metadata !DIExpression()), !dbg !38
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !39
  %0 = bitcast i8* %call to i32*, !dbg !40
  store i32* %0, i32** %buffer, align 8, !dbg !38
  %1 = load i32*, i32** %buffer, align 8, !dbg !41
  %cmp = icmp eq i32* %1, null, !dbg !43
  br i1 %cmp, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !45
  unreachable, !dbg !45

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !50
  %cmp1 = icmp slt i32 %2, 10, !dbg !52
  br i1 %cmp1, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !54
  %4 = load i32, i32* %i, align 4, !dbg !56
  %idxprom = sext i32 %4 to i64, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %5, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !64
  %cmp2 = icmp sge i32 %6, 0, !dbg !66
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !67

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !68
  %8 = load i32, i32* %data.addr, align 4, !dbg !70
  %idxprom4 = sext i32 %8 to i64, !dbg !68
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !68
  store i32 1, i32* %arrayidx5, align 4, !dbg !71
  store i32 0, i32* %i, align 4, !dbg !72
  br label %for.cond6, !dbg !74

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !75
  %cmp7 = icmp slt i32 %9, 10, !dbg !77
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !78

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !79
  %11 = load i32, i32* %i, align 4, !dbg !81
  %idxprom9 = sext i32 %11 to i64, !dbg !79
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !79
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !79
  call void @printIntLine(i32 %12), !dbg !82
  br label %for.inc11, !dbg !83

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !84
  %inc12 = add nsw i32 %13, 1, !dbg !84
  store i32 %inc12, i32* %i, align 4, !dbg !84
  br label %for.cond6, !dbg !85, !llvm.loop !86

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !88

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !89
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !91
  %15 = bitcast i32* %14 to i8*, !dbg !91
  call void @free(i8* %15) #5, !dbg !92
  ret void, !dbg !93
}

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  call void @goodB2G(), !dbg !96
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #5, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #5, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !121, metadata !DIExpression()), !dbg !122
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !122
  store i32 -1, i32* %data, align 4, !dbg !123
  store i32 7, i32* %data, align 4, !dbg !124
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !125
  %1 = load i32, i32* %data, align 4, !dbg !126
  call void %0(i32 %1), !dbg !125
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !128 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32* %i, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !134, metadata !DIExpression()), !dbg !135
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !136
  %0 = bitcast i8* %call to i32*, !dbg !137
  store i32* %0, i32** %buffer, align 8, !dbg !135
  %1 = load i32*, i32** %buffer, align 8, !dbg !138
  %cmp = icmp eq i32* %1, null, !dbg !140
  br i1 %cmp, label %if.then, label %if.end, !dbg !141

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !147
  %cmp1 = icmp slt i32 %2, 10, !dbg !149
  br i1 %cmp1, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !151
  %4 = load i32, i32* %i, align 4, !dbg !153
  %idxprom = sext i32 %4 to i64, !dbg !151
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !151
  store i32 0, i32* %arrayidx, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !156
  %inc = add nsw i32 %5, 1, !dbg !156
  store i32 %inc, i32* %i, align 4, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !160
  %cmp2 = icmp sge i32 %6, 0, !dbg !162
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !163

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !164
  %8 = load i32, i32* %data.addr, align 4, !dbg !166
  %idxprom4 = sext i32 %8 to i64, !dbg !164
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !164
  store i32 1, i32* %arrayidx5, align 4, !dbg !167
  store i32 0, i32* %i, align 4, !dbg !168
  br label %for.cond6, !dbg !170

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !171
  %cmp7 = icmp slt i32 %9, 10, !dbg !173
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !174

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !175
  %11 = load i32, i32* %i, align 4, !dbg !177
  %idxprom9 = sext i32 %11 to i64, !dbg !175
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !175
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !175
  call void @printIntLine(i32 %12), !dbg !178
  br label %for.inc11, !dbg !179

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !180
  %inc12 = add nsw i32 %13, 1, !dbg !180
  store i32 %inc12, i32* %i, align 4, !dbg !180
  br label %for.cond6, !dbg !181, !llvm.loop !182

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !184

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !185
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !187
  %15 = bitcast i32* %14 to i8*, !dbg !187
  call void @free(i8* %15) #5, !dbg !188
  ret void, !dbg !189
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !190 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !191, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !193, metadata !DIExpression()), !dbg !194
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !194
  store i32 -1, i32* %data, align 4, !dbg !195
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !196
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !197
  %1 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !198
  %2 = load i32, i32* %data, align 4, !dbg !199
  call void %1(i32 %2), !dbg !198
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !201 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !202, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i32* %i, metadata !204, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !207, metadata !DIExpression()), !dbg !208
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !209
  %0 = bitcast i8* %call to i32*, !dbg !210
  store i32* %0, i32** %buffer, align 8, !dbg !208
  %1 = load i32*, i32** %buffer, align 8, !dbg !211
  %cmp = icmp eq i32* %1, null, !dbg !213
  br i1 %cmp, label %if.then, label %if.end, !dbg !214

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !215
  unreachable, !dbg !215

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !217
  br label %for.cond, !dbg !219

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !220
  %cmp1 = icmp slt i32 %2, 10, !dbg !222
  br i1 %cmp1, label %for.body, label %for.end, !dbg !223

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !224
  %4 = load i32, i32* %i, align 4, !dbg !226
  %idxprom = sext i32 %4 to i64, !dbg !224
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !224
  store i32 0, i32* %arrayidx, align 4, !dbg !227
  br label %for.inc, !dbg !228

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !229
  %inc = add nsw i32 %5, 1, !dbg !229
  store i32 %inc, i32* %i, align 4, !dbg !229
  br label %for.cond, !dbg !230, !llvm.loop !231

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !233
  %cmp2 = icmp sge i32 %6, 0, !dbg !235
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !236

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !237
  %cmp3 = icmp slt i32 %7, 10, !dbg !238
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !239

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !240
  %9 = load i32, i32* %data.addr, align 4, !dbg !242
  %idxprom5 = sext i32 %9 to i64, !dbg !240
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !240
  store i32 1, i32* %arrayidx6, align 4, !dbg !243
  store i32 0, i32* %i, align 4, !dbg !244
  br label %for.cond7, !dbg !246

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !247
  %cmp8 = icmp slt i32 %10, 10, !dbg !249
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !250

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !251
  %12 = load i32, i32* %i, align 4, !dbg !253
  %idxprom10 = sext i32 %12 to i64, !dbg !251
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !251
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !251
  call void @printIntLine(i32 %13), !dbg !254
  br label %for.inc12, !dbg !255

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !256
  %inc13 = add nsw i32 %14, 1, !dbg !256
  store i32 %inc13, i32* %i, align 4, !dbg !256
  br label %for.cond7, !dbg !257, !llvm.loop !258

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !260

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !261
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !263
  %16 = bitcast i32* %15 to i8*, !dbg !263
  call void @free(i8* %16) #5, !dbg !264
  ret void, !dbg !265
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44_bad", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 54, type: !6)
!19 = !DILocation(line: 54, column: 9, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 56, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !6}
!24 = !DILocation(line: 56, column: 12, scope: !14)
!25 = !DILocation(line: 58, column: 10, scope: !14)
!26 = !DILocation(line: 60, column: 12, scope: !14)
!27 = !DILocation(line: 60, column: 5, scope: !14)
!28 = !DILocation(line: 62, column: 5, scope: !14)
!29 = !DILocation(line: 62, column: 13, scope: !14)
!30 = !DILocation(line: 63, column: 1, scope: !14)
!31 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 22, type: !22, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DILocalVariable(name: "data", arg: 1, scope: !31, file: !15, line: 22, type: !6)
!33 = !DILocation(line: 22, column: 25, scope: !31)
!34 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 25, type: !6)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 24, column: 5)
!36 = !DILocation(line: 25, column: 13, scope: !35)
!37 = !DILocalVariable(name: "buffer", scope: !35, file: !15, line: 26, type: !5)
!38 = !DILocation(line: 26, column: 15, scope: !35)
!39 = !DILocation(line: 26, column: 31, scope: !35)
!40 = !DILocation(line: 26, column: 24, scope: !35)
!41 = !DILocation(line: 27, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !15, line: 27, column: 13)
!43 = !DILocation(line: 27, column: 20, scope: !42)
!44 = !DILocation(line: 27, column: 13, scope: !35)
!45 = !DILocation(line: 27, column: 30, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 27, column: 29)
!47 = !DILocation(line: 29, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !35, file: !15, line: 29, column: 9)
!49 = !DILocation(line: 29, column: 14, scope: !48)
!50 = !DILocation(line: 29, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 29, column: 9)
!52 = !DILocation(line: 29, column: 23, scope: !51)
!53 = !DILocation(line: 29, column: 9, scope: !48)
!54 = !DILocation(line: 31, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 30, column: 9)
!56 = !DILocation(line: 31, column: 20, scope: !55)
!57 = !DILocation(line: 31, column: 23, scope: !55)
!58 = !DILocation(line: 32, column: 9, scope: !55)
!59 = !DILocation(line: 29, column: 30, scope: !51)
!60 = !DILocation(line: 29, column: 9, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 32, column: 9, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 35, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !35, file: !15, line: 35, column: 13)
!66 = !DILocation(line: 35, column: 18, scope: !65)
!67 = !DILocation(line: 35, column: 13, scope: !35)
!68 = !DILocation(line: 37, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 36, column: 9)
!70 = !DILocation(line: 37, column: 20, scope: !69)
!71 = !DILocation(line: 37, column: 26, scope: !69)
!72 = !DILocation(line: 39, column: 19, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 39, column: 13)
!74 = !DILocation(line: 39, column: 17, scope: !73)
!75 = !DILocation(line: 39, column: 24, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !15, line: 39, column: 13)
!77 = !DILocation(line: 39, column: 26, scope: !76)
!78 = !DILocation(line: 39, column: 13, scope: !73)
!79 = !DILocation(line: 41, column: 30, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 40, column: 13)
!81 = !DILocation(line: 41, column: 37, scope: !80)
!82 = !DILocation(line: 41, column: 17, scope: !80)
!83 = !DILocation(line: 42, column: 13, scope: !80)
!84 = !DILocation(line: 39, column: 33, scope: !76)
!85 = !DILocation(line: 39, column: 13, scope: !76)
!86 = distinct !{!86, !78, !87, !63}
!87 = !DILocation(line: 42, column: 13, scope: !73)
!88 = !DILocation(line: 43, column: 9, scope: !69)
!89 = !DILocation(line: 46, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !65, file: !15, line: 45, column: 9)
!91 = !DILocation(line: 48, column: 14, scope: !35)
!92 = !DILocation(line: 48, column: 9, scope: !35)
!93 = !DILocation(line: 50, column: 1, scope: !31)
!94 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_44_good", scope: !15, file: !15, line: 153, type: !16, scopeLine: 154, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocation(line: 155, column: 5, scope: !94)
!96 = !DILocation(line: 156, column: 5, scope: !94)
!97 = !DILocation(line: 157, column: 1, scope: !94)
!98 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 167, type: !99, scopeLine: 168, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!6, !6, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !15, line: 167, type: !6)
!105 = !DILocation(line: 167, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !15, line: 167, type: !101)
!107 = !DILocation(line: 167, column: 27, scope: !98)
!108 = !DILocation(line: 170, column: 22, scope: !98)
!109 = !DILocation(line: 170, column: 12, scope: !98)
!110 = !DILocation(line: 170, column: 5, scope: !98)
!111 = !DILocation(line: 172, column: 5, scope: !98)
!112 = !DILocation(line: 173, column: 5, scope: !98)
!113 = !DILocation(line: 174, column: 5, scope: !98)
!114 = !DILocation(line: 177, column: 5, scope: !98)
!115 = !DILocation(line: 178, column: 5, scope: !98)
!116 = !DILocation(line: 179, column: 5, scope: !98)
!117 = !DILocation(line: 181, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !15, line: 102, type: !6)
!120 = !DILocation(line: 102, column: 9, scope: !118)
!121 = !DILocalVariable(name: "funcPtr", scope: !118, file: !15, line: 103, type: !21)
!122 = !DILocation(line: 103, column: 12, scope: !118)
!123 = !DILocation(line: 105, column: 10, scope: !118)
!124 = !DILocation(line: 108, column: 10, scope: !118)
!125 = !DILocation(line: 109, column: 5, scope: !118)
!126 = !DILocation(line: 109, column: 13, scope: !118)
!127 = !DILocation(line: 110, column: 1, scope: !118)
!128 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 70, type: !22, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", arg: 1, scope: !128, file: !15, line: 70, type: !6)
!130 = !DILocation(line: 70, column: 29, scope: !128)
!131 = !DILocalVariable(name: "i", scope: !132, file: !15, line: 73, type: !6)
!132 = distinct !DILexicalBlock(scope: !128, file: !15, line: 72, column: 5)
!133 = !DILocation(line: 73, column: 13, scope: !132)
!134 = !DILocalVariable(name: "buffer", scope: !132, file: !15, line: 74, type: !5)
!135 = !DILocation(line: 74, column: 15, scope: !132)
!136 = !DILocation(line: 74, column: 31, scope: !132)
!137 = !DILocation(line: 74, column: 24, scope: !132)
!138 = !DILocation(line: 75, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !132, file: !15, line: 75, column: 13)
!140 = !DILocation(line: 75, column: 20, scope: !139)
!141 = !DILocation(line: 75, column: 13, scope: !132)
!142 = !DILocation(line: 75, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !15, line: 75, column: 29)
!144 = !DILocation(line: 77, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !132, file: !15, line: 77, column: 9)
!146 = !DILocation(line: 77, column: 14, scope: !145)
!147 = !DILocation(line: 77, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !15, line: 77, column: 9)
!149 = !DILocation(line: 77, column: 23, scope: !148)
!150 = !DILocation(line: 77, column: 9, scope: !145)
!151 = !DILocation(line: 79, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !15, line: 78, column: 9)
!153 = !DILocation(line: 79, column: 20, scope: !152)
!154 = !DILocation(line: 79, column: 23, scope: !152)
!155 = !DILocation(line: 80, column: 9, scope: !152)
!156 = !DILocation(line: 77, column: 30, scope: !148)
!157 = !DILocation(line: 77, column: 9, scope: !148)
!158 = distinct !{!158, !150, !159, !63}
!159 = !DILocation(line: 80, column: 9, scope: !145)
!160 = !DILocation(line: 83, column: 13, scope: !161)
!161 = distinct !DILexicalBlock(scope: !132, file: !15, line: 83, column: 13)
!162 = !DILocation(line: 83, column: 18, scope: !161)
!163 = !DILocation(line: 83, column: 13, scope: !132)
!164 = !DILocation(line: 85, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 84, column: 9)
!166 = !DILocation(line: 85, column: 20, scope: !165)
!167 = !DILocation(line: 85, column: 26, scope: !165)
!168 = !DILocation(line: 87, column: 19, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !15, line: 87, column: 13)
!170 = !DILocation(line: 87, column: 17, scope: !169)
!171 = !DILocation(line: 87, column: 24, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !15, line: 87, column: 13)
!173 = !DILocation(line: 87, column: 26, scope: !172)
!174 = !DILocation(line: 87, column: 13, scope: !169)
!175 = !DILocation(line: 89, column: 30, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 88, column: 13)
!177 = !DILocation(line: 89, column: 37, scope: !176)
!178 = !DILocation(line: 89, column: 17, scope: !176)
!179 = !DILocation(line: 90, column: 13, scope: !176)
!180 = !DILocation(line: 87, column: 33, scope: !172)
!181 = !DILocation(line: 87, column: 13, scope: !172)
!182 = distinct !{!182, !174, !183, !63}
!183 = !DILocation(line: 90, column: 13, scope: !169)
!184 = !DILocation(line: 91, column: 9, scope: !165)
!185 = !DILocation(line: 94, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !161, file: !15, line: 93, column: 9)
!187 = !DILocation(line: 96, column: 14, scope: !132)
!188 = !DILocation(line: 96, column: 9, scope: !132)
!189 = !DILocation(line: 98, column: 1, scope: !128)
!190 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 142, type: !16, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!191 = !DILocalVariable(name: "data", scope: !190, file: !15, line: 144, type: !6)
!192 = !DILocation(line: 144, column: 9, scope: !190)
!193 = !DILocalVariable(name: "funcPtr", scope: !190, file: !15, line: 145, type: !21)
!194 = !DILocation(line: 145, column: 12, scope: !190)
!195 = !DILocation(line: 147, column: 10, scope: !190)
!196 = !DILocation(line: 149, column: 12, scope: !190)
!197 = !DILocation(line: 149, column: 5, scope: !190)
!198 = !DILocation(line: 150, column: 5, scope: !190)
!199 = !DILocation(line: 150, column: 13, scope: !190)
!200 = !DILocation(line: 151, column: 1, scope: !190)
!201 = distinct !DISubprogram(name: "goodB2GSink", scope: !15, file: !15, line: 113, type: !22, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!202 = !DILocalVariable(name: "data", arg: 1, scope: !201, file: !15, line: 113, type: !6)
!203 = !DILocation(line: 113, column: 29, scope: !201)
!204 = !DILocalVariable(name: "i", scope: !205, file: !15, line: 116, type: !6)
!205 = distinct !DILexicalBlock(scope: !201, file: !15, line: 115, column: 5)
!206 = !DILocation(line: 116, column: 13, scope: !205)
!207 = !DILocalVariable(name: "buffer", scope: !205, file: !15, line: 117, type: !5)
!208 = !DILocation(line: 117, column: 15, scope: !205)
!209 = !DILocation(line: 117, column: 31, scope: !205)
!210 = !DILocation(line: 117, column: 24, scope: !205)
!211 = !DILocation(line: 118, column: 13, scope: !212)
!212 = distinct !DILexicalBlock(scope: !205, file: !15, line: 118, column: 13)
!213 = !DILocation(line: 118, column: 20, scope: !212)
!214 = !DILocation(line: 118, column: 13, scope: !205)
!215 = !DILocation(line: 118, column: 30, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !15, line: 118, column: 29)
!217 = !DILocation(line: 120, column: 16, scope: !218)
!218 = distinct !DILexicalBlock(scope: !205, file: !15, line: 120, column: 9)
!219 = !DILocation(line: 120, column: 14, scope: !218)
!220 = !DILocation(line: 120, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !15, line: 120, column: 9)
!222 = !DILocation(line: 120, column: 23, scope: !221)
!223 = !DILocation(line: 120, column: 9, scope: !218)
!224 = !DILocation(line: 122, column: 13, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !15, line: 121, column: 9)
!226 = !DILocation(line: 122, column: 20, scope: !225)
!227 = !DILocation(line: 122, column: 23, scope: !225)
!228 = !DILocation(line: 123, column: 9, scope: !225)
!229 = !DILocation(line: 120, column: 30, scope: !221)
!230 = !DILocation(line: 120, column: 9, scope: !221)
!231 = distinct !{!231, !223, !232, !63}
!232 = !DILocation(line: 123, column: 9, scope: !218)
!233 = !DILocation(line: 125, column: 13, scope: !234)
!234 = distinct !DILexicalBlock(scope: !205, file: !15, line: 125, column: 13)
!235 = !DILocation(line: 125, column: 18, scope: !234)
!236 = !DILocation(line: 125, column: 23, scope: !234)
!237 = !DILocation(line: 125, column: 26, scope: !234)
!238 = !DILocation(line: 125, column: 31, scope: !234)
!239 = !DILocation(line: 125, column: 13, scope: !205)
!240 = !DILocation(line: 127, column: 13, scope: !241)
!241 = distinct !DILexicalBlock(scope: !234, file: !15, line: 126, column: 9)
!242 = !DILocation(line: 127, column: 20, scope: !241)
!243 = !DILocation(line: 127, column: 26, scope: !241)
!244 = !DILocation(line: 129, column: 19, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !15, line: 129, column: 13)
!246 = !DILocation(line: 129, column: 17, scope: !245)
!247 = !DILocation(line: 129, column: 24, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !15, line: 129, column: 13)
!249 = !DILocation(line: 129, column: 26, scope: !248)
!250 = !DILocation(line: 129, column: 13, scope: !245)
!251 = !DILocation(line: 131, column: 30, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !15, line: 130, column: 13)
!253 = !DILocation(line: 131, column: 37, scope: !252)
!254 = !DILocation(line: 131, column: 17, scope: !252)
!255 = !DILocation(line: 132, column: 13, scope: !252)
!256 = !DILocation(line: 129, column: 33, scope: !248)
!257 = !DILocation(line: 129, column: 13, scope: !248)
!258 = distinct !{!258, !250, !259, !63}
!259 = !DILocation(line: 132, column: 13, scope: !245)
!260 = !DILocation(line: 133, column: 9, scope: !241)
!261 = !DILocation(line: 136, column: 13, scope: !262)
!262 = distinct !DILexicalBlock(scope: !234, file: !15, line: 135, column: 9)
!263 = !DILocation(line: 138, column: 14, scope: !205)
!264 = !DILocation(line: 138, column: 9, scope: !205)
!265 = !DILocation(line: 140, column: 1, scope: !201)
