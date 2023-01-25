; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !21
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !23, metadata !DIExpression()), !dbg !25
  %1 = load i32, i32* %data, align 4, !dbg !26
  store i32 %1, i32* %dataCopy, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = load i32, i32* %dataCopy, align 4, !dbg !29
  store i32 %2, i32* %data1, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !33, metadata !DIExpression()), !dbg !34
  %call2 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !35
  %3 = bitcast i8* %call2 to i32*, !dbg !36
  store i32* %3, i32** %buffer, align 8, !dbg !34
  %4 = load i32*, i32** %buffer, align 8, !dbg !37
  %cmp = icmp eq i32* %4, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !46
  %cmp3 = icmp slt i32 %5, 10, !dbg !48
  br i1 %cmp3, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !50
  %7 = load i32, i32* %i, align 4, !dbg !52
  %idxprom = sext i32 %7 to i64, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !55
  %inc = add nsw i32 %8, 1, !dbg !55
  store i32 %inc, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data1, align 4, !dbg !60
  %cmp4 = icmp sge i32 %9, 0, !dbg !62
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !63

if.then5:                                         ; preds = %for.end
  %10 = load i32*, i32** %buffer, align 8, !dbg !64
  %11 = load i32, i32* %data1, align 4, !dbg !66
  %idxprom6 = sext i32 %11 to i64, !dbg !64
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %idxprom6, !dbg !64
  store i32 1, i32* %arrayidx7, align 4, !dbg !67
  store i32 0, i32* %i, align 4, !dbg !68
  br label %for.cond8, !dbg !70

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %12 = load i32, i32* %i, align 4, !dbg !71
  %cmp9 = icmp slt i32 %12, 10, !dbg !73
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !74

for.body10:                                       ; preds = %for.cond8
  %13 = load i32*, i32** %buffer, align 8, !dbg !75
  %14 = load i32, i32* %i, align 4, !dbg !77
  %idxprom11 = sext i32 %14 to i64, !dbg !75
  %arrayidx12 = getelementptr inbounds i32, i32* %13, i64 %idxprom11, !dbg !75
  %15 = load i32, i32* %arrayidx12, align 4, !dbg !75
  call void @printIntLine(i32 %15), !dbg !78
  br label %for.inc13, !dbg !79

for.inc13:                                        ; preds = %for.body10
  %16 = load i32, i32* %i, align 4, !dbg !80
  %inc14 = add nsw i32 %16, 1, !dbg !80
  store i32 %inc14, i32* %i, align 4, !dbg !80
  br label %for.cond8, !dbg !81, !llvm.loop !82

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !84

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %17 = load i32*, i32** %buffer, align 8, !dbg !87
  %18 = bitcast i32* %17 to i8*, !dbg !87
  call void @free(i8* %18) #5, !dbg !88
  ret void, !dbg !89
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  call void @goodB2G(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #5, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #5, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 -1, i32* %data, align 4, !dbg !117
  store i32 7, i32* %data, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !119, metadata !DIExpression()), !dbg !121
  %0 = load i32, i32* %data, align 4, !dbg !122
  store i32 %0, i32* %dataCopy, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !123, metadata !DIExpression()), !dbg !124
  %1 = load i32, i32* %dataCopy, align 4, !dbg !125
  store i32 %1, i32* %data1, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata i32* %i, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !129, metadata !DIExpression()), !dbg !130
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !131
  %2 = bitcast i8* %call to i32*, !dbg !132
  store i32* %2, i32** %buffer, align 8, !dbg !130
  %3 = load i32*, i32** %buffer, align 8, !dbg !133
  %cmp = icmp eq i32* %3, null, !dbg !135
  br i1 %cmp, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !137
  unreachable, !dbg !137

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !142
  %cmp2 = icmp slt i32 %4, 10, !dbg !144
  br i1 %cmp2, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !146
  %6 = load i32, i32* %i, align 4, !dbg !148
  %idxprom = sext i32 %6 to i64, !dbg !146
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !151
  %inc = add nsw i32 %7, 1, !dbg !151
  store i32 %inc, i32* %i, align 4, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !155
  %cmp3 = icmp sge i32 %8, 0, !dbg !157
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !158

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !159
  %10 = load i32, i32* %data1, align 4, !dbg !161
  %idxprom5 = sext i32 %10 to i64, !dbg !159
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !159
  store i32 1, i32* %arrayidx6, align 4, !dbg !162
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond7, !dbg !165

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !166
  %cmp8 = icmp slt i32 %11, 10, !dbg !168
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !169

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !170
  %13 = load i32, i32* %i, align 4, !dbg !172
  %idxprom10 = sext i32 %13 to i64, !dbg !170
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !170
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !170
  call void @printIntLine(i32 %14), !dbg !173
  br label %for.inc12, !dbg !174

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !175
  %inc13 = add nsw i32 %15, 1, !dbg !175
  store i32 %inc13, i32* %i, align 4, !dbg !175
  br label %for.cond7, !dbg !176, !llvm.loop !177

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !179

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !180
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !182
  %17 = bitcast i32* %16 to i8*, !dbg !182
  call void @free(i8* %17) #5, !dbg !183
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 -1, i32* %data, align 4, !dbg !188
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !189
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !190
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !191, metadata !DIExpression()), !dbg !193
  %1 = load i32, i32* %data, align 4, !dbg !194
  store i32 %1, i32* %dataCopy, align 4, !dbg !193
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !195, metadata !DIExpression()), !dbg !196
  %2 = load i32, i32* %dataCopy, align 4, !dbg !197
  store i32 %2, i32* %data1, align 4, !dbg !196
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !201, metadata !DIExpression()), !dbg !202
  %call2 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !203
  %3 = bitcast i8* %call2 to i32*, !dbg !204
  store i32* %3, i32** %buffer, align 8, !dbg !202
  %4 = load i32*, i32** %buffer, align 8, !dbg !205
  %cmp = icmp eq i32* %4, null, !dbg !207
  br i1 %cmp, label %if.then, label %if.end, !dbg !208

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !209
  unreachable, !dbg !209

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !214
  %cmp3 = icmp slt i32 %5, 10, !dbg !216
  br i1 %cmp3, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !218
  %7 = load i32, i32* %i, align 4, !dbg !220
  %idxprom = sext i32 %7 to i64, !dbg !218
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !218
  store i32 0, i32* %arrayidx, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !223
  %inc = add nsw i32 %8, 1, !dbg !223
  store i32 %inc, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data1, align 4, !dbg !227
  %cmp4 = icmp sge i32 %9, 0, !dbg !229
  br i1 %cmp4, label %land.lhs.true, label %if.else, !dbg !230

land.lhs.true:                                    ; preds = %for.end
  %10 = load i32, i32* %data1, align 4, !dbg !231
  %cmp5 = icmp slt i32 %10, 10, !dbg !232
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !233

if.then6:                                         ; preds = %land.lhs.true
  %11 = load i32*, i32** %buffer, align 8, !dbg !234
  %12 = load i32, i32* %data1, align 4, !dbg !236
  %idxprom7 = sext i32 %12 to i64, !dbg !234
  %arrayidx8 = getelementptr inbounds i32, i32* %11, i64 %idxprom7, !dbg !234
  store i32 1, i32* %arrayidx8, align 4, !dbg !237
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond9, !dbg !240

for.cond9:                                        ; preds = %for.inc14, %if.then6
  %13 = load i32, i32* %i, align 4, !dbg !241
  %cmp10 = icmp slt i32 %13, 10, !dbg !243
  br i1 %cmp10, label %for.body11, label %for.end16, !dbg !244

for.body11:                                       ; preds = %for.cond9
  %14 = load i32*, i32** %buffer, align 8, !dbg !245
  %15 = load i32, i32* %i, align 4, !dbg !247
  %idxprom12 = sext i32 %15 to i64, !dbg !245
  %arrayidx13 = getelementptr inbounds i32, i32* %14, i64 %idxprom12, !dbg !245
  %16 = load i32, i32* %arrayidx13, align 4, !dbg !245
  call void @printIntLine(i32 %16), !dbg !248
  br label %for.inc14, !dbg !249

for.inc14:                                        ; preds = %for.body11
  %17 = load i32, i32* %i, align 4, !dbg !250
  %inc15 = add nsw i32 %17, 1, !dbg !250
  store i32 %inc15, i32* %i, align 4, !dbg !250
  br label %for.cond9, !dbg !251, !llvm.loop !252

for.end16:                                        ; preds = %for.cond9
  br label %if.end17, !dbg !254

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !255
  br label %if.end17

if.end17:                                         ; preds = %if.else, %for.end16
  %18 = load i32*, i32** %buffer, align 8, !dbg !257
  %19 = bitcast i32* %18 to i8*, !dbg !257
  call void @free(i8* %19) #5, !dbg !258
  ret void, !dbg !259
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 12, scope: !14)
!22 = !DILocation(line: 28, column: 5, scope: !14)
!23 = !DILocalVariable(name: "dataCopy", scope: !24, file: !15, line: 30, type: !5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!25 = !DILocation(line: 30, column: 13, scope: !24)
!26 = !DILocation(line: 30, column: 24, scope: !24)
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 31, type: !5)
!28 = !DILocation(line: 31, column: 13, scope: !24)
!29 = !DILocation(line: 31, column: 20, scope: !24)
!30 = !DILocalVariable(name: "i", scope: !31, file: !15, line: 33, type: !5)
!31 = distinct !DILexicalBlock(scope: !24, file: !15, line: 32, column: 9)
!32 = !DILocation(line: 33, column: 17, scope: !31)
!33 = !DILocalVariable(name: "buffer", scope: !31, file: !15, line: 34, type: !4)
!34 = !DILocation(line: 34, column: 19, scope: !31)
!35 = !DILocation(line: 34, column: 35, scope: !31)
!36 = !DILocation(line: 34, column: 28, scope: !31)
!37 = !DILocation(line: 35, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !15, line: 35, column: 17)
!39 = !DILocation(line: 35, column: 24, scope: !38)
!40 = !DILocation(line: 35, column: 17, scope: !31)
!41 = !DILocation(line: 35, column: 34, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 35, column: 33)
!43 = !DILocation(line: 37, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !31, file: !15, line: 37, column: 13)
!45 = !DILocation(line: 37, column: 18, scope: !44)
!46 = !DILocation(line: 37, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !15, line: 37, column: 13)
!48 = !DILocation(line: 37, column: 27, scope: !47)
!49 = !DILocation(line: 37, column: 13, scope: !44)
!50 = !DILocation(line: 39, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !15, line: 38, column: 13)
!52 = !DILocation(line: 39, column: 24, scope: !51)
!53 = !DILocation(line: 39, column: 27, scope: !51)
!54 = !DILocation(line: 40, column: 13, scope: !51)
!55 = !DILocation(line: 37, column: 34, scope: !47)
!56 = !DILocation(line: 37, column: 13, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 40, column: 13, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 43, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !31, file: !15, line: 43, column: 17)
!62 = !DILocation(line: 43, column: 22, scope: !61)
!63 = !DILocation(line: 43, column: 17, scope: !31)
!64 = !DILocation(line: 45, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 44, column: 13)
!66 = !DILocation(line: 45, column: 24, scope: !65)
!67 = !DILocation(line: 45, column: 30, scope: !65)
!68 = !DILocation(line: 47, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 47, column: 17)
!70 = !DILocation(line: 47, column: 21, scope: !69)
!71 = !DILocation(line: 47, column: 28, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !15, line: 47, column: 17)
!73 = !DILocation(line: 47, column: 30, scope: !72)
!74 = !DILocation(line: 47, column: 17, scope: !69)
!75 = !DILocation(line: 49, column: 34, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 48, column: 17)
!77 = !DILocation(line: 49, column: 41, scope: !76)
!78 = !DILocation(line: 49, column: 21, scope: !76)
!79 = !DILocation(line: 50, column: 17, scope: !76)
!80 = !DILocation(line: 47, column: 37, scope: !72)
!81 = !DILocation(line: 47, column: 17, scope: !72)
!82 = distinct !{!82, !74, !83, !59}
!83 = !DILocation(line: 50, column: 17, scope: !69)
!84 = !DILocation(line: 51, column: 13, scope: !65)
!85 = !DILocation(line: 54, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !61, file: !15, line: 53, column: 13)
!87 = !DILocation(line: 56, column: 18, scope: !31)
!88 = !DILocation(line: 56, column: 13, scope: !31)
!89 = !DILocation(line: 59, column: 1, scope: !14)
!90 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_good", scope: !15, file: !15, line: 145, type: !16, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 147, column: 5, scope: !90)
!92 = !DILocation(line: 148, column: 5, scope: !90)
!93 = !DILocation(line: 149, column: 1, scope: !90)
!94 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 159, type: !95, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!5, !5, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !15, line: 159, type: !5)
!101 = !DILocation(line: 159, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !15, line: 159, type: !97)
!103 = !DILocation(line: 159, column: 27, scope: !94)
!104 = !DILocation(line: 162, column: 22, scope: !94)
!105 = !DILocation(line: 162, column: 12, scope: !94)
!106 = !DILocation(line: 162, column: 5, scope: !94)
!107 = !DILocation(line: 164, column: 5, scope: !94)
!108 = !DILocation(line: 165, column: 5, scope: !94)
!109 = !DILocation(line: 166, column: 5, scope: !94)
!110 = !DILocation(line: 169, column: 5, scope: !94)
!111 = !DILocation(line: 170, column: 5, scope: !94)
!112 = !DILocation(line: 171, column: 5, scope: !94)
!113 = !DILocation(line: 173, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !15, line: 68, type: !5)
!116 = !DILocation(line: 68, column: 9, scope: !114)
!117 = !DILocation(line: 70, column: 10, scope: !114)
!118 = !DILocation(line: 73, column: 10, scope: !114)
!119 = !DILocalVariable(name: "dataCopy", scope: !120, file: !15, line: 75, type: !5)
!120 = distinct !DILexicalBlock(scope: !114, file: !15, line: 74, column: 5)
!121 = !DILocation(line: 75, column: 13, scope: !120)
!122 = !DILocation(line: 75, column: 24, scope: !120)
!123 = !DILocalVariable(name: "data", scope: !120, file: !15, line: 76, type: !5)
!124 = !DILocation(line: 76, column: 13, scope: !120)
!125 = !DILocation(line: 76, column: 20, scope: !120)
!126 = !DILocalVariable(name: "i", scope: !127, file: !15, line: 78, type: !5)
!127 = distinct !DILexicalBlock(scope: !120, file: !15, line: 77, column: 9)
!128 = !DILocation(line: 78, column: 17, scope: !127)
!129 = !DILocalVariable(name: "buffer", scope: !127, file: !15, line: 79, type: !4)
!130 = !DILocation(line: 79, column: 19, scope: !127)
!131 = !DILocation(line: 79, column: 35, scope: !127)
!132 = !DILocation(line: 79, column: 28, scope: !127)
!133 = !DILocation(line: 80, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !127, file: !15, line: 80, column: 17)
!135 = !DILocation(line: 80, column: 24, scope: !134)
!136 = !DILocation(line: 80, column: 17, scope: !127)
!137 = !DILocation(line: 80, column: 34, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !15, line: 80, column: 33)
!139 = !DILocation(line: 82, column: 20, scope: !140)
!140 = distinct !DILexicalBlock(scope: !127, file: !15, line: 82, column: 13)
!141 = !DILocation(line: 82, column: 18, scope: !140)
!142 = !DILocation(line: 82, column: 25, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !15, line: 82, column: 13)
!144 = !DILocation(line: 82, column: 27, scope: !143)
!145 = !DILocation(line: 82, column: 13, scope: !140)
!146 = !DILocation(line: 84, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 83, column: 13)
!148 = !DILocation(line: 84, column: 24, scope: !147)
!149 = !DILocation(line: 84, column: 27, scope: !147)
!150 = !DILocation(line: 85, column: 13, scope: !147)
!151 = !DILocation(line: 82, column: 34, scope: !143)
!152 = !DILocation(line: 82, column: 13, scope: !143)
!153 = distinct !{!153, !145, !154, !59}
!154 = !DILocation(line: 85, column: 13, scope: !140)
!155 = !DILocation(line: 88, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !127, file: !15, line: 88, column: 17)
!157 = !DILocation(line: 88, column: 22, scope: !156)
!158 = !DILocation(line: 88, column: 17, scope: !127)
!159 = !DILocation(line: 90, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !15, line: 89, column: 13)
!161 = !DILocation(line: 90, column: 24, scope: !160)
!162 = !DILocation(line: 90, column: 30, scope: !160)
!163 = !DILocation(line: 92, column: 23, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 92, column: 17)
!165 = !DILocation(line: 92, column: 21, scope: !164)
!166 = !DILocation(line: 92, column: 28, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 92, column: 17)
!168 = !DILocation(line: 92, column: 30, scope: !167)
!169 = !DILocation(line: 92, column: 17, scope: !164)
!170 = !DILocation(line: 94, column: 34, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 93, column: 17)
!172 = !DILocation(line: 94, column: 41, scope: !171)
!173 = !DILocation(line: 94, column: 21, scope: !171)
!174 = !DILocation(line: 95, column: 17, scope: !171)
!175 = !DILocation(line: 92, column: 37, scope: !167)
!176 = !DILocation(line: 92, column: 17, scope: !167)
!177 = distinct !{!177, !169, !178, !59}
!178 = !DILocation(line: 95, column: 17, scope: !164)
!179 = !DILocation(line: 96, column: 13, scope: !160)
!180 = !DILocation(line: 99, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !156, file: !15, line: 98, column: 13)
!182 = !DILocation(line: 101, column: 18, scope: !127)
!183 = !DILocation(line: 101, column: 13, scope: !127)
!184 = !DILocation(line: 104, column: 1, scope: !114)
!185 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 107, type: !16, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!186 = !DILocalVariable(name: "data", scope: !185, file: !15, line: 109, type: !5)
!187 = !DILocation(line: 109, column: 9, scope: !185)
!188 = !DILocation(line: 111, column: 10, scope: !185)
!189 = !DILocation(line: 113, column: 12, scope: !185)
!190 = !DILocation(line: 113, column: 5, scope: !185)
!191 = !DILocalVariable(name: "dataCopy", scope: !192, file: !15, line: 115, type: !5)
!192 = distinct !DILexicalBlock(scope: !185, file: !15, line: 114, column: 5)
!193 = !DILocation(line: 115, column: 13, scope: !192)
!194 = !DILocation(line: 115, column: 24, scope: !192)
!195 = !DILocalVariable(name: "data", scope: !192, file: !15, line: 116, type: !5)
!196 = !DILocation(line: 116, column: 13, scope: !192)
!197 = !DILocation(line: 116, column: 20, scope: !192)
!198 = !DILocalVariable(name: "i", scope: !199, file: !15, line: 118, type: !5)
!199 = distinct !DILexicalBlock(scope: !192, file: !15, line: 117, column: 9)
!200 = !DILocation(line: 118, column: 17, scope: !199)
!201 = !DILocalVariable(name: "buffer", scope: !199, file: !15, line: 119, type: !4)
!202 = !DILocation(line: 119, column: 19, scope: !199)
!203 = !DILocation(line: 119, column: 35, scope: !199)
!204 = !DILocation(line: 119, column: 28, scope: !199)
!205 = !DILocation(line: 120, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !15, line: 120, column: 17)
!207 = !DILocation(line: 120, column: 24, scope: !206)
!208 = !DILocation(line: 120, column: 17, scope: !199)
!209 = !DILocation(line: 120, column: 34, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !15, line: 120, column: 33)
!211 = !DILocation(line: 122, column: 20, scope: !212)
!212 = distinct !DILexicalBlock(scope: !199, file: !15, line: 122, column: 13)
!213 = !DILocation(line: 122, column: 18, scope: !212)
!214 = !DILocation(line: 122, column: 25, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !15, line: 122, column: 13)
!216 = !DILocation(line: 122, column: 27, scope: !215)
!217 = !DILocation(line: 122, column: 13, scope: !212)
!218 = !DILocation(line: 124, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !15, line: 123, column: 13)
!220 = !DILocation(line: 124, column: 24, scope: !219)
!221 = !DILocation(line: 124, column: 27, scope: !219)
!222 = !DILocation(line: 125, column: 13, scope: !219)
!223 = !DILocation(line: 122, column: 34, scope: !215)
!224 = !DILocation(line: 122, column: 13, scope: !215)
!225 = distinct !{!225, !217, !226, !59}
!226 = !DILocation(line: 125, column: 13, scope: !212)
!227 = !DILocation(line: 127, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !199, file: !15, line: 127, column: 17)
!229 = !DILocation(line: 127, column: 22, scope: !228)
!230 = !DILocation(line: 127, column: 27, scope: !228)
!231 = !DILocation(line: 127, column: 30, scope: !228)
!232 = !DILocation(line: 127, column: 35, scope: !228)
!233 = !DILocation(line: 127, column: 17, scope: !199)
!234 = !DILocation(line: 129, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !228, file: !15, line: 128, column: 13)
!236 = !DILocation(line: 129, column: 24, scope: !235)
!237 = !DILocation(line: 129, column: 30, scope: !235)
!238 = !DILocation(line: 131, column: 23, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !15, line: 131, column: 17)
!240 = !DILocation(line: 131, column: 21, scope: !239)
!241 = !DILocation(line: 131, column: 28, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !15, line: 131, column: 17)
!243 = !DILocation(line: 131, column: 30, scope: !242)
!244 = !DILocation(line: 131, column: 17, scope: !239)
!245 = !DILocation(line: 133, column: 34, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !15, line: 132, column: 17)
!247 = !DILocation(line: 133, column: 41, scope: !246)
!248 = !DILocation(line: 133, column: 21, scope: !246)
!249 = !DILocation(line: 134, column: 17, scope: !246)
!250 = !DILocation(line: 131, column: 37, scope: !242)
!251 = !DILocation(line: 131, column: 17, scope: !242)
!252 = distinct !{!252, !244, !253, !59}
!253 = !DILocation(line: 134, column: 17, scope: !239)
!254 = !DILocation(line: 135, column: 13, scope: !235)
!255 = !DILocation(line: 138, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !228, file: !15, line: 137, column: 13)
!257 = !DILocation(line: 140, column: 18, scope: !199)
!258 = !DILocation(line: 140, column: 13, scope: !199)
!259 = !DILocation(line: 143, column: 1, scope: !185)
