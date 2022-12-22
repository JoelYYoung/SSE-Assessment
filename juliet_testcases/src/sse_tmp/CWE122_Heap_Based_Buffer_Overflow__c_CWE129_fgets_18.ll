; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !24, metadata !DIExpression()), !dbg !30
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !30
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !31
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !33
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !34
  %cmp = icmp ne i8* %call, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %source
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !39
  store i32 %call2, i32* %data, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %source
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %sink, !dbg !44

sink:                                             ; preds = %if.end
  call void @llvm.dbg.label(metadata !45), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %i, metadata !47, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !50, metadata !DIExpression()), !dbg !51
  %call3 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !52
  %2 = bitcast i8* %call3 to i32*, !dbg !53
  store i32* %2, i32** %buffer, align 8, !dbg !51
  %3 = load i32*, i32** %buffer, align 8, !dbg !54
  %cmp4 = icmp eq i32* %3, null, !dbg !56
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !57

if.then5:                                         ; preds = %sink
  call void @exit(i32 -1) #9, !dbg !58
  unreachable, !dbg !58

if.end6:                                          ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !63
  %cmp7 = icmp slt i32 %4, 10, !dbg !65
  br i1 %cmp7, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !67
  %6 = load i32, i32* %i, align 4, !dbg !69
  %idxprom = sext i32 %6 to i64, !dbg !67
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !67
  store i32 0, i32* %arrayidx, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !72
  %inc = add nsw i32 %7, 1, !dbg !72
  store i32 %inc, i32* %i, align 4, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !77
  %cmp8 = icmp sge i32 %8, 0, !dbg !79
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !80

if.then9:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !81
  %10 = load i32, i32* %data, align 4, !dbg !83
  %idxprom10 = sext i32 %10 to i64, !dbg !81
  %arrayidx11 = getelementptr inbounds i32, i32* %9, i64 %idxprom10, !dbg !81
  store i32 1, i32* %arrayidx11, align 4, !dbg !84
  store i32 0, i32* %i, align 4, !dbg !85
  br label %for.cond12, !dbg !87

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %11 = load i32, i32* %i, align 4, !dbg !88
  %cmp13 = icmp slt i32 %11, 10, !dbg !90
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !91

for.body14:                                       ; preds = %for.cond12
  %12 = load i32*, i32** %buffer, align 8, !dbg !92
  %13 = load i32, i32* %i, align 4, !dbg !94
  %idxprom15 = sext i32 %13 to i64, !dbg !92
  %arrayidx16 = getelementptr inbounds i32, i32* %12, i64 %idxprom15, !dbg !92
  %14 = load i32, i32* %arrayidx16, align 4, !dbg !92
  call void @printIntLine(i32 %14), !dbg !95
  br label %for.inc17, !dbg !96

for.inc17:                                        ; preds = %for.body14
  %15 = load i32, i32* %i, align 4, !dbg !97
  %inc18 = add nsw i32 %15, 1, !dbg !97
  store i32 %inc18, i32* %i, align 4, !dbg !97
  br label %for.cond12, !dbg !98, !llvm.loop !99

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !101

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %16 = load i32*, i32** %buffer, align 8, !dbg !104
  %17 = bitcast i32* %16 to i8*, !dbg !104
  call void @free(i8* %17) #8, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18_good() #0 !dbg !107 {
entry:
  call void @goodB2G(), !dbg !108
  call void @goodG2B(), !dbg !109
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18_good(), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18_bad(), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !128
  ret i32 0, !dbg !129
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !130 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 -1, i32* %data, align 4, !dbg !133
  br label %source, !dbg !134

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !135), !dbg !136
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !137, metadata !DIExpression()), !dbg !139
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !139
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !140
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !142
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !143
  %cmp = icmp ne i8* %call, null, !dbg !144
  br i1 %cmp, label %if.then, label %if.else, !dbg !145

if.then:                                          ; preds = %source
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !146
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !148
  store i32 %call2, i32* %data, align 4, !dbg !149
  br label %if.end, !dbg !150

if.else:                                          ; preds = %source
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !151
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %sink, !dbg !153

sink:                                             ; preds = %if.end
  call void @llvm.dbg.label(metadata !154), !dbg !155
  call void @llvm.dbg.declare(metadata i32* %i, metadata !156, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !159, metadata !DIExpression()), !dbg !160
  %call3 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !161
  %2 = bitcast i8* %call3 to i32*, !dbg !162
  store i32* %2, i32** %buffer, align 8, !dbg !160
  %3 = load i32*, i32** %buffer, align 8, !dbg !163
  %cmp4 = icmp eq i32* %3, null, !dbg !165
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !166

if.then5:                                         ; preds = %sink
  call void @exit(i32 -1) #9, !dbg !167
  unreachable, !dbg !167

if.end6:                                          ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !172
  %cmp7 = icmp slt i32 %4, 10, !dbg !174
  br i1 %cmp7, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !176
  %6 = load i32, i32* %i, align 4, !dbg !178
  %idxprom = sext i32 %6 to i64, !dbg !176
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !176
  store i32 0, i32* %arrayidx, align 4, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !181
  %inc = add nsw i32 %7, 1, !dbg !181
  store i32 %inc, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !185
  %cmp8 = icmp sge i32 %8, 0, !dbg !187
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !188

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !189
  %cmp9 = icmp slt i32 %9, 10, !dbg !190
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !191

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !192
  %11 = load i32, i32* %data, align 4, !dbg !194
  %idxprom11 = sext i32 %11 to i64, !dbg !192
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !192
  store i32 1, i32* %arrayidx12, align 4, !dbg !195
  store i32 0, i32* %i, align 4, !dbg !196
  br label %for.cond13, !dbg !198

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !199
  %cmp14 = icmp slt i32 %12, 10, !dbg !201
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !202

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !203
  %14 = load i32, i32* %i, align 4, !dbg !205
  %idxprom16 = sext i32 %14 to i64, !dbg !203
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !203
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !203
  call void @printIntLine(i32 %15), !dbg !206
  br label %for.inc18, !dbg !207

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !208
  %inc19 = add nsw i32 %16, 1, !dbg !208
  store i32 %inc19, i32* %i, align 4, !dbg !208
  br label %for.cond13, !dbg !209, !llvm.loop !210

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !212

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !213
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !215
  %18 = bitcast i32* %17 to i8*, !dbg !215
  call void @free(i8* %18) #8, !dbg !216
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !218 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 -1, i32* %data, align 4, !dbg !221
  br label %source, !dbg !222

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !223), !dbg !224
  store i32 7, i32* %data, align 4, !dbg !225
  br label %sink, !dbg !226

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !227), !dbg !228
  call void @llvm.dbg.declare(metadata i32* %i, metadata !229, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !232, metadata !DIExpression()), !dbg !233
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !234
  %0 = bitcast i8* %call to i32*, !dbg !235
  store i32* %0, i32** %buffer, align 8, !dbg !233
  %1 = load i32*, i32** %buffer, align 8, !dbg !236
  %cmp = icmp eq i32* %1, null, !dbg !238
  br i1 %cmp, label %if.then, label %if.end, !dbg !239

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #9, !dbg !240
  unreachable, !dbg !240

if.end:                                           ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !242
  br label %for.cond, !dbg !244

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !245
  %cmp1 = icmp slt i32 %2, 10, !dbg !247
  br i1 %cmp1, label %for.body, label %for.end, !dbg !248

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !249
  %4 = load i32, i32* %i, align 4, !dbg !251
  %idxprom = sext i32 %4 to i64, !dbg !249
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !249
  store i32 0, i32* %arrayidx, align 4, !dbg !252
  br label %for.inc, !dbg !253

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !254
  %inc = add nsw i32 %5, 1, !dbg !254
  store i32 %inc, i32* %i, align 4, !dbg !254
  br label %for.cond, !dbg !255, !llvm.loop !256

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !258
  %cmp2 = icmp sge i32 %6, 0, !dbg !260
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !261

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !262
  %8 = load i32, i32* %data, align 4, !dbg !264
  %idxprom4 = sext i32 %8 to i64, !dbg !262
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !262
  store i32 1, i32* %arrayidx5, align 4, !dbg !265
  store i32 0, i32* %i, align 4, !dbg !266
  br label %for.cond6, !dbg !268

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !269
  %cmp7 = icmp slt i32 %9, 10, !dbg !271
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !272

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !273
  %11 = load i32, i32* %i, align 4, !dbg !275
  %idxprom9 = sext i32 %11 to i64, !dbg !273
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !273
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !273
  call void @printIntLine(i32 %12), !dbg !276
  br label %for.inc11, !dbg !277

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !278
  %inc12 = add nsw i32 %13, 1, !dbg !278
  store i32 %inc12, i32* %i, align 4, !dbg !278
  br label %for.cond6, !dbg !279, !llvm.loop !280

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !282

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !283
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !285
  %15 = bitcast i32* %14 to i8*, !dbg !285
  call void @free(i8* %15) #8, !dbg !286
  ret void, !dbg !287
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !6)
!19 = !DILocation(line: 26, column: 9, scope: !14)
!20 = !DILocation(line: 28, column: 10, scope: !14)
!21 = !DILocation(line: 29, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !15, line: 30)
!23 = !DILocation(line: 30, column: 1, scope: !14)
!24 = !DILocalVariable(name: "inputBuffer", scope: !25, file: !15, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 112, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 14)
!30 = !DILocation(line: 32, column: 14, scope: !25)
!31 = !DILocation(line: 34, column: 19, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !15, line: 34, column: 13)
!33 = !DILocation(line: 34, column: 49, scope: !32)
!34 = !DILocation(line: 34, column: 13, scope: !32)
!35 = !DILocation(line: 34, column: 56, scope: !32)
!36 = !DILocation(line: 34, column: 13, scope: !25)
!37 = !DILocation(line: 37, column: 25, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !15, line: 35, column: 9)
!39 = !DILocation(line: 37, column: 20, scope: !38)
!40 = !DILocation(line: 37, column: 18, scope: !38)
!41 = !DILocation(line: 38, column: 9, scope: !38)
!42 = !DILocation(line: 41, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !32, file: !15, line: 40, column: 9)
!44 = !DILocation(line: 44, column: 5, scope: !14)
!45 = !DILabel(scope: !14, name: "sink", file: !15, line: 45)
!46 = !DILocation(line: 45, column: 1, scope: !14)
!47 = !DILocalVariable(name: "i", scope: !48, file: !15, line: 47, type: !6)
!48 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 5)
!49 = !DILocation(line: 47, column: 13, scope: !48)
!50 = !DILocalVariable(name: "buffer", scope: !48, file: !15, line: 48, type: !5)
!51 = !DILocation(line: 48, column: 15, scope: !48)
!52 = !DILocation(line: 48, column: 31, scope: !48)
!53 = !DILocation(line: 48, column: 24, scope: !48)
!54 = !DILocation(line: 49, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !48, file: !15, line: 49, column: 13)
!56 = !DILocation(line: 49, column: 20, scope: !55)
!57 = !DILocation(line: 49, column: 13, scope: !48)
!58 = !DILocation(line: 49, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !15, line: 49, column: 29)
!60 = !DILocation(line: 51, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !48, file: !15, line: 51, column: 9)
!62 = !DILocation(line: 51, column: 14, scope: !61)
!63 = !DILocation(line: 51, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !15, line: 51, column: 9)
!65 = !DILocation(line: 51, column: 23, scope: !64)
!66 = !DILocation(line: 51, column: 9, scope: !61)
!67 = !DILocation(line: 53, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 52, column: 9)
!69 = !DILocation(line: 53, column: 20, scope: !68)
!70 = !DILocation(line: 53, column: 23, scope: !68)
!71 = !DILocation(line: 54, column: 9, scope: !68)
!72 = !DILocation(line: 51, column: 30, scope: !64)
!73 = !DILocation(line: 51, column: 9, scope: !64)
!74 = distinct !{!74, !66, !75, !76}
!75 = !DILocation(line: 54, column: 9, scope: !61)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 57, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !48, file: !15, line: 57, column: 13)
!79 = !DILocation(line: 57, column: 18, scope: !78)
!80 = !DILocation(line: 57, column: 13, scope: !48)
!81 = !DILocation(line: 59, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 58, column: 9)
!83 = !DILocation(line: 59, column: 20, scope: !82)
!84 = !DILocation(line: 59, column: 26, scope: !82)
!85 = !DILocation(line: 61, column: 19, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !15, line: 61, column: 13)
!87 = !DILocation(line: 61, column: 17, scope: !86)
!88 = !DILocation(line: 61, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !15, line: 61, column: 13)
!90 = !DILocation(line: 61, column: 26, scope: !89)
!91 = !DILocation(line: 61, column: 13, scope: !86)
!92 = !DILocation(line: 63, column: 30, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 62, column: 13)
!94 = !DILocation(line: 63, column: 37, scope: !93)
!95 = !DILocation(line: 63, column: 17, scope: !93)
!96 = !DILocation(line: 64, column: 13, scope: !93)
!97 = !DILocation(line: 61, column: 33, scope: !89)
!98 = !DILocation(line: 61, column: 13, scope: !89)
!99 = distinct !{!99, !91, !100, !76}
!100 = !DILocation(line: 64, column: 13, scope: !86)
!101 = !DILocation(line: 65, column: 9, scope: !82)
!102 = !DILocation(line: 68, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !78, file: !15, line: 67, column: 9)
!104 = !DILocation(line: 70, column: 14, scope: !48)
!105 = !DILocation(line: 70, column: 9, scope: !48)
!106 = !DILocation(line: 72, column: 1, scope: !14)
!107 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_18_good", scope: !15, file: !15, line: 169, type: !16, scopeLine: 170, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocation(line: 171, column: 5, scope: !107)
!109 = !DILocation(line: 172, column: 5, scope: !107)
!110 = !DILocation(line: 173, column: 1, scope: !107)
!111 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 184, type: !112, scopeLine: 185, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DISubroutineType(types: !113)
!113 = !{!6, !6, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!116 = !DILocalVariable(name: "argc", arg: 1, scope: !111, file: !15, line: 184, type: !6)
!117 = !DILocation(line: 184, column: 14, scope: !111)
!118 = !DILocalVariable(name: "argv", arg: 2, scope: !111, file: !15, line: 184, type: !114)
!119 = !DILocation(line: 184, column: 27, scope: !111)
!120 = !DILocation(line: 187, column: 22, scope: !111)
!121 = !DILocation(line: 187, column: 12, scope: !111)
!122 = !DILocation(line: 187, column: 5, scope: !111)
!123 = !DILocation(line: 189, column: 5, scope: !111)
!124 = !DILocation(line: 190, column: 5, scope: !111)
!125 = !DILocation(line: 191, column: 5, scope: !111)
!126 = !DILocation(line: 194, column: 5, scope: !111)
!127 = !DILocation(line: 195, column: 5, scope: !111)
!128 = !DILocation(line: 196, column: 5, scope: !111)
!129 = !DILocation(line: 198, column: 5, scope: !111)
!130 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 79, type: !16, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "data", scope: !130, file: !15, line: 81, type: !6)
!132 = !DILocation(line: 81, column: 9, scope: !130)
!133 = !DILocation(line: 83, column: 10, scope: !130)
!134 = !DILocation(line: 84, column: 5, scope: !130)
!135 = !DILabel(scope: !130, name: "source", file: !15, line: 85)
!136 = !DILocation(line: 85, column: 1, scope: !130)
!137 = !DILocalVariable(name: "inputBuffer", scope: !138, file: !15, line: 87, type: !26)
!138 = distinct !DILexicalBlock(scope: !130, file: !15, line: 86, column: 5)
!139 = !DILocation(line: 87, column: 14, scope: !138)
!140 = !DILocation(line: 89, column: 19, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !15, line: 89, column: 13)
!142 = !DILocation(line: 89, column: 49, scope: !141)
!143 = !DILocation(line: 89, column: 13, scope: !141)
!144 = !DILocation(line: 89, column: 56, scope: !141)
!145 = !DILocation(line: 89, column: 13, scope: !138)
!146 = !DILocation(line: 92, column: 25, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !15, line: 90, column: 9)
!148 = !DILocation(line: 92, column: 20, scope: !147)
!149 = !DILocation(line: 92, column: 18, scope: !147)
!150 = !DILocation(line: 93, column: 9, scope: !147)
!151 = !DILocation(line: 96, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !141, file: !15, line: 95, column: 9)
!153 = !DILocation(line: 99, column: 5, scope: !130)
!154 = !DILabel(scope: !130, name: "sink", file: !15, line: 100)
!155 = !DILocation(line: 100, column: 1, scope: !130)
!156 = !DILocalVariable(name: "i", scope: !157, file: !15, line: 102, type: !6)
!157 = distinct !DILexicalBlock(scope: !130, file: !15, line: 101, column: 5)
!158 = !DILocation(line: 102, column: 13, scope: !157)
!159 = !DILocalVariable(name: "buffer", scope: !157, file: !15, line: 103, type: !5)
!160 = !DILocation(line: 103, column: 15, scope: !157)
!161 = !DILocation(line: 103, column: 31, scope: !157)
!162 = !DILocation(line: 103, column: 24, scope: !157)
!163 = !DILocation(line: 104, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !15, line: 104, column: 13)
!165 = !DILocation(line: 104, column: 20, scope: !164)
!166 = !DILocation(line: 104, column: 13, scope: !157)
!167 = !DILocation(line: 104, column: 30, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 104, column: 29)
!169 = !DILocation(line: 106, column: 16, scope: !170)
!170 = distinct !DILexicalBlock(scope: !157, file: !15, line: 106, column: 9)
!171 = !DILocation(line: 106, column: 14, scope: !170)
!172 = !DILocation(line: 106, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !15, line: 106, column: 9)
!174 = !DILocation(line: 106, column: 23, scope: !173)
!175 = !DILocation(line: 106, column: 9, scope: !170)
!176 = !DILocation(line: 108, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 107, column: 9)
!178 = !DILocation(line: 108, column: 20, scope: !177)
!179 = !DILocation(line: 108, column: 23, scope: !177)
!180 = !DILocation(line: 109, column: 9, scope: !177)
!181 = !DILocation(line: 106, column: 30, scope: !173)
!182 = !DILocation(line: 106, column: 9, scope: !173)
!183 = distinct !{!183, !175, !184, !76}
!184 = !DILocation(line: 109, column: 9, scope: !170)
!185 = !DILocation(line: 111, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !157, file: !15, line: 111, column: 13)
!187 = !DILocation(line: 111, column: 18, scope: !186)
!188 = !DILocation(line: 111, column: 23, scope: !186)
!189 = !DILocation(line: 111, column: 26, scope: !186)
!190 = !DILocation(line: 111, column: 31, scope: !186)
!191 = !DILocation(line: 111, column: 13, scope: !157)
!192 = !DILocation(line: 113, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !186, file: !15, line: 112, column: 9)
!194 = !DILocation(line: 113, column: 20, scope: !193)
!195 = !DILocation(line: 113, column: 26, scope: !193)
!196 = !DILocation(line: 115, column: 19, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !15, line: 115, column: 13)
!198 = !DILocation(line: 115, column: 17, scope: !197)
!199 = !DILocation(line: 115, column: 24, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !15, line: 115, column: 13)
!201 = !DILocation(line: 115, column: 26, scope: !200)
!202 = !DILocation(line: 115, column: 13, scope: !197)
!203 = !DILocation(line: 117, column: 30, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !15, line: 116, column: 13)
!205 = !DILocation(line: 117, column: 37, scope: !204)
!206 = !DILocation(line: 117, column: 17, scope: !204)
!207 = !DILocation(line: 118, column: 13, scope: !204)
!208 = !DILocation(line: 115, column: 33, scope: !200)
!209 = !DILocation(line: 115, column: 13, scope: !200)
!210 = distinct !{!210, !202, !211, !76}
!211 = !DILocation(line: 118, column: 13, scope: !197)
!212 = !DILocation(line: 119, column: 9, scope: !193)
!213 = !DILocation(line: 122, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !186, file: !15, line: 121, column: 9)
!215 = !DILocation(line: 124, column: 14, scope: !157)
!216 = !DILocation(line: 124, column: 9, scope: !157)
!217 = !DILocation(line: 126, column: 1, scope: !130)
!218 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 129, type: !16, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!219 = !DILocalVariable(name: "data", scope: !218, file: !15, line: 131, type: !6)
!220 = !DILocation(line: 131, column: 9, scope: !218)
!221 = !DILocation(line: 133, column: 10, scope: !218)
!222 = !DILocation(line: 134, column: 5, scope: !218)
!223 = !DILabel(scope: !218, name: "source", file: !15, line: 135)
!224 = !DILocation(line: 135, column: 1, scope: !218)
!225 = !DILocation(line: 138, column: 10, scope: !218)
!226 = !DILocation(line: 139, column: 5, scope: !218)
!227 = !DILabel(scope: !218, name: "sink", file: !15, line: 140)
!228 = !DILocation(line: 140, column: 1, scope: !218)
!229 = !DILocalVariable(name: "i", scope: !230, file: !15, line: 142, type: !6)
!230 = distinct !DILexicalBlock(scope: !218, file: !15, line: 141, column: 5)
!231 = !DILocation(line: 142, column: 13, scope: !230)
!232 = !DILocalVariable(name: "buffer", scope: !230, file: !15, line: 143, type: !5)
!233 = !DILocation(line: 143, column: 15, scope: !230)
!234 = !DILocation(line: 143, column: 31, scope: !230)
!235 = !DILocation(line: 143, column: 24, scope: !230)
!236 = !DILocation(line: 144, column: 13, scope: !237)
!237 = distinct !DILexicalBlock(scope: !230, file: !15, line: 144, column: 13)
!238 = !DILocation(line: 144, column: 20, scope: !237)
!239 = !DILocation(line: 144, column: 13, scope: !230)
!240 = !DILocation(line: 144, column: 30, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !15, line: 144, column: 29)
!242 = !DILocation(line: 146, column: 16, scope: !243)
!243 = distinct !DILexicalBlock(scope: !230, file: !15, line: 146, column: 9)
!244 = !DILocation(line: 146, column: 14, scope: !243)
!245 = !DILocation(line: 146, column: 21, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !15, line: 146, column: 9)
!247 = !DILocation(line: 146, column: 23, scope: !246)
!248 = !DILocation(line: 146, column: 9, scope: !243)
!249 = !DILocation(line: 148, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !15, line: 147, column: 9)
!251 = !DILocation(line: 148, column: 20, scope: !250)
!252 = !DILocation(line: 148, column: 23, scope: !250)
!253 = !DILocation(line: 149, column: 9, scope: !250)
!254 = !DILocation(line: 146, column: 30, scope: !246)
!255 = !DILocation(line: 146, column: 9, scope: !246)
!256 = distinct !{!256, !248, !257, !76}
!257 = !DILocation(line: 149, column: 9, scope: !243)
!258 = !DILocation(line: 152, column: 13, scope: !259)
!259 = distinct !DILexicalBlock(scope: !230, file: !15, line: 152, column: 13)
!260 = !DILocation(line: 152, column: 18, scope: !259)
!261 = !DILocation(line: 152, column: 13, scope: !230)
!262 = !DILocation(line: 154, column: 13, scope: !263)
!263 = distinct !DILexicalBlock(scope: !259, file: !15, line: 153, column: 9)
!264 = !DILocation(line: 154, column: 20, scope: !263)
!265 = !DILocation(line: 154, column: 26, scope: !263)
!266 = !DILocation(line: 156, column: 19, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !15, line: 156, column: 13)
!268 = !DILocation(line: 156, column: 17, scope: !267)
!269 = !DILocation(line: 156, column: 24, scope: !270)
!270 = distinct !DILexicalBlock(scope: !267, file: !15, line: 156, column: 13)
!271 = !DILocation(line: 156, column: 26, scope: !270)
!272 = !DILocation(line: 156, column: 13, scope: !267)
!273 = !DILocation(line: 158, column: 30, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !15, line: 157, column: 13)
!275 = !DILocation(line: 158, column: 37, scope: !274)
!276 = !DILocation(line: 158, column: 17, scope: !274)
!277 = !DILocation(line: 159, column: 13, scope: !274)
!278 = !DILocation(line: 156, column: 33, scope: !270)
!279 = !DILocation(line: 156, column: 13, scope: !270)
!280 = distinct !{!280, !272, !281, !76}
!281 = !DILocation(line: 159, column: 13, scope: !267)
!282 = !DILocation(line: 160, column: 9, scope: !263)
!283 = !DILocation(line: 163, column: 13, scope: !284)
!284 = distinct !DILexicalBlock(scope: !259, file: !15, line: 162, column: 9)
!285 = !DILocation(line: 165, column: 14, scope: !230)
!286 = !DILocation(line: 165, column: 9, scope: !230)
!287 = !DILocation(line: 167, column: 1, scope: !218)
