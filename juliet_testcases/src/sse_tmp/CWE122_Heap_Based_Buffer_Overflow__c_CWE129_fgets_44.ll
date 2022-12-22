; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !26, metadata !DIExpression()), !dbg !32
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !35
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !36
  %cmp = icmp ne i8* %call, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !39
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !41
  store i32 %call2, i32* %data, align 4, !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !46
  %3 = load i32, i32* %data, align 4, !dbg !47
  call void %2(i32 %3), !dbg !46
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %i, metadata !52, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !57
  %0 = bitcast i8* %call to i32*, !dbg !58
  store i32* %0, i32** %buffer, align 8, !dbg !56
  %1 = load i32*, i32** %buffer, align 8, !dbg !59
  %cmp = icmp eq i32* %1, null, !dbg !61
  br i1 %cmp, label %if.then, label %if.end, !dbg !62

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !63
  unreachable, !dbg !63

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !68
  %cmp1 = icmp slt i32 %2, 10, !dbg !70
  br i1 %cmp1, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !72
  %4 = load i32, i32* %i, align 4, !dbg !74
  %idxprom = sext i32 %4 to i64, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !77
  %inc = add nsw i32 %5, 1, !dbg !77
  store i32 %inc, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !82
  %cmp2 = icmp sge i32 %6, 0, !dbg !84
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !85

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !86
  %8 = load i32, i32* %data.addr, align 4, !dbg !88
  %idxprom4 = sext i32 %8 to i64, !dbg !86
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !86
  store i32 1, i32* %arrayidx5, align 4, !dbg !89
  store i32 0, i32* %i, align 4, !dbg !90
  br label %for.cond6, !dbg !92

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !93
  %cmp7 = icmp slt i32 %9, 10, !dbg !95
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !96

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !97
  %11 = load i32, i32* %i, align 4, !dbg !99
  %idxprom9 = sext i32 %11 to i64, !dbg !97
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !97
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !97
  call void @printIntLine(i32 %12), !dbg !100
  br label %for.inc11, !dbg !101

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !102
  %inc12 = add nsw i32 %13, 1, !dbg !102
  store i32 %inc12, i32* %i, align 4, !dbg !102
  br label %for.cond6, !dbg !103, !llvm.loop !104

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !106

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !107
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !109
  %15 = bitcast i32* %14 to i8*, !dbg !109
  call void @free(i8* %15) #8, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44_good() #0 !dbg !112 {
entry:
  call void @goodG2B(), !dbg !113
  call void @goodB2G(), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !116 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %call = call i64 @time(i64* null) #8, !dbg !125
  %conv = trunc i64 %call to i32, !dbg !126
  call void @srand(i32 %conv) #8, !dbg !127
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !128
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44_good(), !dbg !129
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !131
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44_bad(), !dbg !132
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !133
  ret i32 0, !dbg !134
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !135 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !138, metadata !DIExpression()), !dbg !139
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !139
  store i32 -1, i32* %data, align 4, !dbg !140
  store i32 7, i32* %data, align 4, !dbg !141
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !142
  %1 = load i32, i32* %data, align 4, !dbg !143
  call void %0(i32 %1), !dbg !142
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !145 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !151, metadata !DIExpression()), !dbg !152
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !153
  %0 = bitcast i8* %call to i32*, !dbg !154
  store i32* %0, i32** %buffer, align 8, !dbg !152
  %1 = load i32*, i32** %buffer, align 8, !dbg !155
  %cmp = icmp eq i32* %1, null, !dbg !157
  br i1 %cmp, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !159
  unreachable, !dbg !159

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !164
  %cmp1 = icmp slt i32 %2, 10, !dbg !166
  br i1 %cmp1, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !168
  %4 = load i32, i32* %i, align 4, !dbg !170
  %idxprom = sext i32 %4 to i64, !dbg !168
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !168
  store i32 0, i32* %arrayidx, align 4, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !173
  %inc = add nsw i32 %5, 1, !dbg !173
  store i32 %inc, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !177
  %cmp2 = icmp sge i32 %6, 0, !dbg !179
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !180

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !181
  %8 = load i32, i32* %data.addr, align 4, !dbg !183
  %idxprom4 = sext i32 %8 to i64, !dbg !181
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !181
  store i32 1, i32* %arrayidx5, align 4, !dbg !184
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond6, !dbg !187

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !188
  %cmp7 = icmp slt i32 %9, 10, !dbg !190
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !191

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !192
  %11 = load i32, i32* %i, align 4, !dbg !194
  %idxprom9 = sext i32 %11 to i64, !dbg !192
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !192
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !192
  call void @printIntLine(i32 %12), !dbg !195
  br label %for.inc11, !dbg !196

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !197
  %inc12 = add nsw i32 %13, 1, !dbg !197
  store i32 %inc12, i32* %i, align 4, !dbg !197
  br label %for.cond6, !dbg !198, !llvm.loop !199

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !201

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !202
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !204
  %15 = bitcast i32* %14 to i8*, !dbg !204
  call void @free(i8* %15) #8, !dbg !205
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !207 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !210, metadata !DIExpression()), !dbg !211
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !211
  store i32 -1, i32* %data, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !213, metadata !DIExpression()), !dbg !215
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !215
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !215
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !216
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !218
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !219
  %cmp = icmp ne i8* %call, null, !dbg !220
  br i1 %cmp, label %if.then, label %if.else, !dbg !221

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !222
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !224
  store i32 %call2, i32* %data, align 4, !dbg !225
  br label %if.end, !dbg !226

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !227
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !229
  %3 = load i32, i32* %data, align 4, !dbg !230
  call void %2(i32 %3), !dbg !229
  ret void, !dbg !231
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !232 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !233, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata i32* %i, metadata !235, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !238, metadata !DIExpression()), !dbg !239
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !240
  %0 = bitcast i8* %call to i32*, !dbg !241
  store i32* %0, i32** %buffer, align 8, !dbg !239
  %1 = load i32*, i32** %buffer, align 8, !dbg !242
  %cmp = icmp eq i32* %1, null, !dbg !244
  br i1 %cmp, label %if.then, label %if.end, !dbg !245

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !246
  unreachable, !dbg !246

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !248
  br label %for.cond, !dbg !250

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !251
  %cmp1 = icmp slt i32 %2, 10, !dbg !253
  br i1 %cmp1, label %for.body, label %for.end, !dbg !254

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !255
  %4 = load i32, i32* %i, align 4, !dbg !257
  %idxprom = sext i32 %4 to i64, !dbg !255
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !255
  store i32 0, i32* %arrayidx, align 4, !dbg !258
  br label %for.inc, !dbg !259

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !260
  %inc = add nsw i32 %5, 1, !dbg !260
  store i32 %inc, i32* %i, align 4, !dbg !260
  br label %for.cond, !dbg !261, !llvm.loop !262

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !264
  %cmp2 = icmp sge i32 %6, 0, !dbg !266
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !267

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !268
  %cmp3 = icmp slt i32 %7, 10, !dbg !269
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !270

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !271
  %9 = load i32, i32* %data.addr, align 4, !dbg !273
  %idxprom5 = sext i32 %9 to i64, !dbg !271
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !271
  store i32 1, i32* %arrayidx6, align 4, !dbg !274
  store i32 0, i32* %i, align 4, !dbg !275
  br label %for.cond7, !dbg !277

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !278
  %cmp8 = icmp slt i32 %10, 10, !dbg !280
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !281

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !282
  %12 = load i32, i32* %i, align 4, !dbg !284
  %idxprom10 = sext i32 %12 to i64, !dbg !282
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !282
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !282
  call void @printIntLine(i32 %13), !dbg !285
  br label %for.inc12, !dbg !286

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !287
  %inc13 = add nsw i32 %14, 1, !dbg !287
  store i32 %inc13, i32* %i, align 4, !dbg !287
  br label %for.cond7, !dbg !288, !llvm.loop !289

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !291

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !292
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !294
  %16 = bitcast i32* %15 to i8*, !dbg !294
  call void @free(i8* %16) #8, !dbg !295
  ret void, !dbg !296
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44_bad", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 56, type: !7)
!19 = !DILocation(line: 56, column: 9, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 58, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !7}
!24 = !DILocation(line: 58, column: 12, scope: !14)
!25 = !DILocation(line: 60, column: 10, scope: !14)
!26 = !DILocalVariable(name: "inputBuffer", scope: !27, file: !15, line: 62, type: !28)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 61, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 112, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 14)
!32 = !DILocation(line: 62, column: 14, scope: !27)
!33 = !DILocation(line: 64, column: 19, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !15, line: 64, column: 13)
!35 = !DILocation(line: 64, column: 49, scope: !34)
!36 = !DILocation(line: 64, column: 13, scope: !34)
!37 = !DILocation(line: 64, column: 56, scope: !34)
!38 = !DILocation(line: 64, column: 13, scope: !27)
!39 = !DILocation(line: 67, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !15, line: 65, column: 9)
!41 = !DILocation(line: 67, column: 20, scope: !40)
!42 = !DILocation(line: 67, column: 18, scope: !40)
!43 = !DILocation(line: 68, column: 9, scope: !40)
!44 = !DILocation(line: 71, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !15, line: 70, column: 9)
!46 = !DILocation(line: 75, column: 5, scope: !14)
!47 = !DILocation(line: 75, column: 13, scope: !14)
!48 = !DILocation(line: 76, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 24, type: !22, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !15, line: 24, type: !7)
!51 = !DILocation(line: 24, column: 25, scope: !49)
!52 = !DILocalVariable(name: "i", scope: !53, file: !15, line: 27, type: !7)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 26, column: 5)
!54 = !DILocation(line: 27, column: 13, scope: !53)
!55 = !DILocalVariable(name: "buffer", scope: !53, file: !15, line: 28, type: !6)
!56 = !DILocation(line: 28, column: 15, scope: !53)
!57 = !DILocation(line: 28, column: 31, scope: !53)
!58 = !DILocation(line: 28, column: 24, scope: !53)
!59 = !DILocation(line: 29, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !53, file: !15, line: 29, column: 13)
!61 = !DILocation(line: 29, column: 20, scope: !60)
!62 = !DILocation(line: 29, column: 13, scope: !53)
!63 = !DILocation(line: 29, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 29, column: 29)
!65 = !DILocation(line: 31, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !53, file: !15, line: 31, column: 9)
!67 = !DILocation(line: 31, column: 14, scope: !66)
!68 = !DILocation(line: 31, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !15, line: 31, column: 9)
!70 = !DILocation(line: 31, column: 23, scope: !69)
!71 = !DILocation(line: 31, column: 9, scope: !66)
!72 = !DILocation(line: 33, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 32, column: 9)
!74 = !DILocation(line: 33, column: 20, scope: !73)
!75 = !DILocation(line: 33, column: 23, scope: !73)
!76 = !DILocation(line: 34, column: 9, scope: !73)
!77 = !DILocation(line: 31, column: 30, scope: !69)
!78 = !DILocation(line: 31, column: 9, scope: !69)
!79 = distinct !{!79, !71, !80, !81}
!80 = !DILocation(line: 34, column: 9, scope: !66)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 37, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !53, file: !15, line: 37, column: 13)
!84 = !DILocation(line: 37, column: 18, scope: !83)
!85 = !DILocation(line: 37, column: 13, scope: !53)
!86 = !DILocation(line: 39, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 38, column: 9)
!88 = !DILocation(line: 39, column: 20, scope: !87)
!89 = !DILocation(line: 39, column: 26, scope: !87)
!90 = !DILocation(line: 41, column: 19, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 41, column: 13)
!92 = !DILocation(line: 41, column: 17, scope: !91)
!93 = !DILocation(line: 41, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 41, column: 13)
!95 = !DILocation(line: 41, column: 26, scope: !94)
!96 = !DILocation(line: 41, column: 13, scope: !91)
!97 = !DILocation(line: 43, column: 30, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 42, column: 13)
!99 = !DILocation(line: 43, column: 37, scope: !98)
!100 = !DILocation(line: 43, column: 17, scope: !98)
!101 = !DILocation(line: 44, column: 13, scope: !98)
!102 = !DILocation(line: 41, column: 33, scope: !94)
!103 = !DILocation(line: 41, column: 13, scope: !94)
!104 = distinct !{!104, !96, !105, !81}
!105 = !DILocation(line: 44, column: 13, scope: !91)
!106 = !DILocation(line: 45, column: 9, scope: !87)
!107 = !DILocation(line: 48, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !83, file: !15, line: 47, column: 9)
!109 = !DILocation(line: 50, column: 14, scope: !53)
!110 = !DILocation(line: 50, column: 9, scope: !53)
!111 = !DILocation(line: 52, column: 1, scope: !49)
!112 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_44_good", scope: !15, file: !15, line: 177, type: !16, scopeLine: 178, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocation(line: 179, column: 5, scope: !112)
!114 = !DILocation(line: 180, column: 5, scope: !112)
!115 = !DILocation(line: 181, column: 1, scope: !112)
!116 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 191, type: !117, scopeLine: 192, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DISubroutineType(types: !118)
!118 = !{!7, !7, !119}
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!121 = !DILocalVariable(name: "argc", arg: 1, scope: !116, file: !15, line: 191, type: !7)
!122 = !DILocation(line: 191, column: 14, scope: !116)
!123 = !DILocalVariable(name: "argv", arg: 2, scope: !116, file: !15, line: 191, type: !119)
!124 = !DILocation(line: 191, column: 27, scope: !116)
!125 = !DILocation(line: 194, column: 22, scope: !116)
!126 = !DILocation(line: 194, column: 12, scope: !116)
!127 = !DILocation(line: 194, column: 5, scope: !116)
!128 = !DILocation(line: 196, column: 5, scope: !116)
!129 = !DILocation(line: 197, column: 5, scope: !116)
!130 = !DILocation(line: 198, column: 5, scope: !116)
!131 = !DILocation(line: 201, column: 5, scope: !116)
!132 = !DILocation(line: 202, column: 5, scope: !116)
!133 = !DILocation(line: 203, column: 5, scope: !116)
!134 = !DILocation(line: 205, column: 5, scope: !116)
!135 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 113, type: !16, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "data", scope: !135, file: !15, line: 115, type: !7)
!137 = !DILocation(line: 115, column: 9, scope: !135)
!138 = !DILocalVariable(name: "funcPtr", scope: !135, file: !15, line: 116, type: !21)
!139 = !DILocation(line: 116, column: 12, scope: !135)
!140 = !DILocation(line: 118, column: 10, scope: !135)
!141 = !DILocation(line: 121, column: 10, scope: !135)
!142 = !DILocation(line: 122, column: 5, scope: !135)
!143 = !DILocation(line: 122, column: 13, scope: !135)
!144 = !DILocation(line: 123, column: 1, scope: !135)
!145 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 83, type: !22, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", arg: 1, scope: !145, file: !15, line: 83, type: !7)
!147 = !DILocation(line: 83, column: 29, scope: !145)
!148 = !DILocalVariable(name: "i", scope: !149, file: !15, line: 86, type: !7)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 85, column: 5)
!150 = !DILocation(line: 86, column: 13, scope: !149)
!151 = !DILocalVariable(name: "buffer", scope: !149, file: !15, line: 87, type: !6)
!152 = !DILocation(line: 87, column: 15, scope: !149)
!153 = !DILocation(line: 87, column: 31, scope: !149)
!154 = !DILocation(line: 87, column: 24, scope: !149)
!155 = !DILocation(line: 88, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !149, file: !15, line: 88, column: 13)
!157 = !DILocation(line: 88, column: 20, scope: !156)
!158 = !DILocation(line: 88, column: 13, scope: !149)
!159 = !DILocation(line: 88, column: 30, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !15, line: 88, column: 29)
!161 = !DILocation(line: 90, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !149, file: !15, line: 90, column: 9)
!163 = !DILocation(line: 90, column: 14, scope: !162)
!164 = !DILocation(line: 90, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !15, line: 90, column: 9)
!166 = !DILocation(line: 90, column: 23, scope: !165)
!167 = !DILocation(line: 90, column: 9, scope: !162)
!168 = !DILocation(line: 92, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !15, line: 91, column: 9)
!170 = !DILocation(line: 92, column: 20, scope: !169)
!171 = !DILocation(line: 92, column: 23, scope: !169)
!172 = !DILocation(line: 93, column: 9, scope: !169)
!173 = !DILocation(line: 90, column: 30, scope: !165)
!174 = !DILocation(line: 90, column: 9, scope: !165)
!175 = distinct !{!175, !167, !176, !81}
!176 = !DILocation(line: 93, column: 9, scope: !162)
!177 = !DILocation(line: 96, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !149, file: !15, line: 96, column: 13)
!179 = !DILocation(line: 96, column: 18, scope: !178)
!180 = !DILocation(line: 96, column: 13, scope: !149)
!181 = !DILocation(line: 98, column: 13, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 97, column: 9)
!183 = !DILocation(line: 98, column: 20, scope: !182)
!184 = !DILocation(line: 98, column: 26, scope: !182)
!185 = !DILocation(line: 100, column: 19, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !15, line: 100, column: 13)
!187 = !DILocation(line: 100, column: 17, scope: !186)
!188 = !DILocation(line: 100, column: 24, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !15, line: 100, column: 13)
!190 = !DILocation(line: 100, column: 26, scope: !189)
!191 = !DILocation(line: 100, column: 13, scope: !186)
!192 = !DILocation(line: 102, column: 30, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !15, line: 101, column: 13)
!194 = !DILocation(line: 102, column: 37, scope: !193)
!195 = !DILocation(line: 102, column: 17, scope: !193)
!196 = !DILocation(line: 103, column: 13, scope: !193)
!197 = !DILocation(line: 100, column: 33, scope: !189)
!198 = !DILocation(line: 100, column: 13, scope: !189)
!199 = distinct !{!199, !191, !200, !81}
!200 = !DILocation(line: 103, column: 13, scope: !186)
!201 = !DILocation(line: 104, column: 9, scope: !182)
!202 = !DILocation(line: 107, column: 13, scope: !203)
!203 = distinct !DILexicalBlock(scope: !178, file: !15, line: 106, column: 9)
!204 = !DILocation(line: 109, column: 14, scope: !149)
!205 = !DILocation(line: 109, column: 9, scope: !149)
!206 = !DILocation(line: 111, column: 1, scope: !145)
!207 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 155, type: !16, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!208 = !DILocalVariable(name: "data", scope: !207, file: !15, line: 157, type: !7)
!209 = !DILocation(line: 157, column: 9, scope: !207)
!210 = !DILocalVariable(name: "funcPtr", scope: !207, file: !15, line: 158, type: !21)
!211 = !DILocation(line: 158, column: 12, scope: !207)
!212 = !DILocation(line: 160, column: 10, scope: !207)
!213 = !DILocalVariable(name: "inputBuffer", scope: !214, file: !15, line: 162, type: !28)
!214 = distinct !DILexicalBlock(scope: !207, file: !15, line: 161, column: 5)
!215 = !DILocation(line: 162, column: 14, scope: !214)
!216 = !DILocation(line: 164, column: 19, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !15, line: 164, column: 13)
!218 = !DILocation(line: 164, column: 49, scope: !217)
!219 = !DILocation(line: 164, column: 13, scope: !217)
!220 = !DILocation(line: 164, column: 56, scope: !217)
!221 = !DILocation(line: 164, column: 13, scope: !214)
!222 = !DILocation(line: 167, column: 25, scope: !223)
!223 = distinct !DILexicalBlock(scope: !217, file: !15, line: 165, column: 9)
!224 = !DILocation(line: 167, column: 20, scope: !223)
!225 = !DILocation(line: 167, column: 18, scope: !223)
!226 = !DILocation(line: 168, column: 9, scope: !223)
!227 = !DILocation(line: 171, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !217, file: !15, line: 170, column: 9)
!229 = !DILocation(line: 174, column: 5, scope: !207)
!230 = !DILocation(line: 174, column: 13, scope: !207)
!231 = !DILocation(line: 175, column: 1, scope: !207)
!232 = distinct !DISubprogram(name: "goodB2GSink", scope: !15, file: !15, line: 126, type: !22, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!233 = !DILocalVariable(name: "data", arg: 1, scope: !232, file: !15, line: 126, type: !7)
!234 = !DILocation(line: 126, column: 29, scope: !232)
!235 = !DILocalVariable(name: "i", scope: !236, file: !15, line: 129, type: !7)
!236 = distinct !DILexicalBlock(scope: !232, file: !15, line: 128, column: 5)
!237 = !DILocation(line: 129, column: 13, scope: !236)
!238 = !DILocalVariable(name: "buffer", scope: !236, file: !15, line: 130, type: !6)
!239 = !DILocation(line: 130, column: 15, scope: !236)
!240 = !DILocation(line: 130, column: 31, scope: !236)
!241 = !DILocation(line: 130, column: 24, scope: !236)
!242 = !DILocation(line: 131, column: 13, scope: !243)
!243 = distinct !DILexicalBlock(scope: !236, file: !15, line: 131, column: 13)
!244 = !DILocation(line: 131, column: 20, scope: !243)
!245 = !DILocation(line: 131, column: 13, scope: !236)
!246 = !DILocation(line: 131, column: 30, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !15, line: 131, column: 29)
!248 = !DILocation(line: 133, column: 16, scope: !249)
!249 = distinct !DILexicalBlock(scope: !236, file: !15, line: 133, column: 9)
!250 = !DILocation(line: 133, column: 14, scope: !249)
!251 = !DILocation(line: 133, column: 21, scope: !252)
!252 = distinct !DILexicalBlock(scope: !249, file: !15, line: 133, column: 9)
!253 = !DILocation(line: 133, column: 23, scope: !252)
!254 = !DILocation(line: 133, column: 9, scope: !249)
!255 = !DILocation(line: 135, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !15, line: 134, column: 9)
!257 = !DILocation(line: 135, column: 20, scope: !256)
!258 = !DILocation(line: 135, column: 23, scope: !256)
!259 = !DILocation(line: 136, column: 9, scope: !256)
!260 = !DILocation(line: 133, column: 30, scope: !252)
!261 = !DILocation(line: 133, column: 9, scope: !252)
!262 = distinct !{!262, !254, !263, !81}
!263 = !DILocation(line: 136, column: 9, scope: !249)
!264 = !DILocation(line: 138, column: 13, scope: !265)
!265 = distinct !DILexicalBlock(scope: !236, file: !15, line: 138, column: 13)
!266 = !DILocation(line: 138, column: 18, scope: !265)
!267 = !DILocation(line: 138, column: 23, scope: !265)
!268 = !DILocation(line: 138, column: 26, scope: !265)
!269 = !DILocation(line: 138, column: 31, scope: !265)
!270 = !DILocation(line: 138, column: 13, scope: !236)
!271 = !DILocation(line: 140, column: 13, scope: !272)
!272 = distinct !DILexicalBlock(scope: !265, file: !15, line: 139, column: 9)
!273 = !DILocation(line: 140, column: 20, scope: !272)
!274 = !DILocation(line: 140, column: 26, scope: !272)
!275 = !DILocation(line: 142, column: 19, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !15, line: 142, column: 13)
!277 = !DILocation(line: 142, column: 17, scope: !276)
!278 = !DILocation(line: 142, column: 24, scope: !279)
!279 = distinct !DILexicalBlock(scope: !276, file: !15, line: 142, column: 13)
!280 = !DILocation(line: 142, column: 26, scope: !279)
!281 = !DILocation(line: 142, column: 13, scope: !276)
!282 = !DILocation(line: 144, column: 30, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !15, line: 143, column: 13)
!284 = !DILocation(line: 144, column: 37, scope: !283)
!285 = !DILocation(line: 144, column: 17, scope: !283)
!286 = !DILocation(line: 145, column: 13, scope: !283)
!287 = !DILocation(line: 142, column: 33, scope: !279)
!288 = !DILocation(line: 142, column: 13, scope: !279)
!289 = distinct !{!289, !281, !290, !81}
!290 = !DILocation(line: 145, column: 13, scope: !276)
!291 = !DILocation(line: 146, column: 9, scope: !272)
!292 = !DILocation(line: 149, column: 13, scope: !293)
!293 = distinct !DILexicalBlock(scope: !265, file: !15, line: 148, column: 9)
!294 = !DILocation(line: 151, column: 14, scope: !236)
!295 = !DILocation(line: 151, column: 9, scope: !236)
!296 = !DILocation(line: 153, column: 1, scope: !232)
