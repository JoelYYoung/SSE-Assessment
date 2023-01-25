; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@globalFive = external dso_local global i32, align 4
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end5, !dbg !24

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !25, metadata !DIExpression()), !dbg !32
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !35
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !36
  %cmp1 = icmp ne i8* %call, null, !dbg !37
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !38

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !39
  %call4 = call i32 @atoi(i8* %arraydecay3) #7, !dbg !41
  store i32 %call4, i32* %data, align 4, !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !46

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFive, align 4, !dbg !47
  %cmp6 = icmp eq i32 %3, 5, !dbg !49
  br i1 %cmp6, label %if.then7, label %if.end27, !dbg !50

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !51, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !55, metadata !DIExpression()), !dbg !56
  %call8 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !57
  %4 = bitcast i8* %call8 to i32*, !dbg !58
  store i32* %4, i32** %buffer, align 8, !dbg !56
  %5 = load i32*, i32** %buffer, align 8, !dbg !59
  %cmp9 = icmp eq i32* %5, null, !dbg !61
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !62

if.then10:                                        ; preds = %if.then7
  call void @exit(i32 -1) #9, !dbg !63
  unreachable, !dbg !63

if.end11:                                         ; preds = %if.then7
  store i32 0, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end11
  %6 = load i32, i32* %i, align 4, !dbg !68
  %cmp12 = icmp slt i32 %6, 10, !dbg !70
  br i1 %cmp12, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !72
  %8 = load i32, i32* %i, align 4, !dbg !74
  %idxprom = sext i32 %8 to i64, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !77
  %inc = add nsw i32 %9, 1, !dbg !77
  store i32 %inc, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !82
  %cmp13 = icmp sge i32 %10, 0, !dbg !84
  br i1 %cmp13, label %if.then14, label %if.else25, !dbg !85

if.then14:                                        ; preds = %for.end
  %11 = load i32*, i32** %buffer, align 8, !dbg !86
  %12 = load i32, i32* %data, align 4, !dbg !88
  %idxprom15 = sext i32 %12 to i64, !dbg !86
  %arrayidx16 = getelementptr inbounds i32, i32* %11, i64 %idxprom15, !dbg !86
  store i32 1, i32* %arrayidx16, align 4, !dbg !89
  store i32 0, i32* %i, align 4, !dbg !90
  br label %for.cond17, !dbg !92

for.cond17:                                       ; preds = %for.inc22, %if.then14
  %13 = load i32, i32* %i, align 4, !dbg !93
  %cmp18 = icmp slt i32 %13, 10, !dbg !95
  br i1 %cmp18, label %for.body19, label %for.end24, !dbg !96

for.body19:                                       ; preds = %for.cond17
  %14 = load i32*, i32** %buffer, align 8, !dbg !97
  %15 = load i32, i32* %i, align 4, !dbg !99
  %idxprom20 = sext i32 %15 to i64, !dbg !97
  %arrayidx21 = getelementptr inbounds i32, i32* %14, i64 %idxprom20, !dbg !97
  %16 = load i32, i32* %arrayidx21, align 4, !dbg !97
  call void @printIntLine(i32 %16), !dbg !100
  br label %for.inc22, !dbg !101

for.inc22:                                        ; preds = %for.body19
  %17 = load i32, i32* %i, align 4, !dbg !102
  %inc23 = add nsw i32 %17, 1, !dbg !102
  store i32 %inc23, i32* %i, align 4, !dbg !102
  br label %for.cond17, !dbg !103, !llvm.loop !104

for.end24:                                        ; preds = %for.cond17
  br label %if.end26, !dbg !106

if.else25:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end24
  %18 = load i32*, i32** %buffer, align 8, !dbg !109
  %19 = bitcast i32* %18 to i8*, !dbg !109
  call void @free(i8* %19) #8, !dbg !110
  br label %if.end27, !dbg !111

if.end27:                                         ; preds = %if.end26, %if.end5
  ret void, !dbg !112
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14_good() #0 !dbg !113 {
entry:
  call void @goodB2G1(), !dbg !114
  call void @goodB2G2(), !dbg !115
  call void @goodG2B1(), !dbg !116
  call void @goodG2B2(), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !119 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !124, metadata !DIExpression()), !dbg !125
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !126, metadata !DIExpression()), !dbg !127
  %call = call i64 @time(i64* null) #8, !dbg !128
  %conv = trunc i64 %call to i32, !dbg !129
  call void @srand(i32 %conv) #8, !dbg !130
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !131
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14_good(), !dbg !132
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !134
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14_bad(), !dbg !135
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !136
  ret i32 0, !dbg !137
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !138 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !139, metadata !DIExpression()), !dbg !140
  store i32 -1, i32* %data, align 4, !dbg !141
  %0 = load i32, i32* @globalFive, align 4, !dbg !142
  %cmp = icmp eq i32 %0, 5, !dbg !144
  br i1 %cmp, label %if.then, label %if.end5, !dbg !145

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !146, metadata !DIExpression()), !dbg !149
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !149
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !150
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !152
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !153
  %cmp1 = icmp ne i8* %call, null, !dbg !154
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !155

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !156
  %call4 = call i32 @atoi(i8* %arraydecay3) #7, !dbg !158
  store i32 %call4, i32* %data, align 4, !dbg !159
  br label %if.end, !dbg !160

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !161
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !163

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFive, align 4, !dbg !164
  %cmp6 = icmp ne i32 %3, 5, !dbg !166
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !167

if.then7:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !168
  br label %if.end29, !dbg !170

if.else8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !171, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !175, metadata !DIExpression()), !dbg !176
  %call9 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !177
  %4 = bitcast i8* %call9 to i32*, !dbg !178
  store i32* %4, i32** %buffer, align 8, !dbg !176
  %5 = load i32*, i32** %buffer, align 8, !dbg !179
  %cmp10 = icmp eq i32* %5, null, !dbg !181
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !182

if.then11:                                        ; preds = %if.else8
  call void @exit(i32 -1) #9, !dbg !183
  unreachable, !dbg !183

if.end12:                                         ; preds = %if.else8
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end12
  %6 = load i32, i32* %i, align 4, !dbg !188
  %cmp13 = icmp slt i32 %6, 10, !dbg !190
  br i1 %cmp13, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !192
  %8 = load i32, i32* %i, align 4, !dbg !194
  %idxprom = sext i32 %8 to i64, !dbg !192
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !192
  store i32 0, i32* %arrayidx, align 4, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %9, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !201
  %cmp14 = icmp sge i32 %10, 0, !dbg !203
  br i1 %cmp14, label %land.lhs.true, label %if.else27, !dbg !204

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data, align 4, !dbg !205
  %cmp15 = icmp slt i32 %11, 10, !dbg !206
  br i1 %cmp15, label %if.then16, label %if.else27, !dbg !207

if.then16:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !208
  %13 = load i32, i32* %data, align 4, !dbg !210
  %idxprom17 = sext i32 %13 to i64, !dbg !208
  %arrayidx18 = getelementptr inbounds i32, i32* %12, i64 %idxprom17, !dbg !208
  store i32 1, i32* %arrayidx18, align 4, !dbg !211
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond19, !dbg !214

for.cond19:                                       ; preds = %for.inc24, %if.then16
  %14 = load i32, i32* %i, align 4, !dbg !215
  %cmp20 = icmp slt i32 %14, 10, !dbg !217
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !218

for.body21:                                       ; preds = %for.cond19
  %15 = load i32*, i32** %buffer, align 8, !dbg !219
  %16 = load i32, i32* %i, align 4, !dbg !221
  %idxprom22 = sext i32 %16 to i64, !dbg !219
  %arrayidx23 = getelementptr inbounds i32, i32* %15, i64 %idxprom22, !dbg !219
  %17 = load i32, i32* %arrayidx23, align 4, !dbg !219
  call void @printIntLine(i32 %17), !dbg !222
  br label %for.inc24, !dbg !223

for.inc24:                                        ; preds = %for.body21
  %18 = load i32, i32* %i, align 4, !dbg !224
  %inc25 = add nsw i32 %18, 1, !dbg !224
  store i32 %inc25, i32* %i, align 4, !dbg !224
  br label %for.cond19, !dbg !225, !llvm.loop !226

for.end26:                                        ; preds = %for.cond19
  br label %if.end28, !dbg !228

if.else27:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !229
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %for.end26
  %19 = load i32*, i32** %buffer, align 8, !dbg !231
  %20 = bitcast i32* %19 to i8*, !dbg !231
  call void @free(i8* %20) #8, !dbg !232
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.then7
  ret void, !dbg !233
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !234 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 -1, i32* %data, align 4, !dbg !237
  %0 = load i32, i32* @globalFive, align 4, !dbg !238
  %cmp = icmp eq i32 %0, 5, !dbg !240
  br i1 %cmp, label %if.then, label %if.end5, !dbg !241

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !242, metadata !DIExpression()), !dbg !245
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !245
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !246
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !248
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !249
  %cmp1 = icmp ne i8* %call, null, !dbg !250
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !251

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !252
  %call4 = call i32 @atoi(i8* %arraydecay3) #7, !dbg !254
  store i32 %call4, i32* %data, align 4, !dbg !255
  br label %if.end, !dbg !256

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !257
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !259

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFive, align 4, !dbg !260
  %cmp6 = icmp eq i32 %3, 5, !dbg !262
  br i1 %cmp6, label %if.then7, label %if.end28, !dbg !263

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !268, metadata !DIExpression()), !dbg !269
  %call8 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !270
  %4 = bitcast i8* %call8 to i32*, !dbg !271
  store i32* %4, i32** %buffer, align 8, !dbg !269
  %5 = load i32*, i32** %buffer, align 8, !dbg !272
  %cmp9 = icmp eq i32* %5, null, !dbg !274
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !275

if.then10:                                        ; preds = %if.then7
  call void @exit(i32 -1) #9, !dbg !276
  unreachable, !dbg !276

if.end11:                                         ; preds = %if.then7
  store i32 0, i32* %i, align 4, !dbg !278
  br label %for.cond, !dbg !280

for.cond:                                         ; preds = %for.inc, %if.end11
  %6 = load i32, i32* %i, align 4, !dbg !281
  %cmp12 = icmp slt i32 %6, 10, !dbg !283
  br i1 %cmp12, label %for.body, label %for.end, !dbg !284

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !285
  %8 = load i32, i32* %i, align 4, !dbg !287
  %idxprom = sext i32 %8 to i64, !dbg !285
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !285
  store i32 0, i32* %arrayidx, align 4, !dbg !288
  br label %for.inc, !dbg !289

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !290
  %inc = add nsw i32 %9, 1, !dbg !290
  store i32 %inc, i32* %i, align 4, !dbg !290
  br label %for.cond, !dbg !291, !llvm.loop !292

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !294
  %cmp13 = icmp sge i32 %10, 0, !dbg !296
  br i1 %cmp13, label %land.lhs.true, label %if.else26, !dbg !297

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data, align 4, !dbg !298
  %cmp14 = icmp slt i32 %11, 10, !dbg !299
  br i1 %cmp14, label %if.then15, label %if.else26, !dbg !300

if.then15:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !301
  %13 = load i32, i32* %data, align 4, !dbg !303
  %idxprom16 = sext i32 %13 to i64, !dbg !301
  %arrayidx17 = getelementptr inbounds i32, i32* %12, i64 %idxprom16, !dbg !301
  store i32 1, i32* %arrayidx17, align 4, !dbg !304
  store i32 0, i32* %i, align 4, !dbg !305
  br label %for.cond18, !dbg !307

for.cond18:                                       ; preds = %for.inc23, %if.then15
  %14 = load i32, i32* %i, align 4, !dbg !308
  %cmp19 = icmp slt i32 %14, 10, !dbg !310
  br i1 %cmp19, label %for.body20, label %for.end25, !dbg !311

for.body20:                                       ; preds = %for.cond18
  %15 = load i32*, i32** %buffer, align 8, !dbg !312
  %16 = load i32, i32* %i, align 4, !dbg !314
  %idxprom21 = sext i32 %16 to i64, !dbg !312
  %arrayidx22 = getelementptr inbounds i32, i32* %15, i64 %idxprom21, !dbg !312
  %17 = load i32, i32* %arrayidx22, align 4, !dbg !312
  call void @printIntLine(i32 %17), !dbg !315
  br label %for.inc23, !dbg !316

for.inc23:                                        ; preds = %for.body20
  %18 = load i32, i32* %i, align 4, !dbg !317
  %inc24 = add nsw i32 %18, 1, !dbg !317
  store i32 %inc24, i32* %i, align 4, !dbg !317
  br label %for.cond18, !dbg !318, !llvm.loop !319

for.end25:                                        ; preds = %for.cond18
  br label %if.end27, !dbg !321

if.else26:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !322
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %for.end25
  %19 = load i32*, i32** %buffer, align 8, !dbg !324
  %20 = bitcast i32* %19 to i8*, !dbg !324
  call void @free(i8* %20) #8, !dbg !325
  br label %if.end28, !dbg !326

if.end28:                                         ; preds = %if.end27, %if.end5
  ret void, !dbg !327
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !328 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !329, metadata !DIExpression()), !dbg !330
  store i32 -1, i32* %data, align 4, !dbg !331
  %0 = load i32, i32* @globalFive, align 4, !dbg !332
  %cmp = icmp ne i32 %0, 5, !dbg !334
  br i1 %cmp, label %if.then, label %if.else, !dbg !335

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !336
  br label %if.end, !dbg !338

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !339
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !341
  %cmp1 = icmp eq i32 %1, 5, !dbg !343
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !344

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !345, metadata !DIExpression()), !dbg !348
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !349, metadata !DIExpression()), !dbg !350
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !351
  %2 = bitcast i8* %call to i32*, !dbg !352
  store i32* %2, i32** %buffer, align 8, !dbg !350
  %3 = load i32*, i32** %buffer, align 8, !dbg !353
  %cmp3 = icmp eq i32* %3, null, !dbg !355
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !356

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #9, !dbg !357
  unreachable, !dbg !357

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !359
  br label %for.cond, !dbg !361

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !362
  %cmp6 = icmp slt i32 %4, 10, !dbg !364
  br i1 %cmp6, label %for.body, label %for.end, !dbg !365

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !366
  %6 = load i32, i32* %i, align 4, !dbg !368
  %idxprom = sext i32 %6 to i64, !dbg !366
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !366
  store i32 0, i32* %arrayidx, align 4, !dbg !369
  br label %for.inc, !dbg !370

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !371
  %inc = add nsw i32 %7, 1, !dbg !371
  store i32 %inc, i32* %i, align 4, !dbg !371
  br label %for.cond, !dbg !372, !llvm.loop !373

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !375
  %cmp7 = icmp sge i32 %8, 0, !dbg !377
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !378

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !379
  %10 = load i32, i32* %data, align 4, !dbg !381
  %idxprom9 = sext i32 %10 to i64, !dbg !379
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !379
  store i32 1, i32* %arrayidx10, align 4, !dbg !382
  store i32 0, i32* %i, align 4, !dbg !383
  br label %for.cond11, !dbg !385

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !386
  %cmp12 = icmp slt i32 %11, 10, !dbg !388
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !389

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !390
  %13 = load i32, i32* %i, align 4, !dbg !392
  %idxprom14 = sext i32 %13 to i64, !dbg !390
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !390
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !390
  call void @printIntLine(i32 %14), !dbg !393
  br label %for.inc16, !dbg !394

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !395
  %inc17 = add nsw i32 %15, 1, !dbg !395
  store i32 %inc17, i32* %i, align 4, !dbg !395
  br label %for.cond11, !dbg !396, !llvm.loop !397

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !399

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !400
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !402
  %17 = bitcast i32* %16 to i8*, !dbg !402
  call void @free(i8* %17) #8, !dbg !403
  br label %if.end21, !dbg !404

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !405
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !406 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !407, metadata !DIExpression()), !dbg !408
  store i32 -1, i32* %data, align 4, !dbg !409
  %0 = load i32, i32* @globalFive, align 4, !dbg !410
  %cmp = icmp eq i32 %0, 5, !dbg !412
  br i1 %cmp, label %if.then, label %if.end, !dbg !413

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !414
  br label %if.end, !dbg !416

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !417
  %cmp1 = icmp eq i32 %1, 5, !dbg !419
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !420

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !421, metadata !DIExpression()), !dbg !424
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !425, metadata !DIExpression()), !dbg !426
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !427
  %2 = bitcast i8* %call to i32*, !dbg !428
  store i32* %2, i32** %buffer, align 8, !dbg !426
  %3 = load i32*, i32** %buffer, align 8, !dbg !429
  %cmp3 = icmp eq i32* %3, null, !dbg !431
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !432

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #9, !dbg !433
  unreachable, !dbg !433

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !435
  br label %for.cond, !dbg !437

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !438
  %cmp6 = icmp slt i32 %4, 10, !dbg !440
  br i1 %cmp6, label %for.body, label %for.end, !dbg !441

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !442
  %6 = load i32, i32* %i, align 4, !dbg !444
  %idxprom = sext i32 %6 to i64, !dbg !442
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !442
  store i32 0, i32* %arrayidx, align 4, !dbg !445
  br label %for.inc, !dbg !446

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !447
  %inc = add nsw i32 %7, 1, !dbg !447
  store i32 %inc, i32* %i, align 4, !dbg !447
  br label %for.cond, !dbg !448, !llvm.loop !449

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !451
  %cmp7 = icmp sge i32 %8, 0, !dbg !453
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !454

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !455
  %10 = load i32, i32* %data, align 4, !dbg !457
  %idxprom9 = sext i32 %10 to i64, !dbg !455
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !455
  store i32 1, i32* %arrayidx10, align 4, !dbg !458
  store i32 0, i32* %i, align 4, !dbg !459
  br label %for.cond11, !dbg !461

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !462
  %cmp12 = icmp slt i32 %11, 10, !dbg !464
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !465

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !466
  %13 = load i32, i32* %i, align 4, !dbg !468
  %idxprom14 = sext i32 %13 to i64, !dbg !466
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !466
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !466
  call void @printIntLine(i32 %14), !dbg !469
  br label %for.inc16, !dbg !470

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !471
  %inc17 = add nsw i32 %15, 1, !dbg !471
  store i32 %inc17, i32* %i, align 4, !dbg !471
  br label %for.cond11, !dbg !472, !llvm.loop !473

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !475

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !476
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !478
  %17 = bitcast i32* %16 to i8*, !dbg !478
  call void @free(i8* %17) #8, !dbg !479
  br label %if.end20, !dbg !480

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !481
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !6)
!19 = !DILocation(line: 26, column: 9, scope: !14)
!20 = !DILocation(line: 28, column: 10, scope: !14)
!21 = !DILocation(line: 29, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 8)
!23 = !DILocation(line: 29, column: 18, scope: !22)
!24 = !DILocation(line: 29, column: 8, scope: !14)
!25 = !DILocalVariable(name: "inputBuffer", scope: !26, file: !15, line: 32, type: !28)
!26 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !15, line: 30, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 112, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 14)
!32 = !DILocation(line: 32, column: 18, scope: !26)
!33 = !DILocation(line: 34, column: 23, scope: !34)
!34 = distinct !DILexicalBlock(scope: !26, file: !15, line: 34, column: 17)
!35 = !DILocation(line: 34, column: 53, scope: !34)
!36 = !DILocation(line: 34, column: 17, scope: !34)
!37 = !DILocation(line: 34, column: 60, scope: !34)
!38 = !DILocation(line: 34, column: 17, scope: !26)
!39 = !DILocation(line: 37, column: 29, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !15, line: 35, column: 13)
!41 = !DILocation(line: 37, column: 24, scope: !40)
!42 = !DILocation(line: 37, column: 22, scope: !40)
!43 = !DILocation(line: 38, column: 13, scope: !40)
!44 = !DILocation(line: 41, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !15, line: 40, column: 13)
!46 = !DILocation(line: 44, column: 5, scope: !27)
!47 = !DILocation(line: 45, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 8)
!49 = !DILocation(line: 45, column: 18, scope: !48)
!50 = !DILocation(line: 45, column: 8, scope: !14)
!51 = !DILocalVariable(name: "i", scope: !52, file: !15, line: 48, type: !6)
!52 = distinct !DILexicalBlock(scope: !53, file: !15, line: 47, column: 9)
!53 = distinct !DILexicalBlock(scope: !48, file: !15, line: 46, column: 5)
!54 = !DILocation(line: 48, column: 17, scope: !52)
!55 = !DILocalVariable(name: "buffer", scope: !52, file: !15, line: 49, type: !5)
!56 = !DILocation(line: 49, column: 19, scope: !52)
!57 = !DILocation(line: 49, column: 35, scope: !52)
!58 = !DILocation(line: 49, column: 28, scope: !52)
!59 = !DILocation(line: 50, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !52, file: !15, line: 50, column: 17)
!61 = !DILocation(line: 50, column: 24, scope: !60)
!62 = !DILocation(line: 50, column: 17, scope: !52)
!63 = !DILocation(line: 50, column: 34, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 50, column: 33)
!65 = !DILocation(line: 52, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !52, file: !15, line: 52, column: 13)
!67 = !DILocation(line: 52, column: 18, scope: !66)
!68 = !DILocation(line: 52, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !15, line: 52, column: 13)
!70 = !DILocation(line: 52, column: 27, scope: !69)
!71 = !DILocation(line: 52, column: 13, scope: !66)
!72 = !DILocation(line: 54, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 53, column: 13)
!74 = !DILocation(line: 54, column: 24, scope: !73)
!75 = !DILocation(line: 54, column: 27, scope: !73)
!76 = !DILocation(line: 55, column: 13, scope: !73)
!77 = !DILocation(line: 52, column: 34, scope: !69)
!78 = !DILocation(line: 52, column: 13, scope: !69)
!79 = distinct !{!79, !71, !80, !81}
!80 = !DILocation(line: 55, column: 13, scope: !66)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 58, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !52, file: !15, line: 58, column: 17)
!84 = !DILocation(line: 58, column: 22, scope: !83)
!85 = !DILocation(line: 58, column: 17, scope: !52)
!86 = !DILocation(line: 60, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 59, column: 13)
!88 = !DILocation(line: 60, column: 24, scope: !87)
!89 = !DILocation(line: 60, column: 30, scope: !87)
!90 = !DILocation(line: 62, column: 23, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 62, column: 17)
!92 = !DILocation(line: 62, column: 21, scope: !91)
!93 = !DILocation(line: 62, column: 28, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 62, column: 17)
!95 = !DILocation(line: 62, column: 30, scope: !94)
!96 = !DILocation(line: 62, column: 17, scope: !91)
!97 = !DILocation(line: 64, column: 34, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 63, column: 17)
!99 = !DILocation(line: 64, column: 41, scope: !98)
!100 = !DILocation(line: 64, column: 21, scope: !98)
!101 = !DILocation(line: 65, column: 17, scope: !98)
!102 = !DILocation(line: 62, column: 37, scope: !94)
!103 = !DILocation(line: 62, column: 17, scope: !94)
!104 = distinct !{!104, !96, !105, !81}
!105 = !DILocation(line: 65, column: 17, scope: !91)
!106 = !DILocation(line: 66, column: 13, scope: !87)
!107 = !DILocation(line: 69, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !83, file: !15, line: 68, column: 13)
!109 = !DILocation(line: 71, column: 18, scope: !52)
!110 = !DILocation(line: 71, column: 13, scope: !52)
!111 = !DILocation(line: 73, column: 5, scope: !53)
!112 = !DILocation(line: 74, column: 1, scope: !14)
!113 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_14_good", scope: !15, file: !15, line: 280, type: !16, scopeLine: 281, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocation(line: 282, column: 5, scope: !113)
!115 = !DILocation(line: 283, column: 5, scope: !113)
!116 = !DILocation(line: 284, column: 5, scope: !113)
!117 = !DILocation(line: 285, column: 5, scope: !113)
!118 = !DILocation(line: 286, column: 1, scope: !113)
!119 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 297, type: !120, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{!6, !6, !122}
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!124 = !DILocalVariable(name: "argc", arg: 1, scope: !119, file: !15, line: 297, type: !6)
!125 = !DILocation(line: 297, column: 14, scope: !119)
!126 = !DILocalVariable(name: "argv", arg: 2, scope: !119, file: !15, line: 297, type: !122)
!127 = !DILocation(line: 297, column: 27, scope: !119)
!128 = !DILocation(line: 300, column: 22, scope: !119)
!129 = !DILocation(line: 300, column: 12, scope: !119)
!130 = !DILocation(line: 300, column: 5, scope: !119)
!131 = !DILocation(line: 302, column: 5, scope: !119)
!132 = !DILocation(line: 303, column: 5, scope: !119)
!133 = !DILocation(line: 304, column: 5, scope: !119)
!134 = !DILocation(line: 307, column: 5, scope: !119)
!135 = !DILocation(line: 308, column: 5, scope: !119)
!136 = !DILocation(line: 309, column: 5, scope: !119)
!137 = !DILocation(line: 311, column: 5, scope: !119)
!138 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !15, line: 83, type: !6)
!140 = !DILocation(line: 83, column: 9, scope: !138)
!141 = !DILocation(line: 85, column: 10, scope: !138)
!142 = !DILocation(line: 86, column: 8, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !15, line: 86, column: 8)
!144 = !DILocation(line: 86, column: 18, scope: !143)
!145 = !DILocation(line: 86, column: 8, scope: !138)
!146 = !DILocalVariable(name: "inputBuffer", scope: !147, file: !15, line: 89, type: !28)
!147 = distinct !DILexicalBlock(scope: !148, file: !15, line: 88, column: 9)
!148 = distinct !DILexicalBlock(scope: !143, file: !15, line: 87, column: 5)
!149 = !DILocation(line: 89, column: 18, scope: !147)
!150 = !DILocation(line: 91, column: 23, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !15, line: 91, column: 17)
!152 = !DILocation(line: 91, column: 53, scope: !151)
!153 = !DILocation(line: 91, column: 17, scope: !151)
!154 = !DILocation(line: 91, column: 60, scope: !151)
!155 = !DILocation(line: 91, column: 17, scope: !147)
!156 = !DILocation(line: 94, column: 29, scope: !157)
!157 = distinct !DILexicalBlock(scope: !151, file: !15, line: 92, column: 13)
!158 = !DILocation(line: 94, column: 24, scope: !157)
!159 = !DILocation(line: 94, column: 22, scope: !157)
!160 = !DILocation(line: 95, column: 13, scope: !157)
!161 = !DILocation(line: 98, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !151, file: !15, line: 97, column: 13)
!163 = !DILocation(line: 101, column: 5, scope: !148)
!164 = !DILocation(line: 102, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !138, file: !15, line: 102, column: 8)
!166 = !DILocation(line: 102, column: 18, scope: !165)
!167 = !DILocation(line: 102, column: 8, scope: !138)
!168 = !DILocation(line: 105, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !15, line: 103, column: 5)
!170 = !DILocation(line: 106, column: 5, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !172, file: !15, line: 110, type: !6)
!172 = distinct !DILexicalBlock(scope: !173, file: !15, line: 109, column: 9)
!173 = distinct !DILexicalBlock(scope: !165, file: !15, line: 108, column: 5)
!174 = !DILocation(line: 110, column: 17, scope: !172)
!175 = !DILocalVariable(name: "buffer", scope: !172, file: !15, line: 111, type: !5)
!176 = !DILocation(line: 111, column: 19, scope: !172)
!177 = !DILocation(line: 111, column: 35, scope: !172)
!178 = !DILocation(line: 111, column: 28, scope: !172)
!179 = !DILocation(line: 112, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !172, file: !15, line: 112, column: 17)
!181 = !DILocation(line: 112, column: 24, scope: !180)
!182 = !DILocation(line: 112, column: 17, scope: !172)
!183 = !DILocation(line: 112, column: 34, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !15, line: 112, column: 33)
!185 = !DILocation(line: 114, column: 20, scope: !186)
!186 = distinct !DILexicalBlock(scope: !172, file: !15, line: 114, column: 13)
!187 = !DILocation(line: 114, column: 18, scope: !186)
!188 = !DILocation(line: 114, column: 25, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !15, line: 114, column: 13)
!190 = !DILocation(line: 114, column: 27, scope: !189)
!191 = !DILocation(line: 114, column: 13, scope: !186)
!192 = !DILocation(line: 116, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !15, line: 115, column: 13)
!194 = !DILocation(line: 116, column: 24, scope: !193)
!195 = !DILocation(line: 116, column: 27, scope: !193)
!196 = !DILocation(line: 117, column: 13, scope: !193)
!197 = !DILocation(line: 114, column: 34, scope: !189)
!198 = !DILocation(line: 114, column: 13, scope: !189)
!199 = distinct !{!199, !191, !200, !81}
!200 = !DILocation(line: 117, column: 13, scope: !186)
!201 = !DILocation(line: 119, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !172, file: !15, line: 119, column: 17)
!203 = !DILocation(line: 119, column: 22, scope: !202)
!204 = !DILocation(line: 119, column: 27, scope: !202)
!205 = !DILocation(line: 119, column: 30, scope: !202)
!206 = !DILocation(line: 119, column: 35, scope: !202)
!207 = !DILocation(line: 119, column: 17, scope: !172)
!208 = !DILocation(line: 121, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !202, file: !15, line: 120, column: 13)
!210 = !DILocation(line: 121, column: 24, scope: !209)
!211 = !DILocation(line: 121, column: 30, scope: !209)
!212 = !DILocation(line: 123, column: 23, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !15, line: 123, column: 17)
!214 = !DILocation(line: 123, column: 21, scope: !213)
!215 = !DILocation(line: 123, column: 28, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !15, line: 123, column: 17)
!217 = !DILocation(line: 123, column: 30, scope: !216)
!218 = !DILocation(line: 123, column: 17, scope: !213)
!219 = !DILocation(line: 125, column: 34, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !15, line: 124, column: 17)
!221 = !DILocation(line: 125, column: 41, scope: !220)
!222 = !DILocation(line: 125, column: 21, scope: !220)
!223 = !DILocation(line: 126, column: 17, scope: !220)
!224 = !DILocation(line: 123, column: 37, scope: !216)
!225 = !DILocation(line: 123, column: 17, scope: !216)
!226 = distinct !{!226, !218, !227, !81}
!227 = !DILocation(line: 126, column: 17, scope: !213)
!228 = !DILocation(line: 127, column: 13, scope: !209)
!229 = !DILocation(line: 130, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !202, file: !15, line: 129, column: 13)
!231 = !DILocation(line: 132, column: 18, scope: !172)
!232 = !DILocation(line: 132, column: 13, scope: !172)
!233 = !DILocation(line: 135, column: 1, scope: !138)
!234 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 138, type: !16, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!235 = !DILocalVariable(name: "data", scope: !234, file: !15, line: 140, type: !6)
!236 = !DILocation(line: 140, column: 9, scope: !234)
!237 = !DILocation(line: 142, column: 10, scope: !234)
!238 = !DILocation(line: 143, column: 8, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !15, line: 143, column: 8)
!240 = !DILocation(line: 143, column: 18, scope: !239)
!241 = !DILocation(line: 143, column: 8, scope: !234)
!242 = !DILocalVariable(name: "inputBuffer", scope: !243, file: !15, line: 146, type: !28)
!243 = distinct !DILexicalBlock(scope: !244, file: !15, line: 145, column: 9)
!244 = distinct !DILexicalBlock(scope: !239, file: !15, line: 144, column: 5)
!245 = !DILocation(line: 146, column: 18, scope: !243)
!246 = !DILocation(line: 148, column: 23, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !15, line: 148, column: 17)
!248 = !DILocation(line: 148, column: 53, scope: !247)
!249 = !DILocation(line: 148, column: 17, scope: !247)
!250 = !DILocation(line: 148, column: 60, scope: !247)
!251 = !DILocation(line: 148, column: 17, scope: !243)
!252 = !DILocation(line: 151, column: 29, scope: !253)
!253 = distinct !DILexicalBlock(scope: !247, file: !15, line: 149, column: 13)
!254 = !DILocation(line: 151, column: 24, scope: !253)
!255 = !DILocation(line: 151, column: 22, scope: !253)
!256 = !DILocation(line: 152, column: 13, scope: !253)
!257 = !DILocation(line: 155, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !247, file: !15, line: 154, column: 13)
!259 = !DILocation(line: 158, column: 5, scope: !244)
!260 = !DILocation(line: 159, column: 8, scope: !261)
!261 = distinct !DILexicalBlock(scope: !234, file: !15, line: 159, column: 8)
!262 = !DILocation(line: 159, column: 18, scope: !261)
!263 = !DILocation(line: 159, column: 8, scope: !234)
!264 = !DILocalVariable(name: "i", scope: !265, file: !15, line: 162, type: !6)
!265 = distinct !DILexicalBlock(scope: !266, file: !15, line: 161, column: 9)
!266 = distinct !DILexicalBlock(scope: !261, file: !15, line: 160, column: 5)
!267 = !DILocation(line: 162, column: 17, scope: !265)
!268 = !DILocalVariable(name: "buffer", scope: !265, file: !15, line: 163, type: !5)
!269 = !DILocation(line: 163, column: 19, scope: !265)
!270 = !DILocation(line: 163, column: 35, scope: !265)
!271 = !DILocation(line: 163, column: 28, scope: !265)
!272 = !DILocation(line: 164, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !265, file: !15, line: 164, column: 17)
!274 = !DILocation(line: 164, column: 24, scope: !273)
!275 = !DILocation(line: 164, column: 17, scope: !265)
!276 = !DILocation(line: 164, column: 34, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !15, line: 164, column: 33)
!278 = !DILocation(line: 166, column: 20, scope: !279)
!279 = distinct !DILexicalBlock(scope: !265, file: !15, line: 166, column: 13)
!280 = !DILocation(line: 166, column: 18, scope: !279)
!281 = !DILocation(line: 166, column: 25, scope: !282)
!282 = distinct !DILexicalBlock(scope: !279, file: !15, line: 166, column: 13)
!283 = !DILocation(line: 166, column: 27, scope: !282)
!284 = !DILocation(line: 166, column: 13, scope: !279)
!285 = !DILocation(line: 168, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !15, line: 167, column: 13)
!287 = !DILocation(line: 168, column: 24, scope: !286)
!288 = !DILocation(line: 168, column: 27, scope: !286)
!289 = !DILocation(line: 169, column: 13, scope: !286)
!290 = !DILocation(line: 166, column: 34, scope: !282)
!291 = !DILocation(line: 166, column: 13, scope: !282)
!292 = distinct !{!292, !284, !293, !81}
!293 = !DILocation(line: 169, column: 13, scope: !279)
!294 = !DILocation(line: 171, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !265, file: !15, line: 171, column: 17)
!296 = !DILocation(line: 171, column: 22, scope: !295)
!297 = !DILocation(line: 171, column: 27, scope: !295)
!298 = !DILocation(line: 171, column: 30, scope: !295)
!299 = !DILocation(line: 171, column: 35, scope: !295)
!300 = !DILocation(line: 171, column: 17, scope: !265)
!301 = !DILocation(line: 173, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !295, file: !15, line: 172, column: 13)
!303 = !DILocation(line: 173, column: 24, scope: !302)
!304 = !DILocation(line: 173, column: 30, scope: !302)
!305 = !DILocation(line: 175, column: 23, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !15, line: 175, column: 17)
!307 = !DILocation(line: 175, column: 21, scope: !306)
!308 = !DILocation(line: 175, column: 28, scope: !309)
!309 = distinct !DILexicalBlock(scope: !306, file: !15, line: 175, column: 17)
!310 = !DILocation(line: 175, column: 30, scope: !309)
!311 = !DILocation(line: 175, column: 17, scope: !306)
!312 = !DILocation(line: 177, column: 34, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !15, line: 176, column: 17)
!314 = !DILocation(line: 177, column: 41, scope: !313)
!315 = !DILocation(line: 177, column: 21, scope: !313)
!316 = !DILocation(line: 178, column: 17, scope: !313)
!317 = !DILocation(line: 175, column: 37, scope: !309)
!318 = !DILocation(line: 175, column: 17, scope: !309)
!319 = distinct !{!319, !311, !320, !81}
!320 = !DILocation(line: 178, column: 17, scope: !306)
!321 = !DILocation(line: 179, column: 13, scope: !302)
!322 = !DILocation(line: 182, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !295, file: !15, line: 181, column: 13)
!324 = !DILocation(line: 184, column: 18, scope: !265)
!325 = !DILocation(line: 184, column: 13, scope: !265)
!326 = !DILocation(line: 186, column: 5, scope: !266)
!327 = !DILocation(line: 187, column: 1, scope: !234)
!328 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 190, type: !16, scopeLine: 191, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!329 = !DILocalVariable(name: "data", scope: !328, file: !15, line: 192, type: !6)
!330 = !DILocation(line: 192, column: 9, scope: !328)
!331 = !DILocation(line: 194, column: 10, scope: !328)
!332 = !DILocation(line: 195, column: 8, scope: !333)
!333 = distinct !DILexicalBlock(scope: !328, file: !15, line: 195, column: 8)
!334 = !DILocation(line: 195, column: 18, scope: !333)
!335 = !DILocation(line: 195, column: 8, scope: !328)
!336 = !DILocation(line: 198, column: 9, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !15, line: 196, column: 5)
!338 = !DILocation(line: 199, column: 5, scope: !337)
!339 = !DILocation(line: 204, column: 14, scope: !340)
!340 = distinct !DILexicalBlock(scope: !333, file: !15, line: 201, column: 5)
!341 = !DILocation(line: 206, column: 8, scope: !342)
!342 = distinct !DILexicalBlock(scope: !328, file: !15, line: 206, column: 8)
!343 = !DILocation(line: 206, column: 18, scope: !342)
!344 = !DILocation(line: 206, column: 8, scope: !328)
!345 = !DILocalVariable(name: "i", scope: !346, file: !15, line: 209, type: !6)
!346 = distinct !DILexicalBlock(scope: !347, file: !15, line: 208, column: 9)
!347 = distinct !DILexicalBlock(scope: !342, file: !15, line: 207, column: 5)
!348 = !DILocation(line: 209, column: 17, scope: !346)
!349 = !DILocalVariable(name: "buffer", scope: !346, file: !15, line: 210, type: !5)
!350 = !DILocation(line: 210, column: 19, scope: !346)
!351 = !DILocation(line: 210, column: 35, scope: !346)
!352 = !DILocation(line: 210, column: 28, scope: !346)
!353 = !DILocation(line: 211, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !346, file: !15, line: 211, column: 17)
!355 = !DILocation(line: 211, column: 24, scope: !354)
!356 = !DILocation(line: 211, column: 17, scope: !346)
!357 = !DILocation(line: 211, column: 34, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !15, line: 211, column: 33)
!359 = !DILocation(line: 213, column: 20, scope: !360)
!360 = distinct !DILexicalBlock(scope: !346, file: !15, line: 213, column: 13)
!361 = !DILocation(line: 213, column: 18, scope: !360)
!362 = !DILocation(line: 213, column: 25, scope: !363)
!363 = distinct !DILexicalBlock(scope: !360, file: !15, line: 213, column: 13)
!364 = !DILocation(line: 213, column: 27, scope: !363)
!365 = !DILocation(line: 213, column: 13, scope: !360)
!366 = !DILocation(line: 215, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !363, file: !15, line: 214, column: 13)
!368 = !DILocation(line: 215, column: 24, scope: !367)
!369 = !DILocation(line: 215, column: 27, scope: !367)
!370 = !DILocation(line: 216, column: 13, scope: !367)
!371 = !DILocation(line: 213, column: 34, scope: !363)
!372 = !DILocation(line: 213, column: 13, scope: !363)
!373 = distinct !{!373, !365, !374, !81}
!374 = !DILocation(line: 216, column: 13, scope: !360)
!375 = !DILocation(line: 219, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !346, file: !15, line: 219, column: 17)
!377 = !DILocation(line: 219, column: 22, scope: !376)
!378 = !DILocation(line: 219, column: 17, scope: !346)
!379 = !DILocation(line: 221, column: 17, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !15, line: 220, column: 13)
!381 = !DILocation(line: 221, column: 24, scope: !380)
!382 = !DILocation(line: 221, column: 30, scope: !380)
!383 = !DILocation(line: 223, column: 23, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !15, line: 223, column: 17)
!385 = !DILocation(line: 223, column: 21, scope: !384)
!386 = !DILocation(line: 223, column: 28, scope: !387)
!387 = distinct !DILexicalBlock(scope: !384, file: !15, line: 223, column: 17)
!388 = !DILocation(line: 223, column: 30, scope: !387)
!389 = !DILocation(line: 223, column: 17, scope: !384)
!390 = !DILocation(line: 225, column: 34, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !15, line: 224, column: 17)
!392 = !DILocation(line: 225, column: 41, scope: !391)
!393 = !DILocation(line: 225, column: 21, scope: !391)
!394 = !DILocation(line: 226, column: 17, scope: !391)
!395 = !DILocation(line: 223, column: 37, scope: !387)
!396 = !DILocation(line: 223, column: 17, scope: !387)
!397 = distinct !{!397, !389, !398, !81}
!398 = !DILocation(line: 226, column: 17, scope: !384)
!399 = !DILocation(line: 227, column: 13, scope: !380)
!400 = !DILocation(line: 230, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !376, file: !15, line: 229, column: 13)
!402 = !DILocation(line: 232, column: 18, scope: !346)
!403 = !DILocation(line: 232, column: 13, scope: !346)
!404 = !DILocation(line: 234, column: 5, scope: !347)
!405 = !DILocation(line: 235, column: 1, scope: !328)
!406 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 238, type: !16, scopeLine: 239, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!407 = !DILocalVariable(name: "data", scope: !406, file: !15, line: 240, type: !6)
!408 = !DILocation(line: 240, column: 9, scope: !406)
!409 = !DILocation(line: 242, column: 10, scope: !406)
!410 = !DILocation(line: 243, column: 8, scope: !411)
!411 = distinct !DILexicalBlock(scope: !406, file: !15, line: 243, column: 8)
!412 = !DILocation(line: 243, column: 18, scope: !411)
!413 = !DILocation(line: 243, column: 8, scope: !406)
!414 = !DILocation(line: 247, column: 14, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !15, line: 244, column: 5)
!416 = !DILocation(line: 248, column: 5, scope: !415)
!417 = !DILocation(line: 249, column: 8, scope: !418)
!418 = distinct !DILexicalBlock(scope: !406, file: !15, line: 249, column: 8)
!419 = !DILocation(line: 249, column: 18, scope: !418)
!420 = !DILocation(line: 249, column: 8, scope: !406)
!421 = !DILocalVariable(name: "i", scope: !422, file: !15, line: 252, type: !6)
!422 = distinct !DILexicalBlock(scope: !423, file: !15, line: 251, column: 9)
!423 = distinct !DILexicalBlock(scope: !418, file: !15, line: 250, column: 5)
!424 = !DILocation(line: 252, column: 17, scope: !422)
!425 = !DILocalVariable(name: "buffer", scope: !422, file: !15, line: 253, type: !5)
!426 = !DILocation(line: 253, column: 19, scope: !422)
!427 = !DILocation(line: 253, column: 35, scope: !422)
!428 = !DILocation(line: 253, column: 28, scope: !422)
!429 = !DILocation(line: 254, column: 17, scope: !430)
!430 = distinct !DILexicalBlock(scope: !422, file: !15, line: 254, column: 17)
!431 = !DILocation(line: 254, column: 24, scope: !430)
!432 = !DILocation(line: 254, column: 17, scope: !422)
!433 = !DILocation(line: 254, column: 34, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !15, line: 254, column: 33)
!435 = !DILocation(line: 256, column: 20, scope: !436)
!436 = distinct !DILexicalBlock(scope: !422, file: !15, line: 256, column: 13)
!437 = !DILocation(line: 256, column: 18, scope: !436)
!438 = !DILocation(line: 256, column: 25, scope: !439)
!439 = distinct !DILexicalBlock(scope: !436, file: !15, line: 256, column: 13)
!440 = !DILocation(line: 256, column: 27, scope: !439)
!441 = !DILocation(line: 256, column: 13, scope: !436)
!442 = !DILocation(line: 258, column: 17, scope: !443)
!443 = distinct !DILexicalBlock(scope: !439, file: !15, line: 257, column: 13)
!444 = !DILocation(line: 258, column: 24, scope: !443)
!445 = !DILocation(line: 258, column: 27, scope: !443)
!446 = !DILocation(line: 259, column: 13, scope: !443)
!447 = !DILocation(line: 256, column: 34, scope: !439)
!448 = !DILocation(line: 256, column: 13, scope: !439)
!449 = distinct !{!449, !441, !450, !81}
!450 = !DILocation(line: 259, column: 13, scope: !436)
!451 = !DILocation(line: 262, column: 17, scope: !452)
!452 = distinct !DILexicalBlock(scope: !422, file: !15, line: 262, column: 17)
!453 = !DILocation(line: 262, column: 22, scope: !452)
!454 = !DILocation(line: 262, column: 17, scope: !422)
!455 = !DILocation(line: 264, column: 17, scope: !456)
!456 = distinct !DILexicalBlock(scope: !452, file: !15, line: 263, column: 13)
!457 = !DILocation(line: 264, column: 24, scope: !456)
!458 = !DILocation(line: 264, column: 30, scope: !456)
!459 = !DILocation(line: 266, column: 23, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !15, line: 266, column: 17)
!461 = !DILocation(line: 266, column: 21, scope: !460)
!462 = !DILocation(line: 266, column: 28, scope: !463)
!463 = distinct !DILexicalBlock(scope: !460, file: !15, line: 266, column: 17)
!464 = !DILocation(line: 266, column: 30, scope: !463)
!465 = !DILocation(line: 266, column: 17, scope: !460)
!466 = !DILocation(line: 268, column: 34, scope: !467)
!467 = distinct !DILexicalBlock(scope: !463, file: !15, line: 267, column: 17)
!468 = !DILocation(line: 268, column: 41, scope: !467)
!469 = !DILocation(line: 268, column: 21, scope: !467)
!470 = !DILocation(line: 269, column: 17, scope: !467)
!471 = !DILocation(line: 266, column: 37, scope: !463)
!472 = !DILocation(line: 266, column: 17, scope: !463)
!473 = distinct !{!473, !465, !474, !81}
!474 = !DILocation(line: 269, column: 17, scope: !460)
!475 = !DILocation(line: 270, column: 13, scope: !456)
!476 = !DILocation(line: 273, column: 17, scope: !477)
!477 = distinct !DILexicalBlock(scope: !452, file: !15, line: 272, column: 13)
!478 = !DILocation(line: 275, column: 18, scope: !422)
!479 = !DILocation(line: 275, column: 13, scope: !422)
!480 = !DILocation(line: 277, column: 5, scope: !423)
!481 = !DILocation(line: 278, column: 1, scope: !406)
