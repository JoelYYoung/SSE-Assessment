; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !21, metadata !DIExpression()), !dbg !27
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !27
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !28
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !30
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !31
  %cmp = icmp ne i8* %call, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !34
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !36
  store i32 %call2, i32* %data, align 4, !dbg !37
  br label %if.end, !dbg !38

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !39
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !44, metadata !DIExpression()), !dbg !45
  %call3 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !46
  %2 = bitcast i8* %call3 to i32*, !dbg !47
  store i32* %2, i32** %buffer, align 8, !dbg !45
  %3 = load i32*, i32** %buffer, align 8, !dbg !48
  %cmp4 = icmp eq i32* %3, null, !dbg !50
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !51

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !52
  unreachable, !dbg !52

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !57
  %cmp7 = icmp slt i32 %4, 10, !dbg !59
  br i1 %cmp7, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !61
  %6 = load i32, i32* %i, align 4, !dbg !63
  %idxprom = sext i32 %6 to i64, !dbg !61
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !61
  store i32 0, i32* %arrayidx, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !66
  %inc = add nsw i32 %7, 1, !dbg !66
  store i32 %inc, i32* %i, align 4, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !71
  %cmp8 = icmp sge i32 %8, 0, !dbg !73
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !74

if.then9:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !75
  %10 = load i32, i32* %data, align 4, !dbg !77
  %idxprom10 = sext i32 %10 to i64, !dbg !75
  %arrayidx11 = getelementptr inbounds i32, i32* %9, i64 %idxprom10, !dbg !75
  store i32 1, i32* %arrayidx11, align 4, !dbg !78
  store i32 0, i32* %i, align 4, !dbg !79
  br label %for.cond12, !dbg !81

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %11 = load i32, i32* %i, align 4, !dbg !82
  %cmp13 = icmp slt i32 %11, 10, !dbg !84
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !85

for.body14:                                       ; preds = %for.cond12
  %12 = load i32*, i32** %buffer, align 8, !dbg !86
  %13 = load i32, i32* %i, align 4, !dbg !88
  %idxprom15 = sext i32 %13 to i64, !dbg !86
  %arrayidx16 = getelementptr inbounds i32, i32* %12, i64 %idxprom15, !dbg !86
  %14 = load i32, i32* %arrayidx16, align 4, !dbg !86
  call void @printIntLine(i32 %14), !dbg !89
  br label %for.inc17, !dbg !90

for.inc17:                                        ; preds = %for.body14
  %15 = load i32, i32* %i, align 4, !dbg !91
  %inc18 = add nsw i32 %15, 1, !dbg !91
  store i32 %inc18, i32* %i, align 4, !dbg !91
  br label %for.cond12, !dbg !92, !llvm.loop !93

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !95

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %16 = load i32*, i32** %buffer, align 8, !dbg !98
  %17 = bitcast i32* %16 to i8*, !dbg !98
  call void @free(i8* %17) #8, !dbg !99
  ret void, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_good() #0 !dbg !101 {
entry:
  call void @goodB2G1(), !dbg !102
  call void @goodB2G2(), !dbg !103
  call void @goodG2B1(), !dbg !104
  call void @goodG2B2(), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !107 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call i64 @time(i64* null) #8, !dbg !116
  %conv = trunc i64 %call to i32, !dbg !117
  call void @srand(i32 %conv) #8, !dbg !118
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !119
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_good(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_bad(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !124
  ret i32 0, !dbg !125
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !126 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 -1, i32* %data, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !130, metadata !DIExpression()), !dbg !132
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !132
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !133
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !135
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !136
  %cmp = icmp ne i8* %call, null, !dbg !137
  br i1 %cmp, label %if.then, label %if.else, !dbg !138

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !139
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !141
  store i32 %call2, i32* %data, align 4, !dbg !142
  br label %if.end, !dbg !143

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !144
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !149, metadata !DIExpression()), !dbg !150
  %call3 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !151
  %2 = bitcast i8* %call3 to i32*, !dbg !152
  store i32* %2, i32** %buffer, align 8, !dbg !150
  %3 = load i32*, i32** %buffer, align 8, !dbg !153
  %cmp4 = icmp eq i32* %3, null, !dbg !155
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !156

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !157
  unreachable, !dbg !157

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !162
  %cmp7 = icmp slt i32 %4, 10, !dbg !164
  br i1 %cmp7, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !166
  %6 = load i32, i32* %i, align 4, !dbg !168
  %idxprom = sext i32 %6 to i64, !dbg !166
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !166
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !171
  %inc = add nsw i32 %7, 1, !dbg !171
  store i32 %inc, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !175
  %cmp8 = icmp sge i32 %8, 0, !dbg !177
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !178

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !179
  %cmp9 = icmp slt i32 %9, 10, !dbg !180
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !181

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !182
  %11 = load i32, i32* %data, align 4, !dbg !184
  %idxprom11 = sext i32 %11 to i64, !dbg !182
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !182
  store i32 1, i32* %arrayidx12, align 4, !dbg !185
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond13, !dbg !188

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !189
  %cmp14 = icmp slt i32 %12, 10, !dbg !191
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !192

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !193
  %14 = load i32, i32* %i, align 4, !dbg !195
  %idxprom16 = sext i32 %14 to i64, !dbg !193
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !193
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !193
  call void @printIntLine(i32 %15), !dbg !196
  br label %for.inc18, !dbg !197

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !198
  %inc19 = add nsw i32 %16, 1, !dbg !198
  store i32 %inc19, i32* %i, align 4, !dbg !198
  br label %for.cond13, !dbg !199, !llvm.loop !200

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !202

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !203
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !205
  %18 = bitcast i32* %17 to i8*, !dbg !205
  call void @free(i8* %18) #8, !dbg !206
  ret void, !dbg !207
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !208 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !209, metadata !DIExpression()), !dbg !210
  store i32 -1, i32* %data, align 4, !dbg !211
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !212, metadata !DIExpression()), !dbg !214
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !214
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !214
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !215
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !217
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !218
  %cmp = icmp ne i8* %call, null, !dbg !219
  br i1 %cmp, label %if.then, label %if.else, !dbg !220

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !221
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !223
  store i32 %call2, i32* %data, align 4, !dbg !224
  br label %if.end, !dbg !225

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !226
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !228, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !231, metadata !DIExpression()), !dbg !232
  %call3 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !233
  %2 = bitcast i8* %call3 to i32*, !dbg !234
  store i32* %2, i32** %buffer, align 8, !dbg !232
  %3 = load i32*, i32** %buffer, align 8, !dbg !235
  %cmp4 = icmp eq i32* %3, null, !dbg !237
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !238

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !239
  unreachable, !dbg !239

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !243

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !244
  %cmp7 = icmp slt i32 %4, 10, !dbg !246
  br i1 %cmp7, label %for.body, label %for.end, !dbg !247

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !248
  %6 = load i32, i32* %i, align 4, !dbg !250
  %idxprom = sext i32 %6 to i64, !dbg !248
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !248
  store i32 0, i32* %arrayidx, align 4, !dbg !251
  br label %for.inc, !dbg !252

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !253
  %inc = add nsw i32 %7, 1, !dbg !253
  store i32 %inc, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !254, !llvm.loop !255

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !257
  %cmp8 = icmp sge i32 %8, 0, !dbg !259
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !260

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !261
  %cmp9 = icmp slt i32 %9, 10, !dbg !262
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !263

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !264
  %11 = load i32, i32* %data, align 4, !dbg !266
  %idxprom11 = sext i32 %11 to i64, !dbg !264
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !264
  store i32 1, i32* %arrayidx12, align 4, !dbg !267
  store i32 0, i32* %i, align 4, !dbg !268
  br label %for.cond13, !dbg !270

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !271
  %cmp14 = icmp slt i32 %12, 10, !dbg !273
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !274

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !275
  %14 = load i32, i32* %i, align 4, !dbg !277
  %idxprom16 = sext i32 %14 to i64, !dbg !275
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !275
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !275
  call void @printIntLine(i32 %15), !dbg !278
  br label %for.inc18, !dbg !279

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !280
  %inc19 = add nsw i32 %16, 1, !dbg !280
  store i32 %inc19, i32* %i, align 4, !dbg !280
  br label %for.cond13, !dbg !281, !llvm.loop !282

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !284

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !285
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !287
  %18 = bitcast i32* %17 to i8*, !dbg !287
  call void @free(i8* %18) #8, !dbg !288
  ret void, !dbg !289
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !290 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !291, metadata !DIExpression()), !dbg !292
  store i32 -1, i32* %data, align 4, !dbg !293
  store i32 7, i32* %data, align 4, !dbg !294
  call void @llvm.dbg.declare(metadata i32* %i, metadata !295, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !298, metadata !DIExpression()), !dbg !299
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !300
  %0 = bitcast i8* %call to i32*, !dbg !301
  store i32* %0, i32** %buffer, align 8, !dbg !299
  %1 = load i32*, i32** %buffer, align 8, !dbg !302
  %cmp = icmp eq i32* %1, null, !dbg !304
  br i1 %cmp, label %if.then, label %if.end, !dbg !305

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !306
  unreachable, !dbg !306

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !308
  br label %for.cond, !dbg !310

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !311
  %cmp1 = icmp slt i32 %2, 10, !dbg !313
  br i1 %cmp1, label %for.body, label %for.end, !dbg !314

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !315
  %4 = load i32, i32* %i, align 4, !dbg !317
  %idxprom = sext i32 %4 to i64, !dbg !315
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !315
  store i32 0, i32* %arrayidx, align 4, !dbg !318
  br label %for.inc, !dbg !319

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !320
  %inc = add nsw i32 %5, 1, !dbg !320
  store i32 %inc, i32* %i, align 4, !dbg !320
  br label %for.cond, !dbg !321, !llvm.loop !322

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !324
  %cmp2 = icmp sge i32 %6, 0, !dbg !326
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !327

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !328
  %8 = load i32, i32* %data, align 4, !dbg !330
  %idxprom4 = sext i32 %8 to i64, !dbg !328
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !328
  store i32 1, i32* %arrayidx5, align 4, !dbg !331
  store i32 0, i32* %i, align 4, !dbg !332
  br label %for.cond6, !dbg !334

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !335
  %cmp7 = icmp slt i32 %9, 10, !dbg !337
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !338

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !339
  %11 = load i32, i32* %i, align 4, !dbg !341
  %idxprom9 = sext i32 %11 to i64, !dbg !339
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !339
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !339
  call void @printIntLine(i32 %12), !dbg !342
  br label %for.inc11, !dbg !343

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !344
  %inc12 = add nsw i32 %13, 1, !dbg !344
  store i32 %inc12, i32* %i, align 4, !dbg !344
  br label %for.cond6, !dbg !345, !llvm.loop !346

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !348

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !349
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !351
  %15 = bitcast i32* %14 to i8*, !dbg !351
  call void @free(i8* %15) #8, !dbg !352
  ret void, !dbg !353
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !354 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !355, metadata !DIExpression()), !dbg !356
  store i32 -1, i32* %data, align 4, !dbg !357
  store i32 7, i32* %data, align 4, !dbg !358
  call void @llvm.dbg.declare(metadata i32* %i, metadata !359, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !362, metadata !DIExpression()), !dbg !363
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !364
  %0 = bitcast i8* %call to i32*, !dbg !365
  store i32* %0, i32** %buffer, align 8, !dbg !363
  %1 = load i32*, i32** %buffer, align 8, !dbg !366
  %cmp = icmp eq i32* %1, null, !dbg !368
  br i1 %cmp, label %if.then, label %if.end, !dbg !369

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !370
  unreachable, !dbg !370

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !372
  br label %for.cond, !dbg !374

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !375
  %cmp1 = icmp slt i32 %2, 10, !dbg !377
  br i1 %cmp1, label %for.body, label %for.end, !dbg !378

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !379
  %4 = load i32, i32* %i, align 4, !dbg !381
  %idxprom = sext i32 %4 to i64, !dbg !379
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !379
  store i32 0, i32* %arrayidx, align 4, !dbg !382
  br label %for.inc, !dbg !383

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !384
  %inc = add nsw i32 %5, 1, !dbg !384
  store i32 %inc, i32* %i, align 4, !dbg !384
  br label %for.cond, !dbg !385, !llvm.loop !386

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !388
  %cmp2 = icmp sge i32 %6, 0, !dbg !390
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !391

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !392
  %8 = load i32, i32* %data, align 4, !dbg !394
  %idxprom4 = sext i32 %8 to i64, !dbg !392
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !392
  store i32 1, i32* %arrayidx5, align 4, !dbg !395
  store i32 0, i32* %i, align 4, !dbg !396
  br label %for.cond6, !dbg !398

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !399
  %cmp7 = icmp slt i32 %9, 10, !dbg !401
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !402

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !403
  %11 = load i32, i32* %i, align 4, !dbg !405
  %idxprom9 = sext i32 %11 to i64, !dbg !403
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !403
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !403
  call void @printIntLine(i32 %12), !dbg !406
  br label %for.inc11, !dbg !407

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !408
  %inc12 = add nsw i32 %13, 1, !dbg !408
  store i32 %inc12, i32* %i, align 4, !dbg !408
  br label %for.cond6, !dbg !409, !llvm.loop !410

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !412

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !413
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !415
  %15 = bitcast i32* %14 to i8*, !dbg !415
  call void @free(i8* %15) #8, !dbg !416
  ret void, !dbg !417
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !6)
!19 = !DILocation(line: 26, column: 9, scope: !14)
!20 = !DILocation(line: 28, column: 10, scope: !14)
!21 = !DILocalVariable(name: "inputBuffer", scope: !22, file: !15, line: 33, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 112, elements: !25)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!26}
!26 = !DISubrange(count: 14)
!27 = !DILocation(line: 33, column: 14, scope: !22)
!28 = !DILocation(line: 35, column: 19, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 35, column: 13)
!30 = !DILocation(line: 35, column: 49, scope: !29)
!31 = !DILocation(line: 35, column: 13, scope: !29)
!32 = !DILocation(line: 35, column: 56, scope: !29)
!33 = !DILocation(line: 35, column: 13, scope: !22)
!34 = !DILocation(line: 38, column: 25, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !15, line: 36, column: 9)
!36 = !DILocation(line: 38, column: 20, scope: !35)
!37 = !DILocation(line: 38, column: 18, scope: !35)
!38 = !DILocation(line: 39, column: 9, scope: !35)
!39 = !DILocation(line: 42, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !29, file: !15, line: 41, column: 9)
!41 = !DILocalVariable(name: "i", scope: !42, file: !15, line: 55, type: !6)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 54, column: 5)
!43 = !DILocation(line: 55, column: 13, scope: !42)
!44 = !DILocalVariable(name: "buffer", scope: !42, file: !15, line: 56, type: !5)
!45 = !DILocation(line: 56, column: 15, scope: !42)
!46 = !DILocation(line: 56, column: 31, scope: !42)
!47 = !DILocation(line: 56, column: 24, scope: !42)
!48 = !DILocation(line: 57, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !42, file: !15, line: 57, column: 13)
!50 = !DILocation(line: 57, column: 20, scope: !49)
!51 = !DILocation(line: 57, column: 13, scope: !42)
!52 = !DILocation(line: 57, column: 30, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 57, column: 29)
!54 = !DILocation(line: 59, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !42, file: !15, line: 59, column: 9)
!56 = !DILocation(line: 59, column: 14, scope: !55)
!57 = !DILocation(line: 59, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !15, line: 59, column: 9)
!59 = !DILocation(line: 59, column: 23, scope: !58)
!60 = !DILocation(line: 59, column: 9, scope: !55)
!61 = !DILocation(line: 61, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 60, column: 9)
!63 = !DILocation(line: 61, column: 20, scope: !62)
!64 = !DILocation(line: 61, column: 23, scope: !62)
!65 = !DILocation(line: 62, column: 9, scope: !62)
!66 = !DILocation(line: 59, column: 30, scope: !58)
!67 = !DILocation(line: 59, column: 9, scope: !58)
!68 = distinct !{!68, !60, !69, !70}
!69 = !DILocation(line: 62, column: 9, scope: !55)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 65, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !42, file: !15, line: 65, column: 13)
!73 = !DILocation(line: 65, column: 18, scope: !72)
!74 = !DILocation(line: 65, column: 13, scope: !42)
!75 = !DILocation(line: 67, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 66, column: 9)
!77 = !DILocation(line: 67, column: 20, scope: !76)
!78 = !DILocation(line: 67, column: 26, scope: !76)
!79 = !DILocation(line: 69, column: 19, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 69, column: 13)
!81 = !DILocation(line: 69, column: 17, scope: !80)
!82 = !DILocation(line: 69, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !15, line: 69, column: 13)
!84 = !DILocation(line: 69, column: 26, scope: !83)
!85 = !DILocation(line: 69, column: 13, scope: !80)
!86 = !DILocation(line: 71, column: 30, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 70, column: 13)
!88 = !DILocation(line: 71, column: 37, scope: !87)
!89 = !DILocation(line: 71, column: 17, scope: !87)
!90 = !DILocation(line: 72, column: 13, scope: !87)
!91 = !DILocation(line: 69, column: 33, scope: !83)
!92 = !DILocation(line: 69, column: 13, scope: !83)
!93 = distinct !{!93, !85, !94, !70}
!94 = !DILocation(line: 72, column: 13, scope: !80)
!95 = !DILocation(line: 73, column: 9, scope: !76)
!96 = !DILocation(line: 76, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !72, file: !15, line: 75, column: 9)
!98 = !DILocation(line: 78, column: 14, scope: !42)
!99 = !DILocation(line: 78, column: 9, scope: !42)
!100 = !DILocation(line: 86, column: 1, scope: !14)
!101 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_good", scope: !15, file: !15, line: 330, type: !16, scopeLine: 331, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 332, column: 5, scope: !101)
!103 = !DILocation(line: 333, column: 5, scope: !101)
!104 = !DILocation(line: 334, column: 5, scope: !101)
!105 = !DILocation(line: 335, column: 5, scope: !101)
!106 = !DILocation(line: 336, column: 1, scope: !101)
!107 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 347, type: !108, scopeLine: 348, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DISubroutineType(types: !109)
!109 = !{!6, !6, !110}
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!112 = !DILocalVariable(name: "argc", arg: 1, scope: !107, file: !15, line: 347, type: !6)
!113 = !DILocation(line: 347, column: 14, scope: !107)
!114 = !DILocalVariable(name: "argv", arg: 2, scope: !107, file: !15, line: 347, type: !110)
!115 = !DILocation(line: 347, column: 27, scope: !107)
!116 = !DILocation(line: 350, column: 22, scope: !107)
!117 = !DILocation(line: 350, column: 12, scope: !107)
!118 = !DILocation(line: 350, column: 5, scope: !107)
!119 = !DILocation(line: 352, column: 5, scope: !107)
!120 = !DILocation(line: 353, column: 5, scope: !107)
!121 = !DILocation(line: 354, column: 5, scope: !107)
!122 = !DILocation(line: 357, column: 5, scope: !107)
!123 = !DILocation(line: 358, column: 5, scope: !107)
!124 = !DILocation(line: 359, column: 5, scope: !107)
!125 = !DILocation(line: 361, column: 5, scope: !107)
!126 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 93, type: !16, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", scope: !126, file: !15, line: 95, type: !6)
!128 = !DILocation(line: 95, column: 9, scope: !126)
!129 = !DILocation(line: 97, column: 10, scope: !126)
!130 = !DILocalVariable(name: "inputBuffer", scope: !131, file: !15, line: 102, type: !23)
!131 = distinct !DILexicalBlock(scope: !126, file: !15, line: 101, column: 5)
!132 = !DILocation(line: 102, column: 14, scope: !131)
!133 = !DILocation(line: 104, column: 19, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !15, line: 104, column: 13)
!135 = !DILocation(line: 104, column: 49, scope: !134)
!136 = !DILocation(line: 104, column: 13, scope: !134)
!137 = !DILocation(line: 104, column: 56, scope: !134)
!138 = !DILocation(line: 104, column: 13, scope: !131)
!139 = !DILocation(line: 107, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !15, line: 105, column: 9)
!141 = !DILocation(line: 107, column: 20, scope: !140)
!142 = !DILocation(line: 107, column: 18, scope: !140)
!143 = !DILocation(line: 108, column: 9, scope: !140)
!144 = !DILocation(line: 111, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !134, file: !15, line: 110, column: 9)
!146 = !DILocalVariable(name: "i", scope: !147, file: !15, line: 128, type: !6)
!147 = distinct !DILexicalBlock(scope: !126, file: !15, line: 127, column: 5)
!148 = !DILocation(line: 128, column: 13, scope: !147)
!149 = !DILocalVariable(name: "buffer", scope: !147, file: !15, line: 129, type: !5)
!150 = !DILocation(line: 129, column: 15, scope: !147)
!151 = !DILocation(line: 129, column: 31, scope: !147)
!152 = !DILocation(line: 129, column: 24, scope: !147)
!153 = !DILocation(line: 130, column: 13, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !15, line: 130, column: 13)
!155 = !DILocation(line: 130, column: 20, scope: !154)
!156 = !DILocation(line: 130, column: 13, scope: !147)
!157 = !DILocation(line: 130, column: 30, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 130, column: 29)
!159 = !DILocation(line: 132, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !147, file: !15, line: 132, column: 9)
!161 = !DILocation(line: 132, column: 14, scope: !160)
!162 = !DILocation(line: 132, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !15, line: 132, column: 9)
!164 = !DILocation(line: 132, column: 23, scope: !163)
!165 = !DILocation(line: 132, column: 9, scope: !160)
!166 = !DILocation(line: 134, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 133, column: 9)
!168 = !DILocation(line: 134, column: 20, scope: !167)
!169 = !DILocation(line: 134, column: 23, scope: !167)
!170 = !DILocation(line: 135, column: 9, scope: !167)
!171 = !DILocation(line: 132, column: 30, scope: !163)
!172 = !DILocation(line: 132, column: 9, scope: !163)
!173 = distinct !{!173, !165, !174, !70}
!174 = !DILocation(line: 135, column: 9, scope: !160)
!175 = !DILocation(line: 137, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !147, file: !15, line: 137, column: 13)
!177 = !DILocation(line: 137, column: 18, scope: !176)
!178 = !DILocation(line: 137, column: 23, scope: !176)
!179 = !DILocation(line: 137, column: 26, scope: !176)
!180 = !DILocation(line: 137, column: 31, scope: !176)
!181 = !DILocation(line: 137, column: 13, scope: !147)
!182 = !DILocation(line: 139, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !176, file: !15, line: 138, column: 9)
!184 = !DILocation(line: 139, column: 20, scope: !183)
!185 = !DILocation(line: 139, column: 26, scope: !183)
!186 = !DILocation(line: 141, column: 19, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !15, line: 141, column: 13)
!188 = !DILocation(line: 141, column: 17, scope: !187)
!189 = !DILocation(line: 141, column: 24, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !15, line: 141, column: 13)
!191 = !DILocation(line: 141, column: 26, scope: !190)
!192 = !DILocation(line: 141, column: 13, scope: !187)
!193 = !DILocation(line: 143, column: 30, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !15, line: 142, column: 13)
!195 = !DILocation(line: 143, column: 37, scope: !194)
!196 = !DILocation(line: 143, column: 17, scope: !194)
!197 = !DILocation(line: 144, column: 13, scope: !194)
!198 = !DILocation(line: 141, column: 33, scope: !190)
!199 = !DILocation(line: 141, column: 13, scope: !190)
!200 = distinct !{!200, !192, !201, !70}
!201 = !DILocation(line: 144, column: 13, scope: !187)
!202 = !DILocation(line: 145, column: 9, scope: !183)
!203 = !DILocation(line: 148, column: 13, scope: !204)
!204 = distinct !DILexicalBlock(scope: !176, file: !15, line: 147, column: 9)
!205 = !DILocation(line: 150, column: 14, scope: !147)
!206 = !DILocation(line: 150, column: 9, scope: !147)
!207 = !DILocation(line: 154, column: 1, scope: !126)
!208 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 157, type: !16, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!209 = !DILocalVariable(name: "data", scope: !208, file: !15, line: 159, type: !6)
!210 = !DILocation(line: 159, column: 9, scope: !208)
!211 = !DILocation(line: 161, column: 10, scope: !208)
!212 = !DILocalVariable(name: "inputBuffer", scope: !213, file: !15, line: 166, type: !23)
!213 = distinct !DILexicalBlock(scope: !208, file: !15, line: 165, column: 5)
!214 = !DILocation(line: 166, column: 14, scope: !213)
!215 = !DILocation(line: 168, column: 19, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !15, line: 168, column: 13)
!217 = !DILocation(line: 168, column: 49, scope: !216)
!218 = !DILocation(line: 168, column: 13, scope: !216)
!219 = !DILocation(line: 168, column: 56, scope: !216)
!220 = !DILocation(line: 168, column: 13, scope: !213)
!221 = !DILocation(line: 171, column: 25, scope: !222)
!222 = distinct !DILexicalBlock(scope: !216, file: !15, line: 169, column: 9)
!223 = !DILocation(line: 171, column: 20, scope: !222)
!224 = !DILocation(line: 171, column: 18, scope: !222)
!225 = !DILocation(line: 172, column: 9, scope: !222)
!226 = !DILocation(line: 175, column: 13, scope: !227)
!227 = distinct !DILexicalBlock(scope: !216, file: !15, line: 174, column: 9)
!228 = !DILocalVariable(name: "i", scope: !229, file: !15, line: 188, type: !6)
!229 = distinct !DILexicalBlock(scope: !208, file: !15, line: 187, column: 5)
!230 = !DILocation(line: 188, column: 13, scope: !229)
!231 = !DILocalVariable(name: "buffer", scope: !229, file: !15, line: 189, type: !5)
!232 = !DILocation(line: 189, column: 15, scope: !229)
!233 = !DILocation(line: 189, column: 31, scope: !229)
!234 = !DILocation(line: 189, column: 24, scope: !229)
!235 = !DILocation(line: 190, column: 13, scope: !236)
!236 = distinct !DILexicalBlock(scope: !229, file: !15, line: 190, column: 13)
!237 = !DILocation(line: 190, column: 20, scope: !236)
!238 = !DILocation(line: 190, column: 13, scope: !229)
!239 = !DILocation(line: 190, column: 30, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !15, line: 190, column: 29)
!241 = !DILocation(line: 192, column: 16, scope: !242)
!242 = distinct !DILexicalBlock(scope: !229, file: !15, line: 192, column: 9)
!243 = !DILocation(line: 192, column: 14, scope: !242)
!244 = !DILocation(line: 192, column: 21, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !15, line: 192, column: 9)
!246 = !DILocation(line: 192, column: 23, scope: !245)
!247 = !DILocation(line: 192, column: 9, scope: !242)
!248 = !DILocation(line: 194, column: 13, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !15, line: 193, column: 9)
!250 = !DILocation(line: 194, column: 20, scope: !249)
!251 = !DILocation(line: 194, column: 23, scope: !249)
!252 = !DILocation(line: 195, column: 9, scope: !249)
!253 = !DILocation(line: 192, column: 30, scope: !245)
!254 = !DILocation(line: 192, column: 9, scope: !245)
!255 = distinct !{!255, !247, !256, !70}
!256 = !DILocation(line: 195, column: 9, scope: !242)
!257 = !DILocation(line: 197, column: 13, scope: !258)
!258 = distinct !DILexicalBlock(scope: !229, file: !15, line: 197, column: 13)
!259 = !DILocation(line: 197, column: 18, scope: !258)
!260 = !DILocation(line: 197, column: 23, scope: !258)
!261 = !DILocation(line: 197, column: 26, scope: !258)
!262 = !DILocation(line: 197, column: 31, scope: !258)
!263 = !DILocation(line: 197, column: 13, scope: !229)
!264 = !DILocation(line: 199, column: 13, scope: !265)
!265 = distinct !DILexicalBlock(scope: !258, file: !15, line: 198, column: 9)
!266 = !DILocation(line: 199, column: 20, scope: !265)
!267 = !DILocation(line: 199, column: 26, scope: !265)
!268 = !DILocation(line: 201, column: 19, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !15, line: 201, column: 13)
!270 = !DILocation(line: 201, column: 17, scope: !269)
!271 = !DILocation(line: 201, column: 24, scope: !272)
!272 = distinct !DILexicalBlock(scope: !269, file: !15, line: 201, column: 13)
!273 = !DILocation(line: 201, column: 26, scope: !272)
!274 = !DILocation(line: 201, column: 13, scope: !269)
!275 = !DILocation(line: 203, column: 30, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !15, line: 202, column: 13)
!277 = !DILocation(line: 203, column: 37, scope: !276)
!278 = !DILocation(line: 203, column: 17, scope: !276)
!279 = !DILocation(line: 204, column: 13, scope: !276)
!280 = !DILocation(line: 201, column: 33, scope: !272)
!281 = !DILocation(line: 201, column: 13, scope: !272)
!282 = distinct !{!282, !274, !283, !70}
!283 = !DILocation(line: 204, column: 13, scope: !269)
!284 = !DILocation(line: 205, column: 9, scope: !265)
!285 = !DILocation(line: 208, column: 13, scope: !286)
!286 = distinct !DILexicalBlock(scope: !258, file: !15, line: 207, column: 9)
!287 = !DILocation(line: 210, column: 14, scope: !229)
!288 = !DILocation(line: 210, column: 9, scope: !229)
!289 = !DILocation(line: 218, column: 1, scope: !208)
!290 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 221, type: !16, scopeLine: 222, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!291 = !DILocalVariable(name: "data", scope: !290, file: !15, line: 223, type: !6)
!292 = !DILocation(line: 223, column: 9, scope: !290)
!293 = !DILocation(line: 225, column: 10, scope: !290)
!294 = !DILocation(line: 235, column: 14, scope: !290)
!295 = !DILocalVariable(name: "i", scope: !296, file: !15, line: 242, type: !6)
!296 = distinct !DILexicalBlock(scope: !290, file: !15, line: 241, column: 5)
!297 = !DILocation(line: 242, column: 13, scope: !296)
!298 = !DILocalVariable(name: "buffer", scope: !296, file: !15, line: 243, type: !5)
!299 = !DILocation(line: 243, column: 15, scope: !296)
!300 = !DILocation(line: 243, column: 31, scope: !296)
!301 = !DILocation(line: 243, column: 24, scope: !296)
!302 = !DILocation(line: 244, column: 13, scope: !303)
!303 = distinct !DILexicalBlock(scope: !296, file: !15, line: 244, column: 13)
!304 = !DILocation(line: 244, column: 20, scope: !303)
!305 = !DILocation(line: 244, column: 13, scope: !296)
!306 = !DILocation(line: 244, column: 30, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !15, line: 244, column: 29)
!308 = !DILocation(line: 246, column: 16, scope: !309)
!309 = distinct !DILexicalBlock(scope: !296, file: !15, line: 246, column: 9)
!310 = !DILocation(line: 246, column: 14, scope: !309)
!311 = !DILocation(line: 246, column: 21, scope: !312)
!312 = distinct !DILexicalBlock(scope: !309, file: !15, line: 246, column: 9)
!313 = !DILocation(line: 246, column: 23, scope: !312)
!314 = !DILocation(line: 246, column: 9, scope: !309)
!315 = !DILocation(line: 248, column: 13, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !15, line: 247, column: 9)
!317 = !DILocation(line: 248, column: 20, scope: !316)
!318 = !DILocation(line: 248, column: 23, scope: !316)
!319 = !DILocation(line: 249, column: 9, scope: !316)
!320 = !DILocation(line: 246, column: 30, scope: !312)
!321 = !DILocation(line: 246, column: 9, scope: !312)
!322 = distinct !{!322, !314, !323, !70}
!323 = !DILocation(line: 249, column: 9, scope: !309)
!324 = !DILocation(line: 252, column: 13, scope: !325)
!325 = distinct !DILexicalBlock(scope: !296, file: !15, line: 252, column: 13)
!326 = !DILocation(line: 252, column: 18, scope: !325)
!327 = !DILocation(line: 252, column: 13, scope: !296)
!328 = !DILocation(line: 254, column: 13, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !15, line: 253, column: 9)
!330 = !DILocation(line: 254, column: 20, scope: !329)
!331 = !DILocation(line: 254, column: 26, scope: !329)
!332 = !DILocation(line: 256, column: 19, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !15, line: 256, column: 13)
!334 = !DILocation(line: 256, column: 17, scope: !333)
!335 = !DILocation(line: 256, column: 24, scope: !336)
!336 = distinct !DILexicalBlock(scope: !333, file: !15, line: 256, column: 13)
!337 = !DILocation(line: 256, column: 26, scope: !336)
!338 = !DILocation(line: 256, column: 13, scope: !333)
!339 = !DILocation(line: 258, column: 30, scope: !340)
!340 = distinct !DILexicalBlock(scope: !336, file: !15, line: 257, column: 13)
!341 = !DILocation(line: 258, column: 37, scope: !340)
!342 = !DILocation(line: 258, column: 17, scope: !340)
!343 = !DILocation(line: 259, column: 13, scope: !340)
!344 = !DILocation(line: 256, column: 33, scope: !336)
!345 = !DILocation(line: 256, column: 13, scope: !336)
!346 = distinct !{!346, !338, !347, !70}
!347 = !DILocation(line: 259, column: 13, scope: !333)
!348 = !DILocation(line: 260, column: 9, scope: !329)
!349 = !DILocation(line: 263, column: 13, scope: !350)
!350 = distinct !DILexicalBlock(scope: !325, file: !15, line: 262, column: 9)
!351 = !DILocation(line: 265, column: 14, scope: !296)
!352 = !DILocation(line: 265, column: 9, scope: !296)
!353 = !DILocation(line: 273, column: 1, scope: !290)
!354 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 276, type: !16, scopeLine: 277, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!355 = !DILocalVariable(name: "data", scope: !354, file: !15, line: 278, type: !6)
!356 = !DILocation(line: 278, column: 9, scope: !354)
!357 = !DILocation(line: 280, column: 10, scope: !354)
!358 = !DILocation(line: 286, column: 14, scope: !354)
!359 = !DILocalVariable(name: "i", scope: !360, file: !15, line: 297, type: !6)
!360 = distinct !DILexicalBlock(scope: !354, file: !15, line: 296, column: 5)
!361 = !DILocation(line: 297, column: 13, scope: !360)
!362 = !DILocalVariable(name: "buffer", scope: !360, file: !15, line: 298, type: !5)
!363 = !DILocation(line: 298, column: 15, scope: !360)
!364 = !DILocation(line: 298, column: 31, scope: !360)
!365 = !DILocation(line: 298, column: 24, scope: !360)
!366 = !DILocation(line: 299, column: 13, scope: !367)
!367 = distinct !DILexicalBlock(scope: !360, file: !15, line: 299, column: 13)
!368 = !DILocation(line: 299, column: 20, scope: !367)
!369 = !DILocation(line: 299, column: 13, scope: !360)
!370 = !DILocation(line: 299, column: 30, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !15, line: 299, column: 29)
!372 = !DILocation(line: 301, column: 16, scope: !373)
!373 = distinct !DILexicalBlock(scope: !360, file: !15, line: 301, column: 9)
!374 = !DILocation(line: 301, column: 14, scope: !373)
!375 = !DILocation(line: 301, column: 21, scope: !376)
!376 = distinct !DILexicalBlock(scope: !373, file: !15, line: 301, column: 9)
!377 = !DILocation(line: 301, column: 23, scope: !376)
!378 = !DILocation(line: 301, column: 9, scope: !373)
!379 = !DILocation(line: 303, column: 13, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !15, line: 302, column: 9)
!381 = !DILocation(line: 303, column: 20, scope: !380)
!382 = !DILocation(line: 303, column: 23, scope: !380)
!383 = !DILocation(line: 304, column: 9, scope: !380)
!384 = !DILocation(line: 301, column: 30, scope: !376)
!385 = !DILocation(line: 301, column: 9, scope: !376)
!386 = distinct !{!386, !378, !387, !70}
!387 = !DILocation(line: 304, column: 9, scope: !373)
!388 = !DILocation(line: 307, column: 13, scope: !389)
!389 = distinct !DILexicalBlock(scope: !360, file: !15, line: 307, column: 13)
!390 = !DILocation(line: 307, column: 18, scope: !389)
!391 = !DILocation(line: 307, column: 13, scope: !360)
!392 = !DILocation(line: 309, column: 13, scope: !393)
!393 = distinct !DILexicalBlock(scope: !389, file: !15, line: 308, column: 9)
!394 = !DILocation(line: 309, column: 20, scope: !393)
!395 = !DILocation(line: 309, column: 26, scope: !393)
!396 = !DILocation(line: 311, column: 19, scope: !397)
!397 = distinct !DILexicalBlock(scope: !393, file: !15, line: 311, column: 13)
!398 = !DILocation(line: 311, column: 17, scope: !397)
!399 = !DILocation(line: 311, column: 24, scope: !400)
!400 = distinct !DILexicalBlock(scope: !397, file: !15, line: 311, column: 13)
!401 = !DILocation(line: 311, column: 26, scope: !400)
!402 = !DILocation(line: 311, column: 13, scope: !397)
!403 = !DILocation(line: 313, column: 30, scope: !404)
!404 = distinct !DILexicalBlock(scope: !400, file: !15, line: 312, column: 13)
!405 = !DILocation(line: 313, column: 37, scope: !404)
!406 = !DILocation(line: 313, column: 17, scope: !404)
!407 = !DILocation(line: 314, column: 13, scope: !404)
!408 = !DILocation(line: 311, column: 33, scope: !400)
!409 = !DILocation(line: 311, column: 13, scope: !400)
!410 = distinct !{!410, !402, !411, !70}
!411 = !DILocation(line: 314, column: 13, scope: !397)
!412 = !DILocation(line: 315, column: 9, scope: !393)
!413 = !DILocation(line: 318, column: 13, scope: !414)
!414 = distinct !DILexicalBlock(scope: !389, file: !15, line: 317, column: 9)
!415 = !DILocation(line: 320, column: 14, scope: !360)
!416 = !DILocation(line: 320, column: 9, scope: !360)
!417 = !DILocation(line: 328, column: 1, scope: !354)
