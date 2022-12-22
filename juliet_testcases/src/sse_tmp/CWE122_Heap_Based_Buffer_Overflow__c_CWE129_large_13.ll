; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !25
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !28
  %cmp1 = icmp eq i32 %1, 5, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !31

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !36, metadata !DIExpression()), !dbg !37
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !38
  %2 = bitcast i8* %call to i32*, !dbg !39
  store i32* %2, i32** %buffer, align 8, !dbg !37
  %3 = load i32*, i32** %buffer, align 8, !dbg !40
  %cmp3 = icmp eq i32* %3, null, !dbg !42
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !43

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !44
  unreachable, !dbg !44

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !49
  %cmp6 = icmp slt i32 %4, 10, !dbg !51
  br i1 %cmp6, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !53
  %6 = load i32, i32* %i, align 4, !dbg !55
  %idxprom = sext i32 %6 to i64, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !58
  %inc = add nsw i32 %7, 1, !dbg !58
  store i32 %inc, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !63
  %cmp7 = icmp sge i32 %8, 0, !dbg !65
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !66

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !67
  %10 = load i32, i32* %data, align 4, !dbg !69
  %idxprom9 = sext i32 %10 to i64, !dbg !67
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !67
  store i32 1, i32* %arrayidx10, align 4, !dbg !70
  store i32 0, i32* %i, align 4, !dbg !71
  br label %for.cond11, !dbg !73

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !74
  %cmp12 = icmp slt i32 %11, 10, !dbg !76
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !77

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !78
  %13 = load i32, i32* %i, align 4, !dbg !80
  %idxprom14 = sext i32 %13 to i64, !dbg !78
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !78
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !78
  call void @printIntLine(i32 %14), !dbg !81
  br label %for.inc16, !dbg !82

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !83
  %inc17 = add nsw i32 %15, 1, !dbg !83
  store i32 %inc17, i32* %i, align 4, !dbg !83
  br label %for.cond11, !dbg !84, !llvm.loop !85

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !87

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !88
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !90
  %17 = bitcast i32* %16 to i8*, !dbg !90
  call void @free(i8* %17) #5, !dbg !91
  br label %if.end20, !dbg !92

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !93
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13_good() #0 !dbg !94 {
entry:
  call void @goodB2G1(), !dbg !95
  call void @goodB2G2(), !dbg !96
  call void @goodG2B1(), !dbg !97
  call void @goodG2B2(), !dbg !98
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !120 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i32 -1, i32* %data, align 4, !dbg !123
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !124
  %cmp = icmp eq i32 %0, 5, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !128
  br label %if.end, !dbg !130

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !131
  %cmp1 = icmp ne i32 %1, 5, !dbg !133
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !134

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !135
  br label %if.end22, !dbg !137

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !138, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !142, metadata !DIExpression()), !dbg !143
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !144
  %2 = bitcast i8* %call to i32*, !dbg !145
  store i32* %2, i32** %buffer, align 8, !dbg !143
  %3 = load i32*, i32** %buffer, align 8, !dbg !146
  %cmp3 = icmp eq i32* %3, null, !dbg !148
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !149

if.then4:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !150
  unreachable, !dbg !150

if.end5:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !155
  %cmp6 = icmp slt i32 %4, 10, !dbg !157
  br i1 %cmp6, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !159
  %6 = load i32, i32* %i, align 4, !dbg !161
  %idxprom = sext i32 %6 to i64, !dbg !159
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !159
  store i32 0, i32* %arrayidx, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !164
  %inc = add nsw i32 %7, 1, !dbg !164
  store i32 %inc, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !168
  %cmp7 = icmp sge i32 %8, 0, !dbg !170
  br i1 %cmp7, label %land.lhs.true, label %if.else20, !dbg !171

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !172
  %cmp8 = icmp slt i32 %9, 10, !dbg !173
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !174

if.then9:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !175
  %11 = load i32, i32* %data, align 4, !dbg !177
  %idxprom10 = sext i32 %11 to i64, !dbg !175
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !175
  store i32 1, i32* %arrayidx11, align 4, !dbg !178
  store i32 0, i32* %i, align 4, !dbg !179
  br label %for.cond12, !dbg !181

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %12 = load i32, i32* %i, align 4, !dbg !182
  %cmp13 = icmp slt i32 %12, 10, !dbg !184
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !185

for.body14:                                       ; preds = %for.cond12
  %13 = load i32*, i32** %buffer, align 8, !dbg !186
  %14 = load i32, i32* %i, align 4, !dbg !188
  %idxprom15 = sext i32 %14 to i64, !dbg !186
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %idxprom15, !dbg !186
  %15 = load i32, i32* %arrayidx16, align 4, !dbg !186
  call void @printIntLine(i32 %15), !dbg !189
  br label %for.inc17, !dbg !190

for.inc17:                                        ; preds = %for.body14
  %16 = load i32, i32* %i, align 4, !dbg !191
  %inc18 = add nsw i32 %16, 1, !dbg !191
  store i32 %inc18, i32* %i, align 4, !dbg !191
  br label %for.cond12, !dbg !192, !llvm.loop !193

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !195

if.else20:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !196
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %17 = load i32*, i32** %buffer, align 8, !dbg !198
  %18 = bitcast i32* %17 to i8*, !dbg !198
  call void @free(i8* %18) #5, !dbg !199
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then2
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !201 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !202, metadata !DIExpression()), !dbg !203
  store i32 -1, i32* %data, align 4, !dbg !204
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !205
  %cmp = icmp eq i32 %0, 5, !dbg !207
  br i1 %cmp, label %if.then, label %if.end, !dbg !208

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !209
  br label %if.end, !dbg !211

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !212
  %cmp1 = icmp eq i32 %1, 5, !dbg !214
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !215

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !216, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !220, metadata !DIExpression()), !dbg !221
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !222
  %2 = bitcast i8* %call to i32*, !dbg !223
  store i32* %2, i32** %buffer, align 8, !dbg !221
  %3 = load i32*, i32** %buffer, align 8, !dbg !224
  %cmp3 = icmp eq i32* %3, null, !dbg !226
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !227

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !228
  unreachable, !dbg !228

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !230
  br label %for.cond, !dbg !232

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !233
  %cmp6 = icmp slt i32 %4, 10, !dbg !235
  br i1 %cmp6, label %for.body, label %for.end, !dbg !236

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !237
  %6 = load i32, i32* %i, align 4, !dbg !239
  %idxprom = sext i32 %6 to i64, !dbg !237
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !237
  store i32 0, i32* %arrayidx, align 4, !dbg !240
  br label %for.inc, !dbg !241

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !242
  %inc = add nsw i32 %7, 1, !dbg !242
  store i32 %inc, i32* %i, align 4, !dbg !242
  br label %for.cond, !dbg !243, !llvm.loop !244

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !246
  %cmp7 = icmp sge i32 %8, 0, !dbg !248
  br i1 %cmp7, label %land.lhs.true, label %if.else, !dbg !249

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !250
  %cmp8 = icmp slt i32 %9, 10, !dbg !251
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !252

if.then9:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !253
  %11 = load i32, i32* %data, align 4, !dbg !255
  %idxprom10 = sext i32 %11 to i64, !dbg !253
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !253
  store i32 1, i32* %arrayidx11, align 4, !dbg !256
  store i32 0, i32* %i, align 4, !dbg !257
  br label %for.cond12, !dbg !259

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %12 = load i32, i32* %i, align 4, !dbg !260
  %cmp13 = icmp slt i32 %12, 10, !dbg !262
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !263

for.body14:                                       ; preds = %for.cond12
  %13 = load i32*, i32** %buffer, align 8, !dbg !264
  %14 = load i32, i32* %i, align 4, !dbg !266
  %idxprom15 = sext i32 %14 to i64, !dbg !264
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %idxprom15, !dbg !264
  %15 = load i32, i32* %arrayidx16, align 4, !dbg !264
  call void @printIntLine(i32 %15), !dbg !267
  br label %for.inc17, !dbg !268

for.inc17:                                        ; preds = %for.body14
  %16 = load i32, i32* %i, align 4, !dbg !269
  %inc18 = add nsw i32 %16, 1, !dbg !269
  store i32 %inc18, i32* %i, align 4, !dbg !269
  br label %for.cond12, !dbg !270, !llvm.loop !271

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !273

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !274
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %17 = load i32*, i32** %buffer, align 8, !dbg !276
  %18 = bitcast i32* %17 to i8*, !dbg !276
  call void @free(i8* %18) #5, !dbg !277
  br label %if.end21, !dbg !278

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !279
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !280 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !281, metadata !DIExpression()), !dbg !282
  store i32 -1, i32* %data, align 4, !dbg !283
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !284
  %cmp = icmp ne i32 %0, 5, !dbg !286
  br i1 %cmp, label %if.then, label %if.else, !dbg !287

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !288
  br label %if.end, !dbg !290

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !291
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !293
  %cmp1 = icmp eq i32 %1, 5, !dbg !295
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !296

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !297, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !301, metadata !DIExpression()), !dbg !302
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !303
  %2 = bitcast i8* %call to i32*, !dbg !304
  store i32* %2, i32** %buffer, align 8, !dbg !302
  %3 = load i32*, i32** %buffer, align 8, !dbg !305
  %cmp3 = icmp eq i32* %3, null, !dbg !307
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !308

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !309
  unreachable, !dbg !309

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !311
  br label %for.cond, !dbg !313

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !314
  %cmp6 = icmp slt i32 %4, 10, !dbg !316
  br i1 %cmp6, label %for.body, label %for.end, !dbg !317

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !318
  %6 = load i32, i32* %i, align 4, !dbg !320
  %idxprom = sext i32 %6 to i64, !dbg !318
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !318
  store i32 0, i32* %arrayidx, align 4, !dbg !321
  br label %for.inc, !dbg !322

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !323
  %inc = add nsw i32 %7, 1, !dbg !323
  store i32 %inc, i32* %i, align 4, !dbg !323
  br label %for.cond, !dbg !324, !llvm.loop !325

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !327
  %cmp7 = icmp sge i32 %8, 0, !dbg !329
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !330

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !331
  %10 = load i32, i32* %data, align 4, !dbg !333
  %idxprom9 = sext i32 %10 to i64, !dbg !331
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !331
  store i32 1, i32* %arrayidx10, align 4, !dbg !334
  store i32 0, i32* %i, align 4, !dbg !335
  br label %for.cond11, !dbg !337

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !338
  %cmp12 = icmp slt i32 %11, 10, !dbg !340
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !341

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !342
  %13 = load i32, i32* %i, align 4, !dbg !344
  %idxprom14 = sext i32 %13 to i64, !dbg !342
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !342
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !342
  call void @printIntLine(i32 %14), !dbg !345
  br label %for.inc16, !dbg !346

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !347
  %inc17 = add nsw i32 %15, 1, !dbg !347
  store i32 %inc17, i32* %i, align 4, !dbg !347
  br label %for.cond11, !dbg !348, !llvm.loop !349

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !351

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !352
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !354
  %17 = bitcast i32* %16 to i8*, !dbg !354
  call void @free(i8* %17) #5, !dbg !355
  br label %if.end21, !dbg !356

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !357
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !358 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !359, metadata !DIExpression()), !dbg !360
  store i32 -1, i32* %data, align 4, !dbg !361
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !362
  %cmp = icmp eq i32 %0, 5, !dbg !364
  br i1 %cmp, label %if.then, label %if.end, !dbg !365

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !366
  br label %if.end, !dbg !368

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !369
  %cmp1 = icmp eq i32 %1, 5, !dbg !371
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !372

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !373, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !377, metadata !DIExpression()), !dbg !378
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !379
  %2 = bitcast i8* %call to i32*, !dbg !380
  store i32* %2, i32** %buffer, align 8, !dbg !378
  %3 = load i32*, i32** %buffer, align 8, !dbg !381
  %cmp3 = icmp eq i32* %3, null, !dbg !383
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !384

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !385
  unreachable, !dbg !385

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !387
  br label %for.cond, !dbg !389

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !390
  %cmp6 = icmp slt i32 %4, 10, !dbg !392
  br i1 %cmp6, label %for.body, label %for.end, !dbg !393

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !394
  %6 = load i32, i32* %i, align 4, !dbg !396
  %idxprom = sext i32 %6 to i64, !dbg !394
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !394
  store i32 0, i32* %arrayidx, align 4, !dbg !397
  br label %for.inc, !dbg !398

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !399
  %inc = add nsw i32 %7, 1, !dbg !399
  store i32 %inc, i32* %i, align 4, !dbg !399
  br label %for.cond, !dbg !400, !llvm.loop !401

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !403
  %cmp7 = icmp sge i32 %8, 0, !dbg !405
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !406

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !407
  %10 = load i32, i32* %data, align 4, !dbg !409
  %idxprom9 = sext i32 %10 to i64, !dbg !407
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !407
  store i32 1, i32* %arrayidx10, align 4, !dbg !410
  store i32 0, i32* %i, align 4, !dbg !411
  br label %for.cond11, !dbg !413

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !414
  %cmp12 = icmp slt i32 %11, 10, !dbg !416
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !417

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !418
  %13 = load i32, i32* %i, align 4, !dbg !420
  %idxprom14 = sext i32 %13 to i64, !dbg !418
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !418
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !418
  call void @printIntLine(i32 %14), !dbg !421
  br label %for.inc16, !dbg !422

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !423
  %inc17 = add nsw i32 %15, 1, !dbg !423
  store i32 %inc17, i32* %i, align 4, !dbg !423
  br label %for.cond11, !dbg !424, !llvm.loop !425

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !427

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !428
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !430
  %17 = bitcast i32* %16 to i8*, !dbg !430
  call void @free(i8* %17) #5, !dbg !431
  br label %if.end20, !dbg !432

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !433
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 25, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocation(line: 30, column: 14, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 31, column: 5, scope: !26)
!28 = !DILocation(line: 32, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!30 = !DILocation(line: 32, column: 25, scope: !29)
!31 = !DILocation(line: 32, column: 8, scope: !14)
!32 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 35, type: !5)
!33 = distinct !DILexicalBlock(scope: !34, file: !15, line: 34, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !15, line: 33, column: 5)
!35 = !DILocation(line: 35, column: 17, scope: !33)
!36 = !DILocalVariable(name: "buffer", scope: !33, file: !15, line: 36, type: !4)
!37 = !DILocation(line: 36, column: 19, scope: !33)
!38 = !DILocation(line: 36, column: 35, scope: !33)
!39 = !DILocation(line: 36, column: 28, scope: !33)
!40 = !DILocation(line: 37, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !15, line: 37, column: 17)
!42 = !DILocation(line: 37, column: 24, scope: !41)
!43 = !DILocation(line: 37, column: 17, scope: !33)
!44 = !DILocation(line: 37, column: 34, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 37, column: 33)
!46 = !DILocation(line: 39, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !33, file: !15, line: 39, column: 13)
!48 = !DILocation(line: 39, column: 18, scope: !47)
!49 = !DILocation(line: 39, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !15, line: 39, column: 13)
!51 = !DILocation(line: 39, column: 27, scope: !50)
!52 = !DILocation(line: 39, column: 13, scope: !47)
!53 = !DILocation(line: 41, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 40, column: 13)
!55 = !DILocation(line: 41, column: 24, scope: !54)
!56 = !DILocation(line: 41, column: 27, scope: !54)
!57 = !DILocation(line: 42, column: 13, scope: !54)
!58 = !DILocation(line: 39, column: 34, scope: !50)
!59 = !DILocation(line: 39, column: 13, scope: !50)
!60 = distinct !{!60, !52, !61, !62}
!61 = !DILocation(line: 42, column: 13, scope: !47)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 45, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !33, file: !15, line: 45, column: 17)
!65 = !DILocation(line: 45, column: 22, scope: !64)
!66 = !DILocation(line: 45, column: 17, scope: !33)
!67 = !DILocation(line: 47, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 46, column: 13)
!69 = !DILocation(line: 47, column: 24, scope: !68)
!70 = !DILocation(line: 47, column: 30, scope: !68)
!71 = !DILocation(line: 49, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !15, line: 49, column: 17)
!73 = !DILocation(line: 49, column: 21, scope: !72)
!74 = !DILocation(line: 49, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !15, line: 49, column: 17)
!76 = !DILocation(line: 49, column: 30, scope: !75)
!77 = !DILocation(line: 49, column: 17, scope: !72)
!78 = !DILocation(line: 51, column: 34, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 50, column: 17)
!80 = !DILocation(line: 51, column: 41, scope: !79)
!81 = !DILocation(line: 51, column: 21, scope: !79)
!82 = !DILocation(line: 52, column: 17, scope: !79)
!83 = !DILocation(line: 49, column: 37, scope: !75)
!84 = !DILocation(line: 49, column: 17, scope: !75)
!85 = distinct !{!85, !77, !86, !62}
!86 = !DILocation(line: 52, column: 17, scope: !72)
!87 = !DILocation(line: 53, column: 13, scope: !68)
!88 = !DILocation(line: 56, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !64, file: !15, line: 55, column: 13)
!90 = !DILocation(line: 58, column: 18, scope: !33)
!91 = !DILocation(line: 58, column: 13, scope: !33)
!92 = !DILocation(line: 60, column: 5, scope: !34)
!93 = !DILocation(line: 61, column: 1, scope: !14)
!94 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_13_good", scope: !15, file: !15, line: 245, type: !16, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocation(line: 247, column: 5, scope: !94)
!96 = !DILocation(line: 248, column: 5, scope: !94)
!97 = !DILocation(line: 249, column: 5, scope: !94)
!98 = !DILocation(line: 250, column: 5, scope: !94)
!99 = !DILocation(line: 251, column: 1, scope: !94)
!100 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 262, type: !101, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!5, !5, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !15, line: 262, type: !5)
!107 = !DILocation(line: 262, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !15, line: 262, type: !103)
!109 = !DILocation(line: 262, column: 27, scope: !100)
!110 = !DILocation(line: 265, column: 22, scope: !100)
!111 = !DILocation(line: 265, column: 12, scope: !100)
!112 = !DILocation(line: 265, column: 5, scope: !100)
!113 = !DILocation(line: 267, column: 5, scope: !100)
!114 = !DILocation(line: 268, column: 5, scope: !100)
!115 = !DILocation(line: 269, column: 5, scope: !100)
!116 = !DILocation(line: 272, column: 5, scope: !100)
!117 = !DILocation(line: 273, column: 5, scope: !100)
!118 = !DILocation(line: 274, column: 5, scope: !100)
!119 = !DILocation(line: 276, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !15, line: 70, type: !5)
!122 = !DILocation(line: 70, column: 9, scope: !120)
!123 = !DILocation(line: 72, column: 10, scope: !120)
!124 = !DILocation(line: 73, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !15, line: 73, column: 8)
!126 = !DILocation(line: 73, column: 25, scope: !125)
!127 = !DILocation(line: 73, column: 8, scope: !120)
!128 = !DILocation(line: 76, column: 14, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 74, column: 5)
!130 = !DILocation(line: 77, column: 5, scope: !129)
!131 = !DILocation(line: 78, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !120, file: !15, line: 78, column: 8)
!133 = !DILocation(line: 78, column: 25, scope: !132)
!134 = !DILocation(line: 78, column: 8, scope: !120)
!135 = !DILocation(line: 81, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 79, column: 5)
!137 = !DILocation(line: 82, column: 5, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !139, file: !15, line: 86, type: !5)
!139 = distinct !DILexicalBlock(scope: !140, file: !15, line: 85, column: 9)
!140 = distinct !DILexicalBlock(scope: !132, file: !15, line: 84, column: 5)
!141 = !DILocation(line: 86, column: 17, scope: !139)
!142 = !DILocalVariable(name: "buffer", scope: !139, file: !15, line: 87, type: !4)
!143 = !DILocation(line: 87, column: 19, scope: !139)
!144 = !DILocation(line: 87, column: 35, scope: !139)
!145 = !DILocation(line: 87, column: 28, scope: !139)
!146 = !DILocation(line: 88, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !139, file: !15, line: 88, column: 17)
!148 = !DILocation(line: 88, column: 24, scope: !147)
!149 = !DILocation(line: 88, column: 17, scope: !139)
!150 = !DILocation(line: 88, column: 34, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !15, line: 88, column: 33)
!152 = !DILocation(line: 90, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !139, file: !15, line: 90, column: 13)
!154 = !DILocation(line: 90, column: 18, scope: !153)
!155 = !DILocation(line: 90, column: 25, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !15, line: 90, column: 13)
!157 = !DILocation(line: 90, column: 27, scope: !156)
!158 = !DILocation(line: 90, column: 13, scope: !153)
!159 = !DILocation(line: 92, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !15, line: 91, column: 13)
!161 = !DILocation(line: 92, column: 24, scope: !160)
!162 = !DILocation(line: 92, column: 27, scope: !160)
!163 = !DILocation(line: 93, column: 13, scope: !160)
!164 = !DILocation(line: 90, column: 34, scope: !156)
!165 = !DILocation(line: 90, column: 13, scope: !156)
!166 = distinct !{!166, !158, !167, !62}
!167 = !DILocation(line: 93, column: 13, scope: !153)
!168 = !DILocation(line: 95, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !139, file: !15, line: 95, column: 17)
!170 = !DILocation(line: 95, column: 22, scope: !169)
!171 = !DILocation(line: 95, column: 27, scope: !169)
!172 = !DILocation(line: 95, column: 30, scope: !169)
!173 = !DILocation(line: 95, column: 35, scope: !169)
!174 = !DILocation(line: 95, column: 17, scope: !139)
!175 = !DILocation(line: 97, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !169, file: !15, line: 96, column: 13)
!177 = !DILocation(line: 97, column: 24, scope: !176)
!178 = !DILocation(line: 97, column: 30, scope: !176)
!179 = !DILocation(line: 99, column: 23, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 99, column: 17)
!181 = !DILocation(line: 99, column: 21, scope: !180)
!182 = !DILocation(line: 99, column: 28, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !15, line: 99, column: 17)
!184 = !DILocation(line: 99, column: 30, scope: !183)
!185 = !DILocation(line: 99, column: 17, scope: !180)
!186 = !DILocation(line: 101, column: 34, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !15, line: 100, column: 17)
!188 = !DILocation(line: 101, column: 41, scope: !187)
!189 = !DILocation(line: 101, column: 21, scope: !187)
!190 = !DILocation(line: 102, column: 17, scope: !187)
!191 = !DILocation(line: 99, column: 37, scope: !183)
!192 = !DILocation(line: 99, column: 17, scope: !183)
!193 = distinct !{!193, !185, !194, !62}
!194 = !DILocation(line: 102, column: 17, scope: !180)
!195 = !DILocation(line: 103, column: 13, scope: !176)
!196 = !DILocation(line: 106, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !169, file: !15, line: 105, column: 13)
!198 = !DILocation(line: 108, column: 18, scope: !139)
!199 = !DILocation(line: 108, column: 13, scope: !139)
!200 = !DILocation(line: 111, column: 1, scope: !120)
!201 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!202 = !DILocalVariable(name: "data", scope: !201, file: !15, line: 116, type: !5)
!203 = !DILocation(line: 116, column: 9, scope: !201)
!204 = !DILocation(line: 118, column: 10, scope: !201)
!205 = !DILocation(line: 119, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !15, line: 119, column: 8)
!207 = !DILocation(line: 119, column: 25, scope: !206)
!208 = !DILocation(line: 119, column: 8, scope: !201)
!209 = !DILocation(line: 122, column: 14, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !15, line: 120, column: 5)
!211 = !DILocation(line: 123, column: 5, scope: !210)
!212 = !DILocation(line: 124, column: 8, scope: !213)
!213 = distinct !DILexicalBlock(scope: !201, file: !15, line: 124, column: 8)
!214 = !DILocation(line: 124, column: 25, scope: !213)
!215 = !DILocation(line: 124, column: 8, scope: !201)
!216 = !DILocalVariable(name: "i", scope: !217, file: !15, line: 127, type: !5)
!217 = distinct !DILexicalBlock(scope: !218, file: !15, line: 126, column: 9)
!218 = distinct !DILexicalBlock(scope: !213, file: !15, line: 125, column: 5)
!219 = !DILocation(line: 127, column: 17, scope: !217)
!220 = !DILocalVariable(name: "buffer", scope: !217, file: !15, line: 128, type: !4)
!221 = !DILocation(line: 128, column: 19, scope: !217)
!222 = !DILocation(line: 128, column: 35, scope: !217)
!223 = !DILocation(line: 128, column: 28, scope: !217)
!224 = !DILocation(line: 129, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !217, file: !15, line: 129, column: 17)
!226 = !DILocation(line: 129, column: 24, scope: !225)
!227 = !DILocation(line: 129, column: 17, scope: !217)
!228 = !DILocation(line: 129, column: 34, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !15, line: 129, column: 33)
!230 = !DILocation(line: 131, column: 20, scope: !231)
!231 = distinct !DILexicalBlock(scope: !217, file: !15, line: 131, column: 13)
!232 = !DILocation(line: 131, column: 18, scope: !231)
!233 = !DILocation(line: 131, column: 25, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !15, line: 131, column: 13)
!235 = !DILocation(line: 131, column: 27, scope: !234)
!236 = !DILocation(line: 131, column: 13, scope: !231)
!237 = !DILocation(line: 133, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !15, line: 132, column: 13)
!239 = !DILocation(line: 133, column: 24, scope: !238)
!240 = !DILocation(line: 133, column: 27, scope: !238)
!241 = !DILocation(line: 134, column: 13, scope: !238)
!242 = !DILocation(line: 131, column: 34, scope: !234)
!243 = !DILocation(line: 131, column: 13, scope: !234)
!244 = distinct !{!244, !236, !245, !62}
!245 = !DILocation(line: 134, column: 13, scope: !231)
!246 = !DILocation(line: 136, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !217, file: !15, line: 136, column: 17)
!248 = !DILocation(line: 136, column: 22, scope: !247)
!249 = !DILocation(line: 136, column: 27, scope: !247)
!250 = !DILocation(line: 136, column: 30, scope: !247)
!251 = !DILocation(line: 136, column: 35, scope: !247)
!252 = !DILocation(line: 136, column: 17, scope: !217)
!253 = !DILocation(line: 138, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !247, file: !15, line: 137, column: 13)
!255 = !DILocation(line: 138, column: 24, scope: !254)
!256 = !DILocation(line: 138, column: 30, scope: !254)
!257 = !DILocation(line: 140, column: 23, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !15, line: 140, column: 17)
!259 = !DILocation(line: 140, column: 21, scope: !258)
!260 = !DILocation(line: 140, column: 28, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !15, line: 140, column: 17)
!262 = !DILocation(line: 140, column: 30, scope: !261)
!263 = !DILocation(line: 140, column: 17, scope: !258)
!264 = !DILocation(line: 142, column: 34, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !15, line: 141, column: 17)
!266 = !DILocation(line: 142, column: 41, scope: !265)
!267 = !DILocation(line: 142, column: 21, scope: !265)
!268 = !DILocation(line: 143, column: 17, scope: !265)
!269 = !DILocation(line: 140, column: 37, scope: !261)
!270 = !DILocation(line: 140, column: 17, scope: !261)
!271 = distinct !{!271, !263, !272, !62}
!272 = !DILocation(line: 143, column: 17, scope: !258)
!273 = !DILocation(line: 144, column: 13, scope: !254)
!274 = !DILocation(line: 147, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !247, file: !15, line: 146, column: 13)
!276 = !DILocation(line: 149, column: 18, scope: !217)
!277 = !DILocation(line: 149, column: 13, scope: !217)
!278 = !DILocation(line: 151, column: 5, scope: !218)
!279 = !DILocation(line: 152, column: 1, scope: !201)
!280 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 155, type: !16, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!281 = !DILocalVariable(name: "data", scope: !280, file: !15, line: 157, type: !5)
!282 = !DILocation(line: 157, column: 9, scope: !280)
!283 = !DILocation(line: 159, column: 10, scope: !280)
!284 = !DILocation(line: 160, column: 8, scope: !285)
!285 = distinct !DILexicalBlock(scope: !280, file: !15, line: 160, column: 8)
!286 = !DILocation(line: 160, column: 25, scope: !285)
!287 = !DILocation(line: 160, column: 8, scope: !280)
!288 = !DILocation(line: 163, column: 9, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !15, line: 161, column: 5)
!290 = !DILocation(line: 164, column: 5, scope: !289)
!291 = !DILocation(line: 169, column: 14, scope: !292)
!292 = distinct !DILexicalBlock(scope: !285, file: !15, line: 166, column: 5)
!293 = !DILocation(line: 171, column: 8, scope: !294)
!294 = distinct !DILexicalBlock(scope: !280, file: !15, line: 171, column: 8)
!295 = !DILocation(line: 171, column: 25, scope: !294)
!296 = !DILocation(line: 171, column: 8, scope: !280)
!297 = !DILocalVariable(name: "i", scope: !298, file: !15, line: 174, type: !5)
!298 = distinct !DILexicalBlock(scope: !299, file: !15, line: 173, column: 9)
!299 = distinct !DILexicalBlock(scope: !294, file: !15, line: 172, column: 5)
!300 = !DILocation(line: 174, column: 17, scope: !298)
!301 = !DILocalVariable(name: "buffer", scope: !298, file: !15, line: 175, type: !4)
!302 = !DILocation(line: 175, column: 19, scope: !298)
!303 = !DILocation(line: 175, column: 35, scope: !298)
!304 = !DILocation(line: 175, column: 28, scope: !298)
!305 = !DILocation(line: 176, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !298, file: !15, line: 176, column: 17)
!307 = !DILocation(line: 176, column: 24, scope: !306)
!308 = !DILocation(line: 176, column: 17, scope: !298)
!309 = !DILocation(line: 176, column: 34, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !15, line: 176, column: 33)
!311 = !DILocation(line: 178, column: 20, scope: !312)
!312 = distinct !DILexicalBlock(scope: !298, file: !15, line: 178, column: 13)
!313 = !DILocation(line: 178, column: 18, scope: !312)
!314 = !DILocation(line: 178, column: 25, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !15, line: 178, column: 13)
!316 = !DILocation(line: 178, column: 27, scope: !315)
!317 = !DILocation(line: 178, column: 13, scope: !312)
!318 = !DILocation(line: 180, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !15, line: 179, column: 13)
!320 = !DILocation(line: 180, column: 24, scope: !319)
!321 = !DILocation(line: 180, column: 27, scope: !319)
!322 = !DILocation(line: 181, column: 13, scope: !319)
!323 = !DILocation(line: 178, column: 34, scope: !315)
!324 = !DILocation(line: 178, column: 13, scope: !315)
!325 = distinct !{!325, !317, !326, !62}
!326 = !DILocation(line: 181, column: 13, scope: !312)
!327 = !DILocation(line: 184, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !298, file: !15, line: 184, column: 17)
!329 = !DILocation(line: 184, column: 22, scope: !328)
!330 = !DILocation(line: 184, column: 17, scope: !298)
!331 = !DILocation(line: 186, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !15, line: 185, column: 13)
!333 = !DILocation(line: 186, column: 24, scope: !332)
!334 = !DILocation(line: 186, column: 30, scope: !332)
!335 = !DILocation(line: 188, column: 23, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !15, line: 188, column: 17)
!337 = !DILocation(line: 188, column: 21, scope: !336)
!338 = !DILocation(line: 188, column: 28, scope: !339)
!339 = distinct !DILexicalBlock(scope: !336, file: !15, line: 188, column: 17)
!340 = !DILocation(line: 188, column: 30, scope: !339)
!341 = !DILocation(line: 188, column: 17, scope: !336)
!342 = !DILocation(line: 190, column: 34, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !15, line: 189, column: 17)
!344 = !DILocation(line: 190, column: 41, scope: !343)
!345 = !DILocation(line: 190, column: 21, scope: !343)
!346 = !DILocation(line: 191, column: 17, scope: !343)
!347 = !DILocation(line: 188, column: 37, scope: !339)
!348 = !DILocation(line: 188, column: 17, scope: !339)
!349 = distinct !{!349, !341, !350, !62}
!350 = !DILocation(line: 191, column: 17, scope: !336)
!351 = !DILocation(line: 192, column: 13, scope: !332)
!352 = !DILocation(line: 195, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !328, file: !15, line: 194, column: 13)
!354 = !DILocation(line: 197, column: 18, scope: !298)
!355 = !DILocation(line: 197, column: 13, scope: !298)
!356 = !DILocation(line: 199, column: 5, scope: !299)
!357 = !DILocation(line: 200, column: 1, scope: !280)
!358 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 203, type: !16, scopeLine: 204, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!359 = !DILocalVariable(name: "data", scope: !358, file: !15, line: 205, type: !5)
!360 = !DILocation(line: 205, column: 9, scope: !358)
!361 = !DILocation(line: 207, column: 10, scope: !358)
!362 = !DILocation(line: 208, column: 8, scope: !363)
!363 = distinct !DILexicalBlock(scope: !358, file: !15, line: 208, column: 8)
!364 = !DILocation(line: 208, column: 25, scope: !363)
!365 = !DILocation(line: 208, column: 8, scope: !358)
!366 = !DILocation(line: 212, column: 14, scope: !367)
!367 = distinct !DILexicalBlock(scope: !363, file: !15, line: 209, column: 5)
!368 = !DILocation(line: 213, column: 5, scope: !367)
!369 = !DILocation(line: 214, column: 8, scope: !370)
!370 = distinct !DILexicalBlock(scope: !358, file: !15, line: 214, column: 8)
!371 = !DILocation(line: 214, column: 25, scope: !370)
!372 = !DILocation(line: 214, column: 8, scope: !358)
!373 = !DILocalVariable(name: "i", scope: !374, file: !15, line: 217, type: !5)
!374 = distinct !DILexicalBlock(scope: !375, file: !15, line: 216, column: 9)
!375 = distinct !DILexicalBlock(scope: !370, file: !15, line: 215, column: 5)
!376 = !DILocation(line: 217, column: 17, scope: !374)
!377 = !DILocalVariable(name: "buffer", scope: !374, file: !15, line: 218, type: !4)
!378 = !DILocation(line: 218, column: 19, scope: !374)
!379 = !DILocation(line: 218, column: 35, scope: !374)
!380 = !DILocation(line: 218, column: 28, scope: !374)
!381 = !DILocation(line: 219, column: 17, scope: !382)
!382 = distinct !DILexicalBlock(scope: !374, file: !15, line: 219, column: 17)
!383 = !DILocation(line: 219, column: 24, scope: !382)
!384 = !DILocation(line: 219, column: 17, scope: !374)
!385 = !DILocation(line: 219, column: 34, scope: !386)
!386 = distinct !DILexicalBlock(scope: !382, file: !15, line: 219, column: 33)
!387 = !DILocation(line: 221, column: 20, scope: !388)
!388 = distinct !DILexicalBlock(scope: !374, file: !15, line: 221, column: 13)
!389 = !DILocation(line: 221, column: 18, scope: !388)
!390 = !DILocation(line: 221, column: 25, scope: !391)
!391 = distinct !DILexicalBlock(scope: !388, file: !15, line: 221, column: 13)
!392 = !DILocation(line: 221, column: 27, scope: !391)
!393 = !DILocation(line: 221, column: 13, scope: !388)
!394 = !DILocation(line: 223, column: 17, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !15, line: 222, column: 13)
!396 = !DILocation(line: 223, column: 24, scope: !395)
!397 = !DILocation(line: 223, column: 27, scope: !395)
!398 = !DILocation(line: 224, column: 13, scope: !395)
!399 = !DILocation(line: 221, column: 34, scope: !391)
!400 = !DILocation(line: 221, column: 13, scope: !391)
!401 = distinct !{!401, !393, !402, !62}
!402 = !DILocation(line: 224, column: 13, scope: !388)
!403 = !DILocation(line: 227, column: 17, scope: !404)
!404 = distinct !DILexicalBlock(scope: !374, file: !15, line: 227, column: 17)
!405 = !DILocation(line: 227, column: 22, scope: !404)
!406 = !DILocation(line: 227, column: 17, scope: !374)
!407 = !DILocation(line: 229, column: 17, scope: !408)
!408 = distinct !DILexicalBlock(scope: !404, file: !15, line: 228, column: 13)
!409 = !DILocation(line: 229, column: 24, scope: !408)
!410 = !DILocation(line: 229, column: 30, scope: !408)
!411 = !DILocation(line: 231, column: 23, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !15, line: 231, column: 17)
!413 = !DILocation(line: 231, column: 21, scope: !412)
!414 = !DILocation(line: 231, column: 28, scope: !415)
!415 = distinct !DILexicalBlock(scope: !412, file: !15, line: 231, column: 17)
!416 = !DILocation(line: 231, column: 30, scope: !415)
!417 = !DILocation(line: 231, column: 17, scope: !412)
!418 = !DILocation(line: 233, column: 34, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !15, line: 232, column: 17)
!420 = !DILocation(line: 233, column: 41, scope: !419)
!421 = !DILocation(line: 233, column: 21, scope: !419)
!422 = !DILocation(line: 234, column: 17, scope: !419)
!423 = !DILocation(line: 231, column: 37, scope: !415)
!424 = !DILocation(line: 231, column: 17, scope: !415)
!425 = distinct !{!425, !417, !426, !62}
!426 = !DILocation(line: 234, column: 17, scope: !412)
!427 = !DILocation(line: 235, column: 13, scope: !408)
!428 = !DILocation(line: 238, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !404, file: !15, line: 237, column: 13)
!430 = !DILocation(line: 240, column: 18, scope: !374)
!431 = !DILocation(line: 240, column: 13, scope: !374)
!432 = !DILocation(line: 242, column: 5, scope: !375)
!433 = !DILocation(line: 243, column: 1, scope: !358)
