; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  %call = call i32 @rand() #5, !dbg !24
  %and = and i32 %call, 1, !dbg !24
  %tobool = icmp ne i32 %and, 0, !dbg !24
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !24

cond.true:                                        ; preds = %source
  %call1 = call i32 @rand() #5, !dbg !24
  %shl = shl i32 %call1, 30, !dbg !24
  %call2 = call i32 @rand() #5, !dbg !24
  %shl3 = shl i32 %call2, 15, !dbg !24
  %xor = xor i32 %shl, %shl3, !dbg !24
  %call4 = call i32 @rand() #5, !dbg !24
  %xor5 = xor i32 %xor, %call4, !dbg !24
  br label %cond.end, !dbg !24

cond.false:                                       ; preds = %source
  %call6 = call i32 @rand() #5, !dbg !24
  %shl7 = shl i32 %call6, 30, !dbg !24
  %call8 = call i32 @rand() #5, !dbg !24
  %shl9 = shl i32 %call8, 15, !dbg !24
  %xor10 = xor i32 %shl7, %shl9, !dbg !24
  %call11 = call i32 @rand() #5, !dbg !24
  %xor12 = xor i32 %xor10, %call11, !dbg !24
  %sub = sub i32 0, %xor12, !dbg !24
  %sub13 = sub i32 %sub, 1, !dbg !24
  br label %cond.end, !dbg !24

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !24
  store i32 %cond, i32* %data, align 4, !dbg !25
  br label %sink, !dbg !26

sink:                                             ; preds = %cond.end
  call void @llvm.dbg.label(metadata !27), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !32, metadata !DIExpression()), !dbg !33
  %call14 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !34
  %0 = bitcast i8* %call14 to i32*, !dbg !35
  store i32* %0, i32** %buffer, align 8, !dbg !33
  %1 = load i32*, i32** %buffer, align 8, !dbg !36
  %cmp = icmp eq i32* %1, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !45
  %cmp15 = icmp slt i32 %2, 10, !dbg !47
  br i1 %cmp15, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !49
  %4 = load i32, i32* %i, align 4, !dbg !51
  %idxprom = sext i32 %4 to i64, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %5, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !59
  %cmp16 = icmp sge i32 %6, 0, !dbg !61
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !62

if.then17:                                        ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !63
  %8 = load i32, i32* %data, align 4, !dbg !65
  %idxprom18 = sext i32 %8 to i64, !dbg !63
  %arrayidx19 = getelementptr inbounds i32, i32* %7, i64 %idxprom18, !dbg !63
  store i32 1, i32* %arrayidx19, align 4, !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  br label %for.cond20, !dbg !69

for.cond20:                                       ; preds = %for.inc25, %if.then17
  %9 = load i32, i32* %i, align 4, !dbg !70
  %cmp21 = icmp slt i32 %9, 10, !dbg !72
  br i1 %cmp21, label %for.body22, label %for.end27, !dbg !73

for.body22:                                       ; preds = %for.cond20
  %10 = load i32*, i32** %buffer, align 8, !dbg !74
  %11 = load i32, i32* %i, align 4, !dbg !76
  %idxprom23 = sext i32 %11 to i64, !dbg !74
  %arrayidx24 = getelementptr inbounds i32, i32* %10, i64 %idxprom23, !dbg !74
  %12 = load i32, i32* %arrayidx24, align 4, !dbg !74
  call void @printIntLine(i32 %12), !dbg !77
  br label %for.inc25, !dbg !78

for.inc25:                                        ; preds = %for.body22
  %13 = load i32, i32* %i, align 4, !dbg !79
  %inc26 = add nsw i32 %13, 1, !dbg !79
  store i32 %inc26, i32* %i, align 4, !dbg !79
  br label %for.cond20, !dbg !80, !llvm.loop !81

for.end27:                                        ; preds = %for.cond20
  br label %if.end28, !dbg !83

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !84
  br label %if.end28

if.end28:                                         ; preds = %if.else, %for.end27
  %14 = load i32*, i32** %buffer, align 8, !dbg !86
  %15 = bitcast i32* %14 to i8*, !dbg !86
  call void @free(i8* %15) #5, !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18_good() #0 !dbg !89 {
entry:
  call void @goodB2G(), !dbg !90
  call void @goodG2B(), !dbg !91
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !113 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 -1, i32* %data, align 4, !dbg !116
  br label %source, !dbg !117

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !118), !dbg !119
  %call = call i32 @rand() #5, !dbg !120
  %and = and i32 %call, 1, !dbg !120
  %tobool = icmp ne i32 %and, 0, !dbg !120
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !120

cond.true:                                        ; preds = %source
  %call1 = call i32 @rand() #5, !dbg !120
  %shl = shl i32 %call1, 30, !dbg !120
  %call2 = call i32 @rand() #5, !dbg !120
  %shl3 = shl i32 %call2, 15, !dbg !120
  %xor = xor i32 %shl, %shl3, !dbg !120
  %call4 = call i32 @rand() #5, !dbg !120
  %xor5 = xor i32 %xor, %call4, !dbg !120
  br label %cond.end, !dbg !120

cond.false:                                       ; preds = %source
  %call6 = call i32 @rand() #5, !dbg !120
  %shl7 = shl i32 %call6, 30, !dbg !120
  %call8 = call i32 @rand() #5, !dbg !120
  %shl9 = shl i32 %call8, 15, !dbg !120
  %xor10 = xor i32 %shl7, %shl9, !dbg !120
  %call11 = call i32 @rand() #5, !dbg !120
  %xor12 = xor i32 %xor10, %call11, !dbg !120
  %sub = sub i32 0, %xor12, !dbg !120
  %sub13 = sub i32 %sub, 1, !dbg !120
  br label %cond.end, !dbg !120

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !120
  store i32 %cond, i32* %data, align 4, !dbg !121
  br label %sink, !dbg !122

sink:                                             ; preds = %cond.end
  call void @llvm.dbg.label(metadata !123), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !128, metadata !DIExpression()), !dbg !129
  %call14 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !130
  %0 = bitcast i8* %call14 to i32*, !dbg !131
  store i32* %0, i32** %buffer, align 8, !dbg !129
  %1 = load i32*, i32** %buffer, align 8, !dbg !132
  %cmp = icmp eq i32* %1, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #6, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !141
  %cmp15 = icmp slt i32 %2, 10, !dbg !143
  br i1 %cmp15, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !145
  %4 = load i32, i32* %i, align 4, !dbg !147
  %idxprom = sext i32 %4 to i64, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !150
  %inc = add nsw i32 %5, 1, !dbg !150
  store i32 %inc, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !154
  %cmp16 = icmp sge i32 %6, 0, !dbg !156
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !157

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !158
  %cmp17 = icmp slt i32 %7, 10, !dbg !159
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !160

if.then18:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !161
  %9 = load i32, i32* %data, align 4, !dbg !163
  %idxprom19 = sext i32 %9 to i64, !dbg !161
  %arrayidx20 = getelementptr inbounds i32, i32* %8, i64 %idxprom19, !dbg !161
  store i32 1, i32* %arrayidx20, align 4, !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond21, !dbg !167

for.cond21:                                       ; preds = %for.inc26, %if.then18
  %10 = load i32, i32* %i, align 4, !dbg !168
  %cmp22 = icmp slt i32 %10, 10, !dbg !170
  br i1 %cmp22, label %for.body23, label %for.end28, !dbg !171

for.body23:                                       ; preds = %for.cond21
  %11 = load i32*, i32** %buffer, align 8, !dbg !172
  %12 = load i32, i32* %i, align 4, !dbg !174
  %idxprom24 = sext i32 %12 to i64, !dbg !172
  %arrayidx25 = getelementptr inbounds i32, i32* %11, i64 %idxprom24, !dbg !172
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !172
  call void @printIntLine(i32 %13), !dbg !175
  br label %for.inc26, !dbg !176

for.inc26:                                        ; preds = %for.body23
  %14 = load i32, i32* %i, align 4, !dbg !177
  %inc27 = add nsw i32 %14, 1, !dbg !177
  store i32 %inc27, i32* %i, align 4, !dbg !177
  br label %for.cond21, !dbg !178, !llvm.loop !179

for.end28:                                        ; preds = %for.cond21
  br label %if.end29, !dbg !181

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !182
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end28
  %15 = load i32*, i32** %buffer, align 8, !dbg !184
  %16 = bitcast i32* %15 to i8*, !dbg !184
  call void @free(i8* %16) #5, !dbg !185
  ret void, !dbg !186
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !187 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 -1, i32* %data, align 4, !dbg !190
  br label %source, !dbg !191

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !192), !dbg !193
  store i32 7, i32* %data, align 4, !dbg !194
  br label %sink, !dbg !195

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !196), !dbg !197
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !201, metadata !DIExpression()), !dbg !202
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !203
  %0 = bitcast i8* %call to i32*, !dbg !204
  store i32* %0, i32** %buffer, align 8, !dbg !202
  %1 = load i32*, i32** %buffer, align 8, !dbg !205
  %cmp = icmp eq i32* %1, null, !dbg !207
  br i1 %cmp, label %if.then, label %if.end, !dbg !208

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #6, !dbg !209
  unreachable, !dbg !209

if.end:                                           ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !214
  %cmp1 = icmp slt i32 %2, 10, !dbg !216
  br i1 %cmp1, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !218
  %4 = load i32, i32* %i, align 4, !dbg !220
  %idxprom = sext i32 %4 to i64, !dbg !218
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !218
  store i32 0, i32* %arrayidx, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !223
  %inc = add nsw i32 %5, 1, !dbg !223
  store i32 %inc, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !227
  %cmp2 = icmp sge i32 %6, 0, !dbg !229
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !230

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !231
  %8 = load i32, i32* %data, align 4, !dbg !233
  %idxprom4 = sext i32 %8 to i64, !dbg !231
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !231
  store i32 1, i32* %arrayidx5, align 4, !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %for.cond6, !dbg !237

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !238
  %cmp7 = icmp slt i32 %9, 10, !dbg !240
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !241

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !242
  %11 = load i32, i32* %i, align 4, !dbg !244
  %idxprom9 = sext i32 %11 to i64, !dbg !242
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !242
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !242
  call void @printIntLine(i32 %12), !dbg !245
  br label %for.inc11, !dbg !246

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !247
  %inc12 = add nsw i32 %13, 1, !dbg !247
  store i32 %inc12, i32* %i, align 4, !dbg !247
  br label %for.cond6, !dbg !248, !llvm.loop !249

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !251

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !252
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !254
  %15 = bitcast i32* %14 to i8*, !dbg !254
  call void @free(i8* %15) #5, !dbg !255
  ret void, !dbg !256
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !15, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocation(line: 30, column: 12, scope: !14)
!25 = !DILocation(line: 30, column: 10, scope: !14)
!26 = !DILocation(line: 31, column: 5, scope: !14)
!27 = !DILabel(scope: !14, name: "sink", file: !15, line: 32)
!28 = !DILocation(line: 32, column: 1, scope: !14)
!29 = !DILocalVariable(name: "i", scope: !30, file: !15, line: 34, type: !4)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!31 = !DILocation(line: 34, column: 13, scope: !30)
!32 = !DILocalVariable(name: "buffer", scope: !30, file: !15, line: 35, type: !6)
!33 = !DILocation(line: 35, column: 15, scope: !30)
!34 = !DILocation(line: 35, column: 31, scope: !30)
!35 = !DILocation(line: 35, column: 24, scope: !30)
!36 = !DILocation(line: 36, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !15, line: 36, column: 13)
!38 = !DILocation(line: 36, column: 20, scope: !37)
!39 = !DILocation(line: 36, column: 13, scope: !30)
!40 = !DILocation(line: 36, column: 30, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !15, line: 36, column: 29)
!42 = !DILocation(line: 38, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !30, file: !15, line: 38, column: 9)
!44 = !DILocation(line: 38, column: 14, scope: !43)
!45 = !DILocation(line: 38, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !15, line: 38, column: 9)
!47 = !DILocation(line: 38, column: 23, scope: !46)
!48 = !DILocation(line: 38, column: 9, scope: !43)
!49 = !DILocation(line: 40, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 9)
!51 = !DILocation(line: 40, column: 20, scope: !50)
!52 = !DILocation(line: 40, column: 23, scope: !50)
!53 = !DILocation(line: 41, column: 9, scope: !50)
!54 = !DILocation(line: 38, column: 30, scope: !46)
!55 = !DILocation(line: 38, column: 9, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 41, column: 9, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 44, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !30, file: !15, line: 44, column: 13)
!61 = !DILocation(line: 44, column: 18, scope: !60)
!62 = !DILocation(line: 44, column: 13, scope: !30)
!63 = !DILocation(line: 46, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 45, column: 9)
!65 = !DILocation(line: 46, column: 20, scope: !64)
!66 = !DILocation(line: 46, column: 26, scope: !64)
!67 = !DILocation(line: 48, column: 19, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 48, column: 13)
!69 = !DILocation(line: 48, column: 17, scope: !68)
!70 = !DILocation(line: 48, column: 24, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !15, line: 48, column: 13)
!72 = !DILocation(line: 48, column: 26, scope: !71)
!73 = !DILocation(line: 48, column: 13, scope: !68)
!74 = !DILocation(line: 50, column: 30, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 49, column: 13)
!76 = !DILocation(line: 50, column: 37, scope: !75)
!77 = !DILocation(line: 50, column: 17, scope: !75)
!78 = !DILocation(line: 51, column: 13, scope: !75)
!79 = !DILocation(line: 48, column: 33, scope: !71)
!80 = !DILocation(line: 48, column: 13, scope: !71)
!81 = distinct !{!81, !73, !82, !58}
!82 = !DILocation(line: 51, column: 13, scope: !68)
!83 = !DILocation(line: 52, column: 9, scope: !64)
!84 = !DILocation(line: 55, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !60, file: !15, line: 54, column: 9)
!86 = !DILocation(line: 57, column: 14, scope: !30)
!87 = !DILocation(line: 57, column: 9, scope: !30)
!88 = !DILocation(line: 59, column: 1, scope: !14)
!89 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_18_good", scope: !15, file: !15, line: 145, type: !16, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 147, column: 5, scope: !89)
!91 = !DILocation(line: 148, column: 5, scope: !89)
!92 = !DILocation(line: 149, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 160, type: !94, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!4, !4, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !15, line: 160, type: !4)
!100 = !DILocation(line: 160, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !15, line: 160, type: !96)
!102 = !DILocation(line: 160, column: 27, scope: !93)
!103 = !DILocation(line: 163, column: 22, scope: !93)
!104 = !DILocation(line: 163, column: 12, scope: !93)
!105 = !DILocation(line: 163, column: 5, scope: !93)
!106 = !DILocation(line: 165, column: 5, scope: !93)
!107 = !DILocation(line: 166, column: 5, scope: !93)
!108 = !DILocation(line: 167, column: 5, scope: !93)
!109 = !DILocation(line: 170, column: 5, scope: !93)
!110 = !DILocation(line: 171, column: 5, scope: !93)
!111 = !DILocation(line: 172, column: 5, scope: !93)
!112 = !DILocation(line: 174, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 68, type: !4)
!115 = !DILocation(line: 68, column: 9, scope: !113)
!116 = !DILocation(line: 70, column: 10, scope: !113)
!117 = !DILocation(line: 71, column: 5, scope: !113)
!118 = !DILabel(scope: !113, name: "source", file: !15, line: 72)
!119 = !DILocation(line: 72, column: 1, scope: !113)
!120 = !DILocation(line: 74, column: 12, scope: !113)
!121 = !DILocation(line: 74, column: 10, scope: !113)
!122 = !DILocation(line: 75, column: 5, scope: !113)
!123 = !DILabel(scope: !113, name: "sink", file: !15, line: 76)
!124 = !DILocation(line: 76, column: 1, scope: !113)
!125 = !DILocalVariable(name: "i", scope: !126, file: !15, line: 78, type: !4)
!126 = distinct !DILexicalBlock(scope: !113, file: !15, line: 77, column: 5)
!127 = !DILocation(line: 78, column: 13, scope: !126)
!128 = !DILocalVariable(name: "buffer", scope: !126, file: !15, line: 79, type: !6)
!129 = !DILocation(line: 79, column: 15, scope: !126)
!130 = !DILocation(line: 79, column: 31, scope: !126)
!131 = !DILocation(line: 79, column: 24, scope: !126)
!132 = !DILocation(line: 80, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !15, line: 80, column: 13)
!134 = !DILocation(line: 80, column: 20, scope: !133)
!135 = !DILocation(line: 80, column: 13, scope: !126)
!136 = !DILocation(line: 80, column: 30, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 80, column: 29)
!138 = !DILocation(line: 82, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !126, file: !15, line: 82, column: 9)
!140 = !DILocation(line: 82, column: 14, scope: !139)
!141 = !DILocation(line: 82, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !15, line: 82, column: 9)
!143 = !DILocation(line: 82, column: 23, scope: !142)
!144 = !DILocation(line: 82, column: 9, scope: !139)
!145 = !DILocation(line: 84, column: 13, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 83, column: 9)
!147 = !DILocation(line: 84, column: 20, scope: !146)
!148 = !DILocation(line: 84, column: 23, scope: !146)
!149 = !DILocation(line: 85, column: 9, scope: !146)
!150 = !DILocation(line: 82, column: 30, scope: !142)
!151 = !DILocation(line: 82, column: 9, scope: !142)
!152 = distinct !{!152, !144, !153, !58}
!153 = !DILocation(line: 85, column: 9, scope: !139)
!154 = !DILocation(line: 87, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !126, file: !15, line: 87, column: 13)
!156 = !DILocation(line: 87, column: 18, scope: !155)
!157 = !DILocation(line: 87, column: 23, scope: !155)
!158 = !DILocation(line: 87, column: 26, scope: !155)
!159 = !DILocation(line: 87, column: 31, scope: !155)
!160 = !DILocation(line: 87, column: 13, scope: !126)
!161 = !DILocation(line: 89, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !155, file: !15, line: 88, column: 9)
!163 = !DILocation(line: 89, column: 20, scope: !162)
!164 = !DILocation(line: 89, column: 26, scope: !162)
!165 = !DILocation(line: 91, column: 19, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !15, line: 91, column: 13)
!167 = !DILocation(line: 91, column: 17, scope: !166)
!168 = !DILocation(line: 91, column: 24, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !15, line: 91, column: 13)
!170 = !DILocation(line: 91, column: 26, scope: !169)
!171 = !DILocation(line: 91, column: 13, scope: !166)
!172 = !DILocation(line: 93, column: 30, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !15, line: 92, column: 13)
!174 = !DILocation(line: 93, column: 37, scope: !173)
!175 = !DILocation(line: 93, column: 17, scope: !173)
!176 = !DILocation(line: 94, column: 13, scope: !173)
!177 = !DILocation(line: 91, column: 33, scope: !169)
!178 = !DILocation(line: 91, column: 13, scope: !169)
!179 = distinct !{!179, !171, !180, !58}
!180 = !DILocation(line: 94, column: 13, scope: !166)
!181 = !DILocation(line: 95, column: 9, scope: !162)
!182 = !DILocation(line: 98, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !155, file: !15, line: 97, column: 9)
!184 = !DILocation(line: 100, column: 14, scope: !126)
!185 = !DILocation(line: 100, column: 9, scope: !126)
!186 = !DILocation(line: 102, column: 1, scope: !113)
!187 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 105, type: !16, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!188 = !DILocalVariable(name: "data", scope: !187, file: !15, line: 107, type: !4)
!189 = !DILocation(line: 107, column: 9, scope: !187)
!190 = !DILocation(line: 109, column: 10, scope: !187)
!191 = !DILocation(line: 110, column: 5, scope: !187)
!192 = !DILabel(scope: !187, name: "source", file: !15, line: 111)
!193 = !DILocation(line: 111, column: 1, scope: !187)
!194 = !DILocation(line: 114, column: 10, scope: !187)
!195 = !DILocation(line: 115, column: 5, scope: !187)
!196 = !DILabel(scope: !187, name: "sink", file: !15, line: 116)
!197 = !DILocation(line: 116, column: 1, scope: !187)
!198 = !DILocalVariable(name: "i", scope: !199, file: !15, line: 118, type: !4)
!199 = distinct !DILexicalBlock(scope: !187, file: !15, line: 117, column: 5)
!200 = !DILocation(line: 118, column: 13, scope: !199)
!201 = !DILocalVariable(name: "buffer", scope: !199, file: !15, line: 119, type: !6)
!202 = !DILocation(line: 119, column: 15, scope: !199)
!203 = !DILocation(line: 119, column: 31, scope: !199)
!204 = !DILocation(line: 119, column: 24, scope: !199)
!205 = !DILocation(line: 120, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !15, line: 120, column: 13)
!207 = !DILocation(line: 120, column: 20, scope: !206)
!208 = !DILocation(line: 120, column: 13, scope: !199)
!209 = !DILocation(line: 120, column: 30, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !15, line: 120, column: 29)
!211 = !DILocation(line: 122, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !199, file: !15, line: 122, column: 9)
!213 = !DILocation(line: 122, column: 14, scope: !212)
!214 = !DILocation(line: 122, column: 21, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !15, line: 122, column: 9)
!216 = !DILocation(line: 122, column: 23, scope: !215)
!217 = !DILocation(line: 122, column: 9, scope: !212)
!218 = !DILocation(line: 124, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !15, line: 123, column: 9)
!220 = !DILocation(line: 124, column: 20, scope: !219)
!221 = !DILocation(line: 124, column: 23, scope: !219)
!222 = !DILocation(line: 125, column: 9, scope: !219)
!223 = !DILocation(line: 122, column: 30, scope: !215)
!224 = !DILocation(line: 122, column: 9, scope: !215)
!225 = distinct !{!225, !217, !226, !58}
!226 = !DILocation(line: 125, column: 9, scope: !212)
!227 = !DILocation(line: 128, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !199, file: !15, line: 128, column: 13)
!229 = !DILocation(line: 128, column: 18, scope: !228)
!230 = !DILocation(line: 128, column: 13, scope: !199)
!231 = !DILocation(line: 130, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !15, line: 129, column: 9)
!233 = !DILocation(line: 130, column: 20, scope: !232)
!234 = !DILocation(line: 130, column: 26, scope: !232)
!235 = !DILocation(line: 132, column: 19, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !15, line: 132, column: 13)
!237 = !DILocation(line: 132, column: 17, scope: !236)
!238 = !DILocation(line: 132, column: 24, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !15, line: 132, column: 13)
!240 = !DILocation(line: 132, column: 26, scope: !239)
!241 = !DILocation(line: 132, column: 13, scope: !236)
!242 = !DILocation(line: 134, column: 30, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 133, column: 13)
!244 = !DILocation(line: 134, column: 37, scope: !243)
!245 = !DILocation(line: 134, column: 17, scope: !243)
!246 = !DILocation(line: 135, column: 13, scope: !243)
!247 = !DILocation(line: 132, column: 33, scope: !239)
!248 = !DILocation(line: 132, column: 13, scope: !239)
!249 = distinct !{!249, !241, !250, !58}
!250 = !DILocation(line: 135, column: 13, scope: !236)
!251 = !DILocation(line: 136, column: 9, scope: !232)
!252 = !DILocation(line: 139, column: 13, scope: !253)
!253 = distinct !DILexicalBlock(scope: !228, file: !15, line: 138, column: 9)
!254 = !DILocation(line: 141, column: 14, scope: !199)
!255 = !DILocation(line: 141, column: 9, scope: !199)
!256 = !DILocation(line: 143, column: 1, scope: !187)
