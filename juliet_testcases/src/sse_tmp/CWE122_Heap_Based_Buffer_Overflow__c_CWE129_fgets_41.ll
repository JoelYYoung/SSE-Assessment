; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  %2 = load i32, i32* %data, align 4, !dbg !41
  call void @badSink(i32 %2), !dbg !42
  ret void, !dbg !43
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
define internal void @badSink(i32 %data) #0 !dbg !44 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %i, metadata !49, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !54
  %0 = bitcast i8* %call to i32*, !dbg !55
  store i32* %0, i32** %buffer, align 8, !dbg !53
  %1 = load i32*, i32** %buffer, align 8, !dbg !56
  %cmp = icmp eq i32* %1, null, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !60
  unreachable, !dbg !60

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !65
  %cmp1 = icmp slt i32 %2, 10, !dbg !67
  br i1 %cmp1, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !69
  %4 = load i32, i32* %i, align 4, !dbg !71
  %idxprom = sext i32 %4 to i64, !dbg !69
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !69
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !74
  %inc = add nsw i32 %5, 1, !dbg !74
  store i32 %inc, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !79
  %cmp2 = icmp sge i32 %6, 0, !dbg !81
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !82

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !83
  %8 = load i32, i32* %data.addr, align 4, !dbg !85
  %idxprom4 = sext i32 %8 to i64, !dbg !83
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !83
  store i32 1, i32* %arrayidx5, align 4, !dbg !86
  store i32 0, i32* %i, align 4, !dbg !87
  br label %for.cond6, !dbg !89

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !90
  %cmp7 = icmp slt i32 %9, 10, !dbg !92
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !93

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !94
  %11 = load i32, i32* %i, align 4, !dbg !96
  %idxprom9 = sext i32 %11 to i64, !dbg !94
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !94
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !94
  call void @printIntLine(i32 %12), !dbg !97
  br label %for.inc11, !dbg !98

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !99
  %inc12 = add nsw i32 %13, 1, !dbg !99
  store i32 %inc12, i32* %i, align 4, !dbg !99
  br label %for.cond6, !dbg !100, !llvm.loop !101

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !103

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !104
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !106
  %15 = bitcast i32* %14 to i8*, !dbg !106
  call void @free(i8* %15) #8, !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41_good() #0 !dbg !109 {
entry:
  call void @goodB2G(), !dbg !110
  call void @goodG2B(), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !120, metadata !DIExpression()), !dbg !121
  %call = call i64 @time(i64* null) #8, !dbg !122
  %conv = trunc i64 %call to i32, !dbg !123
  call void @srand(i32 %conv) #8, !dbg !124
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !125
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41_good(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !128
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41_bad(), !dbg !129
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !130
  ret i32 0, !dbg !131
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
define internal void @goodB2G() #0 !dbg !132 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !133, metadata !DIExpression()), !dbg !134
  store i32 -1, i32* %data, align 4, !dbg !135
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !136, metadata !DIExpression()), !dbg !138
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
  %2 = load i32, i32* %data, align 4, !dbg !152
  call void @goodB2GSink(i32 %2), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !155 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i32* %i, metadata !158, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !161, metadata !DIExpression()), !dbg !162
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !163
  %0 = bitcast i8* %call to i32*, !dbg !164
  store i32* %0, i32** %buffer, align 8, !dbg !162
  %1 = load i32*, i32** %buffer, align 8, !dbg !165
  %cmp = icmp eq i32* %1, null, !dbg !167
  br i1 %cmp, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !169
  unreachable, !dbg !169

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !174
  %cmp1 = icmp slt i32 %2, 10, !dbg !176
  br i1 %cmp1, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !178
  %4 = load i32, i32* %i, align 4, !dbg !180
  %idxprom = sext i32 %4 to i64, !dbg !178
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !178
  store i32 0, i32* %arrayidx, align 4, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !183
  %inc = add nsw i32 %5, 1, !dbg !183
  store i32 %inc, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !187
  %cmp2 = icmp sge i32 %6, 0, !dbg !189
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !190

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !191
  %cmp3 = icmp slt i32 %7, 10, !dbg !192
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !193

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !194
  %9 = load i32, i32* %data.addr, align 4, !dbg !196
  %idxprom5 = sext i32 %9 to i64, !dbg !194
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !194
  store i32 1, i32* %arrayidx6, align 4, !dbg !197
  store i32 0, i32* %i, align 4, !dbg !198
  br label %for.cond7, !dbg !200

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !201
  %cmp8 = icmp slt i32 %10, 10, !dbg !203
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !204

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !205
  %12 = load i32, i32* %i, align 4, !dbg !207
  %idxprom10 = sext i32 %12 to i64, !dbg !205
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !205
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !205
  call void @printIntLine(i32 %13), !dbg !208
  br label %for.inc12, !dbg !209

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !210
  %inc13 = add nsw i32 %14, 1, !dbg !210
  store i32 %inc13, i32* %i, align 4, !dbg !210
  br label %for.cond7, !dbg !211, !llvm.loop !212

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !214

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !215
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !217
  %16 = bitcast i32* %15 to i8*, !dbg !217
  call void @free(i8* %16) #8, !dbg !218
  ret void, !dbg !219
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !220 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !221, metadata !DIExpression()), !dbg !222
  store i32 -1, i32* %data, align 4, !dbg !223
  store i32 7, i32* %data, align 4, !dbg !224
  %0 = load i32, i32* %data, align 4, !dbg !225
  call void @goodG2BSink(i32 %0), !dbg !226
  ret void, !dbg !227
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !228 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !229, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32* %i, metadata !231, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !234, metadata !DIExpression()), !dbg !235
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !236
  %0 = bitcast i8* %call to i32*, !dbg !237
  store i32* %0, i32** %buffer, align 8, !dbg !235
  %1 = load i32*, i32** %buffer, align 8, !dbg !238
  %cmp = icmp eq i32* %1, null, !dbg !240
  br i1 %cmp, label %if.then, label %if.end, !dbg !241

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !242
  unreachable, !dbg !242

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !246

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !247
  %cmp1 = icmp slt i32 %2, 10, !dbg !249
  br i1 %cmp1, label %for.body, label %for.end, !dbg !250

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !251
  %4 = load i32, i32* %i, align 4, !dbg !253
  %idxprom = sext i32 %4 to i64, !dbg !251
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !251
  store i32 0, i32* %arrayidx, align 4, !dbg !254
  br label %for.inc, !dbg !255

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !256
  %inc = add nsw i32 %5, 1, !dbg !256
  store i32 %inc, i32* %i, align 4, !dbg !256
  br label %for.cond, !dbg !257, !llvm.loop !258

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !260
  %cmp2 = icmp sge i32 %6, 0, !dbg !262
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !263

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !264
  %8 = load i32, i32* %data.addr, align 4, !dbg !266
  %idxprom4 = sext i32 %8 to i64, !dbg !264
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !264
  store i32 1, i32* %arrayidx5, align 4, !dbg !267
  store i32 0, i32* %i, align 4, !dbg !268
  br label %for.cond6, !dbg !270

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !271
  %cmp7 = icmp slt i32 %9, 10, !dbg !273
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !274

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !275
  %11 = load i32, i32* %i, align 4, !dbg !277
  %idxprom9 = sext i32 %11 to i64, !dbg !275
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !275
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !275
  call void @printIntLine(i32 %12), !dbg !278
  br label %for.inc11, !dbg !279

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !280
  %inc12 = add nsw i32 %13, 1, !dbg !280
  store i32 %inc12, i32* %i, align 4, !dbg !280
  br label %for.cond6, !dbg !281, !llvm.loop !282

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !284

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !285
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !287
  %15 = bitcast i32* %14 to i8*, !dbg !287
  call void @free(i8* %15) #8, !dbg !288
  ret void, !dbg !289
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41_bad", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 56, type: !7)
!19 = !DILocation(line: 56, column: 9, scope: !14)
!20 = !DILocation(line: 58, column: 10, scope: !14)
!21 = !DILocalVariable(name: "inputBuffer", scope: !22, file: !15, line: 60, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 59, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 112, elements: !25)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!26}
!26 = !DISubrange(count: 14)
!27 = !DILocation(line: 60, column: 14, scope: !22)
!28 = !DILocation(line: 62, column: 19, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 62, column: 13)
!30 = !DILocation(line: 62, column: 49, scope: !29)
!31 = !DILocation(line: 62, column: 13, scope: !29)
!32 = !DILocation(line: 62, column: 56, scope: !29)
!33 = !DILocation(line: 62, column: 13, scope: !22)
!34 = !DILocation(line: 65, column: 25, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !15, line: 63, column: 9)
!36 = !DILocation(line: 65, column: 20, scope: !35)
!37 = !DILocation(line: 65, column: 18, scope: !35)
!38 = !DILocation(line: 66, column: 9, scope: !35)
!39 = !DILocation(line: 69, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !29, file: !15, line: 68, column: 9)
!41 = !DILocation(line: 72, column: 13, scope: !14)
!42 = !DILocation(line: 72, column: 5, scope: !14)
!43 = !DILocation(line: 73, column: 1, scope: !14)
!44 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 24, type: !45, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{null, !7}
!47 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !15, line: 24, type: !7)
!48 = !DILocation(line: 24, column: 25, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !50, file: !15, line: 27, type: !7)
!50 = distinct !DILexicalBlock(scope: !44, file: !15, line: 26, column: 5)
!51 = !DILocation(line: 27, column: 13, scope: !50)
!52 = !DILocalVariable(name: "buffer", scope: !50, file: !15, line: 28, type: !6)
!53 = !DILocation(line: 28, column: 15, scope: !50)
!54 = !DILocation(line: 28, column: 31, scope: !50)
!55 = !DILocation(line: 28, column: 24, scope: !50)
!56 = !DILocation(line: 29, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !50, file: !15, line: 29, column: 13)
!58 = !DILocation(line: 29, column: 20, scope: !57)
!59 = !DILocation(line: 29, column: 13, scope: !50)
!60 = !DILocation(line: 29, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 29, column: 29)
!62 = !DILocation(line: 31, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !50, file: !15, line: 31, column: 9)
!64 = !DILocation(line: 31, column: 14, scope: !63)
!65 = !DILocation(line: 31, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 31, column: 9)
!67 = !DILocation(line: 31, column: 23, scope: !66)
!68 = !DILocation(line: 31, column: 9, scope: !63)
!69 = !DILocation(line: 33, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 32, column: 9)
!71 = !DILocation(line: 33, column: 20, scope: !70)
!72 = !DILocation(line: 33, column: 23, scope: !70)
!73 = !DILocation(line: 34, column: 9, scope: !70)
!74 = !DILocation(line: 31, column: 30, scope: !66)
!75 = !DILocation(line: 31, column: 9, scope: !66)
!76 = distinct !{!76, !68, !77, !78}
!77 = !DILocation(line: 34, column: 9, scope: !63)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 37, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !50, file: !15, line: 37, column: 13)
!81 = !DILocation(line: 37, column: 18, scope: !80)
!82 = !DILocation(line: 37, column: 13, scope: !50)
!83 = !DILocation(line: 39, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 38, column: 9)
!85 = !DILocation(line: 39, column: 20, scope: !84)
!86 = !DILocation(line: 39, column: 26, scope: !84)
!87 = !DILocation(line: 41, column: 19, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 41, column: 13)
!89 = !DILocation(line: 41, column: 17, scope: !88)
!90 = !DILocation(line: 41, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !15, line: 41, column: 13)
!92 = !DILocation(line: 41, column: 26, scope: !91)
!93 = !DILocation(line: 41, column: 13, scope: !88)
!94 = !DILocation(line: 43, column: 30, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 42, column: 13)
!96 = !DILocation(line: 43, column: 37, scope: !95)
!97 = !DILocation(line: 43, column: 17, scope: !95)
!98 = !DILocation(line: 44, column: 13, scope: !95)
!99 = !DILocation(line: 41, column: 33, scope: !91)
!100 = !DILocation(line: 41, column: 13, scope: !91)
!101 = distinct !{!101, !93, !102, !78}
!102 = !DILocation(line: 44, column: 13, scope: !88)
!103 = !DILocation(line: 45, column: 9, scope: !84)
!104 = !DILocation(line: 48, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !80, file: !15, line: 47, column: 9)
!106 = !DILocation(line: 50, column: 14, scope: !50)
!107 = !DILocation(line: 50, column: 9, scope: !50)
!108 = !DILocation(line: 52, column: 1, scope: !44)
!109 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_41_good", scope: !15, file: !15, line: 172, type: !16, scopeLine: 173, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocation(line: 174, column: 5, scope: !109)
!111 = !DILocation(line: 175, column: 5, scope: !109)
!112 = !DILocation(line: 176, column: 1, scope: !109)
!113 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 187, type: !114, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DISubroutineType(types: !115)
!115 = !{!7, !7, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!118 = !DILocalVariable(name: "argc", arg: 1, scope: !113, file: !15, line: 187, type: !7)
!119 = !DILocation(line: 187, column: 14, scope: !113)
!120 = !DILocalVariable(name: "argv", arg: 2, scope: !113, file: !15, line: 187, type: !116)
!121 = !DILocation(line: 187, column: 27, scope: !113)
!122 = !DILocation(line: 190, column: 22, scope: !113)
!123 = !DILocation(line: 190, column: 12, scope: !113)
!124 = !DILocation(line: 190, column: 5, scope: !113)
!125 = !DILocation(line: 192, column: 5, scope: !113)
!126 = !DILocation(line: 193, column: 5, scope: !113)
!127 = !DILocation(line: 194, column: 5, scope: !113)
!128 = !DILocation(line: 197, column: 5, scope: !113)
!129 = !DILocation(line: 198, column: 5, scope: !113)
!130 = !DILocation(line: 199, column: 5, scope: !113)
!131 = !DILocation(line: 201, column: 5, scope: !113)
!132 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 151, type: !16, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocalVariable(name: "data", scope: !132, file: !15, line: 153, type: !7)
!134 = !DILocation(line: 153, column: 9, scope: !132)
!135 = !DILocation(line: 155, column: 10, scope: !132)
!136 = !DILocalVariable(name: "inputBuffer", scope: !137, file: !15, line: 157, type: !23)
!137 = distinct !DILexicalBlock(scope: !132, file: !15, line: 156, column: 5)
!138 = !DILocation(line: 157, column: 14, scope: !137)
!139 = !DILocation(line: 159, column: 19, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 159, column: 13)
!141 = !DILocation(line: 159, column: 49, scope: !140)
!142 = !DILocation(line: 159, column: 13, scope: !140)
!143 = !DILocation(line: 159, column: 56, scope: !140)
!144 = !DILocation(line: 159, column: 13, scope: !137)
!145 = !DILocation(line: 162, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !15, line: 160, column: 9)
!147 = !DILocation(line: 162, column: 20, scope: !146)
!148 = !DILocation(line: 162, column: 18, scope: !146)
!149 = !DILocation(line: 163, column: 9, scope: !146)
!150 = !DILocation(line: 166, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !140, file: !15, line: 165, column: 9)
!152 = !DILocation(line: 169, column: 17, scope: !132)
!153 = !DILocation(line: 169, column: 5, scope: !132)
!154 = !DILocation(line: 170, column: 1, scope: !132)
!155 = distinct !DISubprogram(name: "goodB2GSink", scope: !15, file: !15, line: 122, type: !45, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", arg: 1, scope: !155, file: !15, line: 122, type: !7)
!157 = !DILocation(line: 122, column: 29, scope: !155)
!158 = !DILocalVariable(name: "i", scope: !159, file: !15, line: 125, type: !7)
!159 = distinct !DILexicalBlock(scope: !155, file: !15, line: 124, column: 5)
!160 = !DILocation(line: 125, column: 13, scope: !159)
!161 = !DILocalVariable(name: "buffer", scope: !159, file: !15, line: 126, type: !6)
!162 = !DILocation(line: 126, column: 15, scope: !159)
!163 = !DILocation(line: 126, column: 31, scope: !159)
!164 = !DILocation(line: 126, column: 24, scope: !159)
!165 = !DILocation(line: 127, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !15, line: 127, column: 13)
!167 = !DILocation(line: 127, column: 20, scope: !166)
!168 = !DILocation(line: 127, column: 13, scope: !159)
!169 = !DILocation(line: 127, column: 30, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !15, line: 127, column: 29)
!171 = !DILocation(line: 129, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !159, file: !15, line: 129, column: 9)
!173 = !DILocation(line: 129, column: 14, scope: !172)
!174 = !DILocation(line: 129, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !15, line: 129, column: 9)
!176 = !DILocation(line: 129, column: 23, scope: !175)
!177 = !DILocation(line: 129, column: 9, scope: !172)
!178 = !DILocation(line: 131, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !15, line: 130, column: 9)
!180 = !DILocation(line: 131, column: 20, scope: !179)
!181 = !DILocation(line: 131, column: 23, scope: !179)
!182 = !DILocation(line: 132, column: 9, scope: !179)
!183 = !DILocation(line: 129, column: 30, scope: !175)
!184 = !DILocation(line: 129, column: 9, scope: !175)
!185 = distinct !{!185, !177, !186, !78}
!186 = !DILocation(line: 132, column: 9, scope: !172)
!187 = !DILocation(line: 134, column: 13, scope: !188)
!188 = distinct !DILexicalBlock(scope: !159, file: !15, line: 134, column: 13)
!189 = !DILocation(line: 134, column: 18, scope: !188)
!190 = !DILocation(line: 134, column: 23, scope: !188)
!191 = !DILocation(line: 134, column: 26, scope: !188)
!192 = !DILocation(line: 134, column: 31, scope: !188)
!193 = !DILocation(line: 134, column: 13, scope: !159)
!194 = !DILocation(line: 136, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !188, file: !15, line: 135, column: 9)
!196 = !DILocation(line: 136, column: 20, scope: !195)
!197 = !DILocation(line: 136, column: 26, scope: !195)
!198 = !DILocation(line: 138, column: 19, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !15, line: 138, column: 13)
!200 = !DILocation(line: 138, column: 17, scope: !199)
!201 = !DILocation(line: 138, column: 24, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !15, line: 138, column: 13)
!203 = !DILocation(line: 138, column: 26, scope: !202)
!204 = !DILocation(line: 138, column: 13, scope: !199)
!205 = !DILocation(line: 140, column: 30, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !15, line: 139, column: 13)
!207 = !DILocation(line: 140, column: 37, scope: !206)
!208 = !DILocation(line: 140, column: 17, scope: !206)
!209 = !DILocation(line: 141, column: 13, scope: !206)
!210 = !DILocation(line: 138, column: 33, scope: !202)
!211 = !DILocation(line: 138, column: 13, scope: !202)
!212 = distinct !{!212, !204, !213, !78}
!213 = !DILocation(line: 141, column: 13, scope: !199)
!214 = !DILocation(line: 142, column: 9, scope: !195)
!215 = !DILocation(line: 145, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !188, file: !15, line: 144, column: 9)
!217 = !DILocation(line: 147, column: 14, scope: !159)
!218 = !DILocation(line: 147, column: 9, scope: !159)
!219 = !DILocation(line: 149, column: 1, scope: !155)
!220 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 110, type: !16, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!221 = !DILocalVariable(name: "data", scope: !220, file: !15, line: 112, type: !7)
!222 = !DILocation(line: 112, column: 9, scope: !220)
!223 = !DILocation(line: 114, column: 10, scope: !220)
!224 = !DILocation(line: 117, column: 10, scope: !220)
!225 = !DILocation(line: 118, column: 17, scope: !220)
!226 = !DILocation(line: 118, column: 5, scope: !220)
!227 = !DILocation(line: 119, column: 1, scope: !220)
!228 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 80, type: !45, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!229 = !DILocalVariable(name: "data", arg: 1, scope: !228, file: !15, line: 80, type: !7)
!230 = !DILocation(line: 80, column: 29, scope: !228)
!231 = !DILocalVariable(name: "i", scope: !232, file: !15, line: 83, type: !7)
!232 = distinct !DILexicalBlock(scope: !228, file: !15, line: 82, column: 5)
!233 = !DILocation(line: 83, column: 13, scope: !232)
!234 = !DILocalVariable(name: "buffer", scope: !232, file: !15, line: 84, type: !6)
!235 = !DILocation(line: 84, column: 15, scope: !232)
!236 = !DILocation(line: 84, column: 31, scope: !232)
!237 = !DILocation(line: 84, column: 24, scope: !232)
!238 = !DILocation(line: 85, column: 13, scope: !239)
!239 = distinct !DILexicalBlock(scope: !232, file: !15, line: 85, column: 13)
!240 = !DILocation(line: 85, column: 20, scope: !239)
!241 = !DILocation(line: 85, column: 13, scope: !232)
!242 = !DILocation(line: 85, column: 30, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 85, column: 29)
!244 = !DILocation(line: 87, column: 16, scope: !245)
!245 = distinct !DILexicalBlock(scope: !232, file: !15, line: 87, column: 9)
!246 = !DILocation(line: 87, column: 14, scope: !245)
!247 = !DILocation(line: 87, column: 21, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !15, line: 87, column: 9)
!249 = !DILocation(line: 87, column: 23, scope: !248)
!250 = !DILocation(line: 87, column: 9, scope: !245)
!251 = !DILocation(line: 89, column: 13, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !15, line: 88, column: 9)
!253 = !DILocation(line: 89, column: 20, scope: !252)
!254 = !DILocation(line: 89, column: 23, scope: !252)
!255 = !DILocation(line: 90, column: 9, scope: !252)
!256 = !DILocation(line: 87, column: 30, scope: !248)
!257 = !DILocation(line: 87, column: 9, scope: !248)
!258 = distinct !{!258, !250, !259, !78}
!259 = !DILocation(line: 90, column: 9, scope: !245)
!260 = !DILocation(line: 93, column: 13, scope: !261)
!261 = distinct !DILexicalBlock(scope: !232, file: !15, line: 93, column: 13)
!262 = !DILocation(line: 93, column: 18, scope: !261)
!263 = !DILocation(line: 93, column: 13, scope: !232)
!264 = !DILocation(line: 95, column: 13, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !15, line: 94, column: 9)
!266 = !DILocation(line: 95, column: 20, scope: !265)
!267 = !DILocation(line: 95, column: 26, scope: !265)
!268 = !DILocation(line: 97, column: 19, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !15, line: 97, column: 13)
!270 = !DILocation(line: 97, column: 17, scope: !269)
!271 = !DILocation(line: 97, column: 24, scope: !272)
!272 = distinct !DILexicalBlock(scope: !269, file: !15, line: 97, column: 13)
!273 = !DILocation(line: 97, column: 26, scope: !272)
!274 = !DILocation(line: 97, column: 13, scope: !269)
!275 = !DILocation(line: 99, column: 30, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !15, line: 98, column: 13)
!277 = !DILocation(line: 99, column: 37, scope: !276)
!278 = !DILocation(line: 99, column: 17, scope: !276)
!279 = !DILocation(line: 100, column: 13, scope: !276)
!280 = !DILocation(line: 97, column: 33, scope: !272)
!281 = !DILocation(line: 97, column: 13, scope: !272)
!282 = distinct !{!282, !274, !283, !78}
!283 = !DILocation(line: 100, column: 13, scope: !269)
!284 = !DILocation(line: 101, column: 9, scope: !265)
!285 = !DILocation(line: 104, column: 13, scope: !286)
!286 = distinct !DILexicalBlock(scope: !261, file: !15, line: 103, column: 9)
!287 = !DILocation(line: 106, column: 14, scope: !232)
!288 = !DILocation(line: 106, column: 9, scope: !232)
!289 = !DILocation(line: 108, column: 1, scope: !228)
