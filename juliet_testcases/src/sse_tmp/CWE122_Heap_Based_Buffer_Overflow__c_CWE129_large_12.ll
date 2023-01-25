; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %buffer24 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !24
  br label %if.end, !dbg !26

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !27
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool2 = icmp ne i32 %call1, 0, !dbg !29
  br i1 %tobool2, label %if.then3, label %if.else22, !dbg !31

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !36, metadata !DIExpression()), !dbg !37
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !38
  %0 = bitcast i8* %call4 to i32*, !dbg !39
  store i32* %0, i32** %buffer, align 8, !dbg !37
  %1 = load i32*, i32** %buffer, align 8, !dbg !40
  %cmp = icmp eq i32* %1, null, !dbg !42
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !43

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !44
  unreachable, !dbg !44

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !49
  %cmp7 = icmp slt i32 %2, 10, !dbg !51
  br i1 %cmp7, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !53
  %4 = load i32, i32* %i, align 4, !dbg !55
  %idxprom = sext i32 %4 to i64, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !58
  %inc = add nsw i32 %5, 1, !dbg !58
  store i32 %inc, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !63
  %cmp8 = icmp sge i32 %6, 0, !dbg !65
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !66

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !67
  %8 = load i32, i32* %data, align 4, !dbg !69
  %idxprom10 = sext i32 %8 to i64, !dbg !67
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !67
  store i32 1, i32* %arrayidx11, align 4, !dbg !70
  store i32 0, i32* %i, align 4, !dbg !71
  br label %for.cond12, !dbg !73

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !74
  %cmp13 = icmp slt i32 %9, 10, !dbg !76
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !77

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !78
  %11 = load i32, i32* %i, align 4, !dbg !80
  %idxprom15 = sext i32 %11 to i64, !dbg !78
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !78
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !78
  call void @printIntLine(i32 %12), !dbg !81
  br label %for.inc17, !dbg !82

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !83
  %inc18 = add nsw i32 %13, 1, !dbg !83
  store i32 %inc18, i32* %i, align 4, !dbg !83
  br label %for.cond12, !dbg !84, !llvm.loop !85

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !87

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !88
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !90
  %15 = bitcast i32* %14 to i8*, !dbg !90
  call void @free(i8* %15) #5, !dbg !91
  br label %if.end52, !dbg !92

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !93, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %buffer24, metadata !97, metadata !DIExpression()), !dbg !98
  %call25 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !99
  %16 = bitcast i8* %call25 to i32*, !dbg !100
  store i32* %16, i32** %buffer24, align 8, !dbg !98
  %17 = load i32*, i32** %buffer24, align 8, !dbg !101
  %cmp26 = icmp eq i32* %17, null, !dbg !103
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !104

if.then27:                                        ; preds = %if.else22
  call void @exit(i32 -1) #6, !dbg !105
  unreachable, !dbg !105

if.end28:                                         ; preds = %if.else22
  store i32 0, i32* %i23, align 4, !dbg !107
  br label %for.cond29, !dbg !109

for.cond29:                                       ; preds = %for.inc34, %if.end28
  %18 = load i32, i32* %i23, align 4, !dbg !110
  %cmp30 = icmp slt i32 %18, 10, !dbg !112
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !113

for.body31:                                       ; preds = %for.cond29
  %19 = load i32*, i32** %buffer24, align 8, !dbg !114
  %20 = load i32, i32* %i23, align 4, !dbg !116
  %idxprom32 = sext i32 %20 to i64, !dbg !114
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %idxprom32, !dbg !114
  store i32 0, i32* %arrayidx33, align 4, !dbg !117
  br label %for.inc34, !dbg !118

for.inc34:                                        ; preds = %for.body31
  %21 = load i32, i32* %i23, align 4, !dbg !119
  %inc35 = add nsw i32 %21, 1, !dbg !119
  store i32 %inc35, i32* %i23, align 4, !dbg !119
  br label %for.cond29, !dbg !120, !llvm.loop !121

for.end36:                                        ; preds = %for.cond29
  %22 = load i32, i32* %data, align 4, !dbg !123
  %cmp37 = icmp sge i32 %22, 0, !dbg !125
  br i1 %cmp37, label %land.lhs.true, label %if.else50, !dbg !126

land.lhs.true:                                    ; preds = %for.end36
  %23 = load i32, i32* %data, align 4, !dbg !127
  %cmp38 = icmp slt i32 %23, 10, !dbg !128
  br i1 %cmp38, label %if.then39, label %if.else50, !dbg !129

if.then39:                                        ; preds = %land.lhs.true
  %24 = load i32*, i32** %buffer24, align 8, !dbg !130
  %25 = load i32, i32* %data, align 4, !dbg !132
  %idxprom40 = sext i32 %25 to i64, !dbg !130
  %arrayidx41 = getelementptr inbounds i32, i32* %24, i64 %idxprom40, !dbg !130
  store i32 1, i32* %arrayidx41, align 4, !dbg !133
  store i32 0, i32* %i23, align 4, !dbg !134
  br label %for.cond42, !dbg !136

for.cond42:                                       ; preds = %for.inc47, %if.then39
  %26 = load i32, i32* %i23, align 4, !dbg !137
  %cmp43 = icmp slt i32 %26, 10, !dbg !139
  br i1 %cmp43, label %for.body44, label %for.end49, !dbg !140

for.body44:                                       ; preds = %for.cond42
  %27 = load i32*, i32** %buffer24, align 8, !dbg !141
  %28 = load i32, i32* %i23, align 4, !dbg !143
  %idxprom45 = sext i32 %28 to i64, !dbg !141
  %arrayidx46 = getelementptr inbounds i32, i32* %27, i64 %idxprom45, !dbg !141
  %29 = load i32, i32* %arrayidx46, align 4, !dbg !141
  call void @printIntLine(i32 %29), !dbg !144
  br label %for.inc47, !dbg !145

for.inc47:                                        ; preds = %for.body44
  %30 = load i32, i32* %i23, align 4, !dbg !146
  %inc48 = add nsw i32 %30, 1, !dbg !146
  store i32 %inc48, i32* %i23, align 4, !dbg !146
  br label %for.cond42, !dbg !147, !llvm.loop !148

for.end49:                                        ; preds = %for.cond42
  br label %if.end51, !dbg !150

if.else50:                                        ; preds = %land.lhs.true, %for.end36
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !151
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %for.end49
  %31 = load i32*, i32** %buffer24, align 8, !dbg !153
  %32 = bitcast i32* %31 to i8*, !dbg !153
  call void @free(i8* %32) #5, !dbg !154
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.end21
  ret void, !dbg !155
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_good() #0 !dbg !156 {
entry:
  call void @goodB2G(), !dbg !157
  call void @goodG2B(), !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !160 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !166, metadata !DIExpression()), !dbg !167
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !168, metadata !DIExpression()), !dbg !169
  %call = call i64 @time(i64* null) #5, !dbg !170
  %conv = trunc i64 %call to i32, !dbg !171
  call void @srand(i32 %conv) #5, !dbg !172
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !173
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_good(), !dbg !174
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !175
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !176
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_bad(), !dbg !177
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !178
  ret i32 0, !dbg !179
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !180 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i24 = alloca i32, align 4
  %buffer25 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !181, metadata !DIExpression()), !dbg !182
  store i32 -1, i32* %data, align 4, !dbg !183
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !184
  %tobool = icmp ne i32 %call, 0, !dbg !184
  br i1 %tobool, label %if.then, label %if.else, !dbg !186

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !187
  br label %if.end, !dbg !189

if.else:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !190
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !192
  %tobool2 = icmp ne i32 %call1, 0, !dbg !192
  br i1 %tobool2, label %if.then3, label %if.else23, !dbg !194

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !195, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !199, metadata !DIExpression()), !dbg !200
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !201
  %0 = bitcast i8* %call4 to i32*, !dbg !202
  store i32* %0, i32** %buffer, align 8, !dbg !200
  %1 = load i32*, i32** %buffer, align 8, !dbg !203
  %cmp = icmp eq i32* %1, null, !dbg !205
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !206

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !207
  unreachable, !dbg !207

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !212
  %cmp7 = icmp slt i32 %2, 10, !dbg !214
  br i1 %cmp7, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !216
  %4 = load i32, i32* %i, align 4, !dbg !218
  %idxprom = sext i32 %4 to i64, !dbg !216
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !216
  store i32 0, i32* %arrayidx, align 4, !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %5, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !222, !llvm.loop !223

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !225
  %cmp8 = icmp sge i32 %6, 0, !dbg !227
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !228

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !229
  %cmp9 = icmp slt i32 %7, 10, !dbg !230
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !231

if.then10:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !232
  %9 = load i32, i32* %data, align 4, !dbg !234
  %idxprom11 = sext i32 %9 to i64, !dbg !232
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !232
  store i32 1, i32* %arrayidx12, align 4, !dbg !235
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond13, !dbg !238

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !239
  %cmp14 = icmp slt i32 %10, 10, !dbg !241
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !242

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !243
  %12 = load i32, i32* %i, align 4, !dbg !245
  %idxprom16 = sext i32 %12 to i64, !dbg !243
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !243
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !243
  call void @printIntLine(i32 %13), !dbg !246
  br label %for.inc18, !dbg !247

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !248
  %inc19 = add nsw i32 %14, 1, !dbg !248
  store i32 %inc19, i32* %i, align 4, !dbg !248
  br label %for.cond13, !dbg !249, !llvm.loop !250

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !252

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !253
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !255
  %16 = bitcast i32* %15 to i8*, !dbg !255
  call void @free(i8* %16) #5, !dbg !256
  br label %if.end54, !dbg !257

if.else23:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i24, metadata !258, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32** %buffer25, metadata !262, metadata !DIExpression()), !dbg !263
  %call26 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !264
  %17 = bitcast i8* %call26 to i32*, !dbg !265
  store i32* %17, i32** %buffer25, align 8, !dbg !263
  %18 = load i32*, i32** %buffer25, align 8, !dbg !266
  %cmp27 = icmp eq i32* %18, null, !dbg !268
  br i1 %cmp27, label %if.then28, label %if.end29, !dbg !269

if.then28:                                        ; preds = %if.else23
  call void @exit(i32 -1) #6, !dbg !270
  unreachable, !dbg !270

if.end29:                                         ; preds = %if.else23
  store i32 0, i32* %i24, align 4, !dbg !272
  br label %for.cond30, !dbg !274

for.cond30:                                       ; preds = %for.inc35, %if.end29
  %19 = load i32, i32* %i24, align 4, !dbg !275
  %cmp31 = icmp slt i32 %19, 10, !dbg !277
  br i1 %cmp31, label %for.body32, label %for.end37, !dbg !278

for.body32:                                       ; preds = %for.cond30
  %20 = load i32*, i32** %buffer25, align 8, !dbg !279
  %21 = load i32, i32* %i24, align 4, !dbg !281
  %idxprom33 = sext i32 %21 to i64, !dbg !279
  %arrayidx34 = getelementptr inbounds i32, i32* %20, i64 %idxprom33, !dbg !279
  store i32 0, i32* %arrayidx34, align 4, !dbg !282
  br label %for.inc35, !dbg !283

for.inc35:                                        ; preds = %for.body32
  %22 = load i32, i32* %i24, align 4, !dbg !284
  %inc36 = add nsw i32 %22, 1, !dbg !284
  store i32 %inc36, i32* %i24, align 4, !dbg !284
  br label %for.cond30, !dbg !285, !llvm.loop !286

for.end37:                                        ; preds = %for.cond30
  %23 = load i32, i32* %data, align 4, !dbg !288
  %cmp38 = icmp sge i32 %23, 0, !dbg !290
  br i1 %cmp38, label %land.lhs.true39, label %if.else52, !dbg !291

land.lhs.true39:                                  ; preds = %for.end37
  %24 = load i32, i32* %data, align 4, !dbg !292
  %cmp40 = icmp slt i32 %24, 10, !dbg !293
  br i1 %cmp40, label %if.then41, label %if.else52, !dbg !294

if.then41:                                        ; preds = %land.lhs.true39
  %25 = load i32*, i32** %buffer25, align 8, !dbg !295
  %26 = load i32, i32* %data, align 4, !dbg !297
  %idxprom42 = sext i32 %26 to i64, !dbg !295
  %arrayidx43 = getelementptr inbounds i32, i32* %25, i64 %idxprom42, !dbg !295
  store i32 1, i32* %arrayidx43, align 4, !dbg !298
  store i32 0, i32* %i24, align 4, !dbg !299
  br label %for.cond44, !dbg !301

for.cond44:                                       ; preds = %for.inc49, %if.then41
  %27 = load i32, i32* %i24, align 4, !dbg !302
  %cmp45 = icmp slt i32 %27, 10, !dbg !304
  br i1 %cmp45, label %for.body46, label %for.end51, !dbg !305

for.body46:                                       ; preds = %for.cond44
  %28 = load i32*, i32** %buffer25, align 8, !dbg !306
  %29 = load i32, i32* %i24, align 4, !dbg !308
  %idxprom47 = sext i32 %29 to i64, !dbg !306
  %arrayidx48 = getelementptr inbounds i32, i32* %28, i64 %idxprom47, !dbg !306
  %30 = load i32, i32* %arrayidx48, align 4, !dbg !306
  call void @printIntLine(i32 %30), !dbg !309
  br label %for.inc49, !dbg !310

for.inc49:                                        ; preds = %for.body46
  %31 = load i32, i32* %i24, align 4, !dbg !311
  %inc50 = add nsw i32 %31, 1, !dbg !311
  store i32 %inc50, i32* %i24, align 4, !dbg !311
  br label %for.cond44, !dbg !312, !llvm.loop !313

for.end51:                                        ; preds = %for.cond44
  br label %if.end53, !dbg !315

if.else52:                                        ; preds = %land.lhs.true39, %for.end37
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !316
  br label %if.end53

if.end53:                                         ; preds = %if.else52, %for.end51
  %32 = load i32*, i32** %buffer25, align 8, !dbg !318
  %33 = bitcast i32* %32 to i8*, !dbg !318
  call void @free(i8* %33) #5, !dbg !319
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.end22
  ret void, !dbg !320
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !321 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %buffer24 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !322, metadata !DIExpression()), !dbg !323
  store i32 -1, i32* %data, align 4, !dbg !324
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !325
  %tobool = icmp ne i32 %call, 0, !dbg !325
  br i1 %tobool, label %if.then, label %if.else, !dbg !327

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !328
  br label %if.end, !dbg !330

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !331
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !333
  %tobool2 = icmp ne i32 %call1, 0, !dbg !333
  br i1 %tobool2, label %if.then3, label %if.else22, !dbg !335

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !336, metadata !DIExpression()), !dbg !339
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !340, metadata !DIExpression()), !dbg !341
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !342
  %0 = bitcast i8* %call4 to i32*, !dbg !343
  store i32* %0, i32** %buffer, align 8, !dbg !341
  %1 = load i32*, i32** %buffer, align 8, !dbg !344
  %cmp = icmp eq i32* %1, null, !dbg !346
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !347

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !348
  unreachable, !dbg !348

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !350
  br label %for.cond, !dbg !352

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !353
  %cmp7 = icmp slt i32 %2, 10, !dbg !355
  br i1 %cmp7, label %for.body, label %for.end, !dbg !356

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !357
  %4 = load i32, i32* %i, align 4, !dbg !359
  %idxprom = sext i32 %4 to i64, !dbg !357
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !357
  store i32 0, i32* %arrayidx, align 4, !dbg !360
  br label %for.inc, !dbg !361

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !362
  %inc = add nsw i32 %5, 1, !dbg !362
  store i32 %inc, i32* %i, align 4, !dbg !362
  br label %for.cond, !dbg !363, !llvm.loop !364

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !366
  %cmp8 = icmp sge i32 %6, 0, !dbg !368
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !369

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !370
  %8 = load i32, i32* %data, align 4, !dbg !372
  %idxprom10 = sext i32 %8 to i64, !dbg !370
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !370
  store i32 1, i32* %arrayidx11, align 4, !dbg !373
  store i32 0, i32* %i, align 4, !dbg !374
  br label %for.cond12, !dbg !376

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !377
  %cmp13 = icmp slt i32 %9, 10, !dbg !379
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !380

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !381
  %11 = load i32, i32* %i, align 4, !dbg !383
  %idxprom15 = sext i32 %11 to i64, !dbg !381
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !381
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !381
  call void @printIntLine(i32 %12), !dbg !384
  br label %for.inc17, !dbg !385

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !386
  %inc18 = add nsw i32 %13, 1, !dbg !386
  store i32 %inc18, i32* %i, align 4, !dbg !386
  br label %for.cond12, !dbg !387, !llvm.loop !388

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !390

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !391
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !393
  %15 = bitcast i32* %14 to i8*, !dbg !393
  call void @free(i8* %15) #5, !dbg !394
  br label %if.end51, !dbg !395

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !396, metadata !DIExpression()), !dbg !399
  call void @llvm.dbg.declare(metadata i32** %buffer24, metadata !400, metadata !DIExpression()), !dbg !401
  %call25 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !402
  %16 = bitcast i8* %call25 to i32*, !dbg !403
  store i32* %16, i32** %buffer24, align 8, !dbg !401
  %17 = load i32*, i32** %buffer24, align 8, !dbg !404
  %cmp26 = icmp eq i32* %17, null, !dbg !406
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !407

if.then27:                                        ; preds = %if.else22
  call void @exit(i32 -1) #6, !dbg !408
  unreachable, !dbg !408

if.end28:                                         ; preds = %if.else22
  store i32 0, i32* %i23, align 4, !dbg !410
  br label %for.cond29, !dbg !412

for.cond29:                                       ; preds = %for.inc34, %if.end28
  %18 = load i32, i32* %i23, align 4, !dbg !413
  %cmp30 = icmp slt i32 %18, 10, !dbg !415
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !416

for.body31:                                       ; preds = %for.cond29
  %19 = load i32*, i32** %buffer24, align 8, !dbg !417
  %20 = load i32, i32* %i23, align 4, !dbg !419
  %idxprom32 = sext i32 %20 to i64, !dbg !417
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %idxprom32, !dbg !417
  store i32 0, i32* %arrayidx33, align 4, !dbg !420
  br label %for.inc34, !dbg !421

for.inc34:                                        ; preds = %for.body31
  %21 = load i32, i32* %i23, align 4, !dbg !422
  %inc35 = add nsw i32 %21, 1, !dbg !422
  store i32 %inc35, i32* %i23, align 4, !dbg !422
  br label %for.cond29, !dbg !423, !llvm.loop !424

for.end36:                                        ; preds = %for.cond29
  %22 = load i32, i32* %data, align 4, !dbg !426
  %cmp37 = icmp sge i32 %22, 0, !dbg !428
  br i1 %cmp37, label %if.then38, label %if.else49, !dbg !429

if.then38:                                        ; preds = %for.end36
  %23 = load i32*, i32** %buffer24, align 8, !dbg !430
  %24 = load i32, i32* %data, align 4, !dbg !432
  %idxprom39 = sext i32 %24 to i64, !dbg !430
  %arrayidx40 = getelementptr inbounds i32, i32* %23, i64 %idxprom39, !dbg !430
  store i32 1, i32* %arrayidx40, align 4, !dbg !433
  store i32 0, i32* %i23, align 4, !dbg !434
  br label %for.cond41, !dbg !436

for.cond41:                                       ; preds = %for.inc46, %if.then38
  %25 = load i32, i32* %i23, align 4, !dbg !437
  %cmp42 = icmp slt i32 %25, 10, !dbg !439
  br i1 %cmp42, label %for.body43, label %for.end48, !dbg !440

for.body43:                                       ; preds = %for.cond41
  %26 = load i32*, i32** %buffer24, align 8, !dbg !441
  %27 = load i32, i32* %i23, align 4, !dbg !443
  %idxprom44 = sext i32 %27 to i64, !dbg !441
  %arrayidx45 = getelementptr inbounds i32, i32* %26, i64 %idxprom44, !dbg !441
  %28 = load i32, i32* %arrayidx45, align 4, !dbg !441
  call void @printIntLine(i32 %28), !dbg !444
  br label %for.inc46, !dbg !445

for.inc46:                                        ; preds = %for.body43
  %29 = load i32, i32* %i23, align 4, !dbg !446
  %inc47 = add nsw i32 %29, 1, !dbg !446
  store i32 %inc47, i32* %i23, align 4, !dbg !446
  br label %for.cond41, !dbg !447, !llvm.loop !448

for.end48:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !450

if.else49:                                        ; preds = %for.end36
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !451
  br label %if.end50

if.end50:                                         ; preds = %if.else49, %for.end48
  %30 = load i32*, i32** %buffer24, align 8, !dbg !453
  %31 = bitcast i32* %30 to i8*, !dbg !453
  call void @free(i8* %31) #5, !dbg !454
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end21
  ret void, !dbg !455
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = !DILocation(line: 36, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!29 = !DILocation(line: 38, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 8)
!31 = !DILocation(line: 38, column: 8, scope: !14)
!32 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 41, type: !5)
!33 = distinct !DILexicalBlock(scope: !34, file: !15, line: 40, column: 9)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 39, column: 5)
!35 = !DILocation(line: 41, column: 17, scope: !33)
!36 = !DILocalVariable(name: "buffer", scope: !33, file: !15, line: 42, type: !4)
!37 = !DILocation(line: 42, column: 19, scope: !33)
!38 = !DILocation(line: 42, column: 35, scope: !33)
!39 = !DILocation(line: 42, column: 28, scope: !33)
!40 = !DILocation(line: 43, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !15, line: 43, column: 17)
!42 = !DILocation(line: 43, column: 24, scope: !41)
!43 = !DILocation(line: 43, column: 17, scope: !33)
!44 = !DILocation(line: 43, column: 34, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 43, column: 33)
!46 = !DILocation(line: 45, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !33, file: !15, line: 45, column: 13)
!48 = !DILocation(line: 45, column: 18, scope: !47)
!49 = !DILocation(line: 45, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !15, line: 45, column: 13)
!51 = !DILocation(line: 45, column: 27, scope: !50)
!52 = !DILocation(line: 45, column: 13, scope: !47)
!53 = !DILocation(line: 47, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 46, column: 13)
!55 = !DILocation(line: 47, column: 24, scope: !54)
!56 = !DILocation(line: 47, column: 27, scope: !54)
!57 = !DILocation(line: 48, column: 13, scope: !54)
!58 = !DILocation(line: 45, column: 34, scope: !50)
!59 = !DILocation(line: 45, column: 13, scope: !50)
!60 = distinct !{!60, !52, !61, !62}
!61 = !DILocation(line: 48, column: 13, scope: !47)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 51, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !33, file: !15, line: 51, column: 17)
!65 = !DILocation(line: 51, column: 22, scope: !64)
!66 = !DILocation(line: 51, column: 17, scope: !33)
!67 = !DILocation(line: 53, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 52, column: 13)
!69 = !DILocation(line: 53, column: 24, scope: !68)
!70 = !DILocation(line: 53, column: 30, scope: !68)
!71 = !DILocation(line: 55, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !15, line: 55, column: 17)
!73 = !DILocation(line: 55, column: 21, scope: !72)
!74 = !DILocation(line: 55, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !15, line: 55, column: 17)
!76 = !DILocation(line: 55, column: 30, scope: !75)
!77 = !DILocation(line: 55, column: 17, scope: !72)
!78 = !DILocation(line: 57, column: 34, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 56, column: 17)
!80 = !DILocation(line: 57, column: 41, scope: !79)
!81 = !DILocation(line: 57, column: 21, scope: !79)
!82 = !DILocation(line: 58, column: 17, scope: !79)
!83 = !DILocation(line: 55, column: 37, scope: !75)
!84 = !DILocation(line: 55, column: 17, scope: !75)
!85 = distinct !{!85, !77, !86, !62}
!86 = !DILocation(line: 58, column: 17, scope: !72)
!87 = !DILocation(line: 59, column: 13, scope: !68)
!88 = !DILocation(line: 62, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !64, file: !15, line: 61, column: 13)
!90 = !DILocation(line: 64, column: 18, scope: !33)
!91 = !DILocation(line: 64, column: 13, scope: !33)
!92 = !DILocation(line: 66, column: 5, scope: !34)
!93 = !DILocalVariable(name: "i", scope: !94, file: !15, line: 70, type: !5)
!94 = distinct !DILexicalBlock(scope: !95, file: !15, line: 69, column: 9)
!95 = distinct !DILexicalBlock(scope: !30, file: !15, line: 68, column: 5)
!96 = !DILocation(line: 70, column: 17, scope: !94)
!97 = !DILocalVariable(name: "buffer", scope: !94, file: !15, line: 71, type: !4)
!98 = !DILocation(line: 71, column: 19, scope: !94)
!99 = !DILocation(line: 71, column: 35, scope: !94)
!100 = !DILocation(line: 71, column: 28, scope: !94)
!101 = !DILocation(line: 72, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !15, line: 72, column: 17)
!103 = !DILocation(line: 72, column: 24, scope: !102)
!104 = !DILocation(line: 72, column: 17, scope: !94)
!105 = !DILocation(line: 72, column: 34, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 72, column: 33)
!107 = !DILocation(line: 74, column: 20, scope: !108)
!108 = distinct !DILexicalBlock(scope: !94, file: !15, line: 74, column: 13)
!109 = !DILocation(line: 74, column: 18, scope: !108)
!110 = !DILocation(line: 74, column: 25, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !15, line: 74, column: 13)
!112 = !DILocation(line: 74, column: 27, scope: !111)
!113 = !DILocation(line: 74, column: 13, scope: !108)
!114 = !DILocation(line: 76, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 75, column: 13)
!116 = !DILocation(line: 76, column: 24, scope: !115)
!117 = !DILocation(line: 76, column: 27, scope: !115)
!118 = !DILocation(line: 77, column: 13, scope: !115)
!119 = !DILocation(line: 74, column: 34, scope: !111)
!120 = !DILocation(line: 74, column: 13, scope: !111)
!121 = distinct !{!121, !113, !122, !62}
!122 = !DILocation(line: 77, column: 13, scope: !108)
!123 = !DILocation(line: 79, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !94, file: !15, line: 79, column: 17)
!125 = !DILocation(line: 79, column: 22, scope: !124)
!126 = !DILocation(line: 79, column: 27, scope: !124)
!127 = !DILocation(line: 79, column: 30, scope: !124)
!128 = !DILocation(line: 79, column: 35, scope: !124)
!129 = !DILocation(line: 79, column: 17, scope: !94)
!130 = !DILocation(line: 81, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !15, line: 80, column: 13)
!132 = !DILocation(line: 81, column: 24, scope: !131)
!133 = !DILocation(line: 81, column: 30, scope: !131)
!134 = !DILocation(line: 83, column: 23, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 83, column: 17)
!136 = !DILocation(line: 83, column: 21, scope: !135)
!137 = !DILocation(line: 83, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !15, line: 83, column: 17)
!139 = !DILocation(line: 83, column: 30, scope: !138)
!140 = !DILocation(line: 83, column: 17, scope: !135)
!141 = !DILocation(line: 85, column: 34, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !15, line: 84, column: 17)
!143 = !DILocation(line: 85, column: 41, scope: !142)
!144 = !DILocation(line: 85, column: 21, scope: !142)
!145 = !DILocation(line: 86, column: 17, scope: !142)
!146 = !DILocation(line: 83, column: 37, scope: !138)
!147 = !DILocation(line: 83, column: 17, scope: !138)
!148 = distinct !{!148, !140, !149, !62}
!149 = !DILocation(line: 86, column: 17, scope: !135)
!150 = !DILocation(line: 87, column: 13, scope: !131)
!151 = !DILocation(line: 90, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !124, file: !15, line: 89, column: 13)
!153 = !DILocation(line: 92, column: 18, scope: !94)
!154 = !DILocation(line: 92, column: 13, scope: !94)
!155 = !DILocation(line: 95, column: 1, scope: !14)
!156 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_good", scope: !15, file: !15, line: 257, type: !16, scopeLine: 258, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocation(line: 259, column: 5, scope: !156)
!158 = !DILocation(line: 260, column: 5, scope: !156)
!159 = !DILocation(line: 261, column: 1, scope: !156)
!160 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 272, type: !161, scopeLine: 273, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DISubroutineType(types: !162)
!162 = !{!5, !5, !163}
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!166 = !DILocalVariable(name: "argc", arg: 1, scope: !160, file: !15, line: 272, type: !5)
!167 = !DILocation(line: 272, column: 14, scope: !160)
!168 = !DILocalVariable(name: "argv", arg: 2, scope: !160, file: !15, line: 272, type: !163)
!169 = !DILocation(line: 272, column: 27, scope: !160)
!170 = !DILocation(line: 275, column: 22, scope: !160)
!171 = !DILocation(line: 275, column: 12, scope: !160)
!172 = !DILocation(line: 275, column: 5, scope: !160)
!173 = !DILocation(line: 277, column: 5, scope: !160)
!174 = !DILocation(line: 278, column: 5, scope: !160)
!175 = !DILocation(line: 279, column: 5, scope: !160)
!176 = !DILocation(line: 282, column: 5, scope: !160)
!177 = !DILocation(line: 283, column: 5, scope: !160)
!178 = !DILocation(line: 284, column: 5, scope: !160)
!179 = !DILocation(line: 286, column: 5, scope: !160)
!180 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 104, type: !16, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!181 = !DILocalVariable(name: "data", scope: !180, file: !15, line: 106, type: !5)
!182 = !DILocation(line: 106, column: 9, scope: !180)
!183 = !DILocation(line: 108, column: 10, scope: !180)
!184 = !DILocation(line: 109, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !15, line: 109, column: 8)
!186 = !DILocation(line: 109, column: 8, scope: !180)
!187 = !DILocation(line: 112, column: 14, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !15, line: 110, column: 5)
!189 = !DILocation(line: 113, column: 5, scope: !188)
!190 = !DILocation(line: 117, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !15, line: 115, column: 5)
!192 = !DILocation(line: 119, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !180, file: !15, line: 119, column: 8)
!194 = !DILocation(line: 119, column: 8, scope: !180)
!195 = !DILocalVariable(name: "i", scope: !196, file: !15, line: 122, type: !5)
!196 = distinct !DILexicalBlock(scope: !197, file: !15, line: 121, column: 9)
!197 = distinct !DILexicalBlock(scope: !193, file: !15, line: 120, column: 5)
!198 = !DILocation(line: 122, column: 17, scope: !196)
!199 = !DILocalVariable(name: "buffer", scope: !196, file: !15, line: 123, type: !4)
!200 = !DILocation(line: 123, column: 19, scope: !196)
!201 = !DILocation(line: 123, column: 35, scope: !196)
!202 = !DILocation(line: 123, column: 28, scope: !196)
!203 = !DILocation(line: 124, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !196, file: !15, line: 124, column: 17)
!205 = !DILocation(line: 124, column: 24, scope: !204)
!206 = !DILocation(line: 124, column: 17, scope: !196)
!207 = !DILocation(line: 124, column: 34, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !15, line: 124, column: 33)
!209 = !DILocation(line: 126, column: 20, scope: !210)
!210 = distinct !DILexicalBlock(scope: !196, file: !15, line: 126, column: 13)
!211 = !DILocation(line: 126, column: 18, scope: !210)
!212 = !DILocation(line: 126, column: 25, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !15, line: 126, column: 13)
!214 = !DILocation(line: 126, column: 27, scope: !213)
!215 = !DILocation(line: 126, column: 13, scope: !210)
!216 = !DILocation(line: 128, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !15, line: 127, column: 13)
!218 = !DILocation(line: 128, column: 24, scope: !217)
!219 = !DILocation(line: 128, column: 27, scope: !217)
!220 = !DILocation(line: 129, column: 13, scope: !217)
!221 = !DILocation(line: 126, column: 34, scope: !213)
!222 = !DILocation(line: 126, column: 13, scope: !213)
!223 = distinct !{!223, !215, !224, !62}
!224 = !DILocation(line: 129, column: 13, scope: !210)
!225 = !DILocation(line: 131, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !196, file: !15, line: 131, column: 17)
!227 = !DILocation(line: 131, column: 22, scope: !226)
!228 = !DILocation(line: 131, column: 27, scope: !226)
!229 = !DILocation(line: 131, column: 30, scope: !226)
!230 = !DILocation(line: 131, column: 35, scope: !226)
!231 = !DILocation(line: 131, column: 17, scope: !196)
!232 = !DILocation(line: 133, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !226, file: !15, line: 132, column: 13)
!234 = !DILocation(line: 133, column: 24, scope: !233)
!235 = !DILocation(line: 133, column: 30, scope: !233)
!236 = !DILocation(line: 135, column: 23, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !15, line: 135, column: 17)
!238 = !DILocation(line: 135, column: 21, scope: !237)
!239 = !DILocation(line: 135, column: 28, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !15, line: 135, column: 17)
!241 = !DILocation(line: 135, column: 30, scope: !240)
!242 = !DILocation(line: 135, column: 17, scope: !237)
!243 = !DILocation(line: 137, column: 34, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !15, line: 136, column: 17)
!245 = !DILocation(line: 137, column: 41, scope: !244)
!246 = !DILocation(line: 137, column: 21, scope: !244)
!247 = !DILocation(line: 138, column: 17, scope: !244)
!248 = !DILocation(line: 135, column: 37, scope: !240)
!249 = !DILocation(line: 135, column: 17, scope: !240)
!250 = distinct !{!250, !242, !251, !62}
!251 = !DILocation(line: 138, column: 17, scope: !237)
!252 = !DILocation(line: 139, column: 13, scope: !233)
!253 = !DILocation(line: 142, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !226, file: !15, line: 141, column: 13)
!255 = !DILocation(line: 144, column: 18, scope: !196)
!256 = !DILocation(line: 144, column: 13, scope: !196)
!257 = !DILocation(line: 146, column: 5, scope: !197)
!258 = !DILocalVariable(name: "i", scope: !259, file: !15, line: 150, type: !5)
!259 = distinct !DILexicalBlock(scope: !260, file: !15, line: 149, column: 9)
!260 = distinct !DILexicalBlock(scope: !193, file: !15, line: 148, column: 5)
!261 = !DILocation(line: 150, column: 17, scope: !259)
!262 = !DILocalVariable(name: "buffer", scope: !259, file: !15, line: 151, type: !4)
!263 = !DILocation(line: 151, column: 19, scope: !259)
!264 = !DILocation(line: 151, column: 35, scope: !259)
!265 = !DILocation(line: 151, column: 28, scope: !259)
!266 = !DILocation(line: 152, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !259, file: !15, line: 152, column: 17)
!268 = !DILocation(line: 152, column: 24, scope: !267)
!269 = !DILocation(line: 152, column: 17, scope: !259)
!270 = !DILocation(line: 152, column: 34, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !15, line: 152, column: 33)
!272 = !DILocation(line: 154, column: 20, scope: !273)
!273 = distinct !DILexicalBlock(scope: !259, file: !15, line: 154, column: 13)
!274 = !DILocation(line: 154, column: 18, scope: !273)
!275 = !DILocation(line: 154, column: 25, scope: !276)
!276 = distinct !DILexicalBlock(scope: !273, file: !15, line: 154, column: 13)
!277 = !DILocation(line: 154, column: 27, scope: !276)
!278 = !DILocation(line: 154, column: 13, scope: !273)
!279 = !DILocation(line: 156, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !15, line: 155, column: 13)
!281 = !DILocation(line: 156, column: 24, scope: !280)
!282 = !DILocation(line: 156, column: 27, scope: !280)
!283 = !DILocation(line: 157, column: 13, scope: !280)
!284 = !DILocation(line: 154, column: 34, scope: !276)
!285 = !DILocation(line: 154, column: 13, scope: !276)
!286 = distinct !{!286, !278, !287, !62}
!287 = !DILocation(line: 157, column: 13, scope: !273)
!288 = !DILocation(line: 159, column: 17, scope: !289)
!289 = distinct !DILexicalBlock(scope: !259, file: !15, line: 159, column: 17)
!290 = !DILocation(line: 159, column: 22, scope: !289)
!291 = !DILocation(line: 159, column: 27, scope: !289)
!292 = !DILocation(line: 159, column: 30, scope: !289)
!293 = !DILocation(line: 159, column: 35, scope: !289)
!294 = !DILocation(line: 159, column: 17, scope: !259)
!295 = !DILocation(line: 161, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !289, file: !15, line: 160, column: 13)
!297 = !DILocation(line: 161, column: 24, scope: !296)
!298 = !DILocation(line: 161, column: 30, scope: !296)
!299 = !DILocation(line: 163, column: 23, scope: !300)
!300 = distinct !DILexicalBlock(scope: !296, file: !15, line: 163, column: 17)
!301 = !DILocation(line: 163, column: 21, scope: !300)
!302 = !DILocation(line: 163, column: 28, scope: !303)
!303 = distinct !DILexicalBlock(scope: !300, file: !15, line: 163, column: 17)
!304 = !DILocation(line: 163, column: 30, scope: !303)
!305 = !DILocation(line: 163, column: 17, scope: !300)
!306 = !DILocation(line: 165, column: 34, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !15, line: 164, column: 17)
!308 = !DILocation(line: 165, column: 41, scope: !307)
!309 = !DILocation(line: 165, column: 21, scope: !307)
!310 = !DILocation(line: 166, column: 17, scope: !307)
!311 = !DILocation(line: 163, column: 37, scope: !303)
!312 = !DILocation(line: 163, column: 17, scope: !303)
!313 = distinct !{!313, !305, !314, !62}
!314 = !DILocation(line: 166, column: 17, scope: !300)
!315 = !DILocation(line: 167, column: 13, scope: !296)
!316 = !DILocation(line: 170, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !289, file: !15, line: 169, column: 13)
!318 = !DILocation(line: 172, column: 18, scope: !259)
!319 = !DILocation(line: 172, column: 13, scope: !259)
!320 = !DILocation(line: 175, column: 1, scope: !180)
!321 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 180, type: !16, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!322 = !DILocalVariable(name: "data", scope: !321, file: !15, line: 182, type: !5)
!323 = !DILocation(line: 182, column: 9, scope: !321)
!324 = !DILocation(line: 184, column: 10, scope: !321)
!325 = !DILocation(line: 185, column: 8, scope: !326)
!326 = distinct !DILexicalBlock(scope: !321, file: !15, line: 185, column: 8)
!327 = !DILocation(line: 185, column: 8, scope: !321)
!328 = !DILocation(line: 189, column: 14, scope: !329)
!329 = distinct !DILexicalBlock(scope: !326, file: !15, line: 186, column: 5)
!330 = !DILocation(line: 190, column: 5, scope: !329)
!331 = !DILocation(line: 195, column: 14, scope: !332)
!332 = distinct !DILexicalBlock(scope: !326, file: !15, line: 192, column: 5)
!333 = !DILocation(line: 197, column: 8, scope: !334)
!334 = distinct !DILexicalBlock(scope: !321, file: !15, line: 197, column: 8)
!335 = !DILocation(line: 197, column: 8, scope: !321)
!336 = !DILocalVariable(name: "i", scope: !337, file: !15, line: 200, type: !5)
!337 = distinct !DILexicalBlock(scope: !338, file: !15, line: 199, column: 9)
!338 = distinct !DILexicalBlock(scope: !334, file: !15, line: 198, column: 5)
!339 = !DILocation(line: 200, column: 17, scope: !337)
!340 = !DILocalVariable(name: "buffer", scope: !337, file: !15, line: 201, type: !4)
!341 = !DILocation(line: 201, column: 19, scope: !337)
!342 = !DILocation(line: 201, column: 35, scope: !337)
!343 = !DILocation(line: 201, column: 28, scope: !337)
!344 = !DILocation(line: 202, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !337, file: !15, line: 202, column: 17)
!346 = !DILocation(line: 202, column: 24, scope: !345)
!347 = !DILocation(line: 202, column: 17, scope: !337)
!348 = !DILocation(line: 202, column: 34, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !15, line: 202, column: 33)
!350 = !DILocation(line: 204, column: 20, scope: !351)
!351 = distinct !DILexicalBlock(scope: !337, file: !15, line: 204, column: 13)
!352 = !DILocation(line: 204, column: 18, scope: !351)
!353 = !DILocation(line: 204, column: 25, scope: !354)
!354 = distinct !DILexicalBlock(scope: !351, file: !15, line: 204, column: 13)
!355 = !DILocation(line: 204, column: 27, scope: !354)
!356 = !DILocation(line: 204, column: 13, scope: !351)
!357 = !DILocation(line: 206, column: 17, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !15, line: 205, column: 13)
!359 = !DILocation(line: 206, column: 24, scope: !358)
!360 = !DILocation(line: 206, column: 27, scope: !358)
!361 = !DILocation(line: 207, column: 13, scope: !358)
!362 = !DILocation(line: 204, column: 34, scope: !354)
!363 = !DILocation(line: 204, column: 13, scope: !354)
!364 = distinct !{!364, !356, !365, !62}
!365 = !DILocation(line: 207, column: 13, scope: !351)
!366 = !DILocation(line: 210, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !337, file: !15, line: 210, column: 17)
!368 = !DILocation(line: 210, column: 22, scope: !367)
!369 = !DILocation(line: 210, column: 17, scope: !337)
!370 = !DILocation(line: 212, column: 17, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !15, line: 211, column: 13)
!372 = !DILocation(line: 212, column: 24, scope: !371)
!373 = !DILocation(line: 212, column: 30, scope: !371)
!374 = !DILocation(line: 214, column: 23, scope: !375)
!375 = distinct !DILexicalBlock(scope: !371, file: !15, line: 214, column: 17)
!376 = !DILocation(line: 214, column: 21, scope: !375)
!377 = !DILocation(line: 214, column: 28, scope: !378)
!378 = distinct !DILexicalBlock(scope: !375, file: !15, line: 214, column: 17)
!379 = !DILocation(line: 214, column: 30, scope: !378)
!380 = !DILocation(line: 214, column: 17, scope: !375)
!381 = !DILocation(line: 216, column: 34, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !15, line: 215, column: 17)
!383 = !DILocation(line: 216, column: 41, scope: !382)
!384 = !DILocation(line: 216, column: 21, scope: !382)
!385 = !DILocation(line: 217, column: 17, scope: !382)
!386 = !DILocation(line: 214, column: 37, scope: !378)
!387 = !DILocation(line: 214, column: 17, scope: !378)
!388 = distinct !{!388, !380, !389, !62}
!389 = !DILocation(line: 217, column: 17, scope: !375)
!390 = !DILocation(line: 218, column: 13, scope: !371)
!391 = !DILocation(line: 221, column: 17, scope: !392)
!392 = distinct !DILexicalBlock(scope: !367, file: !15, line: 220, column: 13)
!393 = !DILocation(line: 223, column: 18, scope: !337)
!394 = !DILocation(line: 223, column: 13, scope: !337)
!395 = !DILocation(line: 225, column: 5, scope: !338)
!396 = !DILocalVariable(name: "i", scope: !397, file: !15, line: 229, type: !5)
!397 = distinct !DILexicalBlock(scope: !398, file: !15, line: 228, column: 9)
!398 = distinct !DILexicalBlock(scope: !334, file: !15, line: 227, column: 5)
!399 = !DILocation(line: 229, column: 17, scope: !397)
!400 = !DILocalVariable(name: "buffer", scope: !397, file: !15, line: 230, type: !4)
!401 = !DILocation(line: 230, column: 19, scope: !397)
!402 = !DILocation(line: 230, column: 35, scope: !397)
!403 = !DILocation(line: 230, column: 28, scope: !397)
!404 = !DILocation(line: 231, column: 17, scope: !405)
!405 = distinct !DILexicalBlock(scope: !397, file: !15, line: 231, column: 17)
!406 = !DILocation(line: 231, column: 24, scope: !405)
!407 = !DILocation(line: 231, column: 17, scope: !397)
!408 = !DILocation(line: 231, column: 34, scope: !409)
!409 = distinct !DILexicalBlock(scope: !405, file: !15, line: 231, column: 33)
!410 = !DILocation(line: 233, column: 20, scope: !411)
!411 = distinct !DILexicalBlock(scope: !397, file: !15, line: 233, column: 13)
!412 = !DILocation(line: 233, column: 18, scope: !411)
!413 = !DILocation(line: 233, column: 25, scope: !414)
!414 = distinct !DILexicalBlock(scope: !411, file: !15, line: 233, column: 13)
!415 = !DILocation(line: 233, column: 27, scope: !414)
!416 = !DILocation(line: 233, column: 13, scope: !411)
!417 = !DILocation(line: 235, column: 17, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !15, line: 234, column: 13)
!419 = !DILocation(line: 235, column: 24, scope: !418)
!420 = !DILocation(line: 235, column: 27, scope: !418)
!421 = !DILocation(line: 236, column: 13, scope: !418)
!422 = !DILocation(line: 233, column: 34, scope: !414)
!423 = !DILocation(line: 233, column: 13, scope: !414)
!424 = distinct !{!424, !416, !425, !62}
!425 = !DILocation(line: 236, column: 13, scope: !411)
!426 = !DILocation(line: 239, column: 17, scope: !427)
!427 = distinct !DILexicalBlock(scope: !397, file: !15, line: 239, column: 17)
!428 = !DILocation(line: 239, column: 22, scope: !427)
!429 = !DILocation(line: 239, column: 17, scope: !397)
!430 = !DILocation(line: 241, column: 17, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !15, line: 240, column: 13)
!432 = !DILocation(line: 241, column: 24, scope: !431)
!433 = !DILocation(line: 241, column: 30, scope: !431)
!434 = !DILocation(line: 243, column: 23, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !15, line: 243, column: 17)
!436 = !DILocation(line: 243, column: 21, scope: !435)
!437 = !DILocation(line: 243, column: 28, scope: !438)
!438 = distinct !DILexicalBlock(scope: !435, file: !15, line: 243, column: 17)
!439 = !DILocation(line: 243, column: 30, scope: !438)
!440 = !DILocation(line: 243, column: 17, scope: !435)
!441 = !DILocation(line: 245, column: 34, scope: !442)
!442 = distinct !DILexicalBlock(scope: !438, file: !15, line: 244, column: 17)
!443 = !DILocation(line: 245, column: 41, scope: !442)
!444 = !DILocation(line: 245, column: 21, scope: !442)
!445 = !DILocation(line: 246, column: 17, scope: !442)
!446 = !DILocation(line: 243, column: 37, scope: !438)
!447 = !DILocation(line: 243, column: 17, scope: !438)
!448 = distinct !{!448, !440, !449, !62}
!449 = !DILocation(line: 246, column: 17, scope: !435)
!450 = !DILocation(line: 247, column: 13, scope: !431)
!451 = !DILocation(line: 250, column: 17, scope: !452)
!452 = distinct !DILexicalBlock(scope: !427, file: !15, line: 249, column: 13)
!453 = !DILocation(line: 252, column: 18, scope: !397)
!454 = !DILocation(line: 252, column: 13, scope: !397)
!455 = !DILocation(line: 255, column: 1, scope: !321)
