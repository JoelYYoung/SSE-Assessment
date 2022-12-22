; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_bad() #0 !dbg !18 {
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
  store i32 10, i32* %data, align 4, !dbg !28
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp1 = icmp eq i32 %1, 5, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !34

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !39, metadata !DIExpression()), !dbg !40
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !41
  %2 = bitcast i8* %call to i32*, !dbg !42
  store i32* %2, i32** %buffer, align 8, !dbg !40
  %3 = load i32*, i32** %buffer, align 8, !dbg !43
  %cmp3 = icmp eq i32* %3, null, !dbg !45
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !46

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !47
  unreachable, !dbg !47

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !52
  %cmp6 = icmp slt i32 %4, 10, !dbg !54
  br i1 %cmp6, label %for.body, label %for.end, !dbg !55

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
  %8 = load i32, i32* %data, align 4, !dbg !66
  %cmp7 = icmp sge i32 %8, 0, !dbg !68
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !69

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !70
  %10 = load i32, i32* %data, align 4, !dbg !72
  %idxprom9 = sext i32 %10 to i64, !dbg !70
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !70
  store i32 1, i32* %arrayidx10, align 4, !dbg !73
  store i32 0, i32* %i, align 4, !dbg !74
  br label %for.cond11, !dbg !76

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !77
  %cmp12 = icmp slt i32 %11, 10, !dbg !79
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !80

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !81
  %13 = load i32, i32* %i, align 4, !dbg !83
  %idxprom14 = sext i32 %13 to i64, !dbg !81
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !81
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !81
  call void @printIntLine(i32 %14), !dbg !84
  br label %for.inc16, !dbg !85

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !86
  %inc17 = add nsw i32 %15, 1, !dbg !86
  store i32 %inc17, i32* %i, align 4, !dbg !86
  br label %for.cond11, !dbg !87, !llvm.loop !88

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !90

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !91
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !93
  %17 = bitcast i32* %16 to i8*, !dbg !93
  call void @free(i8* %17) #5, !dbg !94
  br label %if.end20, !dbg !95

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !96
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_good() #0 !dbg !97 {
entry:
  call void @goodB2G1(), !dbg !98
  call void @goodB2G2(), !dbg !99
  call void @goodG2B1(), !dbg !100
  call void @goodG2B2(), !dbg !101
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_good(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_bad(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !123 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 -1, i32* %data, align 4, !dbg !126
  %0 = load i32, i32* @staticFive, align 4, !dbg !127
  %cmp = icmp eq i32 %0, 5, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !131
  br label %if.end, !dbg !133

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !134
  %cmp1 = icmp ne i32 %1, 5, !dbg !136
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !137

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !138
  br label %if.end22, !dbg !140

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !141, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !145, metadata !DIExpression()), !dbg !146
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !147
  %2 = bitcast i8* %call to i32*, !dbg !148
  store i32* %2, i32** %buffer, align 8, !dbg !146
  %3 = load i32*, i32** %buffer, align 8, !dbg !149
  %cmp3 = icmp eq i32* %3, null, !dbg !151
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !152

if.then4:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !153
  unreachable, !dbg !153

if.end5:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !158
  %cmp6 = icmp slt i32 %4, 10, !dbg !160
  br i1 %cmp6, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !162
  %6 = load i32, i32* %i, align 4, !dbg !164
  %idxprom = sext i32 %6 to i64, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !167
  %inc = add nsw i32 %7, 1, !dbg !167
  store i32 %inc, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !171
  %cmp7 = icmp sge i32 %8, 0, !dbg !173
  br i1 %cmp7, label %land.lhs.true, label %if.else20, !dbg !174

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !175
  %cmp8 = icmp slt i32 %9, 10, !dbg !176
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !177

if.then9:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !178
  %11 = load i32, i32* %data, align 4, !dbg !180
  %idxprom10 = sext i32 %11 to i64, !dbg !178
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !178
  store i32 1, i32* %arrayidx11, align 4, !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond12, !dbg !184

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %12 = load i32, i32* %i, align 4, !dbg !185
  %cmp13 = icmp slt i32 %12, 10, !dbg !187
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !188

for.body14:                                       ; preds = %for.cond12
  %13 = load i32*, i32** %buffer, align 8, !dbg !189
  %14 = load i32, i32* %i, align 4, !dbg !191
  %idxprom15 = sext i32 %14 to i64, !dbg !189
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %idxprom15, !dbg !189
  %15 = load i32, i32* %arrayidx16, align 4, !dbg !189
  call void @printIntLine(i32 %15), !dbg !192
  br label %for.inc17, !dbg !193

for.inc17:                                        ; preds = %for.body14
  %16 = load i32, i32* %i, align 4, !dbg !194
  %inc18 = add nsw i32 %16, 1, !dbg !194
  store i32 %inc18, i32* %i, align 4, !dbg !194
  br label %for.cond12, !dbg !195, !llvm.loop !196

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !198

if.else20:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !199
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %17 = load i32*, i32** %buffer, align 8, !dbg !201
  %18 = bitcast i32* %17 to i8*, !dbg !201
  call void @free(i8* %18) #5, !dbg !202
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then2
  ret void, !dbg !203
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !204 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !205, metadata !DIExpression()), !dbg !206
  store i32 -1, i32* %data, align 4, !dbg !207
  %0 = load i32, i32* @staticFive, align 4, !dbg !208
  %cmp = icmp eq i32 %0, 5, !dbg !210
  br i1 %cmp, label %if.then, label %if.end, !dbg !211

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !212
  br label %if.end, !dbg !214

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !215
  %cmp1 = icmp eq i32 %1, 5, !dbg !217
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !218

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !219, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !223, metadata !DIExpression()), !dbg !224
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !225
  %2 = bitcast i8* %call to i32*, !dbg !226
  store i32* %2, i32** %buffer, align 8, !dbg !224
  %3 = load i32*, i32** %buffer, align 8, !dbg !227
  %cmp3 = icmp eq i32* %3, null, !dbg !229
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !230

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !231
  unreachable, !dbg !231

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !233
  br label %for.cond, !dbg !235

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !236
  %cmp6 = icmp slt i32 %4, 10, !dbg !238
  br i1 %cmp6, label %for.body, label %for.end, !dbg !239

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !240
  %6 = load i32, i32* %i, align 4, !dbg !242
  %idxprom = sext i32 %6 to i64, !dbg !240
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !240
  store i32 0, i32* %arrayidx, align 4, !dbg !243
  br label %for.inc, !dbg !244

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !245
  %inc = add nsw i32 %7, 1, !dbg !245
  store i32 %inc, i32* %i, align 4, !dbg !245
  br label %for.cond, !dbg !246, !llvm.loop !247

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !249
  %cmp7 = icmp sge i32 %8, 0, !dbg !251
  br i1 %cmp7, label %land.lhs.true, label %if.else, !dbg !252

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !253
  %cmp8 = icmp slt i32 %9, 10, !dbg !254
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !255

if.then9:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !256
  %11 = load i32, i32* %data, align 4, !dbg !258
  %idxprom10 = sext i32 %11 to i64, !dbg !256
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !256
  store i32 1, i32* %arrayidx11, align 4, !dbg !259
  store i32 0, i32* %i, align 4, !dbg !260
  br label %for.cond12, !dbg !262

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %12 = load i32, i32* %i, align 4, !dbg !263
  %cmp13 = icmp slt i32 %12, 10, !dbg !265
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !266

for.body14:                                       ; preds = %for.cond12
  %13 = load i32*, i32** %buffer, align 8, !dbg !267
  %14 = load i32, i32* %i, align 4, !dbg !269
  %idxprom15 = sext i32 %14 to i64, !dbg !267
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %idxprom15, !dbg !267
  %15 = load i32, i32* %arrayidx16, align 4, !dbg !267
  call void @printIntLine(i32 %15), !dbg !270
  br label %for.inc17, !dbg !271

for.inc17:                                        ; preds = %for.body14
  %16 = load i32, i32* %i, align 4, !dbg !272
  %inc18 = add nsw i32 %16, 1, !dbg !272
  store i32 %inc18, i32* %i, align 4, !dbg !272
  br label %for.cond12, !dbg !273, !llvm.loop !274

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !276

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !277
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %17 = load i32*, i32** %buffer, align 8, !dbg !279
  %18 = bitcast i32* %17 to i8*, !dbg !279
  call void @free(i8* %18) #5, !dbg !280
  br label %if.end21, !dbg !281

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !282
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !283 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !284, metadata !DIExpression()), !dbg !285
  store i32 -1, i32* %data, align 4, !dbg !286
  %0 = load i32, i32* @staticFive, align 4, !dbg !287
  %cmp = icmp ne i32 %0, 5, !dbg !289
  br i1 %cmp, label %if.then, label %if.else, !dbg !290

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !291
  br label %if.end, !dbg !293

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !294
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !296
  %cmp1 = icmp eq i32 %1, 5, !dbg !298
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !299

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !300, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !304, metadata !DIExpression()), !dbg !305
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !306
  %2 = bitcast i8* %call to i32*, !dbg !307
  store i32* %2, i32** %buffer, align 8, !dbg !305
  %3 = load i32*, i32** %buffer, align 8, !dbg !308
  %cmp3 = icmp eq i32* %3, null, !dbg !310
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !311

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !312
  unreachable, !dbg !312

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !314
  br label %for.cond, !dbg !316

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !317
  %cmp6 = icmp slt i32 %4, 10, !dbg !319
  br i1 %cmp6, label %for.body, label %for.end, !dbg !320

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !321
  %6 = load i32, i32* %i, align 4, !dbg !323
  %idxprom = sext i32 %6 to i64, !dbg !321
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !321
  store i32 0, i32* %arrayidx, align 4, !dbg !324
  br label %for.inc, !dbg !325

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !326
  %inc = add nsw i32 %7, 1, !dbg !326
  store i32 %inc, i32* %i, align 4, !dbg !326
  br label %for.cond, !dbg !327, !llvm.loop !328

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !330
  %cmp7 = icmp sge i32 %8, 0, !dbg !332
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !333

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !334
  %10 = load i32, i32* %data, align 4, !dbg !336
  %idxprom9 = sext i32 %10 to i64, !dbg !334
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !334
  store i32 1, i32* %arrayidx10, align 4, !dbg !337
  store i32 0, i32* %i, align 4, !dbg !338
  br label %for.cond11, !dbg !340

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !341
  %cmp12 = icmp slt i32 %11, 10, !dbg !343
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !344

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !345
  %13 = load i32, i32* %i, align 4, !dbg !347
  %idxprom14 = sext i32 %13 to i64, !dbg !345
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !345
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !345
  call void @printIntLine(i32 %14), !dbg !348
  br label %for.inc16, !dbg !349

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !350
  %inc17 = add nsw i32 %15, 1, !dbg !350
  store i32 %inc17, i32* %i, align 4, !dbg !350
  br label %for.cond11, !dbg !351, !llvm.loop !352

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !354

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !355
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !357
  %17 = bitcast i32* %16 to i8*, !dbg !357
  call void @free(i8* %17) #5, !dbg !358
  br label %if.end21, !dbg !359

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !360
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !361 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !362, metadata !DIExpression()), !dbg !363
  store i32 -1, i32* %data, align 4, !dbg !364
  %0 = load i32, i32* @staticFive, align 4, !dbg !365
  %cmp = icmp eq i32 %0, 5, !dbg !367
  br i1 %cmp, label %if.then, label %if.end, !dbg !368

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !369
  br label %if.end, !dbg !371

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !372
  %cmp1 = icmp eq i32 %1, 5, !dbg !374
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !375

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !376, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !380, metadata !DIExpression()), !dbg !381
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !382
  %2 = bitcast i8* %call to i32*, !dbg !383
  store i32* %2, i32** %buffer, align 8, !dbg !381
  %3 = load i32*, i32** %buffer, align 8, !dbg !384
  %cmp3 = icmp eq i32* %3, null, !dbg !386
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !387

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !388
  unreachable, !dbg !388

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !390
  br label %for.cond, !dbg !392

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !393
  %cmp6 = icmp slt i32 %4, 10, !dbg !395
  br i1 %cmp6, label %for.body, label %for.end, !dbg !396

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !397
  %6 = load i32, i32* %i, align 4, !dbg !399
  %idxprom = sext i32 %6 to i64, !dbg !397
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !397
  store i32 0, i32* %arrayidx, align 4, !dbg !400
  br label %for.inc, !dbg !401

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !402
  %inc = add nsw i32 %7, 1, !dbg !402
  store i32 %inc, i32* %i, align 4, !dbg !402
  br label %for.cond, !dbg !403, !llvm.loop !404

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !406
  %cmp7 = icmp sge i32 %8, 0, !dbg !408
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !409

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !410
  %10 = load i32, i32* %data, align 4, !dbg !412
  %idxprom9 = sext i32 %10 to i64, !dbg !410
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !410
  store i32 1, i32* %arrayidx10, align 4, !dbg !413
  store i32 0, i32* %i, align 4, !dbg !414
  br label %for.cond11, !dbg !416

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !417
  %cmp12 = icmp slt i32 %11, 10, !dbg !419
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !420

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !421
  %13 = load i32, i32* %i, align 4, !dbg !423
  %idxprom14 = sext i32 %13 to i64, !dbg !421
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !421
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !421
  call void @printIntLine(i32 %14), !dbg !424
  br label %for.inc16, !dbg !425

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !426
  %inc17 = add nsw i32 %15, 1, !dbg !426
  store i32 %inc17, i32* %i, align 4, !dbg !426
  br label %for.cond11, !dbg !427, !llvm.loop !428

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !430

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !431
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !433
  %17 = bitcast i32* %16 to i8*, !dbg !433
  call void @free(i8* %17) #5, !dbg !434
  br label %if.end20, !dbg !435

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !436
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07.c", directory: "/root/SSE-Assessment")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_bad", scope: !11, file: !11, line: 27, type: !19, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !11, line: 29, type: !7)
!22 = !DILocation(line: 29, column: 9, scope: !18)
!23 = !DILocation(line: 31, column: 10, scope: !18)
!24 = !DILocation(line: 32, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !11, line: 32, column: 8)
!26 = !DILocation(line: 32, column: 18, scope: !25)
!27 = !DILocation(line: 32, column: 8, scope: !18)
!28 = !DILocation(line: 35, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !11, line: 33, column: 5)
!30 = !DILocation(line: 36, column: 5, scope: !29)
!31 = !DILocation(line: 37, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !11, line: 37, column: 8)
!33 = !DILocation(line: 37, column: 18, scope: !32)
!34 = !DILocation(line: 37, column: 8, scope: !18)
!35 = !DILocalVariable(name: "i", scope: !36, file: !11, line: 40, type: !7)
!36 = distinct !DILexicalBlock(scope: !37, file: !11, line: 39, column: 9)
!37 = distinct !DILexicalBlock(scope: !32, file: !11, line: 38, column: 5)
!38 = !DILocation(line: 40, column: 17, scope: !36)
!39 = !DILocalVariable(name: "buffer", scope: !36, file: !11, line: 41, type: !6)
!40 = !DILocation(line: 41, column: 19, scope: !36)
!41 = !DILocation(line: 41, column: 35, scope: !36)
!42 = !DILocation(line: 41, column: 28, scope: !36)
!43 = !DILocation(line: 42, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !36, file: !11, line: 42, column: 17)
!45 = !DILocation(line: 42, column: 24, scope: !44)
!46 = !DILocation(line: 42, column: 17, scope: !36)
!47 = !DILocation(line: 42, column: 34, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !11, line: 42, column: 33)
!49 = !DILocation(line: 44, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !36, file: !11, line: 44, column: 13)
!51 = !DILocation(line: 44, column: 18, scope: !50)
!52 = !DILocation(line: 44, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !11, line: 44, column: 13)
!54 = !DILocation(line: 44, column: 27, scope: !53)
!55 = !DILocation(line: 44, column: 13, scope: !50)
!56 = !DILocation(line: 46, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !11, line: 45, column: 13)
!58 = !DILocation(line: 46, column: 24, scope: !57)
!59 = !DILocation(line: 46, column: 27, scope: !57)
!60 = !DILocation(line: 47, column: 13, scope: !57)
!61 = !DILocation(line: 44, column: 34, scope: !53)
!62 = !DILocation(line: 44, column: 13, scope: !53)
!63 = distinct !{!63, !55, !64, !65}
!64 = !DILocation(line: 47, column: 13, scope: !50)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 50, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !36, file: !11, line: 50, column: 17)
!68 = !DILocation(line: 50, column: 22, scope: !67)
!69 = !DILocation(line: 50, column: 17, scope: !36)
!70 = !DILocation(line: 52, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !11, line: 51, column: 13)
!72 = !DILocation(line: 52, column: 24, scope: !71)
!73 = !DILocation(line: 52, column: 30, scope: !71)
!74 = !DILocation(line: 54, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !11, line: 54, column: 17)
!76 = !DILocation(line: 54, column: 21, scope: !75)
!77 = !DILocation(line: 54, column: 28, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !11, line: 54, column: 17)
!79 = !DILocation(line: 54, column: 30, scope: !78)
!80 = !DILocation(line: 54, column: 17, scope: !75)
!81 = !DILocation(line: 56, column: 34, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !11, line: 55, column: 17)
!83 = !DILocation(line: 56, column: 41, scope: !82)
!84 = !DILocation(line: 56, column: 21, scope: !82)
!85 = !DILocation(line: 57, column: 17, scope: !82)
!86 = !DILocation(line: 54, column: 37, scope: !78)
!87 = !DILocation(line: 54, column: 17, scope: !78)
!88 = distinct !{!88, !80, !89, !65}
!89 = !DILocation(line: 57, column: 17, scope: !75)
!90 = !DILocation(line: 58, column: 13, scope: !71)
!91 = !DILocation(line: 61, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !67, file: !11, line: 60, column: 13)
!93 = !DILocation(line: 63, column: 18, scope: !36)
!94 = !DILocation(line: 63, column: 13, scope: !36)
!95 = !DILocation(line: 65, column: 5, scope: !37)
!96 = !DILocation(line: 66, column: 1, scope: !18)
!97 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_good", scope: !11, file: !11, line: 250, type: !19, scopeLine: 251, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocation(line: 252, column: 5, scope: !97)
!99 = !DILocation(line: 253, column: 5, scope: !97)
!100 = !DILocation(line: 254, column: 5, scope: !97)
!101 = !DILocation(line: 255, column: 5, scope: !97)
!102 = !DILocation(line: 256, column: 1, scope: !97)
!103 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 267, type: !104, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DISubroutineType(types: !105)
!105 = !{!7, !7, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!109 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !11, line: 267, type: !7)
!110 = !DILocation(line: 267, column: 14, scope: !103)
!111 = !DILocalVariable(name: "argv", arg: 2, scope: !103, file: !11, line: 267, type: !106)
!112 = !DILocation(line: 267, column: 27, scope: !103)
!113 = !DILocation(line: 270, column: 22, scope: !103)
!114 = !DILocation(line: 270, column: 12, scope: !103)
!115 = !DILocation(line: 270, column: 5, scope: !103)
!116 = !DILocation(line: 272, column: 5, scope: !103)
!117 = !DILocation(line: 273, column: 5, scope: !103)
!118 = !DILocation(line: 274, column: 5, scope: !103)
!119 = !DILocation(line: 277, column: 5, scope: !103)
!120 = !DILocation(line: 278, column: 5, scope: !103)
!121 = !DILocation(line: 279, column: 5, scope: !103)
!122 = !DILocation(line: 281, column: 5, scope: !103)
!123 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 73, type: !19, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !11, line: 75, type: !7)
!125 = !DILocation(line: 75, column: 9, scope: !123)
!126 = !DILocation(line: 77, column: 10, scope: !123)
!127 = !DILocation(line: 78, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !11, line: 78, column: 8)
!129 = !DILocation(line: 78, column: 18, scope: !128)
!130 = !DILocation(line: 78, column: 8, scope: !123)
!131 = !DILocation(line: 81, column: 14, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !11, line: 79, column: 5)
!133 = !DILocation(line: 82, column: 5, scope: !132)
!134 = !DILocation(line: 83, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !123, file: !11, line: 83, column: 8)
!136 = !DILocation(line: 83, column: 18, scope: !135)
!137 = !DILocation(line: 83, column: 8, scope: !123)
!138 = !DILocation(line: 86, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !11, line: 84, column: 5)
!140 = !DILocation(line: 87, column: 5, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !142, file: !11, line: 91, type: !7)
!142 = distinct !DILexicalBlock(scope: !143, file: !11, line: 90, column: 9)
!143 = distinct !DILexicalBlock(scope: !135, file: !11, line: 89, column: 5)
!144 = !DILocation(line: 91, column: 17, scope: !142)
!145 = !DILocalVariable(name: "buffer", scope: !142, file: !11, line: 92, type: !6)
!146 = !DILocation(line: 92, column: 19, scope: !142)
!147 = !DILocation(line: 92, column: 35, scope: !142)
!148 = !DILocation(line: 92, column: 28, scope: !142)
!149 = !DILocation(line: 93, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !142, file: !11, line: 93, column: 17)
!151 = !DILocation(line: 93, column: 24, scope: !150)
!152 = !DILocation(line: 93, column: 17, scope: !142)
!153 = !DILocation(line: 93, column: 34, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !11, line: 93, column: 33)
!155 = !DILocation(line: 95, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !142, file: !11, line: 95, column: 13)
!157 = !DILocation(line: 95, column: 18, scope: !156)
!158 = !DILocation(line: 95, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !11, line: 95, column: 13)
!160 = !DILocation(line: 95, column: 27, scope: !159)
!161 = !DILocation(line: 95, column: 13, scope: !156)
!162 = !DILocation(line: 97, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !11, line: 96, column: 13)
!164 = !DILocation(line: 97, column: 24, scope: !163)
!165 = !DILocation(line: 97, column: 27, scope: !163)
!166 = !DILocation(line: 98, column: 13, scope: !163)
!167 = !DILocation(line: 95, column: 34, scope: !159)
!168 = !DILocation(line: 95, column: 13, scope: !159)
!169 = distinct !{!169, !161, !170, !65}
!170 = !DILocation(line: 98, column: 13, scope: !156)
!171 = !DILocation(line: 100, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !142, file: !11, line: 100, column: 17)
!173 = !DILocation(line: 100, column: 22, scope: !172)
!174 = !DILocation(line: 100, column: 27, scope: !172)
!175 = !DILocation(line: 100, column: 30, scope: !172)
!176 = !DILocation(line: 100, column: 35, scope: !172)
!177 = !DILocation(line: 100, column: 17, scope: !142)
!178 = !DILocation(line: 102, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !172, file: !11, line: 101, column: 13)
!180 = !DILocation(line: 102, column: 24, scope: !179)
!181 = !DILocation(line: 102, column: 30, scope: !179)
!182 = !DILocation(line: 104, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !11, line: 104, column: 17)
!184 = !DILocation(line: 104, column: 21, scope: !183)
!185 = !DILocation(line: 104, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !11, line: 104, column: 17)
!187 = !DILocation(line: 104, column: 30, scope: !186)
!188 = !DILocation(line: 104, column: 17, scope: !183)
!189 = !DILocation(line: 106, column: 34, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !11, line: 105, column: 17)
!191 = !DILocation(line: 106, column: 41, scope: !190)
!192 = !DILocation(line: 106, column: 21, scope: !190)
!193 = !DILocation(line: 107, column: 17, scope: !190)
!194 = !DILocation(line: 104, column: 37, scope: !186)
!195 = !DILocation(line: 104, column: 17, scope: !186)
!196 = distinct !{!196, !188, !197, !65}
!197 = !DILocation(line: 107, column: 17, scope: !183)
!198 = !DILocation(line: 108, column: 13, scope: !179)
!199 = !DILocation(line: 111, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !172, file: !11, line: 110, column: 13)
!201 = !DILocation(line: 113, column: 18, scope: !142)
!202 = !DILocation(line: 113, column: 13, scope: !142)
!203 = !DILocation(line: 116, column: 1, scope: !123)
!204 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 119, type: !19, scopeLine: 120, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!205 = !DILocalVariable(name: "data", scope: !204, file: !11, line: 121, type: !7)
!206 = !DILocation(line: 121, column: 9, scope: !204)
!207 = !DILocation(line: 123, column: 10, scope: !204)
!208 = !DILocation(line: 124, column: 8, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !11, line: 124, column: 8)
!210 = !DILocation(line: 124, column: 18, scope: !209)
!211 = !DILocation(line: 124, column: 8, scope: !204)
!212 = !DILocation(line: 127, column: 14, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !11, line: 125, column: 5)
!214 = !DILocation(line: 128, column: 5, scope: !213)
!215 = !DILocation(line: 129, column: 8, scope: !216)
!216 = distinct !DILexicalBlock(scope: !204, file: !11, line: 129, column: 8)
!217 = !DILocation(line: 129, column: 18, scope: !216)
!218 = !DILocation(line: 129, column: 8, scope: !204)
!219 = !DILocalVariable(name: "i", scope: !220, file: !11, line: 132, type: !7)
!220 = distinct !DILexicalBlock(scope: !221, file: !11, line: 131, column: 9)
!221 = distinct !DILexicalBlock(scope: !216, file: !11, line: 130, column: 5)
!222 = !DILocation(line: 132, column: 17, scope: !220)
!223 = !DILocalVariable(name: "buffer", scope: !220, file: !11, line: 133, type: !6)
!224 = !DILocation(line: 133, column: 19, scope: !220)
!225 = !DILocation(line: 133, column: 35, scope: !220)
!226 = !DILocation(line: 133, column: 28, scope: !220)
!227 = !DILocation(line: 134, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !220, file: !11, line: 134, column: 17)
!229 = !DILocation(line: 134, column: 24, scope: !228)
!230 = !DILocation(line: 134, column: 17, scope: !220)
!231 = !DILocation(line: 134, column: 34, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !11, line: 134, column: 33)
!233 = !DILocation(line: 136, column: 20, scope: !234)
!234 = distinct !DILexicalBlock(scope: !220, file: !11, line: 136, column: 13)
!235 = !DILocation(line: 136, column: 18, scope: !234)
!236 = !DILocation(line: 136, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !11, line: 136, column: 13)
!238 = !DILocation(line: 136, column: 27, scope: !237)
!239 = !DILocation(line: 136, column: 13, scope: !234)
!240 = !DILocation(line: 138, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !11, line: 137, column: 13)
!242 = !DILocation(line: 138, column: 24, scope: !241)
!243 = !DILocation(line: 138, column: 27, scope: !241)
!244 = !DILocation(line: 139, column: 13, scope: !241)
!245 = !DILocation(line: 136, column: 34, scope: !237)
!246 = !DILocation(line: 136, column: 13, scope: !237)
!247 = distinct !{!247, !239, !248, !65}
!248 = !DILocation(line: 139, column: 13, scope: !234)
!249 = !DILocation(line: 141, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !220, file: !11, line: 141, column: 17)
!251 = !DILocation(line: 141, column: 22, scope: !250)
!252 = !DILocation(line: 141, column: 27, scope: !250)
!253 = !DILocation(line: 141, column: 30, scope: !250)
!254 = !DILocation(line: 141, column: 35, scope: !250)
!255 = !DILocation(line: 141, column: 17, scope: !220)
!256 = !DILocation(line: 143, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !250, file: !11, line: 142, column: 13)
!258 = !DILocation(line: 143, column: 24, scope: !257)
!259 = !DILocation(line: 143, column: 30, scope: !257)
!260 = !DILocation(line: 145, column: 23, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !11, line: 145, column: 17)
!262 = !DILocation(line: 145, column: 21, scope: !261)
!263 = !DILocation(line: 145, column: 28, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !11, line: 145, column: 17)
!265 = !DILocation(line: 145, column: 30, scope: !264)
!266 = !DILocation(line: 145, column: 17, scope: !261)
!267 = !DILocation(line: 147, column: 34, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !11, line: 146, column: 17)
!269 = !DILocation(line: 147, column: 41, scope: !268)
!270 = !DILocation(line: 147, column: 21, scope: !268)
!271 = !DILocation(line: 148, column: 17, scope: !268)
!272 = !DILocation(line: 145, column: 37, scope: !264)
!273 = !DILocation(line: 145, column: 17, scope: !264)
!274 = distinct !{!274, !266, !275, !65}
!275 = !DILocation(line: 148, column: 17, scope: !261)
!276 = !DILocation(line: 149, column: 13, scope: !257)
!277 = !DILocation(line: 152, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !250, file: !11, line: 151, column: 13)
!279 = !DILocation(line: 154, column: 18, scope: !220)
!280 = !DILocation(line: 154, column: 13, scope: !220)
!281 = !DILocation(line: 156, column: 5, scope: !221)
!282 = !DILocation(line: 157, column: 1, scope: !204)
!283 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 160, type: !19, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!284 = !DILocalVariable(name: "data", scope: !283, file: !11, line: 162, type: !7)
!285 = !DILocation(line: 162, column: 9, scope: !283)
!286 = !DILocation(line: 164, column: 10, scope: !283)
!287 = !DILocation(line: 165, column: 8, scope: !288)
!288 = distinct !DILexicalBlock(scope: !283, file: !11, line: 165, column: 8)
!289 = !DILocation(line: 165, column: 18, scope: !288)
!290 = !DILocation(line: 165, column: 8, scope: !283)
!291 = !DILocation(line: 168, column: 9, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !11, line: 166, column: 5)
!293 = !DILocation(line: 169, column: 5, scope: !292)
!294 = !DILocation(line: 174, column: 14, scope: !295)
!295 = distinct !DILexicalBlock(scope: !288, file: !11, line: 171, column: 5)
!296 = !DILocation(line: 176, column: 8, scope: !297)
!297 = distinct !DILexicalBlock(scope: !283, file: !11, line: 176, column: 8)
!298 = !DILocation(line: 176, column: 18, scope: !297)
!299 = !DILocation(line: 176, column: 8, scope: !283)
!300 = !DILocalVariable(name: "i", scope: !301, file: !11, line: 179, type: !7)
!301 = distinct !DILexicalBlock(scope: !302, file: !11, line: 178, column: 9)
!302 = distinct !DILexicalBlock(scope: !297, file: !11, line: 177, column: 5)
!303 = !DILocation(line: 179, column: 17, scope: !301)
!304 = !DILocalVariable(name: "buffer", scope: !301, file: !11, line: 180, type: !6)
!305 = !DILocation(line: 180, column: 19, scope: !301)
!306 = !DILocation(line: 180, column: 35, scope: !301)
!307 = !DILocation(line: 180, column: 28, scope: !301)
!308 = !DILocation(line: 181, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !301, file: !11, line: 181, column: 17)
!310 = !DILocation(line: 181, column: 24, scope: !309)
!311 = !DILocation(line: 181, column: 17, scope: !301)
!312 = !DILocation(line: 181, column: 34, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !11, line: 181, column: 33)
!314 = !DILocation(line: 183, column: 20, scope: !315)
!315 = distinct !DILexicalBlock(scope: !301, file: !11, line: 183, column: 13)
!316 = !DILocation(line: 183, column: 18, scope: !315)
!317 = !DILocation(line: 183, column: 25, scope: !318)
!318 = distinct !DILexicalBlock(scope: !315, file: !11, line: 183, column: 13)
!319 = !DILocation(line: 183, column: 27, scope: !318)
!320 = !DILocation(line: 183, column: 13, scope: !315)
!321 = !DILocation(line: 185, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !11, line: 184, column: 13)
!323 = !DILocation(line: 185, column: 24, scope: !322)
!324 = !DILocation(line: 185, column: 27, scope: !322)
!325 = !DILocation(line: 186, column: 13, scope: !322)
!326 = !DILocation(line: 183, column: 34, scope: !318)
!327 = !DILocation(line: 183, column: 13, scope: !318)
!328 = distinct !{!328, !320, !329, !65}
!329 = !DILocation(line: 186, column: 13, scope: !315)
!330 = !DILocation(line: 189, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !301, file: !11, line: 189, column: 17)
!332 = !DILocation(line: 189, column: 22, scope: !331)
!333 = !DILocation(line: 189, column: 17, scope: !301)
!334 = !DILocation(line: 191, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !11, line: 190, column: 13)
!336 = !DILocation(line: 191, column: 24, scope: !335)
!337 = !DILocation(line: 191, column: 30, scope: !335)
!338 = !DILocation(line: 193, column: 23, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !11, line: 193, column: 17)
!340 = !DILocation(line: 193, column: 21, scope: !339)
!341 = !DILocation(line: 193, column: 28, scope: !342)
!342 = distinct !DILexicalBlock(scope: !339, file: !11, line: 193, column: 17)
!343 = !DILocation(line: 193, column: 30, scope: !342)
!344 = !DILocation(line: 193, column: 17, scope: !339)
!345 = !DILocation(line: 195, column: 34, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !11, line: 194, column: 17)
!347 = !DILocation(line: 195, column: 41, scope: !346)
!348 = !DILocation(line: 195, column: 21, scope: !346)
!349 = !DILocation(line: 196, column: 17, scope: !346)
!350 = !DILocation(line: 193, column: 37, scope: !342)
!351 = !DILocation(line: 193, column: 17, scope: !342)
!352 = distinct !{!352, !344, !353, !65}
!353 = !DILocation(line: 196, column: 17, scope: !339)
!354 = !DILocation(line: 197, column: 13, scope: !335)
!355 = !DILocation(line: 200, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !331, file: !11, line: 199, column: 13)
!357 = !DILocation(line: 202, column: 18, scope: !301)
!358 = !DILocation(line: 202, column: 13, scope: !301)
!359 = !DILocation(line: 204, column: 5, scope: !302)
!360 = !DILocation(line: 205, column: 1, scope: !283)
!361 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 208, type: !19, scopeLine: 209, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!362 = !DILocalVariable(name: "data", scope: !361, file: !11, line: 210, type: !7)
!363 = !DILocation(line: 210, column: 9, scope: !361)
!364 = !DILocation(line: 212, column: 10, scope: !361)
!365 = !DILocation(line: 213, column: 8, scope: !366)
!366 = distinct !DILexicalBlock(scope: !361, file: !11, line: 213, column: 8)
!367 = !DILocation(line: 213, column: 18, scope: !366)
!368 = !DILocation(line: 213, column: 8, scope: !361)
!369 = !DILocation(line: 217, column: 14, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !11, line: 214, column: 5)
!371 = !DILocation(line: 218, column: 5, scope: !370)
!372 = !DILocation(line: 219, column: 8, scope: !373)
!373 = distinct !DILexicalBlock(scope: !361, file: !11, line: 219, column: 8)
!374 = !DILocation(line: 219, column: 18, scope: !373)
!375 = !DILocation(line: 219, column: 8, scope: !361)
!376 = !DILocalVariable(name: "i", scope: !377, file: !11, line: 222, type: !7)
!377 = distinct !DILexicalBlock(scope: !378, file: !11, line: 221, column: 9)
!378 = distinct !DILexicalBlock(scope: !373, file: !11, line: 220, column: 5)
!379 = !DILocation(line: 222, column: 17, scope: !377)
!380 = !DILocalVariable(name: "buffer", scope: !377, file: !11, line: 223, type: !6)
!381 = !DILocation(line: 223, column: 19, scope: !377)
!382 = !DILocation(line: 223, column: 35, scope: !377)
!383 = !DILocation(line: 223, column: 28, scope: !377)
!384 = !DILocation(line: 224, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !377, file: !11, line: 224, column: 17)
!386 = !DILocation(line: 224, column: 24, scope: !385)
!387 = !DILocation(line: 224, column: 17, scope: !377)
!388 = !DILocation(line: 224, column: 34, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !11, line: 224, column: 33)
!390 = !DILocation(line: 226, column: 20, scope: !391)
!391 = distinct !DILexicalBlock(scope: !377, file: !11, line: 226, column: 13)
!392 = !DILocation(line: 226, column: 18, scope: !391)
!393 = !DILocation(line: 226, column: 25, scope: !394)
!394 = distinct !DILexicalBlock(scope: !391, file: !11, line: 226, column: 13)
!395 = !DILocation(line: 226, column: 27, scope: !394)
!396 = !DILocation(line: 226, column: 13, scope: !391)
!397 = !DILocation(line: 228, column: 17, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !11, line: 227, column: 13)
!399 = !DILocation(line: 228, column: 24, scope: !398)
!400 = !DILocation(line: 228, column: 27, scope: !398)
!401 = !DILocation(line: 229, column: 13, scope: !398)
!402 = !DILocation(line: 226, column: 34, scope: !394)
!403 = !DILocation(line: 226, column: 13, scope: !394)
!404 = distinct !{!404, !396, !405, !65}
!405 = !DILocation(line: 229, column: 13, scope: !391)
!406 = !DILocation(line: 232, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !377, file: !11, line: 232, column: 17)
!408 = !DILocation(line: 232, column: 22, scope: !407)
!409 = !DILocation(line: 232, column: 17, scope: !377)
!410 = !DILocation(line: 234, column: 17, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !11, line: 233, column: 13)
!412 = !DILocation(line: 234, column: 24, scope: !411)
!413 = !DILocation(line: 234, column: 30, scope: !411)
!414 = !DILocation(line: 236, column: 23, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !11, line: 236, column: 17)
!416 = !DILocation(line: 236, column: 21, scope: !415)
!417 = !DILocation(line: 236, column: 28, scope: !418)
!418 = distinct !DILexicalBlock(scope: !415, file: !11, line: 236, column: 17)
!419 = !DILocation(line: 236, column: 30, scope: !418)
!420 = !DILocation(line: 236, column: 17, scope: !415)
!421 = !DILocation(line: 238, column: 34, scope: !422)
!422 = distinct !DILexicalBlock(scope: !418, file: !11, line: 237, column: 17)
!423 = !DILocation(line: 238, column: 41, scope: !422)
!424 = !DILocation(line: 238, column: 21, scope: !422)
!425 = !DILocation(line: 239, column: 17, scope: !422)
!426 = !DILocation(line: 236, column: 37, scope: !418)
!427 = !DILocation(line: 236, column: 17, scope: !418)
!428 = distinct !{!428, !420, !429, !65}
!429 = !DILocation(line: 239, column: 17, scope: !415)
!430 = !DILocation(line: 240, column: 13, scope: !411)
!431 = !DILocation(line: 243, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !407, file: !11, line: 242, column: 13)
!433 = !DILocation(line: 245, column: 18, scope: !377)
!434 = !DILocation(line: 245, column: 13, scope: !377)
!435 = !DILocation(line: 247, column: 5, scope: !378)
!436 = !DILocation(line: 248, column: 1, scope: !361)
