; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i17 = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %j, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand() #5, !dbg !32
  %and = and i32 %call, 1, !dbg !32
  %tobool = icmp ne i32 %and, 0, !dbg !32
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !32

cond.true:                                        ; preds = %for.body
  %call1 = call i32 @rand() #5, !dbg !32
  %shl = shl i32 %call1, 30, !dbg !32
  %call2 = call i32 @rand() #5, !dbg !32
  %shl3 = shl i32 %call2, 15, !dbg !32
  %xor = xor i32 %shl, %shl3, !dbg !32
  %call4 = call i32 @rand() #5, !dbg !32
  %xor5 = xor i32 %xor, %call4, !dbg !32
  br label %cond.end, !dbg !32

cond.false:                                       ; preds = %for.body
  %call6 = call i32 @rand() #5, !dbg !32
  %shl7 = shl i32 %call6, 30, !dbg !32
  %call8 = call i32 @rand() #5, !dbg !32
  %shl9 = shl i32 %call8, 15, !dbg !32
  %xor10 = xor i32 %shl7, %shl9, !dbg !32
  %call11 = call i32 @rand() #5, !dbg !32
  %xor12 = xor i32 %xor10, %call11, !dbg !32
  %sub = sub i32 0, %xor12, !dbg !32
  %sub13 = sub i32 %sub, 1, !dbg !32
  br label %cond.end, !dbg !32

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !32
  store i32 %cond, i32* %data, align 4, !dbg !34
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %cond.end
  %1 = load i32, i32* %i, align 4, !dbg !36
  %inc = add nsw i32 %1, 1, !dbg !36
  store i32 %inc, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !37, !llvm.loop !38

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !41
  br label %for.cond14, !dbg !43

for.cond14:                                       ; preds = %for.inc39, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !44
  %cmp15 = icmp slt i32 %2, 1, !dbg !46
  br i1 %cmp15, label %for.body16, label %for.end41, !dbg !47

for.body16:                                       ; preds = %for.cond14
  call void @llvm.dbg.declare(metadata i32* %i17, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !52, metadata !DIExpression()), !dbg !53
  %call18 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !54
  %3 = bitcast i8* %call18 to i32*, !dbg !55
  store i32* %3, i32** %buffer, align 8, !dbg !53
  %4 = load i32*, i32** %buffer, align 8, !dbg !56
  %cmp19 = icmp eq i32* %4, null, !dbg !58
  br i1 %cmp19, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %for.body16
  call void @exit(i32 -1) #6, !dbg !60
  unreachable, !dbg !60

if.end:                                           ; preds = %for.body16
  store i32 0, i32* %i17, align 4, !dbg !62
  br label %for.cond20, !dbg !64

for.cond20:                                       ; preds = %for.inc23, %if.end
  %5 = load i32, i32* %i17, align 4, !dbg !65
  %cmp21 = icmp slt i32 %5, 10, !dbg !67
  br i1 %cmp21, label %for.body22, label %for.end25, !dbg !68

for.body22:                                       ; preds = %for.cond20
  %6 = load i32*, i32** %buffer, align 8, !dbg !69
  %7 = load i32, i32* %i17, align 4, !dbg !71
  %idxprom = sext i32 %7 to i64, !dbg !69
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !69
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  br label %for.inc23, !dbg !73

for.inc23:                                        ; preds = %for.body22
  %8 = load i32, i32* %i17, align 4, !dbg !74
  %inc24 = add nsw i32 %8, 1, !dbg !74
  store i32 %inc24, i32* %i17, align 4, !dbg !74
  br label %for.cond20, !dbg !75, !llvm.loop !76

for.end25:                                        ; preds = %for.cond20
  %9 = load i32, i32* %data, align 4, !dbg !78
  %cmp26 = icmp sge i32 %9, 0, !dbg !80
  br i1 %cmp26, label %if.then27, label %if.else, !dbg !81

if.then27:                                        ; preds = %for.end25
  %10 = load i32*, i32** %buffer, align 8, !dbg !82
  %11 = load i32, i32* %data, align 4, !dbg !84
  %idxprom28 = sext i32 %11 to i64, !dbg !82
  %arrayidx29 = getelementptr inbounds i32, i32* %10, i64 %idxprom28, !dbg !82
  store i32 1, i32* %arrayidx29, align 4, !dbg !85
  store i32 0, i32* %i17, align 4, !dbg !86
  br label %for.cond30, !dbg !88

for.cond30:                                       ; preds = %for.inc35, %if.then27
  %12 = load i32, i32* %i17, align 4, !dbg !89
  %cmp31 = icmp slt i32 %12, 10, !dbg !91
  br i1 %cmp31, label %for.body32, label %for.end37, !dbg !92

for.body32:                                       ; preds = %for.cond30
  %13 = load i32*, i32** %buffer, align 8, !dbg !93
  %14 = load i32, i32* %i17, align 4, !dbg !95
  %idxprom33 = sext i32 %14 to i64, !dbg !93
  %arrayidx34 = getelementptr inbounds i32, i32* %13, i64 %idxprom33, !dbg !93
  %15 = load i32, i32* %arrayidx34, align 4, !dbg !93
  call void @printIntLine(i32 %15), !dbg !96
  br label %for.inc35, !dbg !97

for.inc35:                                        ; preds = %for.body32
  %16 = load i32, i32* %i17, align 4, !dbg !98
  %inc36 = add nsw i32 %16, 1, !dbg !98
  store i32 %inc36, i32* %i17, align 4, !dbg !98
  br label %for.cond30, !dbg !99, !llvm.loop !100

for.end37:                                        ; preds = %for.cond30
  br label %if.end38, !dbg !102

if.else:                                          ; preds = %for.end25
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !103
  br label %if.end38

if.end38:                                         ; preds = %if.else, %for.end37
  %17 = load i32*, i32** %buffer, align 8, !dbg !105
  %18 = bitcast i32* %17 to i8*, !dbg !105
  call void @free(i8* %18) #5, !dbg !106
  br label %for.inc39, !dbg !107

for.inc39:                                        ; preds = %if.end38
  %19 = load i32, i32* %j, align 4, !dbg !108
  %inc40 = add nsw i32 %19, 1, !dbg !108
  store i32 %inc40, i32* %j, align 4, !dbg !108
  br label %for.cond14, !dbg !109, !llvm.loop !110

for.end41:                                        ; preds = %for.cond14
  ret void, !dbg !112
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17_good() #0 !dbg !113 {
entry:
  call void @goodB2G(), !dbg !114
  call void @goodG2B(), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !117 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !123, metadata !DIExpression()), !dbg !124
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !125, metadata !DIExpression()), !dbg !126
  %call = call i64 @time(i64* null) #5, !dbg !127
  %conv = trunc i64 %call to i32, !dbg !128
  call void @srand(i32 %conv) #5, !dbg !129
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !130
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17_good(), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !132
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !133
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17_bad(), !dbg !134
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !135
  ret i32 0, !dbg !136
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !137 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %i17 = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32* %k, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32* %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i32 -1, i32* %data, align 4, !dbg !144
  store i32 0, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !148
  %cmp = icmp slt i32 %0, 1, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand() #5, !dbg !152
  %and = and i32 %call, 1, !dbg !152
  %tobool = icmp ne i32 %and, 0, !dbg !152
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !152

cond.true:                                        ; preds = %for.body
  %call1 = call i32 @rand() #5, !dbg !152
  %shl = shl i32 %call1, 30, !dbg !152
  %call2 = call i32 @rand() #5, !dbg !152
  %shl3 = shl i32 %call2, 15, !dbg !152
  %xor = xor i32 %shl, %shl3, !dbg !152
  %call4 = call i32 @rand() #5, !dbg !152
  %xor5 = xor i32 %xor, %call4, !dbg !152
  br label %cond.end, !dbg !152

cond.false:                                       ; preds = %for.body
  %call6 = call i32 @rand() #5, !dbg !152
  %shl7 = shl i32 %call6, 30, !dbg !152
  %call8 = call i32 @rand() #5, !dbg !152
  %shl9 = shl i32 %call8, 15, !dbg !152
  %xor10 = xor i32 %shl7, %shl9, !dbg !152
  %call11 = call i32 @rand() #5, !dbg !152
  %xor12 = xor i32 %xor10, %call11, !dbg !152
  %sub = sub i32 0, %xor12, !dbg !152
  %sub13 = sub i32 %sub, 1, !dbg !152
  br label %cond.end, !dbg !152

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !152
  store i32 %cond, i32* %data, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %cond.end
  %1 = load i32, i32* %i, align 4, !dbg !156
  %inc = add nsw i32 %1, 1, !dbg !156
  store i32 %inc, i32* %i, align 4, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !160
  br label %for.cond14, !dbg !162

for.cond14:                                       ; preds = %for.inc40, %for.end
  %2 = load i32, i32* %k, align 4, !dbg !163
  %cmp15 = icmp slt i32 %2, 1, !dbg !165
  br i1 %cmp15, label %for.body16, label %for.end42, !dbg !166

for.body16:                                       ; preds = %for.cond14
  call void @llvm.dbg.declare(metadata i32* %i17, metadata !167, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !171, metadata !DIExpression()), !dbg !172
  %call18 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !173
  %3 = bitcast i8* %call18 to i32*, !dbg !174
  store i32* %3, i32** %buffer, align 8, !dbg !172
  %4 = load i32*, i32** %buffer, align 8, !dbg !175
  %cmp19 = icmp eq i32* %4, null, !dbg !177
  br i1 %cmp19, label %if.then, label %if.end, !dbg !178

if.then:                                          ; preds = %for.body16
  call void @exit(i32 -1) #6, !dbg !179
  unreachable, !dbg !179

if.end:                                           ; preds = %for.body16
  store i32 0, i32* %i17, align 4, !dbg !181
  br label %for.cond20, !dbg !183

for.cond20:                                       ; preds = %for.inc23, %if.end
  %5 = load i32, i32* %i17, align 4, !dbg !184
  %cmp21 = icmp slt i32 %5, 10, !dbg !186
  br i1 %cmp21, label %for.body22, label %for.end25, !dbg !187

for.body22:                                       ; preds = %for.cond20
  %6 = load i32*, i32** %buffer, align 8, !dbg !188
  %7 = load i32, i32* %i17, align 4, !dbg !190
  %idxprom = sext i32 %7 to i64, !dbg !188
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !188
  store i32 0, i32* %arrayidx, align 4, !dbg !191
  br label %for.inc23, !dbg !192

for.inc23:                                        ; preds = %for.body22
  %8 = load i32, i32* %i17, align 4, !dbg !193
  %inc24 = add nsw i32 %8, 1, !dbg !193
  store i32 %inc24, i32* %i17, align 4, !dbg !193
  br label %for.cond20, !dbg !194, !llvm.loop !195

for.end25:                                        ; preds = %for.cond20
  %9 = load i32, i32* %data, align 4, !dbg !197
  %cmp26 = icmp sge i32 %9, 0, !dbg !199
  br i1 %cmp26, label %land.lhs.true, label %if.else, !dbg !200

land.lhs.true:                                    ; preds = %for.end25
  %10 = load i32, i32* %data, align 4, !dbg !201
  %cmp27 = icmp slt i32 %10, 10, !dbg !202
  br i1 %cmp27, label %if.then28, label %if.else, !dbg !203

if.then28:                                        ; preds = %land.lhs.true
  %11 = load i32*, i32** %buffer, align 8, !dbg !204
  %12 = load i32, i32* %data, align 4, !dbg !206
  %idxprom29 = sext i32 %12 to i64, !dbg !204
  %arrayidx30 = getelementptr inbounds i32, i32* %11, i64 %idxprom29, !dbg !204
  store i32 1, i32* %arrayidx30, align 4, !dbg !207
  store i32 0, i32* %i17, align 4, !dbg !208
  br label %for.cond31, !dbg !210

for.cond31:                                       ; preds = %for.inc36, %if.then28
  %13 = load i32, i32* %i17, align 4, !dbg !211
  %cmp32 = icmp slt i32 %13, 10, !dbg !213
  br i1 %cmp32, label %for.body33, label %for.end38, !dbg !214

for.body33:                                       ; preds = %for.cond31
  %14 = load i32*, i32** %buffer, align 8, !dbg !215
  %15 = load i32, i32* %i17, align 4, !dbg !217
  %idxprom34 = sext i32 %15 to i64, !dbg !215
  %arrayidx35 = getelementptr inbounds i32, i32* %14, i64 %idxprom34, !dbg !215
  %16 = load i32, i32* %arrayidx35, align 4, !dbg !215
  call void @printIntLine(i32 %16), !dbg !218
  br label %for.inc36, !dbg !219

for.inc36:                                        ; preds = %for.body33
  %17 = load i32, i32* %i17, align 4, !dbg !220
  %inc37 = add nsw i32 %17, 1, !dbg !220
  store i32 %inc37, i32* %i17, align 4, !dbg !220
  br label %for.cond31, !dbg !221, !llvm.loop !222

for.end38:                                        ; preds = %for.cond31
  br label %if.end39, !dbg !224

if.else:                                          ; preds = %land.lhs.true, %for.end25
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !225
  br label %if.end39

if.end39:                                         ; preds = %if.else, %for.end38
  %18 = load i32*, i32** %buffer, align 8, !dbg !227
  %19 = bitcast i32* %18 to i8*, !dbg !227
  call void @free(i8* %19) #5, !dbg !228
  br label %for.inc40, !dbg !229

for.inc40:                                        ; preds = %if.end39
  %20 = load i32, i32* %k, align 4, !dbg !230
  %inc41 = add nsw i32 %20, 1, !dbg !230
  store i32 %inc41, i32* %k, align 4, !dbg !230
  br label %for.cond14, !dbg !231, !llvm.loop !232

for.end42:                                        ; preds = %for.cond14
  ret void, !dbg !234
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !235 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !236, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.declare(metadata i32* %j, metadata !238, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata i32* %data, metadata !240, metadata !DIExpression()), !dbg !241
  store i32 -1, i32* %data, align 4, !dbg !242
  store i32 0, i32* %h, align 4, !dbg !243
  br label %for.cond, !dbg !245

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !246
  %cmp = icmp slt i32 %0, 1, !dbg !248
  br i1 %cmp, label %for.body, label %for.end, !dbg !249

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !250
  br label %for.inc, !dbg !252

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !253
  %inc = add nsw i32 %1, 1, !dbg !253
  store i32 %inc, i32* %h, align 4, !dbg !253
  br label %for.cond, !dbg !254, !llvm.loop !255

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !257
  br label %for.cond1, !dbg !259

for.cond1:                                        ; preds = %for.inc24, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !260
  %cmp2 = icmp slt i32 %2, 1, !dbg !262
  br i1 %cmp2, label %for.body3, label %for.end26, !dbg !263

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !268, metadata !DIExpression()), !dbg !269
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !270
  %3 = bitcast i8* %call to i32*, !dbg !271
  store i32* %3, i32** %buffer, align 8, !dbg !269
  %4 = load i32*, i32** %buffer, align 8, !dbg !272
  %cmp4 = icmp eq i32* %4, null, !dbg !274
  br i1 %cmp4, label %if.then, label %if.end, !dbg !275

if.then:                                          ; preds = %for.body3
  call void @exit(i32 -1) #6, !dbg !276
  unreachable, !dbg !276

if.end:                                           ; preds = %for.body3
  store i32 0, i32* %i, align 4, !dbg !278
  br label %for.cond5, !dbg !280

for.cond5:                                        ; preds = %for.inc8, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !281
  %cmp6 = icmp slt i32 %5, 10, !dbg !283
  br i1 %cmp6, label %for.body7, label %for.end10, !dbg !284

for.body7:                                        ; preds = %for.cond5
  %6 = load i32*, i32** %buffer, align 8, !dbg !285
  %7 = load i32, i32* %i, align 4, !dbg !287
  %idxprom = sext i32 %7 to i64, !dbg !285
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !285
  store i32 0, i32* %arrayidx, align 4, !dbg !288
  br label %for.inc8, !dbg !289

for.inc8:                                         ; preds = %for.body7
  %8 = load i32, i32* %i, align 4, !dbg !290
  %inc9 = add nsw i32 %8, 1, !dbg !290
  store i32 %inc9, i32* %i, align 4, !dbg !290
  br label %for.cond5, !dbg !291, !llvm.loop !292

for.end10:                                        ; preds = %for.cond5
  %9 = load i32, i32* %data, align 4, !dbg !294
  %cmp11 = icmp sge i32 %9, 0, !dbg !296
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !297

if.then12:                                        ; preds = %for.end10
  %10 = load i32*, i32** %buffer, align 8, !dbg !298
  %11 = load i32, i32* %data, align 4, !dbg !300
  %idxprom13 = sext i32 %11 to i64, !dbg !298
  %arrayidx14 = getelementptr inbounds i32, i32* %10, i64 %idxprom13, !dbg !298
  store i32 1, i32* %arrayidx14, align 4, !dbg !301
  store i32 0, i32* %i, align 4, !dbg !302
  br label %for.cond15, !dbg !304

for.cond15:                                       ; preds = %for.inc20, %if.then12
  %12 = load i32, i32* %i, align 4, !dbg !305
  %cmp16 = icmp slt i32 %12, 10, !dbg !307
  br i1 %cmp16, label %for.body17, label %for.end22, !dbg !308

for.body17:                                       ; preds = %for.cond15
  %13 = load i32*, i32** %buffer, align 8, !dbg !309
  %14 = load i32, i32* %i, align 4, !dbg !311
  %idxprom18 = sext i32 %14 to i64, !dbg !309
  %arrayidx19 = getelementptr inbounds i32, i32* %13, i64 %idxprom18, !dbg !309
  %15 = load i32, i32* %arrayidx19, align 4, !dbg !309
  call void @printIntLine(i32 %15), !dbg !312
  br label %for.inc20, !dbg !313

for.inc20:                                        ; preds = %for.body17
  %16 = load i32, i32* %i, align 4, !dbg !314
  %inc21 = add nsw i32 %16, 1, !dbg !314
  store i32 %inc21, i32* %i, align 4, !dbg !314
  br label %for.cond15, !dbg !315, !llvm.loop !316

for.end22:                                        ; preds = %for.cond15
  br label %if.end23, !dbg !318

if.else:                                          ; preds = %for.end10
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !319
  br label %if.end23

if.end23:                                         ; preds = %if.else, %for.end22
  %17 = load i32*, i32** %buffer, align 8, !dbg !321
  %18 = bitcast i32* %17 to i8*, !dbg !321
  call void @free(i8* %18) #5, !dbg !322
  br label %for.inc24, !dbg !323

for.inc24:                                        ; preds = %if.end23
  %19 = load i32, i32* %j, align 4, !dbg !324
  %inc25 = add nsw i32 %19, 1, !dbg !324
  store i32 %inc25, i32* %j, align 4, !dbg !324
  br label %for.cond1, !dbg !325, !llvm.loop !326

for.end26:                                        ; preds = %for.cond1
  ret void, !dbg !328
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 24, type: !4)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocalVariable(name: "j", scope: !14, file: !15, line: 24, type: !4)
!21 = !DILocation(line: 24, column: 11, scope: !14)
!22 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!23 = !DILocation(line: 25, column: 9, scope: !14)
!24 = !DILocation(line: 27, column: 10, scope: !14)
!25 = !DILocation(line: 28, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 28, column: 9, scope: !26)
!28 = !DILocation(line: 28, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 28, column: 5)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 5, scope: !26)
!32 = !DILocation(line: 31, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 14, scope: !33)
!35 = !DILocation(line: 32, column: 5, scope: !33)
!36 = !DILocation(line: 28, column: 24, scope: !29)
!37 = !DILocation(line: 28, column: 5, scope: !29)
!38 = distinct !{!38, !31, !39, !40}
!39 = !DILocation(line: 32, column: 5, scope: !26)
!40 = !{!"llvm.loop.mustprogress"}
!41 = !DILocation(line: 33, column: 11, scope: !42)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!43 = !DILocation(line: 33, column: 9, scope: !42)
!44 = !DILocation(line: 33, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !15, line: 33, column: 5)
!46 = !DILocation(line: 33, column: 18, scope: !45)
!47 = !DILocation(line: 33, column: 5, scope: !42)
!48 = !DILocalVariable(name: "i", scope: !49, file: !15, line: 36, type: !4)
!49 = distinct !DILexicalBlock(scope: !50, file: !15, line: 35, column: 9)
!50 = distinct !DILexicalBlock(scope: !45, file: !15, line: 34, column: 5)
!51 = !DILocation(line: 36, column: 17, scope: !49)
!52 = !DILocalVariable(name: "buffer", scope: !49, file: !15, line: 37, type: !6)
!53 = !DILocation(line: 37, column: 19, scope: !49)
!54 = !DILocation(line: 37, column: 35, scope: !49)
!55 = !DILocation(line: 37, column: 28, scope: !49)
!56 = !DILocation(line: 38, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !49, file: !15, line: 38, column: 17)
!58 = !DILocation(line: 38, column: 24, scope: !57)
!59 = !DILocation(line: 38, column: 17, scope: !49)
!60 = !DILocation(line: 38, column: 34, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 38, column: 33)
!62 = !DILocation(line: 40, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !49, file: !15, line: 40, column: 13)
!64 = !DILocation(line: 40, column: 18, scope: !63)
!65 = !DILocation(line: 40, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 40, column: 13)
!67 = !DILocation(line: 40, column: 27, scope: !66)
!68 = !DILocation(line: 40, column: 13, scope: !63)
!69 = !DILocation(line: 42, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 41, column: 13)
!71 = !DILocation(line: 42, column: 24, scope: !70)
!72 = !DILocation(line: 42, column: 27, scope: !70)
!73 = !DILocation(line: 43, column: 13, scope: !70)
!74 = !DILocation(line: 40, column: 34, scope: !66)
!75 = !DILocation(line: 40, column: 13, scope: !66)
!76 = distinct !{!76, !68, !77, !40}
!77 = !DILocation(line: 43, column: 13, scope: !63)
!78 = !DILocation(line: 46, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !49, file: !15, line: 46, column: 17)
!80 = !DILocation(line: 46, column: 22, scope: !79)
!81 = !DILocation(line: 46, column: 17, scope: !49)
!82 = !DILocation(line: 48, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 47, column: 13)
!84 = !DILocation(line: 48, column: 24, scope: !83)
!85 = !DILocation(line: 48, column: 30, scope: !83)
!86 = !DILocation(line: 50, column: 23, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 50, column: 17)
!88 = !DILocation(line: 50, column: 21, scope: !87)
!89 = !DILocation(line: 50, column: 28, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 50, column: 17)
!91 = !DILocation(line: 50, column: 30, scope: !90)
!92 = !DILocation(line: 50, column: 17, scope: !87)
!93 = !DILocation(line: 52, column: 34, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 51, column: 17)
!95 = !DILocation(line: 52, column: 41, scope: !94)
!96 = !DILocation(line: 52, column: 21, scope: !94)
!97 = !DILocation(line: 53, column: 17, scope: !94)
!98 = !DILocation(line: 50, column: 37, scope: !90)
!99 = !DILocation(line: 50, column: 17, scope: !90)
!100 = distinct !{!100, !92, !101, !40}
!101 = !DILocation(line: 53, column: 17, scope: !87)
!102 = !DILocation(line: 54, column: 13, scope: !83)
!103 = !DILocation(line: 57, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !79, file: !15, line: 56, column: 13)
!105 = !DILocation(line: 59, column: 18, scope: !49)
!106 = !DILocation(line: 59, column: 13, scope: !49)
!107 = !DILocation(line: 61, column: 5, scope: !50)
!108 = !DILocation(line: 33, column: 24, scope: !45)
!109 = !DILocation(line: 33, column: 5, scope: !45)
!110 = distinct !{!110, !47, !111, !40}
!111 = !DILocation(line: 61, column: 5, scope: !42)
!112 = !DILocation(line: 62, column: 1, scope: !14)
!113 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_17_good", scope: !15, file: !15, line: 154, type: !16, scopeLine: 155, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocation(line: 156, column: 5, scope: !113)
!115 = !DILocation(line: 157, column: 5, scope: !113)
!116 = !DILocation(line: 158, column: 1, scope: !113)
!117 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 169, type: !118, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DISubroutineType(types: !119)
!119 = !{!4, !4, !120}
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!123 = !DILocalVariable(name: "argc", arg: 1, scope: !117, file: !15, line: 169, type: !4)
!124 = !DILocation(line: 169, column: 14, scope: !117)
!125 = !DILocalVariable(name: "argv", arg: 2, scope: !117, file: !15, line: 169, type: !120)
!126 = !DILocation(line: 169, column: 27, scope: !117)
!127 = !DILocation(line: 172, column: 22, scope: !117)
!128 = !DILocation(line: 172, column: 12, scope: !117)
!129 = !DILocation(line: 172, column: 5, scope: !117)
!130 = !DILocation(line: 174, column: 5, scope: !117)
!131 = !DILocation(line: 175, column: 5, scope: !117)
!132 = !DILocation(line: 176, column: 5, scope: !117)
!133 = !DILocation(line: 179, column: 5, scope: !117)
!134 = !DILocation(line: 180, column: 5, scope: !117)
!135 = !DILocation(line: 181, column: 5, scope: !117)
!136 = !DILocation(line: 183, column: 5, scope: !117)
!137 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 69, type: !16, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "i", scope: !137, file: !15, line: 71, type: !4)
!139 = !DILocation(line: 71, column: 9, scope: !137)
!140 = !DILocalVariable(name: "k", scope: !137, file: !15, line: 71, type: !4)
!141 = !DILocation(line: 71, column: 11, scope: !137)
!142 = !DILocalVariable(name: "data", scope: !137, file: !15, line: 72, type: !4)
!143 = !DILocation(line: 72, column: 9, scope: !137)
!144 = !DILocation(line: 74, column: 10, scope: !137)
!145 = !DILocation(line: 75, column: 11, scope: !146)
!146 = distinct !DILexicalBlock(scope: !137, file: !15, line: 75, column: 5)
!147 = !DILocation(line: 75, column: 9, scope: !146)
!148 = !DILocation(line: 75, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !15, line: 75, column: 5)
!150 = !DILocation(line: 75, column: 18, scope: !149)
!151 = !DILocation(line: 75, column: 5, scope: !146)
!152 = !DILocation(line: 78, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 76, column: 5)
!154 = !DILocation(line: 78, column: 14, scope: !153)
!155 = !DILocation(line: 79, column: 5, scope: !153)
!156 = !DILocation(line: 75, column: 24, scope: !149)
!157 = !DILocation(line: 75, column: 5, scope: !149)
!158 = distinct !{!158, !151, !159, !40}
!159 = !DILocation(line: 79, column: 5, scope: !146)
!160 = !DILocation(line: 80, column: 11, scope: !161)
!161 = distinct !DILexicalBlock(scope: !137, file: !15, line: 80, column: 5)
!162 = !DILocation(line: 80, column: 9, scope: !161)
!163 = !DILocation(line: 80, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !15, line: 80, column: 5)
!165 = !DILocation(line: 80, column: 18, scope: !164)
!166 = !DILocation(line: 80, column: 5, scope: !161)
!167 = !DILocalVariable(name: "i", scope: !168, file: !15, line: 83, type: !4)
!168 = distinct !DILexicalBlock(scope: !169, file: !15, line: 82, column: 9)
!169 = distinct !DILexicalBlock(scope: !164, file: !15, line: 81, column: 5)
!170 = !DILocation(line: 83, column: 17, scope: !168)
!171 = !DILocalVariable(name: "buffer", scope: !168, file: !15, line: 84, type: !6)
!172 = !DILocation(line: 84, column: 19, scope: !168)
!173 = !DILocation(line: 84, column: 35, scope: !168)
!174 = !DILocation(line: 84, column: 28, scope: !168)
!175 = !DILocation(line: 85, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !168, file: !15, line: 85, column: 17)
!177 = !DILocation(line: 85, column: 24, scope: !176)
!178 = !DILocation(line: 85, column: 17, scope: !168)
!179 = !DILocation(line: 85, column: 34, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 85, column: 33)
!181 = !DILocation(line: 87, column: 20, scope: !182)
!182 = distinct !DILexicalBlock(scope: !168, file: !15, line: 87, column: 13)
!183 = !DILocation(line: 87, column: 18, scope: !182)
!184 = !DILocation(line: 87, column: 25, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !15, line: 87, column: 13)
!186 = !DILocation(line: 87, column: 27, scope: !185)
!187 = !DILocation(line: 87, column: 13, scope: !182)
!188 = !DILocation(line: 89, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 88, column: 13)
!190 = !DILocation(line: 89, column: 24, scope: !189)
!191 = !DILocation(line: 89, column: 27, scope: !189)
!192 = !DILocation(line: 90, column: 13, scope: !189)
!193 = !DILocation(line: 87, column: 34, scope: !185)
!194 = !DILocation(line: 87, column: 13, scope: !185)
!195 = distinct !{!195, !187, !196, !40}
!196 = !DILocation(line: 90, column: 13, scope: !182)
!197 = !DILocation(line: 92, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !168, file: !15, line: 92, column: 17)
!199 = !DILocation(line: 92, column: 22, scope: !198)
!200 = !DILocation(line: 92, column: 27, scope: !198)
!201 = !DILocation(line: 92, column: 30, scope: !198)
!202 = !DILocation(line: 92, column: 35, scope: !198)
!203 = !DILocation(line: 92, column: 17, scope: !168)
!204 = !DILocation(line: 94, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !198, file: !15, line: 93, column: 13)
!206 = !DILocation(line: 94, column: 24, scope: !205)
!207 = !DILocation(line: 94, column: 30, scope: !205)
!208 = !DILocation(line: 96, column: 23, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !15, line: 96, column: 17)
!210 = !DILocation(line: 96, column: 21, scope: !209)
!211 = !DILocation(line: 96, column: 28, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !15, line: 96, column: 17)
!213 = !DILocation(line: 96, column: 30, scope: !212)
!214 = !DILocation(line: 96, column: 17, scope: !209)
!215 = !DILocation(line: 98, column: 34, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !15, line: 97, column: 17)
!217 = !DILocation(line: 98, column: 41, scope: !216)
!218 = !DILocation(line: 98, column: 21, scope: !216)
!219 = !DILocation(line: 99, column: 17, scope: !216)
!220 = !DILocation(line: 96, column: 37, scope: !212)
!221 = !DILocation(line: 96, column: 17, scope: !212)
!222 = distinct !{!222, !214, !223, !40}
!223 = !DILocation(line: 99, column: 17, scope: !209)
!224 = !DILocation(line: 100, column: 13, scope: !205)
!225 = !DILocation(line: 103, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !198, file: !15, line: 102, column: 13)
!227 = !DILocation(line: 105, column: 18, scope: !168)
!228 = !DILocation(line: 105, column: 13, scope: !168)
!229 = !DILocation(line: 107, column: 5, scope: !169)
!230 = !DILocation(line: 80, column: 24, scope: !164)
!231 = !DILocation(line: 80, column: 5, scope: !164)
!232 = distinct !{!232, !166, !233, !40}
!233 = !DILocation(line: 107, column: 5, scope: !161)
!234 = !DILocation(line: 108, column: 1, scope: !137)
!235 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 111, type: !16, scopeLine: 112, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!236 = !DILocalVariable(name: "h", scope: !235, file: !15, line: 113, type: !4)
!237 = !DILocation(line: 113, column: 9, scope: !235)
!238 = !DILocalVariable(name: "j", scope: !235, file: !15, line: 113, type: !4)
!239 = !DILocation(line: 113, column: 11, scope: !235)
!240 = !DILocalVariable(name: "data", scope: !235, file: !15, line: 114, type: !4)
!241 = !DILocation(line: 114, column: 9, scope: !235)
!242 = !DILocation(line: 116, column: 10, scope: !235)
!243 = !DILocation(line: 117, column: 11, scope: !244)
!244 = distinct !DILexicalBlock(scope: !235, file: !15, line: 117, column: 5)
!245 = !DILocation(line: 117, column: 9, scope: !244)
!246 = !DILocation(line: 117, column: 16, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !15, line: 117, column: 5)
!248 = !DILocation(line: 117, column: 18, scope: !247)
!249 = !DILocation(line: 117, column: 5, scope: !244)
!250 = !DILocation(line: 121, column: 14, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !15, line: 118, column: 5)
!252 = !DILocation(line: 122, column: 5, scope: !251)
!253 = !DILocation(line: 117, column: 24, scope: !247)
!254 = !DILocation(line: 117, column: 5, scope: !247)
!255 = distinct !{!255, !249, !256, !40}
!256 = !DILocation(line: 122, column: 5, scope: !244)
!257 = !DILocation(line: 123, column: 11, scope: !258)
!258 = distinct !DILexicalBlock(scope: !235, file: !15, line: 123, column: 5)
!259 = !DILocation(line: 123, column: 9, scope: !258)
!260 = !DILocation(line: 123, column: 16, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !15, line: 123, column: 5)
!262 = !DILocation(line: 123, column: 18, scope: !261)
!263 = !DILocation(line: 123, column: 5, scope: !258)
!264 = !DILocalVariable(name: "i", scope: !265, file: !15, line: 126, type: !4)
!265 = distinct !DILexicalBlock(scope: !266, file: !15, line: 125, column: 9)
!266 = distinct !DILexicalBlock(scope: !261, file: !15, line: 124, column: 5)
!267 = !DILocation(line: 126, column: 17, scope: !265)
!268 = !DILocalVariable(name: "buffer", scope: !265, file: !15, line: 127, type: !6)
!269 = !DILocation(line: 127, column: 19, scope: !265)
!270 = !DILocation(line: 127, column: 35, scope: !265)
!271 = !DILocation(line: 127, column: 28, scope: !265)
!272 = !DILocation(line: 128, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !265, file: !15, line: 128, column: 17)
!274 = !DILocation(line: 128, column: 24, scope: !273)
!275 = !DILocation(line: 128, column: 17, scope: !265)
!276 = !DILocation(line: 128, column: 34, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !15, line: 128, column: 33)
!278 = !DILocation(line: 130, column: 20, scope: !279)
!279 = distinct !DILexicalBlock(scope: !265, file: !15, line: 130, column: 13)
!280 = !DILocation(line: 130, column: 18, scope: !279)
!281 = !DILocation(line: 130, column: 25, scope: !282)
!282 = distinct !DILexicalBlock(scope: !279, file: !15, line: 130, column: 13)
!283 = !DILocation(line: 130, column: 27, scope: !282)
!284 = !DILocation(line: 130, column: 13, scope: !279)
!285 = !DILocation(line: 132, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !15, line: 131, column: 13)
!287 = !DILocation(line: 132, column: 24, scope: !286)
!288 = !DILocation(line: 132, column: 27, scope: !286)
!289 = !DILocation(line: 133, column: 13, scope: !286)
!290 = !DILocation(line: 130, column: 34, scope: !282)
!291 = !DILocation(line: 130, column: 13, scope: !282)
!292 = distinct !{!292, !284, !293, !40}
!293 = !DILocation(line: 133, column: 13, scope: !279)
!294 = !DILocation(line: 136, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !265, file: !15, line: 136, column: 17)
!296 = !DILocation(line: 136, column: 22, scope: !295)
!297 = !DILocation(line: 136, column: 17, scope: !265)
!298 = !DILocation(line: 138, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !15, line: 137, column: 13)
!300 = !DILocation(line: 138, column: 24, scope: !299)
!301 = !DILocation(line: 138, column: 30, scope: !299)
!302 = !DILocation(line: 140, column: 23, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !15, line: 140, column: 17)
!304 = !DILocation(line: 140, column: 21, scope: !303)
!305 = !DILocation(line: 140, column: 28, scope: !306)
!306 = distinct !DILexicalBlock(scope: !303, file: !15, line: 140, column: 17)
!307 = !DILocation(line: 140, column: 30, scope: !306)
!308 = !DILocation(line: 140, column: 17, scope: !303)
!309 = !DILocation(line: 142, column: 34, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !15, line: 141, column: 17)
!311 = !DILocation(line: 142, column: 41, scope: !310)
!312 = !DILocation(line: 142, column: 21, scope: !310)
!313 = !DILocation(line: 143, column: 17, scope: !310)
!314 = !DILocation(line: 140, column: 37, scope: !306)
!315 = !DILocation(line: 140, column: 17, scope: !306)
!316 = distinct !{!316, !308, !317, !40}
!317 = !DILocation(line: 143, column: 17, scope: !303)
!318 = !DILocation(line: 144, column: 13, scope: !299)
!319 = !DILocation(line: 147, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !295, file: !15, line: 146, column: 13)
!321 = !DILocation(line: 149, column: 18, scope: !265)
!322 = !DILocation(line: 149, column: 13, scope: !265)
!323 = !DILocation(line: 151, column: 5, scope: !266)
!324 = !DILocation(line: 123, column: 24, scope: !261)
!325 = !DILocation(line: 123, column: 5, scope: !261)
!326 = distinct !{!326, !263, !327, !40}
!327 = !DILocation(line: 151, column: 5, scope: !258)
!328 = !DILocation(line: 152, column: 1, scope: !235)
