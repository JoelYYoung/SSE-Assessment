; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %0 = load i32, i32* @staticTrue, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !29
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool1 = icmp ne i32 %1, 0, !dbg !32
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !34

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !39, metadata !DIExpression()), !dbg !40
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !41
  %2 = bitcast i8* %call to i32*, !dbg !42
  store i32* %2, i32** %buffer, align 8, !dbg !40
  %3 = load i32*, i32** %buffer, align 8, !dbg !43
  %cmp = icmp eq i32* %3, null, !dbg !45
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !46

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !47
  unreachable, !dbg !47

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !52
  %cmp5 = icmp slt i32 %4, 10, !dbg !54
  br i1 %cmp5, label %for.body, label %for.end, !dbg !55

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
  %cmp6 = icmp sge i32 %8, 0, !dbg !68
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !69

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !70
  %10 = load i32, i32* %data, align 4, !dbg !72
  %idxprom8 = sext i32 %10 to i64, !dbg !70
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !70
  store i32 1, i32* %arrayidx9, align 4, !dbg !73
  store i32 0, i32* %i, align 4, !dbg !74
  br label %for.cond10, !dbg !76

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !77
  %cmp11 = icmp slt i32 %11, 10, !dbg !79
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !80

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !81
  %13 = load i32, i32* %i, align 4, !dbg !83
  %idxprom13 = sext i32 %13 to i64, !dbg !81
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !81
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !81
  call void @printIntLine(i32 %14), !dbg !84
  br label %for.inc15, !dbg !85

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !86
  %inc16 = add nsw i32 %15, 1, !dbg !86
  store i32 %inc16, i32* %i, align 4, !dbg !86
  br label %for.cond10, !dbg !87, !llvm.loop !88

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !90

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !91
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !93
  %17 = bitcast i32* %16 to i8*, !dbg !93
  call void @free(i8* %17) #5, !dbg !94
  br label %if.end19, !dbg !95

if.end19:                                         ; preds = %if.end18, %if.end
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05_good() #0 !dbg !97 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05_good(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05_bad(), !dbg !120
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !127
  %tobool = icmp ne i32 %0, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !130
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !133
  %tobool1 = icmp ne i32 %1, 0, !dbg !133
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !135

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !136
  br label %if.end21, !dbg !138

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !139, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !143, metadata !DIExpression()), !dbg !144
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !145
  %2 = bitcast i8* %call to i32*, !dbg !146
  store i32* %2, i32** %buffer, align 8, !dbg !144
  %3 = load i32*, i32** %buffer, align 8, !dbg !147
  %cmp = icmp eq i32* %3, null, !dbg !149
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !150

if.then3:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !151
  unreachable, !dbg !151

if.end4:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !156
  %cmp5 = icmp slt i32 %4, 10, !dbg !158
  br i1 %cmp5, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !160
  %6 = load i32, i32* %i, align 4, !dbg !162
  %idxprom = sext i32 %6 to i64, !dbg !160
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !165
  %inc = add nsw i32 %7, 1, !dbg !165
  store i32 %inc, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !169
  %cmp6 = icmp sge i32 %8, 0, !dbg !171
  br i1 %cmp6, label %land.lhs.true, label %if.else19, !dbg !172

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !173
  %cmp7 = icmp slt i32 %9, 10, !dbg !174
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !175

if.then8:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !176
  %11 = load i32, i32* %data, align 4, !dbg !178
  %idxprom9 = sext i32 %11 to i64, !dbg !176
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !176
  store i32 1, i32* %arrayidx10, align 4, !dbg !179
  store i32 0, i32* %i, align 4, !dbg !180
  br label %for.cond11, !dbg !182

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %12 = load i32, i32* %i, align 4, !dbg !183
  %cmp12 = icmp slt i32 %12, 10, !dbg !185
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !186

for.body13:                                       ; preds = %for.cond11
  %13 = load i32*, i32** %buffer, align 8, !dbg !187
  %14 = load i32, i32* %i, align 4, !dbg !189
  %idxprom14 = sext i32 %14 to i64, !dbg !187
  %arrayidx15 = getelementptr inbounds i32, i32* %13, i64 %idxprom14, !dbg !187
  %15 = load i32, i32* %arrayidx15, align 4, !dbg !187
  call void @printIntLine(i32 %15), !dbg !190
  br label %for.inc16, !dbg !191

for.inc16:                                        ; preds = %for.body13
  %16 = load i32, i32* %i, align 4, !dbg !192
  %inc17 = add nsw i32 %16, 1, !dbg !192
  store i32 %inc17, i32* %i, align 4, !dbg !192
  br label %for.cond11, !dbg !193, !llvm.loop !194

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !196

if.else19:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !197
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %17 = load i32*, i32** %buffer, align 8, !dbg !199
  %18 = bitcast i32* %17 to i8*, !dbg !199
  call void @free(i8* %18) #5, !dbg !200
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then2
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !202 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !203, metadata !DIExpression()), !dbg !204
  store i32 -1, i32* %data, align 4, !dbg !205
  %0 = load i32, i32* @staticTrue, align 4, !dbg !206
  %tobool = icmp ne i32 %0, 0, !dbg !206
  br i1 %tobool, label %if.then, label %if.end, !dbg !208

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !209
  br label %if.end, !dbg !211

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !212
  %tobool1 = icmp ne i32 %1, 0, !dbg !212
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !214

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !215, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !219, metadata !DIExpression()), !dbg !220
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !221
  %2 = bitcast i8* %call to i32*, !dbg !222
  store i32* %2, i32** %buffer, align 8, !dbg !220
  %3 = load i32*, i32** %buffer, align 8, !dbg !223
  %cmp = icmp eq i32* %3, null, !dbg !225
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !226

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !227
  unreachable, !dbg !227

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !229
  br label %for.cond, !dbg !231

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !232
  %cmp5 = icmp slt i32 %4, 10, !dbg !234
  br i1 %cmp5, label %for.body, label %for.end, !dbg !235

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !236
  %6 = load i32, i32* %i, align 4, !dbg !238
  %idxprom = sext i32 %6 to i64, !dbg !236
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !236
  store i32 0, i32* %arrayidx, align 4, !dbg !239
  br label %for.inc, !dbg !240

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !241
  %inc = add nsw i32 %7, 1, !dbg !241
  store i32 %inc, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !242, !llvm.loop !243

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !245
  %cmp6 = icmp sge i32 %8, 0, !dbg !247
  br i1 %cmp6, label %land.lhs.true, label %if.else, !dbg !248

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !249
  %cmp7 = icmp slt i32 %9, 10, !dbg !250
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !251

if.then8:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !252
  %11 = load i32, i32* %data, align 4, !dbg !254
  %idxprom9 = sext i32 %11 to i64, !dbg !252
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !252
  store i32 1, i32* %arrayidx10, align 4, !dbg !255
  store i32 0, i32* %i, align 4, !dbg !256
  br label %for.cond11, !dbg !258

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %12 = load i32, i32* %i, align 4, !dbg !259
  %cmp12 = icmp slt i32 %12, 10, !dbg !261
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !262

for.body13:                                       ; preds = %for.cond11
  %13 = load i32*, i32** %buffer, align 8, !dbg !263
  %14 = load i32, i32* %i, align 4, !dbg !265
  %idxprom14 = sext i32 %14 to i64, !dbg !263
  %arrayidx15 = getelementptr inbounds i32, i32* %13, i64 %idxprom14, !dbg !263
  %15 = load i32, i32* %arrayidx15, align 4, !dbg !263
  call void @printIntLine(i32 %15), !dbg !266
  br label %for.inc16, !dbg !267

for.inc16:                                        ; preds = %for.body13
  %16 = load i32, i32* %i, align 4, !dbg !268
  %inc17 = add nsw i32 %16, 1, !dbg !268
  store i32 %inc17, i32* %i, align 4, !dbg !268
  br label %for.cond11, !dbg !269, !llvm.loop !270

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !272

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !273
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %17 = load i32*, i32** %buffer, align 8, !dbg !275
  %18 = bitcast i32* %17 to i8*, !dbg !275
  call void @free(i8* %18) #5, !dbg !276
  br label %if.end20, !dbg !277

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !278
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !279 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !280, metadata !DIExpression()), !dbg !281
  store i32 -1, i32* %data, align 4, !dbg !282
  %0 = load i32, i32* @staticFalse, align 4, !dbg !283
  %tobool = icmp ne i32 %0, 0, !dbg !283
  br i1 %tobool, label %if.then, label %if.else, !dbg !285

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !286
  br label %if.end, !dbg !288

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !289
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !291
  %tobool1 = icmp ne i32 %1, 0, !dbg !291
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !293

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !294, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !298, metadata !DIExpression()), !dbg !299
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !300
  %2 = bitcast i8* %call to i32*, !dbg !301
  store i32* %2, i32** %buffer, align 8, !dbg !299
  %3 = load i32*, i32** %buffer, align 8, !dbg !302
  %cmp = icmp eq i32* %3, null, !dbg !304
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !305

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !306
  unreachable, !dbg !306

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !308
  br label %for.cond, !dbg !310

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !311
  %cmp5 = icmp slt i32 %4, 10, !dbg !313
  br i1 %cmp5, label %for.body, label %for.end, !dbg !314

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !315
  %6 = load i32, i32* %i, align 4, !dbg !317
  %idxprom = sext i32 %6 to i64, !dbg !315
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !315
  store i32 0, i32* %arrayidx, align 4, !dbg !318
  br label %for.inc, !dbg !319

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !320
  %inc = add nsw i32 %7, 1, !dbg !320
  store i32 %inc, i32* %i, align 4, !dbg !320
  br label %for.cond, !dbg !321, !llvm.loop !322

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !324
  %cmp6 = icmp sge i32 %8, 0, !dbg !326
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !327

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !328
  %10 = load i32, i32* %data, align 4, !dbg !330
  %idxprom8 = sext i32 %10 to i64, !dbg !328
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !328
  store i32 1, i32* %arrayidx9, align 4, !dbg !331
  store i32 0, i32* %i, align 4, !dbg !332
  br label %for.cond10, !dbg !334

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !335
  %cmp11 = icmp slt i32 %11, 10, !dbg !337
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !338

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !339
  %13 = load i32, i32* %i, align 4, !dbg !341
  %idxprom13 = sext i32 %13 to i64, !dbg !339
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !339
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !339
  call void @printIntLine(i32 %14), !dbg !342
  br label %for.inc15, !dbg !343

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !344
  %inc16 = add nsw i32 %15, 1, !dbg !344
  store i32 %inc16, i32* %i, align 4, !dbg !344
  br label %for.cond10, !dbg !345, !llvm.loop !346

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !348

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !349
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !351
  %17 = bitcast i32* %16 to i8*, !dbg !351
  call void @free(i8* %17) #5, !dbg !352
  br label %if.end20, !dbg !353

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !354
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !355 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !356, metadata !DIExpression()), !dbg !357
  store i32 -1, i32* %data, align 4, !dbg !358
  %0 = load i32, i32* @staticTrue, align 4, !dbg !359
  %tobool = icmp ne i32 %0, 0, !dbg !359
  br i1 %tobool, label %if.then, label %if.end, !dbg !361

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !362
  br label %if.end, !dbg !364

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !365
  %tobool1 = icmp ne i32 %1, 0, !dbg !365
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !367

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !368, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !372, metadata !DIExpression()), !dbg !373
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !374
  %2 = bitcast i8* %call to i32*, !dbg !375
  store i32* %2, i32** %buffer, align 8, !dbg !373
  %3 = load i32*, i32** %buffer, align 8, !dbg !376
  %cmp = icmp eq i32* %3, null, !dbg !378
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !379

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !380
  unreachable, !dbg !380

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !382
  br label %for.cond, !dbg !384

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !385
  %cmp5 = icmp slt i32 %4, 10, !dbg !387
  br i1 %cmp5, label %for.body, label %for.end, !dbg !388

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !389
  %6 = load i32, i32* %i, align 4, !dbg !391
  %idxprom = sext i32 %6 to i64, !dbg !389
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !389
  store i32 0, i32* %arrayidx, align 4, !dbg !392
  br label %for.inc, !dbg !393

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !394
  %inc = add nsw i32 %7, 1, !dbg !394
  store i32 %inc, i32* %i, align 4, !dbg !394
  br label %for.cond, !dbg !395, !llvm.loop !396

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !398
  %cmp6 = icmp sge i32 %8, 0, !dbg !400
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !401

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !402
  %10 = load i32, i32* %data, align 4, !dbg !404
  %idxprom8 = sext i32 %10 to i64, !dbg !402
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !402
  store i32 1, i32* %arrayidx9, align 4, !dbg !405
  store i32 0, i32* %i, align 4, !dbg !406
  br label %for.cond10, !dbg !408

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !409
  %cmp11 = icmp slt i32 %11, 10, !dbg !411
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !412

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !413
  %13 = load i32, i32* %i, align 4, !dbg !415
  %idxprom13 = sext i32 %13 to i64, !dbg !413
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !413
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !413
  call void @printIntLine(i32 %14), !dbg !416
  br label %for.inc15, !dbg !417

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !418
  %inc16 = add nsw i32 %15, 1, !dbg !418
  store i32 %inc16, i32* %i, align 4, !dbg !418
  br label %for.cond10, !dbg !419, !llvm.loop !420

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !422

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !423
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !425
  %17 = bitcast i32* %16 to i8*, !dbg !425
  call void @free(i8* %17) #5, !dbg !426
  br label %if.end19, !dbg !427

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !428
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 24, type: !7, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05_bad", scope: !13, file: !13, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 30, type: !7)
!24 = !DILocation(line: 30, column: 9, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 8, scope: !20)
!29 = !DILocation(line: 36, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!31 = !DILocation(line: 37, column: 5, scope: !30)
!32 = !DILocation(line: 38, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !20, file: !13, line: 38, column: 8)
!34 = !DILocation(line: 38, column: 8, scope: !20)
!35 = !DILocalVariable(name: "i", scope: !36, file: !13, line: 41, type: !7)
!36 = distinct !DILexicalBlock(scope: !37, file: !13, line: 40, column: 9)
!37 = distinct !DILexicalBlock(scope: !33, file: !13, line: 39, column: 5)
!38 = !DILocation(line: 41, column: 17, scope: !36)
!39 = !DILocalVariable(name: "buffer", scope: !36, file: !13, line: 42, type: !6)
!40 = !DILocation(line: 42, column: 19, scope: !36)
!41 = !DILocation(line: 42, column: 35, scope: !36)
!42 = !DILocation(line: 42, column: 28, scope: !36)
!43 = !DILocation(line: 43, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !36, file: !13, line: 43, column: 17)
!45 = !DILocation(line: 43, column: 24, scope: !44)
!46 = !DILocation(line: 43, column: 17, scope: !36)
!47 = !DILocation(line: 43, column: 34, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !13, line: 43, column: 33)
!49 = !DILocation(line: 45, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !36, file: !13, line: 45, column: 13)
!51 = !DILocation(line: 45, column: 18, scope: !50)
!52 = !DILocation(line: 45, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !13, line: 45, column: 13)
!54 = !DILocation(line: 45, column: 27, scope: !53)
!55 = !DILocation(line: 45, column: 13, scope: !50)
!56 = !DILocation(line: 47, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !13, line: 46, column: 13)
!58 = !DILocation(line: 47, column: 24, scope: !57)
!59 = !DILocation(line: 47, column: 27, scope: !57)
!60 = !DILocation(line: 48, column: 13, scope: !57)
!61 = !DILocation(line: 45, column: 34, scope: !53)
!62 = !DILocation(line: 45, column: 13, scope: !53)
!63 = distinct !{!63, !55, !64, !65}
!64 = !DILocation(line: 48, column: 13, scope: !50)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 51, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !36, file: !13, line: 51, column: 17)
!68 = !DILocation(line: 51, column: 22, scope: !67)
!69 = !DILocation(line: 51, column: 17, scope: !36)
!70 = !DILocation(line: 53, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !13, line: 52, column: 13)
!72 = !DILocation(line: 53, column: 24, scope: !71)
!73 = !DILocation(line: 53, column: 30, scope: !71)
!74 = !DILocation(line: 55, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !13, line: 55, column: 17)
!76 = !DILocation(line: 55, column: 21, scope: !75)
!77 = !DILocation(line: 55, column: 28, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !13, line: 55, column: 17)
!79 = !DILocation(line: 55, column: 30, scope: !78)
!80 = !DILocation(line: 55, column: 17, scope: !75)
!81 = !DILocation(line: 57, column: 34, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !13, line: 56, column: 17)
!83 = !DILocation(line: 57, column: 41, scope: !82)
!84 = !DILocation(line: 57, column: 21, scope: !82)
!85 = !DILocation(line: 58, column: 17, scope: !82)
!86 = !DILocation(line: 55, column: 37, scope: !78)
!87 = !DILocation(line: 55, column: 17, scope: !78)
!88 = distinct !{!88, !80, !89, !65}
!89 = !DILocation(line: 58, column: 17, scope: !75)
!90 = !DILocation(line: 59, column: 13, scope: !71)
!91 = !DILocation(line: 62, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !67, file: !13, line: 61, column: 13)
!93 = !DILocation(line: 64, column: 18, scope: !36)
!94 = !DILocation(line: 64, column: 13, scope: !36)
!95 = !DILocation(line: 66, column: 5, scope: !37)
!96 = !DILocation(line: 67, column: 1, scope: !20)
!97 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_05_good", scope: !13, file: !13, line: 251, type: !21, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocation(line: 253, column: 5, scope: !97)
!99 = !DILocation(line: 254, column: 5, scope: !97)
!100 = !DILocation(line: 255, column: 5, scope: !97)
!101 = !DILocation(line: 256, column: 5, scope: !97)
!102 = !DILocation(line: 257, column: 1, scope: !97)
!103 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 268, type: !104, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DISubroutineType(types: !105)
!105 = !{!7, !7, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!109 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !13, line: 268, type: !7)
!110 = !DILocation(line: 268, column: 14, scope: !103)
!111 = !DILocalVariable(name: "argv", arg: 2, scope: !103, file: !13, line: 268, type: !106)
!112 = !DILocation(line: 268, column: 27, scope: !103)
!113 = !DILocation(line: 271, column: 22, scope: !103)
!114 = !DILocation(line: 271, column: 12, scope: !103)
!115 = !DILocation(line: 271, column: 5, scope: !103)
!116 = !DILocation(line: 273, column: 5, scope: !103)
!117 = !DILocation(line: 274, column: 5, scope: !103)
!118 = !DILocation(line: 275, column: 5, scope: !103)
!119 = !DILocation(line: 278, column: 5, scope: !103)
!120 = !DILocation(line: 279, column: 5, scope: !103)
!121 = !DILocation(line: 280, column: 5, scope: !103)
!122 = !DILocation(line: 282, column: 5, scope: !103)
!123 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 74, type: !21, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !13, line: 76, type: !7)
!125 = !DILocation(line: 76, column: 9, scope: !123)
!126 = !DILocation(line: 78, column: 10, scope: !123)
!127 = !DILocation(line: 79, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !13, line: 79, column: 8)
!129 = !DILocation(line: 79, column: 8, scope: !123)
!130 = !DILocation(line: 82, column: 14, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !13, line: 80, column: 5)
!132 = !DILocation(line: 83, column: 5, scope: !131)
!133 = !DILocation(line: 84, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !123, file: !13, line: 84, column: 8)
!135 = !DILocation(line: 84, column: 8, scope: !123)
!136 = !DILocation(line: 87, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !13, line: 85, column: 5)
!138 = !DILocation(line: 88, column: 5, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !13, line: 92, type: !7)
!140 = distinct !DILexicalBlock(scope: !141, file: !13, line: 91, column: 9)
!141 = distinct !DILexicalBlock(scope: !134, file: !13, line: 90, column: 5)
!142 = !DILocation(line: 92, column: 17, scope: !140)
!143 = !DILocalVariable(name: "buffer", scope: !140, file: !13, line: 93, type: !6)
!144 = !DILocation(line: 93, column: 19, scope: !140)
!145 = !DILocation(line: 93, column: 35, scope: !140)
!146 = !DILocation(line: 93, column: 28, scope: !140)
!147 = !DILocation(line: 94, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !140, file: !13, line: 94, column: 17)
!149 = !DILocation(line: 94, column: 24, scope: !148)
!150 = !DILocation(line: 94, column: 17, scope: !140)
!151 = !DILocation(line: 94, column: 34, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !13, line: 94, column: 33)
!153 = !DILocation(line: 96, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !140, file: !13, line: 96, column: 13)
!155 = !DILocation(line: 96, column: 18, scope: !154)
!156 = !DILocation(line: 96, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !13, line: 96, column: 13)
!158 = !DILocation(line: 96, column: 27, scope: !157)
!159 = !DILocation(line: 96, column: 13, scope: !154)
!160 = !DILocation(line: 98, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 97, column: 13)
!162 = !DILocation(line: 98, column: 24, scope: !161)
!163 = !DILocation(line: 98, column: 27, scope: !161)
!164 = !DILocation(line: 99, column: 13, scope: !161)
!165 = !DILocation(line: 96, column: 34, scope: !157)
!166 = !DILocation(line: 96, column: 13, scope: !157)
!167 = distinct !{!167, !159, !168, !65}
!168 = !DILocation(line: 99, column: 13, scope: !154)
!169 = !DILocation(line: 101, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !140, file: !13, line: 101, column: 17)
!171 = !DILocation(line: 101, column: 22, scope: !170)
!172 = !DILocation(line: 101, column: 27, scope: !170)
!173 = !DILocation(line: 101, column: 30, scope: !170)
!174 = !DILocation(line: 101, column: 35, scope: !170)
!175 = !DILocation(line: 101, column: 17, scope: !140)
!176 = !DILocation(line: 103, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !13, line: 102, column: 13)
!178 = !DILocation(line: 103, column: 24, scope: !177)
!179 = !DILocation(line: 103, column: 30, scope: !177)
!180 = !DILocation(line: 105, column: 23, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !13, line: 105, column: 17)
!182 = !DILocation(line: 105, column: 21, scope: !181)
!183 = !DILocation(line: 105, column: 28, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !13, line: 105, column: 17)
!185 = !DILocation(line: 105, column: 30, scope: !184)
!186 = !DILocation(line: 105, column: 17, scope: !181)
!187 = !DILocation(line: 107, column: 34, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !13, line: 106, column: 17)
!189 = !DILocation(line: 107, column: 41, scope: !188)
!190 = !DILocation(line: 107, column: 21, scope: !188)
!191 = !DILocation(line: 108, column: 17, scope: !188)
!192 = !DILocation(line: 105, column: 37, scope: !184)
!193 = !DILocation(line: 105, column: 17, scope: !184)
!194 = distinct !{!194, !186, !195, !65}
!195 = !DILocation(line: 108, column: 17, scope: !181)
!196 = !DILocation(line: 109, column: 13, scope: !177)
!197 = !DILocation(line: 112, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !170, file: !13, line: 111, column: 13)
!199 = !DILocation(line: 114, column: 18, scope: !140)
!200 = !DILocation(line: 114, column: 13, scope: !140)
!201 = !DILocation(line: 117, column: 1, scope: !123)
!202 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 120, type: !21, scopeLine: 121, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!203 = !DILocalVariable(name: "data", scope: !202, file: !13, line: 122, type: !7)
!204 = !DILocation(line: 122, column: 9, scope: !202)
!205 = !DILocation(line: 124, column: 10, scope: !202)
!206 = !DILocation(line: 125, column: 8, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !13, line: 125, column: 8)
!208 = !DILocation(line: 125, column: 8, scope: !202)
!209 = !DILocation(line: 128, column: 14, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !13, line: 126, column: 5)
!211 = !DILocation(line: 129, column: 5, scope: !210)
!212 = !DILocation(line: 130, column: 8, scope: !213)
!213 = distinct !DILexicalBlock(scope: !202, file: !13, line: 130, column: 8)
!214 = !DILocation(line: 130, column: 8, scope: !202)
!215 = !DILocalVariable(name: "i", scope: !216, file: !13, line: 133, type: !7)
!216 = distinct !DILexicalBlock(scope: !217, file: !13, line: 132, column: 9)
!217 = distinct !DILexicalBlock(scope: !213, file: !13, line: 131, column: 5)
!218 = !DILocation(line: 133, column: 17, scope: !216)
!219 = !DILocalVariable(name: "buffer", scope: !216, file: !13, line: 134, type: !6)
!220 = !DILocation(line: 134, column: 19, scope: !216)
!221 = !DILocation(line: 134, column: 35, scope: !216)
!222 = !DILocation(line: 134, column: 28, scope: !216)
!223 = !DILocation(line: 135, column: 17, scope: !224)
!224 = distinct !DILexicalBlock(scope: !216, file: !13, line: 135, column: 17)
!225 = !DILocation(line: 135, column: 24, scope: !224)
!226 = !DILocation(line: 135, column: 17, scope: !216)
!227 = !DILocation(line: 135, column: 34, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !13, line: 135, column: 33)
!229 = !DILocation(line: 137, column: 20, scope: !230)
!230 = distinct !DILexicalBlock(scope: !216, file: !13, line: 137, column: 13)
!231 = !DILocation(line: 137, column: 18, scope: !230)
!232 = !DILocation(line: 137, column: 25, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !13, line: 137, column: 13)
!234 = !DILocation(line: 137, column: 27, scope: !233)
!235 = !DILocation(line: 137, column: 13, scope: !230)
!236 = !DILocation(line: 139, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !13, line: 138, column: 13)
!238 = !DILocation(line: 139, column: 24, scope: !237)
!239 = !DILocation(line: 139, column: 27, scope: !237)
!240 = !DILocation(line: 140, column: 13, scope: !237)
!241 = !DILocation(line: 137, column: 34, scope: !233)
!242 = !DILocation(line: 137, column: 13, scope: !233)
!243 = distinct !{!243, !235, !244, !65}
!244 = !DILocation(line: 140, column: 13, scope: !230)
!245 = !DILocation(line: 142, column: 17, scope: !246)
!246 = distinct !DILexicalBlock(scope: !216, file: !13, line: 142, column: 17)
!247 = !DILocation(line: 142, column: 22, scope: !246)
!248 = !DILocation(line: 142, column: 27, scope: !246)
!249 = !DILocation(line: 142, column: 30, scope: !246)
!250 = !DILocation(line: 142, column: 35, scope: !246)
!251 = !DILocation(line: 142, column: 17, scope: !216)
!252 = !DILocation(line: 144, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !246, file: !13, line: 143, column: 13)
!254 = !DILocation(line: 144, column: 24, scope: !253)
!255 = !DILocation(line: 144, column: 30, scope: !253)
!256 = !DILocation(line: 146, column: 23, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !13, line: 146, column: 17)
!258 = !DILocation(line: 146, column: 21, scope: !257)
!259 = !DILocation(line: 146, column: 28, scope: !260)
!260 = distinct !DILexicalBlock(scope: !257, file: !13, line: 146, column: 17)
!261 = !DILocation(line: 146, column: 30, scope: !260)
!262 = !DILocation(line: 146, column: 17, scope: !257)
!263 = !DILocation(line: 148, column: 34, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !13, line: 147, column: 17)
!265 = !DILocation(line: 148, column: 41, scope: !264)
!266 = !DILocation(line: 148, column: 21, scope: !264)
!267 = !DILocation(line: 149, column: 17, scope: !264)
!268 = !DILocation(line: 146, column: 37, scope: !260)
!269 = !DILocation(line: 146, column: 17, scope: !260)
!270 = distinct !{!270, !262, !271, !65}
!271 = !DILocation(line: 149, column: 17, scope: !257)
!272 = !DILocation(line: 150, column: 13, scope: !253)
!273 = !DILocation(line: 153, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !246, file: !13, line: 152, column: 13)
!275 = !DILocation(line: 155, column: 18, scope: !216)
!276 = !DILocation(line: 155, column: 13, scope: !216)
!277 = !DILocation(line: 157, column: 5, scope: !217)
!278 = !DILocation(line: 158, column: 1, scope: !202)
!279 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 161, type: !21, scopeLine: 162, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!280 = !DILocalVariable(name: "data", scope: !279, file: !13, line: 163, type: !7)
!281 = !DILocation(line: 163, column: 9, scope: !279)
!282 = !DILocation(line: 165, column: 10, scope: !279)
!283 = !DILocation(line: 166, column: 8, scope: !284)
!284 = distinct !DILexicalBlock(scope: !279, file: !13, line: 166, column: 8)
!285 = !DILocation(line: 166, column: 8, scope: !279)
!286 = !DILocation(line: 169, column: 9, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !13, line: 167, column: 5)
!288 = !DILocation(line: 170, column: 5, scope: !287)
!289 = !DILocation(line: 175, column: 14, scope: !290)
!290 = distinct !DILexicalBlock(scope: !284, file: !13, line: 172, column: 5)
!291 = !DILocation(line: 177, column: 8, scope: !292)
!292 = distinct !DILexicalBlock(scope: !279, file: !13, line: 177, column: 8)
!293 = !DILocation(line: 177, column: 8, scope: !279)
!294 = !DILocalVariable(name: "i", scope: !295, file: !13, line: 180, type: !7)
!295 = distinct !DILexicalBlock(scope: !296, file: !13, line: 179, column: 9)
!296 = distinct !DILexicalBlock(scope: !292, file: !13, line: 178, column: 5)
!297 = !DILocation(line: 180, column: 17, scope: !295)
!298 = !DILocalVariable(name: "buffer", scope: !295, file: !13, line: 181, type: !6)
!299 = !DILocation(line: 181, column: 19, scope: !295)
!300 = !DILocation(line: 181, column: 35, scope: !295)
!301 = !DILocation(line: 181, column: 28, scope: !295)
!302 = !DILocation(line: 182, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !295, file: !13, line: 182, column: 17)
!304 = !DILocation(line: 182, column: 24, scope: !303)
!305 = !DILocation(line: 182, column: 17, scope: !295)
!306 = !DILocation(line: 182, column: 34, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !13, line: 182, column: 33)
!308 = !DILocation(line: 184, column: 20, scope: !309)
!309 = distinct !DILexicalBlock(scope: !295, file: !13, line: 184, column: 13)
!310 = !DILocation(line: 184, column: 18, scope: !309)
!311 = !DILocation(line: 184, column: 25, scope: !312)
!312 = distinct !DILexicalBlock(scope: !309, file: !13, line: 184, column: 13)
!313 = !DILocation(line: 184, column: 27, scope: !312)
!314 = !DILocation(line: 184, column: 13, scope: !309)
!315 = !DILocation(line: 186, column: 17, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !13, line: 185, column: 13)
!317 = !DILocation(line: 186, column: 24, scope: !316)
!318 = !DILocation(line: 186, column: 27, scope: !316)
!319 = !DILocation(line: 187, column: 13, scope: !316)
!320 = !DILocation(line: 184, column: 34, scope: !312)
!321 = !DILocation(line: 184, column: 13, scope: !312)
!322 = distinct !{!322, !314, !323, !65}
!323 = !DILocation(line: 187, column: 13, scope: !309)
!324 = !DILocation(line: 190, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !295, file: !13, line: 190, column: 17)
!326 = !DILocation(line: 190, column: 22, scope: !325)
!327 = !DILocation(line: 190, column: 17, scope: !295)
!328 = !DILocation(line: 192, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !13, line: 191, column: 13)
!330 = !DILocation(line: 192, column: 24, scope: !329)
!331 = !DILocation(line: 192, column: 30, scope: !329)
!332 = !DILocation(line: 194, column: 23, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !13, line: 194, column: 17)
!334 = !DILocation(line: 194, column: 21, scope: !333)
!335 = !DILocation(line: 194, column: 28, scope: !336)
!336 = distinct !DILexicalBlock(scope: !333, file: !13, line: 194, column: 17)
!337 = !DILocation(line: 194, column: 30, scope: !336)
!338 = !DILocation(line: 194, column: 17, scope: !333)
!339 = !DILocation(line: 196, column: 34, scope: !340)
!340 = distinct !DILexicalBlock(scope: !336, file: !13, line: 195, column: 17)
!341 = !DILocation(line: 196, column: 41, scope: !340)
!342 = !DILocation(line: 196, column: 21, scope: !340)
!343 = !DILocation(line: 197, column: 17, scope: !340)
!344 = !DILocation(line: 194, column: 37, scope: !336)
!345 = !DILocation(line: 194, column: 17, scope: !336)
!346 = distinct !{!346, !338, !347, !65}
!347 = !DILocation(line: 197, column: 17, scope: !333)
!348 = !DILocation(line: 198, column: 13, scope: !329)
!349 = !DILocation(line: 201, column: 17, scope: !350)
!350 = distinct !DILexicalBlock(scope: !325, file: !13, line: 200, column: 13)
!351 = !DILocation(line: 203, column: 18, scope: !295)
!352 = !DILocation(line: 203, column: 13, scope: !295)
!353 = !DILocation(line: 205, column: 5, scope: !296)
!354 = !DILocation(line: 206, column: 1, scope: !279)
!355 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 209, type: !21, scopeLine: 210, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!356 = !DILocalVariable(name: "data", scope: !355, file: !13, line: 211, type: !7)
!357 = !DILocation(line: 211, column: 9, scope: !355)
!358 = !DILocation(line: 213, column: 10, scope: !355)
!359 = !DILocation(line: 214, column: 8, scope: !360)
!360 = distinct !DILexicalBlock(scope: !355, file: !13, line: 214, column: 8)
!361 = !DILocation(line: 214, column: 8, scope: !355)
!362 = !DILocation(line: 218, column: 14, scope: !363)
!363 = distinct !DILexicalBlock(scope: !360, file: !13, line: 215, column: 5)
!364 = !DILocation(line: 219, column: 5, scope: !363)
!365 = !DILocation(line: 220, column: 8, scope: !366)
!366 = distinct !DILexicalBlock(scope: !355, file: !13, line: 220, column: 8)
!367 = !DILocation(line: 220, column: 8, scope: !355)
!368 = !DILocalVariable(name: "i", scope: !369, file: !13, line: 223, type: !7)
!369 = distinct !DILexicalBlock(scope: !370, file: !13, line: 222, column: 9)
!370 = distinct !DILexicalBlock(scope: !366, file: !13, line: 221, column: 5)
!371 = !DILocation(line: 223, column: 17, scope: !369)
!372 = !DILocalVariable(name: "buffer", scope: !369, file: !13, line: 224, type: !6)
!373 = !DILocation(line: 224, column: 19, scope: !369)
!374 = !DILocation(line: 224, column: 35, scope: !369)
!375 = !DILocation(line: 224, column: 28, scope: !369)
!376 = !DILocation(line: 225, column: 17, scope: !377)
!377 = distinct !DILexicalBlock(scope: !369, file: !13, line: 225, column: 17)
!378 = !DILocation(line: 225, column: 24, scope: !377)
!379 = !DILocation(line: 225, column: 17, scope: !369)
!380 = !DILocation(line: 225, column: 34, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !13, line: 225, column: 33)
!382 = !DILocation(line: 227, column: 20, scope: !383)
!383 = distinct !DILexicalBlock(scope: !369, file: !13, line: 227, column: 13)
!384 = !DILocation(line: 227, column: 18, scope: !383)
!385 = !DILocation(line: 227, column: 25, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !13, line: 227, column: 13)
!387 = !DILocation(line: 227, column: 27, scope: !386)
!388 = !DILocation(line: 227, column: 13, scope: !383)
!389 = !DILocation(line: 229, column: 17, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !13, line: 228, column: 13)
!391 = !DILocation(line: 229, column: 24, scope: !390)
!392 = !DILocation(line: 229, column: 27, scope: !390)
!393 = !DILocation(line: 230, column: 13, scope: !390)
!394 = !DILocation(line: 227, column: 34, scope: !386)
!395 = !DILocation(line: 227, column: 13, scope: !386)
!396 = distinct !{!396, !388, !397, !65}
!397 = !DILocation(line: 230, column: 13, scope: !383)
!398 = !DILocation(line: 233, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !369, file: !13, line: 233, column: 17)
!400 = !DILocation(line: 233, column: 22, scope: !399)
!401 = !DILocation(line: 233, column: 17, scope: !369)
!402 = !DILocation(line: 235, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !13, line: 234, column: 13)
!404 = !DILocation(line: 235, column: 24, scope: !403)
!405 = !DILocation(line: 235, column: 30, scope: !403)
!406 = !DILocation(line: 237, column: 23, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !13, line: 237, column: 17)
!408 = !DILocation(line: 237, column: 21, scope: !407)
!409 = !DILocation(line: 237, column: 28, scope: !410)
!410 = distinct !DILexicalBlock(scope: !407, file: !13, line: 237, column: 17)
!411 = !DILocation(line: 237, column: 30, scope: !410)
!412 = !DILocation(line: 237, column: 17, scope: !407)
!413 = !DILocation(line: 239, column: 34, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !13, line: 238, column: 17)
!415 = !DILocation(line: 239, column: 41, scope: !414)
!416 = !DILocation(line: 239, column: 21, scope: !414)
!417 = !DILocation(line: 240, column: 17, scope: !414)
!418 = !DILocation(line: 237, column: 37, scope: !410)
!419 = !DILocation(line: 237, column: 17, scope: !410)
!420 = distinct !{!420, !412, !421, !65}
!421 = !DILocation(line: 240, column: 17, scope: !407)
!422 = !DILocation(line: 241, column: 13, scope: !403)
!423 = !DILocation(line: 244, column: 17, scope: !424)
!424 = distinct !DILexicalBlock(scope: !399, file: !13, line: 243, column: 13)
!425 = !DILocation(line: 246, column: 18, scope: !369)
!426 = !DILocation(line: 246, column: 13, scope: !369)
!427 = !DILocation(line: 248, column: 5, scope: !370)
!428 = !DILocation(line: 249, column: 1, scope: !355)
