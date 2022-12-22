; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* %data, i32** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* %data, i32** %dataPtr2, align 8, !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !25, metadata !DIExpression()), !dbg !27
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !28
  %1 = load i32, i32* %0, align 4, !dbg !29
  store i32 %1, i32* %data1, align 4, !dbg !27
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !30
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data1), !dbg !31
  %3 = load i32, i32* %data1, align 4, !dbg !32
  %4 = load i32*, i32** %dataPtr1, align 8, !dbg !33
  store i32 %3, i32* %4, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !35, metadata !DIExpression()), !dbg !37
  %5 = load i32*, i32** %dataPtr2, align 8, !dbg !38
  %6 = load i32, i32* %5, align 4, !dbg !39
  store i32 %6, i32* %data2, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %i, metadata !40, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !43, metadata !DIExpression()), !dbg !44
  %call3 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !45
  %7 = bitcast i8* %call3 to i32*, !dbg !46
  store i32* %7, i32** %buffer, align 8, !dbg !44
  %8 = load i32*, i32** %buffer, align 8, !dbg !47
  %cmp = icmp eq i32* %8, null, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !51
  unreachable, !dbg !51

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i32, i32* %i, align 4, !dbg !56
  %cmp4 = icmp slt i32 %9, 10, !dbg !58
  br i1 %cmp4, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %buffer, align 8, !dbg !60
  %11 = load i32, i32* %i, align 4, !dbg !62
  %idxprom = sext i32 %11 to i64, !dbg !60
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 %idxprom, !dbg !60
  store i32 0, i32* %arrayidx, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !65
  %inc = add nsw i32 %12, 1, !dbg !65
  store i32 %inc, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %13 = load i32, i32* %data2, align 4, !dbg !70
  %cmp5 = icmp sge i32 %13, 0, !dbg !72
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !73

if.then6:                                         ; preds = %for.end
  %14 = load i32*, i32** %buffer, align 8, !dbg !74
  %15 = load i32, i32* %data2, align 4, !dbg !76
  %idxprom7 = sext i32 %15 to i64, !dbg !74
  %arrayidx8 = getelementptr inbounds i32, i32* %14, i64 %idxprom7, !dbg !74
  store i32 1, i32* %arrayidx8, align 4, !dbg !77
  store i32 0, i32* %i, align 4, !dbg !78
  br label %for.cond9, !dbg !80

for.cond9:                                        ; preds = %for.inc14, %if.then6
  %16 = load i32, i32* %i, align 4, !dbg !81
  %cmp10 = icmp slt i32 %16, 10, !dbg !83
  br i1 %cmp10, label %for.body11, label %for.end16, !dbg !84

for.body11:                                       ; preds = %for.cond9
  %17 = load i32*, i32** %buffer, align 8, !dbg !85
  %18 = load i32, i32* %i, align 4, !dbg !87
  %idxprom12 = sext i32 %18 to i64, !dbg !85
  %arrayidx13 = getelementptr inbounds i32, i32* %17, i64 %idxprom12, !dbg !85
  %19 = load i32, i32* %arrayidx13, align 4, !dbg !85
  call void @printIntLine(i32 %19), !dbg !88
  br label %for.inc14, !dbg !89

for.inc14:                                        ; preds = %for.body11
  %20 = load i32, i32* %i, align 4, !dbg !90
  %inc15 = add nsw i32 %20, 1, !dbg !90
  store i32 %inc15, i32* %i, align 4, !dbg !90
  br label %for.cond9, !dbg !91, !llvm.loop !92

for.end16:                                        ; preds = %for.cond9
  br label %if.end17, !dbg !94

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  br label %if.end17

if.end17:                                         ; preds = %if.else, %for.end16
  %21 = load i32*, i32** %buffer, align 8, !dbg !97
  %22 = bitcast i32* %21 to i8*, !dbg !97
  call void @free(i8* %22) #5, !dbg !98
  ret void, !dbg !99
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32_good() #0 !dbg !100 {
entry:
  call void @goodG2B(), !dbg !101
  call void @goodB2G(), !dbg !102
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !127, metadata !DIExpression()), !dbg !128
  store i32* %data, i32** %dataPtr1, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !129, metadata !DIExpression()), !dbg !130
  store i32* %data, i32** %dataPtr2, align 8, !dbg !130
  store i32 -1, i32* %data, align 4, !dbg !131
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !132, metadata !DIExpression()), !dbg !134
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !135
  %1 = load i32, i32* %0, align 4, !dbg !136
  store i32 %1, i32* %data1, align 4, !dbg !134
  store i32 7, i32* %data1, align 4, !dbg !137
  %2 = load i32, i32* %data1, align 4, !dbg !138
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !139
  store i32 %2, i32* %3, align 4, !dbg !140
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !141, metadata !DIExpression()), !dbg !143
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !144
  %5 = load i32, i32* %4, align 4, !dbg !145
  store i32 %5, i32* %data2, align 4, !dbg !143
  call void @llvm.dbg.declare(metadata i32* %i, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !149, metadata !DIExpression()), !dbg !150
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !151
  %6 = bitcast i8* %call to i32*, !dbg !152
  store i32* %6, i32** %buffer, align 8, !dbg !150
  %7 = load i32*, i32** %buffer, align 8, !dbg !153
  %cmp = icmp eq i32* %7, null, !dbg !155
  br i1 %cmp, label %if.then, label %if.end, !dbg !156

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !157
  unreachable, !dbg !157

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !162
  %cmp3 = icmp slt i32 %8, 10, !dbg !164
  br i1 %cmp3, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %buffer, align 8, !dbg !166
  %10 = load i32, i32* %i, align 4, !dbg !168
  %idxprom = sext i32 %10 to i64, !dbg !166
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !166
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !171
  %inc = add nsw i32 %11, 1, !dbg !171
  store i32 %inc, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %data2, align 4, !dbg !175
  %cmp4 = icmp sge i32 %12, 0, !dbg !177
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !178

if.then5:                                         ; preds = %for.end
  %13 = load i32*, i32** %buffer, align 8, !dbg !179
  %14 = load i32, i32* %data2, align 4, !dbg !181
  %idxprom6 = sext i32 %14 to i64, !dbg !179
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 %idxprom6, !dbg !179
  store i32 1, i32* %arrayidx7, align 4, !dbg !182
  store i32 0, i32* %i, align 4, !dbg !183
  br label %for.cond8, !dbg !185

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %15 = load i32, i32* %i, align 4, !dbg !186
  %cmp9 = icmp slt i32 %15, 10, !dbg !188
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !189

for.body10:                                       ; preds = %for.cond8
  %16 = load i32*, i32** %buffer, align 8, !dbg !190
  %17 = load i32, i32* %i, align 4, !dbg !192
  %idxprom11 = sext i32 %17 to i64, !dbg !190
  %arrayidx12 = getelementptr inbounds i32, i32* %16, i64 %idxprom11, !dbg !190
  %18 = load i32, i32* %arrayidx12, align 4, !dbg !190
  call void @printIntLine(i32 %18), !dbg !193
  br label %for.inc13, !dbg !194

for.inc13:                                        ; preds = %for.body10
  %19 = load i32, i32* %i, align 4, !dbg !195
  %inc14 = add nsw i32 %19, 1, !dbg !195
  store i32 %inc14, i32* %i, align 4, !dbg !195
  br label %for.cond8, !dbg !196, !llvm.loop !197

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !199

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !200
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %20 = load i32*, i32** %buffer, align 8, !dbg !202
  %21 = bitcast i32* %20 to i8*, !dbg !202
  call void @free(i8* %21) #5, !dbg !203
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !205 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !206, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !208, metadata !DIExpression()), !dbg !209
  store i32* %data, i32** %dataPtr1, align 8, !dbg !209
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !210, metadata !DIExpression()), !dbg !211
  store i32* %data, i32** %dataPtr2, align 8, !dbg !211
  store i32 -1, i32* %data, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !213, metadata !DIExpression()), !dbg !215
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !216
  %1 = load i32, i32* %0, align 4, !dbg !217
  store i32 %1, i32* %data1, align 4, !dbg !215
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !218
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data1), !dbg !219
  %3 = load i32, i32* %data1, align 4, !dbg !220
  %4 = load i32*, i32** %dataPtr1, align 8, !dbg !221
  store i32 %3, i32* %4, align 4, !dbg !222
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !223, metadata !DIExpression()), !dbg !225
  %5 = load i32*, i32** %dataPtr2, align 8, !dbg !226
  %6 = load i32, i32* %5, align 4, !dbg !227
  store i32 %6, i32* %data2, align 4, !dbg !225
  call void @llvm.dbg.declare(metadata i32* %i, metadata !228, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !231, metadata !DIExpression()), !dbg !232
  %call3 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !233
  %7 = bitcast i8* %call3 to i32*, !dbg !234
  store i32* %7, i32** %buffer, align 8, !dbg !232
  %8 = load i32*, i32** %buffer, align 8, !dbg !235
  %cmp = icmp eq i32* %8, null, !dbg !237
  br i1 %cmp, label %if.then, label %if.end, !dbg !238

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !239
  unreachable, !dbg !239

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !243

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i32, i32* %i, align 4, !dbg !244
  %cmp4 = icmp slt i32 %9, 10, !dbg !246
  br i1 %cmp4, label %for.body, label %for.end, !dbg !247

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %buffer, align 8, !dbg !248
  %11 = load i32, i32* %i, align 4, !dbg !250
  %idxprom = sext i32 %11 to i64, !dbg !248
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 %idxprom, !dbg !248
  store i32 0, i32* %arrayidx, align 4, !dbg !251
  br label %for.inc, !dbg !252

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !253
  %inc = add nsw i32 %12, 1, !dbg !253
  store i32 %inc, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !254, !llvm.loop !255

for.end:                                          ; preds = %for.cond
  %13 = load i32, i32* %data2, align 4, !dbg !257
  %cmp5 = icmp sge i32 %13, 0, !dbg !259
  br i1 %cmp5, label %land.lhs.true, label %if.else, !dbg !260

land.lhs.true:                                    ; preds = %for.end
  %14 = load i32, i32* %data2, align 4, !dbg !261
  %cmp6 = icmp slt i32 %14, 10, !dbg !262
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !263

if.then7:                                         ; preds = %land.lhs.true
  %15 = load i32*, i32** %buffer, align 8, !dbg !264
  %16 = load i32, i32* %data2, align 4, !dbg !266
  %idxprom8 = sext i32 %16 to i64, !dbg !264
  %arrayidx9 = getelementptr inbounds i32, i32* %15, i64 %idxprom8, !dbg !264
  store i32 1, i32* %arrayidx9, align 4, !dbg !267
  store i32 0, i32* %i, align 4, !dbg !268
  br label %for.cond10, !dbg !270

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %17 = load i32, i32* %i, align 4, !dbg !271
  %cmp11 = icmp slt i32 %17, 10, !dbg !273
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !274

for.body12:                                       ; preds = %for.cond10
  %18 = load i32*, i32** %buffer, align 8, !dbg !275
  %19 = load i32, i32* %i, align 4, !dbg !277
  %idxprom13 = sext i32 %19 to i64, !dbg !275
  %arrayidx14 = getelementptr inbounds i32, i32* %18, i64 %idxprom13, !dbg !275
  %20 = load i32, i32* %arrayidx14, align 4, !dbg !275
  call void @printIntLine(i32 %20), !dbg !278
  br label %for.inc15, !dbg !279

for.inc15:                                        ; preds = %for.body12
  %21 = load i32, i32* %i, align 4, !dbg !280
  %inc16 = add nsw i32 %21, 1, !dbg !280
  store i32 %inc16, i32* %i, align 4, !dbg !280
  br label %for.cond10, !dbg !281, !llvm.loop !282

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !284

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !285
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %22 = load i32*, i32** %buffer, align 8, !dbg !287
  %23 = bitcast i32* %22 to i8*, !dbg !287
  call void @free(i8* %23) #5, !dbg !288
  ret void, !dbg !289
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 10, scope: !14)
!22 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 10, scope: !14)
!24 = !DILocation(line: 28, column: 10, scope: !14)
!25 = !DILocalVariable(name: "data", scope: !26, file: !15, line: 30, type: !5)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!27 = !DILocation(line: 30, column: 13, scope: !26)
!28 = !DILocation(line: 30, column: 21, scope: !26)
!29 = !DILocation(line: 30, column: 20, scope: !26)
!30 = !DILocation(line: 32, column: 16, scope: !26)
!31 = !DILocation(line: 32, column: 9, scope: !26)
!32 = !DILocation(line: 33, column: 21, scope: !26)
!33 = !DILocation(line: 33, column: 10, scope: !26)
!34 = !DILocation(line: 33, column: 19, scope: !26)
!35 = !DILocalVariable(name: "data", scope: !36, file: !15, line: 36, type: !5)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!37 = !DILocation(line: 36, column: 13, scope: !36)
!38 = !DILocation(line: 36, column: 21, scope: !36)
!39 = !DILocation(line: 36, column: 20, scope: !36)
!40 = !DILocalVariable(name: "i", scope: !41, file: !15, line: 38, type: !5)
!41 = distinct !DILexicalBlock(scope: !36, file: !15, line: 37, column: 9)
!42 = !DILocation(line: 38, column: 17, scope: !41)
!43 = !DILocalVariable(name: "buffer", scope: !41, file: !15, line: 39, type: !4)
!44 = !DILocation(line: 39, column: 19, scope: !41)
!45 = !DILocation(line: 39, column: 35, scope: !41)
!46 = !DILocation(line: 39, column: 28, scope: !41)
!47 = !DILocation(line: 40, column: 17, scope: !48)
!48 = distinct !DILexicalBlock(scope: !41, file: !15, line: 40, column: 17)
!49 = !DILocation(line: 40, column: 24, scope: !48)
!50 = !DILocation(line: 40, column: 17, scope: !41)
!51 = !DILocation(line: 40, column: 34, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 40, column: 33)
!53 = !DILocation(line: 42, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !41, file: !15, line: 42, column: 13)
!55 = !DILocation(line: 42, column: 18, scope: !54)
!56 = !DILocation(line: 42, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !15, line: 42, column: 13)
!58 = !DILocation(line: 42, column: 27, scope: !57)
!59 = !DILocation(line: 42, column: 13, scope: !54)
!60 = !DILocation(line: 44, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 43, column: 13)
!62 = !DILocation(line: 44, column: 24, scope: !61)
!63 = !DILocation(line: 44, column: 27, scope: !61)
!64 = !DILocation(line: 45, column: 13, scope: !61)
!65 = !DILocation(line: 42, column: 34, scope: !57)
!66 = !DILocation(line: 42, column: 13, scope: !57)
!67 = distinct !{!67, !59, !68, !69}
!68 = !DILocation(line: 45, column: 13, scope: !54)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 48, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !41, file: !15, line: 48, column: 17)
!72 = !DILocation(line: 48, column: 22, scope: !71)
!73 = !DILocation(line: 48, column: 17, scope: !41)
!74 = !DILocation(line: 50, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 49, column: 13)
!76 = !DILocation(line: 50, column: 24, scope: !75)
!77 = !DILocation(line: 50, column: 30, scope: !75)
!78 = !DILocation(line: 52, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 52, column: 17)
!80 = !DILocation(line: 52, column: 21, scope: !79)
!81 = !DILocation(line: 52, column: 28, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !15, line: 52, column: 17)
!83 = !DILocation(line: 52, column: 30, scope: !82)
!84 = !DILocation(line: 52, column: 17, scope: !79)
!85 = !DILocation(line: 54, column: 34, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !15, line: 53, column: 17)
!87 = !DILocation(line: 54, column: 41, scope: !86)
!88 = !DILocation(line: 54, column: 21, scope: !86)
!89 = !DILocation(line: 55, column: 17, scope: !86)
!90 = !DILocation(line: 52, column: 37, scope: !82)
!91 = !DILocation(line: 52, column: 17, scope: !82)
!92 = distinct !{!92, !84, !93, !69}
!93 = !DILocation(line: 55, column: 17, scope: !79)
!94 = !DILocation(line: 56, column: 13, scope: !75)
!95 = !DILocation(line: 59, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !71, file: !15, line: 58, column: 13)
!97 = !DILocation(line: 61, column: 18, scope: !41)
!98 = !DILocation(line: 61, column: 13, scope: !41)
!99 = !DILocation(line: 64, column: 1, scope: !14)
!100 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_32_good", scope: !15, file: !15, line: 160, type: !16, scopeLine: 161, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 162, column: 5, scope: !100)
!102 = !DILocation(line: 163, column: 5, scope: !100)
!103 = !DILocation(line: 164, column: 1, scope: !100)
!104 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 174, type: !105, scopeLine: 175, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!5, !5, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !15, line: 174, type: !5)
!111 = !DILocation(line: 174, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !15, line: 174, type: !107)
!113 = !DILocation(line: 174, column: 27, scope: !104)
!114 = !DILocation(line: 177, column: 22, scope: !104)
!115 = !DILocation(line: 177, column: 12, scope: !104)
!116 = !DILocation(line: 177, column: 5, scope: !104)
!117 = !DILocation(line: 179, column: 5, scope: !104)
!118 = !DILocation(line: 180, column: 5, scope: !104)
!119 = !DILocation(line: 181, column: 5, scope: !104)
!120 = !DILocation(line: 184, column: 5, scope: !104)
!121 = !DILocation(line: 185, column: 5, scope: !104)
!122 = !DILocation(line: 186, column: 5, scope: !104)
!123 = !DILocation(line: 188, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 71, type: !16, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !15, line: 73, type: !5)
!126 = !DILocation(line: 73, column: 9, scope: !124)
!127 = !DILocalVariable(name: "dataPtr1", scope: !124, file: !15, line: 74, type: !4)
!128 = !DILocation(line: 74, column: 10, scope: !124)
!129 = !DILocalVariable(name: "dataPtr2", scope: !124, file: !15, line: 75, type: !4)
!130 = !DILocation(line: 75, column: 10, scope: !124)
!131 = !DILocation(line: 77, column: 10, scope: !124)
!132 = !DILocalVariable(name: "data", scope: !133, file: !15, line: 79, type: !5)
!133 = distinct !DILexicalBlock(scope: !124, file: !15, line: 78, column: 5)
!134 = !DILocation(line: 79, column: 13, scope: !133)
!135 = !DILocation(line: 79, column: 21, scope: !133)
!136 = !DILocation(line: 79, column: 20, scope: !133)
!137 = !DILocation(line: 82, column: 14, scope: !133)
!138 = !DILocation(line: 83, column: 21, scope: !133)
!139 = !DILocation(line: 83, column: 10, scope: !133)
!140 = !DILocation(line: 83, column: 19, scope: !133)
!141 = !DILocalVariable(name: "data", scope: !142, file: !15, line: 86, type: !5)
!142 = distinct !DILexicalBlock(scope: !124, file: !15, line: 85, column: 5)
!143 = !DILocation(line: 86, column: 13, scope: !142)
!144 = !DILocation(line: 86, column: 21, scope: !142)
!145 = !DILocation(line: 86, column: 20, scope: !142)
!146 = !DILocalVariable(name: "i", scope: !147, file: !15, line: 88, type: !5)
!147 = distinct !DILexicalBlock(scope: !142, file: !15, line: 87, column: 9)
!148 = !DILocation(line: 88, column: 17, scope: !147)
!149 = !DILocalVariable(name: "buffer", scope: !147, file: !15, line: 89, type: !4)
!150 = !DILocation(line: 89, column: 19, scope: !147)
!151 = !DILocation(line: 89, column: 35, scope: !147)
!152 = !DILocation(line: 89, column: 28, scope: !147)
!153 = !DILocation(line: 90, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !15, line: 90, column: 17)
!155 = !DILocation(line: 90, column: 24, scope: !154)
!156 = !DILocation(line: 90, column: 17, scope: !147)
!157 = !DILocation(line: 90, column: 34, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 90, column: 33)
!159 = !DILocation(line: 92, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !147, file: !15, line: 92, column: 13)
!161 = !DILocation(line: 92, column: 18, scope: !160)
!162 = !DILocation(line: 92, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !15, line: 92, column: 13)
!164 = !DILocation(line: 92, column: 27, scope: !163)
!165 = !DILocation(line: 92, column: 13, scope: !160)
!166 = !DILocation(line: 94, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 93, column: 13)
!168 = !DILocation(line: 94, column: 24, scope: !167)
!169 = !DILocation(line: 94, column: 27, scope: !167)
!170 = !DILocation(line: 95, column: 13, scope: !167)
!171 = !DILocation(line: 92, column: 34, scope: !163)
!172 = !DILocation(line: 92, column: 13, scope: !163)
!173 = distinct !{!173, !165, !174, !69}
!174 = !DILocation(line: 95, column: 13, scope: !160)
!175 = !DILocation(line: 98, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !147, file: !15, line: 98, column: 17)
!177 = !DILocation(line: 98, column: 22, scope: !176)
!178 = !DILocation(line: 98, column: 17, scope: !147)
!179 = !DILocation(line: 100, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 99, column: 13)
!181 = !DILocation(line: 100, column: 24, scope: !180)
!182 = !DILocation(line: 100, column: 30, scope: !180)
!183 = !DILocation(line: 102, column: 23, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !15, line: 102, column: 17)
!185 = !DILocation(line: 102, column: 21, scope: !184)
!186 = !DILocation(line: 102, column: 28, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !15, line: 102, column: 17)
!188 = !DILocation(line: 102, column: 30, scope: !187)
!189 = !DILocation(line: 102, column: 17, scope: !184)
!190 = !DILocation(line: 104, column: 34, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !15, line: 103, column: 17)
!192 = !DILocation(line: 104, column: 41, scope: !191)
!193 = !DILocation(line: 104, column: 21, scope: !191)
!194 = !DILocation(line: 105, column: 17, scope: !191)
!195 = !DILocation(line: 102, column: 37, scope: !187)
!196 = !DILocation(line: 102, column: 17, scope: !187)
!197 = distinct !{!197, !189, !198, !69}
!198 = !DILocation(line: 105, column: 17, scope: !184)
!199 = !DILocation(line: 106, column: 13, scope: !180)
!200 = !DILocation(line: 109, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !176, file: !15, line: 108, column: 13)
!202 = !DILocation(line: 111, column: 18, scope: !147)
!203 = !DILocation(line: 111, column: 13, scope: !147)
!204 = !DILocation(line: 114, column: 1, scope: !124)
!205 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 117, type: !16, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!206 = !DILocalVariable(name: "data", scope: !205, file: !15, line: 119, type: !5)
!207 = !DILocation(line: 119, column: 9, scope: !205)
!208 = !DILocalVariable(name: "dataPtr1", scope: !205, file: !15, line: 120, type: !4)
!209 = !DILocation(line: 120, column: 10, scope: !205)
!210 = !DILocalVariable(name: "dataPtr2", scope: !205, file: !15, line: 121, type: !4)
!211 = !DILocation(line: 121, column: 10, scope: !205)
!212 = !DILocation(line: 123, column: 10, scope: !205)
!213 = !DILocalVariable(name: "data", scope: !214, file: !15, line: 125, type: !5)
!214 = distinct !DILexicalBlock(scope: !205, file: !15, line: 124, column: 5)
!215 = !DILocation(line: 125, column: 13, scope: !214)
!216 = !DILocation(line: 125, column: 21, scope: !214)
!217 = !DILocation(line: 125, column: 20, scope: !214)
!218 = !DILocation(line: 127, column: 16, scope: !214)
!219 = !DILocation(line: 127, column: 9, scope: !214)
!220 = !DILocation(line: 128, column: 21, scope: !214)
!221 = !DILocation(line: 128, column: 10, scope: !214)
!222 = !DILocation(line: 128, column: 19, scope: !214)
!223 = !DILocalVariable(name: "data", scope: !224, file: !15, line: 131, type: !5)
!224 = distinct !DILexicalBlock(scope: !205, file: !15, line: 130, column: 5)
!225 = !DILocation(line: 131, column: 13, scope: !224)
!226 = !DILocation(line: 131, column: 21, scope: !224)
!227 = !DILocation(line: 131, column: 20, scope: !224)
!228 = !DILocalVariable(name: "i", scope: !229, file: !15, line: 133, type: !5)
!229 = distinct !DILexicalBlock(scope: !224, file: !15, line: 132, column: 9)
!230 = !DILocation(line: 133, column: 17, scope: !229)
!231 = !DILocalVariable(name: "buffer", scope: !229, file: !15, line: 134, type: !4)
!232 = !DILocation(line: 134, column: 19, scope: !229)
!233 = !DILocation(line: 134, column: 35, scope: !229)
!234 = !DILocation(line: 134, column: 28, scope: !229)
!235 = !DILocation(line: 135, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !229, file: !15, line: 135, column: 17)
!237 = !DILocation(line: 135, column: 24, scope: !236)
!238 = !DILocation(line: 135, column: 17, scope: !229)
!239 = !DILocation(line: 135, column: 34, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !15, line: 135, column: 33)
!241 = !DILocation(line: 137, column: 20, scope: !242)
!242 = distinct !DILexicalBlock(scope: !229, file: !15, line: 137, column: 13)
!243 = !DILocation(line: 137, column: 18, scope: !242)
!244 = !DILocation(line: 137, column: 25, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !15, line: 137, column: 13)
!246 = !DILocation(line: 137, column: 27, scope: !245)
!247 = !DILocation(line: 137, column: 13, scope: !242)
!248 = !DILocation(line: 139, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !15, line: 138, column: 13)
!250 = !DILocation(line: 139, column: 24, scope: !249)
!251 = !DILocation(line: 139, column: 27, scope: !249)
!252 = !DILocation(line: 140, column: 13, scope: !249)
!253 = !DILocation(line: 137, column: 34, scope: !245)
!254 = !DILocation(line: 137, column: 13, scope: !245)
!255 = distinct !{!255, !247, !256, !69}
!256 = !DILocation(line: 140, column: 13, scope: !242)
!257 = !DILocation(line: 142, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !229, file: !15, line: 142, column: 17)
!259 = !DILocation(line: 142, column: 22, scope: !258)
!260 = !DILocation(line: 142, column: 27, scope: !258)
!261 = !DILocation(line: 142, column: 30, scope: !258)
!262 = !DILocation(line: 142, column: 35, scope: !258)
!263 = !DILocation(line: 142, column: 17, scope: !229)
!264 = !DILocation(line: 144, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !258, file: !15, line: 143, column: 13)
!266 = !DILocation(line: 144, column: 24, scope: !265)
!267 = !DILocation(line: 144, column: 30, scope: !265)
!268 = !DILocation(line: 146, column: 23, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !15, line: 146, column: 17)
!270 = !DILocation(line: 146, column: 21, scope: !269)
!271 = !DILocation(line: 146, column: 28, scope: !272)
!272 = distinct !DILexicalBlock(scope: !269, file: !15, line: 146, column: 17)
!273 = !DILocation(line: 146, column: 30, scope: !272)
!274 = !DILocation(line: 146, column: 17, scope: !269)
!275 = !DILocation(line: 148, column: 34, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !15, line: 147, column: 17)
!277 = !DILocation(line: 148, column: 41, scope: !276)
!278 = !DILocation(line: 148, column: 21, scope: !276)
!279 = !DILocation(line: 149, column: 17, scope: !276)
!280 = !DILocation(line: 146, column: 37, scope: !272)
!281 = !DILocation(line: 146, column: 17, scope: !272)
!282 = distinct !{!282, !274, !283, !69}
!283 = !DILocation(line: 149, column: 17, scope: !269)
!284 = !DILocation(line: 150, column: 13, scope: !265)
!285 = !DILocation(line: 153, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !258, file: !15, line: 152, column: 13)
!287 = !DILocation(line: 155, column: 18, scope: !229)
!288 = !DILocation(line: 155, column: 13, scope: !229)
!289 = !DILocation(line: 158, column: 1, scope: !205)
