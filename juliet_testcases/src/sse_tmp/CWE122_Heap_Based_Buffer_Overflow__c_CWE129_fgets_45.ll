; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_badData = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_goodG2BData = internal global i32 0, align 4, !dbg !11
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_goodB2GData = internal global i32 0, align 4, !dbg !14
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 -1, i32* %data, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !28, metadata !DIExpression()), !dbg !34
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !34
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !35
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !37
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !38
  %cmp = icmp ne i8* %call, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.else, !dbg !40

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !41
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !43
  store i32 %call2, i32* %data, align 4, !dbg !44
  br label %if.end, !dbg !45

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !48
  store i32 %2, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_badData, align 4, !dbg !49
  call void @badSink(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  call void @goodB2G(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #8, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #8, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !75 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_badData, align 4, !dbg !78
  store i32 %0, i32* %data, align 4, !dbg !77
  call void @llvm.dbg.declare(metadata i32* %i, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !84
  %1 = bitcast i8* %call to i32*, !dbg !85
  store i32* %1, i32** %buffer, align 8, !dbg !83
  %2 = load i32*, i32** %buffer, align 8, !dbg !86
  %cmp = icmp eq i32* %2, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !95
  %cmp1 = icmp slt i32 %3, 10, !dbg !97
  br i1 %cmp1, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !99
  %5 = load i32, i32* %i, align 4, !dbg !101
  %idxprom = sext i32 %5 to i64, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !104
  %inc = add nsw i32 %6, 1, !dbg !104
  store i32 %inc, i32* %i, align 4, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !109
  %cmp2 = icmp sge i32 %7, 0, !dbg !111
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !112

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !113
  %9 = load i32, i32* %data, align 4, !dbg !115
  %idxprom4 = sext i32 %9 to i64, !dbg !113
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !113
  store i32 1, i32* %arrayidx5, align 4, !dbg !116
  store i32 0, i32* %i, align 4, !dbg !117
  br label %for.cond6, !dbg !119

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !120
  %cmp7 = icmp slt i32 %10, 10, !dbg !122
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !123

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !124
  %12 = load i32, i32* %i, align 4, !dbg !126
  %idxprom9 = sext i32 %12 to i64, !dbg !124
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !124
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !124
  call void @printIntLine(i32 %13), !dbg !127
  br label %for.inc11, !dbg !128

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !129
  %inc12 = add nsw i32 %14, 1, !dbg !129
  store i32 %inc12, i32* %i, align 4, !dbg !129
  br label %for.cond6, !dbg !130, !llvm.loop !131

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !133

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !134
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !136
  %16 = bitcast i32* %15 to i8*, !dbg !136
  call void @free(i8* %16) #8, !dbg !137
  ret void, !dbg !138
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !139 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !140, metadata !DIExpression()), !dbg !141
  store i32 -1, i32* %data, align 4, !dbg !142
  store i32 7, i32* %data, align 4, !dbg !143
  %0 = load i32, i32* %data, align 4, !dbg !144
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_goodG2BData, align 4, !dbg !145
  call void @goodG2BSink(), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_goodG2BData, align 4, !dbg !151
  store i32 %0, i32* %data, align 4, !dbg !150
  call void @llvm.dbg.declare(metadata i32* %i, metadata !152, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !155, metadata !DIExpression()), !dbg !156
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !157
  %1 = bitcast i8* %call to i32*, !dbg !158
  store i32* %1, i32** %buffer, align 8, !dbg !156
  %2 = load i32*, i32** %buffer, align 8, !dbg !159
  %cmp = icmp eq i32* %2, null, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !168
  %cmp1 = icmp slt i32 %3, 10, !dbg !170
  br i1 %cmp1, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !172
  %5 = load i32, i32* %i, align 4, !dbg !174
  %idxprom = sext i32 %5 to i64, !dbg !172
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !172
  store i32 0, i32* %arrayidx, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !177
  %inc = add nsw i32 %6, 1, !dbg !177
  store i32 %inc, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !181
  %cmp2 = icmp sge i32 %7, 0, !dbg !183
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !184

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !185
  %9 = load i32, i32* %data, align 4, !dbg !187
  %idxprom4 = sext i32 %9 to i64, !dbg !185
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !185
  store i32 1, i32* %arrayidx5, align 4, !dbg !188
  store i32 0, i32* %i, align 4, !dbg !189
  br label %for.cond6, !dbg !191

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !192
  %cmp7 = icmp slt i32 %10, 10, !dbg !194
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !195

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !196
  %12 = load i32, i32* %i, align 4, !dbg !198
  %idxprom9 = sext i32 %12 to i64, !dbg !196
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !196
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !196
  call void @printIntLine(i32 %13), !dbg !199
  br label %for.inc11, !dbg !200

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !201
  %inc12 = add nsw i32 %14, 1, !dbg !201
  store i32 %inc12, i32* %i, align 4, !dbg !201
  br label %for.cond6, !dbg !202, !llvm.loop !203

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !205

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !206
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !208
  %16 = bitcast i32* %15 to i8*, !dbg !208
  call void @free(i8* %16) #8, !dbg !209
  ret void, !dbg !210
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !211 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 -1, i32* %data, align 4, !dbg !214
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !215, metadata !DIExpression()), !dbg !217
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !217
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !217
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !218
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !220
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !221
  %cmp = icmp ne i8* %call, null, !dbg !222
  br i1 %cmp, label %if.then, label %if.else, !dbg !223

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !224
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !226
  store i32 %call2, i32* %data, align 4, !dbg !227
  br label %if.end, !dbg !228

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !229
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !231
  store i32 %2, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_goodB2GData, align 4, !dbg !232
  call void @goodB2GSink(), !dbg !233
  ret void, !dbg !234
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !235 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !236, metadata !DIExpression()), !dbg !237
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_goodB2GData, align 4, !dbg !238
  store i32 %0, i32* %data, align 4, !dbg !237
  call void @llvm.dbg.declare(metadata i32* %i, metadata !239, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !242, metadata !DIExpression()), !dbg !243
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !244
  %1 = bitcast i8* %call to i32*, !dbg !245
  store i32* %1, i32** %buffer, align 8, !dbg !243
  %2 = load i32*, i32** %buffer, align 8, !dbg !246
  %cmp = icmp eq i32* %2, null, !dbg !248
  br i1 %cmp, label %if.then, label %if.end, !dbg !249

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !250
  unreachable, !dbg !250

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !252
  br label %for.cond, !dbg !254

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !255
  %cmp1 = icmp slt i32 %3, 10, !dbg !257
  br i1 %cmp1, label %for.body, label %for.end, !dbg !258

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !259
  %5 = load i32, i32* %i, align 4, !dbg !261
  %idxprom = sext i32 %5 to i64, !dbg !259
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !259
  store i32 0, i32* %arrayidx, align 4, !dbg !262
  br label %for.inc, !dbg !263

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !264
  %inc = add nsw i32 %6, 1, !dbg !264
  store i32 %inc, i32* %i, align 4, !dbg !264
  br label %for.cond, !dbg !265, !llvm.loop !266

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !268
  %cmp2 = icmp sge i32 %7, 0, !dbg !270
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !271

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !272
  %cmp3 = icmp slt i32 %8, 10, !dbg !273
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !274

if.then4:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !275
  %10 = load i32, i32* %data, align 4, !dbg !277
  %idxprom5 = sext i32 %10 to i64, !dbg !275
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !275
  store i32 1, i32* %arrayidx6, align 4, !dbg !278
  store i32 0, i32* %i, align 4, !dbg !279
  br label %for.cond7, !dbg !281

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !282
  %cmp8 = icmp slt i32 %11, 10, !dbg !284
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !285

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !286
  %13 = load i32, i32* %i, align 4, !dbg !288
  %idxprom10 = sext i32 %13 to i64, !dbg !286
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !286
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !286
  call void @printIntLine(i32 %14), !dbg !289
  br label %for.inc12, !dbg !290

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !291
  %inc13 = add nsw i32 %15, 1, !dbg !291
  store i32 %inc13, i32* %i, align 4, !dbg !291
  br label %for.cond7, !dbg !292, !llvm.loop !293

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !295

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !296
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !298
  %17 = bitcast i32* %16 to i8*, !dbg !298
  call void @free(i8* %17) #8, !dbg !299
  ret void, !dbg !300
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_badData", scope: !2, file: !13, line: 22, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!0, !11, !14}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_goodG2BData", scope: !2, file: !13, line: 23, type: !9, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_goodB2GData", scope: !2, file: !13, line: 24, type: !9, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_bad", scope: !13, file: !13, line: 59, type: !23, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 61, type: !9)
!26 = !DILocation(line: 61, column: 9, scope: !22)
!27 = !DILocation(line: 63, column: 10, scope: !22)
!28 = !DILocalVariable(name: "inputBuffer", scope: !29, file: !13, line: 65, type: !30)
!29 = distinct !DILexicalBlock(scope: !22, file: !13, line: 64, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 112, elements: !32)
!31 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!32 = !{!33}
!33 = !DISubrange(count: 14)
!34 = !DILocation(line: 65, column: 14, scope: !29)
!35 = !DILocation(line: 67, column: 19, scope: !36)
!36 = distinct !DILexicalBlock(scope: !29, file: !13, line: 67, column: 13)
!37 = !DILocation(line: 67, column: 49, scope: !36)
!38 = !DILocation(line: 67, column: 13, scope: !36)
!39 = !DILocation(line: 67, column: 56, scope: !36)
!40 = !DILocation(line: 67, column: 13, scope: !29)
!41 = !DILocation(line: 70, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !13, line: 68, column: 9)
!43 = !DILocation(line: 70, column: 20, scope: !42)
!44 = !DILocation(line: 70, column: 18, scope: !42)
!45 = !DILocation(line: 71, column: 9, scope: !42)
!46 = !DILocation(line: 74, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !13, line: 73, column: 9)
!48 = !DILocation(line: 77, column: 68, scope: !22)
!49 = !DILocation(line: 77, column: 66, scope: !22)
!50 = !DILocation(line: 78, column: 5, scope: !22)
!51 = !DILocation(line: 79, column: 1, scope: !22)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_45_good", scope: !13, file: !13, line: 182, type: !23, scopeLine: 183, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 184, column: 5, scope: !52)
!54 = !DILocation(line: 185, column: 5, scope: !52)
!55 = !DILocation(line: 186, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 196, type: !57, scopeLine: 197, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!9, !9, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !13, line: 196, type: !9)
!62 = !DILocation(line: 196, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !13, line: 196, type: !59)
!64 = !DILocation(line: 196, column: 27, scope: !56)
!65 = !DILocation(line: 199, column: 22, scope: !56)
!66 = !DILocation(line: 199, column: 12, scope: !56)
!67 = !DILocation(line: 199, column: 5, scope: !56)
!68 = !DILocation(line: 201, column: 5, scope: !56)
!69 = !DILocation(line: 202, column: 5, scope: !56)
!70 = !DILocation(line: 203, column: 5, scope: !56)
!71 = !DILocation(line: 206, column: 5, scope: !56)
!72 = !DILocation(line: 207, column: 5, scope: !56)
!73 = !DILocation(line: 208, column: 5, scope: !56)
!74 = !DILocation(line: 210, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !13, line: 30, type: !9)
!77 = !DILocation(line: 30, column: 9, scope: !75)
!78 = !DILocation(line: 30, column: 16, scope: !75)
!79 = !DILocalVariable(name: "i", scope: !80, file: !13, line: 32, type: !9)
!80 = distinct !DILexicalBlock(scope: !75, file: !13, line: 31, column: 5)
!81 = !DILocation(line: 32, column: 13, scope: !80)
!82 = !DILocalVariable(name: "buffer", scope: !80, file: !13, line: 33, type: !8)
!83 = !DILocation(line: 33, column: 15, scope: !80)
!84 = !DILocation(line: 33, column: 31, scope: !80)
!85 = !DILocation(line: 33, column: 24, scope: !80)
!86 = !DILocation(line: 34, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !13, line: 34, column: 13)
!88 = !DILocation(line: 34, column: 20, scope: !87)
!89 = !DILocation(line: 34, column: 13, scope: !80)
!90 = !DILocation(line: 34, column: 30, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !13, line: 34, column: 29)
!92 = !DILocation(line: 36, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !80, file: !13, line: 36, column: 9)
!94 = !DILocation(line: 36, column: 14, scope: !93)
!95 = !DILocation(line: 36, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !13, line: 36, column: 9)
!97 = !DILocation(line: 36, column: 23, scope: !96)
!98 = !DILocation(line: 36, column: 9, scope: !93)
!99 = !DILocation(line: 38, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !13, line: 37, column: 9)
!101 = !DILocation(line: 38, column: 20, scope: !100)
!102 = !DILocation(line: 38, column: 23, scope: !100)
!103 = !DILocation(line: 39, column: 9, scope: !100)
!104 = !DILocation(line: 36, column: 30, scope: !96)
!105 = !DILocation(line: 36, column: 9, scope: !96)
!106 = distinct !{!106, !98, !107, !108}
!107 = !DILocation(line: 39, column: 9, scope: !93)
!108 = !{!"llvm.loop.mustprogress"}
!109 = !DILocation(line: 42, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !80, file: !13, line: 42, column: 13)
!111 = !DILocation(line: 42, column: 18, scope: !110)
!112 = !DILocation(line: 42, column: 13, scope: !80)
!113 = !DILocation(line: 44, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !13, line: 43, column: 9)
!115 = !DILocation(line: 44, column: 20, scope: !114)
!116 = !DILocation(line: 44, column: 26, scope: !114)
!117 = !DILocation(line: 46, column: 19, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !13, line: 46, column: 13)
!119 = !DILocation(line: 46, column: 17, scope: !118)
!120 = !DILocation(line: 46, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !13, line: 46, column: 13)
!122 = !DILocation(line: 46, column: 26, scope: !121)
!123 = !DILocation(line: 46, column: 13, scope: !118)
!124 = !DILocation(line: 48, column: 30, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !13, line: 47, column: 13)
!126 = !DILocation(line: 48, column: 37, scope: !125)
!127 = !DILocation(line: 48, column: 17, scope: !125)
!128 = !DILocation(line: 49, column: 13, scope: !125)
!129 = !DILocation(line: 46, column: 33, scope: !121)
!130 = !DILocation(line: 46, column: 13, scope: !121)
!131 = distinct !{!131, !123, !132, !108}
!132 = !DILocation(line: 49, column: 13, scope: !118)
!133 = !DILocation(line: 50, column: 9, scope: !114)
!134 = !DILocation(line: 53, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !110, file: !13, line: 52, column: 9)
!136 = !DILocation(line: 55, column: 14, scope: !80)
!137 = !DILocation(line: 55, column: 9, scope: !80)
!138 = !DILocation(line: 57, column: 1, scope: !75)
!139 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 117, type: !23, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", scope: !139, file: !13, line: 119, type: !9)
!141 = !DILocation(line: 119, column: 9, scope: !139)
!142 = !DILocation(line: 121, column: 10, scope: !139)
!143 = !DILocation(line: 124, column: 10, scope: !139)
!144 = !DILocation(line: 125, column: 72, scope: !139)
!145 = !DILocation(line: 125, column: 70, scope: !139)
!146 = !DILocation(line: 126, column: 5, scope: !139)
!147 = !DILocation(line: 127, column: 1, scope: !139)
!148 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 86, type: !23, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DILocalVariable(name: "data", scope: !148, file: !13, line: 88, type: !9)
!150 = !DILocation(line: 88, column: 9, scope: !148)
!151 = !DILocation(line: 88, column: 16, scope: !148)
!152 = !DILocalVariable(name: "i", scope: !153, file: !13, line: 90, type: !9)
!153 = distinct !DILexicalBlock(scope: !148, file: !13, line: 89, column: 5)
!154 = !DILocation(line: 90, column: 13, scope: !153)
!155 = !DILocalVariable(name: "buffer", scope: !153, file: !13, line: 91, type: !8)
!156 = !DILocation(line: 91, column: 15, scope: !153)
!157 = !DILocation(line: 91, column: 31, scope: !153)
!158 = !DILocation(line: 91, column: 24, scope: !153)
!159 = !DILocation(line: 92, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !13, line: 92, column: 13)
!161 = !DILocation(line: 92, column: 20, scope: !160)
!162 = !DILocation(line: 92, column: 13, scope: !153)
!163 = !DILocation(line: 92, column: 30, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !13, line: 92, column: 29)
!165 = !DILocation(line: 94, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !153, file: !13, line: 94, column: 9)
!167 = !DILocation(line: 94, column: 14, scope: !166)
!168 = !DILocation(line: 94, column: 21, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !13, line: 94, column: 9)
!170 = !DILocation(line: 94, column: 23, scope: !169)
!171 = !DILocation(line: 94, column: 9, scope: !166)
!172 = !DILocation(line: 96, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !13, line: 95, column: 9)
!174 = !DILocation(line: 96, column: 20, scope: !173)
!175 = !DILocation(line: 96, column: 23, scope: !173)
!176 = !DILocation(line: 97, column: 9, scope: !173)
!177 = !DILocation(line: 94, column: 30, scope: !169)
!178 = !DILocation(line: 94, column: 9, scope: !169)
!179 = distinct !{!179, !171, !180, !108}
!180 = !DILocation(line: 97, column: 9, scope: !166)
!181 = !DILocation(line: 100, column: 13, scope: !182)
!182 = distinct !DILexicalBlock(scope: !153, file: !13, line: 100, column: 13)
!183 = !DILocation(line: 100, column: 18, scope: !182)
!184 = !DILocation(line: 100, column: 13, scope: !153)
!185 = !DILocation(line: 102, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !13, line: 101, column: 9)
!187 = !DILocation(line: 102, column: 20, scope: !186)
!188 = !DILocation(line: 102, column: 26, scope: !186)
!189 = !DILocation(line: 104, column: 19, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !13, line: 104, column: 13)
!191 = !DILocation(line: 104, column: 17, scope: !190)
!192 = !DILocation(line: 104, column: 24, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !13, line: 104, column: 13)
!194 = !DILocation(line: 104, column: 26, scope: !193)
!195 = !DILocation(line: 104, column: 13, scope: !190)
!196 = !DILocation(line: 106, column: 30, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !13, line: 105, column: 13)
!198 = !DILocation(line: 106, column: 37, scope: !197)
!199 = !DILocation(line: 106, column: 17, scope: !197)
!200 = !DILocation(line: 107, column: 13, scope: !197)
!201 = !DILocation(line: 104, column: 33, scope: !193)
!202 = !DILocation(line: 104, column: 13, scope: !193)
!203 = distinct !{!203, !195, !204, !108}
!204 = !DILocation(line: 107, column: 13, scope: !190)
!205 = !DILocation(line: 108, column: 9, scope: !186)
!206 = !DILocation(line: 111, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !182, file: !13, line: 110, column: 9)
!208 = !DILocation(line: 113, column: 14, scope: !153)
!209 = !DILocation(line: 113, column: 9, scope: !153)
!210 = !DILocation(line: 115, column: 1, scope: !148)
!211 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 160, type: !23, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!212 = !DILocalVariable(name: "data", scope: !211, file: !13, line: 162, type: !9)
!213 = !DILocation(line: 162, column: 9, scope: !211)
!214 = !DILocation(line: 164, column: 10, scope: !211)
!215 = !DILocalVariable(name: "inputBuffer", scope: !216, file: !13, line: 166, type: !30)
!216 = distinct !DILexicalBlock(scope: !211, file: !13, line: 165, column: 5)
!217 = !DILocation(line: 166, column: 14, scope: !216)
!218 = !DILocation(line: 168, column: 19, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !13, line: 168, column: 13)
!220 = !DILocation(line: 168, column: 49, scope: !219)
!221 = !DILocation(line: 168, column: 13, scope: !219)
!222 = !DILocation(line: 168, column: 56, scope: !219)
!223 = !DILocation(line: 168, column: 13, scope: !216)
!224 = !DILocation(line: 171, column: 25, scope: !225)
!225 = distinct !DILexicalBlock(scope: !219, file: !13, line: 169, column: 9)
!226 = !DILocation(line: 171, column: 20, scope: !225)
!227 = !DILocation(line: 171, column: 18, scope: !225)
!228 = !DILocation(line: 172, column: 9, scope: !225)
!229 = !DILocation(line: 175, column: 13, scope: !230)
!230 = distinct !DILexicalBlock(scope: !219, file: !13, line: 174, column: 9)
!231 = !DILocation(line: 178, column: 72, scope: !211)
!232 = !DILocation(line: 178, column: 70, scope: !211)
!233 = !DILocation(line: 179, column: 5, scope: !211)
!234 = !DILocation(line: 180, column: 1, scope: !211)
!235 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 130, type: !23, scopeLine: 131, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!236 = !DILocalVariable(name: "data", scope: !235, file: !13, line: 132, type: !9)
!237 = !DILocation(line: 132, column: 9, scope: !235)
!238 = !DILocation(line: 132, column: 16, scope: !235)
!239 = !DILocalVariable(name: "i", scope: !240, file: !13, line: 134, type: !9)
!240 = distinct !DILexicalBlock(scope: !235, file: !13, line: 133, column: 5)
!241 = !DILocation(line: 134, column: 13, scope: !240)
!242 = !DILocalVariable(name: "buffer", scope: !240, file: !13, line: 135, type: !8)
!243 = !DILocation(line: 135, column: 15, scope: !240)
!244 = !DILocation(line: 135, column: 31, scope: !240)
!245 = !DILocation(line: 135, column: 24, scope: !240)
!246 = !DILocation(line: 136, column: 13, scope: !247)
!247 = distinct !DILexicalBlock(scope: !240, file: !13, line: 136, column: 13)
!248 = !DILocation(line: 136, column: 20, scope: !247)
!249 = !DILocation(line: 136, column: 13, scope: !240)
!250 = !DILocation(line: 136, column: 30, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !13, line: 136, column: 29)
!252 = !DILocation(line: 138, column: 16, scope: !253)
!253 = distinct !DILexicalBlock(scope: !240, file: !13, line: 138, column: 9)
!254 = !DILocation(line: 138, column: 14, scope: !253)
!255 = !DILocation(line: 138, column: 21, scope: !256)
!256 = distinct !DILexicalBlock(scope: !253, file: !13, line: 138, column: 9)
!257 = !DILocation(line: 138, column: 23, scope: !256)
!258 = !DILocation(line: 138, column: 9, scope: !253)
!259 = !DILocation(line: 140, column: 13, scope: !260)
!260 = distinct !DILexicalBlock(scope: !256, file: !13, line: 139, column: 9)
!261 = !DILocation(line: 140, column: 20, scope: !260)
!262 = !DILocation(line: 140, column: 23, scope: !260)
!263 = !DILocation(line: 141, column: 9, scope: !260)
!264 = !DILocation(line: 138, column: 30, scope: !256)
!265 = !DILocation(line: 138, column: 9, scope: !256)
!266 = distinct !{!266, !258, !267, !108}
!267 = !DILocation(line: 141, column: 9, scope: !253)
!268 = !DILocation(line: 143, column: 13, scope: !269)
!269 = distinct !DILexicalBlock(scope: !240, file: !13, line: 143, column: 13)
!270 = !DILocation(line: 143, column: 18, scope: !269)
!271 = !DILocation(line: 143, column: 23, scope: !269)
!272 = !DILocation(line: 143, column: 26, scope: !269)
!273 = !DILocation(line: 143, column: 31, scope: !269)
!274 = !DILocation(line: 143, column: 13, scope: !240)
!275 = !DILocation(line: 145, column: 13, scope: !276)
!276 = distinct !DILexicalBlock(scope: !269, file: !13, line: 144, column: 9)
!277 = !DILocation(line: 145, column: 20, scope: !276)
!278 = !DILocation(line: 145, column: 26, scope: !276)
!279 = !DILocation(line: 147, column: 19, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !13, line: 147, column: 13)
!281 = !DILocation(line: 147, column: 17, scope: !280)
!282 = !DILocation(line: 147, column: 24, scope: !283)
!283 = distinct !DILexicalBlock(scope: !280, file: !13, line: 147, column: 13)
!284 = !DILocation(line: 147, column: 26, scope: !283)
!285 = !DILocation(line: 147, column: 13, scope: !280)
!286 = !DILocation(line: 149, column: 30, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !13, line: 148, column: 13)
!288 = !DILocation(line: 149, column: 37, scope: !287)
!289 = !DILocation(line: 149, column: 17, scope: !287)
!290 = !DILocation(line: 150, column: 13, scope: !287)
!291 = !DILocation(line: 147, column: 33, scope: !283)
!292 = !DILocation(line: 147, column: 13, scope: !283)
!293 = distinct !{!293, !285, !294, !108}
!294 = !DILocation(line: 150, column: 13, scope: !280)
!295 = !DILocation(line: 151, column: 9, scope: !276)
!296 = !DILocation(line: 154, column: 13, scope: !297)
!297 = distinct !DILexicalBlock(scope: !269, file: !13, line: 153, column: 9)
!298 = !DILocation(line: 156, column: 14, scope: !240)
!299 = !DILocation(line: 156, column: 9, scope: !240)
!300 = !DILocation(line: 158, column: 1, scope: !235)
