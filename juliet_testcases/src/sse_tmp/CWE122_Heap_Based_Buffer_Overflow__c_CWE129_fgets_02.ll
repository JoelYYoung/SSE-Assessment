; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !21, metadata !DIExpression()), !dbg !29
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !30
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !32
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !33
  %cmp = icmp ne i8* %call, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !38
  store i32 %call2, i32* %data, align 4, !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !48, metadata !DIExpression()), !dbg !49
  %call3 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !50
  %2 = bitcast i8* %call3 to i32*, !dbg !51
  store i32* %2, i32** %buffer, align 8, !dbg !49
  %3 = load i32*, i32** %buffer, align 8, !dbg !52
  %cmp4 = icmp eq i32* %3, null, !dbg !54
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !55

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !56
  unreachable, !dbg !56

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !61
  %cmp7 = icmp slt i32 %4, 10, !dbg !63
  br i1 %cmp7, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !65
  %6 = load i32, i32* %i, align 4, !dbg !67
  %idxprom = sext i32 %6 to i64, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !70
  %inc = add nsw i32 %7, 1, !dbg !70
  store i32 %inc, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !75
  %cmp8 = icmp sge i32 %8, 0, !dbg !77
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !78

if.then9:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !79
  %10 = load i32, i32* %data, align 4, !dbg !81
  %idxprom10 = sext i32 %10 to i64, !dbg !79
  %arrayidx11 = getelementptr inbounds i32, i32* %9, i64 %idxprom10, !dbg !79
  store i32 1, i32* %arrayidx11, align 4, !dbg !82
  store i32 0, i32* %i, align 4, !dbg !83
  br label %for.cond12, !dbg !85

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %11 = load i32, i32* %i, align 4, !dbg !86
  %cmp13 = icmp slt i32 %11, 10, !dbg !88
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !89

for.body14:                                       ; preds = %for.cond12
  %12 = load i32*, i32** %buffer, align 8, !dbg !90
  %13 = load i32, i32* %i, align 4, !dbg !92
  %idxprom15 = sext i32 %13 to i64, !dbg !90
  %arrayidx16 = getelementptr inbounds i32, i32* %12, i64 %idxprom15, !dbg !90
  %14 = load i32, i32* %arrayidx16, align 4, !dbg !90
  call void @printIntLine(i32 %14), !dbg !93
  br label %for.inc17, !dbg !94

for.inc17:                                        ; preds = %for.body14
  %15 = load i32, i32* %i, align 4, !dbg !95
  %inc18 = add nsw i32 %15, 1, !dbg !95
  store i32 %inc18, i32* %i, align 4, !dbg !95
  br label %for.cond12, !dbg !96, !llvm.loop !97

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !99

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %16 = load i32*, i32** %buffer, align 8, !dbg !102
  %17 = bitcast i32* %16 to i8*, !dbg !102
  call void @free(i8* %17) #8, !dbg !103
  ret void, !dbg !104
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02_good() #0 !dbg !105 {
entry:
  call void @goodB2G1(), !dbg !106
  call void @goodB2G2(), !dbg !107
  call void @goodG2B1(), !dbg !108
  call void @goodG2B2(), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !111 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !116, metadata !DIExpression()), !dbg !117
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call i64 @time(i64* null) #8, !dbg !120
  %conv = trunc i64 %call to i32, !dbg !121
  call void @srand(i32 %conv) #8, !dbg !122
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !123
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02_good(), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02_bad(), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !128
  ret i32 0, !dbg !129
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !130 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 -1, i32* %data, align 4, !dbg !133
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !134, metadata !DIExpression()), !dbg !138
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !138
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !139
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !141
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !142
  %cmp = icmp ne i8* %call, null, !dbg !143
  br i1 %cmp, label %if.then, label %if.else, !dbg !144

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !145
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !147
  store i32 %call2, i32* %data, align 4, !dbg !148
  br label %if.end, !dbg !149

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !150
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !152, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !157, metadata !DIExpression()), !dbg !158
  %call3 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !159
  %2 = bitcast i8* %call3 to i32*, !dbg !160
  store i32* %2, i32** %buffer, align 8, !dbg !158
  %3 = load i32*, i32** %buffer, align 8, !dbg !161
  %cmp4 = icmp eq i32* %3, null, !dbg !163
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !164

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !165
  unreachable, !dbg !165

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !170
  %cmp7 = icmp slt i32 %4, 10, !dbg !172
  br i1 %cmp7, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !174
  %6 = load i32, i32* %i, align 4, !dbg !176
  %idxprom = sext i32 %6 to i64, !dbg !174
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !174
  store i32 0, i32* %arrayidx, align 4, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !179
  %inc = add nsw i32 %7, 1, !dbg !179
  store i32 %inc, i32* %i, align 4, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !183
  %cmp8 = icmp sge i32 %8, 0, !dbg !185
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !186

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !187
  %cmp9 = icmp slt i32 %9, 10, !dbg !188
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !189

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !190
  %11 = load i32, i32* %data, align 4, !dbg !192
  %idxprom11 = sext i32 %11 to i64, !dbg !190
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !190
  store i32 1, i32* %arrayidx12, align 4, !dbg !193
  store i32 0, i32* %i, align 4, !dbg !194
  br label %for.cond13, !dbg !196

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !197
  %cmp14 = icmp slt i32 %12, 10, !dbg !199
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !200

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !201
  %14 = load i32, i32* %i, align 4, !dbg !203
  %idxprom16 = sext i32 %14 to i64, !dbg !201
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !201
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !201
  call void @printIntLine(i32 %15), !dbg !204
  br label %for.inc18, !dbg !205

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !206
  %inc19 = add nsw i32 %16, 1, !dbg !206
  store i32 %inc19, i32* %i, align 4, !dbg !206
  br label %for.cond13, !dbg !207, !llvm.loop !208

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !210

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !211
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !213
  %18 = bitcast i32* %17 to i8*, !dbg !213
  call void @free(i8* %18) #8, !dbg !214
  ret void, !dbg !215
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !216 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !217, metadata !DIExpression()), !dbg !218
  store i32 -1, i32* %data, align 4, !dbg !219
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !220, metadata !DIExpression()), !dbg !224
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !224
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !224
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !225
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !227
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !228
  %cmp = icmp ne i8* %call, null, !dbg !229
  br i1 %cmp, label %if.then, label %if.else, !dbg !230

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !231
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !233
  store i32 %call2, i32* %data, align 4, !dbg !234
  br label %if.end, !dbg !235

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !236
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !238, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !243, metadata !DIExpression()), !dbg !244
  %call3 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !245
  %2 = bitcast i8* %call3 to i32*, !dbg !246
  store i32* %2, i32** %buffer, align 8, !dbg !244
  %3 = load i32*, i32** %buffer, align 8, !dbg !247
  %cmp4 = icmp eq i32* %3, null, !dbg !249
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !250

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !251
  unreachable, !dbg !251

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !255

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !256
  %cmp7 = icmp slt i32 %4, 10, !dbg !258
  br i1 %cmp7, label %for.body, label %for.end, !dbg !259

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !260
  %6 = load i32, i32* %i, align 4, !dbg !262
  %idxprom = sext i32 %6 to i64, !dbg !260
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !260
  store i32 0, i32* %arrayidx, align 4, !dbg !263
  br label %for.inc, !dbg !264

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !265
  %inc = add nsw i32 %7, 1, !dbg !265
  store i32 %inc, i32* %i, align 4, !dbg !265
  br label %for.cond, !dbg !266, !llvm.loop !267

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !269
  %cmp8 = icmp sge i32 %8, 0, !dbg !271
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !272

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !273
  %cmp9 = icmp slt i32 %9, 10, !dbg !274
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !275

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !276
  %11 = load i32, i32* %data, align 4, !dbg !278
  %idxprom11 = sext i32 %11 to i64, !dbg !276
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !276
  store i32 1, i32* %arrayidx12, align 4, !dbg !279
  store i32 0, i32* %i, align 4, !dbg !280
  br label %for.cond13, !dbg !282

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !283
  %cmp14 = icmp slt i32 %12, 10, !dbg !285
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !286

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !287
  %14 = load i32, i32* %i, align 4, !dbg !289
  %idxprom16 = sext i32 %14 to i64, !dbg !287
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !287
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !287
  call void @printIntLine(i32 %15), !dbg !290
  br label %for.inc18, !dbg !291

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !292
  %inc19 = add nsw i32 %16, 1, !dbg !292
  store i32 %inc19, i32* %i, align 4, !dbg !292
  br label %for.cond13, !dbg !293, !llvm.loop !294

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !296

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !297
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !299
  %18 = bitcast i32* %17 to i8*, !dbg !299
  call void @free(i8* %18) #8, !dbg !300
  ret void, !dbg !301
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !302 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !303, metadata !DIExpression()), !dbg !304
  store i32 -1, i32* %data, align 4, !dbg !305
  store i32 7, i32* %data, align 4, !dbg !306
  call void @llvm.dbg.declare(metadata i32* %i, metadata !309, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !314, metadata !DIExpression()), !dbg !315
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !316
  %0 = bitcast i8* %call to i32*, !dbg !317
  store i32* %0, i32** %buffer, align 8, !dbg !315
  %1 = load i32*, i32** %buffer, align 8, !dbg !318
  %cmp = icmp eq i32* %1, null, !dbg !320
  br i1 %cmp, label %if.then, label %if.end, !dbg !321

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !322
  unreachable, !dbg !322

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !324
  br label %for.cond, !dbg !326

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !327
  %cmp1 = icmp slt i32 %2, 10, !dbg !329
  br i1 %cmp1, label %for.body, label %for.end, !dbg !330

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !331
  %4 = load i32, i32* %i, align 4, !dbg !333
  %idxprom = sext i32 %4 to i64, !dbg !331
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !331
  store i32 0, i32* %arrayidx, align 4, !dbg !334
  br label %for.inc, !dbg !335

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !336
  %inc = add nsw i32 %5, 1, !dbg !336
  store i32 %inc, i32* %i, align 4, !dbg !336
  br label %for.cond, !dbg !337, !llvm.loop !338

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !340
  %cmp2 = icmp sge i32 %6, 0, !dbg !342
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !343

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !344
  %8 = load i32, i32* %data, align 4, !dbg !346
  %idxprom4 = sext i32 %8 to i64, !dbg !344
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !344
  store i32 1, i32* %arrayidx5, align 4, !dbg !347
  store i32 0, i32* %i, align 4, !dbg !348
  br label %for.cond6, !dbg !350

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !351
  %cmp7 = icmp slt i32 %9, 10, !dbg !353
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !354

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !355
  %11 = load i32, i32* %i, align 4, !dbg !357
  %idxprom9 = sext i32 %11 to i64, !dbg !355
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !355
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !355
  call void @printIntLine(i32 %12), !dbg !358
  br label %for.inc11, !dbg !359

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !360
  %inc12 = add nsw i32 %13, 1, !dbg !360
  store i32 %inc12, i32* %i, align 4, !dbg !360
  br label %for.cond6, !dbg !361, !llvm.loop !362

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !364

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !365
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !367
  %15 = bitcast i32* %14 to i8*, !dbg !367
  call void @free(i8* %15) #8, !dbg !368
  ret void, !dbg !369
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !370 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !371, metadata !DIExpression()), !dbg !372
  store i32 -1, i32* %data, align 4, !dbg !373
  store i32 7, i32* %data, align 4, !dbg !374
  call void @llvm.dbg.declare(metadata i32* %i, metadata !377, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !382, metadata !DIExpression()), !dbg !383
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !384
  %0 = bitcast i8* %call to i32*, !dbg !385
  store i32* %0, i32** %buffer, align 8, !dbg !383
  %1 = load i32*, i32** %buffer, align 8, !dbg !386
  %cmp = icmp eq i32* %1, null, !dbg !388
  br i1 %cmp, label %if.then, label %if.end, !dbg !389

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !390
  unreachable, !dbg !390

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !392
  br label %for.cond, !dbg !394

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !395
  %cmp1 = icmp slt i32 %2, 10, !dbg !397
  br i1 %cmp1, label %for.body, label %for.end, !dbg !398

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !399
  %4 = load i32, i32* %i, align 4, !dbg !401
  %idxprom = sext i32 %4 to i64, !dbg !399
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !399
  store i32 0, i32* %arrayidx, align 4, !dbg !402
  br label %for.inc, !dbg !403

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !404
  %inc = add nsw i32 %5, 1, !dbg !404
  store i32 %inc, i32* %i, align 4, !dbg !404
  br label %for.cond, !dbg !405, !llvm.loop !406

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !408
  %cmp2 = icmp sge i32 %6, 0, !dbg !410
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !411

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !412
  %8 = load i32, i32* %data, align 4, !dbg !414
  %idxprom4 = sext i32 %8 to i64, !dbg !412
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !412
  store i32 1, i32* %arrayidx5, align 4, !dbg !415
  store i32 0, i32* %i, align 4, !dbg !416
  br label %for.cond6, !dbg !418

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !419
  %cmp7 = icmp slt i32 %9, 10, !dbg !421
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !422

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !423
  %11 = load i32, i32* %i, align 4, !dbg !425
  %idxprom9 = sext i32 %11 to i64, !dbg !423
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !423
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !423
  call void @printIntLine(i32 %12), !dbg !426
  br label %for.inc11, !dbg !427

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !428
  %inc12 = add nsw i32 %13, 1, !dbg !428
  store i32 %inc12, i32* %i, align 4, !dbg !428
  br label %for.cond6, !dbg !429, !llvm.loop !430

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !432

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !433
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !435
  %15 = bitcast i32* %14 to i8*, !dbg !435
  call void @free(i8* %15) #8, !dbg !436
  ret void, !dbg !437
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !6)
!19 = !DILocation(line: 26, column: 9, scope: !14)
!20 = !DILocation(line: 28, column: 10, scope: !14)
!21 = !DILocalVariable(name: "inputBuffer", scope: !22, file: !15, line: 32, type: !25)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 31, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 30, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 8)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 112, elements: !27)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !{!28}
!28 = !DISubrange(count: 14)
!29 = !DILocation(line: 32, column: 18, scope: !22)
!30 = !DILocation(line: 34, column: 23, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 17)
!32 = !DILocation(line: 34, column: 53, scope: !31)
!33 = !DILocation(line: 34, column: 17, scope: !31)
!34 = !DILocation(line: 34, column: 60, scope: !31)
!35 = !DILocation(line: 34, column: 17, scope: !22)
!36 = !DILocation(line: 37, column: 29, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !15, line: 35, column: 13)
!38 = !DILocation(line: 37, column: 24, scope: !37)
!39 = !DILocation(line: 37, column: 22, scope: !37)
!40 = !DILocation(line: 38, column: 13, scope: !37)
!41 = !DILocation(line: 41, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !31, file: !15, line: 40, column: 13)
!43 = !DILocalVariable(name: "i", scope: !44, file: !15, line: 48, type: !6)
!44 = distinct !DILexicalBlock(scope: !45, file: !15, line: 47, column: 9)
!45 = distinct !DILexicalBlock(scope: !46, file: !15, line: 46, column: 5)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 8)
!47 = !DILocation(line: 48, column: 17, scope: !44)
!48 = !DILocalVariable(name: "buffer", scope: !44, file: !15, line: 49, type: !5)
!49 = !DILocation(line: 49, column: 19, scope: !44)
!50 = !DILocation(line: 49, column: 35, scope: !44)
!51 = !DILocation(line: 49, column: 28, scope: !44)
!52 = !DILocation(line: 50, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !44, file: !15, line: 50, column: 17)
!54 = !DILocation(line: 50, column: 24, scope: !53)
!55 = !DILocation(line: 50, column: 17, scope: !44)
!56 = !DILocation(line: 50, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !15, line: 50, column: 33)
!58 = !DILocation(line: 52, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !44, file: !15, line: 52, column: 13)
!60 = !DILocation(line: 52, column: 18, scope: !59)
!61 = !DILocation(line: 52, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !15, line: 52, column: 13)
!63 = !DILocation(line: 52, column: 27, scope: !62)
!64 = !DILocation(line: 52, column: 13, scope: !59)
!65 = !DILocation(line: 54, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 53, column: 13)
!67 = !DILocation(line: 54, column: 24, scope: !66)
!68 = !DILocation(line: 54, column: 27, scope: !66)
!69 = !DILocation(line: 55, column: 13, scope: !66)
!70 = !DILocation(line: 52, column: 34, scope: !62)
!71 = !DILocation(line: 52, column: 13, scope: !62)
!72 = distinct !{!72, !64, !73, !74}
!73 = !DILocation(line: 55, column: 13, scope: !59)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 58, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !44, file: !15, line: 58, column: 17)
!77 = !DILocation(line: 58, column: 22, scope: !76)
!78 = !DILocation(line: 58, column: 17, scope: !44)
!79 = !DILocation(line: 60, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 59, column: 13)
!81 = !DILocation(line: 60, column: 24, scope: !80)
!82 = !DILocation(line: 60, column: 30, scope: !80)
!83 = !DILocation(line: 62, column: 23, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 62, column: 17)
!85 = !DILocation(line: 62, column: 21, scope: !84)
!86 = !DILocation(line: 62, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !15, line: 62, column: 17)
!88 = !DILocation(line: 62, column: 30, scope: !87)
!89 = !DILocation(line: 62, column: 17, scope: !84)
!90 = !DILocation(line: 64, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 63, column: 17)
!92 = !DILocation(line: 64, column: 41, scope: !91)
!93 = !DILocation(line: 64, column: 21, scope: !91)
!94 = !DILocation(line: 65, column: 17, scope: !91)
!95 = !DILocation(line: 62, column: 37, scope: !87)
!96 = !DILocation(line: 62, column: 17, scope: !87)
!97 = distinct !{!97, !89, !98, !74}
!98 = !DILocation(line: 65, column: 17, scope: !84)
!99 = !DILocation(line: 66, column: 13, scope: !80)
!100 = !DILocation(line: 69, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !76, file: !15, line: 68, column: 13)
!102 = !DILocation(line: 71, column: 18, scope: !44)
!103 = !DILocation(line: 71, column: 13, scope: !44)
!104 = !DILocation(line: 74, column: 1, scope: !14)
!105 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_02_good", scope: !15, file: !15, line: 280, type: !16, scopeLine: 281, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 282, column: 5, scope: !105)
!107 = !DILocation(line: 283, column: 5, scope: !105)
!108 = !DILocation(line: 284, column: 5, scope: !105)
!109 = !DILocation(line: 285, column: 5, scope: !105)
!110 = !DILocation(line: 286, column: 1, scope: !105)
!111 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 297, type: !112, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DISubroutineType(types: !113)
!113 = !{!6, !6, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!116 = !DILocalVariable(name: "argc", arg: 1, scope: !111, file: !15, line: 297, type: !6)
!117 = !DILocation(line: 297, column: 14, scope: !111)
!118 = !DILocalVariable(name: "argv", arg: 2, scope: !111, file: !15, line: 297, type: !114)
!119 = !DILocation(line: 297, column: 27, scope: !111)
!120 = !DILocation(line: 300, column: 22, scope: !111)
!121 = !DILocation(line: 300, column: 12, scope: !111)
!122 = !DILocation(line: 300, column: 5, scope: !111)
!123 = !DILocation(line: 302, column: 5, scope: !111)
!124 = !DILocation(line: 303, column: 5, scope: !111)
!125 = !DILocation(line: 304, column: 5, scope: !111)
!126 = !DILocation(line: 307, column: 5, scope: !111)
!127 = !DILocation(line: 308, column: 5, scope: !111)
!128 = !DILocation(line: 309, column: 5, scope: !111)
!129 = !DILocation(line: 311, column: 5, scope: !111)
!130 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "data", scope: !130, file: !15, line: 83, type: !6)
!132 = !DILocation(line: 83, column: 9, scope: !130)
!133 = !DILocation(line: 85, column: 10, scope: !130)
!134 = !DILocalVariable(name: "inputBuffer", scope: !135, file: !15, line: 89, type: !25)
!135 = distinct !DILexicalBlock(scope: !136, file: !15, line: 88, column: 9)
!136 = distinct !DILexicalBlock(scope: !137, file: !15, line: 87, column: 5)
!137 = distinct !DILexicalBlock(scope: !130, file: !15, line: 86, column: 8)
!138 = !DILocation(line: 89, column: 18, scope: !135)
!139 = !DILocation(line: 91, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !15, line: 91, column: 17)
!141 = !DILocation(line: 91, column: 53, scope: !140)
!142 = !DILocation(line: 91, column: 17, scope: !140)
!143 = !DILocation(line: 91, column: 60, scope: !140)
!144 = !DILocation(line: 91, column: 17, scope: !135)
!145 = !DILocation(line: 94, column: 29, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !15, line: 92, column: 13)
!147 = !DILocation(line: 94, column: 24, scope: !146)
!148 = !DILocation(line: 94, column: 22, scope: !146)
!149 = !DILocation(line: 95, column: 13, scope: !146)
!150 = !DILocation(line: 98, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !140, file: !15, line: 97, column: 13)
!152 = !DILocalVariable(name: "i", scope: !153, file: !15, line: 110, type: !6)
!153 = distinct !DILexicalBlock(scope: !154, file: !15, line: 109, column: 9)
!154 = distinct !DILexicalBlock(scope: !155, file: !15, line: 108, column: 5)
!155 = distinct !DILexicalBlock(scope: !130, file: !15, line: 102, column: 8)
!156 = !DILocation(line: 110, column: 17, scope: !153)
!157 = !DILocalVariable(name: "buffer", scope: !153, file: !15, line: 111, type: !5)
!158 = !DILocation(line: 111, column: 19, scope: !153)
!159 = !DILocation(line: 111, column: 35, scope: !153)
!160 = !DILocation(line: 111, column: 28, scope: !153)
!161 = !DILocation(line: 112, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !153, file: !15, line: 112, column: 17)
!163 = !DILocation(line: 112, column: 24, scope: !162)
!164 = !DILocation(line: 112, column: 17, scope: !153)
!165 = !DILocation(line: 112, column: 34, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !15, line: 112, column: 33)
!167 = !DILocation(line: 114, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !153, file: !15, line: 114, column: 13)
!169 = !DILocation(line: 114, column: 18, scope: !168)
!170 = !DILocation(line: 114, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !15, line: 114, column: 13)
!172 = !DILocation(line: 114, column: 27, scope: !171)
!173 = !DILocation(line: 114, column: 13, scope: !168)
!174 = !DILocation(line: 116, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !15, line: 115, column: 13)
!176 = !DILocation(line: 116, column: 24, scope: !175)
!177 = !DILocation(line: 116, column: 27, scope: !175)
!178 = !DILocation(line: 117, column: 13, scope: !175)
!179 = !DILocation(line: 114, column: 34, scope: !171)
!180 = !DILocation(line: 114, column: 13, scope: !171)
!181 = distinct !{!181, !173, !182, !74}
!182 = !DILocation(line: 117, column: 13, scope: !168)
!183 = !DILocation(line: 119, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !153, file: !15, line: 119, column: 17)
!185 = !DILocation(line: 119, column: 22, scope: !184)
!186 = !DILocation(line: 119, column: 27, scope: !184)
!187 = !DILocation(line: 119, column: 30, scope: !184)
!188 = !DILocation(line: 119, column: 35, scope: !184)
!189 = !DILocation(line: 119, column: 17, scope: !153)
!190 = !DILocation(line: 121, column: 17, scope: !191)
!191 = distinct !DILexicalBlock(scope: !184, file: !15, line: 120, column: 13)
!192 = !DILocation(line: 121, column: 24, scope: !191)
!193 = !DILocation(line: 121, column: 30, scope: !191)
!194 = !DILocation(line: 123, column: 23, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !15, line: 123, column: 17)
!196 = !DILocation(line: 123, column: 21, scope: !195)
!197 = !DILocation(line: 123, column: 28, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !15, line: 123, column: 17)
!199 = !DILocation(line: 123, column: 30, scope: !198)
!200 = !DILocation(line: 123, column: 17, scope: !195)
!201 = !DILocation(line: 125, column: 34, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !15, line: 124, column: 17)
!203 = !DILocation(line: 125, column: 41, scope: !202)
!204 = !DILocation(line: 125, column: 21, scope: !202)
!205 = !DILocation(line: 126, column: 17, scope: !202)
!206 = !DILocation(line: 123, column: 37, scope: !198)
!207 = !DILocation(line: 123, column: 17, scope: !198)
!208 = distinct !{!208, !200, !209, !74}
!209 = !DILocation(line: 126, column: 17, scope: !195)
!210 = !DILocation(line: 127, column: 13, scope: !191)
!211 = !DILocation(line: 130, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !184, file: !15, line: 129, column: 13)
!213 = !DILocation(line: 132, column: 18, scope: !153)
!214 = !DILocation(line: 132, column: 13, scope: !153)
!215 = !DILocation(line: 135, column: 1, scope: !130)
!216 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 138, type: !16, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!217 = !DILocalVariable(name: "data", scope: !216, file: !15, line: 140, type: !6)
!218 = !DILocation(line: 140, column: 9, scope: !216)
!219 = !DILocation(line: 142, column: 10, scope: !216)
!220 = !DILocalVariable(name: "inputBuffer", scope: !221, file: !15, line: 146, type: !25)
!221 = distinct !DILexicalBlock(scope: !222, file: !15, line: 145, column: 9)
!222 = distinct !DILexicalBlock(scope: !223, file: !15, line: 144, column: 5)
!223 = distinct !DILexicalBlock(scope: !216, file: !15, line: 143, column: 8)
!224 = !DILocation(line: 146, column: 18, scope: !221)
!225 = !DILocation(line: 148, column: 23, scope: !226)
!226 = distinct !DILexicalBlock(scope: !221, file: !15, line: 148, column: 17)
!227 = !DILocation(line: 148, column: 53, scope: !226)
!228 = !DILocation(line: 148, column: 17, scope: !226)
!229 = !DILocation(line: 148, column: 60, scope: !226)
!230 = !DILocation(line: 148, column: 17, scope: !221)
!231 = !DILocation(line: 151, column: 29, scope: !232)
!232 = distinct !DILexicalBlock(scope: !226, file: !15, line: 149, column: 13)
!233 = !DILocation(line: 151, column: 24, scope: !232)
!234 = !DILocation(line: 151, column: 22, scope: !232)
!235 = !DILocation(line: 152, column: 13, scope: !232)
!236 = !DILocation(line: 155, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !226, file: !15, line: 154, column: 13)
!238 = !DILocalVariable(name: "i", scope: !239, file: !15, line: 162, type: !6)
!239 = distinct !DILexicalBlock(scope: !240, file: !15, line: 161, column: 9)
!240 = distinct !DILexicalBlock(scope: !241, file: !15, line: 160, column: 5)
!241 = distinct !DILexicalBlock(scope: !216, file: !15, line: 159, column: 8)
!242 = !DILocation(line: 162, column: 17, scope: !239)
!243 = !DILocalVariable(name: "buffer", scope: !239, file: !15, line: 163, type: !5)
!244 = !DILocation(line: 163, column: 19, scope: !239)
!245 = !DILocation(line: 163, column: 35, scope: !239)
!246 = !DILocation(line: 163, column: 28, scope: !239)
!247 = !DILocation(line: 164, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !239, file: !15, line: 164, column: 17)
!249 = !DILocation(line: 164, column: 24, scope: !248)
!250 = !DILocation(line: 164, column: 17, scope: !239)
!251 = !DILocation(line: 164, column: 34, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !15, line: 164, column: 33)
!253 = !DILocation(line: 166, column: 20, scope: !254)
!254 = distinct !DILexicalBlock(scope: !239, file: !15, line: 166, column: 13)
!255 = !DILocation(line: 166, column: 18, scope: !254)
!256 = !DILocation(line: 166, column: 25, scope: !257)
!257 = distinct !DILexicalBlock(scope: !254, file: !15, line: 166, column: 13)
!258 = !DILocation(line: 166, column: 27, scope: !257)
!259 = !DILocation(line: 166, column: 13, scope: !254)
!260 = !DILocation(line: 168, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !15, line: 167, column: 13)
!262 = !DILocation(line: 168, column: 24, scope: !261)
!263 = !DILocation(line: 168, column: 27, scope: !261)
!264 = !DILocation(line: 169, column: 13, scope: !261)
!265 = !DILocation(line: 166, column: 34, scope: !257)
!266 = !DILocation(line: 166, column: 13, scope: !257)
!267 = distinct !{!267, !259, !268, !74}
!268 = !DILocation(line: 169, column: 13, scope: !254)
!269 = !DILocation(line: 171, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !239, file: !15, line: 171, column: 17)
!271 = !DILocation(line: 171, column: 22, scope: !270)
!272 = !DILocation(line: 171, column: 27, scope: !270)
!273 = !DILocation(line: 171, column: 30, scope: !270)
!274 = !DILocation(line: 171, column: 35, scope: !270)
!275 = !DILocation(line: 171, column: 17, scope: !239)
!276 = !DILocation(line: 173, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !270, file: !15, line: 172, column: 13)
!278 = !DILocation(line: 173, column: 24, scope: !277)
!279 = !DILocation(line: 173, column: 30, scope: !277)
!280 = !DILocation(line: 175, column: 23, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !15, line: 175, column: 17)
!282 = !DILocation(line: 175, column: 21, scope: !281)
!283 = !DILocation(line: 175, column: 28, scope: !284)
!284 = distinct !DILexicalBlock(scope: !281, file: !15, line: 175, column: 17)
!285 = !DILocation(line: 175, column: 30, scope: !284)
!286 = !DILocation(line: 175, column: 17, scope: !281)
!287 = !DILocation(line: 177, column: 34, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !15, line: 176, column: 17)
!289 = !DILocation(line: 177, column: 41, scope: !288)
!290 = !DILocation(line: 177, column: 21, scope: !288)
!291 = !DILocation(line: 178, column: 17, scope: !288)
!292 = !DILocation(line: 175, column: 37, scope: !284)
!293 = !DILocation(line: 175, column: 17, scope: !284)
!294 = distinct !{!294, !286, !295, !74}
!295 = !DILocation(line: 178, column: 17, scope: !281)
!296 = !DILocation(line: 179, column: 13, scope: !277)
!297 = !DILocation(line: 182, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !270, file: !15, line: 181, column: 13)
!299 = !DILocation(line: 184, column: 18, scope: !239)
!300 = !DILocation(line: 184, column: 13, scope: !239)
!301 = !DILocation(line: 187, column: 1, scope: !216)
!302 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 190, type: !16, scopeLine: 191, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!303 = !DILocalVariable(name: "data", scope: !302, file: !15, line: 192, type: !6)
!304 = !DILocation(line: 192, column: 9, scope: !302)
!305 = !DILocation(line: 194, column: 10, scope: !302)
!306 = !DILocation(line: 204, column: 14, scope: !307)
!307 = distinct !DILexicalBlock(scope: !308, file: !15, line: 201, column: 5)
!308 = distinct !DILexicalBlock(scope: !302, file: !15, line: 195, column: 8)
!309 = !DILocalVariable(name: "i", scope: !310, file: !15, line: 209, type: !6)
!310 = distinct !DILexicalBlock(scope: !311, file: !15, line: 208, column: 9)
!311 = distinct !DILexicalBlock(scope: !312, file: !15, line: 207, column: 5)
!312 = distinct !DILexicalBlock(scope: !302, file: !15, line: 206, column: 8)
!313 = !DILocation(line: 209, column: 17, scope: !310)
!314 = !DILocalVariable(name: "buffer", scope: !310, file: !15, line: 210, type: !5)
!315 = !DILocation(line: 210, column: 19, scope: !310)
!316 = !DILocation(line: 210, column: 35, scope: !310)
!317 = !DILocation(line: 210, column: 28, scope: !310)
!318 = !DILocation(line: 211, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !310, file: !15, line: 211, column: 17)
!320 = !DILocation(line: 211, column: 24, scope: !319)
!321 = !DILocation(line: 211, column: 17, scope: !310)
!322 = !DILocation(line: 211, column: 34, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !15, line: 211, column: 33)
!324 = !DILocation(line: 213, column: 20, scope: !325)
!325 = distinct !DILexicalBlock(scope: !310, file: !15, line: 213, column: 13)
!326 = !DILocation(line: 213, column: 18, scope: !325)
!327 = !DILocation(line: 213, column: 25, scope: !328)
!328 = distinct !DILexicalBlock(scope: !325, file: !15, line: 213, column: 13)
!329 = !DILocation(line: 213, column: 27, scope: !328)
!330 = !DILocation(line: 213, column: 13, scope: !325)
!331 = !DILocation(line: 215, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !15, line: 214, column: 13)
!333 = !DILocation(line: 215, column: 24, scope: !332)
!334 = !DILocation(line: 215, column: 27, scope: !332)
!335 = !DILocation(line: 216, column: 13, scope: !332)
!336 = !DILocation(line: 213, column: 34, scope: !328)
!337 = !DILocation(line: 213, column: 13, scope: !328)
!338 = distinct !{!338, !330, !339, !74}
!339 = !DILocation(line: 216, column: 13, scope: !325)
!340 = !DILocation(line: 219, column: 17, scope: !341)
!341 = distinct !DILexicalBlock(scope: !310, file: !15, line: 219, column: 17)
!342 = !DILocation(line: 219, column: 22, scope: !341)
!343 = !DILocation(line: 219, column: 17, scope: !310)
!344 = !DILocation(line: 221, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !15, line: 220, column: 13)
!346 = !DILocation(line: 221, column: 24, scope: !345)
!347 = !DILocation(line: 221, column: 30, scope: !345)
!348 = !DILocation(line: 223, column: 23, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !15, line: 223, column: 17)
!350 = !DILocation(line: 223, column: 21, scope: !349)
!351 = !DILocation(line: 223, column: 28, scope: !352)
!352 = distinct !DILexicalBlock(scope: !349, file: !15, line: 223, column: 17)
!353 = !DILocation(line: 223, column: 30, scope: !352)
!354 = !DILocation(line: 223, column: 17, scope: !349)
!355 = !DILocation(line: 225, column: 34, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !15, line: 224, column: 17)
!357 = !DILocation(line: 225, column: 41, scope: !356)
!358 = !DILocation(line: 225, column: 21, scope: !356)
!359 = !DILocation(line: 226, column: 17, scope: !356)
!360 = !DILocation(line: 223, column: 37, scope: !352)
!361 = !DILocation(line: 223, column: 17, scope: !352)
!362 = distinct !{!362, !354, !363, !74}
!363 = !DILocation(line: 226, column: 17, scope: !349)
!364 = !DILocation(line: 227, column: 13, scope: !345)
!365 = !DILocation(line: 230, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !341, file: !15, line: 229, column: 13)
!367 = !DILocation(line: 232, column: 18, scope: !310)
!368 = !DILocation(line: 232, column: 13, scope: !310)
!369 = !DILocation(line: 235, column: 1, scope: !302)
!370 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 238, type: !16, scopeLine: 239, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!371 = !DILocalVariable(name: "data", scope: !370, file: !15, line: 240, type: !6)
!372 = !DILocation(line: 240, column: 9, scope: !370)
!373 = !DILocation(line: 242, column: 10, scope: !370)
!374 = !DILocation(line: 247, column: 14, scope: !375)
!375 = distinct !DILexicalBlock(scope: !376, file: !15, line: 244, column: 5)
!376 = distinct !DILexicalBlock(scope: !370, file: !15, line: 243, column: 8)
!377 = !DILocalVariable(name: "i", scope: !378, file: !15, line: 252, type: !6)
!378 = distinct !DILexicalBlock(scope: !379, file: !15, line: 251, column: 9)
!379 = distinct !DILexicalBlock(scope: !380, file: !15, line: 250, column: 5)
!380 = distinct !DILexicalBlock(scope: !370, file: !15, line: 249, column: 8)
!381 = !DILocation(line: 252, column: 17, scope: !378)
!382 = !DILocalVariable(name: "buffer", scope: !378, file: !15, line: 253, type: !5)
!383 = !DILocation(line: 253, column: 19, scope: !378)
!384 = !DILocation(line: 253, column: 35, scope: !378)
!385 = !DILocation(line: 253, column: 28, scope: !378)
!386 = !DILocation(line: 254, column: 17, scope: !387)
!387 = distinct !DILexicalBlock(scope: !378, file: !15, line: 254, column: 17)
!388 = !DILocation(line: 254, column: 24, scope: !387)
!389 = !DILocation(line: 254, column: 17, scope: !378)
!390 = !DILocation(line: 254, column: 34, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !15, line: 254, column: 33)
!392 = !DILocation(line: 256, column: 20, scope: !393)
!393 = distinct !DILexicalBlock(scope: !378, file: !15, line: 256, column: 13)
!394 = !DILocation(line: 256, column: 18, scope: !393)
!395 = !DILocation(line: 256, column: 25, scope: !396)
!396 = distinct !DILexicalBlock(scope: !393, file: !15, line: 256, column: 13)
!397 = !DILocation(line: 256, column: 27, scope: !396)
!398 = !DILocation(line: 256, column: 13, scope: !393)
!399 = !DILocation(line: 258, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !15, line: 257, column: 13)
!401 = !DILocation(line: 258, column: 24, scope: !400)
!402 = !DILocation(line: 258, column: 27, scope: !400)
!403 = !DILocation(line: 259, column: 13, scope: !400)
!404 = !DILocation(line: 256, column: 34, scope: !396)
!405 = !DILocation(line: 256, column: 13, scope: !396)
!406 = distinct !{!406, !398, !407, !74}
!407 = !DILocation(line: 259, column: 13, scope: !393)
!408 = !DILocation(line: 262, column: 17, scope: !409)
!409 = distinct !DILexicalBlock(scope: !378, file: !15, line: 262, column: 17)
!410 = !DILocation(line: 262, column: 22, scope: !409)
!411 = !DILocation(line: 262, column: 17, scope: !378)
!412 = !DILocation(line: 264, column: 17, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !15, line: 263, column: 13)
!414 = !DILocation(line: 264, column: 24, scope: !413)
!415 = !DILocation(line: 264, column: 30, scope: !413)
!416 = !DILocation(line: 266, column: 23, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !15, line: 266, column: 17)
!418 = !DILocation(line: 266, column: 21, scope: !417)
!419 = !DILocation(line: 266, column: 28, scope: !420)
!420 = distinct !DILexicalBlock(scope: !417, file: !15, line: 266, column: 17)
!421 = !DILocation(line: 266, column: 30, scope: !420)
!422 = !DILocation(line: 266, column: 17, scope: !417)
!423 = !DILocation(line: 268, column: 34, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !15, line: 267, column: 17)
!425 = !DILocation(line: 268, column: 41, scope: !424)
!426 = !DILocation(line: 268, column: 21, scope: !424)
!427 = !DILocation(line: 269, column: 17, scope: !424)
!428 = !DILocation(line: 266, column: 37, scope: !420)
!429 = !DILocation(line: 266, column: 17, scope: !420)
!430 = distinct !{!430, !422, !431, !74}
!431 = !DILocation(line: 269, column: 17, scope: !417)
!432 = !DILocation(line: 270, column: 13, scope: !413)
!433 = !DILocation(line: 273, column: 17, scope: !434)
!434 = distinct !DILexicalBlock(scope: !409, file: !15, line: 272, column: 13)
!435 = !DILocation(line: 275, column: 18, scope: !378)
!436 = !DILocation(line: 275, column: 13, scope: !378)
!437 = !DILocation(line: 278, column: 1, scope: !370)
