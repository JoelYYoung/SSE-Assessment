; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data3 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !41, metadata !DIExpression()), !dbg !43
  %2 = load i32, i32* %data, align 4, !dbg !44
  store i32 %2, i32* %dataCopy, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !45, metadata !DIExpression()), !dbg !46
  %3 = load i32, i32* %dataCopy, align 4, !dbg !47
  store i32 %3, i32* %data3, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %i, metadata !48, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !51, metadata !DIExpression()), !dbg !52
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !53
  %4 = bitcast i8* %call4 to i32*, !dbg !54
  store i32* %4, i32** %buffer, align 8, !dbg !52
  %5 = load i32*, i32** %buffer, align 8, !dbg !55
  %cmp5 = icmp eq i32* %5, null, !dbg !57
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !58

if.then6:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !59
  unreachable, !dbg !59

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load i32, i32* %i, align 4, !dbg !64
  %cmp8 = icmp slt i32 %6, 10, !dbg !66
  br i1 %cmp8, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !68
  %8 = load i32, i32* %i, align 4, !dbg !70
  %idxprom = sext i32 %8 to i64, !dbg !68
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !68
  store i32 0, i32* %arrayidx, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !73
  %inc = add nsw i32 %9, 1, !dbg !73
  store i32 %inc, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data3, align 4, !dbg !78
  %cmp9 = icmp sge i32 %10, 0, !dbg !80
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !81

if.then10:                                        ; preds = %for.end
  %11 = load i32*, i32** %buffer, align 8, !dbg !82
  %12 = load i32, i32* %data3, align 4, !dbg !84
  %idxprom11 = sext i32 %12 to i64, !dbg !82
  %arrayidx12 = getelementptr inbounds i32, i32* %11, i64 %idxprom11, !dbg !82
  store i32 1, i32* %arrayidx12, align 4, !dbg !85
  store i32 0, i32* %i, align 4, !dbg !86
  br label %for.cond13, !dbg !88

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %13 = load i32, i32* %i, align 4, !dbg !89
  %cmp14 = icmp slt i32 %13, 10, !dbg !91
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !92

for.body15:                                       ; preds = %for.cond13
  %14 = load i32*, i32** %buffer, align 8, !dbg !93
  %15 = load i32, i32* %i, align 4, !dbg !95
  %idxprom16 = sext i32 %15 to i64, !dbg !93
  %arrayidx17 = getelementptr inbounds i32, i32* %14, i64 %idxprom16, !dbg !93
  %16 = load i32, i32* %arrayidx17, align 4, !dbg !93
  call void @printIntLine(i32 %16), !dbg !96
  br label %for.inc18, !dbg !97

for.inc18:                                        ; preds = %for.body15
  %17 = load i32, i32* %i, align 4, !dbg !98
  %inc19 = add nsw i32 %17, 1, !dbg !98
  store i32 %inc19, i32* %i, align 4, !dbg !98
  br label %for.cond13, !dbg !99, !llvm.loop !100

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !102

if.else21:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %18 = load i32*, i32** %buffer, align 8, !dbg !105
  %19 = bitcast i32* %18 to i8*, !dbg !105
  call void @free(i8* %19) #8, !dbg !106
  ret void, !dbg !107
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_good() #0 !dbg !108 {
entry:
  call void @goodG2B(), !dbg !109
  call void @goodB2G(), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %call = call i64 @time(i64* null) #8, !dbg !121
  %conv = trunc i64 %call to i32, !dbg !122
  call void @srand(i32 %conv) #8, !dbg !123
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !124
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_good(), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !127
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_bad(), !dbg !128
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !129
  ret i32 0, !dbg !130
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !131 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 -1, i32* %data, align 4, !dbg !134
  store i32 7, i32* %data, align 4, !dbg !135
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !136, metadata !DIExpression()), !dbg !138
  %0 = load i32, i32* %data, align 4, !dbg !139
  store i32 %0, i32* %dataCopy, align 4, !dbg !138
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !140, metadata !DIExpression()), !dbg !141
  %1 = load i32, i32* %dataCopy, align 4, !dbg !142
  store i32 %1, i32* %data1, align 4, !dbg !141
  call void @llvm.dbg.declare(metadata i32* %i, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !146, metadata !DIExpression()), !dbg !147
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !148
  %2 = bitcast i8* %call to i32*, !dbg !149
  store i32* %2, i32** %buffer, align 8, !dbg !147
  %3 = load i32*, i32** %buffer, align 8, !dbg !150
  %cmp = icmp eq i32* %3, null, !dbg !152
  br i1 %cmp, label %if.then, label %if.end, !dbg !153

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !154
  unreachable, !dbg !154

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !159
  %cmp2 = icmp slt i32 %4, 10, !dbg !161
  br i1 %cmp2, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !163
  %6 = load i32, i32* %i, align 4, !dbg !165
  %idxprom = sext i32 %6 to i64, !dbg !163
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !163
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !168
  %inc = add nsw i32 %7, 1, !dbg !168
  store i32 %inc, i32* %i, align 4, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !172
  %cmp3 = icmp sge i32 %8, 0, !dbg !174
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !175

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !176
  %10 = load i32, i32* %data1, align 4, !dbg !178
  %idxprom5 = sext i32 %10 to i64, !dbg !176
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !176
  store i32 1, i32* %arrayidx6, align 4, !dbg !179
  store i32 0, i32* %i, align 4, !dbg !180
  br label %for.cond7, !dbg !182

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !183
  %cmp8 = icmp slt i32 %11, 10, !dbg !185
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !186

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !187
  %13 = load i32, i32* %i, align 4, !dbg !189
  %idxprom10 = sext i32 %13 to i64, !dbg !187
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !187
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !187
  call void @printIntLine(i32 %14), !dbg !190
  br label %for.inc12, !dbg !191

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !192
  %inc13 = add nsw i32 %15, 1, !dbg !192
  store i32 %inc13, i32* %i, align 4, !dbg !192
  br label %for.cond7, !dbg !193, !llvm.loop !194

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !196

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !197
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !199
  %17 = bitcast i32* %16 to i8*, !dbg !199
  call void @free(i8* %17) #8, !dbg !200
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !202 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !203, metadata !DIExpression()), !dbg !204
  store i32 -1, i32* %data, align 4, !dbg !205
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !206, metadata !DIExpression()), !dbg !208
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !208
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !208
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !209
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !211
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !212
  %cmp = icmp ne i8* %call, null, !dbg !213
  br i1 %cmp, label %if.then, label %if.else, !dbg !214

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !215
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !217
  store i32 %call2, i32* %data, align 4, !dbg !218
  br label %if.end, !dbg !219

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !220
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !222, metadata !DIExpression()), !dbg !224
  %2 = load i32, i32* %data, align 4, !dbg !225
  store i32 %2, i32* %dataCopy, align 4, !dbg !224
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !226, metadata !DIExpression()), !dbg !227
  %3 = load i32, i32* %dataCopy, align 4, !dbg !228
  store i32 %3, i32* %data3, align 4, !dbg !227
  call void @llvm.dbg.declare(metadata i32* %i, metadata !229, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !232, metadata !DIExpression()), !dbg !233
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !234
  %4 = bitcast i8* %call4 to i32*, !dbg !235
  store i32* %4, i32** %buffer, align 8, !dbg !233
  %5 = load i32*, i32** %buffer, align 8, !dbg !236
  %cmp5 = icmp eq i32* %5, null, !dbg !238
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !239

if.then6:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !240
  unreachable, !dbg !240

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !242
  br label %for.cond, !dbg !244

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load i32, i32* %i, align 4, !dbg !245
  %cmp8 = icmp slt i32 %6, 10, !dbg !247
  br i1 %cmp8, label %for.body, label %for.end, !dbg !248

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !249
  %8 = load i32, i32* %i, align 4, !dbg !251
  %idxprom = sext i32 %8 to i64, !dbg !249
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !249
  store i32 0, i32* %arrayidx, align 4, !dbg !252
  br label %for.inc, !dbg !253

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !254
  %inc = add nsw i32 %9, 1, !dbg !254
  store i32 %inc, i32* %i, align 4, !dbg !254
  br label %for.cond, !dbg !255, !llvm.loop !256

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data3, align 4, !dbg !258
  %cmp9 = icmp sge i32 %10, 0, !dbg !260
  br i1 %cmp9, label %land.lhs.true, label %if.else22, !dbg !261

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data3, align 4, !dbg !262
  %cmp10 = icmp slt i32 %11, 10, !dbg !263
  br i1 %cmp10, label %if.then11, label %if.else22, !dbg !264

if.then11:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !265
  %13 = load i32, i32* %data3, align 4, !dbg !267
  %idxprom12 = sext i32 %13 to i64, !dbg !265
  %arrayidx13 = getelementptr inbounds i32, i32* %12, i64 %idxprom12, !dbg !265
  store i32 1, i32* %arrayidx13, align 4, !dbg !268
  store i32 0, i32* %i, align 4, !dbg !269
  br label %for.cond14, !dbg !271

for.cond14:                                       ; preds = %for.inc19, %if.then11
  %14 = load i32, i32* %i, align 4, !dbg !272
  %cmp15 = icmp slt i32 %14, 10, !dbg !274
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !275

for.body16:                                       ; preds = %for.cond14
  %15 = load i32*, i32** %buffer, align 8, !dbg !276
  %16 = load i32, i32* %i, align 4, !dbg !278
  %idxprom17 = sext i32 %16 to i64, !dbg !276
  %arrayidx18 = getelementptr inbounds i32, i32* %15, i64 %idxprom17, !dbg !276
  %17 = load i32, i32* %arrayidx18, align 4, !dbg !276
  call void @printIntLine(i32 %17), !dbg !279
  br label %for.inc19, !dbg !280

for.inc19:                                        ; preds = %for.body16
  %18 = load i32, i32* %i, align 4, !dbg !281
  %inc20 = add nsw i32 %18, 1, !dbg !281
  store i32 %inc20, i32* %i, align 4, !dbg !281
  br label %for.cond14, !dbg !282, !llvm.loop !283

for.end21:                                        ; preds = %for.cond14
  br label %if.end23, !dbg !285

if.else22:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !286
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end21
  %19 = load i32*, i32** %buffer, align 8, !dbg !288
  %20 = bitcast i32* %19 to i8*, !dbg !288
  call void @free(i8* %20) #8, !dbg !289
  ret void, !dbg !290
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31.c", directory: "/root/SSE-Assessment")
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
!41 = !DILocalVariable(name: "dataCopy", scope: !42, file: !15, line: 43, type: !6)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 5)
!43 = !DILocation(line: 43, column: 13, scope: !42)
!44 = !DILocation(line: 43, column: 24, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !15, line: 44, type: !6)
!46 = !DILocation(line: 44, column: 13, scope: !42)
!47 = !DILocation(line: 44, column: 20, scope: !42)
!48 = !DILocalVariable(name: "i", scope: !49, file: !15, line: 46, type: !6)
!49 = distinct !DILexicalBlock(scope: !42, file: !15, line: 45, column: 9)
!50 = !DILocation(line: 46, column: 17, scope: !49)
!51 = !DILocalVariable(name: "buffer", scope: !49, file: !15, line: 47, type: !5)
!52 = !DILocation(line: 47, column: 19, scope: !49)
!53 = !DILocation(line: 47, column: 35, scope: !49)
!54 = !DILocation(line: 47, column: 28, scope: !49)
!55 = !DILocation(line: 48, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !49, file: !15, line: 48, column: 17)
!57 = !DILocation(line: 48, column: 24, scope: !56)
!58 = !DILocation(line: 48, column: 17, scope: !49)
!59 = !DILocation(line: 48, column: 34, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !15, line: 48, column: 33)
!61 = !DILocation(line: 50, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !49, file: !15, line: 50, column: 13)
!63 = !DILocation(line: 50, column: 18, scope: !62)
!64 = !DILocation(line: 50, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !15, line: 50, column: 13)
!66 = !DILocation(line: 50, column: 27, scope: !65)
!67 = !DILocation(line: 50, column: 13, scope: !62)
!68 = !DILocation(line: 52, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 51, column: 13)
!70 = !DILocation(line: 52, column: 24, scope: !69)
!71 = !DILocation(line: 52, column: 27, scope: !69)
!72 = !DILocation(line: 53, column: 13, scope: !69)
!73 = !DILocation(line: 50, column: 34, scope: !65)
!74 = !DILocation(line: 50, column: 13, scope: !65)
!75 = distinct !{!75, !67, !76, !77}
!76 = !DILocation(line: 53, column: 13, scope: !62)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 56, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !49, file: !15, line: 56, column: 17)
!80 = !DILocation(line: 56, column: 22, scope: !79)
!81 = !DILocation(line: 56, column: 17, scope: !49)
!82 = !DILocation(line: 58, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 57, column: 13)
!84 = !DILocation(line: 58, column: 24, scope: !83)
!85 = !DILocation(line: 58, column: 30, scope: !83)
!86 = !DILocation(line: 60, column: 23, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 60, column: 17)
!88 = !DILocation(line: 60, column: 21, scope: !87)
!89 = !DILocation(line: 60, column: 28, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 60, column: 17)
!91 = !DILocation(line: 60, column: 30, scope: !90)
!92 = !DILocation(line: 60, column: 17, scope: !87)
!93 = !DILocation(line: 62, column: 34, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 61, column: 17)
!95 = !DILocation(line: 62, column: 41, scope: !94)
!96 = !DILocation(line: 62, column: 21, scope: !94)
!97 = !DILocation(line: 63, column: 17, scope: !94)
!98 = !DILocation(line: 60, column: 37, scope: !90)
!99 = !DILocation(line: 60, column: 17, scope: !90)
!100 = distinct !{!100, !92, !101, !77}
!101 = !DILocation(line: 63, column: 17, scope: !87)
!102 = !DILocation(line: 64, column: 13, scope: !83)
!103 = !DILocation(line: 67, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !79, file: !15, line: 66, column: 13)
!105 = !DILocation(line: 69, column: 18, scope: !49)
!106 = !DILocation(line: 69, column: 13, scope: !49)
!107 = !DILocation(line: 72, column: 1, scope: !14)
!108 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_good", scope: !15, file: !15, line: 169, type: !16, scopeLine: 170, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocation(line: 171, column: 5, scope: !108)
!110 = !DILocation(line: 172, column: 5, scope: !108)
!111 = !DILocation(line: 173, column: 1, scope: !108)
!112 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 183, type: !113, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!6, !6, !115}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!117 = !DILocalVariable(name: "argc", arg: 1, scope: !112, file: !15, line: 183, type: !6)
!118 = !DILocation(line: 183, column: 14, scope: !112)
!119 = !DILocalVariable(name: "argv", arg: 2, scope: !112, file: !15, line: 183, type: !115)
!120 = !DILocation(line: 183, column: 27, scope: !112)
!121 = !DILocation(line: 186, column: 22, scope: !112)
!122 = !DILocation(line: 186, column: 12, scope: !112)
!123 = !DILocation(line: 186, column: 5, scope: !112)
!124 = !DILocation(line: 188, column: 5, scope: !112)
!125 = !DILocation(line: 189, column: 5, scope: !112)
!126 = !DILocation(line: 190, column: 5, scope: !112)
!127 = !DILocation(line: 193, column: 5, scope: !112)
!128 = !DILocation(line: 194, column: 5, scope: !112)
!129 = !DILocation(line: 195, column: 5, scope: !112)
!130 = !DILocation(line: 197, column: 5, scope: !112)
!131 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 79, type: !16, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocalVariable(name: "data", scope: !131, file: !15, line: 81, type: !6)
!133 = !DILocation(line: 81, column: 9, scope: !131)
!134 = !DILocation(line: 83, column: 10, scope: !131)
!135 = !DILocation(line: 86, column: 10, scope: !131)
!136 = !DILocalVariable(name: "dataCopy", scope: !137, file: !15, line: 88, type: !6)
!137 = distinct !DILexicalBlock(scope: !131, file: !15, line: 87, column: 5)
!138 = !DILocation(line: 88, column: 13, scope: !137)
!139 = !DILocation(line: 88, column: 24, scope: !137)
!140 = !DILocalVariable(name: "data", scope: !137, file: !15, line: 89, type: !6)
!141 = !DILocation(line: 89, column: 13, scope: !137)
!142 = !DILocation(line: 89, column: 20, scope: !137)
!143 = !DILocalVariable(name: "i", scope: !144, file: !15, line: 91, type: !6)
!144 = distinct !DILexicalBlock(scope: !137, file: !15, line: 90, column: 9)
!145 = !DILocation(line: 91, column: 17, scope: !144)
!146 = !DILocalVariable(name: "buffer", scope: !144, file: !15, line: 92, type: !5)
!147 = !DILocation(line: 92, column: 19, scope: !144)
!148 = !DILocation(line: 92, column: 35, scope: !144)
!149 = !DILocation(line: 92, column: 28, scope: !144)
!150 = !DILocation(line: 93, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !15, line: 93, column: 17)
!152 = !DILocation(line: 93, column: 24, scope: !151)
!153 = !DILocation(line: 93, column: 17, scope: !144)
!154 = !DILocation(line: 93, column: 34, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !15, line: 93, column: 33)
!156 = !DILocation(line: 95, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !144, file: !15, line: 95, column: 13)
!158 = !DILocation(line: 95, column: 18, scope: !157)
!159 = !DILocation(line: 95, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !15, line: 95, column: 13)
!161 = !DILocation(line: 95, column: 27, scope: !160)
!162 = !DILocation(line: 95, column: 13, scope: !157)
!163 = !DILocation(line: 97, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 96, column: 13)
!165 = !DILocation(line: 97, column: 24, scope: !164)
!166 = !DILocation(line: 97, column: 27, scope: !164)
!167 = !DILocation(line: 98, column: 13, scope: !164)
!168 = !DILocation(line: 95, column: 34, scope: !160)
!169 = !DILocation(line: 95, column: 13, scope: !160)
!170 = distinct !{!170, !162, !171, !77}
!171 = !DILocation(line: 98, column: 13, scope: !157)
!172 = !DILocation(line: 101, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !144, file: !15, line: 101, column: 17)
!174 = !DILocation(line: 101, column: 22, scope: !173)
!175 = !DILocation(line: 101, column: 17, scope: !144)
!176 = !DILocation(line: 103, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 102, column: 13)
!178 = !DILocation(line: 103, column: 24, scope: !177)
!179 = !DILocation(line: 103, column: 30, scope: !177)
!180 = !DILocation(line: 105, column: 23, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !15, line: 105, column: 17)
!182 = !DILocation(line: 105, column: 21, scope: !181)
!183 = !DILocation(line: 105, column: 28, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !15, line: 105, column: 17)
!185 = !DILocation(line: 105, column: 30, scope: !184)
!186 = !DILocation(line: 105, column: 17, scope: !181)
!187 = !DILocation(line: 107, column: 34, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !15, line: 106, column: 17)
!189 = !DILocation(line: 107, column: 41, scope: !188)
!190 = !DILocation(line: 107, column: 21, scope: !188)
!191 = !DILocation(line: 108, column: 17, scope: !188)
!192 = !DILocation(line: 105, column: 37, scope: !184)
!193 = !DILocation(line: 105, column: 17, scope: !184)
!194 = distinct !{!194, !186, !195, !77}
!195 = !DILocation(line: 108, column: 17, scope: !181)
!196 = !DILocation(line: 109, column: 13, scope: !177)
!197 = !DILocation(line: 112, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !173, file: !15, line: 111, column: 13)
!199 = !DILocation(line: 114, column: 18, scope: !144)
!200 = !DILocation(line: 114, column: 13, scope: !144)
!201 = !DILocation(line: 117, column: 1, scope: !131)
!202 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 120, type: !16, scopeLine: 121, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!203 = !DILocalVariable(name: "data", scope: !202, file: !15, line: 122, type: !6)
!204 = !DILocation(line: 122, column: 9, scope: !202)
!205 = !DILocation(line: 124, column: 10, scope: !202)
!206 = !DILocalVariable(name: "inputBuffer", scope: !207, file: !15, line: 126, type: !23)
!207 = distinct !DILexicalBlock(scope: !202, file: !15, line: 125, column: 5)
!208 = !DILocation(line: 126, column: 14, scope: !207)
!209 = !DILocation(line: 128, column: 19, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !15, line: 128, column: 13)
!211 = !DILocation(line: 128, column: 49, scope: !210)
!212 = !DILocation(line: 128, column: 13, scope: !210)
!213 = !DILocation(line: 128, column: 56, scope: !210)
!214 = !DILocation(line: 128, column: 13, scope: !207)
!215 = !DILocation(line: 131, column: 25, scope: !216)
!216 = distinct !DILexicalBlock(scope: !210, file: !15, line: 129, column: 9)
!217 = !DILocation(line: 131, column: 20, scope: !216)
!218 = !DILocation(line: 131, column: 18, scope: !216)
!219 = !DILocation(line: 132, column: 9, scope: !216)
!220 = !DILocation(line: 135, column: 13, scope: !221)
!221 = distinct !DILexicalBlock(scope: !210, file: !15, line: 134, column: 9)
!222 = !DILocalVariable(name: "dataCopy", scope: !223, file: !15, line: 139, type: !6)
!223 = distinct !DILexicalBlock(scope: !202, file: !15, line: 138, column: 5)
!224 = !DILocation(line: 139, column: 13, scope: !223)
!225 = !DILocation(line: 139, column: 24, scope: !223)
!226 = !DILocalVariable(name: "data", scope: !223, file: !15, line: 140, type: !6)
!227 = !DILocation(line: 140, column: 13, scope: !223)
!228 = !DILocation(line: 140, column: 20, scope: !223)
!229 = !DILocalVariable(name: "i", scope: !230, file: !15, line: 142, type: !6)
!230 = distinct !DILexicalBlock(scope: !223, file: !15, line: 141, column: 9)
!231 = !DILocation(line: 142, column: 17, scope: !230)
!232 = !DILocalVariable(name: "buffer", scope: !230, file: !15, line: 143, type: !5)
!233 = !DILocation(line: 143, column: 19, scope: !230)
!234 = !DILocation(line: 143, column: 35, scope: !230)
!235 = !DILocation(line: 143, column: 28, scope: !230)
!236 = !DILocation(line: 144, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !230, file: !15, line: 144, column: 17)
!238 = !DILocation(line: 144, column: 24, scope: !237)
!239 = !DILocation(line: 144, column: 17, scope: !230)
!240 = !DILocation(line: 144, column: 34, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !15, line: 144, column: 33)
!242 = !DILocation(line: 146, column: 20, scope: !243)
!243 = distinct !DILexicalBlock(scope: !230, file: !15, line: 146, column: 13)
!244 = !DILocation(line: 146, column: 18, scope: !243)
!245 = !DILocation(line: 146, column: 25, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !15, line: 146, column: 13)
!247 = !DILocation(line: 146, column: 27, scope: !246)
!248 = !DILocation(line: 146, column: 13, scope: !243)
!249 = !DILocation(line: 148, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !15, line: 147, column: 13)
!251 = !DILocation(line: 148, column: 24, scope: !250)
!252 = !DILocation(line: 148, column: 27, scope: !250)
!253 = !DILocation(line: 149, column: 13, scope: !250)
!254 = !DILocation(line: 146, column: 34, scope: !246)
!255 = !DILocation(line: 146, column: 13, scope: !246)
!256 = distinct !{!256, !248, !257, !77}
!257 = !DILocation(line: 149, column: 13, scope: !243)
!258 = !DILocation(line: 151, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !230, file: !15, line: 151, column: 17)
!260 = !DILocation(line: 151, column: 22, scope: !259)
!261 = !DILocation(line: 151, column: 27, scope: !259)
!262 = !DILocation(line: 151, column: 30, scope: !259)
!263 = !DILocation(line: 151, column: 35, scope: !259)
!264 = !DILocation(line: 151, column: 17, scope: !230)
!265 = !DILocation(line: 153, column: 17, scope: !266)
!266 = distinct !DILexicalBlock(scope: !259, file: !15, line: 152, column: 13)
!267 = !DILocation(line: 153, column: 24, scope: !266)
!268 = !DILocation(line: 153, column: 30, scope: !266)
!269 = !DILocation(line: 155, column: 23, scope: !270)
!270 = distinct !DILexicalBlock(scope: !266, file: !15, line: 155, column: 17)
!271 = !DILocation(line: 155, column: 21, scope: !270)
!272 = !DILocation(line: 155, column: 28, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !15, line: 155, column: 17)
!274 = !DILocation(line: 155, column: 30, scope: !273)
!275 = !DILocation(line: 155, column: 17, scope: !270)
!276 = !DILocation(line: 157, column: 34, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !15, line: 156, column: 17)
!278 = !DILocation(line: 157, column: 41, scope: !277)
!279 = !DILocation(line: 157, column: 21, scope: !277)
!280 = !DILocation(line: 158, column: 17, scope: !277)
!281 = !DILocation(line: 155, column: 37, scope: !273)
!282 = !DILocation(line: 155, column: 17, scope: !273)
!283 = distinct !{!283, !275, !284, !77}
!284 = !DILocation(line: 158, column: 17, scope: !270)
!285 = !DILocation(line: 159, column: 13, scope: !266)
!286 = !DILocation(line: 162, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !259, file: !15, line: 161, column: 13)
!288 = !DILocation(line: 164, column: 18, scope: !230)
!289 = !DILocation(line: 164, column: 13, scope: !230)
!290 = !DILocation(line: 167, column: 1, scope: !202)
