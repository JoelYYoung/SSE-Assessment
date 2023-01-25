; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType = type { i32 }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i32 -1, i32* %data, align 4, !dbg !27
  store i32 10, i32* %data, align 4, !dbg !28
  %0 = load i32, i32* %data, align 4, !dbg !29
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType* %myUnion to i32*, !dbg !30
  store i32 %0, i32* %unionFirst, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType* %myUnion to i32*, !dbg !35
  %1 = load i32, i32* %unionSecond, align 4, !dbg !35
  store i32 %1, i32* %data1, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !36, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !39, metadata !DIExpression()), !dbg !40
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !41
  %2 = bitcast i8* %call to i32*, !dbg !42
  store i32* %2, i32** %buffer, align 8, !dbg !40
  %3 = load i32*, i32** %buffer, align 8, !dbg !43
  %cmp = icmp eq i32* %3, null, !dbg !45
  br i1 %cmp, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !47
  unreachable, !dbg !47

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !52
  %cmp2 = icmp slt i32 %4, 10, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !56
  %6 = load i32, i32* %i, align 4, !dbg !58
  %idxprom = sext i32 %6 to i64, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !56
  store i32 0, i32* %arrayidx, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !61
  %inc = add nsw i32 %7, 1, !dbg !61
  store i32 %inc, i32* %i, align 4, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !66
  %cmp3 = icmp sge i32 %8, 0, !dbg !68
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !69

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !70
  %10 = load i32, i32* %data1, align 4, !dbg !72
  %idxprom5 = sext i32 %10 to i64, !dbg !70
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !70
  store i32 1, i32* %arrayidx6, align 4, !dbg !73
  store i32 0, i32* %i, align 4, !dbg !74
  br label %for.cond7, !dbg !76

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !77
  %cmp8 = icmp slt i32 %11, 10, !dbg !79
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !80

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !81
  %13 = load i32, i32* %i, align 4, !dbg !83
  %idxprom10 = sext i32 %13 to i64, !dbg !81
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !81
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !81
  call void @printIntLine(i32 %14), !dbg !84
  br label %for.inc12, !dbg !85

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !86
  %inc13 = add nsw i32 %15, 1, !dbg !86
  store i32 %inc13, i32* %i, align 4, !dbg !86
  br label %for.cond7, !dbg !87, !llvm.loop !88

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !90

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !91
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !93
  %17 = bitcast i32* %16 to i8*, !dbg !93
  call void @free(i8* %17) #5, !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_good() #0 !dbg !96 {
entry:
  call void @goodG2B(), !dbg !97
  call void @goodB2G(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* null) #5, !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 %conv) #5, !dbg !112
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !120 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType* %myUnion, metadata !123, metadata !DIExpression()), !dbg !124
  store i32 -1, i32* %data, align 4, !dbg !125
  store i32 7, i32* %data, align 4, !dbg !126
  %0 = load i32, i32* %data, align 4, !dbg !127
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType* %myUnion to i32*, !dbg !128
  store i32 %0, i32* %unionFirst, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !130, metadata !DIExpression()), !dbg !132
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType* %myUnion to i32*, !dbg !133
  %1 = load i32, i32* %unionSecond, align 4, !dbg !133
  store i32 %1, i32* %data1, align 4, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %i, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !137, metadata !DIExpression()), !dbg !138
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !139
  %2 = bitcast i8* %call to i32*, !dbg !140
  store i32* %2, i32** %buffer, align 8, !dbg !138
  %3 = load i32*, i32** %buffer, align 8, !dbg !141
  %cmp = icmp eq i32* %3, null, !dbg !143
  br i1 %cmp, label %if.then, label %if.end, !dbg !144

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !150
  %cmp2 = icmp slt i32 %4, 10, !dbg !152
  br i1 %cmp2, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !154
  %6 = load i32, i32* %i, align 4, !dbg !156
  %idxprom = sext i32 %6 to i64, !dbg !154
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !159
  %inc = add nsw i32 %7, 1, !dbg !159
  store i32 %inc, i32* %i, align 4, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !163
  %cmp3 = icmp sge i32 %8, 0, !dbg !165
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !166

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !167
  %10 = load i32, i32* %data1, align 4, !dbg !169
  %idxprom5 = sext i32 %10 to i64, !dbg !167
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !167
  store i32 1, i32* %arrayidx6, align 4, !dbg !170
  store i32 0, i32* %i, align 4, !dbg !171
  br label %for.cond7, !dbg !173

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !174
  %cmp8 = icmp slt i32 %11, 10, !dbg !176
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !177

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !178
  %13 = load i32, i32* %i, align 4, !dbg !180
  %idxprom10 = sext i32 %13 to i64, !dbg !178
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !178
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !178
  call void @printIntLine(i32 %14), !dbg !181
  br label %for.inc12, !dbg !182

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !183
  %inc13 = add nsw i32 %15, 1, !dbg !183
  store i32 %inc13, i32* %i, align 4, !dbg !183
  br label %for.cond7, !dbg !184, !llvm.loop !185

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !187

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !188
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !190
  %17 = bitcast i32* %16 to i8*, !dbg !190
  call void @free(i8* %17) #5, !dbg !191
  ret void, !dbg !192
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !193 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType* %myUnion, metadata !196, metadata !DIExpression()), !dbg !197
  store i32 -1, i32* %data, align 4, !dbg !198
  store i32 10, i32* %data, align 4, !dbg !199
  %0 = load i32, i32* %data, align 4, !dbg !200
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType* %myUnion to i32*, !dbg !201
  store i32 %0, i32* %unionFirst, align 4, !dbg !202
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !203, metadata !DIExpression()), !dbg !205
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType* %myUnion to i32*, !dbg !206
  %1 = load i32, i32* %unionSecond, align 4, !dbg !206
  store i32 %1, i32* %data1, align 4, !dbg !205
  call void @llvm.dbg.declare(metadata i32* %i, metadata !207, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !210, metadata !DIExpression()), !dbg !211
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !212
  %2 = bitcast i8* %call to i32*, !dbg !213
  store i32* %2, i32** %buffer, align 8, !dbg !211
  %3 = load i32*, i32** %buffer, align 8, !dbg !214
  %cmp = icmp eq i32* %3, null, !dbg !216
  br i1 %cmp, label %if.then, label %if.end, !dbg !217

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !218
  unreachable, !dbg !218

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !220
  br label %for.cond, !dbg !222

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !223
  %cmp2 = icmp slt i32 %4, 10, !dbg !225
  br i1 %cmp2, label %for.body, label %for.end, !dbg !226

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !227
  %6 = load i32, i32* %i, align 4, !dbg !229
  %idxprom = sext i32 %6 to i64, !dbg !227
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !227
  store i32 0, i32* %arrayidx, align 4, !dbg !230
  br label %for.inc, !dbg !231

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !232
  %inc = add nsw i32 %7, 1, !dbg !232
  store i32 %inc, i32* %i, align 4, !dbg !232
  br label %for.cond, !dbg !233, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !236
  %cmp3 = icmp sge i32 %8, 0, !dbg !238
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !239

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data1, align 4, !dbg !240
  %cmp4 = icmp slt i32 %9, 10, !dbg !241
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !242

if.then5:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !243
  %11 = load i32, i32* %data1, align 4, !dbg !245
  %idxprom6 = sext i32 %11 to i64, !dbg !243
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %idxprom6, !dbg !243
  store i32 1, i32* %arrayidx7, align 4, !dbg !246
  store i32 0, i32* %i, align 4, !dbg !247
  br label %for.cond8, !dbg !249

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %12 = load i32, i32* %i, align 4, !dbg !250
  %cmp9 = icmp slt i32 %12, 10, !dbg !252
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !253

for.body10:                                       ; preds = %for.cond8
  %13 = load i32*, i32** %buffer, align 8, !dbg !254
  %14 = load i32, i32* %i, align 4, !dbg !256
  %idxprom11 = sext i32 %14 to i64, !dbg !254
  %arrayidx12 = getelementptr inbounds i32, i32* %13, i64 %idxprom11, !dbg !254
  %15 = load i32, i32* %arrayidx12, align 4, !dbg !254
  call void @printIntLine(i32 %15), !dbg !257
  br label %for.inc13, !dbg !258

for.inc13:                                        ; preds = %for.body10
  %16 = load i32, i32* %i, align 4, !dbg !259
  %inc14 = add nsw i32 %16, 1, !dbg !259
  store i32 %inc14, i32* %i, align 4, !dbg !259
  br label %for.cond8, !dbg !260, !llvm.loop !261

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !263

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !264
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %17 = load i32*, i32** %buffer, align 8, !dbg !266
  %18 = bitcast i32* %17 to i8*, !dbg !266
  call void @free(i8* %18) #5, !dbg !267
  ret void, !dbg !268
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !5)
!19 = !DILocation(line: 30, column: 9, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_unionType", file: !15, line: 24, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 20, size: 32, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 22, baseType: !5, size: 32)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 23, baseType: !5, size: 32)
!26 = !DILocation(line: 31, column: 68, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocation(line: 35, column: 10, scope: !14)
!29 = !DILocation(line: 36, column: 26, scope: !14)
!30 = !DILocation(line: 36, column: 13, scope: !14)
!31 = !DILocation(line: 36, column: 24, scope: !14)
!32 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 38, type: !5)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!34 = !DILocation(line: 38, column: 13, scope: !33)
!35 = !DILocation(line: 38, column: 28, scope: !33)
!36 = !DILocalVariable(name: "i", scope: !37, file: !15, line: 40, type: !5)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 39, column: 9)
!38 = !DILocation(line: 40, column: 17, scope: !37)
!39 = !DILocalVariable(name: "buffer", scope: !37, file: !15, line: 41, type: !4)
!40 = !DILocation(line: 41, column: 19, scope: !37)
!41 = !DILocation(line: 41, column: 35, scope: !37)
!42 = !DILocation(line: 41, column: 28, scope: !37)
!43 = !DILocation(line: 42, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !37, file: !15, line: 42, column: 17)
!45 = !DILocation(line: 42, column: 24, scope: !44)
!46 = !DILocation(line: 42, column: 17, scope: !37)
!47 = !DILocation(line: 42, column: 34, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !15, line: 42, column: 33)
!49 = !DILocation(line: 44, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !37, file: !15, line: 44, column: 13)
!51 = !DILocation(line: 44, column: 18, scope: !50)
!52 = !DILocation(line: 44, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !15, line: 44, column: 13)
!54 = !DILocation(line: 44, column: 27, scope: !53)
!55 = !DILocation(line: 44, column: 13, scope: !50)
!56 = !DILocation(line: 46, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !15, line: 45, column: 13)
!58 = !DILocation(line: 46, column: 24, scope: !57)
!59 = !DILocation(line: 46, column: 27, scope: !57)
!60 = !DILocation(line: 47, column: 13, scope: !57)
!61 = !DILocation(line: 44, column: 34, scope: !53)
!62 = !DILocation(line: 44, column: 13, scope: !53)
!63 = distinct !{!63, !55, !64, !65}
!64 = !DILocation(line: 47, column: 13, scope: !50)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 50, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !37, file: !15, line: 50, column: 17)
!68 = !DILocation(line: 50, column: 22, scope: !67)
!69 = !DILocation(line: 50, column: 17, scope: !37)
!70 = !DILocation(line: 52, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 51, column: 13)
!72 = !DILocation(line: 52, column: 24, scope: !71)
!73 = !DILocation(line: 52, column: 30, scope: !71)
!74 = !DILocation(line: 54, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 54, column: 17)
!76 = !DILocation(line: 54, column: 21, scope: !75)
!77 = !DILocation(line: 54, column: 28, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !15, line: 54, column: 17)
!79 = !DILocation(line: 54, column: 30, scope: !78)
!80 = !DILocation(line: 54, column: 17, scope: !75)
!81 = !DILocation(line: 56, column: 34, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 55, column: 17)
!83 = !DILocation(line: 56, column: 41, scope: !82)
!84 = !DILocation(line: 56, column: 21, scope: !82)
!85 = !DILocation(line: 57, column: 17, scope: !82)
!86 = !DILocation(line: 54, column: 37, scope: !78)
!87 = !DILocation(line: 54, column: 17, scope: !78)
!88 = distinct !{!88, !80, !89, !65}
!89 = !DILocation(line: 57, column: 17, scope: !75)
!90 = !DILocation(line: 58, column: 13, scope: !71)
!91 = !DILocation(line: 61, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !67, file: !15, line: 60, column: 13)
!93 = !DILocation(line: 63, column: 18, scope: !37)
!94 = !DILocation(line: 63, column: 13, scope: !37)
!95 = !DILocation(line: 66, column: 1, scope: !14)
!96 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_34_good", scope: !15, file: !15, line: 154, type: !16, scopeLine: 155, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocation(line: 156, column: 5, scope: !96)
!98 = !DILocation(line: 157, column: 5, scope: !96)
!99 = !DILocation(line: 158, column: 1, scope: !96)
!100 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 168, type: !101, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!5, !5, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !15, line: 168, type: !5)
!107 = !DILocation(line: 168, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !15, line: 168, type: !103)
!109 = !DILocation(line: 168, column: 27, scope: !100)
!110 = !DILocation(line: 171, column: 22, scope: !100)
!111 = !DILocation(line: 171, column: 12, scope: !100)
!112 = !DILocation(line: 171, column: 5, scope: !100)
!113 = !DILocation(line: 173, column: 5, scope: !100)
!114 = !DILocation(line: 174, column: 5, scope: !100)
!115 = !DILocation(line: 175, column: 5, scope: !100)
!116 = !DILocation(line: 178, column: 5, scope: !100)
!117 = !DILocation(line: 179, column: 5, scope: !100)
!118 = !DILocation(line: 180, column: 5, scope: !100)
!119 = !DILocation(line: 182, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 73, type: !16, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !15, line: 75, type: !5)
!122 = !DILocation(line: 75, column: 9, scope: !120)
!123 = !DILocalVariable(name: "myUnion", scope: !120, file: !15, line: 76, type: !21)
!124 = !DILocation(line: 76, column: 68, scope: !120)
!125 = !DILocation(line: 78, column: 10, scope: !120)
!126 = !DILocation(line: 81, column: 10, scope: !120)
!127 = !DILocation(line: 82, column: 26, scope: !120)
!128 = !DILocation(line: 82, column: 13, scope: !120)
!129 = !DILocation(line: 82, column: 24, scope: !120)
!130 = !DILocalVariable(name: "data", scope: !131, file: !15, line: 84, type: !5)
!131 = distinct !DILexicalBlock(scope: !120, file: !15, line: 83, column: 5)
!132 = !DILocation(line: 84, column: 13, scope: !131)
!133 = !DILocation(line: 84, column: 28, scope: !131)
!134 = !DILocalVariable(name: "i", scope: !135, file: !15, line: 86, type: !5)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 85, column: 9)
!136 = !DILocation(line: 86, column: 17, scope: !135)
!137 = !DILocalVariable(name: "buffer", scope: !135, file: !15, line: 87, type: !4)
!138 = !DILocation(line: 87, column: 19, scope: !135)
!139 = !DILocation(line: 87, column: 35, scope: !135)
!140 = !DILocation(line: 87, column: 28, scope: !135)
!141 = !DILocation(line: 88, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !15, line: 88, column: 17)
!143 = !DILocation(line: 88, column: 24, scope: !142)
!144 = !DILocation(line: 88, column: 17, scope: !135)
!145 = !DILocation(line: 88, column: 34, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 88, column: 33)
!147 = !DILocation(line: 90, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !135, file: !15, line: 90, column: 13)
!149 = !DILocation(line: 90, column: 18, scope: !148)
!150 = !DILocation(line: 90, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !15, line: 90, column: 13)
!152 = !DILocation(line: 90, column: 27, scope: !151)
!153 = !DILocation(line: 90, column: 13, scope: !148)
!154 = !DILocation(line: 92, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !15, line: 91, column: 13)
!156 = !DILocation(line: 92, column: 24, scope: !155)
!157 = !DILocation(line: 92, column: 27, scope: !155)
!158 = !DILocation(line: 93, column: 13, scope: !155)
!159 = !DILocation(line: 90, column: 34, scope: !151)
!160 = !DILocation(line: 90, column: 13, scope: !151)
!161 = distinct !{!161, !153, !162, !65}
!162 = !DILocation(line: 93, column: 13, scope: !148)
!163 = !DILocation(line: 96, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !135, file: !15, line: 96, column: 17)
!165 = !DILocation(line: 96, column: 22, scope: !164)
!166 = !DILocation(line: 96, column: 17, scope: !135)
!167 = !DILocation(line: 98, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 97, column: 13)
!169 = !DILocation(line: 98, column: 24, scope: !168)
!170 = !DILocation(line: 98, column: 30, scope: !168)
!171 = !DILocation(line: 100, column: 23, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !15, line: 100, column: 17)
!173 = !DILocation(line: 100, column: 21, scope: !172)
!174 = !DILocation(line: 100, column: 28, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !15, line: 100, column: 17)
!176 = !DILocation(line: 100, column: 30, scope: !175)
!177 = !DILocation(line: 100, column: 17, scope: !172)
!178 = !DILocation(line: 102, column: 34, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !15, line: 101, column: 17)
!180 = !DILocation(line: 102, column: 41, scope: !179)
!181 = !DILocation(line: 102, column: 21, scope: !179)
!182 = !DILocation(line: 103, column: 17, scope: !179)
!183 = !DILocation(line: 100, column: 37, scope: !175)
!184 = !DILocation(line: 100, column: 17, scope: !175)
!185 = distinct !{!185, !177, !186, !65}
!186 = !DILocation(line: 103, column: 17, scope: !172)
!187 = !DILocation(line: 104, column: 13, scope: !168)
!188 = !DILocation(line: 107, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !164, file: !15, line: 106, column: 13)
!190 = !DILocation(line: 109, column: 18, scope: !135)
!191 = !DILocation(line: 109, column: 13, scope: !135)
!192 = !DILocation(line: 112, column: 1, scope: !120)
!193 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 115, type: !16, scopeLine: 116, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!194 = !DILocalVariable(name: "data", scope: !193, file: !15, line: 117, type: !5)
!195 = !DILocation(line: 117, column: 9, scope: !193)
!196 = !DILocalVariable(name: "myUnion", scope: !193, file: !15, line: 118, type: !21)
!197 = !DILocation(line: 118, column: 68, scope: !193)
!198 = !DILocation(line: 120, column: 10, scope: !193)
!199 = !DILocation(line: 122, column: 10, scope: !193)
!200 = !DILocation(line: 123, column: 26, scope: !193)
!201 = !DILocation(line: 123, column: 13, scope: !193)
!202 = !DILocation(line: 123, column: 24, scope: !193)
!203 = !DILocalVariable(name: "data", scope: !204, file: !15, line: 125, type: !5)
!204 = distinct !DILexicalBlock(scope: !193, file: !15, line: 124, column: 5)
!205 = !DILocation(line: 125, column: 13, scope: !204)
!206 = !DILocation(line: 125, column: 28, scope: !204)
!207 = !DILocalVariable(name: "i", scope: !208, file: !15, line: 127, type: !5)
!208 = distinct !DILexicalBlock(scope: !204, file: !15, line: 126, column: 9)
!209 = !DILocation(line: 127, column: 17, scope: !208)
!210 = !DILocalVariable(name: "buffer", scope: !208, file: !15, line: 128, type: !4)
!211 = !DILocation(line: 128, column: 19, scope: !208)
!212 = !DILocation(line: 128, column: 35, scope: !208)
!213 = !DILocation(line: 128, column: 28, scope: !208)
!214 = !DILocation(line: 129, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !208, file: !15, line: 129, column: 17)
!216 = !DILocation(line: 129, column: 24, scope: !215)
!217 = !DILocation(line: 129, column: 17, scope: !208)
!218 = !DILocation(line: 129, column: 34, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !15, line: 129, column: 33)
!220 = !DILocation(line: 131, column: 20, scope: !221)
!221 = distinct !DILexicalBlock(scope: !208, file: !15, line: 131, column: 13)
!222 = !DILocation(line: 131, column: 18, scope: !221)
!223 = !DILocation(line: 131, column: 25, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !15, line: 131, column: 13)
!225 = !DILocation(line: 131, column: 27, scope: !224)
!226 = !DILocation(line: 131, column: 13, scope: !221)
!227 = !DILocation(line: 133, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !15, line: 132, column: 13)
!229 = !DILocation(line: 133, column: 24, scope: !228)
!230 = !DILocation(line: 133, column: 27, scope: !228)
!231 = !DILocation(line: 134, column: 13, scope: !228)
!232 = !DILocation(line: 131, column: 34, scope: !224)
!233 = !DILocation(line: 131, column: 13, scope: !224)
!234 = distinct !{!234, !226, !235, !65}
!235 = !DILocation(line: 134, column: 13, scope: !221)
!236 = !DILocation(line: 136, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !208, file: !15, line: 136, column: 17)
!238 = !DILocation(line: 136, column: 22, scope: !237)
!239 = !DILocation(line: 136, column: 27, scope: !237)
!240 = !DILocation(line: 136, column: 30, scope: !237)
!241 = !DILocation(line: 136, column: 35, scope: !237)
!242 = !DILocation(line: 136, column: 17, scope: !208)
!243 = !DILocation(line: 138, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !237, file: !15, line: 137, column: 13)
!245 = !DILocation(line: 138, column: 24, scope: !244)
!246 = !DILocation(line: 138, column: 30, scope: !244)
!247 = !DILocation(line: 140, column: 23, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !15, line: 140, column: 17)
!249 = !DILocation(line: 140, column: 21, scope: !248)
!250 = !DILocation(line: 140, column: 28, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !15, line: 140, column: 17)
!252 = !DILocation(line: 140, column: 30, scope: !251)
!253 = !DILocation(line: 140, column: 17, scope: !248)
!254 = !DILocation(line: 142, column: 34, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !15, line: 141, column: 17)
!256 = !DILocation(line: 142, column: 41, scope: !255)
!257 = !DILocation(line: 142, column: 21, scope: !255)
!258 = !DILocation(line: 143, column: 17, scope: !255)
!259 = !DILocation(line: 140, column: 37, scope: !251)
!260 = !DILocation(line: 140, column: 17, scope: !251)
!261 = distinct !{!261, !253, !262, !65}
!262 = !DILocation(line: 143, column: 17, scope: !248)
!263 = !DILocation(line: 144, column: 13, scope: !244)
!264 = !DILocation(line: 147, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !237, file: !15, line: 146, column: 13)
!266 = !DILocation(line: 149, column: 18, scope: !208)
!267 = !DILocation(line: 149, column: 13, scope: !208)
!268 = !DILocation(line: 152, column: 1, scope: !193)
