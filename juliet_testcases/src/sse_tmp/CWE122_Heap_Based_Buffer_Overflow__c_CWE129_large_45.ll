; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_badData = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_goodG2BData = internal global i32 0, align 4, !dbg !11
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_goodB2GData = internal global i32 0, align 4, !dbg !14
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 -1, i32* %data, align 4, !dbg !27
  store i32 10, i32* %data, align 4, !dbg !28
  %0 = load i32, i32* %data, align 4, !dbg !29
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_badData, align 4, !dbg !30
  call void @badSink(), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_good() #0 !dbg !33 {
entry:
  call void @goodG2B(), !dbg !34
  call void @goodB2G(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %call = call i64 @time(i64* null) #5, !dbg !47
  %conv = trunc i64 %call to i32, !dbg !48
  call void @srand(i32 %conv) #5, !dbg !49
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !50
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_good(), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_bad(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !55
  ret i32 0, !dbg !56
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !57 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_badData, align 4, !dbg !60
  store i32 %0, i32* %data, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata i32* %i, metadata !61, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !66
  %1 = bitcast i8* %call to i32*, !dbg !67
  store i32* %1, i32** %buffer, align 8, !dbg !65
  %2 = load i32*, i32** %buffer, align 8, !dbg !68
  %cmp = icmp eq i32* %2, null, !dbg !70
  br i1 %cmp, label %if.then, label %if.end, !dbg !71

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !76

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !77
  %cmp1 = icmp slt i32 %3, 10, !dbg !79
  br i1 %cmp1, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !81
  %5 = load i32, i32* %i, align 4, !dbg !83
  %idxprom = sext i32 %5 to i64, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !86
  %inc = add nsw i32 %6, 1, !dbg !86
  store i32 %inc, i32* %i, align 4, !dbg !86
  br label %for.cond, !dbg !87, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !91
  %cmp2 = icmp sge i32 %7, 0, !dbg !93
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !94

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !95
  %9 = load i32, i32* %data, align 4, !dbg !97
  %idxprom4 = sext i32 %9 to i64, !dbg !95
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !95
  store i32 1, i32* %arrayidx5, align 4, !dbg !98
  store i32 0, i32* %i, align 4, !dbg !99
  br label %for.cond6, !dbg !101

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !102
  %cmp7 = icmp slt i32 %10, 10, !dbg !104
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !105

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !106
  %12 = load i32, i32* %i, align 4, !dbg !108
  %idxprom9 = sext i32 %12 to i64, !dbg !106
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !106
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !106
  call void @printIntLine(i32 %13), !dbg !109
  br label %for.inc11, !dbg !110

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !111
  %inc12 = add nsw i32 %14, 1, !dbg !111
  store i32 %inc12, i32* %i, align 4, !dbg !111
  br label %for.cond6, !dbg !112, !llvm.loop !113

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !115

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !118
  %16 = bitcast i32* %15 to i8*, !dbg !118
  call void @free(i8* %16) #5, !dbg !119
  ret void, !dbg !120
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !121 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i32 -1, i32* %data, align 4, !dbg !124
  store i32 7, i32* %data, align 4, !dbg !125
  %0 = load i32, i32* %data, align 4, !dbg !126
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_goodG2BData, align 4, !dbg !127
  call void @goodG2BSink(), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !130 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_goodG2BData, align 4, !dbg !133
  store i32 %0, i32* %data, align 4, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %i, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !137, metadata !DIExpression()), !dbg !138
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !139
  %1 = bitcast i8* %call to i32*, !dbg !140
  store i32* %1, i32** %buffer, align 8, !dbg !138
  %2 = load i32*, i32** %buffer, align 8, !dbg !141
  %cmp = icmp eq i32* %2, null, !dbg !143
  br i1 %cmp, label %if.then, label %if.end, !dbg !144

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !150
  %cmp1 = icmp slt i32 %3, 10, !dbg !152
  br i1 %cmp1, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !154
  %5 = load i32, i32* %i, align 4, !dbg !156
  %idxprom = sext i32 %5 to i64, !dbg !154
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !159
  %inc = add nsw i32 %6, 1, !dbg !159
  store i32 %inc, i32* %i, align 4, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !163
  %cmp2 = icmp sge i32 %7, 0, !dbg !165
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !166

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !167
  %9 = load i32, i32* %data, align 4, !dbg !169
  %idxprom4 = sext i32 %9 to i64, !dbg !167
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !167
  store i32 1, i32* %arrayidx5, align 4, !dbg !170
  store i32 0, i32* %i, align 4, !dbg !171
  br label %for.cond6, !dbg !173

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !174
  %cmp7 = icmp slt i32 %10, 10, !dbg !176
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !177

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !178
  %12 = load i32, i32* %i, align 4, !dbg !180
  %idxprom9 = sext i32 %12 to i64, !dbg !178
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !178
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !178
  call void @printIntLine(i32 %13), !dbg !181
  br label %for.inc11, !dbg !182

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !183
  %inc12 = add nsw i32 %14, 1, !dbg !183
  store i32 %inc12, i32* %i, align 4, !dbg !183
  br label %for.cond6, !dbg !184, !llvm.loop !185

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !187

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !188
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !190
  %16 = bitcast i32* %15 to i8*, !dbg !190
  call void @free(i8* %16) #5, !dbg !191
  ret void, !dbg !192
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !193 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !194, metadata !DIExpression()), !dbg !195
  store i32 -1, i32* %data, align 4, !dbg !196
  store i32 10, i32* %data, align 4, !dbg !197
  %0 = load i32, i32* %data, align 4, !dbg !198
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_goodB2GData, align 4, !dbg !199
  call void @goodB2GSink(), !dbg !200
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !202 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !203, metadata !DIExpression()), !dbg !204
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_goodB2GData, align 4, !dbg !205
  store i32 %0, i32* %data, align 4, !dbg !204
  call void @llvm.dbg.declare(metadata i32* %i, metadata !206, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !209, metadata !DIExpression()), !dbg !210
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !211
  %1 = bitcast i8* %call to i32*, !dbg !212
  store i32* %1, i32** %buffer, align 8, !dbg !210
  %2 = load i32*, i32** %buffer, align 8, !dbg !213
  %cmp = icmp eq i32* %2, null, !dbg !215
  br i1 %cmp, label %if.then, label %if.end, !dbg !216

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !217
  unreachable, !dbg !217

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !219
  br label %for.cond, !dbg !221

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !222
  %cmp1 = icmp slt i32 %3, 10, !dbg !224
  br i1 %cmp1, label %for.body, label %for.end, !dbg !225

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !226
  %5 = load i32, i32* %i, align 4, !dbg !228
  %idxprom = sext i32 %5 to i64, !dbg !226
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !226
  store i32 0, i32* %arrayidx, align 4, !dbg !229
  br label %for.inc, !dbg !230

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !231
  %inc = add nsw i32 %6, 1, !dbg !231
  store i32 %inc, i32* %i, align 4, !dbg !231
  br label %for.cond, !dbg !232, !llvm.loop !233

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !235
  %cmp2 = icmp sge i32 %7, 0, !dbg !237
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !238

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !239
  %cmp3 = icmp slt i32 %8, 10, !dbg !240
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !241

if.then4:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !242
  %10 = load i32, i32* %data, align 4, !dbg !244
  %idxprom5 = sext i32 %10 to i64, !dbg !242
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !242
  store i32 1, i32* %arrayidx6, align 4, !dbg !245
  store i32 0, i32* %i, align 4, !dbg !246
  br label %for.cond7, !dbg !248

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !249
  %cmp8 = icmp slt i32 %11, 10, !dbg !251
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !252

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !253
  %13 = load i32, i32* %i, align 4, !dbg !255
  %idxprom10 = sext i32 %13 to i64, !dbg !253
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !253
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !253
  call void @printIntLine(i32 %14), !dbg !256
  br label %for.inc12, !dbg !257

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !258
  %inc13 = add nsw i32 %15, 1, !dbg !258
  store i32 %inc13, i32* %i, align 4, !dbg !258
  br label %for.cond7, !dbg !259, !llvm.loop !260

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !262

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !263
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !265
  %17 = bitcast i32* %16 to i8*, !dbg !265
  call void @free(i8* %17) #5, !dbg !266
  ret void, !dbg !267
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_badData", scope: !2, file: !13, line: 20, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !14}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_goodG2BData", scope: !2, file: !13, line: 21, type: !8, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45.c", directory: "/root/SSE-Assessment")
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_goodB2GData", scope: !2, file: !13, line: 22, type: !8, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_bad", scope: !13, file: !13, line: 57, type: !23, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 59, type: !8)
!26 = !DILocation(line: 59, column: 9, scope: !22)
!27 = !DILocation(line: 61, column: 10, scope: !22)
!28 = !DILocation(line: 63, column: 10, scope: !22)
!29 = !DILocation(line: 64, column: 68, scope: !22)
!30 = !DILocation(line: 64, column: 66, scope: !22)
!31 = !DILocation(line: 65, column: 5, scope: !22)
!32 = !DILocation(line: 66, column: 1, scope: !22)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_45_good", scope: !13, file: !13, line: 158, type: !23, scopeLine: 159, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DILocation(line: 160, column: 5, scope: !33)
!35 = !DILocation(line: 161, column: 5, scope: !33)
!36 = !DILocation(line: 162, column: 1, scope: !33)
!37 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 172, type: !38, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{!8, !8, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !13, line: 172, type: !8)
!44 = !DILocation(line: 172, column: 14, scope: !37)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !13, line: 172, type: !40)
!46 = !DILocation(line: 172, column: 27, scope: !37)
!47 = !DILocation(line: 175, column: 22, scope: !37)
!48 = !DILocation(line: 175, column: 12, scope: !37)
!49 = !DILocation(line: 175, column: 5, scope: !37)
!50 = !DILocation(line: 177, column: 5, scope: !37)
!51 = !DILocation(line: 178, column: 5, scope: !37)
!52 = !DILocation(line: 179, column: 5, scope: !37)
!53 = !DILocation(line: 182, column: 5, scope: !37)
!54 = !DILocation(line: 183, column: 5, scope: !37)
!55 = !DILocation(line: 184, column: 5, scope: !37)
!56 = !DILocation(line: 186, column: 5, scope: !37)
!57 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocalVariable(name: "data", scope: !57, file: !13, line: 28, type: !8)
!59 = !DILocation(line: 28, column: 9, scope: !57)
!60 = !DILocation(line: 28, column: 16, scope: !57)
!61 = !DILocalVariable(name: "i", scope: !62, file: !13, line: 30, type: !8)
!62 = distinct !DILexicalBlock(scope: !57, file: !13, line: 29, column: 5)
!63 = !DILocation(line: 30, column: 13, scope: !62)
!64 = !DILocalVariable(name: "buffer", scope: !62, file: !13, line: 31, type: !7)
!65 = !DILocation(line: 31, column: 15, scope: !62)
!66 = !DILocation(line: 31, column: 31, scope: !62)
!67 = !DILocation(line: 31, column: 24, scope: !62)
!68 = !DILocation(line: 32, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !62, file: !13, line: 32, column: 13)
!70 = !DILocation(line: 32, column: 20, scope: !69)
!71 = !DILocation(line: 32, column: 13, scope: !62)
!72 = !DILocation(line: 32, column: 30, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !13, line: 32, column: 29)
!74 = !DILocation(line: 34, column: 16, scope: !75)
!75 = distinct !DILexicalBlock(scope: !62, file: !13, line: 34, column: 9)
!76 = !DILocation(line: 34, column: 14, scope: !75)
!77 = !DILocation(line: 34, column: 21, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !13, line: 34, column: 9)
!79 = !DILocation(line: 34, column: 23, scope: !78)
!80 = !DILocation(line: 34, column: 9, scope: !75)
!81 = !DILocation(line: 36, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !13, line: 35, column: 9)
!83 = !DILocation(line: 36, column: 20, scope: !82)
!84 = !DILocation(line: 36, column: 23, scope: !82)
!85 = !DILocation(line: 37, column: 9, scope: !82)
!86 = !DILocation(line: 34, column: 30, scope: !78)
!87 = !DILocation(line: 34, column: 9, scope: !78)
!88 = distinct !{!88, !80, !89, !90}
!89 = !DILocation(line: 37, column: 9, scope: !75)
!90 = !{!"llvm.loop.mustprogress"}
!91 = !DILocation(line: 40, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !62, file: !13, line: 40, column: 13)
!93 = !DILocation(line: 40, column: 18, scope: !92)
!94 = !DILocation(line: 40, column: 13, scope: !62)
!95 = !DILocation(line: 42, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !13, line: 41, column: 9)
!97 = !DILocation(line: 42, column: 20, scope: !96)
!98 = !DILocation(line: 42, column: 26, scope: !96)
!99 = !DILocation(line: 44, column: 19, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !13, line: 44, column: 13)
!101 = !DILocation(line: 44, column: 17, scope: !100)
!102 = !DILocation(line: 44, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !13, line: 44, column: 13)
!104 = !DILocation(line: 44, column: 26, scope: !103)
!105 = !DILocation(line: 44, column: 13, scope: !100)
!106 = !DILocation(line: 46, column: 30, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !13, line: 45, column: 13)
!108 = !DILocation(line: 46, column: 37, scope: !107)
!109 = !DILocation(line: 46, column: 17, scope: !107)
!110 = !DILocation(line: 47, column: 13, scope: !107)
!111 = !DILocation(line: 44, column: 33, scope: !103)
!112 = !DILocation(line: 44, column: 13, scope: !103)
!113 = distinct !{!113, !105, !114, !90}
!114 = !DILocation(line: 47, column: 13, scope: !100)
!115 = !DILocation(line: 48, column: 9, scope: !96)
!116 = !DILocation(line: 51, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !92, file: !13, line: 50, column: 9)
!118 = !DILocation(line: 53, column: 14, scope: !62)
!119 = !DILocation(line: 53, column: 9, scope: !62)
!120 = !DILocation(line: 55, column: 1, scope: !57)
!121 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 104, type: !23, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", scope: !121, file: !13, line: 106, type: !8)
!123 = !DILocation(line: 106, column: 9, scope: !121)
!124 = !DILocation(line: 108, column: 10, scope: !121)
!125 = !DILocation(line: 111, column: 10, scope: !121)
!126 = !DILocation(line: 112, column: 72, scope: !121)
!127 = !DILocation(line: 112, column: 70, scope: !121)
!128 = !DILocation(line: 113, column: 5, scope: !121)
!129 = !DILocation(line: 114, column: 1, scope: !121)
!130 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 73, type: !23, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!131 = !DILocalVariable(name: "data", scope: !130, file: !13, line: 75, type: !8)
!132 = !DILocation(line: 75, column: 9, scope: !130)
!133 = !DILocation(line: 75, column: 16, scope: !130)
!134 = !DILocalVariable(name: "i", scope: !135, file: !13, line: 77, type: !8)
!135 = distinct !DILexicalBlock(scope: !130, file: !13, line: 76, column: 5)
!136 = !DILocation(line: 77, column: 13, scope: !135)
!137 = !DILocalVariable(name: "buffer", scope: !135, file: !13, line: 78, type: !7)
!138 = !DILocation(line: 78, column: 15, scope: !135)
!139 = !DILocation(line: 78, column: 31, scope: !135)
!140 = !DILocation(line: 78, column: 24, scope: !135)
!141 = !DILocation(line: 79, column: 13, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !13, line: 79, column: 13)
!143 = !DILocation(line: 79, column: 20, scope: !142)
!144 = !DILocation(line: 79, column: 13, scope: !135)
!145 = !DILocation(line: 79, column: 30, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !13, line: 79, column: 29)
!147 = !DILocation(line: 81, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !135, file: !13, line: 81, column: 9)
!149 = !DILocation(line: 81, column: 14, scope: !148)
!150 = !DILocation(line: 81, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !13, line: 81, column: 9)
!152 = !DILocation(line: 81, column: 23, scope: !151)
!153 = !DILocation(line: 81, column: 9, scope: !148)
!154 = !DILocation(line: 83, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !13, line: 82, column: 9)
!156 = !DILocation(line: 83, column: 20, scope: !155)
!157 = !DILocation(line: 83, column: 23, scope: !155)
!158 = !DILocation(line: 84, column: 9, scope: !155)
!159 = !DILocation(line: 81, column: 30, scope: !151)
!160 = !DILocation(line: 81, column: 9, scope: !151)
!161 = distinct !{!161, !153, !162, !90}
!162 = !DILocation(line: 84, column: 9, scope: !148)
!163 = !DILocation(line: 87, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !135, file: !13, line: 87, column: 13)
!165 = !DILocation(line: 87, column: 18, scope: !164)
!166 = !DILocation(line: 87, column: 13, scope: !135)
!167 = !DILocation(line: 89, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !13, line: 88, column: 9)
!169 = !DILocation(line: 89, column: 20, scope: !168)
!170 = !DILocation(line: 89, column: 26, scope: !168)
!171 = !DILocation(line: 91, column: 19, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !13, line: 91, column: 13)
!173 = !DILocation(line: 91, column: 17, scope: !172)
!174 = !DILocation(line: 91, column: 24, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !13, line: 91, column: 13)
!176 = !DILocation(line: 91, column: 26, scope: !175)
!177 = !DILocation(line: 91, column: 13, scope: !172)
!178 = !DILocation(line: 93, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !13, line: 92, column: 13)
!180 = !DILocation(line: 93, column: 37, scope: !179)
!181 = !DILocation(line: 93, column: 17, scope: !179)
!182 = !DILocation(line: 94, column: 13, scope: !179)
!183 = !DILocation(line: 91, column: 33, scope: !175)
!184 = !DILocation(line: 91, column: 13, scope: !175)
!185 = distinct !{!185, !177, !186, !90}
!186 = !DILocation(line: 94, column: 13, scope: !172)
!187 = !DILocation(line: 95, column: 9, scope: !168)
!188 = !DILocation(line: 98, column: 13, scope: !189)
!189 = distinct !DILexicalBlock(scope: !164, file: !13, line: 97, column: 9)
!190 = !DILocation(line: 100, column: 14, scope: !135)
!191 = !DILocation(line: 100, column: 9, scope: !135)
!192 = !DILocation(line: 102, column: 1, scope: !130)
!193 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 147, type: !23, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!194 = !DILocalVariable(name: "data", scope: !193, file: !13, line: 149, type: !8)
!195 = !DILocation(line: 149, column: 9, scope: !193)
!196 = !DILocation(line: 151, column: 10, scope: !193)
!197 = !DILocation(line: 153, column: 10, scope: !193)
!198 = !DILocation(line: 154, column: 72, scope: !193)
!199 = !DILocation(line: 154, column: 70, scope: !193)
!200 = !DILocation(line: 155, column: 5, scope: !193)
!201 = !DILocation(line: 156, column: 1, scope: !193)
!202 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 117, type: !23, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!203 = !DILocalVariable(name: "data", scope: !202, file: !13, line: 119, type: !8)
!204 = !DILocation(line: 119, column: 9, scope: !202)
!205 = !DILocation(line: 119, column: 16, scope: !202)
!206 = !DILocalVariable(name: "i", scope: !207, file: !13, line: 121, type: !8)
!207 = distinct !DILexicalBlock(scope: !202, file: !13, line: 120, column: 5)
!208 = !DILocation(line: 121, column: 13, scope: !207)
!209 = !DILocalVariable(name: "buffer", scope: !207, file: !13, line: 122, type: !7)
!210 = !DILocation(line: 122, column: 15, scope: !207)
!211 = !DILocation(line: 122, column: 31, scope: !207)
!212 = !DILocation(line: 122, column: 24, scope: !207)
!213 = !DILocation(line: 123, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !207, file: !13, line: 123, column: 13)
!215 = !DILocation(line: 123, column: 20, scope: !214)
!216 = !DILocation(line: 123, column: 13, scope: !207)
!217 = !DILocation(line: 123, column: 30, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !13, line: 123, column: 29)
!219 = !DILocation(line: 125, column: 16, scope: !220)
!220 = distinct !DILexicalBlock(scope: !207, file: !13, line: 125, column: 9)
!221 = !DILocation(line: 125, column: 14, scope: !220)
!222 = !DILocation(line: 125, column: 21, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !13, line: 125, column: 9)
!224 = !DILocation(line: 125, column: 23, scope: !223)
!225 = !DILocation(line: 125, column: 9, scope: !220)
!226 = !DILocation(line: 127, column: 13, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !13, line: 126, column: 9)
!228 = !DILocation(line: 127, column: 20, scope: !227)
!229 = !DILocation(line: 127, column: 23, scope: !227)
!230 = !DILocation(line: 128, column: 9, scope: !227)
!231 = !DILocation(line: 125, column: 30, scope: !223)
!232 = !DILocation(line: 125, column: 9, scope: !223)
!233 = distinct !{!233, !225, !234, !90}
!234 = !DILocation(line: 128, column: 9, scope: !220)
!235 = !DILocation(line: 130, column: 13, scope: !236)
!236 = distinct !DILexicalBlock(scope: !207, file: !13, line: 130, column: 13)
!237 = !DILocation(line: 130, column: 18, scope: !236)
!238 = !DILocation(line: 130, column: 23, scope: !236)
!239 = !DILocation(line: 130, column: 26, scope: !236)
!240 = !DILocation(line: 130, column: 31, scope: !236)
!241 = !DILocation(line: 130, column: 13, scope: !207)
!242 = !DILocation(line: 132, column: 13, scope: !243)
!243 = distinct !DILexicalBlock(scope: !236, file: !13, line: 131, column: 9)
!244 = !DILocation(line: 132, column: 20, scope: !243)
!245 = !DILocation(line: 132, column: 26, scope: !243)
!246 = !DILocation(line: 134, column: 19, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !13, line: 134, column: 13)
!248 = !DILocation(line: 134, column: 17, scope: !247)
!249 = !DILocation(line: 134, column: 24, scope: !250)
!250 = distinct !DILexicalBlock(scope: !247, file: !13, line: 134, column: 13)
!251 = !DILocation(line: 134, column: 26, scope: !250)
!252 = !DILocation(line: 134, column: 13, scope: !247)
!253 = !DILocation(line: 136, column: 30, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !13, line: 135, column: 13)
!255 = !DILocation(line: 136, column: 37, scope: !254)
!256 = !DILocation(line: 136, column: 17, scope: !254)
!257 = !DILocation(line: 137, column: 13, scope: !254)
!258 = !DILocation(line: 134, column: 33, scope: !250)
!259 = !DILocation(line: 134, column: 13, scope: !250)
!260 = distinct !{!260, !252, !261, !90}
!261 = !DILocation(line: 137, column: 13, scope: !247)
!262 = !DILocation(line: 138, column: 9, scope: !243)
!263 = !DILocation(line: 141, column: 13, scope: !264)
!264 = distinct !DILexicalBlock(scope: !236, file: !13, line: 140, column: 9)
!265 = !DILocation(line: 143, column: 14, scope: !207)
!266 = !DILocation(line: 143, column: 9, scope: !207)
!267 = !DILocation(line: 145, column: 1, scope: !202)
