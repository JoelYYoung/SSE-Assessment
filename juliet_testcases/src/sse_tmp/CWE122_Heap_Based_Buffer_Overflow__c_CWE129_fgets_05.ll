; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %0 = load i32, i32* @staticTrue, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end4, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !29, metadata !DIExpression()), !dbg !36
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !39
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !40
  %cmp = icmp ne i8* %call, null, !dbg !41
  br i1 %cmp, label %if.then1, label %if.else, !dbg !42

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !43
  %call3 = call i32 @atoi(i8* %arraydecay2) #7, !dbg !45
  store i32 %call3, i32* %data, align 4, !dbg !46
  br label %if.end, !dbg !47

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !48
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !50

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !51
  %tobool5 = icmp ne i32 %3, 0, !dbg !51
  br i1 %tobool5, label %if.then6, label %if.end26, !dbg !53

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !54, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !58, metadata !DIExpression()), !dbg !59
  %call7 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !60
  %4 = bitcast i8* %call7 to i32*, !dbg !61
  store i32* %4, i32** %buffer, align 8, !dbg !59
  %5 = load i32*, i32** %buffer, align 8, !dbg !62
  %cmp8 = icmp eq i32* %5, null, !dbg !64
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !65

if.then9:                                         ; preds = %if.then6
  call void @exit(i32 -1) #9, !dbg !66
  unreachable, !dbg !66

if.end10:                                         ; preds = %if.then6
  store i32 0, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %if.end10
  %6 = load i32, i32* %i, align 4, !dbg !71
  %cmp11 = icmp slt i32 %6, 10, !dbg !73
  br i1 %cmp11, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !75
  %8 = load i32, i32* %i, align 4, !dbg !77
  %idxprom = sext i32 %8 to i64, !dbg !75
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !75
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !80
  %inc = add nsw i32 %9, 1, !dbg !80
  store i32 %inc, i32* %i, align 4, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !85
  %cmp12 = icmp sge i32 %10, 0, !dbg !87
  br i1 %cmp12, label %if.then13, label %if.else24, !dbg !88

if.then13:                                        ; preds = %for.end
  %11 = load i32*, i32** %buffer, align 8, !dbg !89
  %12 = load i32, i32* %data, align 4, !dbg !91
  %idxprom14 = sext i32 %12 to i64, !dbg !89
  %arrayidx15 = getelementptr inbounds i32, i32* %11, i64 %idxprom14, !dbg !89
  store i32 1, i32* %arrayidx15, align 4, !dbg !92
  store i32 0, i32* %i, align 4, !dbg !93
  br label %for.cond16, !dbg !95

for.cond16:                                       ; preds = %for.inc21, %if.then13
  %13 = load i32, i32* %i, align 4, !dbg !96
  %cmp17 = icmp slt i32 %13, 10, !dbg !98
  br i1 %cmp17, label %for.body18, label %for.end23, !dbg !99

for.body18:                                       ; preds = %for.cond16
  %14 = load i32*, i32** %buffer, align 8, !dbg !100
  %15 = load i32, i32* %i, align 4, !dbg !102
  %idxprom19 = sext i32 %15 to i64, !dbg !100
  %arrayidx20 = getelementptr inbounds i32, i32* %14, i64 %idxprom19, !dbg !100
  %16 = load i32, i32* %arrayidx20, align 4, !dbg !100
  call void @printIntLine(i32 %16), !dbg !103
  br label %for.inc21, !dbg !104

for.inc21:                                        ; preds = %for.body18
  %17 = load i32, i32* %i, align 4, !dbg !105
  %inc22 = add nsw i32 %17, 1, !dbg !105
  store i32 %inc22, i32* %i, align 4, !dbg !105
  br label %for.cond16, !dbg !106, !llvm.loop !107

for.end23:                                        ; preds = %for.cond16
  br label %if.end25, !dbg !109

if.else24:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  br label %if.end25

if.end25:                                         ; preds = %if.else24, %for.end23
  %18 = load i32*, i32** %buffer, align 8, !dbg !112
  %19 = bitcast i32* %18 to i8*, !dbg !112
  call void @free(i8* %19) #8, !dbg !113
  br label %if.end26, !dbg !114

if.end26:                                         ; preds = %if.end25, %if.end4
  ret void, !dbg !115
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_good() #0 !dbg !116 {
entry:
  call void @goodB2G1(), !dbg !117
  call void @goodB2G2(), !dbg !118
  call void @goodG2B1(), !dbg !119
  call void @goodG2B2(), !dbg !120
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_good(), !dbg !135
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !136
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !137
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_bad(), !dbg !138
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !139
  ret i32 0, !dbg !140
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !141 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i32 -1, i32* %data, align 4, !dbg !144
  %0 = load i32, i32* @staticTrue, align 4, !dbg !145
  %tobool = icmp ne i32 %0, 0, !dbg !145
  br i1 %tobool, label %if.then, label %if.end4, !dbg !147

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !148, metadata !DIExpression()), !dbg !151
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !151
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !154
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !155
  %cmp = icmp ne i8* %call, null, !dbg !156
  br i1 %cmp, label %if.then1, label %if.else, !dbg !157

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !158
  %call3 = call i32 @atoi(i8* %arraydecay2) #7, !dbg !160
  store i32 %call3, i32* %data, align 4, !dbg !161
  br label %if.end, !dbg !162

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !163
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !165

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFalse, align 4, !dbg !166
  %tobool5 = icmp ne i32 %3, 0, !dbg !166
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !168

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !169
  br label %if.end28, !dbg !171

if.else7:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !172, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !176, metadata !DIExpression()), !dbg !177
  %call8 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !178
  %4 = bitcast i8* %call8 to i32*, !dbg !179
  store i32* %4, i32** %buffer, align 8, !dbg !177
  %5 = load i32*, i32** %buffer, align 8, !dbg !180
  %cmp9 = icmp eq i32* %5, null, !dbg !182
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !183

if.then10:                                        ; preds = %if.else7
  call void @exit(i32 -1) #9, !dbg !184
  unreachable, !dbg !184

if.end11:                                         ; preds = %if.else7
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end11
  %6 = load i32, i32* %i, align 4, !dbg !189
  %cmp12 = icmp slt i32 %6, 10, !dbg !191
  br i1 %cmp12, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !193
  %8 = load i32, i32* %i, align 4, !dbg !195
  %idxprom = sext i32 %8 to i64, !dbg !193
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !193
  store i32 0, i32* %arrayidx, align 4, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !198
  %inc = add nsw i32 %9, 1, !dbg !198
  store i32 %inc, i32* %i, align 4, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !202
  %cmp13 = icmp sge i32 %10, 0, !dbg !204
  br i1 %cmp13, label %land.lhs.true, label %if.else26, !dbg !205

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data, align 4, !dbg !206
  %cmp14 = icmp slt i32 %11, 10, !dbg !207
  br i1 %cmp14, label %if.then15, label %if.else26, !dbg !208

if.then15:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !209
  %13 = load i32, i32* %data, align 4, !dbg !211
  %idxprom16 = sext i32 %13 to i64, !dbg !209
  %arrayidx17 = getelementptr inbounds i32, i32* %12, i64 %idxprom16, !dbg !209
  store i32 1, i32* %arrayidx17, align 4, !dbg !212
  store i32 0, i32* %i, align 4, !dbg !213
  br label %for.cond18, !dbg !215

for.cond18:                                       ; preds = %for.inc23, %if.then15
  %14 = load i32, i32* %i, align 4, !dbg !216
  %cmp19 = icmp slt i32 %14, 10, !dbg !218
  br i1 %cmp19, label %for.body20, label %for.end25, !dbg !219

for.body20:                                       ; preds = %for.cond18
  %15 = load i32*, i32** %buffer, align 8, !dbg !220
  %16 = load i32, i32* %i, align 4, !dbg !222
  %idxprom21 = sext i32 %16 to i64, !dbg !220
  %arrayidx22 = getelementptr inbounds i32, i32* %15, i64 %idxprom21, !dbg !220
  %17 = load i32, i32* %arrayidx22, align 4, !dbg !220
  call void @printIntLine(i32 %17), !dbg !223
  br label %for.inc23, !dbg !224

for.inc23:                                        ; preds = %for.body20
  %18 = load i32, i32* %i, align 4, !dbg !225
  %inc24 = add nsw i32 %18, 1, !dbg !225
  store i32 %inc24, i32* %i, align 4, !dbg !225
  br label %for.cond18, !dbg !226, !llvm.loop !227

for.end25:                                        ; preds = %for.cond18
  br label %if.end27, !dbg !229

if.else26:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !230
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %for.end25
  %19 = load i32*, i32** %buffer, align 8, !dbg !232
  %20 = bitcast i32* %19 to i8*, !dbg !232
  call void @free(i8* %20) #8, !dbg !233
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.then6
  ret void, !dbg !234
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !235 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !236, metadata !DIExpression()), !dbg !237
  store i32 -1, i32* %data, align 4, !dbg !238
  %0 = load i32, i32* @staticTrue, align 4, !dbg !239
  %tobool = icmp ne i32 %0, 0, !dbg !239
  br i1 %tobool, label %if.then, label %if.end4, !dbg !241

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !242, metadata !DIExpression()), !dbg !245
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !245
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !246
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !248
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !249
  %cmp = icmp ne i8* %call, null, !dbg !250
  br i1 %cmp, label %if.then1, label %if.else, !dbg !251

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !252
  %call3 = call i32 @atoi(i8* %arraydecay2) #7, !dbg !254
  store i32 %call3, i32* %data, align 4, !dbg !255
  br label %if.end, !dbg !256

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !257
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !259

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !260
  %tobool5 = icmp ne i32 %3, 0, !dbg !260
  br i1 %tobool5, label %if.then6, label %if.end27, !dbg !262

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !263, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !267, metadata !DIExpression()), !dbg !268
  %call7 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !269
  %4 = bitcast i8* %call7 to i32*, !dbg !270
  store i32* %4, i32** %buffer, align 8, !dbg !268
  %5 = load i32*, i32** %buffer, align 8, !dbg !271
  %cmp8 = icmp eq i32* %5, null, !dbg !273
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !274

if.then9:                                         ; preds = %if.then6
  call void @exit(i32 -1) #9, !dbg !275
  unreachable, !dbg !275

if.end10:                                         ; preds = %if.then6
  store i32 0, i32* %i, align 4, !dbg !277
  br label %for.cond, !dbg !279

for.cond:                                         ; preds = %for.inc, %if.end10
  %6 = load i32, i32* %i, align 4, !dbg !280
  %cmp11 = icmp slt i32 %6, 10, !dbg !282
  br i1 %cmp11, label %for.body, label %for.end, !dbg !283

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !284
  %8 = load i32, i32* %i, align 4, !dbg !286
  %idxprom = sext i32 %8 to i64, !dbg !284
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !284
  store i32 0, i32* %arrayidx, align 4, !dbg !287
  br label %for.inc, !dbg !288

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !289
  %inc = add nsw i32 %9, 1, !dbg !289
  store i32 %inc, i32* %i, align 4, !dbg !289
  br label %for.cond, !dbg !290, !llvm.loop !291

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !293
  %cmp12 = icmp sge i32 %10, 0, !dbg !295
  br i1 %cmp12, label %land.lhs.true, label %if.else25, !dbg !296

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data, align 4, !dbg !297
  %cmp13 = icmp slt i32 %11, 10, !dbg !298
  br i1 %cmp13, label %if.then14, label %if.else25, !dbg !299

if.then14:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !300
  %13 = load i32, i32* %data, align 4, !dbg !302
  %idxprom15 = sext i32 %13 to i64, !dbg !300
  %arrayidx16 = getelementptr inbounds i32, i32* %12, i64 %idxprom15, !dbg !300
  store i32 1, i32* %arrayidx16, align 4, !dbg !303
  store i32 0, i32* %i, align 4, !dbg !304
  br label %for.cond17, !dbg !306

for.cond17:                                       ; preds = %for.inc22, %if.then14
  %14 = load i32, i32* %i, align 4, !dbg !307
  %cmp18 = icmp slt i32 %14, 10, !dbg !309
  br i1 %cmp18, label %for.body19, label %for.end24, !dbg !310

for.body19:                                       ; preds = %for.cond17
  %15 = load i32*, i32** %buffer, align 8, !dbg !311
  %16 = load i32, i32* %i, align 4, !dbg !313
  %idxprom20 = sext i32 %16 to i64, !dbg !311
  %arrayidx21 = getelementptr inbounds i32, i32* %15, i64 %idxprom20, !dbg !311
  %17 = load i32, i32* %arrayidx21, align 4, !dbg !311
  call void @printIntLine(i32 %17), !dbg !314
  br label %for.inc22, !dbg !315

for.inc22:                                        ; preds = %for.body19
  %18 = load i32, i32* %i, align 4, !dbg !316
  %inc23 = add nsw i32 %18, 1, !dbg !316
  store i32 %inc23, i32* %i, align 4, !dbg !316
  br label %for.cond17, !dbg !317, !llvm.loop !318

for.end24:                                        ; preds = %for.cond17
  br label %if.end26, !dbg !320

if.else25:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !321
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end24
  %19 = load i32*, i32** %buffer, align 8, !dbg !323
  %20 = bitcast i32* %19 to i8*, !dbg !323
  call void @free(i8* %20) #8, !dbg !324
  br label %if.end27, !dbg !325

if.end27:                                         ; preds = %if.end26, %if.end4
  ret void, !dbg !326
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !327 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !328, metadata !DIExpression()), !dbg !329
  store i32 -1, i32* %data, align 4, !dbg !330
  %0 = load i32, i32* @staticFalse, align 4, !dbg !331
  %tobool = icmp ne i32 %0, 0, !dbg !331
  br i1 %tobool, label %if.then, label %if.else, !dbg !333

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !334
  br label %if.end, !dbg !336

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !337
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !339
  %tobool1 = icmp ne i32 %1, 0, !dbg !339
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !341

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !342, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !346, metadata !DIExpression()), !dbg !347
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !348
  %2 = bitcast i8* %call to i32*, !dbg !349
  store i32* %2, i32** %buffer, align 8, !dbg !347
  %3 = load i32*, i32** %buffer, align 8, !dbg !350
  %cmp = icmp eq i32* %3, null, !dbg !352
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !353

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #9, !dbg !354
  unreachable, !dbg !354

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !356
  br label %for.cond, !dbg !358

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !359
  %cmp5 = icmp slt i32 %4, 10, !dbg !361
  br i1 %cmp5, label %for.body, label %for.end, !dbg !362

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !363
  %6 = load i32, i32* %i, align 4, !dbg !365
  %idxprom = sext i32 %6 to i64, !dbg !363
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !363
  store i32 0, i32* %arrayidx, align 4, !dbg !366
  br label %for.inc, !dbg !367

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !368
  %inc = add nsw i32 %7, 1, !dbg !368
  store i32 %inc, i32* %i, align 4, !dbg !368
  br label %for.cond, !dbg !369, !llvm.loop !370

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !372
  %cmp6 = icmp sge i32 %8, 0, !dbg !374
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !375

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !376
  %10 = load i32, i32* %data, align 4, !dbg !378
  %idxprom8 = sext i32 %10 to i64, !dbg !376
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !376
  store i32 1, i32* %arrayidx9, align 4, !dbg !379
  store i32 0, i32* %i, align 4, !dbg !380
  br label %for.cond10, !dbg !382

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !383
  %cmp11 = icmp slt i32 %11, 10, !dbg !385
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !386

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !387
  %13 = load i32, i32* %i, align 4, !dbg !389
  %idxprom13 = sext i32 %13 to i64, !dbg !387
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !387
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !387
  call void @printIntLine(i32 %14), !dbg !390
  br label %for.inc15, !dbg !391

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !392
  %inc16 = add nsw i32 %15, 1, !dbg !392
  store i32 %inc16, i32* %i, align 4, !dbg !392
  br label %for.cond10, !dbg !393, !llvm.loop !394

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !396

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !397
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !399
  %17 = bitcast i32* %16 to i8*, !dbg !399
  call void @free(i8* %17) #8, !dbg !400
  br label %if.end20, !dbg !401

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !402
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !403 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !404, metadata !DIExpression()), !dbg !405
  store i32 -1, i32* %data, align 4, !dbg !406
  %0 = load i32, i32* @staticTrue, align 4, !dbg !407
  %tobool = icmp ne i32 %0, 0, !dbg !407
  br i1 %tobool, label %if.then, label %if.end, !dbg !409

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !410
  br label %if.end, !dbg !412

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !413
  %tobool1 = icmp ne i32 %1, 0, !dbg !413
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !415

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !416, metadata !DIExpression()), !dbg !419
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !420, metadata !DIExpression()), !dbg !421
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !422
  %2 = bitcast i8* %call to i32*, !dbg !423
  store i32* %2, i32** %buffer, align 8, !dbg !421
  %3 = load i32*, i32** %buffer, align 8, !dbg !424
  %cmp = icmp eq i32* %3, null, !dbg !426
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !427

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #9, !dbg !428
  unreachable, !dbg !428

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !430
  br label %for.cond, !dbg !432

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !433
  %cmp5 = icmp slt i32 %4, 10, !dbg !435
  br i1 %cmp5, label %for.body, label %for.end, !dbg !436

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !437
  %6 = load i32, i32* %i, align 4, !dbg !439
  %idxprom = sext i32 %6 to i64, !dbg !437
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !437
  store i32 0, i32* %arrayidx, align 4, !dbg !440
  br label %for.inc, !dbg !441

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !442
  %inc = add nsw i32 %7, 1, !dbg !442
  store i32 %inc, i32* %i, align 4, !dbg !442
  br label %for.cond, !dbg !443, !llvm.loop !444

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !446
  %cmp6 = icmp sge i32 %8, 0, !dbg !448
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !449

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !450
  %10 = load i32, i32* %data, align 4, !dbg !452
  %idxprom8 = sext i32 %10 to i64, !dbg !450
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !450
  store i32 1, i32* %arrayidx9, align 4, !dbg !453
  store i32 0, i32* %i, align 4, !dbg !454
  br label %for.cond10, !dbg !456

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !457
  %cmp11 = icmp slt i32 %11, 10, !dbg !459
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !460

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !461
  %13 = load i32, i32* %i, align 4, !dbg !463
  %idxprom13 = sext i32 %13 to i64, !dbg !461
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !461
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !461
  call void @printIntLine(i32 %14), !dbg !464
  br label %for.inc15, !dbg !465

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !466
  %inc16 = add nsw i32 %15, 1, !dbg !466
  store i32 %inc16, i32* %i, align 4, !dbg !466
  br label %for.cond10, !dbg !467, !llvm.loop !468

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !470

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !471
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !473
  %17 = bitcast i32* %16 to i8*, !dbg !473
  call void @free(i8* %17) #8, !dbg !474
  br label %if.end19, !dbg !475

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !476
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
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !8, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_bad", scope: !13, file: !13, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 32, type: !8)
!24 = !DILocation(line: 32, column: 9, scope: !20)
!25 = !DILocation(line: 34, column: 10, scope: !20)
!26 = !DILocation(line: 35, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 35, column: 8)
!28 = !DILocation(line: 35, column: 8, scope: !20)
!29 = !DILocalVariable(name: "inputBuffer", scope: !30, file: !13, line: 38, type: !32)
!30 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 9)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 36, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 112, elements: !34)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !{!35}
!35 = !DISubrange(count: 14)
!36 = !DILocation(line: 38, column: 18, scope: !30)
!37 = !DILocation(line: 40, column: 23, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !13, line: 40, column: 17)
!39 = !DILocation(line: 40, column: 53, scope: !38)
!40 = !DILocation(line: 40, column: 17, scope: !38)
!41 = !DILocation(line: 40, column: 60, scope: !38)
!42 = !DILocation(line: 40, column: 17, scope: !30)
!43 = !DILocation(line: 43, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !13, line: 41, column: 13)
!45 = !DILocation(line: 43, column: 24, scope: !44)
!46 = !DILocation(line: 43, column: 22, scope: !44)
!47 = !DILocation(line: 44, column: 13, scope: !44)
!48 = !DILocation(line: 47, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !13, line: 46, column: 13)
!50 = !DILocation(line: 50, column: 5, scope: !31)
!51 = !DILocation(line: 51, column: 8, scope: !52)
!52 = distinct !DILexicalBlock(scope: !20, file: !13, line: 51, column: 8)
!53 = !DILocation(line: 51, column: 8, scope: !20)
!54 = !DILocalVariable(name: "i", scope: !55, file: !13, line: 54, type: !8)
!55 = distinct !DILexicalBlock(scope: !56, file: !13, line: 53, column: 9)
!56 = distinct !DILexicalBlock(scope: !52, file: !13, line: 52, column: 5)
!57 = !DILocation(line: 54, column: 17, scope: !55)
!58 = !DILocalVariable(name: "buffer", scope: !55, file: !13, line: 55, type: !7)
!59 = !DILocation(line: 55, column: 19, scope: !55)
!60 = !DILocation(line: 55, column: 35, scope: !55)
!61 = !DILocation(line: 55, column: 28, scope: !55)
!62 = !DILocation(line: 56, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !55, file: !13, line: 56, column: 17)
!64 = !DILocation(line: 56, column: 24, scope: !63)
!65 = !DILocation(line: 56, column: 17, scope: !55)
!66 = !DILocation(line: 56, column: 34, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !13, line: 56, column: 33)
!68 = !DILocation(line: 58, column: 20, scope: !69)
!69 = distinct !DILexicalBlock(scope: !55, file: !13, line: 58, column: 13)
!70 = !DILocation(line: 58, column: 18, scope: !69)
!71 = !DILocation(line: 58, column: 25, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !13, line: 58, column: 13)
!73 = !DILocation(line: 58, column: 27, scope: !72)
!74 = !DILocation(line: 58, column: 13, scope: !69)
!75 = !DILocation(line: 60, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !13, line: 59, column: 13)
!77 = !DILocation(line: 60, column: 24, scope: !76)
!78 = !DILocation(line: 60, column: 27, scope: !76)
!79 = !DILocation(line: 61, column: 13, scope: !76)
!80 = !DILocation(line: 58, column: 34, scope: !72)
!81 = !DILocation(line: 58, column: 13, scope: !72)
!82 = distinct !{!82, !74, !83, !84}
!83 = !DILocation(line: 61, column: 13, scope: !69)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 64, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !55, file: !13, line: 64, column: 17)
!87 = !DILocation(line: 64, column: 22, scope: !86)
!88 = !DILocation(line: 64, column: 17, scope: !55)
!89 = !DILocation(line: 66, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !13, line: 65, column: 13)
!91 = !DILocation(line: 66, column: 24, scope: !90)
!92 = !DILocation(line: 66, column: 30, scope: !90)
!93 = !DILocation(line: 68, column: 23, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !13, line: 68, column: 17)
!95 = !DILocation(line: 68, column: 21, scope: !94)
!96 = !DILocation(line: 68, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !13, line: 68, column: 17)
!98 = !DILocation(line: 68, column: 30, scope: !97)
!99 = !DILocation(line: 68, column: 17, scope: !94)
!100 = !DILocation(line: 70, column: 34, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !13, line: 69, column: 17)
!102 = !DILocation(line: 70, column: 41, scope: !101)
!103 = !DILocation(line: 70, column: 21, scope: !101)
!104 = !DILocation(line: 71, column: 17, scope: !101)
!105 = !DILocation(line: 68, column: 37, scope: !97)
!106 = !DILocation(line: 68, column: 17, scope: !97)
!107 = distinct !{!107, !99, !108, !84}
!108 = !DILocation(line: 71, column: 17, scope: !94)
!109 = !DILocation(line: 72, column: 13, scope: !90)
!110 = !DILocation(line: 75, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !86, file: !13, line: 74, column: 13)
!112 = !DILocation(line: 77, column: 18, scope: !55)
!113 = !DILocation(line: 77, column: 13, scope: !55)
!114 = !DILocation(line: 79, column: 5, scope: !56)
!115 = !DILocation(line: 80, column: 1, scope: !20)
!116 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_good", scope: !13, file: !13, line: 286, type: !21, scopeLine: 287, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocation(line: 288, column: 5, scope: !116)
!118 = !DILocation(line: 289, column: 5, scope: !116)
!119 = !DILocation(line: 290, column: 5, scope: !116)
!120 = !DILocation(line: 291, column: 5, scope: !116)
!121 = !DILocation(line: 292, column: 1, scope: !116)
!122 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 303, type: !123, scopeLine: 304, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DISubroutineType(types: !124)
!124 = !{!8, !8, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!127 = !DILocalVariable(name: "argc", arg: 1, scope: !122, file: !13, line: 303, type: !8)
!128 = !DILocation(line: 303, column: 14, scope: !122)
!129 = !DILocalVariable(name: "argv", arg: 2, scope: !122, file: !13, line: 303, type: !125)
!130 = !DILocation(line: 303, column: 27, scope: !122)
!131 = !DILocation(line: 306, column: 22, scope: !122)
!132 = !DILocation(line: 306, column: 12, scope: !122)
!133 = !DILocation(line: 306, column: 5, scope: !122)
!134 = !DILocation(line: 308, column: 5, scope: !122)
!135 = !DILocation(line: 309, column: 5, scope: !122)
!136 = !DILocation(line: 310, column: 5, scope: !122)
!137 = !DILocation(line: 313, column: 5, scope: !122)
!138 = !DILocation(line: 314, column: 5, scope: !122)
!139 = !DILocation(line: 315, column: 5, scope: !122)
!140 = !DILocation(line: 317, column: 5, scope: !122)
!141 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!142 = !DILocalVariable(name: "data", scope: !141, file: !13, line: 89, type: !8)
!143 = !DILocation(line: 89, column: 9, scope: !141)
!144 = !DILocation(line: 91, column: 10, scope: !141)
!145 = !DILocation(line: 92, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !13, line: 92, column: 8)
!147 = !DILocation(line: 92, column: 8, scope: !141)
!148 = !DILocalVariable(name: "inputBuffer", scope: !149, file: !13, line: 95, type: !32)
!149 = distinct !DILexicalBlock(scope: !150, file: !13, line: 94, column: 9)
!150 = distinct !DILexicalBlock(scope: !146, file: !13, line: 93, column: 5)
!151 = !DILocation(line: 95, column: 18, scope: !149)
!152 = !DILocation(line: 97, column: 23, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !13, line: 97, column: 17)
!154 = !DILocation(line: 97, column: 53, scope: !153)
!155 = !DILocation(line: 97, column: 17, scope: !153)
!156 = !DILocation(line: 97, column: 60, scope: !153)
!157 = !DILocation(line: 97, column: 17, scope: !149)
!158 = !DILocation(line: 100, column: 29, scope: !159)
!159 = distinct !DILexicalBlock(scope: !153, file: !13, line: 98, column: 13)
!160 = !DILocation(line: 100, column: 24, scope: !159)
!161 = !DILocation(line: 100, column: 22, scope: !159)
!162 = !DILocation(line: 101, column: 13, scope: !159)
!163 = !DILocation(line: 104, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !153, file: !13, line: 103, column: 13)
!165 = !DILocation(line: 107, column: 5, scope: !150)
!166 = !DILocation(line: 108, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !141, file: !13, line: 108, column: 8)
!168 = !DILocation(line: 108, column: 8, scope: !141)
!169 = !DILocation(line: 111, column: 9, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !13, line: 109, column: 5)
!171 = !DILocation(line: 112, column: 5, scope: !170)
!172 = !DILocalVariable(name: "i", scope: !173, file: !13, line: 116, type: !8)
!173 = distinct !DILexicalBlock(scope: !174, file: !13, line: 115, column: 9)
!174 = distinct !DILexicalBlock(scope: !167, file: !13, line: 114, column: 5)
!175 = !DILocation(line: 116, column: 17, scope: !173)
!176 = !DILocalVariable(name: "buffer", scope: !173, file: !13, line: 117, type: !7)
!177 = !DILocation(line: 117, column: 19, scope: !173)
!178 = !DILocation(line: 117, column: 35, scope: !173)
!179 = !DILocation(line: 117, column: 28, scope: !173)
!180 = !DILocation(line: 118, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !173, file: !13, line: 118, column: 17)
!182 = !DILocation(line: 118, column: 24, scope: !181)
!183 = !DILocation(line: 118, column: 17, scope: !173)
!184 = !DILocation(line: 118, column: 34, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !13, line: 118, column: 33)
!186 = !DILocation(line: 120, column: 20, scope: !187)
!187 = distinct !DILexicalBlock(scope: !173, file: !13, line: 120, column: 13)
!188 = !DILocation(line: 120, column: 18, scope: !187)
!189 = !DILocation(line: 120, column: 25, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !13, line: 120, column: 13)
!191 = !DILocation(line: 120, column: 27, scope: !190)
!192 = !DILocation(line: 120, column: 13, scope: !187)
!193 = !DILocation(line: 122, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !13, line: 121, column: 13)
!195 = !DILocation(line: 122, column: 24, scope: !194)
!196 = !DILocation(line: 122, column: 27, scope: !194)
!197 = !DILocation(line: 123, column: 13, scope: !194)
!198 = !DILocation(line: 120, column: 34, scope: !190)
!199 = !DILocation(line: 120, column: 13, scope: !190)
!200 = distinct !{!200, !192, !201, !84}
!201 = !DILocation(line: 123, column: 13, scope: !187)
!202 = !DILocation(line: 125, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !173, file: !13, line: 125, column: 17)
!204 = !DILocation(line: 125, column: 22, scope: !203)
!205 = !DILocation(line: 125, column: 27, scope: !203)
!206 = !DILocation(line: 125, column: 30, scope: !203)
!207 = !DILocation(line: 125, column: 35, scope: !203)
!208 = !DILocation(line: 125, column: 17, scope: !173)
!209 = !DILocation(line: 127, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !203, file: !13, line: 126, column: 13)
!211 = !DILocation(line: 127, column: 24, scope: !210)
!212 = !DILocation(line: 127, column: 30, scope: !210)
!213 = !DILocation(line: 129, column: 23, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !13, line: 129, column: 17)
!215 = !DILocation(line: 129, column: 21, scope: !214)
!216 = !DILocation(line: 129, column: 28, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !13, line: 129, column: 17)
!218 = !DILocation(line: 129, column: 30, scope: !217)
!219 = !DILocation(line: 129, column: 17, scope: !214)
!220 = !DILocation(line: 131, column: 34, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !13, line: 130, column: 17)
!222 = !DILocation(line: 131, column: 41, scope: !221)
!223 = !DILocation(line: 131, column: 21, scope: !221)
!224 = !DILocation(line: 132, column: 17, scope: !221)
!225 = !DILocation(line: 129, column: 37, scope: !217)
!226 = !DILocation(line: 129, column: 17, scope: !217)
!227 = distinct !{!227, !219, !228, !84}
!228 = !DILocation(line: 132, column: 17, scope: !214)
!229 = !DILocation(line: 133, column: 13, scope: !210)
!230 = !DILocation(line: 136, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !203, file: !13, line: 135, column: 13)
!232 = !DILocation(line: 138, column: 18, scope: !173)
!233 = !DILocation(line: 138, column: 13, scope: !173)
!234 = !DILocation(line: 141, column: 1, scope: !141)
!235 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 144, type: !21, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!236 = !DILocalVariable(name: "data", scope: !235, file: !13, line: 146, type: !8)
!237 = !DILocation(line: 146, column: 9, scope: !235)
!238 = !DILocation(line: 148, column: 10, scope: !235)
!239 = !DILocation(line: 149, column: 8, scope: !240)
!240 = distinct !DILexicalBlock(scope: !235, file: !13, line: 149, column: 8)
!241 = !DILocation(line: 149, column: 8, scope: !235)
!242 = !DILocalVariable(name: "inputBuffer", scope: !243, file: !13, line: 152, type: !32)
!243 = distinct !DILexicalBlock(scope: !244, file: !13, line: 151, column: 9)
!244 = distinct !DILexicalBlock(scope: !240, file: !13, line: 150, column: 5)
!245 = !DILocation(line: 152, column: 18, scope: !243)
!246 = !DILocation(line: 154, column: 23, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !13, line: 154, column: 17)
!248 = !DILocation(line: 154, column: 53, scope: !247)
!249 = !DILocation(line: 154, column: 17, scope: !247)
!250 = !DILocation(line: 154, column: 60, scope: !247)
!251 = !DILocation(line: 154, column: 17, scope: !243)
!252 = !DILocation(line: 157, column: 29, scope: !253)
!253 = distinct !DILexicalBlock(scope: !247, file: !13, line: 155, column: 13)
!254 = !DILocation(line: 157, column: 24, scope: !253)
!255 = !DILocation(line: 157, column: 22, scope: !253)
!256 = !DILocation(line: 158, column: 13, scope: !253)
!257 = !DILocation(line: 161, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !247, file: !13, line: 160, column: 13)
!259 = !DILocation(line: 164, column: 5, scope: !244)
!260 = !DILocation(line: 165, column: 8, scope: !261)
!261 = distinct !DILexicalBlock(scope: !235, file: !13, line: 165, column: 8)
!262 = !DILocation(line: 165, column: 8, scope: !235)
!263 = !DILocalVariable(name: "i", scope: !264, file: !13, line: 168, type: !8)
!264 = distinct !DILexicalBlock(scope: !265, file: !13, line: 167, column: 9)
!265 = distinct !DILexicalBlock(scope: !261, file: !13, line: 166, column: 5)
!266 = !DILocation(line: 168, column: 17, scope: !264)
!267 = !DILocalVariable(name: "buffer", scope: !264, file: !13, line: 169, type: !7)
!268 = !DILocation(line: 169, column: 19, scope: !264)
!269 = !DILocation(line: 169, column: 35, scope: !264)
!270 = !DILocation(line: 169, column: 28, scope: !264)
!271 = !DILocation(line: 170, column: 17, scope: !272)
!272 = distinct !DILexicalBlock(scope: !264, file: !13, line: 170, column: 17)
!273 = !DILocation(line: 170, column: 24, scope: !272)
!274 = !DILocation(line: 170, column: 17, scope: !264)
!275 = !DILocation(line: 170, column: 34, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !13, line: 170, column: 33)
!277 = !DILocation(line: 172, column: 20, scope: !278)
!278 = distinct !DILexicalBlock(scope: !264, file: !13, line: 172, column: 13)
!279 = !DILocation(line: 172, column: 18, scope: !278)
!280 = !DILocation(line: 172, column: 25, scope: !281)
!281 = distinct !DILexicalBlock(scope: !278, file: !13, line: 172, column: 13)
!282 = !DILocation(line: 172, column: 27, scope: !281)
!283 = !DILocation(line: 172, column: 13, scope: !278)
!284 = !DILocation(line: 174, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !13, line: 173, column: 13)
!286 = !DILocation(line: 174, column: 24, scope: !285)
!287 = !DILocation(line: 174, column: 27, scope: !285)
!288 = !DILocation(line: 175, column: 13, scope: !285)
!289 = !DILocation(line: 172, column: 34, scope: !281)
!290 = !DILocation(line: 172, column: 13, scope: !281)
!291 = distinct !{!291, !283, !292, !84}
!292 = !DILocation(line: 175, column: 13, scope: !278)
!293 = !DILocation(line: 177, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !264, file: !13, line: 177, column: 17)
!295 = !DILocation(line: 177, column: 22, scope: !294)
!296 = !DILocation(line: 177, column: 27, scope: !294)
!297 = !DILocation(line: 177, column: 30, scope: !294)
!298 = !DILocation(line: 177, column: 35, scope: !294)
!299 = !DILocation(line: 177, column: 17, scope: !264)
!300 = !DILocation(line: 179, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !294, file: !13, line: 178, column: 13)
!302 = !DILocation(line: 179, column: 24, scope: !301)
!303 = !DILocation(line: 179, column: 30, scope: !301)
!304 = !DILocation(line: 181, column: 23, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !13, line: 181, column: 17)
!306 = !DILocation(line: 181, column: 21, scope: !305)
!307 = !DILocation(line: 181, column: 28, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !13, line: 181, column: 17)
!309 = !DILocation(line: 181, column: 30, scope: !308)
!310 = !DILocation(line: 181, column: 17, scope: !305)
!311 = !DILocation(line: 183, column: 34, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !13, line: 182, column: 17)
!313 = !DILocation(line: 183, column: 41, scope: !312)
!314 = !DILocation(line: 183, column: 21, scope: !312)
!315 = !DILocation(line: 184, column: 17, scope: !312)
!316 = !DILocation(line: 181, column: 37, scope: !308)
!317 = !DILocation(line: 181, column: 17, scope: !308)
!318 = distinct !{!318, !310, !319, !84}
!319 = !DILocation(line: 184, column: 17, scope: !305)
!320 = !DILocation(line: 185, column: 13, scope: !301)
!321 = !DILocation(line: 188, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !294, file: !13, line: 187, column: 13)
!323 = !DILocation(line: 190, column: 18, scope: !264)
!324 = !DILocation(line: 190, column: 13, scope: !264)
!325 = !DILocation(line: 192, column: 5, scope: !265)
!326 = !DILocation(line: 193, column: 1, scope: !235)
!327 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 196, type: !21, scopeLine: 197, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!328 = !DILocalVariable(name: "data", scope: !327, file: !13, line: 198, type: !8)
!329 = !DILocation(line: 198, column: 9, scope: !327)
!330 = !DILocation(line: 200, column: 10, scope: !327)
!331 = !DILocation(line: 201, column: 8, scope: !332)
!332 = distinct !DILexicalBlock(scope: !327, file: !13, line: 201, column: 8)
!333 = !DILocation(line: 201, column: 8, scope: !327)
!334 = !DILocation(line: 204, column: 9, scope: !335)
!335 = distinct !DILexicalBlock(scope: !332, file: !13, line: 202, column: 5)
!336 = !DILocation(line: 205, column: 5, scope: !335)
!337 = !DILocation(line: 210, column: 14, scope: !338)
!338 = distinct !DILexicalBlock(scope: !332, file: !13, line: 207, column: 5)
!339 = !DILocation(line: 212, column: 8, scope: !340)
!340 = distinct !DILexicalBlock(scope: !327, file: !13, line: 212, column: 8)
!341 = !DILocation(line: 212, column: 8, scope: !327)
!342 = !DILocalVariable(name: "i", scope: !343, file: !13, line: 215, type: !8)
!343 = distinct !DILexicalBlock(scope: !344, file: !13, line: 214, column: 9)
!344 = distinct !DILexicalBlock(scope: !340, file: !13, line: 213, column: 5)
!345 = !DILocation(line: 215, column: 17, scope: !343)
!346 = !DILocalVariable(name: "buffer", scope: !343, file: !13, line: 216, type: !7)
!347 = !DILocation(line: 216, column: 19, scope: !343)
!348 = !DILocation(line: 216, column: 35, scope: !343)
!349 = !DILocation(line: 216, column: 28, scope: !343)
!350 = !DILocation(line: 217, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !343, file: !13, line: 217, column: 17)
!352 = !DILocation(line: 217, column: 24, scope: !351)
!353 = !DILocation(line: 217, column: 17, scope: !343)
!354 = !DILocation(line: 217, column: 34, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !13, line: 217, column: 33)
!356 = !DILocation(line: 219, column: 20, scope: !357)
!357 = distinct !DILexicalBlock(scope: !343, file: !13, line: 219, column: 13)
!358 = !DILocation(line: 219, column: 18, scope: !357)
!359 = !DILocation(line: 219, column: 25, scope: !360)
!360 = distinct !DILexicalBlock(scope: !357, file: !13, line: 219, column: 13)
!361 = !DILocation(line: 219, column: 27, scope: !360)
!362 = !DILocation(line: 219, column: 13, scope: !357)
!363 = !DILocation(line: 221, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !360, file: !13, line: 220, column: 13)
!365 = !DILocation(line: 221, column: 24, scope: !364)
!366 = !DILocation(line: 221, column: 27, scope: !364)
!367 = !DILocation(line: 222, column: 13, scope: !364)
!368 = !DILocation(line: 219, column: 34, scope: !360)
!369 = !DILocation(line: 219, column: 13, scope: !360)
!370 = distinct !{!370, !362, !371, !84}
!371 = !DILocation(line: 222, column: 13, scope: !357)
!372 = !DILocation(line: 225, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !343, file: !13, line: 225, column: 17)
!374 = !DILocation(line: 225, column: 22, scope: !373)
!375 = !DILocation(line: 225, column: 17, scope: !343)
!376 = !DILocation(line: 227, column: 17, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !13, line: 226, column: 13)
!378 = !DILocation(line: 227, column: 24, scope: !377)
!379 = !DILocation(line: 227, column: 30, scope: !377)
!380 = !DILocation(line: 229, column: 23, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !13, line: 229, column: 17)
!382 = !DILocation(line: 229, column: 21, scope: !381)
!383 = !DILocation(line: 229, column: 28, scope: !384)
!384 = distinct !DILexicalBlock(scope: !381, file: !13, line: 229, column: 17)
!385 = !DILocation(line: 229, column: 30, scope: !384)
!386 = !DILocation(line: 229, column: 17, scope: !381)
!387 = !DILocation(line: 231, column: 34, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !13, line: 230, column: 17)
!389 = !DILocation(line: 231, column: 41, scope: !388)
!390 = !DILocation(line: 231, column: 21, scope: !388)
!391 = !DILocation(line: 232, column: 17, scope: !388)
!392 = !DILocation(line: 229, column: 37, scope: !384)
!393 = !DILocation(line: 229, column: 17, scope: !384)
!394 = distinct !{!394, !386, !395, !84}
!395 = !DILocation(line: 232, column: 17, scope: !381)
!396 = !DILocation(line: 233, column: 13, scope: !377)
!397 = !DILocation(line: 236, column: 17, scope: !398)
!398 = distinct !DILexicalBlock(scope: !373, file: !13, line: 235, column: 13)
!399 = !DILocation(line: 238, column: 18, scope: !343)
!400 = !DILocation(line: 238, column: 13, scope: !343)
!401 = !DILocation(line: 240, column: 5, scope: !344)
!402 = !DILocation(line: 241, column: 1, scope: !327)
!403 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 244, type: !21, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!404 = !DILocalVariable(name: "data", scope: !403, file: !13, line: 246, type: !8)
!405 = !DILocation(line: 246, column: 9, scope: !403)
!406 = !DILocation(line: 248, column: 10, scope: !403)
!407 = !DILocation(line: 249, column: 8, scope: !408)
!408 = distinct !DILexicalBlock(scope: !403, file: !13, line: 249, column: 8)
!409 = !DILocation(line: 249, column: 8, scope: !403)
!410 = !DILocation(line: 253, column: 14, scope: !411)
!411 = distinct !DILexicalBlock(scope: !408, file: !13, line: 250, column: 5)
!412 = !DILocation(line: 254, column: 5, scope: !411)
!413 = !DILocation(line: 255, column: 8, scope: !414)
!414 = distinct !DILexicalBlock(scope: !403, file: !13, line: 255, column: 8)
!415 = !DILocation(line: 255, column: 8, scope: !403)
!416 = !DILocalVariable(name: "i", scope: !417, file: !13, line: 258, type: !8)
!417 = distinct !DILexicalBlock(scope: !418, file: !13, line: 257, column: 9)
!418 = distinct !DILexicalBlock(scope: !414, file: !13, line: 256, column: 5)
!419 = !DILocation(line: 258, column: 17, scope: !417)
!420 = !DILocalVariable(name: "buffer", scope: !417, file: !13, line: 259, type: !7)
!421 = !DILocation(line: 259, column: 19, scope: !417)
!422 = !DILocation(line: 259, column: 35, scope: !417)
!423 = !DILocation(line: 259, column: 28, scope: !417)
!424 = !DILocation(line: 260, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !417, file: !13, line: 260, column: 17)
!426 = !DILocation(line: 260, column: 24, scope: !425)
!427 = !DILocation(line: 260, column: 17, scope: !417)
!428 = !DILocation(line: 260, column: 34, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !13, line: 260, column: 33)
!430 = !DILocation(line: 262, column: 20, scope: !431)
!431 = distinct !DILexicalBlock(scope: !417, file: !13, line: 262, column: 13)
!432 = !DILocation(line: 262, column: 18, scope: !431)
!433 = !DILocation(line: 262, column: 25, scope: !434)
!434 = distinct !DILexicalBlock(scope: !431, file: !13, line: 262, column: 13)
!435 = !DILocation(line: 262, column: 27, scope: !434)
!436 = !DILocation(line: 262, column: 13, scope: !431)
!437 = !DILocation(line: 264, column: 17, scope: !438)
!438 = distinct !DILexicalBlock(scope: !434, file: !13, line: 263, column: 13)
!439 = !DILocation(line: 264, column: 24, scope: !438)
!440 = !DILocation(line: 264, column: 27, scope: !438)
!441 = !DILocation(line: 265, column: 13, scope: !438)
!442 = !DILocation(line: 262, column: 34, scope: !434)
!443 = !DILocation(line: 262, column: 13, scope: !434)
!444 = distinct !{!444, !436, !445, !84}
!445 = !DILocation(line: 265, column: 13, scope: !431)
!446 = !DILocation(line: 268, column: 17, scope: !447)
!447 = distinct !DILexicalBlock(scope: !417, file: !13, line: 268, column: 17)
!448 = !DILocation(line: 268, column: 22, scope: !447)
!449 = !DILocation(line: 268, column: 17, scope: !417)
!450 = !DILocation(line: 270, column: 17, scope: !451)
!451 = distinct !DILexicalBlock(scope: !447, file: !13, line: 269, column: 13)
!452 = !DILocation(line: 270, column: 24, scope: !451)
!453 = !DILocation(line: 270, column: 30, scope: !451)
!454 = !DILocation(line: 272, column: 23, scope: !455)
!455 = distinct !DILexicalBlock(scope: !451, file: !13, line: 272, column: 17)
!456 = !DILocation(line: 272, column: 21, scope: !455)
!457 = !DILocation(line: 272, column: 28, scope: !458)
!458 = distinct !DILexicalBlock(scope: !455, file: !13, line: 272, column: 17)
!459 = !DILocation(line: 272, column: 30, scope: !458)
!460 = !DILocation(line: 272, column: 17, scope: !455)
!461 = !DILocation(line: 274, column: 34, scope: !462)
!462 = distinct !DILexicalBlock(scope: !458, file: !13, line: 273, column: 17)
!463 = !DILocation(line: 274, column: 41, scope: !462)
!464 = !DILocation(line: 274, column: 21, scope: !462)
!465 = !DILocation(line: 275, column: 17, scope: !462)
!466 = !DILocation(line: 272, column: 37, scope: !458)
!467 = !DILocation(line: 272, column: 17, scope: !458)
!468 = distinct !{!468, !460, !469, !84}
!469 = !DILocation(line: 275, column: 17, scope: !455)
!470 = !DILocation(line: 276, column: 13, scope: !451)
!471 = !DILocation(line: 279, column: 17, scope: !472)
!472 = distinct !DILexicalBlock(scope: !447, file: !13, line: 278, column: 13)
!473 = !DILocation(line: 281, column: 18, scope: !417)
!474 = !DILocation(line: 281, column: 13, scope: !417)
!475 = !DILocation(line: 283, column: 5, scope: !418)
!476 = !DILocation(line: 284, column: 1, scope: !403)
