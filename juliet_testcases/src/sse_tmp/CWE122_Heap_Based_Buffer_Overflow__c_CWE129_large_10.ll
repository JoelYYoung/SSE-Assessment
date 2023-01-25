; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* @globalTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !24
  br label %if.end, !dbg !26

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool1 = icmp ne i32 %1, 0, !dbg !27
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !29

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !34, metadata !DIExpression()), !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !36
  %2 = bitcast i8* %call to i32*, !dbg !37
  store i32* %2, i32** %buffer, align 8, !dbg !35
  %3 = load i32*, i32** %buffer, align 8, !dbg !38
  %cmp = icmp eq i32* %3, null, !dbg !40
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !41

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !47
  %cmp5 = icmp slt i32 %4, 10, !dbg !49
  br i1 %cmp5, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !51
  %6 = load i32, i32* %i, align 4, !dbg !53
  %idxprom = sext i32 %6 to i64, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !56
  %inc = add nsw i32 %7, 1, !dbg !56
  store i32 %inc, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !61
  %cmp6 = icmp sge i32 %8, 0, !dbg !63
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !64

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !65
  %10 = load i32, i32* %data, align 4, !dbg !67
  %idxprom8 = sext i32 %10 to i64, !dbg !65
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !65
  store i32 1, i32* %arrayidx9, align 4, !dbg !68
  store i32 0, i32* %i, align 4, !dbg !69
  br label %for.cond10, !dbg !71

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !72
  %cmp11 = icmp slt i32 %11, 10, !dbg !74
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !75

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !76
  %13 = load i32, i32* %i, align 4, !dbg !78
  %idxprom13 = sext i32 %13 to i64, !dbg !76
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !76
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !76
  call void @printIntLine(i32 %14), !dbg !79
  br label %for.inc15, !dbg !80

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !81
  %inc16 = add nsw i32 %15, 1, !dbg !81
  store i32 %inc16, i32* %i, align 4, !dbg !81
  br label %for.cond10, !dbg !82, !llvm.loop !83

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !85

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !86
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !88
  %17 = bitcast i32* %16 to i8*, !dbg !88
  call void @free(i8* %17) #5, !dbg !89
  br label %if.end19, !dbg !90

if.end19:                                         ; preds = %if.end18, %if.end
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10_good() #0 !dbg !92 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !118 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i32 -1, i32* %data, align 4, !dbg !121
  %0 = load i32, i32* @globalTrue, align 4, !dbg !122
  %tobool = icmp ne i32 %0, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !125
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFalse, align 4, !dbg !128
  %tobool1 = icmp ne i32 %1, 0, !dbg !128
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !130

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !131
  br label %if.end21, !dbg !133

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !134, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !138, metadata !DIExpression()), !dbg !139
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !140
  %2 = bitcast i8* %call to i32*, !dbg !141
  store i32* %2, i32** %buffer, align 8, !dbg !139
  %3 = load i32*, i32** %buffer, align 8, !dbg !142
  %cmp = icmp eq i32* %3, null, !dbg !144
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !145

if.then3:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !146
  unreachable, !dbg !146

if.end4:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !151
  %cmp5 = icmp slt i32 %4, 10, !dbg !153
  br i1 %cmp5, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !155
  %6 = load i32, i32* %i, align 4, !dbg !157
  %idxprom = sext i32 %6 to i64, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !160
  %inc = add nsw i32 %7, 1, !dbg !160
  store i32 %inc, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !164
  %cmp6 = icmp sge i32 %8, 0, !dbg !166
  br i1 %cmp6, label %land.lhs.true, label %if.else19, !dbg !167

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !168
  %cmp7 = icmp slt i32 %9, 10, !dbg !169
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !170

if.then8:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !171
  %11 = load i32, i32* %data, align 4, !dbg !173
  %idxprom9 = sext i32 %11 to i64, !dbg !171
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !171
  store i32 1, i32* %arrayidx10, align 4, !dbg !174
  store i32 0, i32* %i, align 4, !dbg !175
  br label %for.cond11, !dbg !177

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %12 = load i32, i32* %i, align 4, !dbg !178
  %cmp12 = icmp slt i32 %12, 10, !dbg !180
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !181

for.body13:                                       ; preds = %for.cond11
  %13 = load i32*, i32** %buffer, align 8, !dbg !182
  %14 = load i32, i32* %i, align 4, !dbg !184
  %idxprom14 = sext i32 %14 to i64, !dbg !182
  %arrayidx15 = getelementptr inbounds i32, i32* %13, i64 %idxprom14, !dbg !182
  %15 = load i32, i32* %arrayidx15, align 4, !dbg !182
  call void @printIntLine(i32 %15), !dbg !185
  br label %for.inc16, !dbg !186

for.inc16:                                        ; preds = %for.body13
  %16 = load i32, i32* %i, align 4, !dbg !187
  %inc17 = add nsw i32 %16, 1, !dbg !187
  store i32 %inc17, i32* %i, align 4, !dbg !187
  br label %for.cond11, !dbg !188, !llvm.loop !189

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !191

if.else19:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !192
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %17 = load i32*, i32** %buffer, align 8, !dbg !194
  %18 = bitcast i32* %17 to i8*, !dbg !194
  call void @free(i8* %18) #5, !dbg !195
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then2
  ret void, !dbg !196
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !197 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 -1, i32* %data, align 4, !dbg !200
  %0 = load i32, i32* @globalTrue, align 4, !dbg !201
  %tobool = icmp ne i32 %0, 0, !dbg !201
  br i1 %tobool, label %if.then, label %if.end, !dbg !203

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !204
  br label %if.end, !dbg !206

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !207
  %tobool1 = icmp ne i32 %1, 0, !dbg !207
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !209

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !210, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !214, metadata !DIExpression()), !dbg !215
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !216
  %2 = bitcast i8* %call to i32*, !dbg !217
  store i32* %2, i32** %buffer, align 8, !dbg !215
  %3 = load i32*, i32** %buffer, align 8, !dbg !218
  %cmp = icmp eq i32* %3, null, !dbg !220
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !221

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !222
  unreachable, !dbg !222

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !224
  br label %for.cond, !dbg !226

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !227
  %cmp5 = icmp slt i32 %4, 10, !dbg !229
  br i1 %cmp5, label %for.body, label %for.end, !dbg !230

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !231
  %6 = load i32, i32* %i, align 4, !dbg !233
  %idxprom = sext i32 %6 to i64, !dbg !231
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !231
  store i32 0, i32* %arrayidx, align 4, !dbg !234
  br label %for.inc, !dbg !235

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !236
  %inc = add nsw i32 %7, 1, !dbg !236
  store i32 %inc, i32* %i, align 4, !dbg !236
  br label %for.cond, !dbg !237, !llvm.loop !238

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !240
  %cmp6 = icmp sge i32 %8, 0, !dbg !242
  br i1 %cmp6, label %land.lhs.true, label %if.else, !dbg !243

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !244
  %cmp7 = icmp slt i32 %9, 10, !dbg !245
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !246

if.then8:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !247
  %11 = load i32, i32* %data, align 4, !dbg !249
  %idxprom9 = sext i32 %11 to i64, !dbg !247
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !247
  store i32 1, i32* %arrayidx10, align 4, !dbg !250
  store i32 0, i32* %i, align 4, !dbg !251
  br label %for.cond11, !dbg !253

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %12 = load i32, i32* %i, align 4, !dbg !254
  %cmp12 = icmp slt i32 %12, 10, !dbg !256
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !257

for.body13:                                       ; preds = %for.cond11
  %13 = load i32*, i32** %buffer, align 8, !dbg !258
  %14 = load i32, i32* %i, align 4, !dbg !260
  %idxprom14 = sext i32 %14 to i64, !dbg !258
  %arrayidx15 = getelementptr inbounds i32, i32* %13, i64 %idxprom14, !dbg !258
  %15 = load i32, i32* %arrayidx15, align 4, !dbg !258
  call void @printIntLine(i32 %15), !dbg !261
  br label %for.inc16, !dbg !262

for.inc16:                                        ; preds = %for.body13
  %16 = load i32, i32* %i, align 4, !dbg !263
  %inc17 = add nsw i32 %16, 1, !dbg !263
  store i32 %inc17, i32* %i, align 4, !dbg !263
  br label %for.cond11, !dbg !264, !llvm.loop !265

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !267

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !268
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %17 = load i32*, i32** %buffer, align 8, !dbg !270
  %18 = bitcast i32* %17 to i8*, !dbg !270
  call void @free(i8* %18) #5, !dbg !271
  br label %if.end20, !dbg !272

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !273
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !274 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !275, metadata !DIExpression()), !dbg !276
  store i32 -1, i32* %data, align 4, !dbg !277
  %0 = load i32, i32* @globalFalse, align 4, !dbg !278
  %tobool = icmp ne i32 %0, 0, !dbg !278
  br i1 %tobool, label %if.then, label %if.else, !dbg !280

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !281
  br label %if.end, !dbg !283

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !284
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalTrue, align 4, !dbg !286
  %tobool1 = icmp ne i32 %1, 0, !dbg !286
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !288

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !289, metadata !DIExpression()), !dbg !292
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !293, metadata !DIExpression()), !dbg !294
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !295
  %2 = bitcast i8* %call to i32*, !dbg !296
  store i32* %2, i32** %buffer, align 8, !dbg !294
  %3 = load i32*, i32** %buffer, align 8, !dbg !297
  %cmp = icmp eq i32* %3, null, !dbg !299
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !300

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !301
  unreachable, !dbg !301

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !303
  br label %for.cond, !dbg !305

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !306
  %cmp5 = icmp slt i32 %4, 10, !dbg !308
  br i1 %cmp5, label %for.body, label %for.end, !dbg !309

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !310
  %6 = load i32, i32* %i, align 4, !dbg !312
  %idxprom = sext i32 %6 to i64, !dbg !310
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !310
  store i32 0, i32* %arrayidx, align 4, !dbg !313
  br label %for.inc, !dbg !314

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !315
  %inc = add nsw i32 %7, 1, !dbg !315
  store i32 %inc, i32* %i, align 4, !dbg !315
  br label %for.cond, !dbg !316, !llvm.loop !317

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !319
  %cmp6 = icmp sge i32 %8, 0, !dbg !321
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !322

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !323
  %10 = load i32, i32* %data, align 4, !dbg !325
  %idxprom8 = sext i32 %10 to i64, !dbg !323
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !323
  store i32 1, i32* %arrayidx9, align 4, !dbg !326
  store i32 0, i32* %i, align 4, !dbg !327
  br label %for.cond10, !dbg !329

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !330
  %cmp11 = icmp slt i32 %11, 10, !dbg !332
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !333

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !334
  %13 = load i32, i32* %i, align 4, !dbg !336
  %idxprom13 = sext i32 %13 to i64, !dbg !334
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !334
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !334
  call void @printIntLine(i32 %14), !dbg !337
  br label %for.inc15, !dbg !338

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !339
  %inc16 = add nsw i32 %15, 1, !dbg !339
  store i32 %inc16, i32* %i, align 4, !dbg !339
  br label %for.cond10, !dbg !340, !llvm.loop !341

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !343

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !344
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !346
  %17 = bitcast i32* %16 to i8*, !dbg !346
  call void @free(i8* %17) #5, !dbg !347
  br label %if.end20, !dbg !348

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !349
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !350 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !351, metadata !DIExpression()), !dbg !352
  store i32 -1, i32* %data, align 4, !dbg !353
  %0 = load i32, i32* @globalTrue, align 4, !dbg !354
  %tobool = icmp ne i32 %0, 0, !dbg !354
  br i1 %tobool, label %if.then, label %if.end, !dbg !356

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !357
  br label %if.end, !dbg !359

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !360
  %tobool1 = icmp ne i32 %1, 0, !dbg !360
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !362

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !363, metadata !DIExpression()), !dbg !366
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !367, metadata !DIExpression()), !dbg !368
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !369
  %2 = bitcast i8* %call to i32*, !dbg !370
  store i32* %2, i32** %buffer, align 8, !dbg !368
  %3 = load i32*, i32** %buffer, align 8, !dbg !371
  %cmp = icmp eq i32* %3, null, !dbg !373
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !374

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #6, !dbg !375
  unreachable, !dbg !375

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !377
  br label %for.cond, !dbg !379

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !380
  %cmp5 = icmp slt i32 %4, 10, !dbg !382
  br i1 %cmp5, label %for.body, label %for.end, !dbg !383

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !384
  %6 = load i32, i32* %i, align 4, !dbg !386
  %idxprom = sext i32 %6 to i64, !dbg !384
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !384
  store i32 0, i32* %arrayidx, align 4, !dbg !387
  br label %for.inc, !dbg !388

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !389
  %inc = add nsw i32 %7, 1, !dbg !389
  store i32 %inc, i32* %i, align 4, !dbg !389
  br label %for.cond, !dbg !390, !llvm.loop !391

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !393
  %cmp6 = icmp sge i32 %8, 0, !dbg !395
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !396

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !397
  %10 = load i32, i32* %data, align 4, !dbg !399
  %idxprom8 = sext i32 %10 to i64, !dbg !397
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !397
  store i32 1, i32* %arrayidx9, align 4, !dbg !400
  store i32 0, i32* %i, align 4, !dbg !401
  br label %for.cond10, !dbg !403

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !404
  %cmp11 = icmp slt i32 %11, 10, !dbg !406
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !407

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !408
  %13 = load i32, i32* %i, align 4, !dbg !410
  %idxprom13 = sext i32 %13 to i64, !dbg !408
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !408
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !408
  call void @printIntLine(i32 %14), !dbg !411
  br label %for.inc15, !dbg !412

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !413
  %inc16 = add nsw i32 %15, 1, !dbg !413
  store i32 %inc16, i32* %i, align 4, !dbg !413
  br label %for.cond10, !dbg !414, !llvm.loop !415

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !417

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !418
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !420
  %17 = bitcast i32* %16 to i8*, !dbg !420
  call void @free(i8* %17) #5, !dbg !421
  br label %if.end19, !dbg !422

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !423
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 31, column: 5, scope: !25)
!27 = !DILocation(line: 32, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!29 = !DILocation(line: 32, column: 8, scope: !14)
!30 = !DILocalVariable(name: "i", scope: !31, file: !15, line: 35, type: !5)
!31 = distinct !DILexicalBlock(scope: !32, file: !15, line: 34, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 33, column: 5)
!33 = !DILocation(line: 35, column: 17, scope: !31)
!34 = !DILocalVariable(name: "buffer", scope: !31, file: !15, line: 36, type: !4)
!35 = !DILocation(line: 36, column: 19, scope: !31)
!36 = !DILocation(line: 36, column: 35, scope: !31)
!37 = !DILocation(line: 36, column: 28, scope: !31)
!38 = !DILocation(line: 37, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !15, line: 37, column: 17)
!40 = !DILocation(line: 37, column: 24, scope: !39)
!41 = !DILocation(line: 37, column: 17, scope: !31)
!42 = !DILocation(line: 37, column: 34, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 37, column: 33)
!44 = !DILocation(line: 39, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !31, file: !15, line: 39, column: 13)
!46 = !DILocation(line: 39, column: 18, scope: !45)
!47 = !DILocation(line: 39, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !15, line: 39, column: 13)
!49 = !DILocation(line: 39, column: 27, scope: !48)
!50 = !DILocation(line: 39, column: 13, scope: !45)
!51 = !DILocation(line: 41, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 40, column: 13)
!53 = !DILocation(line: 41, column: 24, scope: !52)
!54 = !DILocation(line: 41, column: 27, scope: !52)
!55 = !DILocation(line: 42, column: 13, scope: !52)
!56 = !DILocation(line: 39, column: 34, scope: !48)
!57 = !DILocation(line: 39, column: 13, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 42, column: 13, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 45, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !31, file: !15, line: 45, column: 17)
!63 = !DILocation(line: 45, column: 22, scope: !62)
!64 = !DILocation(line: 45, column: 17, scope: !31)
!65 = !DILocation(line: 47, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 46, column: 13)
!67 = !DILocation(line: 47, column: 24, scope: !66)
!68 = !DILocation(line: 47, column: 30, scope: !66)
!69 = !DILocation(line: 49, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 49, column: 17)
!71 = !DILocation(line: 49, column: 21, scope: !70)
!72 = !DILocation(line: 49, column: 28, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !15, line: 49, column: 17)
!74 = !DILocation(line: 49, column: 30, scope: !73)
!75 = !DILocation(line: 49, column: 17, scope: !70)
!76 = !DILocation(line: 51, column: 34, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 50, column: 17)
!78 = !DILocation(line: 51, column: 41, scope: !77)
!79 = !DILocation(line: 51, column: 21, scope: !77)
!80 = !DILocation(line: 52, column: 17, scope: !77)
!81 = !DILocation(line: 49, column: 37, scope: !73)
!82 = !DILocation(line: 49, column: 17, scope: !73)
!83 = distinct !{!83, !75, !84, !60}
!84 = !DILocation(line: 52, column: 17, scope: !70)
!85 = !DILocation(line: 53, column: 13, scope: !66)
!86 = !DILocation(line: 56, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !62, file: !15, line: 55, column: 13)
!88 = !DILocation(line: 58, column: 18, scope: !31)
!89 = !DILocation(line: 58, column: 13, scope: !31)
!90 = !DILocation(line: 60, column: 5, scope: !32)
!91 = !DILocation(line: 61, column: 1, scope: !14)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_10_good", scope: !15, file: !15, line: 245, type: !16, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 247, column: 5, scope: !92)
!94 = !DILocation(line: 248, column: 5, scope: !92)
!95 = !DILocation(line: 249, column: 5, scope: !92)
!96 = !DILocation(line: 250, column: 5, scope: !92)
!97 = !DILocation(line: 251, column: 1, scope: !92)
!98 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 262, type: !99, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!5, !5, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !15, line: 262, type: !5)
!105 = !DILocation(line: 262, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !15, line: 262, type: !101)
!107 = !DILocation(line: 262, column: 27, scope: !98)
!108 = !DILocation(line: 265, column: 22, scope: !98)
!109 = !DILocation(line: 265, column: 12, scope: !98)
!110 = !DILocation(line: 265, column: 5, scope: !98)
!111 = !DILocation(line: 267, column: 5, scope: !98)
!112 = !DILocation(line: 268, column: 5, scope: !98)
!113 = !DILocation(line: 269, column: 5, scope: !98)
!114 = !DILocation(line: 272, column: 5, scope: !98)
!115 = !DILocation(line: 273, column: 5, scope: !98)
!116 = !DILocation(line: 274, column: 5, scope: !98)
!117 = !DILocation(line: 276, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !15, line: 70, type: !5)
!120 = !DILocation(line: 70, column: 9, scope: !118)
!121 = !DILocation(line: 72, column: 10, scope: !118)
!122 = !DILocation(line: 73, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !15, line: 73, column: 8)
!124 = !DILocation(line: 73, column: 8, scope: !118)
!125 = !DILocation(line: 76, column: 14, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !15, line: 74, column: 5)
!127 = !DILocation(line: 77, column: 5, scope: !126)
!128 = !DILocation(line: 78, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !118, file: !15, line: 78, column: 8)
!130 = !DILocation(line: 78, column: 8, scope: !118)
!131 = !DILocation(line: 81, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !15, line: 79, column: 5)
!133 = !DILocation(line: 82, column: 5, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !135, file: !15, line: 86, type: !5)
!135 = distinct !DILexicalBlock(scope: !136, file: !15, line: 85, column: 9)
!136 = distinct !DILexicalBlock(scope: !129, file: !15, line: 84, column: 5)
!137 = !DILocation(line: 86, column: 17, scope: !135)
!138 = !DILocalVariable(name: "buffer", scope: !135, file: !15, line: 87, type: !4)
!139 = !DILocation(line: 87, column: 19, scope: !135)
!140 = !DILocation(line: 87, column: 35, scope: !135)
!141 = !DILocation(line: 87, column: 28, scope: !135)
!142 = !DILocation(line: 88, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !135, file: !15, line: 88, column: 17)
!144 = !DILocation(line: 88, column: 24, scope: !143)
!145 = !DILocation(line: 88, column: 17, scope: !135)
!146 = !DILocation(line: 88, column: 34, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 88, column: 33)
!148 = !DILocation(line: 90, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !135, file: !15, line: 90, column: 13)
!150 = !DILocation(line: 90, column: 18, scope: !149)
!151 = !DILocation(line: 90, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !15, line: 90, column: 13)
!153 = !DILocation(line: 90, column: 27, scope: !152)
!154 = !DILocation(line: 90, column: 13, scope: !149)
!155 = !DILocation(line: 92, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !15, line: 91, column: 13)
!157 = !DILocation(line: 92, column: 24, scope: !156)
!158 = !DILocation(line: 92, column: 27, scope: !156)
!159 = !DILocation(line: 93, column: 13, scope: !156)
!160 = !DILocation(line: 90, column: 34, scope: !152)
!161 = !DILocation(line: 90, column: 13, scope: !152)
!162 = distinct !{!162, !154, !163, !60}
!163 = !DILocation(line: 93, column: 13, scope: !149)
!164 = !DILocation(line: 95, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !135, file: !15, line: 95, column: 17)
!166 = !DILocation(line: 95, column: 22, scope: !165)
!167 = !DILocation(line: 95, column: 27, scope: !165)
!168 = !DILocation(line: 95, column: 30, scope: !165)
!169 = !DILocation(line: 95, column: 35, scope: !165)
!170 = !DILocation(line: 95, column: 17, scope: !135)
!171 = !DILocation(line: 97, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !165, file: !15, line: 96, column: 13)
!173 = !DILocation(line: 97, column: 24, scope: !172)
!174 = !DILocation(line: 97, column: 30, scope: !172)
!175 = !DILocation(line: 99, column: 23, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 99, column: 17)
!177 = !DILocation(line: 99, column: 21, scope: !176)
!178 = !DILocation(line: 99, column: 28, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !15, line: 99, column: 17)
!180 = !DILocation(line: 99, column: 30, scope: !179)
!181 = !DILocation(line: 99, column: 17, scope: !176)
!182 = !DILocation(line: 101, column: 34, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !15, line: 100, column: 17)
!184 = !DILocation(line: 101, column: 41, scope: !183)
!185 = !DILocation(line: 101, column: 21, scope: !183)
!186 = !DILocation(line: 102, column: 17, scope: !183)
!187 = !DILocation(line: 99, column: 37, scope: !179)
!188 = !DILocation(line: 99, column: 17, scope: !179)
!189 = distinct !{!189, !181, !190, !60}
!190 = !DILocation(line: 102, column: 17, scope: !176)
!191 = !DILocation(line: 103, column: 13, scope: !172)
!192 = !DILocation(line: 106, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !165, file: !15, line: 105, column: 13)
!194 = !DILocation(line: 108, column: 18, scope: !135)
!195 = !DILocation(line: 108, column: 13, scope: !135)
!196 = !DILocation(line: 111, column: 1, scope: !118)
!197 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!198 = !DILocalVariable(name: "data", scope: !197, file: !15, line: 116, type: !5)
!199 = !DILocation(line: 116, column: 9, scope: !197)
!200 = !DILocation(line: 118, column: 10, scope: !197)
!201 = !DILocation(line: 119, column: 8, scope: !202)
!202 = distinct !DILexicalBlock(scope: !197, file: !15, line: 119, column: 8)
!203 = !DILocation(line: 119, column: 8, scope: !197)
!204 = !DILocation(line: 122, column: 14, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !15, line: 120, column: 5)
!206 = !DILocation(line: 123, column: 5, scope: !205)
!207 = !DILocation(line: 124, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !197, file: !15, line: 124, column: 8)
!209 = !DILocation(line: 124, column: 8, scope: !197)
!210 = !DILocalVariable(name: "i", scope: !211, file: !15, line: 127, type: !5)
!211 = distinct !DILexicalBlock(scope: !212, file: !15, line: 126, column: 9)
!212 = distinct !DILexicalBlock(scope: !208, file: !15, line: 125, column: 5)
!213 = !DILocation(line: 127, column: 17, scope: !211)
!214 = !DILocalVariable(name: "buffer", scope: !211, file: !15, line: 128, type: !4)
!215 = !DILocation(line: 128, column: 19, scope: !211)
!216 = !DILocation(line: 128, column: 35, scope: !211)
!217 = !DILocation(line: 128, column: 28, scope: !211)
!218 = !DILocation(line: 129, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !211, file: !15, line: 129, column: 17)
!220 = !DILocation(line: 129, column: 24, scope: !219)
!221 = !DILocation(line: 129, column: 17, scope: !211)
!222 = !DILocation(line: 129, column: 34, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !15, line: 129, column: 33)
!224 = !DILocation(line: 131, column: 20, scope: !225)
!225 = distinct !DILexicalBlock(scope: !211, file: !15, line: 131, column: 13)
!226 = !DILocation(line: 131, column: 18, scope: !225)
!227 = !DILocation(line: 131, column: 25, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !15, line: 131, column: 13)
!229 = !DILocation(line: 131, column: 27, scope: !228)
!230 = !DILocation(line: 131, column: 13, scope: !225)
!231 = !DILocation(line: 133, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !15, line: 132, column: 13)
!233 = !DILocation(line: 133, column: 24, scope: !232)
!234 = !DILocation(line: 133, column: 27, scope: !232)
!235 = !DILocation(line: 134, column: 13, scope: !232)
!236 = !DILocation(line: 131, column: 34, scope: !228)
!237 = !DILocation(line: 131, column: 13, scope: !228)
!238 = distinct !{!238, !230, !239, !60}
!239 = !DILocation(line: 134, column: 13, scope: !225)
!240 = !DILocation(line: 136, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !211, file: !15, line: 136, column: 17)
!242 = !DILocation(line: 136, column: 22, scope: !241)
!243 = !DILocation(line: 136, column: 27, scope: !241)
!244 = !DILocation(line: 136, column: 30, scope: !241)
!245 = !DILocation(line: 136, column: 35, scope: !241)
!246 = !DILocation(line: 136, column: 17, scope: !211)
!247 = !DILocation(line: 138, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !241, file: !15, line: 137, column: 13)
!249 = !DILocation(line: 138, column: 24, scope: !248)
!250 = !DILocation(line: 138, column: 30, scope: !248)
!251 = !DILocation(line: 140, column: 23, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !15, line: 140, column: 17)
!253 = !DILocation(line: 140, column: 21, scope: !252)
!254 = !DILocation(line: 140, column: 28, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !15, line: 140, column: 17)
!256 = !DILocation(line: 140, column: 30, scope: !255)
!257 = !DILocation(line: 140, column: 17, scope: !252)
!258 = !DILocation(line: 142, column: 34, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !15, line: 141, column: 17)
!260 = !DILocation(line: 142, column: 41, scope: !259)
!261 = !DILocation(line: 142, column: 21, scope: !259)
!262 = !DILocation(line: 143, column: 17, scope: !259)
!263 = !DILocation(line: 140, column: 37, scope: !255)
!264 = !DILocation(line: 140, column: 17, scope: !255)
!265 = distinct !{!265, !257, !266, !60}
!266 = !DILocation(line: 143, column: 17, scope: !252)
!267 = !DILocation(line: 144, column: 13, scope: !248)
!268 = !DILocation(line: 147, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !241, file: !15, line: 146, column: 13)
!270 = !DILocation(line: 149, column: 18, scope: !211)
!271 = !DILocation(line: 149, column: 13, scope: !211)
!272 = !DILocation(line: 151, column: 5, scope: !212)
!273 = !DILocation(line: 152, column: 1, scope: !197)
!274 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 155, type: !16, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!275 = !DILocalVariable(name: "data", scope: !274, file: !15, line: 157, type: !5)
!276 = !DILocation(line: 157, column: 9, scope: !274)
!277 = !DILocation(line: 159, column: 10, scope: !274)
!278 = !DILocation(line: 160, column: 8, scope: !279)
!279 = distinct !DILexicalBlock(scope: !274, file: !15, line: 160, column: 8)
!280 = !DILocation(line: 160, column: 8, scope: !274)
!281 = !DILocation(line: 163, column: 9, scope: !282)
!282 = distinct !DILexicalBlock(scope: !279, file: !15, line: 161, column: 5)
!283 = !DILocation(line: 164, column: 5, scope: !282)
!284 = !DILocation(line: 169, column: 14, scope: !285)
!285 = distinct !DILexicalBlock(scope: !279, file: !15, line: 166, column: 5)
!286 = !DILocation(line: 171, column: 8, scope: !287)
!287 = distinct !DILexicalBlock(scope: !274, file: !15, line: 171, column: 8)
!288 = !DILocation(line: 171, column: 8, scope: !274)
!289 = !DILocalVariable(name: "i", scope: !290, file: !15, line: 174, type: !5)
!290 = distinct !DILexicalBlock(scope: !291, file: !15, line: 173, column: 9)
!291 = distinct !DILexicalBlock(scope: !287, file: !15, line: 172, column: 5)
!292 = !DILocation(line: 174, column: 17, scope: !290)
!293 = !DILocalVariable(name: "buffer", scope: !290, file: !15, line: 175, type: !4)
!294 = !DILocation(line: 175, column: 19, scope: !290)
!295 = !DILocation(line: 175, column: 35, scope: !290)
!296 = !DILocation(line: 175, column: 28, scope: !290)
!297 = !DILocation(line: 176, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !290, file: !15, line: 176, column: 17)
!299 = !DILocation(line: 176, column: 24, scope: !298)
!300 = !DILocation(line: 176, column: 17, scope: !290)
!301 = !DILocation(line: 176, column: 34, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !15, line: 176, column: 33)
!303 = !DILocation(line: 178, column: 20, scope: !304)
!304 = distinct !DILexicalBlock(scope: !290, file: !15, line: 178, column: 13)
!305 = !DILocation(line: 178, column: 18, scope: !304)
!306 = !DILocation(line: 178, column: 25, scope: !307)
!307 = distinct !DILexicalBlock(scope: !304, file: !15, line: 178, column: 13)
!308 = !DILocation(line: 178, column: 27, scope: !307)
!309 = !DILocation(line: 178, column: 13, scope: !304)
!310 = !DILocation(line: 180, column: 17, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !15, line: 179, column: 13)
!312 = !DILocation(line: 180, column: 24, scope: !311)
!313 = !DILocation(line: 180, column: 27, scope: !311)
!314 = !DILocation(line: 181, column: 13, scope: !311)
!315 = !DILocation(line: 178, column: 34, scope: !307)
!316 = !DILocation(line: 178, column: 13, scope: !307)
!317 = distinct !{!317, !309, !318, !60}
!318 = !DILocation(line: 181, column: 13, scope: !304)
!319 = !DILocation(line: 184, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !290, file: !15, line: 184, column: 17)
!321 = !DILocation(line: 184, column: 22, scope: !320)
!322 = !DILocation(line: 184, column: 17, scope: !290)
!323 = !DILocation(line: 186, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !15, line: 185, column: 13)
!325 = !DILocation(line: 186, column: 24, scope: !324)
!326 = !DILocation(line: 186, column: 30, scope: !324)
!327 = !DILocation(line: 188, column: 23, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !15, line: 188, column: 17)
!329 = !DILocation(line: 188, column: 21, scope: !328)
!330 = !DILocation(line: 188, column: 28, scope: !331)
!331 = distinct !DILexicalBlock(scope: !328, file: !15, line: 188, column: 17)
!332 = !DILocation(line: 188, column: 30, scope: !331)
!333 = !DILocation(line: 188, column: 17, scope: !328)
!334 = !DILocation(line: 190, column: 34, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !15, line: 189, column: 17)
!336 = !DILocation(line: 190, column: 41, scope: !335)
!337 = !DILocation(line: 190, column: 21, scope: !335)
!338 = !DILocation(line: 191, column: 17, scope: !335)
!339 = !DILocation(line: 188, column: 37, scope: !331)
!340 = !DILocation(line: 188, column: 17, scope: !331)
!341 = distinct !{!341, !333, !342, !60}
!342 = !DILocation(line: 191, column: 17, scope: !328)
!343 = !DILocation(line: 192, column: 13, scope: !324)
!344 = !DILocation(line: 195, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !320, file: !15, line: 194, column: 13)
!346 = !DILocation(line: 197, column: 18, scope: !290)
!347 = !DILocation(line: 197, column: 13, scope: !290)
!348 = !DILocation(line: 199, column: 5, scope: !291)
!349 = !DILocation(line: 200, column: 1, scope: !274)
!350 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 203, type: !16, scopeLine: 204, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!351 = !DILocalVariable(name: "data", scope: !350, file: !15, line: 205, type: !5)
!352 = !DILocation(line: 205, column: 9, scope: !350)
!353 = !DILocation(line: 207, column: 10, scope: !350)
!354 = !DILocation(line: 208, column: 8, scope: !355)
!355 = distinct !DILexicalBlock(scope: !350, file: !15, line: 208, column: 8)
!356 = !DILocation(line: 208, column: 8, scope: !350)
!357 = !DILocation(line: 212, column: 14, scope: !358)
!358 = distinct !DILexicalBlock(scope: !355, file: !15, line: 209, column: 5)
!359 = !DILocation(line: 213, column: 5, scope: !358)
!360 = !DILocation(line: 214, column: 8, scope: !361)
!361 = distinct !DILexicalBlock(scope: !350, file: !15, line: 214, column: 8)
!362 = !DILocation(line: 214, column: 8, scope: !350)
!363 = !DILocalVariable(name: "i", scope: !364, file: !15, line: 217, type: !5)
!364 = distinct !DILexicalBlock(scope: !365, file: !15, line: 216, column: 9)
!365 = distinct !DILexicalBlock(scope: !361, file: !15, line: 215, column: 5)
!366 = !DILocation(line: 217, column: 17, scope: !364)
!367 = !DILocalVariable(name: "buffer", scope: !364, file: !15, line: 218, type: !4)
!368 = !DILocation(line: 218, column: 19, scope: !364)
!369 = !DILocation(line: 218, column: 35, scope: !364)
!370 = !DILocation(line: 218, column: 28, scope: !364)
!371 = !DILocation(line: 219, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !364, file: !15, line: 219, column: 17)
!373 = !DILocation(line: 219, column: 24, scope: !372)
!374 = !DILocation(line: 219, column: 17, scope: !364)
!375 = !DILocation(line: 219, column: 34, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !15, line: 219, column: 33)
!377 = !DILocation(line: 221, column: 20, scope: !378)
!378 = distinct !DILexicalBlock(scope: !364, file: !15, line: 221, column: 13)
!379 = !DILocation(line: 221, column: 18, scope: !378)
!380 = !DILocation(line: 221, column: 25, scope: !381)
!381 = distinct !DILexicalBlock(scope: !378, file: !15, line: 221, column: 13)
!382 = !DILocation(line: 221, column: 27, scope: !381)
!383 = !DILocation(line: 221, column: 13, scope: !378)
!384 = !DILocation(line: 223, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !15, line: 222, column: 13)
!386 = !DILocation(line: 223, column: 24, scope: !385)
!387 = !DILocation(line: 223, column: 27, scope: !385)
!388 = !DILocation(line: 224, column: 13, scope: !385)
!389 = !DILocation(line: 221, column: 34, scope: !381)
!390 = !DILocation(line: 221, column: 13, scope: !381)
!391 = distinct !{!391, !383, !392, !60}
!392 = !DILocation(line: 224, column: 13, scope: !378)
!393 = !DILocation(line: 227, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !364, file: !15, line: 227, column: 17)
!395 = !DILocation(line: 227, column: 22, scope: !394)
!396 = !DILocation(line: 227, column: 17, scope: !364)
!397 = !DILocation(line: 229, column: 17, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !15, line: 228, column: 13)
!399 = !DILocation(line: 229, column: 24, scope: !398)
!400 = !DILocation(line: 229, column: 30, scope: !398)
!401 = !DILocation(line: 231, column: 23, scope: !402)
!402 = distinct !DILexicalBlock(scope: !398, file: !15, line: 231, column: 17)
!403 = !DILocation(line: 231, column: 21, scope: !402)
!404 = !DILocation(line: 231, column: 28, scope: !405)
!405 = distinct !DILexicalBlock(scope: !402, file: !15, line: 231, column: 17)
!406 = !DILocation(line: 231, column: 30, scope: !405)
!407 = !DILocation(line: 231, column: 17, scope: !402)
!408 = !DILocation(line: 233, column: 34, scope: !409)
!409 = distinct !DILexicalBlock(scope: !405, file: !15, line: 232, column: 17)
!410 = !DILocation(line: 233, column: 41, scope: !409)
!411 = !DILocation(line: 233, column: 21, scope: !409)
!412 = !DILocation(line: 234, column: 17, scope: !409)
!413 = !DILocation(line: 231, column: 37, scope: !405)
!414 = !DILocation(line: 231, column: 17, scope: !405)
!415 = distinct !{!415, !407, !416, !60}
!416 = !DILocation(line: 234, column: 17, scope: !402)
!417 = !DILocation(line: 235, column: 13, scope: !398)
!418 = !DILocation(line: 238, column: 17, scope: !419)
!419 = distinct !DILexicalBlock(scope: !394, file: !15, line: 237, column: 13)
!420 = !DILocation(line: 240, column: 18, scope: !364)
!421 = !DILocation(line: 240, column: 13, scope: !364)
!422 = !DILocation(line: 242, column: 5, scope: !365)
!423 = !DILocation(line: 243, column: 1, scope: !350)
