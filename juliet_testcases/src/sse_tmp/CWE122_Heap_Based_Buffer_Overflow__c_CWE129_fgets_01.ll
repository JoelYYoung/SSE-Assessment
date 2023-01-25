; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01_bad() #0 !dbg !14 {
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01_good() #0 !dbg !101 {
entry:
  call void @goodG2B(), !dbg !102
  call void @goodB2G(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* null) #8, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #8, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 -1, i32* %data, align 4, !dbg !127
  store i32 7, i32* %data, align 4, !dbg !128
  call void @llvm.dbg.declare(metadata i32* %i, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !132, metadata !DIExpression()), !dbg !133
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !134
  %0 = bitcast i8* %call to i32*, !dbg !135
  store i32* %0, i32** %buffer, align 8, !dbg !133
  %1 = load i32*, i32** %buffer, align 8, !dbg !136
  %cmp = icmp eq i32* %1, null, !dbg !138
  br i1 %cmp, label %if.then, label %if.end, !dbg !139

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !145
  %cmp1 = icmp slt i32 %2, 10, !dbg !147
  br i1 %cmp1, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !149
  %4 = load i32, i32* %i, align 4, !dbg !151
  %idxprom = sext i32 %4 to i64, !dbg !149
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !149
  store i32 0, i32* %arrayidx, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !154
  %inc = add nsw i32 %5, 1, !dbg !154
  store i32 %inc, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !158
  %cmp2 = icmp sge i32 %6, 0, !dbg !160
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !161

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !162
  %8 = load i32, i32* %data, align 4, !dbg !164
  %idxprom4 = sext i32 %8 to i64, !dbg !162
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !162
  store i32 1, i32* %arrayidx5, align 4, !dbg !165
  store i32 0, i32* %i, align 4, !dbg !166
  br label %for.cond6, !dbg !168

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !169
  %cmp7 = icmp slt i32 %9, 10, !dbg !171
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !172

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !173
  %11 = load i32, i32* %i, align 4, !dbg !175
  %idxprom9 = sext i32 %11 to i64, !dbg !173
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !173
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !173
  call void @printIntLine(i32 %12), !dbg !176
  br label %for.inc11, !dbg !177

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !178
  %inc12 = add nsw i32 %13, 1, !dbg !178
  store i32 %inc12, i32* %i, align 4, !dbg !178
  br label %for.cond6, !dbg !179, !llvm.loop !180

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !182

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !183
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !185
  %15 = bitcast i32* %14 to i8*, !dbg !185
  call void @free(i8* %15) #8, !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !188 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !189, metadata !DIExpression()), !dbg !190
  store i32 -1, i32* %data, align 4, !dbg !191
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !192, metadata !DIExpression()), !dbg !194
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !194
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !194
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !195
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !197
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !198
  %cmp = icmp ne i8* %call, null, !dbg !199
  br i1 %cmp, label %if.then, label %if.else, !dbg !200

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !201
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !203
  store i32 %call2, i32* %data, align 4, !dbg !204
  br label %if.end, !dbg !205

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !206
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !208, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !211, metadata !DIExpression()), !dbg !212
  %call3 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !213
  %2 = bitcast i8* %call3 to i32*, !dbg !214
  store i32* %2, i32** %buffer, align 8, !dbg !212
  %3 = load i32*, i32** %buffer, align 8, !dbg !215
  %cmp4 = icmp eq i32* %3, null, !dbg !217
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !218

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !219
  unreachable, !dbg !219

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !223

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !224
  %cmp7 = icmp slt i32 %4, 10, !dbg !226
  br i1 %cmp7, label %for.body, label %for.end, !dbg !227

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !228
  %6 = load i32, i32* %i, align 4, !dbg !230
  %idxprom = sext i32 %6 to i64, !dbg !228
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !228
  store i32 0, i32* %arrayidx, align 4, !dbg !231
  br label %for.inc, !dbg !232

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !233
  %inc = add nsw i32 %7, 1, !dbg !233
  store i32 %inc, i32* %i, align 4, !dbg !233
  br label %for.cond, !dbg !234, !llvm.loop !235

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !237
  %cmp8 = icmp sge i32 %8, 0, !dbg !239
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !240

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !241
  %cmp9 = icmp slt i32 %9, 10, !dbg !242
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !243

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !244
  %11 = load i32, i32* %data, align 4, !dbg !246
  %idxprom11 = sext i32 %11 to i64, !dbg !244
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !244
  store i32 1, i32* %arrayidx12, align 4, !dbg !247
  store i32 0, i32* %i, align 4, !dbg !248
  br label %for.cond13, !dbg !250

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !251
  %cmp14 = icmp slt i32 %12, 10, !dbg !253
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !254

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !255
  %14 = load i32, i32* %i, align 4, !dbg !257
  %idxprom16 = sext i32 %14 to i64, !dbg !255
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !255
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !255
  call void @printIntLine(i32 %15), !dbg !258
  br label %for.inc18, !dbg !259

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !260
  %inc19 = add nsw i32 %16, 1, !dbg !260
  store i32 %inc19, i32* %i, align 4, !dbg !260
  br label %for.cond13, !dbg !261, !llvm.loop !262

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !264

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !265
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !267
  %18 = bitcast i32* %17 to i8*, !dbg !267
  call void @free(i8* %18) #8, !dbg !268
  ret void, !dbg !269
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !6)
!19 = !DILocation(line: 26, column: 9, scope: !14)
!20 = !DILocation(line: 28, column: 10, scope: !14)
!21 = !DILocalVariable(name: "inputBuffer", scope: !22, file: !15, line: 30, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 112, elements: !25)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!26}
!26 = !DISubrange(count: 14)
!27 = !DILocation(line: 30, column: 14, scope: !22)
!28 = !DILocation(line: 32, column: 19, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 32, column: 13)
!30 = !DILocation(line: 32, column: 49, scope: !29)
!31 = !DILocation(line: 32, column: 13, scope: !29)
!32 = !DILocation(line: 32, column: 56, scope: !29)
!33 = !DILocation(line: 32, column: 13, scope: !22)
!34 = !DILocation(line: 35, column: 25, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !15, line: 33, column: 9)
!36 = !DILocation(line: 35, column: 20, scope: !35)
!37 = !DILocation(line: 35, column: 18, scope: !35)
!38 = !DILocation(line: 36, column: 9, scope: !35)
!39 = !DILocation(line: 39, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !29, file: !15, line: 38, column: 9)
!41 = !DILocalVariable(name: "i", scope: !42, file: !15, line: 43, type: !6)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 5)
!43 = !DILocation(line: 43, column: 13, scope: !42)
!44 = !DILocalVariable(name: "buffer", scope: !42, file: !15, line: 44, type: !5)
!45 = !DILocation(line: 44, column: 15, scope: !42)
!46 = !DILocation(line: 44, column: 31, scope: !42)
!47 = !DILocation(line: 44, column: 24, scope: !42)
!48 = !DILocation(line: 45, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !42, file: !15, line: 45, column: 13)
!50 = !DILocation(line: 45, column: 20, scope: !49)
!51 = !DILocation(line: 45, column: 13, scope: !42)
!52 = !DILocation(line: 45, column: 30, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 45, column: 29)
!54 = !DILocation(line: 47, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !42, file: !15, line: 47, column: 9)
!56 = !DILocation(line: 47, column: 14, scope: !55)
!57 = !DILocation(line: 47, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !15, line: 47, column: 9)
!59 = !DILocation(line: 47, column: 23, scope: !58)
!60 = !DILocation(line: 47, column: 9, scope: !55)
!61 = !DILocation(line: 49, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 48, column: 9)
!63 = !DILocation(line: 49, column: 20, scope: !62)
!64 = !DILocation(line: 49, column: 23, scope: !62)
!65 = !DILocation(line: 50, column: 9, scope: !62)
!66 = !DILocation(line: 47, column: 30, scope: !58)
!67 = !DILocation(line: 47, column: 9, scope: !58)
!68 = distinct !{!68, !60, !69, !70}
!69 = !DILocation(line: 50, column: 9, scope: !55)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 53, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !42, file: !15, line: 53, column: 13)
!73 = !DILocation(line: 53, column: 18, scope: !72)
!74 = !DILocation(line: 53, column: 13, scope: !42)
!75 = !DILocation(line: 55, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 54, column: 9)
!77 = !DILocation(line: 55, column: 20, scope: !76)
!78 = !DILocation(line: 55, column: 26, scope: !76)
!79 = !DILocation(line: 57, column: 19, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 57, column: 13)
!81 = !DILocation(line: 57, column: 17, scope: !80)
!82 = !DILocation(line: 57, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !15, line: 57, column: 13)
!84 = !DILocation(line: 57, column: 26, scope: !83)
!85 = !DILocation(line: 57, column: 13, scope: !80)
!86 = !DILocation(line: 59, column: 30, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 58, column: 13)
!88 = !DILocation(line: 59, column: 37, scope: !87)
!89 = !DILocation(line: 59, column: 17, scope: !87)
!90 = !DILocation(line: 60, column: 13, scope: !87)
!91 = !DILocation(line: 57, column: 33, scope: !83)
!92 = !DILocation(line: 57, column: 13, scope: !83)
!93 = distinct !{!93, !85, !94, !70}
!94 = !DILocation(line: 60, column: 13, scope: !80)
!95 = !DILocation(line: 61, column: 9, scope: !76)
!96 = !DILocation(line: 64, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !72, file: !15, line: 63, column: 9)
!98 = !DILocation(line: 66, column: 14, scope: !42)
!99 = !DILocation(line: 66, column: 9, scope: !42)
!100 = !DILocation(line: 68, column: 1, scope: !14)
!101 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_01_good", scope: !15, file: !15, line: 157, type: !16, scopeLine: 158, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 159, column: 5, scope: !101)
!103 = !DILocation(line: 160, column: 5, scope: !101)
!104 = !DILocation(line: 161, column: 1, scope: !101)
!105 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 172, type: !106, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DISubroutineType(types: !107)
!107 = !{!6, !6, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !15, line: 172, type: !6)
!111 = !DILocation(line: 172, column: 14, scope: !105)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !15, line: 172, type: !108)
!113 = !DILocation(line: 172, column: 27, scope: !105)
!114 = !DILocation(line: 175, column: 22, scope: !105)
!115 = !DILocation(line: 175, column: 12, scope: !105)
!116 = !DILocation(line: 175, column: 5, scope: !105)
!117 = !DILocation(line: 177, column: 5, scope: !105)
!118 = !DILocation(line: 178, column: 5, scope: !105)
!119 = !DILocation(line: 179, column: 5, scope: !105)
!120 = !DILocation(line: 182, column: 5, scope: !105)
!121 = !DILocation(line: 183, column: 5, scope: !105)
!122 = !DILocation(line: 184, column: 5, scope: !105)
!123 = !DILocation(line: 186, column: 5, scope: !105)
!124 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 75, type: !16, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !15, line: 77, type: !6)
!126 = !DILocation(line: 77, column: 9, scope: !124)
!127 = !DILocation(line: 79, column: 10, scope: !124)
!128 = !DILocation(line: 82, column: 10, scope: !124)
!129 = !DILocalVariable(name: "i", scope: !130, file: !15, line: 84, type: !6)
!130 = distinct !DILexicalBlock(scope: !124, file: !15, line: 83, column: 5)
!131 = !DILocation(line: 84, column: 13, scope: !130)
!132 = !DILocalVariable(name: "buffer", scope: !130, file: !15, line: 85, type: !5)
!133 = !DILocation(line: 85, column: 15, scope: !130)
!134 = !DILocation(line: 85, column: 31, scope: !130)
!135 = !DILocation(line: 85, column: 24, scope: !130)
!136 = !DILocation(line: 86, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !15, line: 86, column: 13)
!138 = !DILocation(line: 86, column: 20, scope: !137)
!139 = !DILocation(line: 86, column: 13, scope: !130)
!140 = !DILocation(line: 86, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !15, line: 86, column: 29)
!142 = !DILocation(line: 88, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !130, file: !15, line: 88, column: 9)
!144 = !DILocation(line: 88, column: 14, scope: !143)
!145 = !DILocation(line: 88, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !15, line: 88, column: 9)
!147 = !DILocation(line: 88, column: 23, scope: !146)
!148 = !DILocation(line: 88, column: 9, scope: !143)
!149 = !DILocation(line: 90, column: 13, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !15, line: 89, column: 9)
!151 = !DILocation(line: 90, column: 20, scope: !150)
!152 = !DILocation(line: 90, column: 23, scope: !150)
!153 = !DILocation(line: 91, column: 9, scope: !150)
!154 = !DILocation(line: 88, column: 30, scope: !146)
!155 = !DILocation(line: 88, column: 9, scope: !146)
!156 = distinct !{!156, !148, !157, !70}
!157 = !DILocation(line: 91, column: 9, scope: !143)
!158 = !DILocation(line: 94, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !130, file: !15, line: 94, column: 13)
!160 = !DILocation(line: 94, column: 18, scope: !159)
!161 = !DILocation(line: 94, column: 13, scope: !130)
!162 = !DILocation(line: 96, column: 13, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !15, line: 95, column: 9)
!164 = !DILocation(line: 96, column: 20, scope: !163)
!165 = !DILocation(line: 96, column: 26, scope: !163)
!166 = !DILocation(line: 98, column: 19, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 98, column: 13)
!168 = !DILocation(line: 98, column: 17, scope: !167)
!169 = !DILocation(line: 98, column: 24, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !15, line: 98, column: 13)
!171 = !DILocation(line: 98, column: 26, scope: !170)
!172 = !DILocation(line: 98, column: 13, scope: !167)
!173 = !DILocation(line: 100, column: 30, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !15, line: 99, column: 13)
!175 = !DILocation(line: 100, column: 37, scope: !174)
!176 = !DILocation(line: 100, column: 17, scope: !174)
!177 = !DILocation(line: 101, column: 13, scope: !174)
!178 = !DILocation(line: 98, column: 33, scope: !170)
!179 = !DILocation(line: 98, column: 13, scope: !170)
!180 = distinct !{!180, !172, !181, !70}
!181 = !DILocation(line: 101, column: 13, scope: !167)
!182 = !DILocation(line: 102, column: 9, scope: !163)
!183 = !DILocation(line: 105, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !159, file: !15, line: 104, column: 9)
!185 = !DILocation(line: 107, column: 14, scope: !130)
!186 = !DILocation(line: 107, column: 9, scope: !130)
!187 = !DILocation(line: 109, column: 1, scope: !124)
!188 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 112, type: !16, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!189 = !DILocalVariable(name: "data", scope: !188, file: !15, line: 114, type: !6)
!190 = !DILocation(line: 114, column: 9, scope: !188)
!191 = !DILocation(line: 116, column: 10, scope: !188)
!192 = !DILocalVariable(name: "inputBuffer", scope: !193, file: !15, line: 118, type: !23)
!193 = distinct !DILexicalBlock(scope: !188, file: !15, line: 117, column: 5)
!194 = !DILocation(line: 118, column: 14, scope: !193)
!195 = !DILocation(line: 120, column: 19, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !15, line: 120, column: 13)
!197 = !DILocation(line: 120, column: 49, scope: !196)
!198 = !DILocation(line: 120, column: 13, scope: !196)
!199 = !DILocation(line: 120, column: 56, scope: !196)
!200 = !DILocation(line: 120, column: 13, scope: !193)
!201 = !DILocation(line: 123, column: 25, scope: !202)
!202 = distinct !DILexicalBlock(scope: !196, file: !15, line: 121, column: 9)
!203 = !DILocation(line: 123, column: 20, scope: !202)
!204 = !DILocation(line: 123, column: 18, scope: !202)
!205 = !DILocation(line: 124, column: 9, scope: !202)
!206 = !DILocation(line: 127, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !196, file: !15, line: 126, column: 9)
!208 = !DILocalVariable(name: "i", scope: !209, file: !15, line: 131, type: !6)
!209 = distinct !DILexicalBlock(scope: !188, file: !15, line: 130, column: 5)
!210 = !DILocation(line: 131, column: 13, scope: !209)
!211 = !DILocalVariable(name: "buffer", scope: !209, file: !15, line: 132, type: !5)
!212 = !DILocation(line: 132, column: 15, scope: !209)
!213 = !DILocation(line: 132, column: 31, scope: !209)
!214 = !DILocation(line: 132, column: 24, scope: !209)
!215 = !DILocation(line: 133, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !209, file: !15, line: 133, column: 13)
!217 = !DILocation(line: 133, column: 20, scope: !216)
!218 = !DILocation(line: 133, column: 13, scope: !209)
!219 = !DILocation(line: 133, column: 30, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !15, line: 133, column: 29)
!221 = !DILocation(line: 135, column: 16, scope: !222)
!222 = distinct !DILexicalBlock(scope: !209, file: !15, line: 135, column: 9)
!223 = !DILocation(line: 135, column: 14, scope: !222)
!224 = !DILocation(line: 135, column: 21, scope: !225)
!225 = distinct !DILexicalBlock(scope: !222, file: !15, line: 135, column: 9)
!226 = !DILocation(line: 135, column: 23, scope: !225)
!227 = !DILocation(line: 135, column: 9, scope: !222)
!228 = !DILocation(line: 137, column: 13, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !15, line: 136, column: 9)
!230 = !DILocation(line: 137, column: 20, scope: !229)
!231 = !DILocation(line: 137, column: 23, scope: !229)
!232 = !DILocation(line: 138, column: 9, scope: !229)
!233 = !DILocation(line: 135, column: 30, scope: !225)
!234 = !DILocation(line: 135, column: 9, scope: !225)
!235 = distinct !{!235, !227, !236, !70}
!236 = !DILocation(line: 138, column: 9, scope: !222)
!237 = !DILocation(line: 140, column: 13, scope: !238)
!238 = distinct !DILexicalBlock(scope: !209, file: !15, line: 140, column: 13)
!239 = !DILocation(line: 140, column: 18, scope: !238)
!240 = !DILocation(line: 140, column: 23, scope: !238)
!241 = !DILocation(line: 140, column: 26, scope: !238)
!242 = !DILocation(line: 140, column: 31, scope: !238)
!243 = !DILocation(line: 140, column: 13, scope: !209)
!244 = !DILocation(line: 142, column: 13, scope: !245)
!245 = distinct !DILexicalBlock(scope: !238, file: !15, line: 141, column: 9)
!246 = !DILocation(line: 142, column: 20, scope: !245)
!247 = !DILocation(line: 142, column: 26, scope: !245)
!248 = !DILocation(line: 144, column: 19, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !15, line: 144, column: 13)
!250 = !DILocation(line: 144, column: 17, scope: !249)
!251 = !DILocation(line: 144, column: 24, scope: !252)
!252 = distinct !DILexicalBlock(scope: !249, file: !15, line: 144, column: 13)
!253 = !DILocation(line: 144, column: 26, scope: !252)
!254 = !DILocation(line: 144, column: 13, scope: !249)
!255 = !DILocation(line: 146, column: 30, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !15, line: 145, column: 13)
!257 = !DILocation(line: 146, column: 37, scope: !256)
!258 = !DILocation(line: 146, column: 17, scope: !256)
!259 = !DILocation(line: 147, column: 13, scope: !256)
!260 = !DILocation(line: 144, column: 33, scope: !252)
!261 = !DILocation(line: 144, column: 13, scope: !252)
!262 = distinct !{!262, !254, !263, !70}
!263 = !DILocation(line: 147, column: 13, scope: !249)
!264 = !DILocation(line: 148, column: 9, scope: !245)
!265 = !DILocation(line: 151, column: 13, scope: !266)
!266 = distinct !DILexicalBlock(scope: !238, file: !15, line: 150, column: 9)
!267 = !DILocation(line: 153, column: 14, scope: !209)
!268 = !DILocation(line: 153, column: 9, scope: !209)
!269 = !DILocation(line: 155, column: 1, scope: !188)
