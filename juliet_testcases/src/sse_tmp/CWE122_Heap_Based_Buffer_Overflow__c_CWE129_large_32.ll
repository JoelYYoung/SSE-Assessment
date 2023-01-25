; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32_bad() #0 !dbg !14 {
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
  store i32 10, i32* %data1, align 4, !dbg !30
  %2 = load i32, i32* %data1, align 4, !dbg !31
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !32
  store i32 %2, i32* %3, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !37
  %5 = load i32, i32* %4, align 4, !dbg !38
  store i32 %5, i32* %data2, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %i, metadata !39, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !42, metadata !DIExpression()), !dbg !43
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !44
  %6 = bitcast i8* %call to i32*, !dbg !45
  store i32* %6, i32** %buffer, align 8, !dbg !43
  %7 = load i32*, i32** %buffer, align 8, !dbg !46
  %cmp = icmp eq i32* %7, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !50
  unreachable, !dbg !50

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !55
  %cmp3 = icmp slt i32 %8, 10, !dbg !57
  br i1 %cmp3, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %buffer, align 8, !dbg !59
  %10 = load i32, i32* %i, align 4, !dbg !61
  %idxprom = sext i32 %10 to i64, !dbg !59
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !59
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !64
  %inc = add nsw i32 %11, 1, !dbg !64
  store i32 %inc, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %data2, align 4, !dbg !69
  %cmp4 = icmp sge i32 %12, 0, !dbg !71
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !72

if.then5:                                         ; preds = %for.end
  %13 = load i32*, i32** %buffer, align 8, !dbg !73
  %14 = load i32, i32* %data2, align 4, !dbg !75
  %idxprom6 = sext i32 %14 to i64, !dbg !73
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 %idxprom6, !dbg !73
  store i32 1, i32* %arrayidx7, align 4, !dbg !76
  store i32 0, i32* %i, align 4, !dbg !77
  br label %for.cond8, !dbg !79

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %15 = load i32, i32* %i, align 4, !dbg !80
  %cmp9 = icmp slt i32 %15, 10, !dbg !82
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !83

for.body10:                                       ; preds = %for.cond8
  %16 = load i32*, i32** %buffer, align 8, !dbg !84
  %17 = load i32, i32* %i, align 4, !dbg !86
  %idxprom11 = sext i32 %17 to i64, !dbg !84
  %arrayidx12 = getelementptr inbounds i32, i32* %16, i64 %idxprom11, !dbg !84
  %18 = load i32, i32* %arrayidx12, align 4, !dbg !84
  call void @printIntLine(i32 %18), !dbg !87
  br label %for.inc13, !dbg !88

for.inc13:                                        ; preds = %for.body10
  %19 = load i32, i32* %i, align 4, !dbg !89
  %inc14 = add nsw i32 %19, 1, !dbg !89
  store i32 %inc14, i32* %i, align 4, !dbg !89
  br label %for.cond8, !dbg !90, !llvm.loop !91

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !93

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !94
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %20 = load i32*, i32** %buffer, align 8, !dbg !96
  %21 = bitcast i32* %20 to i8*, !dbg !96
  call void @free(i8* %21) #5, !dbg !97
  ret void, !dbg !98
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32_good() #0 !dbg !99 {
entry:
  call void @goodG2B(), !dbg !100
  call void @goodB2G(), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !103 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call i64 @time(i64* null) #5, !dbg !113
  %conv = trunc i64 %call to i32, !dbg !114
  call void @srand(i32 %conv) #5, !dbg !115
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32_good(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32_bad(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !123 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !126, metadata !DIExpression()), !dbg !127
  store i32* %data, i32** %dataPtr1, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !128, metadata !DIExpression()), !dbg !129
  store i32* %data, i32** %dataPtr2, align 8, !dbg !129
  store i32 -1, i32* %data, align 4, !dbg !130
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !131, metadata !DIExpression()), !dbg !133
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !134
  %1 = load i32, i32* %0, align 4, !dbg !135
  store i32 %1, i32* %data1, align 4, !dbg !133
  store i32 7, i32* %data1, align 4, !dbg !136
  %2 = load i32, i32* %data1, align 4, !dbg !137
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !138
  store i32 %2, i32* %3, align 4, !dbg !139
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !140, metadata !DIExpression()), !dbg !142
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !143
  %5 = load i32, i32* %4, align 4, !dbg !144
  store i32 %5, i32* %data2, align 4, !dbg !142
  call void @llvm.dbg.declare(metadata i32* %i, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !148, metadata !DIExpression()), !dbg !149
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !150
  %6 = bitcast i8* %call to i32*, !dbg !151
  store i32* %6, i32** %buffer, align 8, !dbg !149
  %7 = load i32*, i32** %buffer, align 8, !dbg !152
  %cmp = icmp eq i32* %7, null, !dbg !154
  br i1 %cmp, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !156
  unreachable, !dbg !156

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !161
  %cmp3 = icmp slt i32 %8, 10, !dbg !163
  br i1 %cmp3, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %buffer, align 8, !dbg !165
  %10 = load i32, i32* %i, align 4, !dbg !167
  %idxprom = sext i32 %10 to i64, !dbg !165
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !165
  store i32 0, i32* %arrayidx, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !170
  %inc = add nsw i32 %11, 1, !dbg !170
  store i32 %inc, i32* %i, align 4, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %data2, align 4, !dbg !174
  %cmp4 = icmp sge i32 %12, 0, !dbg !176
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !177

if.then5:                                         ; preds = %for.end
  %13 = load i32*, i32** %buffer, align 8, !dbg !178
  %14 = load i32, i32* %data2, align 4, !dbg !180
  %idxprom6 = sext i32 %14 to i64, !dbg !178
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 %idxprom6, !dbg !178
  store i32 1, i32* %arrayidx7, align 4, !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond8, !dbg !184

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %15 = load i32, i32* %i, align 4, !dbg !185
  %cmp9 = icmp slt i32 %15, 10, !dbg !187
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !188

for.body10:                                       ; preds = %for.cond8
  %16 = load i32*, i32** %buffer, align 8, !dbg !189
  %17 = load i32, i32* %i, align 4, !dbg !191
  %idxprom11 = sext i32 %17 to i64, !dbg !189
  %arrayidx12 = getelementptr inbounds i32, i32* %16, i64 %idxprom11, !dbg !189
  %18 = load i32, i32* %arrayidx12, align 4, !dbg !189
  call void @printIntLine(i32 %18), !dbg !192
  br label %for.inc13, !dbg !193

for.inc13:                                        ; preds = %for.body10
  %19 = load i32, i32* %i, align 4, !dbg !194
  %inc14 = add nsw i32 %19, 1, !dbg !194
  store i32 %inc14, i32* %i, align 4, !dbg !194
  br label %for.cond8, !dbg !195, !llvm.loop !196

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !198

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !199
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %20 = load i32*, i32** %buffer, align 8, !dbg !201
  %21 = bitcast i32* %20 to i8*, !dbg !201
  call void @free(i8* %21) #5, !dbg !202
  ret void, !dbg !203
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !204 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !205, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !207, metadata !DIExpression()), !dbg !208
  store i32* %data, i32** %dataPtr1, align 8, !dbg !208
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !209, metadata !DIExpression()), !dbg !210
  store i32* %data, i32** %dataPtr2, align 8, !dbg !210
  store i32 -1, i32* %data, align 4, !dbg !211
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !212, metadata !DIExpression()), !dbg !214
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !215
  %1 = load i32, i32* %0, align 4, !dbg !216
  store i32 %1, i32* %data1, align 4, !dbg !214
  store i32 10, i32* %data1, align 4, !dbg !217
  %2 = load i32, i32* %data1, align 4, !dbg !218
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !219
  store i32 %2, i32* %3, align 4, !dbg !220
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !221, metadata !DIExpression()), !dbg !223
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !224
  %5 = load i32, i32* %4, align 4, !dbg !225
  store i32 %5, i32* %data2, align 4, !dbg !223
  call void @llvm.dbg.declare(metadata i32* %i, metadata !226, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !229, metadata !DIExpression()), !dbg !230
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !231
  %6 = bitcast i8* %call to i32*, !dbg !232
  store i32* %6, i32** %buffer, align 8, !dbg !230
  %7 = load i32*, i32** %buffer, align 8, !dbg !233
  %cmp = icmp eq i32* %7, null, !dbg !235
  br i1 %cmp, label %if.then, label %if.end, !dbg !236

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !237
  unreachable, !dbg !237

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !239
  br label %for.cond, !dbg !241

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !242
  %cmp3 = icmp slt i32 %8, 10, !dbg !244
  br i1 %cmp3, label %for.body, label %for.end, !dbg !245

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %buffer, align 8, !dbg !246
  %10 = load i32, i32* %i, align 4, !dbg !248
  %idxprom = sext i32 %10 to i64, !dbg !246
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !246
  store i32 0, i32* %arrayidx, align 4, !dbg !249
  br label %for.inc, !dbg !250

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !251
  %inc = add nsw i32 %11, 1, !dbg !251
  store i32 %inc, i32* %i, align 4, !dbg !251
  br label %for.cond, !dbg !252, !llvm.loop !253

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %data2, align 4, !dbg !255
  %cmp4 = icmp sge i32 %12, 0, !dbg !257
  br i1 %cmp4, label %land.lhs.true, label %if.else, !dbg !258

land.lhs.true:                                    ; preds = %for.end
  %13 = load i32, i32* %data2, align 4, !dbg !259
  %cmp5 = icmp slt i32 %13, 10, !dbg !260
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !261

if.then6:                                         ; preds = %land.lhs.true
  %14 = load i32*, i32** %buffer, align 8, !dbg !262
  %15 = load i32, i32* %data2, align 4, !dbg !264
  %idxprom7 = sext i32 %15 to i64, !dbg !262
  %arrayidx8 = getelementptr inbounds i32, i32* %14, i64 %idxprom7, !dbg !262
  store i32 1, i32* %arrayidx8, align 4, !dbg !265
  store i32 0, i32* %i, align 4, !dbg !266
  br label %for.cond9, !dbg !268

for.cond9:                                        ; preds = %for.inc14, %if.then6
  %16 = load i32, i32* %i, align 4, !dbg !269
  %cmp10 = icmp slt i32 %16, 10, !dbg !271
  br i1 %cmp10, label %for.body11, label %for.end16, !dbg !272

for.body11:                                       ; preds = %for.cond9
  %17 = load i32*, i32** %buffer, align 8, !dbg !273
  %18 = load i32, i32* %i, align 4, !dbg !275
  %idxprom12 = sext i32 %18 to i64, !dbg !273
  %arrayidx13 = getelementptr inbounds i32, i32* %17, i64 %idxprom12, !dbg !273
  %19 = load i32, i32* %arrayidx13, align 4, !dbg !273
  call void @printIntLine(i32 %19), !dbg !276
  br label %for.inc14, !dbg !277

for.inc14:                                        ; preds = %for.body11
  %20 = load i32, i32* %i, align 4, !dbg !278
  %inc15 = add nsw i32 %20, 1, !dbg !278
  store i32 %inc15, i32* %i, align 4, !dbg !278
  br label %for.cond9, !dbg !279, !llvm.loop !280

for.end16:                                        ; preds = %for.cond9
  br label %if.end17, !dbg !282

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !283
  br label %if.end17

if.end17:                                         ; preds = %if.else, %for.end16
  %21 = load i32*, i32** %buffer, align 8, !dbg !285
  %22 = bitcast i32* %21 to i8*, !dbg !285
  call void @free(i8* %22) #5, !dbg !286
  ret void, !dbg !287
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocation(line: 32, column: 14, scope: !26)
!31 = !DILocation(line: 33, column: 21, scope: !26)
!32 = !DILocation(line: 33, column: 10, scope: !26)
!33 = !DILocation(line: 33, column: 19, scope: !26)
!34 = !DILocalVariable(name: "data", scope: !35, file: !15, line: 36, type: !5)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!36 = !DILocation(line: 36, column: 13, scope: !35)
!37 = !DILocation(line: 36, column: 21, scope: !35)
!38 = !DILocation(line: 36, column: 20, scope: !35)
!39 = !DILocalVariable(name: "i", scope: !40, file: !15, line: 38, type: !5)
!40 = distinct !DILexicalBlock(scope: !35, file: !15, line: 37, column: 9)
!41 = !DILocation(line: 38, column: 17, scope: !40)
!42 = !DILocalVariable(name: "buffer", scope: !40, file: !15, line: 39, type: !4)
!43 = !DILocation(line: 39, column: 19, scope: !40)
!44 = !DILocation(line: 39, column: 35, scope: !40)
!45 = !DILocation(line: 39, column: 28, scope: !40)
!46 = !DILocation(line: 40, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !40, file: !15, line: 40, column: 17)
!48 = !DILocation(line: 40, column: 24, scope: !47)
!49 = !DILocation(line: 40, column: 17, scope: !40)
!50 = !DILocation(line: 40, column: 34, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !15, line: 40, column: 33)
!52 = !DILocation(line: 42, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !40, file: !15, line: 42, column: 13)
!54 = !DILocation(line: 42, column: 18, scope: !53)
!55 = !DILocation(line: 42, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !15, line: 42, column: 13)
!57 = !DILocation(line: 42, column: 27, scope: !56)
!58 = !DILocation(line: 42, column: 13, scope: !53)
!59 = !DILocation(line: 44, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !15, line: 43, column: 13)
!61 = !DILocation(line: 44, column: 24, scope: !60)
!62 = !DILocation(line: 44, column: 27, scope: !60)
!63 = !DILocation(line: 45, column: 13, scope: !60)
!64 = !DILocation(line: 42, column: 34, scope: !56)
!65 = !DILocation(line: 42, column: 13, scope: !56)
!66 = distinct !{!66, !58, !67, !68}
!67 = !DILocation(line: 45, column: 13, scope: !53)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 48, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !40, file: !15, line: 48, column: 17)
!71 = !DILocation(line: 48, column: 22, scope: !70)
!72 = !DILocation(line: 48, column: 17, scope: !40)
!73 = !DILocation(line: 50, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 49, column: 13)
!75 = !DILocation(line: 50, column: 24, scope: !74)
!76 = !DILocation(line: 50, column: 30, scope: !74)
!77 = !DILocation(line: 52, column: 23, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 52, column: 17)
!79 = !DILocation(line: 52, column: 21, scope: !78)
!80 = !DILocation(line: 52, column: 28, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !15, line: 52, column: 17)
!82 = !DILocation(line: 52, column: 30, scope: !81)
!83 = !DILocation(line: 52, column: 17, scope: !78)
!84 = !DILocation(line: 54, column: 34, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 53, column: 17)
!86 = !DILocation(line: 54, column: 41, scope: !85)
!87 = !DILocation(line: 54, column: 21, scope: !85)
!88 = !DILocation(line: 55, column: 17, scope: !85)
!89 = !DILocation(line: 52, column: 37, scope: !81)
!90 = !DILocation(line: 52, column: 17, scope: !81)
!91 = distinct !{!91, !83, !92, !68}
!92 = !DILocation(line: 55, column: 17, scope: !78)
!93 = !DILocation(line: 56, column: 13, scope: !74)
!94 = !DILocation(line: 59, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !70, file: !15, line: 58, column: 13)
!96 = !DILocation(line: 61, column: 18, scope: !40)
!97 = !DILocation(line: 61, column: 13, scope: !40)
!98 = !DILocation(line: 64, column: 1, scope: !14)
!99 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_32_good", scope: !15, file: !15, line: 160, type: !16, scopeLine: 161, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocation(line: 162, column: 5, scope: !99)
!101 = !DILocation(line: 163, column: 5, scope: !99)
!102 = !DILocation(line: 164, column: 1, scope: !99)
!103 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 174, type: !104, scopeLine: 175, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!5, !5, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!109 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !15, line: 174, type: !5)
!110 = !DILocation(line: 174, column: 14, scope: !103)
!111 = !DILocalVariable(name: "argv", arg: 2, scope: !103, file: !15, line: 174, type: !106)
!112 = !DILocation(line: 174, column: 27, scope: !103)
!113 = !DILocation(line: 177, column: 22, scope: !103)
!114 = !DILocation(line: 177, column: 12, scope: !103)
!115 = !DILocation(line: 177, column: 5, scope: !103)
!116 = !DILocation(line: 179, column: 5, scope: !103)
!117 = !DILocation(line: 180, column: 5, scope: !103)
!118 = !DILocation(line: 181, column: 5, scope: !103)
!119 = !DILocation(line: 184, column: 5, scope: !103)
!120 = !DILocation(line: 185, column: 5, scope: !103)
!121 = !DILocation(line: 186, column: 5, scope: !103)
!122 = !DILocation(line: 188, column: 5, scope: !103)
!123 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 71, type: !16, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !15, line: 73, type: !5)
!125 = !DILocation(line: 73, column: 9, scope: !123)
!126 = !DILocalVariable(name: "dataPtr1", scope: !123, file: !15, line: 74, type: !4)
!127 = !DILocation(line: 74, column: 10, scope: !123)
!128 = !DILocalVariable(name: "dataPtr2", scope: !123, file: !15, line: 75, type: !4)
!129 = !DILocation(line: 75, column: 10, scope: !123)
!130 = !DILocation(line: 77, column: 10, scope: !123)
!131 = !DILocalVariable(name: "data", scope: !132, file: !15, line: 79, type: !5)
!132 = distinct !DILexicalBlock(scope: !123, file: !15, line: 78, column: 5)
!133 = !DILocation(line: 79, column: 13, scope: !132)
!134 = !DILocation(line: 79, column: 21, scope: !132)
!135 = !DILocation(line: 79, column: 20, scope: !132)
!136 = !DILocation(line: 82, column: 14, scope: !132)
!137 = !DILocation(line: 83, column: 21, scope: !132)
!138 = !DILocation(line: 83, column: 10, scope: !132)
!139 = !DILocation(line: 83, column: 19, scope: !132)
!140 = !DILocalVariable(name: "data", scope: !141, file: !15, line: 86, type: !5)
!141 = distinct !DILexicalBlock(scope: !123, file: !15, line: 85, column: 5)
!142 = !DILocation(line: 86, column: 13, scope: !141)
!143 = !DILocation(line: 86, column: 21, scope: !141)
!144 = !DILocation(line: 86, column: 20, scope: !141)
!145 = !DILocalVariable(name: "i", scope: !146, file: !15, line: 88, type: !5)
!146 = distinct !DILexicalBlock(scope: !141, file: !15, line: 87, column: 9)
!147 = !DILocation(line: 88, column: 17, scope: !146)
!148 = !DILocalVariable(name: "buffer", scope: !146, file: !15, line: 89, type: !4)
!149 = !DILocation(line: 89, column: 19, scope: !146)
!150 = !DILocation(line: 89, column: 35, scope: !146)
!151 = !DILocation(line: 89, column: 28, scope: !146)
!152 = !DILocation(line: 90, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !15, line: 90, column: 17)
!154 = !DILocation(line: 90, column: 24, scope: !153)
!155 = !DILocation(line: 90, column: 17, scope: !146)
!156 = !DILocation(line: 90, column: 34, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !15, line: 90, column: 33)
!158 = !DILocation(line: 92, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !146, file: !15, line: 92, column: 13)
!160 = !DILocation(line: 92, column: 18, scope: !159)
!161 = !DILocation(line: 92, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !15, line: 92, column: 13)
!163 = !DILocation(line: 92, column: 27, scope: !162)
!164 = !DILocation(line: 92, column: 13, scope: !159)
!165 = !DILocation(line: 94, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !15, line: 93, column: 13)
!167 = !DILocation(line: 94, column: 24, scope: !166)
!168 = !DILocation(line: 94, column: 27, scope: !166)
!169 = !DILocation(line: 95, column: 13, scope: !166)
!170 = !DILocation(line: 92, column: 34, scope: !162)
!171 = !DILocation(line: 92, column: 13, scope: !162)
!172 = distinct !{!172, !164, !173, !68}
!173 = !DILocation(line: 95, column: 13, scope: !159)
!174 = !DILocation(line: 98, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !146, file: !15, line: 98, column: 17)
!176 = !DILocation(line: 98, column: 22, scope: !175)
!177 = !DILocation(line: 98, column: 17, scope: !146)
!178 = !DILocation(line: 100, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !15, line: 99, column: 13)
!180 = !DILocation(line: 100, column: 24, scope: !179)
!181 = !DILocation(line: 100, column: 30, scope: !179)
!182 = !DILocation(line: 102, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !15, line: 102, column: 17)
!184 = !DILocation(line: 102, column: 21, scope: !183)
!185 = !DILocation(line: 102, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !15, line: 102, column: 17)
!187 = !DILocation(line: 102, column: 30, scope: !186)
!188 = !DILocation(line: 102, column: 17, scope: !183)
!189 = !DILocation(line: 104, column: 34, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !15, line: 103, column: 17)
!191 = !DILocation(line: 104, column: 41, scope: !190)
!192 = !DILocation(line: 104, column: 21, scope: !190)
!193 = !DILocation(line: 105, column: 17, scope: !190)
!194 = !DILocation(line: 102, column: 37, scope: !186)
!195 = !DILocation(line: 102, column: 17, scope: !186)
!196 = distinct !{!196, !188, !197, !68}
!197 = !DILocation(line: 105, column: 17, scope: !183)
!198 = !DILocation(line: 106, column: 13, scope: !179)
!199 = !DILocation(line: 109, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !175, file: !15, line: 108, column: 13)
!201 = !DILocation(line: 111, column: 18, scope: !146)
!202 = !DILocation(line: 111, column: 13, scope: !146)
!203 = !DILocation(line: 114, column: 1, scope: !123)
!204 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 117, type: !16, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!205 = !DILocalVariable(name: "data", scope: !204, file: !15, line: 119, type: !5)
!206 = !DILocation(line: 119, column: 9, scope: !204)
!207 = !DILocalVariable(name: "dataPtr1", scope: !204, file: !15, line: 120, type: !4)
!208 = !DILocation(line: 120, column: 10, scope: !204)
!209 = !DILocalVariable(name: "dataPtr2", scope: !204, file: !15, line: 121, type: !4)
!210 = !DILocation(line: 121, column: 10, scope: !204)
!211 = !DILocation(line: 123, column: 10, scope: !204)
!212 = !DILocalVariable(name: "data", scope: !213, file: !15, line: 125, type: !5)
!213 = distinct !DILexicalBlock(scope: !204, file: !15, line: 124, column: 5)
!214 = !DILocation(line: 125, column: 13, scope: !213)
!215 = !DILocation(line: 125, column: 21, scope: !213)
!216 = !DILocation(line: 125, column: 20, scope: !213)
!217 = !DILocation(line: 127, column: 14, scope: !213)
!218 = !DILocation(line: 128, column: 21, scope: !213)
!219 = !DILocation(line: 128, column: 10, scope: !213)
!220 = !DILocation(line: 128, column: 19, scope: !213)
!221 = !DILocalVariable(name: "data", scope: !222, file: !15, line: 131, type: !5)
!222 = distinct !DILexicalBlock(scope: !204, file: !15, line: 130, column: 5)
!223 = !DILocation(line: 131, column: 13, scope: !222)
!224 = !DILocation(line: 131, column: 21, scope: !222)
!225 = !DILocation(line: 131, column: 20, scope: !222)
!226 = !DILocalVariable(name: "i", scope: !227, file: !15, line: 133, type: !5)
!227 = distinct !DILexicalBlock(scope: !222, file: !15, line: 132, column: 9)
!228 = !DILocation(line: 133, column: 17, scope: !227)
!229 = !DILocalVariable(name: "buffer", scope: !227, file: !15, line: 134, type: !4)
!230 = !DILocation(line: 134, column: 19, scope: !227)
!231 = !DILocation(line: 134, column: 35, scope: !227)
!232 = !DILocation(line: 134, column: 28, scope: !227)
!233 = !DILocation(line: 135, column: 17, scope: !234)
!234 = distinct !DILexicalBlock(scope: !227, file: !15, line: 135, column: 17)
!235 = !DILocation(line: 135, column: 24, scope: !234)
!236 = !DILocation(line: 135, column: 17, scope: !227)
!237 = !DILocation(line: 135, column: 34, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !15, line: 135, column: 33)
!239 = !DILocation(line: 137, column: 20, scope: !240)
!240 = distinct !DILexicalBlock(scope: !227, file: !15, line: 137, column: 13)
!241 = !DILocation(line: 137, column: 18, scope: !240)
!242 = !DILocation(line: 137, column: 25, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !15, line: 137, column: 13)
!244 = !DILocation(line: 137, column: 27, scope: !243)
!245 = !DILocation(line: 137, column: 13, scope: !240)
!246 = !DILocation(line: 139, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !15, line: 138, column: 13)
!248 = !DILocation(line: 139, column: 24, scope: !247)
!249 = !DILocation(line: 139, column: 27, scope: !247)
!250 = !DILocation(line: 140, column: 13, scope: !247)
!251 = !DILocation(line: 137, column: 34, scope: !243)
!252 = !DILocation(line: 137, column: 13, scope: !243)
!253 = distinct !{!253, !245, !254, !68}
!254 = !DILocation(line: 140, column: 13, scope: !240)
!255 = !DILocation(line: 142, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !227, file: !15, line: 142, column: 17)
!257 = !DILocation(line: 142, column: 22, scope: !256)
!258 = !DILocation(line: 142, column: 27, scope: !256)
!259 = !DILocation(line: 142, column: 30, scope: !256)
!260 = !DILocation(line: 142, column: 35, scope: !256)
!261 = !DILocation(line: 142, column: 17, scope: !227)
!262 = !DILocation(line: 144, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !256, file: !15, line: 143, column: 13)
!264 = !DILocation(line: 144, column: 24, scope: !263)
!265 = !DILocation(line: 144, column: 30, scope: !263)
!266 = !DILocation(line: 146, column: 23, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !15, line: 146, column: 17)
!268 = !DILocation(line: 146, column: 21, scope: !267)
!269 = !DILocation(line: 146, column: 28, scope: !270)
!270 = distinct !DILexicalBlock(scope: !267, file: !15, line: 146, column: 17)
!271 = !DILocation(line: 146, column: 30, scope: !270)
!272 = !DILocation(line: 146, column: 17, scope: !267)
!273 = !DILocation(line: 148, column: 34, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !15, line: 147, column: 17)
!275 = !DILocation(line: 148, column: 41, scope: !274)
!276 = !DILocation(line: 148, column: 21, scope: !274)
!277 = !DILocation(line: 149, column: 17, scope: !274)
!278 = !DILocation(line: 146, column: 37, scope: !270)
!279 = !DILocation(line: 146, column: 17, scope: !270)
!280 = distinct !{!280, !272, !281, !68}
!281 = !DILocation(line: 149, column: 17, scope: !267)
!282 = !DILocation(line: 150, column: 13, scope: !263)
!283 = !DILocation(line: 153, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !256, file: !15, line: 152, column: 13)
!285 = !DILocation(line: 155, column: 18, scope: !227)
!286 = !DILocation(line: 155, column: 13, scope: !227)
!287 = !DILocation(line: 158, column: 1, scope: !204)
