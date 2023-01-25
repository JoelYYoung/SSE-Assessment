; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data4 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* %data, i32** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* %data, i32** %dataPtr2, align 8, !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !25, metadata !DIExpression()), !dbg !27
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !28
  %1 = load i32, i32* %0, align 4, !dbg !29
  store i32 %1, i32* %data1, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  %2 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !39
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %3), !dbg !40
  %cmp = icmp ne i8* %call, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !43
  %call3 = call i32 @atoi(i8* %arraydecay2) #7, !dbg !45
  store i32 %call3, i32* %data1, align 4, !dbg !46
  br label %if.end, !dbg !47

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !48
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %data1, align 4, !dbg !50
  %5 = load i32*, i32** %dataPtr1, align 8, !dbg !51
  store i32 %4, i32* %5, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %data4, metadata !53, metadata !DIExpression()), !dbg !55
  %6 = load i32*, i32** %dataPtr2, align 8, !dbg !56
  %7 = load i32, i32* %6, align 4, !dbg !57
  store i32 %7, i32* %data4, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %i, metadata !58, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !61, metadata !DIExpression()), !dbg !62
  %call5 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !63
  %8 = bitcast i8* %call5 to i32*, !dbg !64
  store i32* %8, i32** %buffer, align 8, !dbg !62
  %9 = load i32*, i32** %buffer, align 8, !dbg !65
  %cmp6 = icmp eq i32* %9, null, !dbg !67
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !68

if.then7:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !69
  unreachable, !dbg !69

if.end8:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %if.end8
  %10 = load i32, i32* %i, align 4, !dbg !74
  %cmp9 = icmp slt i32 %10, 10, !dbg !76
  br i1 %cmp9, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %buffer, align 8, !dbg !78
  %12 = load i32, i32* %i, align 4, !dbg !80
  %idxprom = sext i32 %12 to i64, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 %idxprom, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4, !dbg !83
  %inc = add nsw i32 %13, 1, !dbg !83
  store i32 %inc, i32* %i, align 4, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %14 = load i32, i32* %data4, align 4, !dbg !88
  %cmp10 = icmp sge i32 %14, 0, !dbg !90
  br i1 %cmp10, label %if.then11, label %if.else22, !dbg !91

if.then11:                                        ; preds = %for.end
  %15 = load i32*, i32** %buffer, align 8, !dbg !92
  %16 = load i32, i32* %data4, align 4, !dbg !94
  %idxprom12 = sext i32 %16 to i64, !dbg !92
  %arrayidx13 = getelementptr inbounds i32, i32* %15, i64 %idxprom12, !dbg !92
  store i32 1, i32* %arrayidx13, align 4, !dbg !95
  store i32 0, i32* %i, align 4, !dbg !96
  br label %for.cond14, !dbg !98

for.cond14:                                       ; preds = %for.inc19, %if.then11
  %17 = load i32, i32* %i, align 4, !dbg !99
  %cmp15 = icmp slt i32 %17, 10, !dbg !101
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !102

for.body16:                                       ; preds = %for.cond14
  %18 = load i32*, i32** %buffer, align 8, !dbg !103
  %19 = load i32, i32* %i, align 4, !dbg !105
  %idxprom17 = sext i32 %19 to i64, !dbg !103
  %arrayidx18 = getelementptr inbounds i32, i32* %18, i64 %idxprom17, !dbg !103
  %20 = load i32, i32* %arrayidx18, align 4, !dbg !103
  call void @printIntLine(i32 %20), !dbg !106
  br label %for.inc19, !dbg !107

for.inc19:                                        ; preds = %for.body16
  %21 = load i32, i32* %i, align 4, !dbg !108
  %inc20 = add nsw i32 %21, 1, !dbg !108
  store i32 %inc20, i32* %i, align 4, !dbg !108
  br label %for.cond14, !dbg !109, !llvm.loop !110

for.end21:                                        ; preds = %for.cond14
  br label %if.end23, !dbg !112

if.else22:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end21
  %22 = load i32*, i32** %buffer, align 8, !dbg !115
  %23 = bitcast i32* %22 to i8*, !dbg !115
  call void @free(i8* %23) #8, !dbg !116
  ret void, !dbg !117
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32_good() #0 !dbg !118 {
entry:
  call void @goodG2B(), !dbg !119
  call void @goodB2G(), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !127, metadata !DIExpression()), !dbg !128
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !129, metadata !DIExpression()), !dbg !130
  %call = call i64 @time(i64* null) #8, !dbg !131
  %conv = trunc i64 %call to i32, !dbg !132
  call void @srand(i32 %conv) #8, !dbg !133
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !134
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32_good(), !dbg !135
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !136
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !137
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32_bad(), !dbg !138
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !139
  ret i32 0, !dbg !140
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !141 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !144, metadata !DIExpression()), !dbg !145
  store i32* %data, i32** %dataPtr1, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !146, metadata !DIExpression()), !dbg !147
  store i32* %data, i32** %dataPtr2, align 8, !dbg !147
  store i32 -1, i32* %data, align 4, !dbg !148
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !149, metadata !DIExpression()), !dbg !151
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !152
  %1 = load i32, i32* %0, align 4, !dbg !153
  store i32 %1, i32* %data1, align 4, !dbg !151
  store i32 7, i32* %data1, align 4, !dbg !154
  %2 = load i32, i32* %data1, align 4, !dbg !155
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !156
  store i32 %2, i32* %3, align 4, !dbg !157
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !158, metadata !DIExpression()), !dbg !160
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !161
  %5 = load i32, i32* %4, align 4, !dbg !162
  store i32 %5, i32* %data2, align 4, !dbg !160
  call void @llvm.dbg.declare(metadata i32* %i, metadata !163, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !166, metadata !DIExpression()), !dbg !167
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !168
  %6 = bitcast i8* %call to i32*, !dbg !169
  store i32* %6, i32** %buffer, align 8, !dbg !167
  %7 = load i32*, i32** %buffer, align 8, !dbg !170
  %cmp = icmp eq i32* %7, null, !dbg !172
  br i1 %cmp, label %if.then, label %if.end, !dbg !173

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !174
  unreachable, !dbg !174

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !179
  %cmp3 = icmp slt i32 %8, 10, !dbg !181
  br i1 %cmp3, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %buffer, align 8, !dbg !183
  %10 = load i32, i32* %i, align 4, !dbg !185
  %idxprom = sext i32 %10 to i64, !dbg !183
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !183
  store i32 0, i32* %arrayidx, align 4, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !188
  %inc = add nsw i32 %11, 1, !dbg !188
  store i32 %inc, i32* %i, align 4, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %data2, align 4, !dbg !192
  %cmp4 = icmp sge i32 %12, 0, !dbg !194
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !195

if.then5:                                         ; preds = %for.end
  %13 = load i32*, i32** %buffer, align 8, !dbg !196
  %14 = load i32, i32* %data2, align 4, !dbg !198
  %idxprom6 = sext i32 %14 to i64, !dbg !196
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 %idxprom6, !dbg !196
  store i32 1, i32* %arrayidx7, align 4, !dbg !199
  store i32 0, i32* %i, align 4, !dbg !200
  br label %for.cond8, !dbg !202

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %15 = load i32, i32* %i, align 4, !dbg !203
  %cmp9 = icmp slt i32 %15, 10, !dbg !205
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !206

for.body10:                                       ; preds = %for.cond8
  %16 = load i32*, i32** %buffer, align 8, !dbg !207
  %17 = load i32, i32* %i, align 4, !dbg !209
  %idxprom11 = sext i32 %17 to i64, !dbg !207
  %arrayidx12 = getelementptr inbounds i32, i32* %16, i64 %idxprom11, !dbg !207
  %18 = load i32, i32* %arrayidx12, align 4, !dbg !207
  call void @printIntLine(i32 %18), !dbg !210
  br label %for.inc13, !dbg !211

for.inc13:                                        ; preds = %for.body10
  %19 = load i32, i32* %i, align 4, !dbg !212
  %inc14 = add nsw i32 %19, 1, !dbg !212
  store i32 %inc14, i32* %i, align 4, !dbg !212
  br label %for.cond8, !dbg !213, !llvm.loop !214

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !216

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !217
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %20 = load i32*, i32** %buffer, align 8, !dbg !219
  %21 = bitcast i32* %20 to i8*, !dbg !219
  call void @free(i8* %21) #8, !dbg !220
  ret void, !dbg !221
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !222 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data4 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !223, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !225, metadata !DIExpression()), !dbg !226
  store i32* %data, i32** %dataPtr1, align 8, !dbg !226
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !227, metadata !DIExpression()), !dbg !228
  store i32* %data, i32** %dataPtr2, align 8, !dbg !228
  store i32 -1, i32* %data, align 4, !dbg !229
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !230, metadata !DIExpression()), !dbg !232
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !233
  %1 = load i32, i32* %0, align 4, !dbg !234
  store i32 %1, i32* %data1, align 4, !dbg !232
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !235, metadata !DIExpression()), !dbg !237
  %2 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !237
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !237
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !238
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !240
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %3), !dbg !241
  %cmp = icmp ne i8* %call, null, !dbg !242
  br i1 %cmp, label %if.then, label %if.else, !dbg !243

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !244
  %call3 = call i32 @atoi(i8* %arraydecay2) #7, !dbg !246
  store i32 %call3, i32* %data1, align 4, !dbg !247
  br label %if.end, !dbg !248

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !249
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %data1, align 4, !dbg !251
  %5 = load i32*, i32** %dataPtr1, align 8, !dbg !252
  store i32 %4, i32* %5, align 4, !dbg !253
  call void @llvm.dbg.declare(metadata i32* %data4, metadata !254, metadata !DIExpression()), !dbg !256
  %6 = load i32*, i32** %dataPtr2, align 8, !dbg !257
  %7 = load i32, i32* %6, align 4, !dbg !258
  store i32 %7, i32* %data4, align 4, !dbg !256
  call void @llvm.dbg.declare(metadata i32* %i, metadata !259, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !262, metadata !DIExpression()), !dbg !263
  %call5 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !264
  %8 = bitcast i8* %call5 to i32*, !dbg !265
  store i32* %8, i32** %buffer, align 8, !dbg !263
  %9 = load i32*, i32** %buffer, align 8, !dbg !266
  %cmp6 = icmp eq i32* %9, null, !dbg !268
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !269

if.then7:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !270
  unreachable, !dbg !270

if.end8:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !272
  br label %for.cond, !dbg !274

for.cond:                                         ; preds = %for.inc, %if.end8
  %10 = load i32, i32* %i, align 4, !dbg !275
  %cmp9 = icmp slt i32 %10, 10, !dbg !277
  br i1 %cmp9, label %for.body, label %for.end, !dbg !278

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %buffer, align 8, !dbg !279
  %12 = load i32, i32* %i, align 4, !dbg !281
  %idxprom = sext i32 %12 to i64, !dbg !279
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 %idxprom, !dbg !279
  store i32 0, i32* %arrayidx, align 4, !dbg !282
  br label %for.inc, !dbg !283

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4, !dbg !284
  %inc = add nsw i32 %13, 1, !dbg !284
  store i32 %inc, i32* %i, align 4, !dbg !284
  br label %for.cond, !dbg !285, !llvm.loop !286

for.end:                                          ; preds = %for.cond
  %14 = load i32, i32* %data4, align 4, !dbg !288
  %cmp10 = icmp sge i32 %14, 0, !dbg !290
  br i1 %cmp10, label %land.lhs.true, label %if.else23, !dbg !291

land.lhs.true:                                    ; preds = %for.end
  %15 = load i32, i32* %data4, align 4, !dbg !292
  %cmp11 = icmp slt i32 %15, 10, !dbg !293
  br i1 %cmp11, label %if.then12, label %if.else23, !dbg !294

if.then12:                                        ; preds = %land.lhs.true
  %16 = load i32*, i32** %buffer, align 8, !dbg !295
  %17 = load i32, i32* %data4, align 4, !dbg !297
  %idxprom13 = sext i32 %17 to i64, !dbg !295
  %arrayidx14 = getelementptr inbounds i32, i32* %16, i64 %idxprom13, !dbg !295
  store i32 1, i32* %arrayidx14, align 4, !dbg !298
  store i32 0, i32* %i, align 4, !dbg !299
  br label %for.cond15, !dbg !301

for.cond15:                                       ; preds = %for.inc20, %if.then12
  %18 = load i32, i32* %i, align 4, !dbg !302
  %cmp16 = icmp slt i32 %18, 10, !dbg !304
  br i1 %cmp16, label %for.body17, label %for.end22, !dbg !305

for.body17:                                       ; preds = %for.cond15
  %19 = load i32*, i32** %buffer, align 8, !dbg !306
  %20 = load i32, i32* %i, align 4, !dbg !308
  %idxprom18 = sext i32 %20 to i64, !dbg !306
  %arrayidx19 = getelementptr inbounds i32, i32* %19, i64 %idxprom18, !dbg !306
  %21 = load i32, i32* %arrayidx19, align 4, !dbg !306
  call void @printIntLine(i32 %21), !dbg !309
  br label %for.inc20, !dbg !310

for.inc20:                                        ; preds = %for.body17
  %22 = load i32, i32* %i, align 4, !dbg !311
  %inc21 = add nsw i32 %22, 1, !dbg !311
  store i32 %inc21, i32* %i, align 4, !dbg !311
  br label %for.cond15, !dbg !312, !llvm.loop !313

for.end22:                                        ; preds = %for.cond15
  br label %if.end24, !dbg !315

if.else23:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !316
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %for.end22
  %23 = load i32*, i32** %buffer, align 8, !dbg !318
  %24 = bitcast i32* %23 to i8*, !dbg !318
  call void @free(i8* %24) #8, !dbg !319
  ret void, !dbg !320
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !6)
!19 = !DILocation(line: 26, column: 9, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 27, type: !5)
!21 = !DILocation(line: 27, column: 10, scope: !14)
!22 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 28, type: !5)
!23 = !DILocation(line: 28, column: 10, scope: !14)
!24 = !DILocation(line: 30, column: 10, scope: !14)
!25 = !DILocalVariable(name: "data", scope: !26, file: !15, line: 32, type: !6)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!27 = !DILocation(line: 32, column: 13, scope: !26)
!28 = !DILocation(line: 32, column: 21, scope: !26)
!29 = !DILocation(line: 32, column: 20, scope: !26)
!30 = !DILocalVariable(name: "inputBuffer", scope: !31, file: !15, line: 34, type: !32)
!31 = distinct !DILexicalBlock(scope: !26, file: !15, line: 33, column: 9)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 112, elements: !34)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !{!35}
!35 = !DISubrange(count: 14)
!36 = !DILocation(line: 34, column: 18, scope: !31)
!37 = !DILocation(line: 36, column: 23, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !15, line: 36, column: 17)
!39 = !DILocation(line: 36, column: 53, scope: !38)
!40 = !DILocation(line: 36, column: 17, scope: !38)
!41 = !DILocation(line: 36, column: 60, scope: !38)
!42 = !DILocation(line: 36, column: 17, scope: !31)
!43 = !DILocation(line: 39, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !15, line: 37, column: 13)
!45 = !DILocation(line: 39, column: 24, scope: !44)
!46 = !DILocation(line: 39, column: 22, scope: !44)
!47 = !DILocation(line: 40, column: 13, scope: !44)
!48 = !DILocation(line: 43, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !15, line: 42, column: 13)
!50 = !DILocation(line: 46, column: 21, scope: !26)
!51 = !DILocation(line: 46, column: 10, scope: !26)
!52 = !DILocation(line: 46, column: 19, scope: !26)
!53 = !DILocalVariable(name: "data", scope: !54, file: !15, line: 49, type: !6)
!54 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!55 = !DILocation(line: 49, column: 13, scope: !54)
!56 = !DILocation(line: 49, column: 21, scope: !54)
!57 = !DILocation(line: 49, column: 20, scope: !54)
!58 = !DILocalVariable(name: "i", scope: !59, file: !15, line: 51, type: !6)
!59 = distinct !DILexicalBlock(scope: !54, file: !15, line: 50, column: 9)
!60 = !DILocation(line: 51, column: 17, scope: !59)
!61 = !DILocalVariable(name: "buffer", scope: !59, file: !15, line: 52, type: !5)
!62 = !DILocation(line: 52, column: 19, scope: !59)
!63 = !DILocation(line: 52, column: 35, scope: !59)
!64 = !DILocation(line: 52, column: 28, scope: !59)
!65 = !DILocation(line: 53, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !59, file: !15, line: 53, column: 17)
!67 = !DILocation(line: 53, column: 24, scope: !66)
!68 = !DILocation(line: 53, column: 17, scope: !59)
!69 = !DILocation(line: 53, column: 34, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 53, column: 33)
!71 = !DILocation(line: 55, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !59, file: !15, line: 55, column: 13)
!73 = !DILocation(line: 55, column: 18, scope: !72)
!74 = !DILocation(line: 55, column: 25, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !15, line: 55, column: 13)
!76 = !DILocation(line: 55, column: 27, scope: !75)
!77 = !DILocation(line: 55, column: 13, scope: !72)
!78 = !DILocation(line: 57, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 56, column: 13)
!80 = !DILocation(line: 57, column: 24, scope: !79)
!81 = !DILocation(line: 57, column: 27, scope: !79)
!82 = !DILocation(line: 58, column: 13, scope: !79)
!83 = !DILocation(line: 55, column: 34, scope: !75)
!84 = !DILocation(line: 55, column: 13, scope: !75)
!85 = distinct !{!85, !77, !86, !87}
!86 = !DILocation(line: 58, column: 13, scope: !72)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 61, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !59, file: !15, line: 61, column: 17)
!90 = !DILocation(line: 61, column: 22, scope: !89)
!91 = !DILocation(line: 61, column: 17, scope: !59)
!92 = !DILocation(line: 63, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 62, column: 13)
!94 = !DILocation(line: 63, column: 24, scope: !93)
!95 = !DILocation(line: 63, column: 30, scope: !93)
!96 = !DILocation(line: 65, column: 23, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 65, column: 17)
!98 = !DILocation(line: 65, column: 21, scope: !97)
!99 = !DILocation(line: 65, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !15, line: 65, column: 17)
!101 = !DILocation(line: 65, column: 30, scope: !100)
!102 = !DILocation(line: 65, column: 17, scope: !97)
!103 = !DILocation(line: 67, column: 34, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 66, column: 17)
!105 = !DILocation(line: 67, column: 41, scope: !104)
!106 = !DILocation(line: 67, column: 21, scope: !104)
!107 = !DILocation(line: 68, column: 17, scope: !104)
!108 = !DILocation(line: 65, column: 37, scope: !100)
!109 = !DILocation(line: 65, column: 17, scope: !100)
!110 = distinct !{!110, !102, !111, !87}
!111 = !DILocation(line: 68, column: 17, scope: !97)
!112 = !DILocation(line: 69, column: 13, scope: !93)
!113 = !DILocation(line: 72, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !89, file: !15, line: 71, column: 13)
!115 = !DILocation(line: 74, column: 18, scope: !59)
!116 = !DILocation(line: 74, column: 13, scope: !59)
!117 = !DILocation(line: 77, column: 1, scope: !14)
!118 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_32_good", scope: !15, file: !15, line: 184, type: !16, scopeLine: 185, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocation(line: 186, column: 5, scope: !118)
!120 = !DILocation(line: 187, column: 5, scope: !118)
!121 = !DILocation(line: 188, column: 1, scope: !118)
!122 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 198, type: !123, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DISubroutineType(types: !124)
!124 = !{!6, !6, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!127 = !DILocalVariable(name: "argc", arg: 1, scope: !122, file: !15, line: 198, type: !6)
!128 = !DILocation(line: 198, column: 14, scope: !122)
!129 = !DILocalVariable(name: "argv", arg: 2, scope: !122, file: !15, line: 198, type: !125)
!130 = !DILocation(line: 198, column: 27, scope: !122)
!131 = !DILocation(line: 201, column: 22, scope: !122)
!132 = !DILocation(line: 201, column: 12, scope: !122)
!133 = !DILocation(line: 201, column: 5, scope: !122)
!134 = !DILocation(line: 203, column: 5, scope: !122)
!135 = !DILocation(line: 204, column: 5, scope: !122)
!136 = !DILocation(line: 205, column: 5, scope: !122)
!137 = !DILocation(line: 208, column: 5, scope: !122)
!138 = !DILocation(line: 209, column: 5, scope: !122)
!139 = !DILocation(line: 210, column: 5, scope: !122)
!140 = !DILocation(line: 212, column: 5, scope: !122)
!141 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !15, line: 86, type: !6)
!143 = !DILocation(line: 86, column: 9, scope: !141)
!144 = !DILocalVariable(name: "dataPtr1", scope: !141, file: !15, line: 87, type: !5)
!145 = !DILocation(line: 87, column: 10, scope: !141)
!146 = !DILocalVariable(name: "dataPtr2", scope: !141, file: !15, line: 88, type: !5)
!147 = !DILocation(line: 88, column: 10, scope: !141)
!148 = !DILocation(line: 90, column: 10, scope: !141)
!149 = !DILocalVariable(name: "data", scope: !150, file: !15, line: 92, type: !6)
!150 = distinct !DILexicalBlock(scope: !141, file: !15, line: 91, column: 5)
!151 = !DILocation(line: 92, column: 13, scope: !150)
!152 = !DILocation(line: 92, column: 21, scope: !150)
!153 = !DILocation(line: 92, column: 20, scope: !150)
!154 = !DILocation(line: 95, column: 14, scope: !150)
!155 = !DILocation(line: 96, column: 21, scope: !150)
!156 = !DILocation(line: 96, column: 10, scope: !150)
!157 = !DILocation(line: 96, column: 19, scope: !150)
!158 = !DILocalVariable(name: "data", scope: !159, file: !15, line: 99, type: !6)
!159 = distinct !DILexicalBlock(scope: !141, file: !15, line: 98, column: 5)
!160 = !DILocation(line: 99, column: 13, scope: !159)
!161 = !DILocation(line: 99, column: 21, scope: !159)
!162 = !DILocation(line: 99, column: 20, scope: !159)
!163 = !DILocalVariable(name: "i", scope: !164, file: !15, line: 101, type: !6)
!164 = distinct !DILexicalBlock(scope: !159, file: !15, line: 100, column: 9)
!165 = !DILocation(line: 101, column: 17, scope: !164)
!166 = !DILocalVariable(name: "buffer", scope: !164, file: !15, line: 102, type: !5)
!167 = !DILocation(line: 102, column: 19, scope: !164)
!168 = !DILocation(line: 102, column: 35, scope: !164)
!169 = !DILocation(line: 102, column: 28, scope: !164)
!170 = !DILocation(line: 103, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !164, file: !15, line: 103, column: 17)
!172 = !DILocation(line: 103, column: 24, scope: !171)
!173 = !DILocation(line: 103, column: 17, scope: !164)
!174 = !DILocation(line: 103, column: 34, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !15, line: 103, column: 33)
!176 = !DILocation(line: 105, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !164, file: !15, line: 105, column: 13)
!178 = !DILocation(line: 105, column: 18, scope: !177)
!179 = !DILocation(line: 105, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !15, line: 105, column: 13)
!181 = !DILocation(line: 105, column: 27, scope: !180)
!182 = !DILocation(line: 105, column: 13, scope: !177)
!183 = !DILocation(line: 107, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !15, line: 106, column: 13)
!185 = !DILocation(line: 107, column: 24, scope: !184)
!186 = !DILocation(line: 107, column: 27, scope: !184)
!187 = !DILocation(line: 108, column: 13, scope: !184)
!188 = !DILocation(line: 105, column: 34, scope: !180)
!189 = !DILocation(line: 105, column: 13, scope: !180)
!190 = distinct !{!190, !182, !191, !87}
!191 = !DILocation(line: 108, column: 13, scope: !177)
!192 = !DILocation(line: 111, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !164, file: !15, line: 111, column: 17)
!194 = !DILocation(line: 111, column: 22, scope: !193)
!195 = !DILocation(line: 111, column: 17, scope: !164)
!196 = !DILocation(line: 113, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !15, line: 112, column: 13)
!198 = !DILocation(line: 113, column: 24, scope: !197)
!199 = !DILocation(line: 113, column: 30, scope: !197)
!200 = !DILocation(line: 115, column: 23, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !15, line: 115, column: 17)
!202 = !DILocation(line: 115, column: 21, scope: !201)
!203 = !DILocation(line: 115, column: 28, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !15, line: 115, column: 17)
!205 = !DILocation(line: 115, column: 30, scope: !204)
!206 = !DILocation(line: 115, column: 17, scope: !201)
!207 = !DILocation(line: 117, column: 34, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !15, line: 116, column: 17)
!209 = !DILocation(line: 117, column: 41, scope: !208)
!210 = !DILocation(line: 117, column: 21, scope: !208)
!211 = !DILocation(line: 118, column: 17, scope: !208)
!212 = !DILocation(line: 115, column: 37, scope: !204)
!213 = !DILocation(line: 115, column: 17, scope: !204)
!214 = distinct !{!214, !206, !215, !87}
!215 = !DILocation(line: 118, column: 17, scope: !201)
!216 = !DILocation(line: 119, column: 13, scope: !197)
!217 = !DILocation(line: 122, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !193, file: !15, line: 121, column: 13)
!219 = !DILocation(line: 124, column: 18, scope: !164)
!220 = !DILocation(line: 124, column: 13, scope: !164)
!221 = !DILocation(line: 127, column: 1, scope: !141)
!222 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 130, type: !16, scopeLine: 131, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!223 = !DILocalVariable(name: "data", scope: !222, file: !15, line: 132, type: !6)
!224 = !DILocation(line: 132, column: 9, scope: !222)
!225 = !DILocalVariable(name: "dataPtr1", scope: !222, file: !15, line: 133, type: !5)
!226 = !DILocation(line: 133, column: 10, scope: !222)
!227 = !DILocalVariable(name: "dataPtr2", scope: !222, file: !15, line: 134, type: !5)
!228 = !DILocation(line: 134, column: 10, scope: !222)
!229 = !DILocation(line: 136, column: 10, scope: !222)
!230 = !DILocalVariable(name: "data", scope: !231, file: !15, line: 138, type: !6)
!231 = distinct !DILexicalBlock(scope: !222, file: !15, line: 137, column: 5)
!232 = !DILocation(line: 138, column: 13, scope: !231)
!233 = !DILocation(line: 138, column: 21, scope: !231)
!234 = !DILocation(line: 138, column: 20, scope: !231)
!235 = !DILocalVariable(name: "inputBuffer", scope: !236, file: !15, line: 140, type: !32)
!236 = distinct !DILexicalBlock(scope: !231, file: !15, line: 139, column: 9)
!237 = !DILocation(line: 140, column: 18, scope: !236)
!238 = !DILocation(line: 142, column: 23, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !15, line: 142, column: 17)
!240 = !DILocation(line: 142, column: 53, scope: !239)
!241 = !DILocation(line: 142, column: 17, scope: !239)
!242 = !DILocation(line: 142, column: 60, scope: !239)
!243 = !DILocation(line: 142, column: 17, scope: !236)
!244 = !DILocation(line: 145, column: 29, scope: !245)
!245 = distinct !DILexicalBlock(scope: !239, file: !15, line: 143, column: 13)
!246 = !DILocation(line: 145, column: 24, scope: !245)
!247 = !DILocation(line: 145, column: 22, scope: !245)
!248 = !DILocation(line: 146, column: 13, scope: !245)
!249 = !DILocation(line: 149, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !239, file: !15, line: 148, column: 13)
!251 = !DILocation(line: 152, column: 21, scope: !231)
!252 = !DILocation(line: 152, column: 10, scope: !231)
!253 = !DILocation(line: 152, column: 19, scope: !231)
!254 = !DILocalVariable(name: "data", scope: !255, file: !15, line: 155, type: !6)
!255 = distinct !DILexicalBlock(scope: !222, file: !15, line: 154, column: 5)
!256 = !DILocation(line: 155, column: 13, scope: !255)
!257 = !DILocation(line: 155, column: 21, scope: !255)
!258 = !DILocation(line: 155, column: 20, scope: !255)
!259 = !DILocalVariable(name: "i", scope: !260, file: !15, line: 157, type: !6)
!260 = distinct !DILexicalBlock(scope: !255, file: !15, line: 156, column: 9)
!261 = !DILocation(line: 157, column: 17, scope: !260)
!262 = !DILocalVariable(name: "buffer", scope: !260, file: !15, line: 158, type: !5)
!263 = !DILocation(line: 158, column: 19, scope: !260)
!264 = !DILocation(line: 158, column: 35, scope: !260)
!265 = !DILocation(line: 158, column: 28, scope: !260)
!266 = !DILocation(line: 159, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !260, file: !15, line: 159, column: 17)
!268 = !DILocation(line: 159, column: 24, scope: !267)
!269 = !DILocation(line: 159, column: 17, scope: !260)
!270 = !DILocation(line: 159, column: 34, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !15, line: 159, column: 33)
!272 = !DILocation(line: 161, column: 20, scope: !273)
!273 = distinct !DILexicalBlock(scope: !260, file: !15, line: 161, column: 13)
!274 = !DILocation(line: 161, column: 18, scope: !273)
!275 = !DILocation(line: 161, column: 25, scope: !276)
!276 = distinct !DILexicalBlock(scope: !273, file: !15, line: 161, column: 13)
!277 = !DILocation(line: 161, column: 27, scope: !276)
!278 = !DILocation(line: 161, column: 13, scope: !273)
!279 = !DILocation(line: 163, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !15, line: 162, column: 13)
!281 = !DILocation(line: 163, column: 24, scope: !280)
!282 = !DILocation(line: 163, column: 27, scope: !280)
!283 = !DILocation(line: 164, column: 13, scope: !280)
!284 = !DILocation(line: 161, column: 34, scope: !276)
!285 = !DILocation(line: 161, column: 13, scope: !276)
!286 = distinct !{!286, !278, !287, !87}
!287 = !DILocation(line: 164, column: 13, scope: !273)
!288 = !DILocation(line: 166, column: 17, scope: !289)
!289 = distinct !DILexicalBlock(scope: !260, file: !15, line: 166, column: 17)
!290 = !DILocation(line: 166, column: 22, scope: !289)
!291 = !DILocation(line: 166, column: 27, scope: !289)
!292 = !DILocation(line: 166, column: 30, scope: !289)
!293 = !DILocation(line: 166, column: 35, scope: !289)
!294 = !DILocation(line: 166, column: 17, scope: !260)
!295 = !DILocation(line: 168, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !289, file: !15, line: 167, column: 13)
!297 = !DILocation(line: 168, column: 24, scope: !296)
!298 = !DILocation(line: 168, column: 30, scope: !296)
!299 = !DILocation(line: 170, column: 23, scope: !300)
!300 = distinct !DILexicalBlock(scope: !296, file: !15, line: 170, column: 17)
!301 = !DILocation(line: 170, column: 21, scope: !300)
!302 = !DILocation(line: 170, column: 28, scope: !303)
!303 = distinct !DILexicalBlock(scope: !300, file: !15, line: 170, column: 17)
!304 = !DILocation(line: 170, column: 30, scope: !303)
!305 = !DILocation(line: 170, column: 17, scope: !300)
!306 = !DILocation(line: 172, column: 34, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !15, line: 171, column: 17)
!308 = !DILocation(line: 172, column: 41, scope: !307)
!309 = !DILocation(line: 172, column: 21, scope: !307)
!310 = !DILocation(line: 173, column: 17, scope: !307)
!311 = !DILocation(line: 170, column: 37, scope: !303)
!312 = !DILocation(line: 170, column: 17, scope: !303)
!313 = distinct !{!313, !305, !314, !87}
!314 = !DILocation(line: 173, column: 17, scope: !300)
!315 = !DILocation(line: 174, column: 13, scope: !296)
!316 = !DILocation(line: 177, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !289, file: !15, line: 176, column: 13)
!318 = !DILocation(line: 179, column: 18, scope: !260)
!319 = !DILocation(line: 179, column: 13, scope: !260)
!320 = !DILocation(line: 182, column: 1, scope: !222)
