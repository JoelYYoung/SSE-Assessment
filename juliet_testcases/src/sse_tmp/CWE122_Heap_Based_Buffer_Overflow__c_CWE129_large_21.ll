; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !11
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !14
@goodG2BStatic = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 -1, i32* %data, align 4, !dbg !29
  store i32 10, i32* %data, align 4, !dbg !30
  store i32 1, i32* @badStatic, align 4, !dbg !31
  %0 = load i32, i32* %data, align 4, !dbg !32
  call void @badSink(i32 %0), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !35 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i32, i32* @badStatic, align 4, !dbg !40
  %tobool = icmp ne i32 %0, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.end16, !dbg !42

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !49
  %1 = bitcast i8* %call to i32*, !dbg !50
  store i32* %1, i32** %buffer, align 8, !dbg !48
  %2 = load i32*, i32** %buffer, align 8, !dbg !51
  %cmp = icmp eq i32* %2, null, !dbg !53
  br i1 %cmp, label %if.then1, label %if.end, !dbg !54

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !55
  unreachable, !dbg !55

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !60
  %cmp2 = icmp slt i32 %3, 10, !dbg !62
  br i1 %cmp2, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !64
  %5 = load i32, i32* %i, align 4, !dbg !66
  %idxprom = sext i32 %5 to i64, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !69
  %inc = add nsw i32 %6, 1, !dbg !69
  store i32 %inc, i32* %i, align 4, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !74
  %cmp3 = icmp sge i32 %7, 0, !dbg !76
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !77

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !78
  %9 = load i32, i32* %data.addr, align 4, !dbg !80
  %idxprom5 = sext i32 %9 to i64, !dbg !78
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !78
  store i32 1, i32* %arrayidx6, align 4, !dbg !81
  store i32 0, i32* %i, align 4, !dbg !82
  br label %for.cond7, !dbg !84

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !85
  %cmp8 = icmp slt i32 %10, 10, !dbg !87
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !88

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !89
  %12 = load i32, i32* %i, align 4, !dbg !91
  %idxprom10 = sext i32 %12 to i64, !dbg !89
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !89
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !89
  call void @printIntLine(i32 %13), !dbg !92
  br label %for.inc12, !dbg !93

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !94
  %inc13 = add nsw i32 %14, 1, !dbg !94
  store i32 %inc13, i32* %i, align 4, !dbg !94
  br label %for.cond7, !dbg !95, !llvm.loop !96

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !98

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !101
  %16 = bitcast i32* %15 to i8*, !dbg !101
  call void @free(i8* %16) #5, !dbg !102
  br label %if.end16, !dbg !103

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_good() #0 !dbg !105 {
entry:
  call void @goodB2G1(), !dbg !106
  call void @goodB2G2(), !dbg !107
  call void @goodG2B(), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !110 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !116, metadata !DIExpression()), !dbg !117
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call i64 @time(i64* null) #5, !dbg !120
  %conv = trunc i64 %call to i32, !dbg !121
  call void @srand(i32 %conv) #5, !dbg !122
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !123
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_good(), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !126
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_bad(), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !128
  ret i32 0, !dbg !129
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !130 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 -1, i32* %data, align 4, !dbg !133
  store i32 10, i32* %data, align 4, !dbg !134
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !135
  %0 = load i32, i32* %data, align 4, !dbg !136
  call void @goodB2G1Sink(i32 %0), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !139 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !140, metadata !DIExpression()), !dbg !141
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !142
  %tobool = icmp ne i32 %0, 0, !dbg !142
  br i1 %tobool, label %if.then, label %if.else, !dbg !144

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !145
  br label %if.end18, !dbg !147

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !152, metadata !DIExpression()), !dbg !153
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !154
  %1 = bitcast i8* %call to i32*, !dbg !155
  store i32* %1, i32** %buffer, align 8, !dbg !153
  %2 = load i32*, i32** %buffer, align 8, !dbg !156
  %cmp = icmp eq i32* %2, null, !dbg !158
  br i1 %cmp, label %if.then1, label %if.end, !dbg !159

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !160
  unreachable, !dbg !160

if.end:                                           ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !165
  %cmp2 = icmp slt i32 %3, 10, !dbg !167
  br i1 %cmp2, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !169
  %5 = load i32, i32* %i, align 4, !dbg !171
  %idxprom = sext i32 %5 to i64, !dbg !169
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !169
  store i32 0, i32* %arrayidx, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !174
  %inc = add nsw i32 %6, 1, !dbg !174
  store i32 %inc, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !178
  %cmp3 = icmp sge i32 %7, 0, !dbg !180
  br i1 %cmp3, label %land.lhs.true, label %if.else16, !dbg !181

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !182
  %cmp4 = icmp slt i32 %8, 10, !dbg !183
  br i1 %cmp4, label %if.then5, label %if.else16, !dbg !184

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !185
  %10 = load i32, i32* %data.addr, align 4, !dbg !187
  %idxprom6 = sext i32 %10 to i64, !dbg !185
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !185
  store i32 1, i32* %arrayidx7, align 4, !dbg !188
  store i32 0, i32* %i, align 4, !dbg !189
  br label %for.cond8, !dbg !191

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !192
  %cmp9 = icmp slt i32 %11, 10, !dbg !194
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !195

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !196
  %13 = load i32, i32* %i, align 4, !dbg !198
  %idxprom11 = sext i32 %13 to i64, !dbg !196
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !196
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !196
  call void @printIntLine(i32 %14), !dbg !199
  br label %for.inc13, !dbg !200

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !201
  %inc14 = add nsw i32 %15, 1, !dbg !201
  store i32 %inc14, i32* %i, align 4, !dbg !201
  br label %for.cond8, !dbg !202, !llvm.loop !203

for.end15:                                        ; preds = %for.cond8
  br label %if.end17, !dbg !205

if.else16:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !206
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !208
  %17 = bitcast i32* %16 to i8*, !dbg !208
  call void @free(i8* %17) #5, !dbg !209
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then
  ret void, !dbg !210
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !211 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 -1, i32* %data, align 4, !dbg !214
  store i32 10, i32* %data, align 4, !dbg !215
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !216
  %0 = load i32, i32* %data, align 4, !dbg !217
  call void @goodB2G2Sink(i32 %0), !dbg !218
  ret void, !dbg !219
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !220 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !221, metadata !DIExpression()), !dbg !222
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !223
  %tobool = icmp ne i32 %0, 0, !dbg !223
  br i1 %tobool, label %if.then, label %if.end17, !dbg !225

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !226, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !230, metadata !DIExpression()), !dbg !231
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !232
  %1 = bitcast i8* %call to i32*, !dbg !233
  store i32* %1, i32** %buffer, align 8, !dbg !231
  %2 = load i32*, i32** %buffer, align 8, !dbg !234
  %cmp = icmp eq i32* %2, null, !dbg !236
  br i1 %cmp, label %if.then1, label %if.end, !dbg !237

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !238
  unreachable, !dbg !238

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !240
  br label %for.cond, !dbg !242

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !243
  %cmp2 = icmp slt i32 %3, 10, !dbg !245
  br i1 %cmp2, label %for.body, label %for.end, !dbg !246

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !247
  %5 = load i32, i32* %i, align 4, !dbg !249
  %idxprom = sext i32 %5 to i64, !dbg !247
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !247
  store i32 0, i32* %arrayidx, align 4, !dbg !250
  br label %for.inc, !dbg !251

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !252
  %inc = add nsw i32 %6, 1, !dbg !252
  store i32 %inc, i32* %i, align 4, !dbg !252
  br label %for.cond, !dbg !253, !llvm.loop !254

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !256
  %cmp3 = icmp sge i32 %7, 0, !dbg !258
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !259

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !260
  %cmp4 = icmp slt i32 %8, 10, !dbg !261
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !262

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !263
  %10 = load i32, i32* %data.addr, align 4, !dbg !265
  %idxprom6 = sext i32 %10 to i64, !dbg !263
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !263
  store i32 1, i32* %arrayidx7, align 4, !dbg !266
  store i32 0, i32* %i, align 4, !dbg !267
  br label %for.cond8, !dbg !269

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !270
  %cmp9 = icmp slt i32 %11, 10, !dbg !272
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !273

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !274
  %13 = load i32, i32* %i, align 4, !dbg !276
  %idxprom11 = sext i32 %13 to i64, !dbg !274
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !274
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !274
  call void @printIntLine(i32 %14), !dbg !277
  br label %for.inc13, !dbg !278

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !279
  %inc14 = add nsw i32 %15, 1, !dbg !279
  store i32 %inc14, i32* %i, align 4, !dbg !279
  br label %for.cond8, !dbg !280, !llvm.loop !281

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !283

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !284
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !286
  %17 = bitcast i32* %16 to i8*, !dbg !286
  call void @free(i8* %17) #5, !dbg !287
  br label %if.end17, !dbg !288

if.end17:                                         ; preds = %if.end16, %entry
  ret void, !dbg !289
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !290 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !291, metadata !DIExpression()), !dbg !292
  store i32 -1, i32* %data, align 4, !dbg !293
  store i32 7, i32* %data, align 4, !dbg !294
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !295
  %0 = load i32, i32* %data, align 4, !dbg !296
  call void @goodG2BSink(i32 %0), !dbg !297
  ret void, !dbg !298
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !299 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !300, metadata !DIExpression()), !dbg !301
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !302
  %tobool = icmp ne i32 %0, 0, !dbg !302
  br i1 %tobool, label %if.then, label %if.end16, !dbg !304

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !305, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !309, metadata !DIExpression()), !dbg !310
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !311
  %1 = bitcast i8* %call to i32*, !dbg !312
  store i32* %1, i32** %buffer, align 8, !dbg !310
  %2 = load i32*, i32** %buffer, align 8, !dbg !313
  %cmp = icmp eq i32* %2, null, !dbg !315
  br i1 %cmp, label %if.then1, label %if.end, !dbg !316

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !317
  unreachable, !dbg !317

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !319
  br label %for.cond, !dbg !321

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !322
  %cmp2 = icmp slt i32 %3, 10, !dbg !324
  br i1 %cmp2, label %for.body, label %for.end, !dbg !325

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !326
  %5 = load i32, i32* %i, align 4, !dbg !328
  %idxprom = sext i32 %5 to i64, !dbg !326
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !326
  store i32 0, i32* %arrayidx, align 4, !dbg !329
  br label %for.inc, !dbg !330

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !331
  %inc = add nsw i32 %6, 1, !dbg !331
  store i32 %inc, i32* %i, align 4, !dbg !331
  br label %for.cond, !dbg !332, !llvm.loop !333

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !335
  %cmp3 = icmp sge i32 %7, 0, !dbg !337
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !338

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !339
  %9 = load i32, i32* %data.addr, align 4, !dbg !341
  %idxprom5 = sext i32 %9 to i64, !dbg !339
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !339
  store i32 1, i32* %arrayidx6, align 4, !dbg !342
  store i32 0, i32* %i, align 4, !dbg !343
  br label %for.cond7, !dbg !345

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !346
  %cmp8 = icmp slt i32 %10, 10, !dbg !348
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !349

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !350
  %12 = load i32, i32* %i, align 4, !dbg !352
  %idxprom10 = sext i32 %12 to i64, !dbg !350
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !350
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !350
  call void @printIntLine(i32 %13), !dbg !353
  br label %for.inc12, !dbg !354

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !355
  %inc13 = add nsw i32 %14, 1, !dbg !355
  store i32 %inc13, i32* %i, align 4, !dbg !355
  br label %for.cond7, !dbg !356, !llvm.loop !357

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !359

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !360
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !362
  %16 = bitcast i32* %15 to i8*, !dbg !362
  call void @free(i8* %16) #5, !dbg !363
  br label %if.end16, !dbg !364

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !365
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 23, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !14, !16}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !13, line: 74, type: !8, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !13, line: 75, type: !8, isLocal: true, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !13, line: 76, type: !8, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_bad", scope: !13, file: !13, line: 58, type: !25, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !13, line: 60, type: !8)
!28 = !DILocation(line: 60, column: 9, scope: !24)
!29 = !DILocation(line: 62, column: 10, scope: !24)
!30 = !DILocation(line: 64, column: 10, scope: !24)
!31 = !DILocation(line: 65, column: 15, scope: !24)
!32 = !DILocation(line: 66, column: 13, scope: !24)
!33 = !DILocation(line: 66, column: 5, scope: !24)
!34 = !DILocation(line: 67, column: 1, scope: !24)
!35 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 25, type: !36, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !8}
!38 = !DILocalVariable(name: "data", arg: 1, scope: !35, file: !13, line: 25, type: !8)
!39 = !DILocation(line: 25, column: 25, scope: !35)
!40 = !DILocation(line: 27, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !13, line: 27, column: 8)
!42 = !DILocation(line: 27, column: 8, scope: !35)
!43 = !DILocalVariable(name: "i", scope: !44, file: !13, line: 30, type: !8)
!44 = distinct !DILexicalBlock(scope: !45, file: !13, line: 29, column: 9)
!45 = distinct !DILexicalBlock(scope: !41, file: !13, line: 28, column: 5)
!46 = !DILocation(line: 30, column: 17, scope: !44)
!47 = !DILocalVariable(name: "buffer", scope: !44, file: !13, line: 31, type: !7)
!48 = !DILocation(line: 31, column: 19, scope: !44)
!49 = !DILocation(line: 31, column: 35, scope: !44)
!50 = !DILocation(line: 31, column: 28, scope: !44)
!51 = !DILocation(line: 32, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !13, line: 32, column: 17)
!53 = !DILocation(line: 32, column: 24, scope: !52)
!54 = !DILocation(line: 32, column: 17, scope: !44)
!55 = !DILocation(line: 32, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !13, line: 32, column: 33)
!57 = !DILocation(line: 34, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !13, line: 34, column: 13)
!59 = !DILocation(line: 34, column: 18, scope: !58)
!60 = !DILocation(line: 34, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !13, line: 34, column: 13)
!62 = !DILocation(line: 34, column: 27, scope: !61)
!63 = !DILocation(line: 34, column: 13, scope: !58)
!64 = !DILocation(line: 36, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !13, line: 35, column: 13)
!66 = !DILocation(line: 36, column: 24, scope: !65)
!67 = !DILocation(line: 36, column: 27, scope: !65)
!68 = !DILocation(line: 37, column: 13, scope: !65)
!69 = !DILocation(line: 34, column: 34, scope: !61)
!70 = !DILocation(line: 34, column: 13, scope: !61)
!71 = distinct !{!71, !63, !72, !73}
!72 = !DILocation(line: 37, column: 13, scope: !58)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 40, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !44, file: !13, line: 40, column: 17)
!76 = !DILocation(line: 40, column: 22, scope: !75)
!77 = !DILocation(line: 40, column: 17, scope: !44)
!78 = !DILocation(line: 42, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !13, line: 41, column: 13)
!80 = !DILocation(line: 42, column: 24, scope: !79)
!81 = !DILocation(line: 42, column: 30, scope: !79)
!82 = !DILocation(line: 44, column: 23, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !13, line: 44, column: 17)
!84 = !DILocation(line: 44, column: 21, scope: !83)
!85 = !DILocation(line: 44, column: 28, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !13, line: 44, column: 17)
!87 = !DILocation(line: 44, column: 30, scope: !86)
!88 = !DILocation(line: 44, column: 17, scope: !83)
!89 = !DILocation(line: 46, column: 34, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !13, line: 45, column: 17)
!91 = !DILocation(line: 46, column: 41, scope: !90)
!92 = !DILocation(line: 46, column: 21, scope: !90)
!93 = !DILocation(line: 47, column: 17, scope: !90)
!94 = !DILocation(line: 44, column: 37, scope: !86)
!95 = !DILocation(line: 44, column: 17, scope: !86)
!96 = distinct !{!96, !88, !97, !73}
!97 = !DILocation(line: 47, column: 17, scope: !83)
!98 = !DILocation(line: 48, column: 13, scope: !79)
!99 = !DILocation(line: 51, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !75, file: !13, line: 50, column: 13)
!101 = !DILocation(line: 53, column: 18, scope: !44)
!102 = !DILocation(line: 53, column: 13, scope: !44)
!103 = !DILocation(line: 55, column: 5, scope: !45)
!104 = !DILocation(line: 56, column: 1, scope: !35)
!105 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_good", scope: !13, file: !13, line: 217, type: !25, scopeLine: 218, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocation(line: 219, column: 5, scope: !105)
!107 = !DILocation(line: 220, column: 5, scope: !105)
!108 = !DILocation(line: 221, column: 5, scope: !105)
!109 = !DILocation(line: 222, column: 1, scope: !105)
!110 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 233, type: !111, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DISubroutineType(types: !112)
!112 = !{!8, !8, !113}
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!116 = !DILocalVariable(name: "argc", arg: 1, scope: !110, file: !13, line: 233, type: !8)
!117 = !DILocation(line: 233, column: 14, scope: !110)
!118 = !DILocalVariable(name: "argv", arg: 2, scope: !110, file: !13, line: 233, type: !113)
!119 = !DILocation(line: 233, column: 27, scope: !110)
!120 = !DILocation(line: 236, column: 22, scope: !110)
!121 = !DILocation(line: 236, column: 12, scope: !110)
!122 = !DILocation(line: 236, column: 5, scope: !110)
!123 = !DILocation(line: 238, column: 5, scope: !110)
!124 = !DILocation(line: 239, column: 5, scope: !110)
!125 = !DILocation(line: 240, column: 5, scope: !110)
!126 = !DILocation(line: 243, column: 5, scope: !110)
!127 = !DILocation(line: 244, column: 5, scope: !110)
!128 = !DILocation(line: 245, column: 5, scope: !110)
!129 = !DILocation(line: 247, column: 5, scope: !110)
!130 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 116, type: !25, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!131 = !DILocalVariable(name: "data", scope: !130, file: !13, line: 118, type: !8)
!132 = !DILocation(line: 118, column: 9, scope: !130)
!133 = !DILocation(line: 120, column: 10, scope: !130)
!134 = !DILocation(line: 122, column: 10, scope: !130)
!135 = !DILocation(line: 123, column: 20, scope: !130)
!136 = !DILocation(line: 124, column: 18, scope: !130)
!137 = !DILocation(line: 124, column: 5, scope: !130)
!138 = !DILocation(line: 125, column: 1, scope: !130)
!139 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !13, file: !13, line: 79, type: !36, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", arg: 1, scope: !139, file: !13, line: 79, type: !8)
!141 = !DILocation(line: 79, column: 30, scope: !139)
!142 = !DILocation(line: 81, column: 8, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !13, line: 81, column: 8)
!144 = !DILocation(line: 81, column: 8, scope: !139)
!145 = !DILocation(line: 84, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !13, line: 82, column: 5)
!147 = !DILocation(line: 85, column: 5, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !149, file: !13, line: 89, type: !8)
!149 = distinct !DILexicalBlock(scope: !150, file: !13, line: 88, column: 9)
!150 = distinct !DILexicalBlock(scope: !143, file: !13, line: 87, column: 5)
!151 = !DILocation(line: 89, column: 17, scope: !149)
!152 = !DILocalVariable(name: "buffer", scope: !149, file: !13, line: 90, type: !7)
!153 = !DILocation(line: 90, column: 19, scope: !149)
!154 = !DILocation(line: 90, column: 35, scope: !149)
!155 = !DILocation(line: 90, column: 28, scope: !149)
!156 = !DILocation(line: 91, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !149, file: !13, line: 91, column: 17)
!158 = !DILocation(line: 91, column: 24, scope: !157)
!159 = !DILocation(line: 91, column: 17, scope: !149)
!160 = !DILocation(line: 91, column: 34, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 91, column: 33)
!162 = !DILocation(line: 93, column: 20, scope: !163)
!163 = distinct !DILexicalBlock(scope: !149, file: !13, line: 93, column: 13)
!164 = !DILocation(line: 93, column: 18, scope: !163)
!165 = !DILocation(line: 93, column: 25, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !13, line: 93, column: 13)
!167 = !DILocation(line: 93, column: 27, scope: !166)
!168 = !DILocation(line: 93, column: 13, scope: !163)
!169 = !DILocation(line: 95, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !13, line: 94, column: 13)
!171 = !DILocation(line: 95, column: 24, scope: !170)
!172 = !DILocation(line: 95, column: 27, scope: !170)
!173 = !DILocation(line: 96, column: 13, scope: !170)
!174 = !DILocation(line: 93, column: 34, scope: !166)
!175 = !DILocation(line: 93, column: 13, scope: !166)
!176 = distinct !{!176, !168, !177, !73}
!177 = !DILocation(line: 96, column: 13, scope: !163)
!178 = !DILocation(line: 98, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !149, file: !13, line: 98, column: 17)
!180 = !DILocation(line: 98, column: 22, scope: !179)
!181 = !DILocation(line: 98, column: 27, scope: !179)
!182 = !DILocation(line: 98, column: 30, scope: !179)
!183 = !DILocation(line: 98, column: 35, scope: !179)
!184 = !DILocation(line: 98, column: 17, scope: !149)
!185 = !DILocation(line: 100, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !179, file: !13, line: 99, column: 13)
!187 = !DILocation(line: 100, column: 24, scope: !186)
!188 = !DILocation(line: 100, column: 30, scope: !186)
!189 = !DILocation(line: 102, column: 23, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !13, line: 102, column: 17)
!191 = !DILocation(line: 102, column: 21, scope: !190)
!192 = !DILocation(line: 102, column: 28, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !13, line: 102, column: 17)
!194 = !DILocation(line: 102, column: 30, scope: !193)
!195 = !DILocation(line: 102, column: 17, scope: !190)
!196 = !DILocation(line: 104, column: 34, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !13, line: 103, column: 17)
!198 = !DILocation(line: 104, column: 41, scope: !197)
!199 = !DILocation(line: 104, column: 21, scope: !197)
!200 = !DILocation(line: 105, column: 17, scope: !197)
!201 = !DILocation(line: 102, column: 37, scope: !193)
!202 = !DILocation(line: 102, column: 17, scope: !193)
!203 = distinct !{!203, !195, !204, !73}
!204 = !DILocation(line: 105, column: 17, scope: !190)
!205 = !DILocation(line: 106, column: 13, scope: !186)
!206 = !DILocation(line: 109, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !179, file: !13, line: 108, column: 13)
!208 = !DILocation(line: 111, column: 18, scope: !149)
!209 = !DILocation(line: 111, column: 13, scope: !149)
!210 = !DILocation(line: 114, column: 1, scope: !139)
!211 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 160, type: !25, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!212 = !DILocalVariable(name: "data", scope: !211, file: !13, line: 162, type: !8)
!213 = !DILocation(line: 162, column: 9, scope: !211)
!214 = !DILocation(line: 164, column: 10, scope: !211)
!215 = !DILocation(line: 166, column: 10, scope: !211)
!216 = !DILocation(line: 167, column: 20, scope: !211)
!217 = !DILocation(line: 168, column: 18, scope: !211)
!218 = !DILocation(line: 168, column: 5, scope: !211)
!219 = !DILocation(line: 169, column: 1, scope: !211)
!220 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !13, file: !13, line: 128, type: !36, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!221 = !DILocalVariable(name: "data", arg: 1, scope: !220, file: !13, line: 128, type: !8)
!222 = !DILocation(line: 128, column: 30, scope: !220)
!223 = !DILocation(line: 130, column: 8, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !13, line: 130, column: 8)
!225 = !DILocation(line: 130, column: 8, scope: !220)
!226 = !DILocalVariable(name: "i", scope: !227, file: !13, line: 133, type: !8)
!227 = distinct !DILexicalBlock(scope: !228, file: !13, line: 132, column: 9)
!228 = distinct !DILexicalBlock(scope: !224, file: !13, line: 131, column: 5)
!229 = !DILocation(line: 133, column: 17, scope: !227)
!230 = !DILocalVariable(name: "buffer", scope: !227, file: !13, line: 134, type: !7)
!231 = !DILocation(line: 134, column: 19, scope: !227)
!232 = !DILocation(line: 134, column: 35, scope: !227)
!233 = !DILocation(line: 134, column: 28, scope: !227)
!234 = !DILocation(line: 135, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !227, file: !13, line: 135, column: 17)
!236 = !DILocation(line: 135, column: 24, scope: !235)
!237 = !DILocation(line: 135, column: 17, scope: !227)
!238 = !DILocation(line: 135, column: 34, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !13, line: 135, column: 33)
!240 = !DILocation(line: 137, column: 20, scope: !241)
!241 = distinct !DILexicalBlock(scope: !227, file: !13, line: 137, column: 13)
!242 = !DILocation(line: 137, column: 18, scope: !241)
!243 = !DILocation(line: 137, column: 25, scope: !244)
!244 = distinct !DILexicalBlock(scope: !241, file: !13, line: 137, column: 13)
!245 = !DILocation(line: 137, column: 27, scope: !244)
!246 = !DILocation(line: 137, column: 13, scope: !241)
!247 = !DILocation(line: 139, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !13, line: 138, column: 13)
!249 = !DILocation(line: 139, column: 24, scope: !248)
!250 = !DILocation(line: 139, column: 27, scope: !248)
!251 = !DILocation(line: 140, column: 13, scope: !248)
!252 = !DILocation(line: 137, column: 34, scope: !244)
!253 = !DILocation(line: 137, column: 13, scope: !244)
!254 = distinct !{!254, !246, !255, !73}
!255 = !DILocation(line: 140, column: 13, scope: !241)
!256 = !DILocation(line: 142, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !227, file: !13, line: 142, column: 17)
!258 = !DILocation(line: 142, column: 22, scope: !257)
!259 = !DILocation(line: 142, column: 27, scope: !257)
!260 = !DILocation(line: 142, column: 30, scope: !257)
!261 = !DILocation(line: 142, column: 35, scope: !257)
!262 = !DILocation(line: 142, column: 17, scope: !227)
!263 = !DILocation(line: 144, column: 17, scope: !264)
!264 = distinct !DILexicalBlock(scope: !257, file: !13, line: 143, column: 13)
!265 = !DILocation(line: 144, column: 24, scope: !264)
!266 = !DILocation(line: 144, column: 30, scope: !264)
!267 = !DILocation(line: 146, column: 23, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !13, line: 146, column: 17)
!269 = !DILocation(line: 146, column: 21, scope: !268)
!270 = !DILocation(line: 146, column: 28, scope: !271)
!271 = distinct !DILexicalBlock(scope: !268, file: !13, line: 146, column: 17)
!272 = !DILocation(line: 146, column: 30, scope: !271)
!273 = !DILocation(line: 146, column: 17, scope: !268)
!274 = !DILocation(line: 148, column: 34, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !13, line: 147, column: 17)
!276 = !DILocation(line: 148, column: 41, scope: !275)
!277 = !DILocation(line: 148, column: 21, scope: !275)
!278 = !DILocation(line: 149, column: 17, scope: !275)
!279 = !DILocation(line: 146, column: 37, scope: !271)
!280 = !DILocation(line: 146, column: 17, scope: !271)
!281 = distinct !{!281, !273, !282, !73}
!282 = !DILocation(line: 149, column: 17, scope: !268)
!283 = !DILocation(line: 150, column: 13, scope: !264)
!284 = !DILocation(line: 153, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !257, file: !13, line: 152, column: 13)
!286 = !DILocation(line: 155, column: 18, scope: !227)
!287 = !DILocation(line: 155, column: 13, scope: !227)
!288 = !DILocation(line: 157, column: 5, scope: !228)
!289 = !DILocation(line: 158, column: 1, scope: !220)
!290 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 205, type: !25, scopeLine: 206, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!291 = !DILocalVariable(name: "data", scope: !290, file: !13, line: 207, type: !8)
!292 = !DILocation(line: 207, column: 9, scope: !290)
!293 = !DILocation(line: 209, column: 10, scope: !290)
!294 = !DILocation(line: 212, column: 10, scope: !290)
!295 = !DILocation(line: 213, column: 19, scope: !290)
!296 = !DILocation(line: 214, column: 17, scope: !290)
!297 = !DILocation(line: 214, column: 5, scope: !290)
!298 = !DILocation(line: 215, column: 1, scope: !290)
!299 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 172, type: !36, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!300 = !DILocalVariable(name: "data", arg: 1, scope: !299, file: !13, line: 172, type: !8)
!301 = !DILocation(line: 172, column: 29, scope: !299)
!302 = !DILocation(line: 174, column: 8, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !13, line: 174, column: 8)
!304 = !DILocation(line: 174, column: 8, scope: !299)
!305 = !DILocalVariable(name: "i", scope: !306, file: !13, line: 177, type: !8)
!306 = distinct !DILexicalBlock(scope: !307, file: !13, line: 176, column: 9)
!307 = distinct !DILexicalBlock(scope: !303, file: !13, line: 175, column: 5)
!308 = !DILocation(line: 177, column: 17, scope: !306)
!309 = !DILocalVariable(name: "buffer", scope: !306, file: !13, line: 178, type: !7)
!310 = !DILocation(line: 178, column: 19, scope: !306)
!311 = !DILocation(line: 178, column: 35, scope: !306)
!312 = !DILocation(line: 178, column: 28, scope: !306)
!313 = !DILocation(line: 179, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !306, file: !13, line: 179, column: 17)
!315 = !DILocation(line: 179, column: 24, scope: !314)
!316 = !DILocation(line: 179, column: 17, scope: !306)
!317 = !DILocation(line: 179, column: 34, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !13, line: 179, column: 33)
!319 = !DILocation(line: 181, column: 20, scope: !320)
!320 = distinct !DILexicalBlock(scope: !306, file: !13, line: 181, column: 13)
!321 = !DILocation(line: 181, column: 18, scope: !320)
!322 = !DILocation(line: 181, column: 25, scope: !323)
!323 = distinct !DILexicalBlock(scope: !320, file: !13, line: 181, column: 13)
!324 = !DILocation(line: 181, column: 27, scope: !323)
!325 = !DILocation(line: 181, column: 13, scope: !320)
!326 = !DILocation(line: 183, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !323, file: !13, line: 182, column: 13)
!328 = !DILocation(line: 183, column: 24, scope: !327)
!329 = !DILocation(line: 183, column: 27, scope: !327)
!330 = !DILocation(line: 184, column: 13, scope: !327)
!331 = !DILocation(line: 181, column: 34, scope: !323)
!332 = !DILocation(line: 181, column: 13, scope: !323)
!333 = distinct !{!333, !325, !334, !73}
!334 = !DILocation(line: 184, column: 13, scope: !320)
!335 = !DILocation(line: 187, column: 17, scope: !336)
!336 = distinct !DILexicalBlock(scope: !306, file: !13, line: 187, column: 17)
!337 = !DILocation(line: 187, column: 22, scope: !336)
!338 = !DILocation(line: 187, column: 17, scope: !306)
!339 = !DILocation(line: 189, column: 17, scope: !340)
!340 = distinct !DILexicalBlock(scope: !336, file: !13, line: 188, column: 13)
!341 = !DILocation(line: 189, column: 24, scope: !340)
!342 = !DILocation(line: 189, column: 30, scope: !340)
!343 = !DILocation(line: 191, column: 23, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !13, line: 191, column: 17)
!345 = !DILocation(line: 191, column: 21, scope: !344)
!346 = !DILocation(line: 191, column: 28, scope: !347)
!347 = distinct !DILexicalBlock(scope: !344, file: !13, line: 191, column: 17)
!348 = !DILocation(line: 191, column: 30, scope: !347)
!349 = !DILocation(line: 191, column: 17, scope: !344)
!350 = !DILocation(line: 193, column: 34, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !13, line: 192, column: 17)
!352 = !DILocation(line: 193, column: 41, scope: !351)
!353 = !DILocation(line: 193, column: 21, scope: !351)
!354 = !DILocation(line: 194, column: 17, scope: !351)
!355 = !DILocation(line: 191, column: 37, scope: !347)
!356 = !DILocation(line: 191, column: 17, scope: !347)
!357 = distinct !{!357, !349, !358, !73}
!358 = !DILocation(line: 194, column: 17, scope: !344)
!359 = !DILocation(line: 195, column: 13, scope: !340)
!360 = !DILocation(line: 198, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !336, file: !13, line: 197, column: 13)
!362 = !DILocation(line: 200, column: 18, scope: !306)
!363 = !DILocation(line: 200, column: 13, scope: !306)
!364 = !DILocation(line: 202, column: 5, scope: !307)
!365 = !DILocation(line: 203, column: 1, scope: !299)
