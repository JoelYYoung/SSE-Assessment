; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %call = call i32 @rand() #5, !dbg !21
  %and = and i32 %call, 1, !dbg !21
  %tobool = icmp ne i32 %and, 0, !dbg !21
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !21

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !21
  %shl = shl i32 %call1, 30, !dbg !21
  %call2 = call i32 @rand() #5, !dbg !21
  %shl3 = shl i32 %call2, 15, !dbg !21
  %xor = xor i32 %shl, %shl3, !dbg !21
  %call4 = call i32 @rand() #5, !dbg !21
  %xor5 = xor i32 %xor, %call4, !dbg !21
  br label %cond.end, !dbg !21

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !21
  %shl7 = shl i32 %call6, 30, !dbg !21
  %call8 = call i32 @rand() #5, !dbg !21
  %shl9 = shl i32 %call8, 15, !dbg !21
  %xor10 = xor i32 %shl7, %shl9, !dbg !21
  %call11 = call i32 @rand() #5, !dbg !21
  %xor12 = xor i32 %xor10, %call11, !dbg !21
  %sub = sub i32 0, %xor12, !dbg !21
  %sub13 = sub i32 %sub, 1, !dbg !21
  br label %cond.end, !dbg !21

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !21
  store i32 %cond, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !30, metadata !DIExpression()), !dbg !31
  %call14 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !32
  %0 = bitcast i8* %call14 to i32*, !dbg !33
  store i32* %0, i32** %buffer, align 8, !dbg !31
  %1 = load i32*, i32** %buffer, align 8, !dbg !34
  %cmp = icmp eq i32* %1, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %cond.end
  call void @exit(i32 -1) #6, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !43
  %cmp15 = icmp slt i32 %2, 10, !dbg !45
  br i1 %cmp15, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !47
  %4 = load i32, i32* %i, align 4, !dbg !49
  %idxprom = sext i32 %4 to i64, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %5, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !57
  %cmp16 = icmp sge i32 %6, 0, !dbg !59
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !60

if.then17:                                        ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !61
  %8 = load i32, i32* %data, align 4, !dbg !63
  %idxprom18 = sext i32 %8 to i64, !dbg !61
  %arrayidx19 = getelementptr inbounds i32, i32* %7, i64 %idxprom18, !dbg !61
  store i32 1, i32* %arrayidx19, align 4, !dbg !64
  store i32 0, i32* %i, align 4, !dbg !65
  br label %for.cond20, !dbg !67

for.cond20:                                       ; preds = %for.inc25, %if.then17
  %9 = load i32, i32* %i, align 4, !dbg !68
  %cmp21 = icmp slt i32 %9, 10, !dbg !70
  br i1 %cmp21, label %for.body22, label %for.end27, !dbg !71

for.body22:                                       ; preds = %for.cond20
  %10 = load i32*, i32** %buffer, align 8, !dbg !72
  %11 = load i32, i32* %i, align 4, !dbg !74
  %idxprom23 = sext i32 %11 to i64, !dbg !72
  %arrayidx24 = getelementptr inbounds i32, i32* %10, i64 %idxprom23, !dbg !72
  %12 = load i32, i32* %arrayidx24, align 4, !dbg !72
  call void @printIntLine(i32 %12), !dbg !75
  br label %for.inc25, !dbg !76

for.inc25:                                        ; preds = %for.body22
  %13 = load i32, i32* %i, align 4, !dbg !77
  %inc26 = add nsw i32 %13, 1, !dbg !77
  store i32 %inc26, i32* %i, align 4, !dbg !77
  br label %for.cond20, !dbg !78, !llvm.loop !79

for.end27:                                        ; preds = %for.cond20
  br label %if.end28, !dbg !81

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !82
  br label %if.end28

if.end28:                                         ; preds = %if.else, %for.end27
  %14 = load i32*, i32** %buffer, align 8, !dbg !84
  %15 = bitcast i32* %14 to i8*, !dbg !84
  call void @free(i8* %15) #5, !dbg !85
  ret void, !dbg !86
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04_good() #0 !dbg !87 {
entry:
  call void @goodB2G1(), !dbg !88
  call void @goodB2G2(), !dbg !89
  call void @goodG2B1(), !dbg !90
  call void @goodG2B2(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #5, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #5, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !113 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 -1, i32* %data, align 4, !dbg !116
  %call = call i32 @rand() #5, !dbg !117
  %and = and i32 %call, 1, !dbg !117
  %tobool = icmp ne i32 %and, 0, !dbg !117
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !117

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !117
  %shl = shl i32 %call1, 30, !dbg !117
  %call2 = call i32 @rand() #5, !dbg !117
  %shl3 = shl i32 %call2, 15, !dbg !117
  %xor = xor i32 %shl, %shl3, !dbg !117
  %call4 = call i32 @rand() #5, !dbg !117
  %xor5 = xor i32 %xor, %call4, !dbg !117
  br label %cond.end, !dbg !117

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !117
  %shl7 = shl i32 %call6, 30, !dbg !117
  %call8 = call i32 @rand() #5, !dbg !117
  %shl9 = shl i32 %call8, 15, !dbg !117
  %xor10 = xor i32 %shl7, %shl9, !dbg !117
  %call11 = call i32 @rand() #5, !dbg !117
  %xor12 = xor i32 %xor10, %call11, !dbg !117
  %sub = sub i32 0, %xor12, !dbg !117
  %sub13 = sub i32 %sub, 1, !dbg !117
  br label %cond.end, !dbg !117

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !117
  store i32 %cond, i32* %data, align 4, !dbg !120
  call void @llvm.dbg.declare(metadata i32* %i, metadata !121, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !126, metadata !DIExpression()), !dbg !127
  %call14 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !128
  %0 = bitcast i8* %call14 to i32*, !dbg !129
  store i32* %0, i32** %buffer, align 8, !dbg !127
  %1 = load i32*, i32** %buffer, align 8, !dbg !130
  %cmp = icmp eq i32* %1, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %cond.end
  call void @exit(i32 -1) #6, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !139
  %cmp15 = icmp slt i32 %2, 10, !dbg !141
  br i1 %cmp15, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !143
  %4 = load i32, i32* %i, align 4, !dbg !145
  %idxprom = sext i32 %4 to i64, !dbg !143
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !148
  %inc = add nsw i32 %5, 1, !dbg !148
  store i32 %inc, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !152
  %cmp16 = icmp sge i32 %6, 0, !dbg !154
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !155

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !156
  %cmp17 = icmp slt i32 %7, 10, !dbg !157
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !158

if.then18:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !159
  %9 = load i32, i32* %data, align 4, !dbg !161
  %idxprom19 = sext i32 %9 to i64, !dbg !159
  %arrayidx20 = getelementptr inbounds i32, i32* %8, i64 %idxprom19, !dbg !159
  store i32 1, i32* %arrayidx20, align 4, !dbg !162
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond21, !dbg !165

for.cond21:                                       ; preds = %for.inc26, %if.then18
  %10 = load i32, i32* %i, align 4, !dbg !166
  %cmp22 = icmp slt i32 %10, 10, !dbg !168
  br i1 %cmp22, label %for.body23, label %for.end28, !dbg !169

for.body23:                                       ; preds = %for.cond21
  %11 = load i32*, i32** %buffer, align 8, !dbg !170
  %12 = load i32, i32* %i, align 4, !dbg !172
  %idxprom24 = sext i32 %12 to i64, !dbg !170
  %arrayidx25 = getelementptr inbounds i32, i32* %11, i64 %idxprom24, !dbg !170
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !170
  call void @printIntLine(i32 %13), !dbg !173
  br label %for.inc26, !dbg !174

for.inc26:                                        ; preds = %for.body23
  %14 = load i32, i32* %i, align 4, !dbg !175
  %inc27 = add nsw i32 %14, 1, !dbg !175
  store i32 %inc27, i32* %i, align 4, !dbg !175
  br label %for.cond21, !dbg !176, !llvm.loop !177

for.end28:                                        ; preds = %for.cond21
  br label %if.end29, !dbg !179

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !180
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end28
  %15 = load i32*, i32** %buffer, align 8, !dbg !182
  %16 = bitcast i32* %15 to i8*, !dbg !182
  call void @free(i8* %16) #5, !dbg !183
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 -1, i32* %data, align 4, !dbg !188
  %call = call i32 @rand() #5, !dbg !189
  %and = and i32 %call, 1, !dbg !189
  %tobool = icmp ne i32 %and, 0, !dbg !189
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !189

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !189
  %shl = shl i32 %call1, 30, !dbg !189
  %call2 = call i32 @rand() #5, !dbg !189
  %shl3 = shl i32 %call2, 15, !dbg !189
  %xor = xor i32 %shl, %shl3, !dbg !189
  %call4 = call i32 @rand() #5, !dbg !189
  %xor5 = xor i32 %xor, %call4, !dbg !189
  br label %cond.end, !dbg !189

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !189
  %shl7 = shl i32 %call6, 30, !dbg !189
  %call8 = call i32 @rand() #5, !dbg !189
  %shl9 = shl i32 %call8, 15, !dbg !189
  %xor10 = xor i32 %shl7, %shl9, !dbg !189
  %call11 = call i32 @rand() #5, !dbg !189
  %xor12 = xor i32 %xor10, %call11, !dbg !189
  %sub = sub i32 0, %xor12, !dbg !189
  %sub13 = sub i32 %sub, 1, !dbg !189
  br label %cond.end, !dbg !189

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !189
  store i32 %cond, i32* %data, align 4, !dbg !192
  call void @llvm.dbg.declare(metadata i32* %i, metadata !193, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !198, metadata !DIExpression()), !dbg !199
  %call14 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !200
  %0 = bitcast i8* %call14 to i32*, !dbg !201
  store i32* %0, i32** %buffer, align 8, !dbg !199
  %1 = load i32*, i32** %buffer, align 8, !dbg !202
  %cmp = icmp eq i32* %1, null, !dbg !204
  br i1 %cmp, label %if.then, label %if.end, !dbg !205

if.then:                                          ; preds = %cond.end
  call void @exit(i32 -1) #6, !dbg !206
  unreachable, !dbg !206

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !208
  br label %for.cond, !dbg !210

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !211
  %cmp15 = icmp slt i32 %2, 10, !dbg !213
  br i1 %cmp15, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !215
  %4 = load i32, i32* %i, align 4, !dbg !217
  %idxprom = sext i32 %4 to i64, !dbg !215
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !215
  store i32 0, i32* %arrayidx, align 4, !dbg !218
  br label %for.inc, !dbg !219

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !220
  %inc = add nsw i32 %5, 1, !dbg !220
  store i32 %inc, i32* %i, align 4, !dbg !220
  br label %for.cond, !dbg !221, !llvm.loop !222

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !224
  %cmp16 = icmp sge i32 %6, 0, !dbg !226
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !227

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !228
  %cmp17 = icmp slt i32 %7, 10, !dbg !229
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !230

if.then18:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !231
  %9 = load i32, i32* %data, align 4, !dbg !233
  %idxprom19 = sext i32 %9 to i64, !dbg !231
  %arrayidx20 = getelementptr inbounds i32, i32* %8, i64 %idxprom19, !dbg !231
  store i32 1, i32* %arrayidx20, align 4, !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %for.cond21, !dbg !237

for.cond21:                                       ; preds = %for.inc26, %if.then18
  %10 = load i32, i32* %i, align 4, !dbg !238
  %cmp22 = icmp slt i32 %10, 10, !dbg !240
  br i1 %cmp22, label %for.body23, label %for.end28, !dbg !241

for.body23:                                       ; preds = %for.cond21
  %11 = load i32*, i32** %buffer, align 8, !dbg !242
  %12 = load i32, i32* %i, align 4, !dbg !244
  %idxprom24 = sext i32 %12 to i64, !dbg !242
  %arrayidx25 = getelementptr inbounds i32, i32* %11, i64 %idxprom24, !dbg !242
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !242
  call void @printIntLine(i32 %13), !dbg !245
  br label %for.inc26, !dbg !246

for.inc26:                                        ; preds = %for.body23
  %14 = load i32, i32* %i, align 4, !dbg !247
  %inc27 = add nsw i32 %14, 1, !dbg !247
  store i32 %inc27, i32* %i, align 4, !dbg !247
  br label %for.cond21, !dbg !248, !llvm.loop !249

for.end28:                                        ; preds = %for.cond21
  br label %if.end29, !dbg !251

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !252
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end28
  %15 = load i32*, i32** %buffer, align 8, !dbg !254
  %16 = bitcast i32* %15 to i8*, !dbg !254
  call void @free(i8* %16) #5, !dbg !255
  ret void, !dbg !256
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !257 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !258, metadata !DIExpression()), !dbg !259
  store i32 -1, i32* %data, align 4, !dbg !260
  store i32 7, i32* %data, align 4, !dbg !261
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !269, metadata !DIExpression()), !dbg !270
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !271
  %0 = bitcast i8* %call to i32*, !dbg !272
  store i32* %0, i32** %buffer, align 8, !dbg !270
  %1 = load i32*, i32** %buffer, align 8, !dbg !273
  %cmp = icmp eq i32* %1, null, !dbg !275
  br i1 %cmp, label %if.then, label %if.end, !dbg !276

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !277
  unreachable, !dbg !277

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !279
  br label %for.cond, !dbg !281

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !282
  %cmp1 = icmp slt i32 %2, 10, !dbg !284
  br i1 %cmp1, label %for.body, label %for.end, !dbg !285

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !286
  %4 = load i32, i32* %i, align 4, !dbg !288
  %idxprom = sext i32 %4 to i64, !dbg !286
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !286
  store i32 0, i32* %arrayidx, align 4, !dbg !289
  br label %for.inc, !dbg !290

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !291
  %inc = add nsw i32 %5, 1, !dbg !291
  store i32 %inc, i32* %i, align 4, !dbg !291
  br label %for.cond, !dbg !292, !llvm.loop !293

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !295
  %cmp2 = icmp sge i32 %6, 0, !dbg !297
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !298

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !299
  %8 = load i32, i32* %data, align 4, !dbg !301
  %idxprom4 = sext i32 %8 to i64, !dbg !299
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !299
  store i32 1, i32* %arrayidx5, align 4, !dbg !302
  store i32 0, i32* %i, align 4, !dbg !303
  br label %for.cond6, !dbg !305

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !306
  %cmp7 = icmp slt i32 %9, 10, !dbg !308
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !309

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !310
  %11 = load i32, i32* %i, align 4, !dbg !312
  %idxprom9 = sext i32 %11 to i64, !dbg !310
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !310
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !310
  call void @printIntLine(i32 %12), !dbg !313
  br label %for.inc11, !dbg !314

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !315
  %inc12 = add nsw i32 %13, 1, !dbg !315
  store i32 %inc12, i32* %i, align 4, !dbg !315
  br label %for.cond6, !dbg !316, !llvm.loop !317

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !319

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !320
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !322
  %15 = bitcast i32* %14 to i8*, !dbg !322
  call void @free(i8* %15) #5, !dbg !323
  ret void, !dbg !324
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !325 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !326, metadata !DIExpression()), !dbg !327
  store i32 -1, i32* %data, align 4, !dbg !328
  store i32 7, i32* %data, align 4, !dbg !329
  call void @llvm.dbg.declare(metadata i32* %i, metadata !332, metadata !DIExpression()), !dbg !336
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !337, metadata !DIExpression()), !dbg !338
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !339
  %0 = bitcast i8* %call to i32*, !dbg !340
  store i32* %0, i32** %buffer, align 8, !dbg !338
  %1 = load i32*, i32** %buffer, align 8, !dbg !341
  %cmp = icmp eq i32* %1, null, !dbg !343
  br i1 %cmp, label %if.then, label %if.end, !dbg !344

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !345
  unreachable, !dbg !345

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !347
  br label %for.cond, !dbg !349

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !350
  %cmp1 = icmp slt i32 %2, 10, !dbg !352
  br i1 %cmp1, label %for.body, label %for.end, !dbg !353

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !354
  %4 = load i32, i32* %i, align 4, !dbg !356
  %idxprom = sext i32 %4 to i64, !dbg !354
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !354
  store i32 0, i32* %arrayidx, align 4, !dbg !357
  br label %for.inc, !dbg !358

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !359
  %inc = add nsw i32 %5, 1, !dbg !359
  store i32 %inc, i32* %i, align 4, !dbg !359
  br label %for.cond, !dbg !360, !llvm.loop !361

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !363
  %cmp2 = icmp sge i32 %6, 0, !dbg !365
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !366

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !367
  %8 = load i32, i32* %data, align 4, !dbg !369
  %idxprom4 = sext i32 %8 to i64, !dbg !367
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !367
  store i32 1, i32* %arrayidx5, align 4, !dbg !370
  store i32 0, i32* %i, align 4, !dbg !371
  br label %for.cond6, !dbg !373

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !374
  %cmp7 = icmp slt i32 %9, 10, !dbg !376
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !377

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !378
  %11 = load i32, i32* %i, align 4, !dbg !380
  %idxprom9 = sext i32 %11 to i64, !dbg !378
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !378
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !378
  call void @printIntLine(i32 %12), !dbg !381
  br label %for.inc11, !dbg !382

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !383
  %inc12 = add nsw i32 %13, 1, !dbg !383
  store i32 %inc12, i32* %i, align 4, !dbg !383
  br label %for.cond6, !dbg !384, !llvm.loop !385

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !387

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !388
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !390
  %15 = bitcast i32* %14 to i8*, !dbg !390
  call void @free(i8* %15) #5, !dbg !391
  ret void, !dbg !392
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 9, scope: !14)
!20 = !DILocation(line: 32, column: 10, scope: !14)
!21 = !DILocation(line: 36, column: 16, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 34, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 8)
!24 = !DILocation(line: 36, column: 14, scope: !22)
!25 = !DILocalVariable(name: "i", scope: !26, file: !15, line: 41, type: !4)
!26 = distinct !DILexicalBlock(scope: !27, file: !15, line: 40, column: 9)
!27 = distinct !DILexicalBlock(scope: !28, file: !15, line: 39, column: 5)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 8)
!29 = !DILocation(line: 41, column: 17, scope: !26)
!30 = !DILocalVariable(name: "buffer", scope: !26, file: !15, line: 42, type: !6)
!31 = !DILocation(line: 42, column: 19, scope: !26)
!32 = !DILocation(line: 42, column: 35, scope: !26)
!33 = !DILocation(line: 42, column: 28, scope: !26)
!34 = !DILocation(line: 43, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !26, file: !15, line: 43, column: 17)
!36 = !DILocation(line: 43, column: 24, scope: !35)
!37 = !DILocation(line: 43, column: 17, scope: !26)
!38 = !DILocation(line: 43, column: 34, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 43, column: 33)
!40 = !DILocation(line: 45, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !26, file: !15, line: 45, column: 13)
!42 = !DILocation(line: 45, column: 18, scope: !41)
!43 = !DILocation(line: 45, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !15, line: 45, column: 13)
!45 = !DILocation(line: 45, column: 27, scope: !44)
!46 = !DILocation(line: 45, column: 13, scope: !41)
!47 = !DILocation(line: 47, column: 17, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !15, line: 46, column: 13)
!49 = !DILocation(line: 47, column: 24, scope: !48)
!50 = !DILocation(line: 47, column: 27, scope: !48)
!51 = !DILocation(line: 48, column: 13, scope: !48)
!52 = !DILocation(line: 45, column: 34, scope: !44)
!53 = !DILocation(line: 45, column: 13, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 48, column: 13, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 51, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !26, file: !15, line: 51, column: 17)
!59 = !DILocation(line: 51, column: 22, scope: !58)
!60 = !DILocation(line: 51, column: 17, scope: !26)
!61 = !DILocation(line: 53, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 52, column: 13)
!63 = !DILocation(line: 53, column: 24, scope: !62)
!64 = !DILocation(line: 53, column: 30, scope: !62)
!65 = !DILocation(line: 55, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 55, column: 17)
!67 = !DILocation(line: 55, column: 21, scope: !66)
!68 = !DILocation(line: 55, column: 28, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !15, line: 55, column: 17)
!70 = !DILocation(line: 55, column: 30, scope: !69)
!71 = !DILocation(line: 55, column: 17, scope: !66)
!72 = !DILocation(line: 57, column: 34, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 56, column: 17)
!74 = !DILocation(line: 57, column: 41, scope: !73)
!75 = !DILocation(line: 57, column: 21, scope: !73)
!76 = !DILocation(line: 58, column: 17, scope: !73)
!77 = !DILocation(line: 55, column: 37, scope: !69)
!78 = !DILocation(line: 55, column: 17, scope: !69)
!79 = distinct !{!79, !71, !80, !56}
!80 = !DILocation(line: 58, column: 17, scope: !66)
!81 = !DILocation(line: 59, column: 13, scope: !62)
!82 = !DILocation(line: 62, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !58, file: !15, line: 61, column: 13)
!84 = !DILocation(line: 64, column: 18, scope: !26)
!85 = !DILocation(line: 64, column: 13, scope: !26)
!86 = !DILocation(line: 67, column: 1, scope: !14)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_04_good", scope: !15, file: !15, line: 251, type: !16, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 253, column: 5, scope: !87)
!89 = !DILocation(line: 254, column: 5, scope: !87)
!90 = !DILocation(line: 255, column: 5, scope: !87)
!91 = !DILocation(line: 256, column: 5, scope: !87)
!92 = !DILocation(line: 257, column: 1, scope: !87)
!93 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 268, type: !94, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!4, !4, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !15, line: 268, type: !4)
!100 = !DILocation(line: 268, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !15, line: 268, type: !96)
!102 = !DILocation(line: 268, column: 27, scope: !93)
!103 = !DILocation(line: 271, column: 22, scope: !93)
!104 = !DILocation(line: 271, column: 12, scope: !93)
!105 = !DILocation(line: 271, column: 5, scope: !93)
!106 = !DILocation(line: 273, column: 5, scope: !93)
!107 = !DILocation(line: 274, column: 5, scope: !93)
!108 = !DILocation(line: 275, column: 5, scope: !93)
!109 = !DILocation(line: 278, column: 5, scope: !93)
!110 = !DILocation(line: 279, column: 5, scope: !93)
!111 = !DILocation(line: 280, column: 5, scope: !93)
!112 = !DILocation(line: 282, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 76, type: !4)
!115 = !DILocation(line: 76, column: 9, scope: !113)
!116 = !DILocation(line: 78, column: 10, scope: !113)
!117 = !DILocation(line: 82, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !119, file: !15, line: 80, column: 5)
!119 = distinct !DILexicalBlock(scope: !113, file: !15, line: 79, column: 8)
!120 = !DILocation(line: 82, column: 14, scope: !118)
!121 = !DILocalVariable(name: "i", scope: !122, file: !15, line: 92, type: !4)
!122 = distinct !DILexicalBlock(scope: !123, file: !15, line: 91, column: 9)
!123 = distinct !DILexicalBlock(scope: !124, file: !15, line: 90, column: 5)
!124 = distinct !DILexicalBlock(scope: !113, file: !15, line: 84, column: 8)
!125 = !DILocation(line: 92, column: 17, scope: !122)
!126 = !DILocalVariable(name: "buffer", scope: !122, file: !15, line: 93, type: !6)
!127 = !DILocation(line: 93, column: 19, scope: !122)
!128 = !DILocation(line: 93, column: 35, scope: !122)
!129 = !DILocation(line: 93, column: 28, scope: !122)
!130 = !DILocation(line: 94, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !122, file: !15, line: 94, column: 17)
!132 = !DILocation(line: 94, column: 24, scope: !131)
!133 = !DILocation(line: 94, column: 17, scope: !122)
!134 = !DILocation(line: 94, column: 34, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 94, column: 33)
!136 = !DILocation(line: 96, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !122, file: !15, line: 96, column: 13)
!138 = !DILocation(line: 96, column: 18, scope: !137)
!139 = !DILocation(line: 96, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 96, column: 13)
!141 = !DILocation(line: 96, column: 27, scope: !140)
!142 = !DILocation(line: 96, column: 13, scope: !137)
!143 = !DILocation(line: 98, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 97, column: 13)
!145 = !DILocation(line: 98, column: 24, scope: !144)
!146 = !DILocation(line: 98, column: 27, scope: !144)
!147 = !DILocation(line: 99, column: 13, scope: !144)
!148 = !DILocation(line: 96, column: 34, scope: !140)
!149 = !DILocation(line: 96, column: 13, scope: !140)
!150 = distinct !{!150, !142, !151, !56}
!151 = !DILocation(line: 99, column: 13, scope: !137)
!152 = !DILocation(line: 101, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !122, file: !15, line: 101, column: 17)
!154 = !DILocation(line: 101, column: 22, scope: !153)
!155 = !DILocation(line: 101, column: 27, scope: !153)
!156 = !DILocation(line: 101, column: 30, scope: !153)
!157 = !DILocation(line: 101, column: 35, scope: !153)
!158 = !DILocation(line: 101, column: 17, scope: !122)
!159 = !DILocation(line: 103, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !15, line: 102, column: 13)
!161 = !DILocation(line: 103, column: 24, scope: !160)
!162 = !DILocation(line: 103, column: 30, scope: !160)
!163 = !DILocation(line: 105, column: 23, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 105, column: 17)
!165 = !DILocation(line: 105, column: 21, scope: !164)
!166 = !DILocation(line: 105, column: 28, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 105, column: 17)
!168 = !DILocation(line: 105, column: 30, scope: !167)
!169 = !DILocation(line: 105, column: 17, scope: !164)
!170 = !DILocation(line: 107, column: 34, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 106, column: 17)
!172 = !DILocation(line: 107, column: 41, scope: !171)
!173 = !DILocation(line: 107, column: 21, scope: !171)
!174 = !DILocation(line: 108, column: 17, scope: !171)
!175 = !DILocation(line: 105, column: 37, scope: !167)
!176 = !DILocation(line: 105, column: 17, scope: !167)
!177 = distinct !{!177, !169, !178, !56}
!178 = !DILocation(line: 108, column: 17, scope: !164)
!179 = !DILocation(line: 109, column: 13, scope: !160)
!180 = !DILocation(line: 112, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !153, file: !15, line: 111, column: 13)
!182 = !DILocation(line: 114, column: 18, scope: !122)
!183 = !DILocation(line: 114, column: 13, scope: !122)
!184 = !DILocation(line: 117, column: 1, scope: !113)
!185 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 120, type: !16, scopeLine: 121, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!186 = !DILocalVariable(name: "data", scope: !185, file: !15, line: 122, type: !4)
!187 = !DILocation(line: 122, column: 9, scope: !185)
!188 = !DILocation(line: 124, column: 10, scope: !185)
!189 = !DILocation(line: 128, column: 16, scope: !190)
!190 = distinct !DILexicalBlock(scope: !191, file: !15, line: 126, column: 5)
!191 = distinct !DILexicalBlock(scope: !185, file: !15, line: 125, column: 8)
!192 = !DILocation(line: 128, column: 14, scope: !190)
!193 = !DILocalVariable(name: "i", scope: !194, file: !15, line: 133, type: !4)
!194 = distinct !DILexicalBlock(scope: !195, file: !15, line: 132, column: 9)
!195 = distinct !DILexicalBlock(scope: !196, file: !15, line: 131, column: 5)
!196 = distinct !DILexicalBlock(scope: !185, file: !15, line: 130, column: 8)
!197 = !DILocation(line: 133, column: 17, scope: !194)
!198 = !DILocalVariable(name: "buffer", scope: !194, file: !15, line: 134, type: !6)
!199 = !DILocation(line: 134, column: 19, scope: !194)
!200 = !DILocation(line: 134, column: 35, scope: !194)
!201 = !DILocation(line: 134, column: 28, scope: !194)
!202 = !DILocation(line: 135, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !194, file: !15, line: 135, column: 17)
!204 = !DILocation(line: 135, column: 24, scope: !203)
!205 = !DILocation(line: 135, column: 17, scope: !194)
!206 = !DILocation(line: 135, column: 34, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !15, line: 135, column: 33)
!208 = !DILocation(line: 137, column: 20, scope: !209)
!209 = distinct !DILexicalBlock(scope: !194, file: !15, line: 137, column: 13)
!210 = !DILocation(line: 137, column: 18, scope: !209)
!211 = !DILocation(line: 137, column: 25, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !15, line: 137, column: 13)
!213 = !DILocation(line: 137, column: 27, scope: !212)
!214 = !DILocation(line: 137, column: 13, scope: !209)
!215 = !DILocation(line: 139, column: 17, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !15, line: 138, column: 13)
!217 = !DILocation(line: 139, column: 24, scope: !216)
!218 = !DILocation(line: 139, column: 27, scope: !216)
!219 = !DILocation(line: 140, column: 13, scope: !216)
!220 = !DILocation(line: 137, column: 34, scope: !212)
!221 = !DILocation(line: 137, column: 13, scope: !212)
!222 = distinct !{!222, !214, !223, !56}
!223 = !DILocation(line: 140, column: 13, scope: !209)
!224 = !DILocation(line: 142, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !194, file: !15, line: 142, column: 17)
!226 = !DILocation(line: 142, column: 22, scope: !225)
!227 = !DILocation(line: 142, column: 27, scope: !225)
!228 = !DILocation(line: 142, column: 30, scope: !225)
!229 = !DILocation(line: 142, column: 35, scope: !225)
!230 = !DILocation(line: 142, column: 17, scope: !194)
!231 = !DILocation(line: 144, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !225, file: !15, line: 143, column: 13)
!233 = !DILocation(line: 144, column: 24, scope: !232)
!234 = !DILocation(line: 144, column: 30, scope: !232)
!235 = !DILocation(line: 146, column: 23, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !15, line: 146, column: 17)
!237 = !DILocation(line: 146, column: 21, scope: !236)
!238 = !DILocation(line: 146, column: 28, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !15, line: 146, column: 17)
!240 = !DILocation(line: 146, column: 30, scope: !239)
!241 = !DILocation(line: 146, column: 17, scope: !236)
!242 = !DILocation(line: 148, column: 34, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 147, column: 17)
!244 = !DILocation(line: 148, column: 41, scope: !243)
!245 = !DILocation(line: 148, column: 21, scope: !243)
!246 = !DILocation(line: 149, column: 17, scope: !243)
!247 = !DILocation(line: 146, column: 37, scope: !239)
!248 = !DILocation(line: 146, column: 17, scope: !239)
!249 = distinct !{!249, !241, !250, !56}
!250 = !DILocation(line: 149, column: 17, scope: !236)
!251 = !DILocation(line: 150, column: 13, scope: !232)
!252 = !DILocation(line: 153, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !225, file: !15, line: 152, column: 13)
!254 = !DILocation(line: 155, column: 18, scope: !194)
!255 = !DILocation(line: 155, column: 13, scope: !194)
!256 = !DILocation(line: 158, column: 1, scope: !185)
!257 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 161, type: !16, scopeLine: 162, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!258 = !DILocalVariable(name: "data", scope: !257, file: !15, line: 163, type: !4)
!259 = !DILocation(line: 163, column: 9, scope: !257)
!260 = !DILocation(line: 165, column: 10, scope: !257)
!261 = !DILocation(line: 175, column: 14, scope: !262)
!262 = distinct !DILexicalBlock(scope: !263, file: !15, line: 172, column: 5)
!263 = distinct !DILexicalBlock(scope: !257, file: !15, line: 166, column: 8)
!264 = !DILocalVariable(name: "i", scope: !265, file: !15, line: 180, type: !4)
!265 = distinct !DILexicalBlock(scope: !266, file: !15, line: 179, column: 9)
!266 = distinct !DILexicalBlock(scope: !267, file: !15, line: 178, column: 5)
!267 = distinct !DILexicalBlock(scope: !257, file: !15, line: 177, column: 8)
!268 = !DILocation(line: 180, column: 17, scope: !265)
!269 = !DILocalVariable(name: "buffer", scope: !265, file: !15, line: 181, type: !6)
!270 = !DILocation(line: 181, column: 19, scope: !265)
!271 = !DILocation(line: 181, column: 35, scope: !265)
!272 = !DILocation(line: 181, column: 28, scope: !265)
!273 = !DILocation(line: 182, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !265, file: !15, line: 182, column: 17)
!275 = !DILocation(line: 182, column: 24, scope: !274)
!276 = !DILocation(line: 182, column: 17, scope: !265)
!277 = !DILocation(line: 182, column: 34, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !15, line: 182, column: 33)
!279 = !DILocation(line: 184, column: 20, scope: !280)
!280 = distinct !DILexicalBlock(scope: !265, file: !15, line: 184, column: 13)
!281 = !DILocation(line: 184, column: 18, scope: !280)
!282 = !DILocation(line: 184, column: 25, scope: !283)
!283 = distinct !DILexicalBlock(scope: !280, file: !15, line: 184, column: 13)
!284 = !DILocation(line: 184, column: 27, scope: !283)
!285 = !DILocation(line: 184, column: 13, scope: !280)
!286 = !DILocation(line: 186, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !15, line: 185, column: 13)
!288 = !DILocation(line: 186, column: 24, scope: !287)
!289 = !DILocation(line: 186, column: 27, scope: !287)
!290 = !DILocation(line: 187, column: 13, scope: !287)
!291 = !DILocation(line: 184, column: 34, scope: !283)
!292 = !DILocation(line: 184, column: 13, scope: !283)
!293 = distinct !{!293, !285, !294, !56}
!294 = !DILocation(line: 187, column: 13, scope: !280)
!295 = !DILocation(line: 190, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !265, file: !15, line: 190, column: 17)
!297 = !DILocation(line: 190, column: 22, scope: !296)
!298 = !DILocation(line: 190, column: 17, scope: !265)
!299 = !DILocation(line: 192, column: 17, scope: !300)
!300 = distinct !DILexicalBlock(scope: !296, file: !15, line: 191, column: 13)
!301 = !DILocation(line: 192, column: 24, scope: !300)
!302 = !DILocation(line: 192, column: 30, scope: !300)
!303 = !DILocation(line: 194, column: 23, scope: !304)
!304 = distinct !DILexicalBlock(scope: !300, file: !15, line: 194, column: 17)
!305 = !DILocation(line: 194, column: 21, scope: !304)
!306 = !DILocation(line: 194, column: 28, scope: !307)
!307 = distinct !DILexicalBlock(scope: !304, file: !15, line: 194, column: 17)
!308 = !DILocation(line: 194, column: 30, scope: !307)
!309 = !DILocation(line: 194, column: 17, scope: !304)
!310 = !DILocation(line: 196, column: 34, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !15, line: 195, column: 17)
!312 = !DILocation(line: 196, column: 41, scope: !311)
!313 = !DILocation(line: 196, column: 21, scope: !311)
!314 = !DILocation(line: 197, column: 17, scope: !311)
!315 = !DILocation(line: 194, column: 37, scope: !307)
!316 = !DILocation(line: 194, column: 17, scope: !307)
!317 = distinct !{!317, !309, !318, !56}
!318 = !DILocation(line: 197, column: 17, scope: !304)
!319 = !DILocation(line: 198, column: 13, scope: !300)
!320 = !DILocation(line: 201, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !296, file: !15, line: 200, column: 13)
!322 = !DILocation(line: 203, column: 18, scope: !265)
!323 = !DILocation(line: 203, column: 13, scope: !265)
!324 = !DILocation(line: 206, column: 1, scope: !257)
!325 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 209, type: !16, scopeLine: 210, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!326 = !DILocalVariable(name: "data", scope: !325, file: !15, line: 211, type: !4)
!327 = !DILocation(line: 211, column: 9, scope: !325)
!328 = !DILocation(line: 213, column: 10, scope: !325)
!329 = !DILocation(line: 218, column: 14, scope: !330)
!330 = distinct !DILexicalBlock(scope: !331, file: !15, line: 215, column: 5)
!331 = distinct !DILexicalBlock(scope: !325, file: !15, line: 214, column: 8)
!332 = !DILocalVariable(name: "i", scope: !333, file: !15, line: 223, type: !4)
!333 = distinct !DILexicalBlock(scope: !334, file: !15, line: 222, column: 9)
!334 = distinct !DILexicalBlock(scope: !335, file: !15, line: 221, column: 5)
!335 = distinct !DILexicalBlock(scope: !325, file: !15, line: 220, column: 8)
!336 = !DILocation(line: 223, column: 17, scope: !333)
!337 = !DILocalVariable(name: "buffer", scope: !333, file: !15, line: 224, type: !6)
!338 = !DILocation(line: 224, column: 19, scope: !333)
!339 = !DILocation(line: 224, column: 35, scope: !333)
!340 = !DILocation(line: 224, column: 28, scope: !333)
!341 = !DILocation(line: 225, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !333, file: !15, line: 225, column: 17)
!343 = !DILocation(line: 225, column: 24, scope: !342)
!344 = !DILocation(line: 225, column: 17, scope: !333)
!345 = !DILocation(line: 225, column: 34, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !15, line: 225, column: 33)
!347 = !DILocation(line: 227, column: 20, scope: !348)
!348 = distinct !DILexicalBlock(scope: !333, file: !15, line: 227, column: 13)
!349 = !DILocation(line: 227, column: 18, scope: !348)
!350 = !DILocation(line: 227, column: 25, scope: !351)
!351 = distinct !DILexicalBlock(scope: !348, file: !15, line: 227, column: 13)
!352 = !DILocation(line: 227, column: 27, scope: !351)
!353 = !DILocation(line: 227, column: 13, scope: !348)
!354 = !DILocation(line: 229, column: 17, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !15, line: 228, column: 13)
!356 = !DILocation(line: 229, column: 24, scope: !355)
!357 = !DILocation(line: 229, column: 27, scope: !355)
!358 = !DILocation(line: 230, column: 13, scope: !355)
!359 = !DILocation(line: 227, column: 34, scope: !351)
!360 = !DILocation(line: 227, column: 13, scope: !351)
!361 = distinct !{!361, !353, !362, !56}
!362 = !DILocation(line: 230, column: 13, scope: !348)
!363 = !DILocation(line: 233, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !333, file: !15, line: 233, column: 17)
!365 = !DILocation(line: 233, column: 22, scope: !364)
!366 = !DILocation(line: 233, column: 17, scope: !333)
!367 = !DILocation(line: 235, column: 17, scope: !368)
!368 = distinct !DILexicalBlock(scope: !364, file: !15, line: 234, column: 13)
!369 = !DILocation(line: 235, column: 24, scope: !368)
!370 = !DILocation(line: 235, column: 30, scope: !368)
!371 = !DILocation(line: 237, column: 23, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !15, line: 237, column: 17)
!373 = !DILocation(line: 237, column: 21, scope: !372)
!374 = !DILocation(line: 237, column: 28, scope: !375)
!375 = distinct !DILexicalBlock(scope: !372, file: !15, line: 237, column: 17)
!376 = !DILocation(line: 237, column: 30, scope: !375)
!377 = !DILocation(line: 237, column: 17, scope: !372)
!378 = !DILocation(line: 239, column: 34, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !15, line: 238, column: 17)
!380 = !DILocation(line: 239, column: 41, scope: !379)
!381 = !DILocation(line: 239, column: 21, scope: !379)
!382 = !DILocation(line: 240, column: 17, scope: !379)
!383 = !DILocation(line: 237, column: 37, scope: !375)
!384 = !DILocation(line: 237, column: 17, scope: !375)
!385 = distinct !{!385, !377, !386, !56}
!386 = !DILocation(line: 240, column: 17, scope: !372)
!387 = !DILocation(line: 241, column: 13, scope: !368)
!388 = !DILocation(line: 244, column: 17, scope: !389)
!389 = distinct !DILexicalBlock(scope: !364, file: !15, line: 243, column: 13)
!390 = !DILocation(line: 246, column: 18, scope: !333)
!391 = !DILocation(line: 246, column: 13, scope: !333)
!392 = !DILocation(line: 249, column: 1, scope: !325)
