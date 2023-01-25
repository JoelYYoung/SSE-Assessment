; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* %data, align 4, !dbg !21
  %call = call i32 @badSource(i32 %0), !dbg !22
  store i32 %call, i32* %data, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !27, metadata !DIExpression()), !dbg !28
  %call1 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !29
  %1 = bitcast i8* %call1 to i32*, !dbg !30
  store i32* %1, i32** %buffer, align 8, !dbg !28
  %2 = load i32*, i32** %buffer, align 8, !dbg !31
  %cmp = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !40
  %cmp2 = icmp slt i32 %3, 10, !dbg !42
  br i1 %cmp2, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !44
  %5 = load i32, i32* %i, align 4, !dbg !46
  %idxprom = sext i32 %5 to i64, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %6, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !54
  %cmp3 = icmp sge i32 %7, 0, !dbg !56
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !57

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !58
  %9 = load i32, i32* %data, align 4, !dbg !60
  %idxprom5 = sext i32 %9 to i64, !dbg !58
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !58
  store i32 1, i32* %arrayidx6, align 4, !dbg !61
  store i32 0, i32* %i, align 4, !dbg !62
  br label %for.cond7, !dbg !64

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !65
  %cmp8 = icmp slt i32 %10, 10, !dbg !67
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !68

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !69
  %12 = load i32, i32* %i, align 4, !dbg !71
  %idxprom10 = sext i32 %12 to i64, !dbg !69
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !69
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !69
  call void @printIntLine(i32 %13), !dbg !72
  br label %for.inc12, !dbg !73

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !74
  %inc13 = add nsw i32 %14, 1, !dbg !74
  store i32 %inc13, i32* %i, align 4, !dbg !74
  br label %for.cond7, !dbg !75, !llvm.loop !76

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !78

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !79
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !81
  %16 = bitcast i32* %15 to i8*, !dbg !81
  call void @free(i8* %16) #5, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !84 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !89
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* %data.addr), !dbg !90
  %1 = load i32, i32* %data.addr, align 4, !dbg !91
  ret i32 %1, !dbg !92
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42_good() #0 !dbg !93 {
entry:
  call void @goodB2G(), !dbg !94
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #5, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #5, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !117 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 -1, i32* %data, align 4, !dbg !120
  %0 = load i32, i32* %data, align 4, !dbg !121
  %call = call i32 @goodB2GSource(i32 %0), !dbg !122
  store i32 %call, i32* %data, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !127, metadata !DIExpression()), !dbg !128
  %call1 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !129
  %1 = bitcast i8* %call1 to i32*, !dbg !130
  store i32* %1, i32** %buffer, align 8, !dbg !128
  %2 = load i32*, i32** %buffer, align 8, !dbg !131
  %cmp = icmp eq i32* %2, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !140
  %cmp2 = icmp slt i32 %3, 10, !dbg !142
  br i1 %cmp2, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !144
  %5 = load i32, i32* %i, align 4, !dbg !146
  %idxprom = sext i32 %5 to i64, !dbg !144
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !144
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !149
  %inc = add nsw i32 %6, 1, !dbg !149
  store i32 %inc, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !153
  %cmp3 = icmp sge i32 %7, 0, !dbg !155
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !156

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !157
  %cmp4 = icmp slt i32 %8, 10, !dbg !158
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !159

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !160
  %10 = load i32, i32* %data, align 4, !dbg !162
  %idxprom6 = sext i32 %10 to i64, !dbg !160
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !160
  store i32 1, i32* %arrayidx7, align 4, !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond8, !dbg !166

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !167
  %cmp9 = icmp slt i32 %11, 10, !dbg !169
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !170

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !171
  %13 = load i32, i32* %i, align 4, !dbg !173
  %idxprom11 = sext i32 %13 to i64, !dbg !171
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !171
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !171
  call void @printIntLine(i32 %14), !dbg !174
  br label %for.inc13, !dbg !175

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !176
  %inc14 = add nsw i32 %15, 1, !dbg !176
  store i32 %inc14, i32* %i, align 4, !dbg !176
  br label %for.cond8, !dbg !177, !llvm.loop !178

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !180

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !181
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !183
  %17 = bitcast i32* %16 to i8*, !dbg !183
  call void @free(i8* %17) #5, !dbg !184
  ret void, !dbg !185
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !186 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !187, metadata !DIExpression()), !dbg !188
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !189
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* %data.addr), !dbg !190
  %1 = load i32, i32* %data.addr, align 4, !dbg !191
  ret i32 %1, !dbg !192
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !193 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !194, metadata !DIExpression()), !dbg !195
  store i32 -1, i32* %data, align 4, !dbg !196
  %0 = load i32, i32* %data, align 4, !dbg !197
  %call = call i32 @goodG2BSource(i32 %0), !dbg !198
  store i32 %call, i32* %data, align 4, !dbg !199
  call void @llvm.dbg.declare(metadata i32* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !203, metadata !DIExpression()), !dbg !204
  %call1 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !205
  %1 = bitcast i8* %call1 to i32*, !dbg !206
  store i32* %1, i32** %buffer, align 8, !dbg !204
  %2 = load i32*, i32** %buffer, align 8, !dbg !207
  %cmp = icmp eq i32* %2, null, !dbg !209
  br i1 %cmp, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !211
  unreachable, !dbg !211

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !216
  %cmp2 = icmp slt i32 %3, 10, !dbg !218
  br i1 %cmp2, label %for.body, label %for.end, !dbg !219

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !220
  %5 = load i32, i32* %i, align 4, !dbg !222
  %idxprom = sext i32 %5 to i64, !dbg !220
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !220
  store i32 0, i32* %arrayidx, align 4, !dbg !223
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !225
  %inc = add nsw i32 %6, 1, !dbg !225
  store i32 %inc, i32* %i, align 4, !dbg !225
  br label %for.cond, !dbg !226, !llvm.loop !227

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !229
  %cmp3 = icmp sge i32 %7, 0, !dbg !231
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !232

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !233
  %9 = load i32, i32* %data, align 4, !dbg !235
  %idxprom5 = sext i32 %9 to i64, !dbg !233
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !233
  store i32 1, i32* %arrayidx6, align 4, !dbg !236
  store i32 0, i32* %i, align 4, !dbg !237
  br label %for.cond7, !dbg !239

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !240
  %cmp8 = icmp slt i32 %10, 10, !dbg !242
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !243

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !244
  %12 = load i32, i32* %i, align 4, !dbg !246
  %idxprom10 = sext i32 %12 to i64, !dbg !244
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !244
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !244
  call void @printIntLine(i32 %13), !dbg !247
  br label %for.inc12, !dbg !248

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !249
  %inc13 = add nsw i32 %14, 1, !dbg !249
  store i32 %inc13, i32* %i, align 4, !dbg !249
  br label %for.cond7, !dbg !250, !llvm.loop !251

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !253

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !254
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !256
  %16 = bitcast i32* %15 to i8*, !dbg !256
  call void @free(i8* %16) #5, !dbg !257
  ret void, !dbg !258
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !259 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !260, metadata !DIExpression()), !dbg !261
  store i32 7, i32* %data.addr, align 4, !dbg !262
  %0 = load i32, i32* %data.addr, align 4, !dbg !263
  ret i32 %0, !dbg !264
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !5)
!19 = !DILocation(line: 31, column: 9, scope: !14)
!20 = !DILocation(line: 33, column: 10, scope: !14)
!21 = !DILocation(line: 34, column: 22, scope: !14)
!22 = !DILocation(line: 34, column: 12, scope: !14)
!23 = !DILocation(line: 34, column: 10, scope: !14)
!24 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 36, type: !5)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!26 = !DILocation(line: 36, column: 13, scope: !25)
!27 = !DILocalVariable(name: "buffer", scope: !25, file: !15, line: 37, type: !4)
!28 = !DILocation(line: 37, column: 15, scope: !25)
!29 = !DILocation(line: 37, column: 31, scope: !25)
!30 = !DILocation(line: 37, column: 24, scope: !25)
!31 = !DILocation(line: 38, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !15, line: 38, column: 13)
!33 = !DILocation(line: 38, column: 20, scope: !32)
!34 = !DILocation(line: 38, column: 13, scope: !25)
!35 = !DILocation(line: 38, column: 30, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 29)
!37 = !DILocation(line: 40, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !25, file: !15, line: 40, column: 9)
!39 = !DILocation(line: 40, column: 14, scope: !38)
!40 = !DILocation(line: 40, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !15, line: 40, column: 9)
!42 = !DILocation(line: 40, column: 23, scope: !41)
!43 = !DILocation(line: 40, column: 9, scope: !38)
!44 = !DILocation(line: 42, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 41, column: 9)
!46 = !DILocation(line: 42, column: 20, scope: !45)
!47 = !DILocation(line: 42, column: 23, scope: !45)
!48 = !DILocation(line: 43, column: 9, scope: !45)
!49 = !DILocation(line: 40, column: 30, scope: !41)
!50 = !DILocation(line: 40, column: 9, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 43, column: 9, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 46, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !25, file: !15, line: 46, column: 13)
!56 = !DILocation(line: 46, column: 18, scope: !55)
!57 = !DILocation(line: 46, column: 13, scope: !25)
!58 = !DILocation(line: 48, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !15, line: 47, column: 9)
!60 = !DILocation(line: 48, column: 20, scope: !59)
!61 = !DILocation(line: 48, column: 26, scope: !59)
!62 = !DILocation(line: 50, column: 19, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !15, line: 50, column: 13)
!64 = !DILocation(line: 50, column: 17, scope: !63)
!65 = !DILocation(line: 50, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 50, column: 13)
!67 = !DILocation(line: 50, column: 26, scope: !66)
!68 = !DILocation(line: 50, column: 13, scope: !63)
!69 = !DILocation(line: 52, column: 30, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 51, column: 13)
!71 = !DILocation(line: 52, column: 37, scope: !70)
!72 = !DILocation(line: 52, column: 17, scope: !70)
!73 = !DILocation(line: 53, column: 13, scope: !70)
!74 = !DILocation(line: 50, column: 33, scope: !66)
!75 = !DILocation(line: 50, column: 13, scope: !66)
!76 = distinct !{!76, !68, !77, !53}
!77 = !DILocation(line: 53, column: 13, scope: !63)
!78 = !DILocation(line: 54, column: 9, scope: !59)
!79 = !DILocation(line: 57, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !55, file: !15, line: 56, column: 9)
!81 = !DILocation(line: 59, column: 14, scope: !25)
!82 = !DILocation(line: 59, column: 9, scope: !25)
!83 = !DILocation(line: 61, column: 1, scope: !14)
!84 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 22, type: !85, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!5, !5}
!87 = !DILocalVariable(name: "data", arg: 1, scope: !84, file: !15, line: 22, type: !5)
!88 = !DILocation(line: 22, column: 26, scope: !84)
!89 = !DILocation(line: 25, column: 12, scope: !84)
!90 = !DILocation(line: 25, column: 5, scope: !84)
!91 = !DILocation(line: 26, column: 12, scope: !84)
!92 = !DILocation(line: 26, column: 5, scope: !84)
!93 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_42_good", scope: !15, file: !15, line: 151, type: !16, scopeLine: 152, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 153, column: 5, scope: !93)
!95 = !DILocation(line: 154, column: 5, scope: !93)
!96 = !DILocation(line: 155, column: 1, scope: !93)
!97 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 166, type: !98, scopeLine: 167, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!5, !5, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !15, line: 166, type: !5)
!104 = !DILocation(line: 166, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !15, line: 166, type: !100)
!106 = !DILocation(line: 166, column: 27, scope: !97)
!107 = !DILocation(line: 169, column: 22, scope: !97)
!108 = !DILocation(line: 169, column: 12, scope: !97)
!109 = !DILocation(line: 169, column: 5, scope: !97)
!110 = !DILocation(line: 171, column: 5, scope: !97)
!111 = !DILocation(line: 172, column: 5, scope: !97)
!112 = !DILocation(line: 173, column: 5, scope: !97)
!113 = !DILocation(line: 176, column: 5, scope: !97)
!114 = !DILocation(line: 177, column: 5, scope: !97)
!115 = !DILocation(line: 178, column: 5, scope: !97)
!116 = !DILocation(line: 180, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 118, type: !16, scopeLine: 119, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 120, type: !5)
!119 = !DILocation(line: 120, column: 9, scope: !117)
!120 = !DILocation(line: 122, column: 10, scope: !117)
!121 = !DILocation(line: 123, column: 26, scope: !117)
!122 = !DILocation(line: 123, column: 12, scope: !117)
!123 = !DILocation(line: 123, column: 10, scope: !117)
!124 = !DILocalVariable(name: "i", scope: !125, file: !15, line: 125, type: !5)
!125 = distinct !DILexicalBlock(scope: !117, file: !15, line: 124, column: 5)
!126 = !DILocation(line: 125, column: 13, scope: !125)
!127 = !DILocalVariable(name: "buffer", scope: !125, file: !15, line: 126, type: !4)
!128 = !DILocation(line: 126, column: 15, scope: !125)
!129 = !DILocation(line: 126, column: 31, scope: !125)
!130 = !DILocation(line: 126, column: 24, scope: !125)
!131 = !DILocation(line: 127, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !15, line: 127, column: 13)
!133 = !DILocation(line: 127, column: 20, scope: !132)
!134 = !DILocation(line: 127, column: 13, scope: !125)
!135 = !DILocation(line: 127, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 127, column: 29)
!137 = !DILocation(line: 129, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !125, file: !15, line: 129, column: 9)
!139 = !DILocation(line: 129, column: 14, scope: !138)
!140 = !DILocation(line: 129, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !15, line: 129, column: 9)
!142 = !DILocation(line: 129, column: 23, scope: !141)
!143 = !DILocation(line: 129, column: 9, scope: !138)
!144 = !DILocation(line: 131, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !15, line: 130, column: 9)
!146 = !DILocation(line: 131, column: 20, scope: !145)
!147 = !DILocation(line: 131, column: 23, scope: !145)
!148 = !DILocation(line: 132, column: 9, scope: !145)
!149 = !DILocation(line: 129, column: 30, scope: !141)
!150 = !DILocation(line: 129, column: 9, scope: !141)
!151 = distinct !{!151, !143, !152, !53}
!152 = !DILocation(line: 132, column: 9, scope: !138)
!153 = !DILocation(line: 134, column: 13, scope: !154)
!154 = distinct !DILexicalBlock(scope: !125, file: !15, line: 134, column: 13)
!155 = !DILocation(line: 134, column: 18, scope: !154)
!156 = !DILocation(line: 134, column: 23, scope: !154)
!157 = !DILocation(line: 134, column: 26, scope: !154)
!158 = !DILocation(line: 134, column: 31, scope: !154)
!159 = !DILocation(line: 134, column: 13, scope: !125)
!160 = !DILocation(line: 136, column: 13, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !15, line: 135, column: 9)
!162 = !DILocation(line: 136, column: 20, scope: !161)
!163 = !DILocation(line: 136, column: 26, scope: !161)
!164 = !DILocation(line: 138, column: 19, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 138, column: 13)
!166 = !DILocation(line: 138, column: 17, scope: !165)
!167 = !DILocation(line: 138, column: 24, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !15, line: 138, column: 13)
!169 = !DILocation(line: 138, column: 26, scope: !168)
!170 = !DILocation(line: 138, column: 13, scope: !165)
!171 = !DILocation(line: 140, column: 30, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !15, line: 139, column: 13)
!173 = !DILocation(line: 140, column: 37, scope: !172)
!174 = !DILocation(line: 140, column: 17, scope: !172)
!175 = !DILocation(line: 141, column: 13, scope: !172)
!176 = !DILocation(line: 138, column: 33, scope: !168)
!177 = !DILocation(line: 138, column: 13, scope: !168)
!178 = distinct !{!178, !170, !179, !53}
!179 = !DILocation(line: 141, column: 13, scope: !165)
!180 = !DILocation(line: 142, column: 9, scope: !161)
!181 = !DILocation(line: 145, column: 13, scope: !182)
!182 = distinct !DILexicalBlock(scope: !154, file: !15, line: 144, column: 9)
!183 = !DILocation(line: 147, column: 14, scope: !125)
!184 = !DILocation(line: 147, column: 9, scope: !125)
!185 = !DILocation(line: 149, column: 1, scope: !117)
!186 = distinct !DISubprogram(name: "goodB2GSource", scope: !15, file: !15, line: 111, type: !85, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!187 = !DILocalVariable(name: "data", arg: 1, scope: !186, file: !15, line: 111, type: !5)
!188 = !DILocation(line: 111, column: 30, scope: !186)
!189 = !DILocation(line: 114, column: 12, scope: !186)
!190 = !DILocation(line: 114, column: 5, scope: !186)
!191 = !DILocation(line: 115, column: 12, scope: !186)
!192 = !DILocation(line: 115, column: 5, scope: !186)
!193 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!194 = !DILocalVariable(name: "data", scope: !193, file: !15, line: 78, type: !5)
!195 = !DILocation(line: 78, column: 9, scope: !193)
!196 = !DILocation(line: 80, column: 10, scope: !193)
!197 = !DILocation(line: 81, column: 26, scope: !193)
!198 = !DILocation(line: 81, column: 12, scope: !193)
!199 = !DILocation(line: 81, column: 10, scope: !193)
!200 = !DILocalVariable(name: "i", scope: !201, file: !15, line: 83, type: !5)
!201 = distinct !DILexicalBlock(scope: !193, file: !15, line: 82, column: 5)
!202 = !DILocation(line: 83, column: 13, scope: !201)
!203 = !DILocalVariable(name: "buffer", scope: !201, file: !15, line: 84, type: !4)
!204 = !DILocation(line: 84, column: 15, scope: !201)
!205 = !DILocation(line: 84, column: 31, scope: !201)
!206 = !DILocation(line: 84, column: 24, scope: !201)
!207 = !DILocation(line: 85, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !201, file: !15, line: 85, column: 13)
!209 = !DILocation(line: 85, column: 20, scope: !208)
!210 = !DILocation(line: 85, column: 13, scope: !201)
!211 = !DILocation(line: 85, column: 30, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !15, line: 85, column: 29)
!213 = !DILocation(line: 87, column: 16, scope: !214)
!214 = distinct !DILexicalBlock(scope: !201, file: !15, line: 87, column: 9)
!215 = !DILocation(line: 87, column: 14, scope: !214)
!216 = !DILocation(line: 87, column: 21, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !15, line: 87, column: 9)
!218 = !DILocation(line: 87, column: 23, scope: !217)
!219 = !DILocation(line: 87, column: 9, scope: !214)
!220 = !DILocation(line: 89, column: 13, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !15, line: 88, column: 9)
!222 = !DILocation(line: 89, column: 20, scope: !221)
!223 = !DILocation(line: 89, column: 23, scope: !221)
!224 = !DILocation(line: 90, column: 9, scope: !221)
!225 = !DILocation(line: 87, column: 30, scope: !217)
!226 = !DILocation(line: 87, column: 9, scope: !217)
!227 = distinct !{!227, !219, !228, !53}
!228 = !DILocation(line: 90, column: 9, scope: !214)
!229 = !DILocation(line: 93, column: 13, scope: !230)
!230 = distinct !DILexicalBlock(scope: !201, file: !15, line: 93, column: 13)
!231 = !DILocation(line: 93, column: 18, scope: !230)
!232 = !DILocation(line: 93, column: 13, scope: !201)
!233 = !DILocation(line: 95, column: 13, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !15, line: 94, column: 9)
!235 = !DILocation(line: 95, column: 20, scope: !234)
!236 = !DILocation(line: 95, column: 26, scope: !234)
!237 = !DILocation(line: 97, column: 19, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !15, line: 97, column: 13)
!239 = !DILocation(line: 97, column: 17, scope: !238)
!240 = !DILocation(line: 97, column: 24, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !15, line: 97, column: 13)
!242 = !DILocation(line: 97, column: 26, scope: !241)
!243 = !DILocation(line: 97, column: 13, scope: !238)
!244 = !DILocation(line: 99, column: 30, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !15, line: 98, column: 13)
!246 = !DILocation(line: 99, column: 37, scope: !245)
!247 = !DILocation(line: 99, column: 17, scope: !245)
!248 = !DILocation(line: 100, column: 13, scope: !245)
!249 = !DILocation(line: 97, column: 33, scope: !241)
!250 = !DILocation(line: 97, column: 13, scope: !241)
!251 = distinct !{!251, !243, !252, !53}
!252 = !DILocation(line: 100, column: 13, scope: !238)
!253 = !DILocation(line: 101, column: 9, scope: !234)
!254 = !DILocation(line: 104, column: 13, scope: !255)
!255 = distinct !DILexicalBlock(scope: !230, file: !15, line: 103, column: 9)
!256 = !DILocation(line: 106, column: 14, scope: !201)
!257 = !DILocation(line: 106, column: 9, scope: !201)
!258 = !DILocation(line: 108, column: 1, scope: !193)
!259 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 68, type: !85, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!260 = !DILocalVariable(name: "data", arg: 1, scope: !259, file: !15, line: 68, type: !5)
!261 = !DILocation(line: 68, column: 30, scope: !259)
!262 = !DILocation(line: 72, column: 10, scope: !259)
!263 = !DILocation(line: 73, column: 12, scope: !259)
!264 = !DILocation(line: 73, column: 5, scope: !259)
