; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !24
  br label %if.end, !dbg !26

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !27
  %tobool2 = icmp ne i32 %call1, 0, !dbg !27
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !29

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !34, metadata !DIExpression()), !dbg !35
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !36
  %0 = bitcast i8* %call4 to i32*, !dbg !37
  store i32* %0, i32** %buffer, align 8, !dbg !35
  %1 = load i32*, i32** %buffer, align 8, !dbg !38
  %cmp = icmp eq i32* %1, null, !dbg !40
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !41

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !47
  %cmp7 = icmp slt i32 %2, 10, !dbg !49
  br i1 %cmp7, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !51
  %4 = load i32, i32* %i, align 4, !dbg !53
  %idxprom = sext i32 %4 to i64, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !56
  %inc = add nsw i32 %5, 1, !dbg !56
  store i32 %inc, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !61
  %cmp8 = icmp sge i32 %6, 0, !dbg !63
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !64

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !65
  %8 = load i32, i32* %data, align 4, !dbg !67
  %idxprom10 = sext i32 %8 to i64, !dbg !65
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !65
  store i32 1, i32* %arrayidx11, align 4, !dbg !68
  store i32 0, i32* %i, align 4, !dbg !69
  br label %for.cond12, !dbg !71

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !72
  %cmp13 = icmp slt i32 %9, 10, !dbg !74
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !75

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !76
  %11 = load i32, i32* %i, align 4, !dbg !78
  %idxprom15 = sext i32 %11 to i64, !dbg !76
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !76
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !76
  call void @printIntLine(i32 %12), !dbg !79
  br label %for.inc17, !dbg !80

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !81
  %inc18 = add nsw i32 %13, 1, !dbg !81
  store i32 %inc18, i32* %i, align 4, !dbg !81
  br label %for.cond12, !dbg !82, !llvm.loop !83

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !85

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !86
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !88
  %15 = bitcast i32* %14 to i8*, !dbg !88
  call void @free(i8* %15) #5, !dbg !89
  br label %if.end21, !dbg !90

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !91
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_good() #0 !dbg !92 {
entry:
  call void @goodB2G1(), !dbg !93
  call void @goodB2G2(), !dbg !94
  call void @goodG2B1(), !dbg !95
  call void @goodG2B2(), !dbg !96
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !118 {
entry:
  ret i32 1, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !122 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !123, metadata !DIExpression()), !dbg !124
  store i32 -1, i32* %data, align 4, !dbg !125
  %call = call i32 @staticReturnsTrue(), !dbg !126
  %tobool = icmp ne i32 %call, 0, !dbg !126
  br i1 %tobool, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !129
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !132
  %tobool2 = icmp ne i32 %call1, 0, !dbg !132
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !134

if.then3:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !135
  br label %if.end23, !dbg !137

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !138, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !142, metadata !DIExpression()), !dbg !143
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !144
  %0 = bitcast i8* %call4 to i32*, !dbg !145
  store i32* %0, i32** %buffer, align 8, !dbg !143
  %1 = load i32*, i32** %buffer, align 8, !dbg !146
  %cmp = icmp eq i32* %1, null, !dbg !148
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !149

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !150
  unreachable, !dbg !150

if.end6:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !155
  %cmp7 = icmp slt i32 %2, 10, !dbg !157
  br i1 %cmp7, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !159
  %4 = load i32, i32* %i, align 4, !dbg !161
  %idxprom = sext i32 %4 to i64, !dbg !159
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !159
  store i32 0, i32* %arrayidx, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !164
  %inc = add nsw i32 %5, 1, !dbg !164
  store i32 %inc, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !168
  %cmp8 = icmp sge i32 %6, 0, !dbg !170
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !171

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !172
  %cmp9 = icmp slt i32 %7, 10, !dbg !173
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !174

if.then10:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !175
  %9 = load i32, i32* %data, align 4, !dbg !177
  %idxprom11 = sext i32 %9 to i64, !dbg !175
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !175
  store i32 1, i32* %arrayidx12, align 4, !dbg !178
  store i32 0, i32* %i, align 4, !dbg !179
  br label %for.cond13, !dbg !181

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !182
  %cmp14 = icmp slt i32 %10, 10, !dbg !184
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !185

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !186
  %12 = load i32, i32* %i, align 4, !dbg !188
  %idxprom16 = sext i32 %12 to i64, !dbg !186
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !186
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !186
  call void @printIntLine(i32 %13), !dbg !189
  br label %for.inc18, !dbg !190

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !191
  %inc19 = add nsw i32 %14, 1, !dbg !191
  store i32 %inc19, i32* %i, align 4, !dbg !191
  br label %for.cond13, !dbg !192, !llvm.loop !193

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !195

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !196
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !198
  %16 = bitcast i32* %15 to i8*, !dbg !198
  call void @free(i8* %16) #5, !dbg !199
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then3
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !201 {
entry:
  ret i32 0, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  %call = call i32 @staticReturnsTrue(), !dbg !207
  %tobool = icmp ne i32 %call, 0, !dbg !207
  br i1 %tobool, label %if.then, label %if.end, !dbg !209

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !210
  br label %if.end, !dbg !212

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !213
  %tobool2 = icmp ne i32 %call1, 0, !dbg !213
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !215

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !216, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !220, metadata !DIExpression()), !dbg !221
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !222
  %0 = bitcast i8* %call4 to i32*, !dbg !223
  store i32* %0, i32** %buffer, align 8, !dbg !221
  %1 = load i32*, i32** %buffer, align 8, !dbg !224
  %cmp = icmp eq i32* %1, null, !dbg !226
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !227

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !228
  unreachable, !dbg !228

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !230
  br label %for.cond, !dbg !232

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !233
  %cmp7 = icmp slt i32 %2, 10, !dbg !235
  br i1 %cmp7, label %for.body, label %for.end, !dbg !236

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !237
  %4 = load i32, i32* %i, align 4, !dbg !239
  %idxprom = sext i32 %4 to i64, !dbg !237
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !237
  store i32 0, i32* %arrayidx, align 4, !dbg !240
  br label %for.inc, !dbg !241

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !242
  %inc = add nsw i32 %5, 1, !dbg !242
  store i32 %inc, i32* %i, align 4, !dbg !242
  br label %for.cond, !dbg !243, !llvm.loop !244

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !246
  %cmp8 = icmp sge i32 %6, 0, !dbg !248
  br i1 %cmp8, label %land.lhs.true, label %if.else, !dbg !249

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !250
  %cmp9 = icmp slt i32 %7, 10, !dbg !251
  br i1 %cmp9, label %if.then10, label %if.else, !dbg !252

if.then10:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !253
  %9 = load i32, i32* %data, align 4, !dbg !255
  %idxprom11 = sext i32 %9 to i64, !dbg !253
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !253
  store i32 1, i32* %arrayidx12, align 4, !dbg !256
  store i32 0, i32* %i, align 4, !dbg !257
  br label %for.cond13, !dbg !259

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !260
  %cmp14 = icmp slt i32 %10, 10, !dbg !262
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !263

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !264
  %12 = load i32, i32* %i, align 4, !dbg !266
  %idxprom16 = sext i32 %12 to i64, !dbg !264
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !264
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !264
  call void @printIntLine(i32 %13), !dbg !267
  br label %for.inc18, !dbg !268

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !269
  %inc19 = add nsw i32 %14, 1, !dbg !269
  store i32 %inc19, i32* %i, align 4, !dbg !269
  br label %for.cond13, !dbg !270, !llvm.loop !271

for.end20:                                        ; preds = %for.cond13
  br label %if.end21, !dbg !273

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !274
  br label %if.end21

if.end21:                                         ; preds = %if.else, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !276
  %16 = bitcast i32* %15 to i8*, !dbg !276
  call void @free(i8* %16) #5, !dbg !277
  br label %if.end22, !dbg !278

if.end22:                                         ; preds = %if.end21, %if.end
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
  %call = call i32 @staticReturnsFalse(), !dbg !284
  %tobool = icmp ne i32 %call, 0, !dbg !284
  br i1 %tobool, label %if.then, label %if.else, !dbg !286

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !287
  br label %if.end, !dbg !289

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !290
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !292
  %tobool2 = icmp ne i32 %call1, 0, !dbg !292
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !294

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !295, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !299, metadata !DIExpression()), !dbg !300
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !301
  %0 = bitcast i8* %call4 to i32*, !dbg !302
  store i32* %0, i32** %buffer, align 8, !dbg !300
  %1 = load i32*, i32** %buffer, align 8, !dbg !303
  %cmp = icmp eq i32* %1, null, !dbg !305
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !306

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !307
  unreachable, !dbg !307

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !309
  br label %for.cond, !dbg !311

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !312
  %cmp7 = icmp slt i32 %2, 10, !dbg !314
  br i1 %cmp7, label %for.body, label %for.end, !dbg !315

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !316
  %4 = load i32, i32* %i, align 4, !dbg !318
  %idxprom = sext i32 %4 to i64, !dbg !316
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !316
  store i32 0, i32* %arrayidx, align 4, !dbg !319
  br label %for.inc, !dbg !320

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !321
  %inc = add nsw i32 %5, 1, !dbg !321
  store i32 %inc, i32* %i, align 4, !dbg !321
  br label %for.cond, !dbg !322, !llvm.loop !323

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !325
  %cmp8 = icmp sge i32 %6, 0, !dbg !327
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !328

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !329
  %8 = load i32, i32* %data, align 4, !dbg !331
  %idxprom10 = sext i32 %8 to i64, !dbg !329
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !329
  store i32 1, i32* %arrayidx11, align 4, !dbg !332
  store i32 0, i32* %i, align 4, !dbg !333
  br label %for.cond12, !dbg !335

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !336
  %cmp13 = icmp slt i32 %9, 10, !dbg !338
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !339

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !340
  %11 = load i32, i32* %i, align 4, !dbg !342
  %idxprom15 = sext i32 %11 to i64, !dbg !340
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !340
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !340
  call void @printIntLine(i32 %12), !dbg !343
  br label %for.inc17, !dbg !344

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !345
  %inc18 = add nsw i32 %13, 1, !dbg !345
  store i32 %inc18, i32* %i, align 4, !dbg !345
  br label %for.cond12, !dbg !346, !llvm.loop !347

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !349

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !350
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !352
  %15 = bitcast i32* %14 to i8*, !dbg !352
  call void @free(i8* %15) #5, !dbg !353
  br label %if.end22, !dbg !354

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !355
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !356 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !357, metadata !DIExpression()), !dbg !358
  store i32 -1, i32* %data, align 4, !dbg !359
  %call = call i32 @staticReturnsTrue(), !dbg !360
  %tobool = icmp ne i32 %call, 0, !dbg !360
  br i1 %tobool, label %if.then, label %if.end, !dbg !362

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !363
  br label %if.end, !dbg !365

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !366
  %tobool2 = icmp ne i32 %call1, 0, !dbg !366
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !368

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !369, metadata !DIExpression()), !dbg !372
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !373, metadata !DIExpression()), !dbg !374
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !375
  %0 = bitcast i8* %call4 to i32*, !dbg !376
  store i32* %0, i32** %buffer, align 8, !dbg !374
  %1 = load i32*, i32** %buffer, align 8, !dbg !377
  %cmp = icmp eq i32* %1, null, !dbg !379
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !380

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !381
  unreachable, !dbg !381

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !383
  br label %for.cond, !dbg !385

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !386
  %cmp7 = icmp slt i32 %2, 10, !dbg !388
  br i1 %cmp7, label %for.body, label %for.end, !dbg !389

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !390
  %4 = load i32, i32* %i, align 4, !dbg !392
  %idxprom = sext i32 %4 to i64, !dbg !390
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !390
  store i32 0, i32* %arrayidx, align 4, !dbg !393
  br label %for.inc, !dbg !394

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !395
  %inc = add nsw i32 %5, 1, !dbg !395
  store i32 %inc, i32* %i, align 4, !dbg !395
  br label %for.cond, !dbg !396, !llvm.loop !397

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !399
  %cmp8 = icmp sge i32 %6, 0, !dbg !401
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !402

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !403
  %8 = load i32, i32* %data, align 4, !dbg !405
  %idxprom10 = sext i32 %8 to i64, !dbg !403
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !403
  store i32 1, i32* %arrayidx11, align 4, !dbg !406
  store i32 0, i32* %i, align 4, !dbg !407
  br label %for.cond12, !dbg !409

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !410
  %cmp13 = icmp slt i32 %9, 10, !dbg !412
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !413

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !414
  %11 = load i32, i32* %i, align 4, !dbg !416
  %idxprom15 = sext i32 %11 to i64, !dbg !414
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !414
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !414
  call void @printIntLine(i32 %12), !dbg !417
  br label %for.inc17, !dbg !418

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !419
  %inc18 = add nsw i32 %13, 1, !dbg !419
  store i32 %inc18, i32* %i, align 4, !dbg !419
  br label %for.cond12, !dbg !420, !llvm.loop !421

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !423

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !424
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !426
  %15 = bitcast i32* %14 to i8*, !dbg !426
  call void @free(i8* %15) #5, !dbg !427
  br label %if.end21, !dbg !428

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !429
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !5)
!19 = !DILocation(line: 37, column: 9, scope: !14)
!20 = !DILocation(line: 39, column: 10, scope: !14)
!21 = !DILocation(line: 40, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 8)
!23 = !DILocation(line: 40, column: 8, scope: !14)
!24 = !DILocation(line: 43, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 5)
!26 = !DILocation(line: 44, column: 5, scope: !25)
!27 = !DILocation(line: 45, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 8)
!29 = !DILocation(line: 45, column: 8, scope: !14)
!30 = !DILocalVariable(name: "i", scope: !31, file: !15, line: 48, type: !5)
!31 = distinct !DILexicalBlock(scope: !32, file: !15, line: 47, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 46, column: 5)
!33 = !DILocation(line: 48, column: 17, scope: !31)
!34 = !DILocalVariable(name: "buffer", scope: !31, file: !15, line: 49, type: !4)
!35 = !DILocation(line: 49, column: 19, scope: !31)
!36 = !DILocation(line: 49, column: 35, scope: !31)
!37 = !DILocation(line: 49, column: 28, scope: !31)
!38 = !DILocation(line: 50, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !15, line: 50, column: 17)
!40 = !DILocation(line: 50, column: 24, scope: !39)
!41 = !DILocation(line: 50, column: 17, scope: !31)
!42 = !DILocation(line: 50, column: 34, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 50, column: 33)
!44 = !DILocation(line: 52, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !31, file: !15, line: 52, column: 13)
!46 = !DILocation(line: 52, column: 18, scope: !45)
!47 = !DILocation(line: 52, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !15, line: 52, column: 13)
!49 = !DILocation(line: 52, column: 27, scope: !48)
!50 = !DILocation(line: 52, column: 13, scope: !45)
!51 = !DILocation(line: 54, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 53, column: 13)
!53 = !DILocation(line: 54, column: 24, scope: !52)
!54 = !DILocation(line: 54, column: 27, scope: !52)
!55 = !DILocation(line: 55, column: 13, scope: !52)
!56 = !DILocation(line: 52, column: 34, scope: !48)
!57 = !DILocation(line: 52, column: 13, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 55, column: 13, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 58, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !31, file: !15, line: 58, column: 17)
!63 = !DILocation(line: 58, column: 22, scope: !62)
!64 = !DILocation(line: 58, column: 17, scope: !31)
!65 = !DILocation(line: 60, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 59, column: 13)
!67 = !DILocation(line: 60, column: 24, scope: !66)
!68 = !DILocation(line: 60, column: 30, scope: !66)
!69 = !DILocation(line: 62, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 62, column: 17)
!71 = !DILocation(line: 62, column: 21, scope: !70)
!72 = !DILocation(line: 62, column: 28, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !15, line: 62, column: 17)
!74 = !DILocation(line: 62, column: 30, scope: !73)
!75 = !DILocation(line: 62, column: 17, scope: !70)
!76 = !DILocation(line: 64, column: 34, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 63, column: 17)
!78 = !DILocation(line: 64, column: 41, scope: !77)
!79 = !DILocation(line: 64, column: 21, scope: !77)
!80 = !DILocation(line: 65, column: 17, scope: !77)
!81 = !DILocation(line: 62, column: 37, scope: !73)
!82 = !DILocation(line: 62, column: 17, scope: !73)
!83 = distinct !{!83, !75, !84, !60}
!84 = !DILocation(line: 65, column: 17, scope: !70)
!85 = !DILocation(line: 66, column: 13, scope: !66)
!86 = !DILocation(line: 69, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !62, file: !15, line: 68, column: 13)
!88 = !DILocation(line: 71, column: 18, scope: !31)
!89 = !DILocation(line: 71, column: 13, scope: !31)
!90 = !DILocation(line: 73, column: 5, scope: !32)
!91 = !DILocation(line: 74, column: 1, scope: !14)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_good", scope: !15, file: !15, line: 258, type: !16, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 260, column: 5, scope: !92)
!94 = !DILocation(line: 261, column: 5, scope: !92)
!95 = !DILocation(line: 262, column: 5, scope: !92)
!96 = !DILocation(line: 263, column: 5, scope: !92)
!97 = !DILocation(line: 264, column: 1, scope: !92)
!98 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 275, type: !99, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!5, !5, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !15, line: 275, type: !5)
!105 = !DILocation(line: 275, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !15, line: 275, type: !101)
!107 = !DILocation(line: 275, column: 27, scope: !98)
!108 = !DILocation(line: 278, column: 22, scope: !98)
!109 = !DILocation(line: 278, column: 12, scope: !98)
!110 = !DILocation(line: 278, column: 5, scope: !98)
!111 = !DILocation(line: 280, column: 5, scope: !98)
!112 = !DILocation(line: 281, column: 5, scope: !98)
!113 = !DILocation(line: 282, column: 5, scope: !98)
!114 = !DILocation(line: 285, column: 5, scope: !98)
!115 = !DILocation(line: 286, column: 5, scope: !98)
!116 = !DILocation(line: 287, column: 5, scope: !98)
!117 = !DILocation(line: 289, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 23, type: !119, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DISubroutineType(types: !120)
!120 = !{!5}
!121 = !DILocation(line: 25, column: 5, scope: !118)
!122 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !15, line: 83, type: !5)
!124 = !DILocation(line: 83, column: 9, scope: !122)
!125 = !DILocation(line: 85, column: 10, scope: !122)
!126 = !DILocation(line: 86, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !15, line: 86, column: 8)
!128 = !DILocation(line: 86, column: 8, scope: !122)
!129 = !DILocation(line: 89, column: 14, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !15, line: 87, column: 5)
!131 = !DILocation(line: 90, column: 5, scope: !130)
!132 = !DILocation(line: 91, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !122, file: !15, line: 91, column: 8)
!134 = !DILocation(line: 91, column: 8, scope: !122)
!135 = !DILocation(line: 94, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 92, column: 5)
!137 = !DILocation(line: 95, column: 5, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !139, file: !15, line: 99, type: !5)
!139 = distinct !DILexicalBlock(scope: !140, file: !15, line: 98, column: 9)
!140 = distinct !DILexicalBlock(scope: !133, file: !15, line: 97, column: 5)
!141 = !DILocation(line: 99, column: 17, scope: !139)
!142 = !DILocalVariable(name: "buffer", scope: !139, file: !15, line: 100, type: !4)
!143 = !DILocation(line: 100, column: 19, scope: !139)
!144 = !DILocation(line: 100, column: 35, scope: !139)
!145 = !DILocation(line: 100, column: 28, scope: !139)
!146 = !DILocation(line: 101, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !139, file: !15, line: 101, column: 17)
!148 = !DILocation(line: 101, column: 24, scope: !147)
!149 = !DILocation(line: 101, column: 17, scope: !139)
!150 = !DILocation(line: 101, column: 34, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !15, line: 101, column: 33)
!152 = !DILocation(line: 103, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !139, file: !15, line: 103, column: 13)
!154 = !DILocation(line: 103, column: 18, scope: !153)
!155 = !DILocation(line: 103, column: 25, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !15, line: 103, column: 13)
!157 = !DILocation(line: 103, column: 27, scope: !156)
!158 = !DILocation(line: 103, column: 13, scope: !153)
!159 = !DILocation(line: 105, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !15, line: 104, column: 13)
!161 = !DILocation(line: 105, column: 24, scope: !160)
!162 = !DILocation(line: 105, column: 27, scope: !160)
!163 = !DILocation(line: 106, column: 13, scope: !160)
!164 = !DILocation(line: 103, column: 34, scope: !156)
!165 = !DILocation(line: 103, column: 13, scope: !156)
!166 = distinct !{!166, !158, !167, !60}
!167 = !DILocation(line: 106, column: 13, scope: !153)
!168 = !DILocation(line: 108, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !139, file: !15, line: 108, column: 17)
!170 = !DILocation(line: 108, column: 22, scope: !169)
!171 = !DILocation(line: 108, column: 27, scope: !169)
!172 = !DILocation(line: 108, column: 30, scope: !169)
!173 = !DILocation(line: 108, column: 35, scope: !169)
!174 = !DILocation(line: 108, column: 17, scope: !139)
!175 = !DILocation(line: 110, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !169, file: !15, line: 109, column: 13)
!177 = !DILocation(line: 110, column: 24, scope: !176)
!178 = !DILocation(line: 110, column: 30, scope: !176)
!179 = !DILocation(line: 112, column: 23, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 112, column: 17)
!181 = !DILocation(line: 112, column: 21, scope: !180)
!182 = !DILocation(line: 112, column: 28, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !15, line: 112, column: 17)
!184 = !DILocation(line: 112, column: 30, scope: !183)
!185 = !DILocation(line: 112, column: 17, scope: !180)
!186 = !DILocation(line: 114, column: 34, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !15, line: 113, column: 17)
!188 = !DILocation(line: 114, column: 41, scope: !187)
!189 = !DILocation(line: 114, column: 21, scope: !187)
!190 = !DILocation(line: 115, column: 17, scope: !187)
!191 = !DILocation(line: 112, column: 37, scope: !183)
!192 = !DILocation(line: 112, column: 17, scope: !183)
!193 = distinct !{!193, !185, !194, !60}
!194 = !DILocation(line: 115, column: 17, scope: !180)
!195 = !DILocation(line: 116, column: 13, scope: !176)
!196 = !DILocation(line: 119, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !169, file: !15, line: 118, column: 13)
!198 = !DILocation(line: 121, column: 18, scope: !139)
!199 = !DILocation(line: 121, column: 13, scope: !139)
!200 = !DILocation(line: 124, column: 1, scope: !122)
!201 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 28, type: !119, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!202 = !DILocation(line: 30, column: 5, scope: !201)
!203 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 127, type: !16, scopeLine: 128, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!204 = !DILocalVariable(name: "data", scope: !203, file: !15, line: 129, type: !5)
!205 = !DILocation(line: 129, column: 9, scope: !203)
!206 = !DILocation(line: 131, column: 10, scope: !203)
!207 = !DILocation(line: 132, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !15, line: 132, column: 8)
!209 = !DILocation(line: 132, column: 8, scope: !203)
!210 = !DILocation(line: 135, column: 14, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !15, line: 133, column: 5)
!212 = !DILocation(line: 136, column: 5, scope: !211)
!213 = !DILocation(line: 137, column: 8, scope: !214)
!214 = distinct !DILexicalBlock(scope: !203, file: !15, line: 137, column: 8)
!215 = !DILocation(line: 137, column: 8, scope: !203)
!216 = !DILocalVariable(name: "i", scope: !217, file: !15, line: 140, type: !5)
!217 = distinct !DILexicalBlock(scope: !218, file: !15, line: 139, column: 9)
!218 = distinct !DILexicalBlock(scope: !214, file: !15, line: 138, column: 5)
!219 = !DILocation(line: 140, column: 17, scope: !217)
!220 = !DILocalVariable(name: "buffer", scope: !217, file: !15, line: 141, type: !4)
!221 = !DILocation(line: 141, column: 19, scope: !217)
!222 = !DILocation(line: 141, column: 35, scope: !217)
!223 = !DILocation(line: 141, column: 28, scope: !217)
!224 = !DILocation(line: 142, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !217, file: !15, line: 142, column: 17)
!226 = !DILocation(line: 142, column: 24, scope: !225)
!227 = !DILocation(line: 142, column: 17, scope: !217)
!228 = !DILocation(line: 142, column: 34, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !15, line: 142, column: 33)
!230 = !DILocation(line: 144, column: 20, scope: !231)
!231 = distinct !DILexicalBlock(scope: !217, file: !15, line: 144, column: 13)
!232 = !DILocation(line: 144, column: 18, scope: !231)
!233 = !DILocation(line: 144, column: 25, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !15, line: 144, column: 13)
!235 = !DILocation(line: 144, column: 27, scope: !234)
!236 = !DILocation(line: 144, column: 13, scope: !231)
!237 = !DILocation(line: 146, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !15, line: 145, column: 13)
!239 = !DILocation(line: 146, column: 24, scope: !238)
!240 = !DILocation(line: 146, column: 27, scope: !238)
!241 = !DILocation(line: 147, column: 13, scope: !238)
!242 = !DILocation(line: 144, column: 34, scope: !234)
!243 = !DILocation(line: 144, column: 13, scope: !234)
!244 = distinct !{!244, !236, !245, !60}
!245 = !DILocation(line: 147, column: 13, scope: !231)
!246 = !DILocation(line: 149, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !217, file: !15, line: 149, column: 17)
!248 = !DILocation(line: 149, column: 22, scope: !247)
!249 = !DILocation(line: 149, column: 27, scope: !247)
!250 = !DILocation(line: 149, column: 30, scope: !247)
!251 = !DILocation(line: 149, column: 35, scope: !247)
!252 = !DILocation(line: 149, column: 17, scope: !217)
!253 = !DILocation(line: 151, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !247, file: !15, line: 150, column: 13)
!255 = !DILocation(line: 151, column: 24, scope: !254)
!256 = !DILocation(line: 151, column: 30, scope: !254)
!257 = !DILocation(line: 153, column: 23, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !15, line: 153, column: 17)
!259 = !DILocation(line: 153, column: 21, scope: !258)
!260 = !DILocation(line: 153, column: 28, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !15, line: 153, column: 17)
!262 = !DILocation(line: 153, column: 30, scope: !261)
!263 = !DILocation(line: 153, column: 17, scope: !258)
!264 = !DILocation(line: 155, column: 34, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !15, line: 154, column: 17)
!266 = !DILocation(line: 155, column: 41, scope: !265)
!267 = !DILocation(line: 155, column: 21, scope: !265)
!268 = !DILocation(line: 156, column: 17, scope: !265)
!269 = !DILocation(line: 153, column: 37, scope: !261)
!270 = !DILocation(line: 153, column: 17, scope: !261)
!271 = distinct !{!271, !263, !272, !60}
!272 = !DILocation(line: 156, column: 17, scope: !258)
!273 = !DILocation(line: 157, column: 13, scope: !254)
!274 = !DILocation(line: 160, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !247, file: !15, line: 159, column: 13)
!276 = !DILocation(line: 162, column: 18, scope: !217)
!277 = !DILocation(line: 162, column: 13, scope: !217)
!278 = !DILocation(line: 164, column: 5, scope: !218)
!279 = !DILocation(line: 165, column: 1, scope: !203)
!280 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 168, type: !16, scopeLine: 169, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!281 = !DILocalVariable(name: "data", scope: !280, file: !15, line: 170, type: !5)
!282 = !DILocation(line: 170, column: 9, scope: !280)
!283 = !DILocation(line: 172, column: 10, scope: !280)
!284 = !DILocation(line: 173, column: 8, scope: !285)
!285 = distinct !DILexicalBlock(scope: !280, file: !15, line: 173, column: 8)
!286 = !DILocation(line: 173, column: 8, scope: !280)
!287 = !DILocation(line: 176, column: 9, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !15, line: 174, column: 5)
!289 = !DILocation(line: 177, column: 5, scope: !288)
!290 = !DILocation(line: 182, column: 14, scope: !291)
!291 = distinct !DILexicalBlock(scope: !285, file: !15, line: 179, column: 5)
!292 = !DILocation(line: 184, column: 8, scope: !293)
!293 = distinct !DILexicalBlock(scope: !280, file: !15, line: 184, column: 8)
!294 = !DILocation(line: 184, column: 8, scope: !280)
!295 = !DILocalVariable(name: "i", scope: !296, file: !15, line: 187, type: !5)
!296 = distinct !DILexicalBlock(scope: !297, file: !15, line: 186, column: 9)
!297 = distinct !DILexicalBlock(scope: !293, file: !15, line: 185, column: 5)
!298 = !DILocation(line: 187, column: 17, scope: !296)
!299 = !DILocalVariable(name: "buffer", scope: !296, file: !15, line: 188, type: !4)
!300 = !DILocation(line: 188, column: 19, scope: !296)
!301 = !DILocation(line: 188, column: 35, scope: !296)
!302 = !DILocation(line: 188, column: 28, scope: !296)
!303 = !DILocation(line: 189, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !296, file: !15, line: 189, column: 17)
!305 = !DILocation(line: 189, column: 24, scope: !304)
!306 = !DILocation(line: 189, column: 17, scope: !296)
!307 = !DILocation(line: 189, column: 34, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !15, line: 189, column: 33)
!309 = !DILocation(line: 191, column: 20, scope: !310)
!310 = distinct !DILexicalBlock(scope: !296, file: !15, line: 191, column: 13)
!311 = !DILocation(line: 191, column: 18, scope: !310)
!312 = !DILocation(line: 191, column: 25, scope: !313)
!313 = distinct !DILexicalBlock(scope: !310, file: !15, line: 191, column: 13)
!314 = !DILocation(line: 191, column: 27, scope: !313)
!315 = !DILocation(line: 191, column: 13, scope: !310)
!316 = !DILocation(line: 193, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !15, line: 192, column: 13)
!318 = !DILocation(line: 193, column: 24, scope: !317)
!319 = !DILocation(line: 193, column: 27, scope: !317)
!320 = !DILocation(line: 194, column: 13, scope: !317)
!321 = !DILocation(line: 191, column: 34, scope: !313)
!322 = !DILocation(line: 191, column: 13, scope: !313)
!323 = distinct !{!323, !315, !324, !60}
!324 = !DILocation(line: 194, column: 13, scope: !310)
!325 = !DILocation(line: 197, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !296, file: !15, line: 197, column: 17)
!327 = !DILocation(line: 197, column: 22, scope: !326)
!328 = !DILocation(line: 197, column: 17, scope: !296)
!329 = !DILocation(line: 199, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !15, line: 198, column: 13)
!331 = !DILocation(line: 199, column: 24, scope: !330)
!332 = !DILocation(line: 199, column: 30, scope: !330)
!333 = !DILocation(line: 201, column: 23, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !15, line: 201, column: 17)
!335 = !DILocation(line: 201, column: 21, scope: !334)
!336 = !DILocation(line: 201, column: 28, scope: !337)
!337 = distinct !DILexicalBlock(scope: !334, file: !15, line: 201, column: 17)
!338 = !DILocation(line: 201, column: 30, scope: !337)
!339 = !DILocation(line: 201, column: 17, scope: !334)
!340 = !DILocation(line: 203, column: 34, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !15, line: 202, column: 17)
!342 = !DILocation(line: 203, column: 41, scope: !341)
!343 = !DILocation(line: 203, column: 21, scope: !341)
!344 = !DILocation(line: 204, column: 17, scope: !341)
!345 = !DILocation(line: 201, column: 37, scope: !337)
!346 = !DILocation(line: 201, column: 17, scope: !337)
!347 = distinct !{!347, !339, !348, !60}
!348 = !DILocation(line: 204, column: 17, scope: !334)
!349 = !DILocation(line: 205, column: 13, scope: !330)
!350 = !DILocation(line: 208, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !326, file: !15, line: 207, column: 13)
!352 = !DILocation(line: 210, column: 18, scope: !296)
!353 = !DILocation(line: 210, column: 13, scope: !296)
!354 = !DILocation(line: 212, column: 5, scope: !297)
!355 = !DILocation(line: 213, column: 1, scope: !280)
!356 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 216, type: !16, scopeLine: 217, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!357 = !DILocalVariable(name: "data", scope: !356, file: !15, line: 218, type: !5)
!358 = !DILocation(line: 218, column: 9, scope: !356)
!359 = !DILocation(line: 220, column: 10, scope: !356)
!360 = !DILocation(line: 221, column: 8, scope: !361)
!361 = distinct !DILexicalBlock(scope: !356, file: !15, line: 221, column: 8)
!362 = !DILocation(line: 221, column: 8, scope: !356)
!363 = !DILocation(line: 225, column: 14, scope: !364)
!364 = distinct !DILexicalBlock(scope: !361, file: !15, line: 222, column: 5)
!365 = !DILocation(line: 226, column: 5, scope: !364)
!366 = !DILocation(line: 227, column: 8, scope: !367)
!367 = distinct !DILexicalBlock(scope: !356, file: !15, line: 227, column: 8)
!368 = !DILocation(line: 227, column: 8, scope: !356)
!369 = !DILocalVariable(name: "i", scope: !370, file: !15, line: 230, type: !5)
!370 = distinct !DILexicalBlock(scope: !371, file: !15, line: 229, column: 9)
!371 = distinct !DILexicalBlock(scope: !367, file: !15, line: 228, column: 5)
!372 = !DILocation(line: 230, column: 17, scope: !370)
!373 = !DILocalVariable(name: "buffer", scope: !370, file: !15, line: 231, type: !4)
!374 = !DILocation(line: 231, column: 19, scope: !370)
!375 = !DILocation(line: 231, column: 35, scope: !370)
!376 = !DILocation(line: 231, column: 28, scope: !370)
!377 = !DILocation(line: 232, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !370, file: !15, line: 232, column: 17)
!379 = !DILocation(line: 232, column: 24, scope: !378)
!380 = !DILocation(line: 232, column: 17, scope: !370)
!381 = !DILocation(line: 232, column: 34, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !15, line: 232, column: 33)
!383 = !DILocation(line: 234, column: 20, scope: !384)
!384 = distinct !DILexicalBlock(scope: !370, file: !15, line: 234, column: 13)
!385 = !DILocation(line: 234, column: 18, scope: !384)
!386 = !DILocation(line: 234, column: 25, scope: !387)
!387 = distinct !DILexicalBlock(scope: !384, file: !15, line: 234, column: 13)
!388 = !DILocation(line: 234, column: 27, scope: !387)
!389 = !DILocation(line: 234, column: 13, scope: !384)
!390 = !DILocation(line: 236, column: 17, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !15, line: 235, column: 13)
!392 = !DILocation(line: 236, column: 24, scope: !391)
!393 = !DILocation(line: 236, column: 27, scope: !391)
!394 = !DILocation(line: 237, column: 13, scope: !391)
!395 = !DILocation(line: 234, column: 34, scope: !387)
!396 = !DILocation(line: 234, column: 13, scope: !387)
!397 = distinct !{!397, !389, !398, !60}
!398 = !DILocation(line: 237, column: 13, scope: !384)
!399 = !DILocation(line: 240, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !370, file: !15, line: 240, column: 17)
!401 = !DILocation(line: 240, column: 22, scope: !400)
!402 = !DILocation(line: 240, column: 17, scope: !370)
!403 = !DILocation(line: 242, column: 17, scope: !404)
!404 = distinct !DILexicalBlock(scope: !400, file: !15, line: 241, column: 13)
!405 = !DILocation(line: 242, column: 24, scope: !404)
!406 = !DILocation(line: 242, column: 30, scope: !404)
!407 = !DILocation(line: 244, column: 23, scope: !408)
!408 = distinct !DILexicalBlock(scope: !404, file: !15, line: 244, column: 17)
!409 = !DILocation(line: 244, column: 21, scope: !408)
!410 = !DILocation(line: 244, column: 28, scope: !411)
!411 = distinct !DILexicalBlock(scope: !408, file: !15, line: 244, column: 17)
!412 = !DILocation(line: 244, column: 30, scope: !411)
!413 = !DILocation(line: 244, column: 17, scope: !408)
!414 = !DILocation(line: 246, column: 34, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !15, line: 245, column: 17)
!416 = !DILocation(line: 246, column: 41, scope: !415)
!417 = !DILocation(line: 246, column: 21, scope: !415)
!418 = !DILocation(line: 247, column: 17, scope: !415)
!419 = !DILocation(line: 244, column: 37, scope: !411)
!420 = !DILocation(line: 244, column: 17, scope: !411)
!421 = distinct !{!421, !413, !422, !60}
!422 = !DILocation(line: 247, column: 17, scope: !408)
!423 = !DILocation(line: 248, column: 13, scope: !404)
!424 = !DILocation(line: 251, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !400, file: !15, line: 250, column: 13)
!426 = !DILocation(line: 253, column: 18, scope: !370)
!427 = !DILocation(line: 253, column: 13, scope: !370)
!428 = !DILocation(line: 255, column: 5, scope: !371)
!429 = !DILocation(line: 256, column: 1, scope: !356)
