; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i7 = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %j, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !32, metadata !DIExpression()), !dbg !39
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !40
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !42
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !43
  %cmp1 = icmp ne i8* %call, null, !dbg !44
  br i1 %cmp1, label %if.then, label %if.else, !dbg !45

if.then:                                          ; preds = %for.body
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !46
  %call3 = call i32 @atoi(i8* %arraydecay2) #7, !dbg !48
  store i32 %call3, i32* %data, align 4, !dbg !49
  br label %if.end, !dbg !50

if.else:                                          ; preds = %for.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !51
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %3, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !59
  br label %for.cond4, !dbg !61

for.cond4:                                        ; preds = %for.inc32, %for.end
  %4 = load i32, i32* %j, align 4, !dbg !62
  %cmp5 = icmp slt i32 %4, 1, !dbg !64
  br i1 %cmp5, label %for.body6, label %for.end34, !dbg !65

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !66, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !70, metadata !DIExpression()), !dbg !71
  %call8 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !72
  %5 = bitcast i8* %call8 to i32*, !dbg !73
  store i32* %5, i32** %buffer, align 8, !dbg !71
  %6 = load i32*, i32** %buffer, align 8, !dbg !74
  %cmp9 = icmp eq i32* %6, null, !dbg !76
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !77

if.then10:                                        ; preds = %for.body6
  call void @exit(i32 -1) #9, !dbg !78
  unreachable, !dbg !78

if.end11:                                         ; preds = %for.body6
  store i32 0, i32* %i7, align 4, !dbg !80
  br label %for.cond12, !dbg !82

for.cond12:                                       ; preds = %for.inc15, %if.end11
  %7 = load i32, i32* %i7, align 4, !dbg !83
  %cmp13 = icmp slt i32 %7, 10, !dbg !85
  br i1 %cmp13, label %for.body14, label %for.end17, !dbg !86

for.body14:                                       ; preds = %for.cond12
  %8 = load i32*, i32** %buffer, align 8, !dbg !87
  %9 = load i32, i32* %i7, align 4, !dbg !89
  %idxprom = sext i32 %9 to i64, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %idxprom, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  br label %for.inc15, !dbg !91

for.inc15:                                        ; preds = %for.body14
  %10 = load i32, i32* %i7, align 4, !dbg !92
  %inc16 = add nsw i32 %10, 1, !dbg !92
  store i32 %inc16, i32* %i7, align 4, !dbg !92
  br label %for.cond12, !dbg !93, !llvm.loop !94

for.end17:                                        ; preds = %for.cond12
  %11 = load i32, i32* %data, align 4, !dbg !96
  %cmp18 = icmp sge i32 %11, 0, !dbg !98
  br i1 %cmp18, label %if.then19, label %if.else30, !dbg !99

if.then19:                                        ; preds = %for.end17
  %12 = load i32*, i32** %buffer, align 8, !dbg !100
  %13 = load i32, i32* %data, align 4, !dbg !102
  %idxprom20 = sext i32 %13 to i64, !dbg !100
  %arrayidx21 = getelementptr inbounds i32, i32* %12, i64 %idxprom20, !dbg !100
  store i32 1, i32* %arrayidx21, align 4, !dbg !103
  store i32 0, i32* %i7, align 4, !dbg !104
  br label %for.cond22, !dbg !106

for.cond22:                                       ; preds = %for.inc27, %if.then19
  %14 = load i32, i32* %i7, align 4, !dbg !107
  %cmp23 = icmp slt i32 %14, 10, !dbg !109
  br i1 %cmp23, label %for.body24, label %for.end29, !dbg !110

for.body24:                                       ; preds = %for.cond22
  %15 = load i32*, i32** %buffer, align 8, !dbg !111
  %16 = load i32, i32* %i7, align 4, !dbg !113
  %idxprom25 = sext i32 %16 to i64, !dbg !111
  %arrayidx26 = getelementptr inbounds i32, i32* %15, i64 %idxprom25, !dbg !111
  %17 = load i32, i32* %arrayidx26, align 4, !dbg !111
  call void @printIntLine(i32 %17), !dbg !114
  br label %for.inc27, !dbg !115

for.inc27:                                        ; preds = %for.body24
  %18 = load i32, i32* %i7, align 4, !dbg !116
  %inc28 = add nsw i32 %18, 1, !dbg !116
  store i32 %inc28, i32* %i7, align 4, !dbg !116
  br label %for.cond22, !dbg !117, !llvm.loop !118

for.end29:                                        ; preds = %for.cond22
  br label %if.end31, !dbg !120

if.else30:                                        ; preds = %for.end17
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !121
  br label %if.end31

if.end31:                                         ; preds = %if.else30, %for.end29
  %19 = load i32*, i32** %buffer, align 8, !dbg !123
  %20 = bitcast i32* %19 to i8*, !dbg !123
  call void @free(i8* %20) #8, !dbg !124
  br label %for.inc32, !dbg !125

for.inc32:                                        ; preds = %if.end31
  %21 = load i32, i32* %j, align 4, !dbg !126
  %inc33 = add nsw i32 %21, 1, !dbg !126
  store i32 %inc33, i32* %j, align 4, !dbg !126
  br label %for.cond4, !dbg !127, !llvm.loop !128

for.end34:                                        ; preds = %for.cond4
  ret void, !dbg !130
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17_good() #0 !dbg !131 {
entry:
  call void @goodB2G(), !dbg !132
  call void @goodG2B(), !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !135 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !140, metadata !DIExpression()), !dbg !141
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !142, metadata !DIExpression()), !dbg !143
  %call = call i64 @time(i64* null) #8, !dbg !144
  %conv = trunc i64 %call to i32, !dbg !145
  call void @srand(i32 %conv) #8, !dbg !146
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !147
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17_good(), !dbg !148
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !149
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !150
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17_bad(), !dbg !151
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !152
  ret i32 0, !dbg !153
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !154 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i7 = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i32* %k, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32* %data, metadata !159, metadata !DIExpression()), !dbg !160
  store i32 -1, i32* %data, align 4, !dbg !161
  store i32 0, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !165
  %cmp = icmp slt i32 %0, 1, !dbg !167
  br i1 %cmp, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !169, metadata !DIExpression()), !dbg !172
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !172
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !173
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !175
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !176
  %cmp1 = icmp ne i8* %call, null, !dbg !177
  br i1 %cmp1, label %if.then, label %if.else, !dbg !178

if.then:                                          ; preds = %for.body
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !179
  %call3 = call i32 @atoi(i8* %arraydecay2) #7, !dbg !181
  store i32 %call3, i32* %data, align 4, !dbg !182
  br label %if.end, !dbg !183

if.else:                                          ; preds = %for.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !184
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !187
  %inc = add nsw i32 %3, 1, !dbg !187
  store i32 %inc, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !191
  br label %for.cond4, !dbg !193

for.cond4:                                        ; preds = %for.inc33, %for.end
  %4 = load i32, i32* %k, align 4, !dbg !194
  %cmp5 = icmp slt i32 %4, 1, !dbg !196
  br i1 %cmp5, label %for.body6, label %for.end35, !dbg !197

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !198, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !202, metadata !DIExpression()), !dbg !203
  %call8 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !204
  %5 = bitcast i8* %call8 to i32*, !dbg !205
  store i32* %5, i32** %buffer, align 8, !dbg !203
  %6 = load i32*, i32** %buffer, align 8, !dbg !206
  %cmp9 = icmp eq i32* %6, null, !dbg !208
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !209

if.then10:                                        ; preds = %for.body6
  call void @exit(i32 -1) #9, !dbg !210
  unreachable, !dbg !210

if.end11:                                         ; preds = %for.body6
  store i32 0, i32* %i7, align 4, !dbg !212
  br label %for.cond12, !dbg !214

for.cond12:                                       ; preds = %for.inc15, %if.end11
  %7 = load i32, i32* %i7, align 4, !dbg !215
  %cmp13 = icmp slt i32 %7, 10, !dbg !217
  br i1 %cmp13, label %for.body14, label %for.end17, !dbg !218

for.body14:                                       ; preds = %for.cond12
  %8 = load i32*, i32** %buffer, align 8, !dbg !219
  %9 = load i32, i32* %i7, align 4, !dbg !221
  %idxprom = sext i32 %9 to i64, !dbg !219
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %idxprom, !dbg !219
  store i32 0, i32* %arrayidx, align 4, !dbg !222
  br label %for.inc15, !dbg !223

for.inc15:                                        ; preds = %for.body14
  %10 = load i32, i32* %i7, align 4, !dbg !224
  %inc16 = add nsw i32 %10, 1, !dbg !224
  store i32 %inc16, i32* %i7, align 4, !dbg !224
  br label %for.cond12, !dbg !225, !llvm.loop !226

for.end17:                                        ; preds = %for.cond12
  %11 = load i32, i32* %data, align 4, !dbg !228
  %cmp18 = icmp sge i32 %11, 0, !dbg !230
  br i1 %cmp18, label %land.lhs.true, label %if.else31, !dbg !231

land.lhs.true:                                    ; preds = %for.end17
  %12 = load i32, i32* %data, align 4, !dbg !232
  %cmp19 = icmp slt i32 %12, 10, !dbg !233
  br i1 %cmp19, label %if.then20, label %if.else31, !dbg !234

if.then20:                                        ; preds = %land.lhs.true
  %13 = load i32*, i32** %buffer, align 8, !dbg !235
  %14 = load i32, i32* %data, align 4, !dbg !237
  %idxprom21 = sext i32 %14 to i64, !dbg !235
  %arrayidx22 = getelementptr inbounds i32, i32* %13, i64 %idxprom21, !dbg !235
  store i32 1, i32* %arrayidx22, align 4, !dbg !238
  store i32 0, i32* %i7, align 4, !dbg !239
  br label %for.cond23, !dbg !241

for.cond23:                                       ; preds = %for.inc28, %if.then20
  %15 = load i32, i32* %i7, align 4, !dbg !242
  %cmp24 = icmp slt i32 %15, 10, !dbg !244
  br i1 %cmp24, label %for.body25, label %for.end30, !dbg !245

for.body25:                                       ; preds = %for.cond23
  %16 = load i32*, i32** %buffer, align 8, !dbg !246
  %17 = load i32, i32* %i7, align 4, !dbg !248
  %idxprom26 = sext i32 %17 to i64, !dbg !246
  %arrayidx27 = getelementptr inbounds i32, i32* %16, i64 %idxprom26, !dbg !246
  %18 = load i32, i32* %arrayidx27, align 4, !dbg !246
  call void @printIntLine(i32 %18), !dbg !249
  br label %for.inc28, !dbg !250

for.inc28:                                        ; preds = %for.body25
  %19 = load i32, i32* %i7, align 4, !dbg !251
  %inc29 = add nsw i32 %19, 1, !dbg !251
  store i32 %inc29, i32* %i7, align 4, !dbg !251
  br label %for.cond23, !dbg !252, !llvm.loop !253

for.end30:                                        ; preds = %for.cond23
  br label %if.end32, !dbg !255

if.else31:                                        ; preds = %land.lhs.true, %for.end17
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !256
  br label %if.end32

if.end32:                                         ; preds = %if.else31, %for.end30
  %20 = load i32*, i32** %buffer, align 8, !dbg !258
  %21 = bitcast i32* %20 to i8*, !dbg !258
  call void @free(i8* %21) #8, !dbg !259
  br label %for.inc33, !dbg !260

for.inc33:                                        ; preds = %if.end32
  %22 = load i32, i32* %k, align 4, !dbg !261
  %inc34 = add nsw i32 %22, 1, !dbg !261
  store i32 %inc34, i32* %k, align 4, !dbg !261
  br label %for.cond4, !dbg !262, !llvm.loop !263

for.end35:                                        ; preds = %for.cond4
  ret void, !dbg !265
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !266 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32* %j, metadata !269, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata i32* %data, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 -1, i32* %data, align 4, !dbg !273
  store i32 0, i32* %h, align 4, !dbg !274
  br label %for.cond, !dbg !276

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !277
  %cmp = icmp slt i32 %0, 1, !dbg !279
  br i1 %cmp, label %for.body, label %for.end, !dbg !280

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !281
  br label %for.inc, !dbg !283

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !284
  %inc = add nsw i32 %1, 1, !dbg !284
  store i32 %inc, i32* %h, align 4, !dbg !284
  br label %for.cond, !dbg !285, !llvm.loop !286

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !288
  br label %for.cond1, !dbg !290

for.cond1:                                        ; preds = %for.inc24, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !291
  %cmp2 = icmp slt i32 %2, 1, !dbg !293
  br i1 %cmp2, label %for.body3, label %for.end26, !dbg !294

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !295, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !299, metadata !DIExpression()), !dbg !300
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !301
  %3 = bitcast i8* %call to i32*, !dbg !302
  store i32* %3, i32** %buffer, align 8, !dbg !300
  %4 = load i32*, i32** %buffer, align 8, !dbg !303
  %cmp4 = icmp eq i32* %4, null, !dbg !305
  br i1 %cmp4, label %if.then, label %if.end, !dbg !306

if.then:                                          ; preds = %for.body3
  call void @exit(i32 -1) #9, !dbg !307
  unreachable, !dbg !307

if.end:                                           ; preds = %for.body3
  store i32 0, i32* %i, align 4, !dbg !309
  br label %for.cond5, !dbg !311

for.cond5:                                        ; preds = %for.inc8, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !312
  %cmp6 = icmp slt i32 %5, 10, !dbg !314
  br i1 %cmp6, label %for.body7, label %for.end10, !dbg !315

for.body7:                                        ; preds = %for.cond5
  %6 = load i32*, i32** %buffer, align 8, !dbg !316
  %7 = load i32, i32* %i, align 4, !dbg !318
  %idxprom = sext i32 %7 to i64, !dbg !316
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !316
  store i32 0, i32* %arrayidx, align 4, !dbg !319
  br label %for.inc8, !dbg !320

for.inc8:                                         ; preds = %for.body7
  %8 = load i32, i32* %i, align 4, !dbg !321
  %inc9 = add nsw i32 %8, 1, !dbg !321
  store i32 %inc9, i32* %i, align 4, !dbg !321
  br label %for.cond5, !dbg !322, !llvm.loop !323

for.end10:                                        ; preds = %for.cond5
  %9 = load i32, i32* %data, align 4, !dbg !325
  %cmp11 = icmp sge i32 %9, 0, !dbg !327
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !328

if.then12:                                        ; preds = %for.end10
  %10 = load i32*, i32** %buffer, align 8, !dbg !329
  %11 = load i32, i32* %data, align 4, !dbg !331
  %idxprom13 = sext i32 %11 to i64, !dbg !329
  %arrayidx14 = getelementptr inbounds i32, i32* %10, i64 %idxprom13, !dbg !329
  store i32 1, i32* %arrayidx14, align 4, !dbg !332
  store i32 0, i32* %i, align 4, !dbg !333
  br label %for.cond15, !dbg !335

for.cond15:                                       ; preds = %for.inc20, %if.then12
  %12 = load i32, i32* %i, align 4, !dbg !336
  %cmp16 = icmp slt i32 %12, 10, !dbg !338
  br i1 %cmp16, label %for.body17, label %for.end22, !dbg !339

for.body17:                                       ; preds = %for.cond15
  %13 = load i32*, i32** %buffer, align 8, !dbg !340
  %14 = load i32, i32* %i, align 4, !dbg !342
  %idxprom18 = sext i32 %14 to i64, !dbg !340
  %arrayidx19 = getelementptr inbounds i32, i32* %13, i64 %idxprom18, !dbg !340
  %15 = load i32, i32* %arrayidx19, align 4, !dbg !340
  call void @printIntLine(i32 %15), !dbg !343
  br label %for.inc20, !dbg !344

for.inc20:                                        ; preds = %for.body17
  %16 = load i32, i32* %i, align 4, !dbg !345
  %inc21 = add nsw i32 %16, 1, !dbg !345
  store i32 %inc21, i32* %i, align 4, !dbg !345
  br label %for.cond15, !dbg !346, !llvm.loop !347

for.end22:                                        ; preds = %for.cond15
  br label %if.end23, !dbg !349

if.else:                                          ; preds = %for.end10
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !350
  br label %if.end23

if.end23:                                         ; preds = %if.else, %for.end22
  %17 = load i32*, i32** %buffer, align 8, !dbg !352
  %18 = bitcast i32* %17 to i8*, !dbg !352
  call void @free(i8* %18) #8, !dbg !353
  br label %for.inc24, !dbg !354

for.inc24:                                        ; preds = %if.end23
  %19 = load i32, i32* %j, align 4, !dbg !355
  %inc25 = add nsw i32 %19, 1, !dbg !355
  store i32 %inc25, i32* %j, align 4, !dbg !355
  br label %for.cond1, !dbg !356, !llvm.loop !357

for.end26:                                        ; preds = %for.cond1
  ret void, !dbg !359
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 26, type: !6)
!19 = !DILocation(line: 26, column: 9, scope: !14)
!20 = !DILocalVariable(name: "j", scope: !14, file: !15, line: 26, type: !6)
!21 = !DILocation(line: 26, column: 11, scope: !14)
!22 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 27, type: !6)
!23 = !DILocation(line: 27, column: 9, scope: !14)
!24 = !DILocation(line: 29, column: 10, scope: !14)
!25 = !DILocation(line: 30, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!27 = !DILocation(line: 30, column: 9, scope: !26)
!28 = !DILocation(line: 30, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 30, column: 5)
!30 = !DILocation(line: 30, column: 18, scope: !29)
!31 = !DILocation(line: 30, column: 5, scope: !26)
!32 = !DILocalVariable(name: "inputBuffer", scope: !33, file: !15, line: 33, type: !35)
!33 = distinct !DILexicalBlock(scope: !34, file: !15, line: 32, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !15, line: 31, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 112, elements: !37)
!36 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!37 = !{!38}
!38 = !DISubrange(count: 14)
!39 = !DILocation(line: 33, column: 18, scope: !33)
!40 = !DILocation(line: 35, column: 23, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !15, line: 35, column: 17)
!42 = !DILocation(line: 35, column: 53, scope: !41)
!43 = !DILocation(line: 35, column: 17, scope: !41)
!44 = !DILocation(line: 35, column: 60, scope: !41)
!45 = !DILocation(line: 35, column: 17, scope: !33)
!46 = !DILocation(line: 38, column: 29, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !15, line: 36, column: 13)
!48 = !DILocation(line: 38, column: 24, scope: !47)
!49 = !DILocation(line: 38, column: 22, scope: !47)
!50 = !DILocation(line: 39, column: 13, scope: !47)
!51 = !DILocation(line: 42, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !41, file: !15, line: 41, column: 13)
!53 = !DILocation(line: 45, column: 5, scope: !34)
!54 = !DILocation(line: 30, column: 24, scope: !29)
!55 = !DILocation(line: 30, column: 5, scope: !29)
!56 = distinct !{!56, !31, !57, !58}
!57 = !DILocation(line: 45, column: 5, scope: !26)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 46, column: 11, scope: !60)
!60 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 5)
!61 = !DILocation(line: 46, column: 9, scope: !60)
!62 = !DILocation(line: 46, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 46, column: 5)
!64 = !DILocation(line: 46, column: 18, scope: !63)
!65 = !DILocation(line: 46, column: 5, scope: !60)
!66 = !DILocalVariable(name: "i", scope: !67, file: !15, line: 49, type: !6)
!67 = distinct !DILexicalBlock(scope: !68, file: !15, line: 48, column: 9)
!68 = distinct !DILexicalBlock(scope: !63, file: !15, line: 47, column: 5)
!69 = !DILocation(line: 49, column: 17, scope: !67)
!70 = !DILocalVariable(name: "buffer", scope: !67, file: !15, line: 50, type: !5)
!71 = !DILocation(line: 50, column: 19, scope: !67)
!72 = !DILocation(line: 50, column: 35, scope: !67)
!73 = !DILocation(line: 50, column: 28, scope: !67)
!74 = !DILocation(line: 51, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !67, file: !15, line: 51, column: 17)
!76 = !DILocation(line: 51, column: 24, scope: !75)
!77 = !DILocation(line: 51, column: 17, scope: !67)
!78 = !DILocation(line: 51, column: 34, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 51, column: 33)
!80 = !DILocation(line: 53, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !67, file: !15, line: 53, column: 13)
!82 = !DILocation(line: 53, column: 18, scope: !81)
!83 = !DILocation(line: 53, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !15, line: 53, column: 13)
!85 = !DILocation(line: 53, column: 27, scope: !84)
!86 = !DILocation(line: 53, column: 13, scope: !81)
!87 = !DILocation(line: 55, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 54, column: 13)
!89 = !DILocation(line: 55, column: 24, scope: !88)
!90 = !DILocation(line: 55, column: 27, scope: !88)
!91 = !DILocation(line: 56, column: 13, scope: !88)
!92 = !DILocation(line: 53, column: 34, scope: !84)
!93 = !DILocation(line: 53, column: 13, scope: !84)
!94 = distinct !{!94, !86, !95, !58}
!95 = !DILocation(line: 56, column: 13, scope: !81)
!96 = !DILocation(line: 59, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !67, file: !15, line: 59, column: 17)
!98 = !DILocation(line: 59, column: 22, scope: !97)
!99 = !DILocation(line: 59, column: 17, scope: !67)
!100 = !DILocation(line: 61, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 60, column: 13)
!102 = !DILocation(line: 61, column: 24, scope: !101)
!103 = !DILocation(line: 61, column: 30, scope: !101)
!104 = !DILocation(line: 63, column: 23, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 63, column: 17)
!106 = !DILocation(line: 63, column: 21, scope: !105)
!107 = !DILocation(line: 63, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !15, line: 63, column: 17)
!109 = !DILocation(line: 63, column: 30, scope: !108)
!110 = !DILocation(line: 63, column: 17, scope: !105)
!111 = !DILocation(line: 65, column: 34, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 64, column: 17)
!113 = !DILocation(line: 65, column: 41, scope: !112)
!114 = !DILocation(line: 65, column: 21, scope: !112)
!115 = !DILocation(line: 66, column: 17, scope: !112)
!116 = !DILocation(line: 63, column: 37, scope: !108)
!117 = !DILocation(line: 63, column: 17, scope: !108)
!118 = distinct !{!118, !110, !119, !58}
!119 = !DILocation(line: 66, column: 17, scope: !105)
!120 = !DILocation(line: 67, column: 13, scope: !101)
!121 = !DILocation(line: 70, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !97, file: !15, line: 69, column: 13)
!123 = !DILocation(line: 72, column: 18, scope: !67)
!124 = !DILocation(line: 72, column: 13, scope: !67)
!125 = !DILocation(line: 74, column: 5, scope: !68)
!126 = !DILocation(line: 46, column: 24, scope: !63)
!127 = !DILocation(line: 46, column: 5, scope: !63)
!128 = distinct !{!128, !65, !129, !58}
!129 = !DILocation(line: 74, column: 5, scope: !60)
!130 = !DILocation(line: 75, column: 1, scope: !14)
!131 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_17_good", scope: !15, file: !15, line: 178, type: !16, scopeLine: 179, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocation(line: 180, column: 5, scope: !131)
!133 = !DILocation(line: 181, column: 5, scope: !131)
!134 = !DILocation(line: 182, column: 1, scope: !131)
!135 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 193, type: !136, scopeLine: 194, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DISubroutineType(types: !137)
!137 = !{!6, !6, !138}
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!140 = !DILocalVariable(name: "argc", arg: 1, scope: !135, file: !15, line: 193, type: !6)
!141 = !DILocation(line: 193, column: 14, scope: !135)
!142 = !DILocalVariable(name: "argv", arg: 2, scope: !135, file: !15, line: 193, type: !138)
!143 = !DILocation(line: 193, column: 27, scope: !135)
!144 = !DILocation(line: 196, column: 22, scope: !135)
!145 = !DILocation(line: 196, column: 12, scope: !135)
!146 = !DILocation(line: 196, column: 5, scope: !135)
!147 = !DILocation(line: 198, column: 5, scope: !135)
!148 = !DILocation(line: 199, column: 5, scope: !135)
!149 = !DILocation(line: 200, column: 5, scope: !135)
!150 = !DILocation(line: 203, column: 5, scope: !135)
!151 = !DILocation(line: 204, column: 5, scope: !135)
!152 = !DILocation(line: 205, column: 5, scope: !135)
!153 = !DILocation(line: 207, column: 5, scope: !135)
!154 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocalVariable(name: "i", scope: !154, file: !15, line: 84, type: !6)
!156 = !DILocation(line: 84, column: 9, scope: !154)
!157 = !DILocalVariable(name: "k", scope: !154, file: !15, line: 84, type: !6)
!158 = !DILocation(line: 84, column: 11, scope: !154)
!159 = !DILocalVariable(name: "data", scope: !154, file: !15, line: 85, type: !6)
!160 = !DILocation(line: 85, column: 9, scope: !154)
!161 = !DILocation(line: 87, column: 10, scope: !154)
!162 = !DILocation(line: 88, column: 11, scope: !163)
!163 = distinct !DILexicalBlock(scope: !154, file: !15, line: 88, column: 5)
!164 = !DILocation(line: 88, column: 9, scope: !163)
!165 = !DILocation(line: 88, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !15, line: 88, column: 5)
!167 = !DILocation(line: 88, column: 18, scope: !166)
!168 = !DILocation(line: 88, column: 5, scope: !163)
!169 = !DILocalVariable(name: "inputBuffer", scope: !170, file: !15, line: 91, type: !35)
!170 = distinct !DILexicalBlock(scope: !171, file: !15, line: 90, column: 9)
!171 = distinct !DILexicalBlock(scope: !166, file: !15, line: 89, column: 5)
!172 = !DILocation(line: 91, column: 18, scope: !170)
!173 = !DILocation(line: 93, column: 23, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !15, line: 93, column: 17)
!175 = !DILocation(line: 93, column: 53, scope: !174)
!176 = !DILocation(line: 93, column: 17, scope: !174)
!177 = !DILocation(line: 93, column: 60, scope: !174)
!178 = !DILocation(line: 93, column: 17, scope: !170)
!179 = !DILocation(line: 96, column: 29, scope: !180)
!180 = distinct !DILexicalBlock(scope: !174, file: !15, line: 94, column: 13)
!181 = !DILocation(line: 96, column: 24, scope: !180)
!182 = !DILocation(line: 96, column: 22, scope: !180)
!183 = !DILocation(line: 97, column: 13, scope: !180)
!184 = !DILocation(line: 100, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !174, file: !15, line: 99, column: 13)
!186 = !DILocation(line: 103, column: 5, scope: !171)
!187 = !DILocation(line: 88, column: 24, scope: !166)
!188 = !DILocation(line: 88, column: 5, scope: !166)
!189 = distinct !{!189, !168, !190, !58}
!190 = !DILocation(line: 103, column: 5, scope: !163)
!191 = !DILocation(line: 104, column: 11, scope: !192)
!192 = distinct !DILexicalBlock(scope: !154, file: !15, line: 104, column: 5)
!193 = !DILocation(line: 104, column: 9, scope: !192)
!194 = !DILocation(line: 104, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !15, line: 104, column: 5)
!196 = !DILocation(line: 104, column: 18, scope: !195)
!197 = !DILocation(line: 104, column: 5, scope: !192)
!198 = !DILocalVariable(name: "i", scope: !199, file: !15, line: 107, type: !6)
!199 = distinct !DILexicalBlock(scope: !200, file: !15, line: 106, column: 9)
!200 = distinct !DILexicalBlock(scope: !195, file: !15, line: 105, column: 5)
!201 = !DILocation(line: 107, column: 17, scope: !199)
!202 = !DILocalVariable(name: "buffer", scope: !199, file: !15, line: 108, type: !5)
!203 = !DILocation(line: 108, column: 19, scope: !199)
!204 = !DILocation(line: 108, column: 35, scope: !199)
!205 = !DILocation(line: 108, column: 28, scope: !199)
!206 = !DILocation(line: 109, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !199, file: !15, line: 109, column: 17)
!208 = !DILocation(line: 109, column: 24, scope: !207)
!209 = !DILocation(line: 109, column: 17, scope: !199)
!210 = !DILocation(line: 109, column: 34, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !15, line: 109, column: 33)
!212 = !DILocation(line: 111, column: 20, scope: !213)
!213 = distinct !DILexicalBlock(scope: !199, file: !15, line: 111, column: 13)
!214 = !DILocation(line: 111, column: 18, scope: !213)
!215 = !DILocation(line: 111, column: 25, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !15, line: 111, column: 13)
!217 = !DILocation(line: 111, column: 27, scope: !216)
!218 = !DILocation(line: 111, column: 13, scope: !213)
!219 = !DILocation(line: 113, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !15, line: 112, column: 13)
!221 = !DILocation(line: 113, column: 24, scope: !220)
!222 = !DILocation(line: 113, column: 27, scope: !220)
!223 = !DILocation(line: 114, column: 13, scope: !220)
!224 = !DILocation(line: 111, column: 34, scope: !216)
!225 = !DILocation(line: 111, column: 13, scope: !216)
!226 = distinct !{!226, !218, !227, !58}
!227 = !DILocation(line: 114, column: 13, scope: !213)
!228 = !DILocation(line: 116, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !199, file: !15, line: 116, column: 17)
!230 = !DILocation(line: 116, column: 22, scope: !229)
!231 = !DILocation(line: 116, column: 27, scope: !229)
!232 = !DILocation(line: 116, column: 30, scope: !229)
!233 = !DILocation(line: 116, column: 35, scope: !229)
!234 = !DILocation(line: 116, column: 17, scope: !199)
!235 = !DILocation(line: 118, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !229, file: !15, line: 117, column: 13)
!237 = !DILocation(line: 118, column: 24, scope: !236)
!238 = !DILocation(line: 118, column: 30, scope: !236)
!239 = !DILocation(line: 120, column: 23, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !15, line: 120, column: 17)
!241 = !DILocation(line: 120, column: 21, scope: !240)
!242 = !DILocation(line: 120, column: 28, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !15, line: 120, column: 17)
!244 = !DILocation(line: 120, column: 30, scope: !243)
!245 = !DILocation(line: 120, column: 17, scope: !240)
!246 = !DILocation(line: 122, column: 34, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !15, line: 121, column: 17)
!248 = !DILocation(line: 122, column: 41, scope: !247)
!249 = !DILocation(line: 122, column: 21, scope: !247)
!250 = !DILocation(line: 123, column: 17, scope: !247)
!251 = !DILocation(line: 120, column: 37, scope: !243)
!252 = !DILocation(line: 120, column: 17, scope: !243)
!253 = distinct !{!253, !245, !254, !58}
!254 = !DILocation(line: 123, column: 17, scope: !240)
!255 = !DILocation(line: 124, column: 13, scope: !236)
!256 = !DILocation(line: 127, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !229, file: !15, line: 126, column: 13)
!258 = !DILocation(line: 129, column: 18, scope: !199)
!259 = !DILocation(line: 129, column: 13, scope: !199)
!260 = !DILocation(line: 131, column: 5, scope: !200)
!261 = !DILocation(line: 104, column: 24, scope: !195)
!262 = !DILocation(line: 104, column: 5, scope: !195)
!263 = distinct !{!263, !197, !264, !58}
!264 = !DILocation(line: 131, column: 5, scope: !192)
!265 = !DILocation(line: 132, column: 1, scope: !154)
!266 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 135, type: !16, scopeLine: 136, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!267 = !DILocalVariable(name: "h", scope: !266, file: !15, line: 137, type: !6)
!268 = !DILocation(line: 137, column: 9, scope: !266)
!269 = !DILocalVariable(name: "j", scope: !266, file: !15, line: 137, type: !6)
!270 = !DILocation(line: 137, column: 11, scope: !266)
!271 = !DILocalVariable(name: "data", scope: !266, file: !15, line: 138, type: !6)
!272 = !DILocation(line: 138, column: 9, scope: !266)
!273 = !DILocation(line: 140, column: 10, scope: !266)
!274 = !DILocation(line: 141, column: 11, scope: !275)
!275 = distinct !DILexicalBlock(scope: !266, file: !15, line: 141, column: 5)
!276 = !DILocation(line: 141, column: 9, scope: !275)
!277 = !DILocation(line: 141, column: 16, scope: !278)
!278 = distinct !DILexicalBlock(scope: !275, file: !15, line: 141, column: 5)
!279 = !DILocation(line: 141, column: 18, scope: !278)
!280 = !DILocation(line: 141, column: 5, scope: !275)
!281 = !DILocation(line: 145, column: 14, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !15, line: 142, column: 5)
!283 = !DILocation(line: 146, column: 5, scope: !282)
!284 = !DILocation(line: 141, column: 24, scope: !278)
!285 = !DILocation(line: 141, column: 5, scope: !278)
!286 = distinct !{!286, !280, !287, !58}
!287 = !DILocation(line: 146, column: 5, scope: !275)
!288 = !DILocation(line: 147, column: 11, scope: !289)
!289 = distinct !DILexicalBlock(scope: !266, file: !15, line: 147, column: 5)
!290 = !DILocation(line: 147, column: 9, scope: !289)
!291 = !DILocation(line: 147, column: 16, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !15, line: 147, column: 5)
!293 = !DILocation(line: 147, column: 18, scope: !292)
!294 = !DILocation(line: 147, column: 5, scope: !289)
!295 = !DILocalVariable(name: "i", scope: !296, file: !15, line: 150, type: !6)
!296 = distinct !DILexicalBlock(scope: !297, file: !15, line: 149, column: 9)
!297 = distinct !DILexicalBlock(scope: !292, file: !15, line: 148, column: 5)
!298 = !DILocation(line: 150, column: 17, scope: !296)
!299 = !DILocalVariable(name: "buffer", scope: !296, file: !15, line: 151, type: !5)
!300 = !DILocation(line: 151, column: 19, scope: !296)
!301 = !DILocation(line: 151, column: 35, scope: !296)
!302 = !DILocation(line: 151, column: 28, scope: !296)
!303 = !DILocation(line: 152, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !296, file: !15, line: 152, column: 17)
!305 = !DILocation(line: 152, column: 24, scope: !304)
!306 = !DILocation(line: 152, column: 17, scope: !296)
!307 = !DILocation(line: 152, column: 34, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !15, line: 152, column: 33)
!309 = !DILocation(line: 154, column: 20, scope: !310)
!310 = distinct !DILexicalBlock(scope: !296, file: !15, line: 154, column: 13)
!311 = !DILocation(line: 154, column: 18, scope: !310)
!312 = !DILocation(line: 154, column: 25, scope: !313)
!313 = distinct !DILexicalBlock(scope: !310, file: !15, line: 154, column: 13)
!314 = !DILocation(line: 154, column: 27, scope: !313)
!315 = !DILocation(line: 154, column: 13, scope: !310)
!316 = !DILocation(line: 156, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !15, line: 155, column: 13)
!318 = !DILocation(line: 156, column: 24, scope: !317)
!319 = !DILocation(line: 156, column: 27, scope: !317)
!320 = !DILocation(line: 157, column: 13, scope: !317)
!321 = !DILocation(line: 154, column: 34, scope: !313)
!322 = !DILocation(line: 154, column: 13, scope: !313)
!323 = distinct !{!323, !315, !324, !58}
!324 = !DILocation(line: 157, column: 13, scope: !310)
!325 = !DILocation(line: 160, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !296, file: !15, line: 160, column: 17)
!327 = !DILocation(line: 160, column: 22, scope: !326)
!328 = !DILocation(line: 160, column: 17, scope: !296)
!329 = !DILocation(line: 162, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !15, line: 161, column: 13)
!331 = !DILocation(line: 162, column: 24, scope: !330)
!332 = !DILocation(line: 162, column: 30, scope: !330)
!333 = !DILocation(line: 164, column: 23, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !15, line: 164, column: 17)
!335 = !DILocation(line: 164, column: 21, scope: !334)
!336 = !DILocation(line: 164, column: 28, scope: !337)
!337 = distinct !DILexicalBlock(scope: !334, file: !15, line: 164, column: 17)
!338 = !DILocation(line: 164, column: 30, scope: !337)
!339 = !DILocation(line: 164, column: 17, scope: !334)
!340 = !DILocation(line: 166, column: 34, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !15, line: 165, column: 17)
!342 = !DILocation(line: 166, column: 41, scope: !341)
!343 = !DILocation(line: 166, column: 21, scope: !341)
!344 = !DILocation(line: 167, column: 17, scope: !341)
!345 = !DILocation(line: 164, column: 37, scope: !337)
!346 = !DILocation(line: 164, column: 17, scope: !337)
!347 = distinct !{!347, !339, !348, !58}
!348 = !DILocation(line: 167, column: 17, scope: !334)
!349 = !DILocation(line: 168, column: 13, scope: !330)
!350 = !DILocation(line: 171, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !326, file: !15, line: 170, column: 13)
!352 = !DILocation(line: 173, column: 18, scope: !296)
!353 = !DILocation(line: 173, column: 13, scope: !296)
!354 = !DILocation(line: 175, column: 5, scope: !297)
!355 = !DILocation(line: 147, column: 24, scope: !292)
!356 = !DILocation(line: 147, column: 5, scope: !292)
!357 = distinct !{!357, !294, !358, !58}
!358 = !DILocation(line: 175, column: 5, scope: !289)
!359 = !DILocation(line: 176, column: 1, scope: !266)
