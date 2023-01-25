; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08_bad() #0 !dbg !14 {
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
  %call1 = call i32 @rand() #5, !dbg !24
  %and = and i32 %call1, 1, !dbg !24
  %tobool2 = icmp ne i32 %and, 0, !dbg !24
  br i1 %tobool2, label %cond.true, label %cond.false, !dbg !24

cond.true:                                        ; preds = %if.then
  %call3 = call i32 @rand() #5, !dbg !24
  %shl = shl i32 %call3, 30, !dbg !24
  %call4 = call i32 @rand() #5, !dbg !24
  %shl5 = shl i32 %call4, 15, !dbg !24
  %xor = xor i32 %shl, %shl5, !dbg !24
  %call6 = call i32 @rand() #5, !dbg !24
  %xor7 = xor i32 %xor, %call6, !dbg !24
  br label %cond.end, !dbg !24

cond.false:                                       ; preds = %if.then
  %call8 = call i32 @rand() #5, !dbg !24
  %shl9 = shl i32 %call8, 30, !dbg !24
  %call10 = call i32 @rand() #5, !dbg !24
  %shl11 = shl i32 %call10, 15, !dbg !24
  %xor12 = xor i32 %shl9, %shl11, !dbg !24
  %call13 = call i32 @rand() #5, !dbg !24
  %xor14 = xor i32 %xor12, %call13, !dbg !24
  %sub = sub i32 0, %xor14, !dbg !24
  %sub15 = sub i32 %sub, 1, !dbg !24
  br label %cond.end, !dbg !24

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor7, %cond.true ], [ %sub15, %cond.false ], !dbg !24
  store i32 %cond, i32* %data, align 4, !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %cond.end, %entry
  %call16 = call i32 @staticReturnsTrue(), !dbg !28
  %tobool17 = icmp ne i32 %call16, 0, !dbg !28
  br i1 %tobool17, label %if.then18, label %if.end36, !dbg !30

if.then18:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !35, metadata !DIExpression()), !dbg !36
  %call19 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !37
  %0 = bitcast i8* %call19 to i32*, !dbg !38
  store i32* %0, i32** %buffer, align 8, !dbg !36
  %1 = load i32*, i32** %buffer, align 8, !dbg !39
  %cmp = icmp eq i32* %1, null, !dbg !41
  br i1 %cmp, label %if.then20, label %if.end21, !dbg !42

if.then20:                                        ; preds = %if.then18
  call void @exit(i32 -1) #6, !dbg !43
  unreachable, !dbg !43

if.end21:                                         ; preds = %if.then18
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end21
  %2 = load i32, i32* %i, align 4, !dbg !48
  %cmp22 = icmp slt i32 %2, 10, !dbg !50
  br i1 %cmp22, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !52
  %4 = load i32, i32* %i, align 4, !dbg !54
  %idxprom = sext i32 %4 to i64, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !52
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %5, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !62
  %cmp23 = icmp sge i32 %6, 0, !dbg !64
  br i1 %cmp23, label %if.then24, label %if.else, !dbg !65

if.then24:                                        ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !66
  %8 = load i32, i32* %data, align 4, !dbg !68
  %idxprom25 = sext i32 %8 to i64, !dbg !66
  %arrayidx26 = getelementptr inbounds i32, i32* %7, i64 %idxprom25, !dbg !66
  store i32 1, i32* %arrayidx26, align 4, !dbg !69
  store i32 0, i32* %i, align 4, !dbg !70
  br label %for.cond27, !dbg !72

for.cond27:                                       ; preds = %for.inc32, %if.then24
  %9 = load i32, i32* %i, align 4, !dbg !73
  %cmp28 = icmp slt i32 %9, 10, !dbg !75
  br i1 %cmp28, label %for.body29, label %for.end34, !dbg !76

for.body29:                                       ; preds = %for.cond27
  %10 = load i32*, i32** %buffer, align 8, !dbg !77
  %11 = load i32, i32* %i, align 4, !dbg !79
  %idxprom30 = sext i32 %11 to i64, !dbg !77
  %arrayidx31 = getelementptr inbounds i32, i32* %10, i64 %idxprom30, !dbg !77
  %12 = load i32, i32* %arrayidx31, align 4, !dbg !77
  call void @printIntLine(i32 %12), !dbg !80
  br label %for.inc32, !dbg !81

for.inc32:                                        ; preds = %for.body29
  %13 = load i32, i32* %i, align 4, !dbg !82
  %inc33 = add nsw i32 %13, 1, !dbg !82
  store i32 %inc33, i32* %i, align 4, !dbg !82
  br label %for.cond27, !dbg !83, !llvm.loop !84

for.end34:                                        ; preds = %for.cond27
  br label %if.end35, !dbg !86

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !87
  br label %if.end35

if.end35:                                         ; preds = %if.else, %for.end34
  %14 = load i32*, i32** %buffer, align 8, !dbg !89
  %15 = bitcast i32* %14 to i8*, !dbg !89
  call void @free(i8* %15) #5, !dbg !90
  br label %if.end36, !dbg !91

if.end36:                                         ; preds = %if.end35, %if.end
  ret void, !dbg !92
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08_good() #0 !dbg !93 {
entry:
  call void @goodB2G1(), !dbg !94
  call void @goodB2G2(), !dbg !95
  call void @goodG2B1(), !dbg !96
  call void @goodG2B2(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* null) #5, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 %conv) #5, !dbg !111
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08_good(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08_bad(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !119 {
entry:
  ret i32 1, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !123 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 -1, i32* %data, align 4, !dbg !126
  %call = call i32 @staticReturnsTrue(), !dbg !127
  %tobool = icmp ne i32 %call, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !130
  %and = and i32 %call1, 1, !dbg !130
  %tobool2 = icmp ne i32 %and, 0, !dbg !130
  br i1 %tobool2, label %cond.true, label %cond.false, !dbg !130

cond.true:                                        ; preds = %if.then
  %call3 = call i32 @rand() #5, !dbg !130
  %shl = shl i32 %call3, 30, !dbg !130
  %call4 = call i32 @rand() #5, !dbg !130
  %shl5 = shl i32 %call4, 15, !dbg !130
  %xor = xor i32 %shl, %shl5, !dbg !130
  %call6 = call i32 @rand() #5, !dbg !130
  %xor7 = xor i32 %xor, %call6, !dbg !130
  br label %cond.end, !dbg !130

cond.false:                                       ; preds = %if.then
  %call8 = call i32 @rand() #5, !dbg !130
  %shl9 = shl i32 %call8, 30, !dbg !130
  %call10 = call i32 @rand() #5, !dbg !130
  %shl11 = shl i32 %call10, 15, !dbg !130
  %xor12 = xor i32 %shl9, %shl11, !dbg !130
  %call13 = call i32 @rand() #5, !dbg !130
  %xor14 = xor i32 %xor12, %call13, !dbg !130
  %sub = sub i32 0, %xor14, !dbg !130
  %sub15 = sub i32 %sub, 1, !dbg !130
  br label %cond.end, !dbg !130

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor7, %cond.true ], [ %sub15, %cond.false ], !dbg !130
  store i32 %cond, i32* %data, align 4, !dbg !132
  br label %if.end, !dbg !133

if.end:                                           ; preds = %cond.end, %entry
  %call16 = call i32 @staticReturnsFalse(), !dbg !134
  %tobool17 = icmp ne i32 %call16, 0, !dbg !134
  br i1 %tobool17, label %if.then18, label %if.else, !dbg !136

if.then18:                                        ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !137
  br label %if.end38, !dbg !139

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !140, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !144, metadata !DIExpression()), !dbg !145
  %call19 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !146
  %0 = bitcast i8* %call19 to i32*, !dbg !147
  store i32* %0, i32** %buffer, align 8, !dbg !145
  %1 = load i32*, i32** %buffer, align 8, !dbg !148
  %cmp = icmp eq i32* %1, null, !dbg !150
  br i1 %cmp, label %if.then20, label %if.end21, !dbg !151

if.then20:                                        ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !152
  unreachable, !dbg !152

if.end21:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end21
  %2 = load i32, i32* %i, align 4, !dbg !157
  %cmp22 = icmp slt i32 %2, 10, !dbg !159
  br i1 %cmp22, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !161
  %4 = load i32, i32* %i, align 4, !dbg !163
  %idxprom = sext i32 %4 to i64, !dbg !161
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !161
  store i32 0, i32* %arrayidx, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !166
  %inc = add nsw i32 %5, 1, !dbg !166
  store i32 %inc, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !170
  %cmp23 = icmp sge i32 %6, 0, !dbg !172
  br i1 %cmp23, label %land.lhs.true, label %if.else36, !dbg !173

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !174
  %cmp24 = icmp slt i32 %7, 10, !dbg !175
  br i1 %cmp24, label %if.then25, label %if.else36, !dbg !176

if.then25:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !177
  %9 = load i32, i32* %data, align 4, !dbg !179
  %idxprom26 = sext i32 %9 to i64, !dbg !177
  %arrayidx27 = getelementptr inbounds i32, i32* %8, i64 %idxprom26, !dbg !177
  store i32 1, i32* %arrayidx27, align 4, !dbg !180
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond28, !dbg !183

for.cond28:                                       ; preds = %for.inc33, %if.then25
  %10 = load i32, i32* %i, align 4, !dbg !184
  %cmp29 = icmp slt i32 %10, 10, !dbg !186
  br i1 %cmp29, label %for.body30, label %for.end35, !dbg !187

for.body30:                                       ; preds = %for.cond28
  %11 = load i32*, i32** %buffer, align 8, !dbg !188
  %12 = load i32, i32* %i, align 4, !dbg !190
  %idxprom31 = sext i32 %12 to i64, !dbg !188
  %arrayidx32 = getelementptr inbounds i32, i32* %11, i64 %idxprom31, !dbg !188
  %13 = load i32, i32* %arrayidx32, align 4, !dbg !188
  call void @printIntLine(i32 %13), !dbg !191
  br label %for.inc33, !dbg !192

for.inc33:                                        ; preds = %for.body30
  %14 = load i32, i32* %i, align 4, !dbg !193
  %inc34 = add nsw i32 %14, 1, !dbg !193
  store i32 %inc34, i32* %i, align 4, !dbg !193
  br label %for.cond28, !dbg !194, !llvm.loop !195

for.end35:                                        ; preds = %for.cond28
  br label %if.end37, !dbg !197

if.else36:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !198
  br label %if.end37

if.end37:                                         ; preds = %if.else36, %for.end35
  %15 = load i32*, i32** %buffer, align 8, !dbg !200
  %16 = bitcast i32* %15 to i8*, !dbg !200
  call void @free(i8* %16) #5, !dbg !201
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then18
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !203 {
entry:
  ret i32 0, !dbg !204
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !205 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !206, metadata !DIExpression()), !dbg !207
  store i32 -1, i32* %data, align 4, !dbg !208
  %call = call i32 @staticReturnsTrue(), !dbg !209
  %tobool = icmp ne i32 %call, 0, !dbg !209
  br i1 %tobool, label %if.then, label %if.end, !dbg !211

if.then:                                          ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !212
  %and = and i32 %call1, 1, !dbg !212
  %tobool2 = icmp ne i32 %and, 0, !dbg !212
  br i1 %tobool2, label %cond.true, label %cond.false, !dbg !212

cond.true:                                        ; preds = %if.then
  %call3 = call i32 @rand() #5, !dbg !212
  %shl = shl i32 %call3, 30, !dbg !212
  %call4 = call i32 @rand() #5, !dbg !212
  %shl5 = shl i32 %call4, 15, !dbg !212
  %xor = xor i32 %shl, %shl5, !dbg !212
  %call6 = call i32 @rand() #5, !dbg !212
  %xor7 = xor i32 %xor, %call6, !dbg !212
  br label %cond.end, !dbg !212

cond.false:                                       ; preds = %if.then
  %call8 = call i32 @rand() #5, !dbg !212
  %shl9 = shl i32 %call8, 30, !dbg !212
  %call10 = call i32 @rand() #5, !dbg !212
  %shl11 = shl i32 %call10, 15, !dbg !212
  %xor12 = xor i32 %shl9, %shl11, !dbg !212
  %call13 = call i32 @rand() #5, !dbg !212
  %xor14 = xor i32 %xor12, %call13, !dbg !212
  %sub = sub i32 0, %xor14, !dbg !212
  %sub15 = sub i32 %sub, 1, !dbg !212
  br label %cond.end, !dbg !212

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor7, %cond.true ], [ %sub15, %cond.false ], !dbg !212
  store i32 %cond, i32* %data, align 4, !dbg !214
  br label %if.end, !dbg !215

if.end:                                           ; preds = %cond.end, %entry
  %call16 = call i32 @staticReturnsTrue(), !dbg !216
  %tobool17 = icmp ne i32 %call16, 0, !dbg !216
  br i1 %tobool17, label %if.then18, label %if.end37, !dbg !218

if.then18:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !219, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !223, metadata !DIExpression()), !dbg !224
  %call19 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !225
  %0 = bitcast i8* %call19 to i32*, !dbg !226
  store i32* %0, i32** %buffer, align 8, !dbg !224
  %1 = load i32*, i32** %buffer, align 8, !dbg !227
  %cmp = icmp eq i32* %1, null, !dbg !229
  br i1 %cmp, label %if.then20, label %if.end21, !dbg !230

if.then20:                                        ; preds = %if.then18
  call void @exit(i32 -1) #6, !dbg !231
  unreachable, !dbg !231

if.end21:                                         ; preds = %if.then18
  store i32 0, i32* %i, align 4, !dbg !233
  br label %for.cond, !dbg !235

for.cond:                                         ; preds = %for.inc, %if.end21
  %2 = load i32, i32* %i, align 4, !dbg !236
  %cmp22 = icmp slt i32 %2, 10, !dbg !238
  br i1 %cmp22, label %for.body, label %for.end, !dbg !239

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !240
  %4 = load i32, i32* %i, align 4, !dbg !242
  %idxprom = sext i32 %4 to i64, !dbg !240
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !240
  store i32 0, i32* %arrayidx, align 4, !dbg !243
  br label %for.inc, !dbg !244

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !245
  %inc = add nsw i32 %5, 1, !dbg !245
  store i32 %inc, i32* %i, align 4, !dbg !245
  br label %for.cond, !dbg !246, !llvm.loop !247

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !249
  %cmp23 = icmp sge i32 %6, 0, !dbg !251
  br i1 %cmp23, label %land.lhs.true, label %if.else, !dbg !252

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !253
  %cmp24 = icmp slt i32 %7, 10, !dbg !254
  br i1 %cmp24, label %if.then25, label %if.else, !dbg !255

if.then25:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !256
  %9 = load i32, i32* %data, align 4, !dbg !258
  %idxprom26 = sext i32 %9 to i64, !dbg !256
  %arrayidx27 = getelementptr inbounds i32, i32* %8, i64 %idxprom26, !dbg !256
  store i32 1, i32* %arrayidx27, align 4, !dbg !259
  store i32 0, i32* %i, align 4, !dbg !260
  br label %for.cond28, !dbg !262

for.cond28:                                       ; preds = %for.inc33, %if.then25
  %10 = load i32, i32* %i, align 4, !dbg !263
  %cmp29 = icmp slt i32 %10, 10, !dbg !265
  br i1 %cmp29, label %for.body30, label %for.end35, !dbg !266

for.body30:                                       ; preds = %for.cond28
  %11 = load i32*, i32** %buffer, align 8, !dbg !267
  %12 = load i32, i32* %i, align 4, !dbg !269
  %idxprom31 = sext i32 %12 to i64, !dbg !267
  %arrayidx32 = getelementptr inbounds i32, i32* %11, i64 %idxprom31, !dbg !267
  %13 = load i32, i32* %arrayidx32, align 4, !dbg !267
  call void @printIntLine(i32 %13), !dbg !270
  br label %for.inc33, !dbg !271

for.inc33:                                        ; preds = %for.body30
  %14 = load i32, i32* %i, align 4, !dbg !272
  %inc34 = add nsw i32 %14, 1, !dbg !272
  store i32 %inc34, i32* %i, align 4, !dbg !272
  br label %for.cond28, !dbg !273, !llvm.loop !274

for.end35:                                        ; preds = %for.cond28
  br label %if.end36, !dbg !276

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !277
  br label %if.end36

if.end36:                                         ; preds = %if.else, %for.end35
  %15 = load i32*, i32** %buffer, align 8, !dbg !279
  %16 = bitcast i32* %15 to i8*, !dbg !279
  call void @free(i8* %16) #5, !dbg !280
  br label %if.end37, !dbg !281

if.end37:                                         ; preds = %if.end36, %if.end
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
  %call = call i32 @staticReturnsFalse(), !dbg !287
  %tobool = icmp ne i32 %call, 0, !dbg !287
  br i1 %tobool, label %if.then, label %if.else, !dbg !289

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !290
  br label %if.end, !dbg !292

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !293
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !295
  %tobool2 = icmp ne i32 %call1, 0, !dbg !295
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !297

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !298, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !302, metadata !DIExpression()), !dbg !303
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !304
  %0 = bitcast i8* %call4 to i32*, !dbg !305
  store i32* %0, i32** %buffer, align 8, !dbg !303
  %1 = load i32*, i32** %buffer, align 8, !dbg !306
  %cmp = icmp eq i32* %1, null, !dbg !308
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !309

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !310
  unreachable, !dbg !310

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !312
  br label %for.cond, !dbg !314

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !315
  %cmp7 = icmp slt i32 %2, 10, !dbg !317
  br i1 %cmp7, label %for.body, label %for.end, !dbg !318

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !319
  %4 = load i32, i32* %i, align 4, !dbg !321
  %idxprom = sext i32 %4 to i64, !dbg !319
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !319
  store i32 0, i32* %arrayidx, align 4, !dbg !322
  br label %for.inc, !dbg !323

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !324
  %inc = add nsw i32 %5, 1, !dbg !324
  store i32 %inc, i32* %i, align 4, !dbg !324
  br label %for.cond, !dbg !325, !llvm.loop !326

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !328
  %cmp8 = icmp sge i32 %6, 0, !dbg !330
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !331

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !332
  %8 = load i32, i32* %data, align 4, !dbg !334
  %idxprom10 = sext i32 %8 to i64, !dbg !332
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !332
  store i32 1, i32* %arrayidx11, align 4, !dbg !335
  store i32 0, i32* %i, align 4, !dbg !336
  br label %for.cond12, !dbg !338

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !339
  %cmp13 = icmp slt i32 %9, 10, !dbg !341
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !342

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !343
  %11 = load i32, i32* %i, align 4, !dbg !345
  %idxprom15 = sext i32 %11 to i64, !dbg !343
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !343
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !343
  call void @printIntLine(i32 %12), !dbg !346
  br label %for.inc17, !dbg !347

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !348
  %inc18 = add nsw i32 %13, 1, !dbg !348
  store i32 %inc18, i32* %i, align 4, !dbg !348
  br label %for.cond12, !dbg !349, !llvm.loop !350

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !352

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !353
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !355
  %15 = bitcast i32* %14 to i8*, !dbg !355
  call void @free(i8* %15) #5, !dbg !356
  br label %if.end22, !dbg !357

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !358
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !359 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !360, metadata !DIExpression()), !dbg !361
  store i32 -1, i32* %data, align 4, !dbg !362
  %call = call i32 @staticReturnsTrue(), !dbg !363
  %tobool = icmp ne i32 %call, 0, !dbg !363
  br i1 %tobool, label %if.then, label %if.end, !dbg !365

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !366
  br label %if.end, !dbg !368

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !369
  %tobool2 = icmp ne i32 %call1, 0, !dbg !369
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !371

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !372, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !376, metadata !DIExpression()), !dbg !377
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !378
  %0 = bitcast i8* %call4 to i32*, !dbg !379
  store i32* %0, i32** %buffer, align 8, !dbg !377
  %1 = load i32*, i32** %buffer, align 8, !dbg !380
  %cmp = icmp eq i32* %1, null, !dbg !382
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !383

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !384
  unreachable, !dbg !384

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !386
  br label %for.cond, !dbg !388

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !389
  %cmp7 = icmp slt i32 %2, 10, !dbg !391
  br i1 %cmp7, label %for.body, label %for.end, !dbg !392

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !393
  %4 = load i32, i32* %i, align 4, !dbg !395
  %idxprom = sext i32 %4 to i64, !dbg !393
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !393
  store i32 0, i32* %arrayidx, align 4, !dbg !396
  br label %for.inc, !dbg !397

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !398
  %inc = add nsw i32 %5, 1, !dbg !398
  store i32 %inc, i32* %i, align 4, !dbg !398
  br label %for.cond, !dbg !399, !llvm.loop !400

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !402
  %cmp8 = icmp sge i32 %6, 0, !dbg !404
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !405

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !406
  %8 = load i32, i32* %data, align 4, !dbg !408
  %idxprom10 = sext i32 %8 to i64, !dbg !406
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !406
  store i32 1, i32* %arrayidx11, align 4, !dbg !409
  store i32 0, i32* %i, align 4, !dbg !410
  br label %for.cond12, !dbg !412

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !413
  %cmp13 = icmp slt i32 %9, 10, !dbg !415
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !416

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !417
  %11 = load i32, i32* %i, align 4, !dbg !419
  %idxprom15 = sext i32 %11 to i64, !dbg !417
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !417
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !417
  call void @printIntLine(i32 %12), !dbg !420
  br label %for.inc17, !dbg !421

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !422
  %inc18 = add nsw i32 %13, 1, !dbg !422
  store i32 %inc18, i32* %i, align 4, !dbg !422
  br label %for.cond12, !dbg !423, !llvm.loop !424

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !426

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !427
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !429
  %15 = bitcast i32* %14 to i8*, !dbg !429
  call void @free(i8* %15) #5, !dbg !430
  br label %if.end21, !dbg !431

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !432
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !6, !7}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!19 = !DILocation(line: 37, column: 9, scope: !14)
!20 = !DILocation(line: 39, column: 10, scope: !14)
!21 = !DILocation(line: 40, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 8)
!23 = !DILocation(line: 40, column: 8, scope: !14)
!24 = !DILocation(line: 43, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 5)
!26 = !DILocation(line: 43, column: 14, scope: !25)
!27 = !DILocation(line: 44, column: 5, scope: !25)
!28 = !DILocation(line: 45, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 8)
!30 = !DILocation(line: 45, column: 8, scope: !14)
!31 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 48, type: !4)
!32 = distinct !DILexicalBlock(scope: !33, file: !15, line: 47, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 46, column: 5)
!34 = !DILocation(line: 48, column: 17, scope: !32)
!35 = !DILocalVariable(name: "buffer", scope: !32, file: !15, line: 49, type: !6)
!36 = !DILocation(line: 49, column: 19, scope: !32)
!37 = !DILocation(line: 49, column: 35, scope: !32)
!38 = !DILocation(line: 49, column: 28, scope: !32)
!39 = !DILocation(line: 50, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !15, line: 50, column: 17)
!41 = !DILocation(line: 50, column: 24, scope: !40)
!42 = !DILocation(line: 50, column: 17, scope: !32)
!43 = !DILocation(line: 50, column: 34, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 50, column: 33)
!45 = !DILocation(line: 52, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !32, file: !15, line: 52, column: 13)
!47 = !DILocation(line: 52, column: 18, scope: !46)
!48 = !DILocation(line: 52, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 52, column: 13)
!50 = !DILocation(line: 52, column: 27, scope: !49)
!51 = !DILocation(line: 52, column: 13, scope: !46)
!52 = !DILocation(line: 54, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 53, column: 13)
!54 = !DILocation(line: 54, column: 24, scope: !53)
!55 = !DILocation(line: 54, column: 27, scope: !53)
!56 = !DILocation(line: 55, column: 13, scope: !53)
!57 = !DILocation(line: 52, column: 34, scope: !49)
!58 = !DILocation(line: 52, column: 13, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 55, column: 13, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 58, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !32, file: !15, line: 58, column: 17)
!64 = !DILocation(line: 58, column: 22, scope: !63)
!65 = !DILocation(line: 58, column: 17, scope: !32)
!66 = !DILocation(line: 60, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 59, column: 13)
!68 = !DILocation(line: 60, column: 24, scope: !67)
!69 = !DILocation(line: 60, column: 30, scope: !67)
!70 = !DILocation(line: 62, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 62, column: 17)
!72 = !DILocation(line: 62, column: 21, scope: !71)
!73 = !DILocation(line: 62, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !15, line: 62, column: 17)
!75 = !DILocation(line: 62, column: 30, scope: !74)
!76 = !DILocation(line: 62, column: 17, scope: !71)
!77 = !DILocation(line: 64, column: 34, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 63, column: 17)
!79 = !DILocation(line: 64, column: 41, scope: !78)
!80 = !DILocation(line: 64, column: 21, scope: !78)
!81 = !DILocation(line: 65, column: 17, scope: !78)
!82 = !DILocation(line: 62, column: 37, scope: !74)
!83 = !DILocation(line: 62, column: 17, scope: !74)
!84 = distinct !{!84, !76, !85, !61}
!85 = !DILocation(line: 65, column: 17, scope: !71)
!86 = !DILocation(line: 66, column: 13, scope: !67)
!87 = !DILocation(line: 69, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !63, file: !15, line: 68, column: 13)
!89 = !DILocation(line: 71, column: 18, scope: !32)
!90 = !DILocation(line: 71, column: 13, scope: !32)
!91 = !DILocation(line: 73, column: 5, scope: !33)
!92 = !DILocation(line: 74, column: 1, scope: !14)
!93 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_08_good", scope: !15, file: !15, line: 258, type: !16, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 260, column: 5, scope: !93)
!95 = !DILocation(line: 261, column: 5, scope: !93)
!96 = !DILocation(line: 262, column: 5, scope: !93)
!97 = !DILocation(line: 263, column: 5, scope: !93)
!98 = !DILocation(line: 264, column: 1, scope: !93)
!99 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 275, type: !100, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!4, !4, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !15, line: 275, type: !4)
!106 = !DILocation(line: 275, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !15, line: 275, type: !102)
!108 = !DILocation(line: 275, column: 27, scope: !99)
!109 = !DILocation(line: 278, column: 22, scope: !99)
!110 = !DILocation(line: 278, column: 12, scope: !99)
!111 = !DILocation(line: 278, column: 5, scope: !99)
!112 = !DILocation(line: 280, column: 5, scope: !99)
!113 = !DILocation(line: 281, column: 5, scope: !99)
!114 = !DILocation(line: 282, column: 5, scope: !99)
!115 = !DILocation(line: 285, column: 5, scope: !99)
!116 = !DILocation(line: 286, column: 5, scope: !99)
!117 = !DILocation(line: 287, column: 5, scope: !99)
!118 = !DILocation(line: 289, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 23, type: !120, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{!4}
!122 = !DILocation(line: 25, column: 5, scope: !119)
!123 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !15, line: 83, type: !4)
!125 = !DILocation(line: 83, column: 9, scope: !123)
!126 = !DILocation(line: 85, column: 10, scope: !123)
!127 = !DILocation(line: 86, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !15, line: 86, column: 8)
!129 = !DILocation(line: 86, column: 8, scope: !123)
!130 = !DILocation(line: 89, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !15, line: 87, column: 5)
!132 = !DILocation(line: 89, column: 14, scope: !131)
!133 = !DILocation(line: 90, column: 5, scope: !131)
!134 = !DILocation(line: 91, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !123, file: !15, line: 91, column: 8)
!136 = !DILocation(line: 91, column: 8, scope: !123)
!137 = !DILocation(line: 94, column: 9, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !15, line: 92, column: 5)
!139 = !DILocation(line: 95, column: 5, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !15, line: 99, type: !4)
!141 = distinct !DILexicalBlock(scope: !142, file: !15, line: 98, column: 9)
!142 = distinct !DILexicalBlock(scope: !135, file: !15, line: 97, column: 5)
!143 = !DILocation(line: 99, column: 17, scope: !141)
!144 = !DILocalVariable(name: "buffer", scope: !141, file: !15, line: 100, type: !6)
!145 = !DILocation(line: 100, column: 19, scope: !141)
!146 = !DILocation(line: 100, column: 35, scope: !141)
!147 = !DILocation(line: 100, column: 28, scope: !141)
!148 = !DILocation(line: 101, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !141, file: !15, line: 101, column: 17)
!150 = !DILocation(line: 101, column: 24, scope: !149)
!151 = !DILocation(line: 101, column: 17, scope: !141)
!152 = !DILocation(line: 101, column: 34, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 101, column: 33)
!154 = !DILocation(line: 103, column: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !141, file: !15, line: 103, column: 13)
!156 = !DILocation(line: 103, column: 18, scope: !155)
!157 = !DILocation(line: 103, column: 25, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !15, line: 103, column: 13)
!159 = !DILocation(line: 103, column: 27, scope: !158)
!160 = !DILocation(line: 103, column: 13, scope: !155)
!161 = !DILocation(line: 105, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !15, line: 104, column: 13)
!163 = !DILocation(line: 105, column: 24, scope: !162)
!164 = !DILocation(line: 105, column: 27, scope: !162)
!165 = !DILocation(line: 106, column: 13, scope: !162)
!166 = !DILocation(line: 103, column: 34, scope: !158)
!167 = !DILocation(line: 103, column: 13, scope: !158)
!168 = distinct !{!168, !160, !169, !61}
!169 = !DILocation(line: 106, column: 13, scope: !155)
!170 = !DILocation(line: 108, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !141, file: !15, line: 108, column: 17)
!172 = !DILocation(line: 108, column: 22, scope: !171)
!173 = !DILocation(line: 108, column: 27, scope: !171)
!174 = !DILocation(line: 108, column: 30, scope: !171)
!175 = !DILocation(line: 108, column: 35, scope: !171)
!176 = !DILocation(line: 108, column: 17, scope: !141)
!177 = !DILocation(line: 110, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !15, line: 109, column: 13)
!179 = !DILocation(line: 110, column: 24, scope: !178)
!180 = !DILocation(line: 110, column: 30, scope: !178)
!181 = !DILocation(line: 112, column: 23, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 112, column: 17)
!183 = !DILocation(line: 112, column: 21, scope: !182)
!184 = !DILocation(line: 112, column: 28, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !15, line: 112, column: 17)
!186 = !DILocation(line: 112, column: 30, scope: !185)
!187 = !DILocation(line: 112, column: 17, scope: !182)
!188 = !DILocation(line: 114, column: 34, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 113, column: 17)
!190 = !DILocation(line: 114, column: 41, scope: !189)
!191 = !DILocation(line: 114, column: 21, scope: !189)
!192 = !DILocation(line: 115, column: 17, scope: !189)
!193 = !DILocation(line: 112, column: 37, scope: !185)
!194 = !DILocation(line: 112, column: 17, scope: !185)
!195 = distinct !{!195, !187, !196, !61}
!196 = !DILocation(line: 115, column: 17, scope: !182)
!197 = !DILocation(line: 116, column: 13, scope: !178)
!198 = !DILocation(line: 119, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !171, file: !15, line: 118, column: 13)
!200 = !DILocation(line: 121, column: 18, scope: !141)
!201 = !DILocation(line: 121, column: 13, scope: !141)
!202 = !DILocation(line: 124, column: 1, scope: !123)
!203 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 28, type: !120, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!204 = !DILocation(line: 30, column: 5, scope: !203)
!205 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 127, type: !16, scopeLine: 128, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!206 = !DILocalVariable(name: "data", scope: !205, file: !15, line: 129, type: !4)
!207 = !DILocation(line: 129, column: 9, scope: !205)
!208 = !DILocation(line: 131, column: 10, scope: !205)
!209 = !DILocation(line: 132, column: 8, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !15, line: 132, column: 8)
!211 = !DILocation(line: 132, column: 8, scope: !205)
!212 = !DILocation(line: 135, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !15, line: 133, column: 5)
!214 = !DILocation(line: 135, column: 14, scope: !213)
!215 = !DILocation(line: 136, column: 5, scope: !213)
!216 = !DILocation(line: 137, column: 8, scope: !217)
!217 = distinct !DILexicalBlock(scope: !205, file: !15, line: 137, column: 8)
!218 = !DILocation(line: 137, column: 8, scope: !205)
!219 = !DILocalVariable(name: "i", scope: !220, file: !15, line: 140, type: !4)
!220 = distinct !DILexicalBlock(scope: !221, file: !15, line: 139, column: 9)
!221 = distinct !DILexicalBlock(scope: !217, file: !15, line: 138, column: 5)
!222 = !DILocation(line: 140, column: 17, scope: !220)
!223 = !DILocalVariable(name: "buffer", scope: !220, file: !15, line: 141, type: !6)
!224 = !DILocation(line: 141, column: 19, scope: !220)
!225 = !DILocation(line: 141, column: 35, scope: !220)
!226 = !DILocation(line: 141, column: 28, scope: !220)
!227 = !DILocation(line: 142, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !220, file: !15, line: 142, column: 17)
!229 = !DILocation(line: 142, column: 24, scope: !228)
!230 = !DILocation(line: 142, column: 17, scope: !220)
!231 = !DILocation(line: 142, column: 34, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !15, line: 142, column: 33)
!233 = !DILocation(line: 144, column: 20, scope: !234)
!234 = distinct !DILexicalBlock(scope: !220, file: !15, line: 144, column: 13)
!235 = !DILocation(line: 144, column: 18, scope: !234)
!236 = !DILocation(line: 144, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !15, line: 144, column: 13)
!238 = !DILocation(line: 144, column: 27, scope: !237)
!239 = !DILocation(line: 144, column: 13, scope: !234)
!240 = !DILocation(line: 146, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !15, line: 145, column: 13)
!242 = !DILocation(line: 146, column: 24, scope: !241)
!243 = !DILocation(line: 146, column: 27, scope: !241)
!244 = !DILocation(line: 147, column: 13, scope: !241)
!245 = !DILocation(line: 144, column: 34, scope: !237)
!246 = !DILocation(line: 144, column: 13, scope: !237)
!247 = distinct !{!247, !239, !248, !61}
!248 = !DILocation(line: 147, column: 13, scope: !234)
!249 = !DILocation(line: 149, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !220, file: !15, line: 149, column: 17)
!251 = !DILocation(line: 149, column: 22, scope: !250)
!252 = !DILocation(line: 149, column: 27, scope: !250)
!253 = !DILocation(line: 149, column: 30, scope: !250)
!254 = !DILocation(line: 149, column: 35, scope: !250)
!255 = !DILocation(line: 149, column: 17, scope: !220)
!256 = !DILocation(line: 151, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !250, file: !15, line: 150, column: 13)
!258 = !DILocation(line: 151, column: 24, scope: !257)
!259 = !DILocation(line: 151, column: 30, scope: !257)
!260 = !DILocation(line: 153, column: 23, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !15, line: 153, column: 17)
!262 = !DILocation(line: 153, column: 21, scope: !261)
!263 = !DILocation(line: 153, column: 28, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !15, line: 153, column: 17)
!265 = !DILocation(line: 153, column: 30, scope: !264)
!266 = !DILocation(line: 153, column: 17, scope: !261)
!267 = !DILocation(line: 155, column: 34, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !15, line: 154, column: 17)
!269 = !DILocation(line: 155, column: 41, scope: !268)
!270 = !DILocation(line: 155, column: 21, scope: !268)
!271 = !DILocation(line: 156, column: 17, scope: !268)
!272 = !DILocation(line: 153, column: 37, scope: !264)
!273 = !DILocation(line: 153, column: 17, scope: !264)
!274 = distinct !{!274, !266, !275, !61}
!275 = !DILocation(line: 156, column: 17, scope: !261)
!276 = !DILocation(line: 157, column: 13, scope: !257)
!277 = !DILocation(line: 160, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !250, file: !15, line: 159, column: 13)
!279 = !DILocation(line: 162, column: 18, scope: !220)
!280 = !DILocation(line: 162, column: 13, scope: !220)
!281 = !DILocation(line: 164, column: 5, scope: !221)
!282 = !DILocation(line: 165, column: 1, scope: !205)
!283 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 168, type: !16, scopeLine: 169, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!284 = !DILocalVariable(name: "data", scope: !283, file: !15, line: 170, type: !4)
!285 = !DILocation(line: 170, column: 9, scope: !283)
!286 = !DILocation(line: 172, column: 10, scope: !283)
!287 = !DILocation(line: 173, column: 8, scope: !288)
!288 = distinct !DILexicalBlock(scope: !283, file: !15, line: 173, column: 8)
!289 = !DILocation(line: 173, column: 8, scope: !283)
!290 = !DILocation(line: 176, column: 9, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !15, line: 174, column: 5)
!292 = !DILocation(line: 177, column: 5, scope: !291)
!293 = !DILocation(line: 182, column: 14, scope: !294)
!294 = distinct !DILexicalBlock(scope: !288, file: !15, line: 179, column: 5)
!295 = !DILocation(line: 184, column: 8, scope: !296)
!296 = distinct !DILexicalBlock(scope: !283, file: !15, line: 184, column: 8)
!297 = !DILocation(line: 184, column: 8, scope: !283)
!298 = !DILocalVariable(name: "i", scope: !299, file: !15, line: 187, type: !4)
!299 = distinct !DILexicalBlock(scope: !300, file: !15, line: 186, column: 9)
!300 = distinct !DILexicalBlock(scope: !296, file: !15, line: 185, column: 5)
!301 = !DILocation(line: 187, column: 17, scope: !299)
!302 = !DILocalVariable(name: "buffer", scope: !299, file: !15, line: 188, type: !6)
!303 = !DILocation(line: 188, column: 19, scope: !299)
!304 = !DILocation(line: 188, column: 35, scope: !299)
!305 = !DILocation(line: 188, column: 28, scope: !299)
!306 = !DILocation(line: 189, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !299, file: !15, line: 189, column: 17)
!308 = !DILocation(line: 189, column: 24, scope: !307)
!309 = !DILocation(line: 189, column: 17, scope: !299)
!310 = !DILocation(line: 189, column: 34, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !15, line: 189, column: 33)
!312 = !DILocation(line: 191, column: 20, scope: !313)
!313 = distinct !DILexicalBlock(scope: !299, file: !15, line: 191, column: 13)
!314 = !DILocation(line: 191, column: 18, scope: !313)
!315 = !DILocation(line: 191, column: 25, scope: !316)
!316 = distinct !DILexicalBlock(scope: !313, file: !15, line: 191, column: 13)
!317 = !DILocation(line: 191, column: 27, scope: !316)
!318 = !DILocation(line: 191, column: 13, scope: !313)
!319 = !DILocation(line: 193, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !15, line: 192, column: 13)
!321 = !DILocation(line: 193, column: 24, scope: !320)
!322 = !DILocation(line: 193, column: 27, scope: !320)
!323 = !DILocation(line: 194, column: 13, scope: !320)
!324 = !DILocation(line: 191, column: 34, scope: !316)
!325 = !DILocation(line: 191, column: 13, scope: !316)
!326 = distinct !{!326, !318, !327, !61}
!327 = !DILocation(line: 194, column: 13, scope: !313)
!328 = !DILocation(line: 197, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !299, file: !15, line: 197, column: 17)
!330 = !DILocation(line: 197, column: 22, scope: !329)
!331 = !DILocation(line: 197, column: 17, scope: !299)
!332 = !DILocation(line: 199, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !15, line: 198, column: 13)
!334 = !DILocation(line: 199, column: 24, scope: !333)
!335 = !DILocation(line: 199, column: 30, scope: !333)
!336 = !DILocation(line: 201, column: 23, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !15, line: 201, column: 17)
!338 = !DILocation(line: 201, column: 21, scope: !337)
!339 = !DILocation(line: 201, column: 28, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !15, line: 201, column: 17)
!341 = !DILocation(line: 201, column: 30, scope: !340)
!342 = !DILocation(line: 201, column: 17, scope: !337)
!343 = !DILocation(line: 203, column: 34, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !15, line: 202, column: 17)
!345 = !DILocation(line: 203, column: 41, scope: !344)
!346 = !DILocation(line: 203, column: 21, scope: !344)
!347 = !DILocation(line: 204, column: 17, scope: !344)
!348 = !DILocation(line: 201, column: 37, scope: !340)
!349 = !DILocation(line: 201, column: 17, scope: !340)
!350 = distinct !{!350, !342, !351, !61}
!351 = !DILocation(line: 204, column: 17, scope: !337)
!352 = !DILocation(line: 205, column: 13, scope: !333)
!353 = !DILocation(line: 208, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !329, file: !15, line: 207, column: 13)
!355 = !DILocation(line: 210, column: 18, scope: !299)
!356 = !DILocation(line: 210, column: 13, scope: !299)
!357 = !DILocation(line: 212, column: 5, scope: !300)
!358 = !DILocation(line: 213, column: 1, scope: !283)
!359 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 216, type: !16, scopeLine: 217, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!360 = !DILocalVariable(name: "data", scope: !359, file: !15, line: 218, type: !4)
!361 = !DILocation(line: 218, column: 9, scope: !359)
!362 = !DILocation(line: 220, column: 10, scope: !359)
!363 = !DILocation(line: 221, column: 8, scope: !364)
!364 = distinct !DILexicalBlock(scope: !359, file: !15, line: 221, column: 8)
!365 = !DILocation(line: 221, column: 8, scope: !359)
!366 = !DILocation(line: 225, column: 14, scope: !367)
!367 = distinct !DILexicalBlock(scope: !364, file: !15, line: 222, column: 5)
!368 = !DILocation(line: 226, column: 5, scope: !367)
!369 = !DILocation(line: 227, column: 8, scope: !370)
!370 = distinct !DILexicalBlock(scope: !359, file: !15, line: 227, column: 8)
!371 = !DILocation(line: 227, column: 8, scope: !359)
!372 = !DILocalVariable(name: "i", scope: !373, file: !15, line: 230, type: !4)
!373 = distinct !DILexicalBlock(scope: !374, file: !15, line: 229, column: 9)
!374 = distinct !DILexicalBlock(scope: !370, file: !15, line: 228, column: 5)
!375 = !DILocation(line: 230, column: 17, scope: !373)
!376 = !DILocalVariable(name: "buffer", scope: !373, file: !15, line: 231, type: !6)
!377 = !DILocation(line: 231, column: 19, scope: !373)
!378 = !DILocation(line: 231, column: 35, scope: !373)
!379 = !DILocation(line: 231, column: 28, scope: !373)
!380 = !DILocation(line: 232, column: 17, scope: !381)
!381 = distinct !DILexicalBlock(scope: !373, file: !15, line: 232, column: 17)
!382 = !DILocation(line: 232, column: 24, scope: !381)
!383 = !DILocation(line: 232, column: 17, scope: !373)
!384 = !DILocation(line: 232, column: 34, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !15, line: 232, column: 33)
!386 = !DILocation(line: 234, column: 20, scope: !387)
!387 = distinct !DILexicalBlock(scope: !373, file: !15, line: 234, column: 13)
!388 = !DILocation(line: 234, column: 18, scope: !387)
!389 = !DILocation(line: 234, column: 25, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !15, line: 234, column: 13)
!391 = !DILocation(line: 234, column: 27, scope: !390)
!392 = !DILocation(line: 234, column: 13, scope: !387)
!393 = !DILocation(line: 236, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !15, line: 235, column: 13)
!395 = !DILocation(line: 236, column: 24, scope: !394)
!396 = !DILocation(line: 236, column: 27, scope: !394)
!397 = !DILocation(line: 237, column: 13, scope: !394)
!398 = !DILocation(line: 234, column: 34, scope: !390)
!399 = !DILocation(line: 234, column: 13, scope: !390)
!400 = distinct !{!400, !392, !401, !61}
!401 = !DILocation(line: 237, column: 13, scope: !387)
!402 = !DILocation(line: 240, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !373, file: !15, line: 240, column: 17)
!404 = !DILocation(line: 240, column: 22, scope: !403)
!405 = !DILocation(line: 240, column: 17, scope: !373)
!406 = !DILocation(line: 242, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !15, line: 241, column: 13)
!408 = !DILocation(line: 242, column: 24, scope: !407)
!409 = !DILocation(line: 242, column: 30, scope: !407)
!410 = !DILocation(line: 244, column: 23, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !15, line: 244, column: 17)
!412 = !DILocation(line: 244, column: 21, scope: !411)
!413 = !DILocation(line: 244, column: 28, scope: !414)
!414 = distinct !DILexicalBlock(scope: !411, file: !15, line: 244, column: 17)
!415 = !DILocation(line: 244, column: 30, scope: !414)
!416 = !DILocation(line: 244, column: 17, scope: !411)
!417 = !DILocation(line: 246, column: 34, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !15, line: 245, column: 17)
!419 = !DILocation(line: 246, column: 41, scope: !418)
!420 = !DILocation(line: 246, column: 21, scope: !418)
!421 = !DILocation(line: 247, column: 17, scope: !418)
!422 = !DILocation(line: 244, column: 37, scope: !414)
!423 = !DILocation(line: 244, column: 17, scope: !414)
!424 = distinct !{!424, !416, !425, !61}
!425 = !DILocation(line: 247, column: 17, scope: !411)
!426 = !DILocation(line: 248, column: 13, scope: !407)
!427 = !DILocation(line: 251, column: 17, scope: !428)
!428 = distinct !DILexicalBlock(scope: !403, file: !15, line: 250, column: 13)
!429 = !DILocation(line: 253, column: 18, scope: !373)
!430 = !DILocation(line: 253, column: 13, scope: !373)
!431 = !DILocation(line: 255, column: 5, scope: !374)
!432 = !DILocation(line: 256, column: 1, scope: !359)
