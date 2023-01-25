; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType = type { i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
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
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !49
  store i32 %2, i32* %unionFirst, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !51, metadata !DIExpression()), !dbg !53
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !54
  %3 = load i32, i32* %unionSecond, align 4, !dbg !54
  store i32 %3, i32* %data3, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %i, metadata !55, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !58, metadata !DIExpression()), !dbg !59
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !60
  %4 = bitcast i8* %call4 to i32*, !dbg !61
  store i32* %4, i32** %buffer, align 8, !dbg !59
  %5 = load i32*, i32** %buffer, align 8, !dbg !62
  %cmp5 = icmp eq i32* %5, null, !dbg !64
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !65

if.then6:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !66
  unreachable, !dbg !66

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load i32, i32* %i, align 4, !dbg !71
  %cmp8 = icmp slt i32 %6, 10, !dbg !73
  br i1 %cmp8, label %for.body, label %for.end, !dbg !74

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
  %10 = load i32, i32* %data3, align 4, !dbg !85
  %cmp9 = icmp sge i32 %10, 0, !dbg !87
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !88

if.then10:                                        ; preds = %for.end
  %11 = load i32*, i32** %buffer, align 8, !dbg !89
  %12 = load i32, i32* %data3, align 4, !dbg !91
  %idxprom11 = sext i32 %12 to i64, !dbg !89
  %arrayidx12 = getelementptr inbounds i32, i32* %11, i64 %idxprom11, !dbg !89
  store i32 1, i32* %arrayidx12, align 4, !dbg !92
  store i32 0, i32* %i, align 4, !dbg !93
  br label %for.cond13, !dbg !95

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %13 = load i32, i32* %i, align 4, !dbg !96
  %cmp14 = icmp slt i32 %13, 10, !dbg !98
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !99

for.body15:                                       ; preds = %for.cond13
  %14 = load i32*, i32** %buffer, align 8, !dbg !100
  %15 = load i32, i32* %i, align 4, !dbg !102
  %idxprom16 = sext i32 %15 to i64, !dbg !100
  %arrayidx17 = getelementptr inbounds i32, i32* %14, i64 %idxprom16, !dbg !100
  %16 = load i32, i32* %arrayidx17, align 4, !dbg !100
  call void @printIntLine(i32 %16), !dbg !103
  br label %for.inc18, !dbg !104

for.inc18:                                        ; preds = %for.body15
  %17 = load i32, i32* %i, align 4, !dbg !105
  %inc19 = add nsw i32 %17, 1, !dbg !105
  store i32 %inc19, i32* %i, align 4, !dbg !105
  br label %for.cond13, !dbg !106, !llvm.loop !107

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !109

if.else21:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %18 = load i32*, i32** %buffer, align 8, !dbg !112
  %19 = bitcast i32* %18 to i8*, !dbg !112
  call void @free(i8* %19) #8, !dbg !113
  ret void, !dbg !114
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_good() #0 !dbg !115 {
entry:
  call void @goodG2B(), !dbg !116
  call void @goodB2G(), !dbg !117
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_good(), !dbg !132
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !134
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_bad(), !dbg !135
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !136
  ret i32 0, !dbg !137
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !138 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion, metadata !141, metadata !DIExpression()), !dbg !142
  store i32 -1, i32* %data, align 4, !dbg !143
  store i32 7, i32* %data, align 4, !dbg !144
  %0 = load i32, i32* %data, align 4, !dbg !145
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !146
  store i32 %0, i32* %unionFirst, align 4, !dbg !147
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !148, metadata !DIExpression()), !dbg !150
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !151
  %1 = load i32, i32* %unionSecond, align 4, !dbg !151
  store i32 %1, i32* %data1, align 4, !dbg !150
  call void @llvm.dbg.declare(metadata i32* %i, metadata !152, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !155, metadata !DIExpression()), !dbg !156
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !157
  %2 = bitcast i8* %call to i32*, !dbg !158
  store i32* %2, i32** %buffer, align 8, !dbg !156
  %3 = load i32*, i32** %buffer, align 8, !dbg !159
  %cmp = icmp eq i32* %3, null, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !168
  %cmp2 = icmp slt i32 %4, 10, !dbg !170
  br i1 %cmp2, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !172
  %6 = load i32, i32* %i, align 4, !dbg !174
  %idxprom = sext i32 %6 to i64, !dbg !172
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !172
  store i32 0, i32* %arrayidx, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !177
  %inc = add nsw i32 %7, 1, !dbg !177
  store i32 %inc, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !181
  %cmp3 = icmp sge i32 %8, 0, !dbg !183
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !184

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !185
  %10 = load i32, i32* %data1, align 4, !dbg !187
  %idxprom5 = sext i32 %10 to i64, !dbg !185
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !185
  store i32 1, i32* %arrayidx6, align 4, !dbg !188
  store i32 0, i32* %i, align 4, !dbg !189
  br label %for.cond7, !dbg !191

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !192
  %cmp8 = icmp slt i32 %11, 10, !dbg !194
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !195

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !196
  %13 = load i32, i32* %i, align 4, !dbg !198
  %idxprom10 = sext i32 %13 to i64, !dbg !196
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !196
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !196
  call void @printIntLine(i32 %14), !dbg !199
  br label %for.inc12, !dbg !200

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !201
  %inc13 = add nsw i32 %15, 1, !dbg !201
  store i32 %inc13, i32* %i, align 4, !dbg !201
  br label %for.cond7, !dbg !202, !llvm.loop !203

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !205

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !206
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !208
  %17 = bitcast i32* %16 to i8*, !dbg !208
  call void @free(i8* %17) #8, !dbg !209
  ret void, !dbg !210
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !211 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion, metadata !214, metadata !DIExpression()), !dbg !215
  store i32 -1, i32* %data, align 4, !dbg !216
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !217, metadata !DIExpression()), !dbg !219
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !219
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !219
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !220
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !222
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !223
  %cmp = icmp ne i8* %call, null, !dbg !224
  br i1 %cmp, label %if.then, label %if.else, !dbg !225

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !226
  %call2 = call i32 @atoi(i8* %arraydecay1) #7, !dbg !228
  store i32 %call2, i32* %data, align 4, !dbg !229
  br label %if.end, !dbg !230

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !231
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !233
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !234
  store i32 %2, i32* %unionFirst, align 4, !dbg !235
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !236, metadata !DIExpression()), !dbg !238
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !239
  %3 = load i32, i32* %unionSecond, align 4, !dbg !239
  store i32 %3, i32* %data3, align 4, !dbg !238
  call void @llvm.dbg.declare(metadata i32* %i, metadata !240, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !243, metadata !DIExpression()), !dbg !244
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !245
  %4 = bitcast i8* %call4 to i32*, !dbg !246
  store i32* %4, i32** %buffer, align 8, !dbg !244
  %5 = load i32*, i32** %buffer, align 8, !dbg !247
  %cmp5 = icmp eq i32* %5, null, !dbg !249
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !250

if.then6:                                         ; preds = %if.end
  call void @exit(i32 -1) #9, !dbg !251
  unreachable, !dbg !251

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !255

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load i32, i32* %i, align 4, !dbg !256
  %cmp8 = icmp slt i32 %6, 10, !dbg !258
  br i1 %cmp8, label %for.body, label %for.end, !dbg !259

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !260
  %8 = load i32, i32* %i, align 4, !dbg !262
  %idxprom = sext i32 %8 to i64, !dbg !260
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !260
  store i32 0, i32* %arrayidx, align 4, !dbg !263
  br label %for.inc, !dbg !264

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !265
  %inc = add nsw i32 %9, 1, !dbg !265
  store i32 %inc, i32* %i, align 4, !dbg !265
  br label %for.cond, !dbg !266, !llvm.loop !267

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data3, align 4, !dbg !269
  %cmp9 = icmp sge i32 %10, 0, !dbg !271
  br i1 %cmp9, label %land.lhs.true, label %if.else22, !dbg !272

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data3, align 4, !dbg !273
  %cmp10 = icmp slt i32 %11, 10, !dbg !274
  br i1 %cmp10, label %if.then11, label %if.else22, !dbg !275

if.then11:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !276
  %13 = load i32, i32* %data3, align 4, !dbg !278
  %idxprom12 = sext i32 %13 to i64, !dbg !276
  %arrayidx13 = getelementptr inbounds i32, i32* %12, i64 %idxprom12, !dbg !276
  store i32 1, i32* %arrayidx13, align 4, !dbg !279
  store i32 0, i32* %i, align 4, !dbg !280
  br label %for.cond14, !dbg !282

for.cond14:                                       ; preds = %for.inc19, %if.then11
  %14 = load i32, i32* %i, align 4, !dbg !283
  %cmp15 = icmp slt i32 %14, 10, !dbg !285
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !286

for.body16:                                       ; preds = %for.cond14
  %15 = load i32*, i32** %buffer, align 8, !dbg !287
  %16 = load i32, i32* %i, align 4, !dbg !289
  %idxprom17 = sext i32 %16 to i64, !dbg !287
  %arrayidx18 = getelementptr inbounds i32, i32* %15, i64 %idxprom17, !dbg !287
  %17 = load i32, i32* %arrayidx18, align 4, !dbg !287
  call void @printIntLine(i32 %17), !dbg !290
  br label %for.inc19, !dbg !291

for.inc19:                                        ; preds = %for.body16
  %18 = load i32, i32* %i, align 4, !dbg !292
  %inc20 = add nsw i32 %18, 1, !dbg !292
  store i32 %inc20, i32* %i, align 4, !dbg !292
  br label %for.cond14, !dbg !293, !llvm.loop !294

for.end21:                                        ; preds = %for.cond14
  br label %if.end23, !dbg !296

if.else22:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !297
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end21
  %19 = load i32*, i32** %buffer, align 8, !dbg !299
  %20 = bitcast i32* %19 to i8*, !dbg !299
  call void @free(i8* %20) #8, !dbg !300
  ret void, !dbg !301
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_bad", scope: !15, file: !15, line: 30, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 32, type: !6)
!19 = !DILocation(line: 32, column: 9, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 33, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType", file: !15, line: 26, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 22, size: 32, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 24, baseType: !6, size: 32)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 25, baseType: !6, size: 32)
!26 = !DILocation(line: 33, column: 68, scope: !14)
!27 = !DILocation(line: 35, column: 10, scope: !14)
!28 = !DILocalVariable(name: "inputBuffer", scope: !29, file: !15, line: 37, type: !30)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 112, elements: !32)
!31 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!32 = !{!33}
!33 = !DISubrange(count: 14)
!34 = !DILocation(line: 37, column: 14, scope: !29)
!35 = !DILocation(line: 39, column: 19, scope: !36)
!36 = distinct !DILexicalBlock(scope: !29, file: !15, line: 39, column: 13)
!37 = !DILocation(line: 39, column: 49, scope: !36)
!38 = !DILocation(line: 39, column: 13, scope: !36)
!39 = !DILocation(line: 39, column: 56, scope: !36)
!40 = !DILocation(line: 39, column: 13, scope: !29)
!41 = !DILocation(line: 42, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !15, line: 40, column: 9)
!43 = !DILocation(line: 42, column: 20, scope: !42)
!44 = !DILocation(line: 42, column: 18, scope: !42)
!45 = !DILocation(line: 43, column: 9, scope: !42)
!46 = !DILocation(line: 46, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !15, line: 45, column: 9)
!48 = !DILocation(line: 49, column: 26, scope: !14)
!49 = !DILocation(line: 49, column: 13, scope: !14)
!50 = !DILocation(line: 49, column: 24, scope: !14)
!51 = !DILocalVariable(name: "data", scope: !52, file: !15, line: 51, type: !6)
!52 = distinct !DILexicalBlock(scope: !14, file: !15, line: 50, column: 5)
!53 = !DILocation(line: 51, column: 13, scope: !52)
!54 = !DILocation(line: 51, column: 28, scope: !52)
!55 = !DILocalVariable(name: "i", scope: !56, file: !15, line: 53, type: !6)
!56 = distinct !DILexicalBlock(scope: !52, file: !15, line: 52, column: 9)
!57 = !DILocation(line: 53, column: 17, scope: !56)
!58 = !DILocalVariable(name: "buffer", scope: !56, file: !15, line: 54, type: !5)
!59 = !DILocation(line: 54, column: 19, scope: !56)
!60 = !DILocation(line: 54, column: 35, scope: !56)
!61 = !DILocation(line: 54, column: 28, scope: !56)
!62 = !DILocation(line: 55, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !56, file: !15, line: 55, column: 17)
!64 = !DILocation(line: 55, column: 24, scope: !63)
!65 = !DILocation(line: 55, column: 17, scope: !56)
!66 = !DILocation(line: 55, column: 34, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 55, column: 33)
!68 = !DILocation(line: 57, column: 20, scope: !69)
!69 = distinct !DILexicalBlock(scope: !56, file: !15, line: 57, column: 13)
!70 = !DILocation(line: 57, column: 18, scope: !69)
!71 = !DILocation(line: 57, column: 25, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !15, line: 57, column: 13)
!73 = !DILocation(line: 57, column: 27, scope: !72)
!74 = !DILocation(line: 57, column: 13, scope: !69)
!75 = !DILocation(line: 59, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 58, column: 13)
!77 = !DILocation(line: 59, column: 24, scope: !76)
!78 = !DILocation(line: 59, column: 27, scope: !76)
!79 = !DILocation(line: 60, column: 13, scope: !76)
!80 = !DILocation(line: 57, column: 34, scope: !72)
!81 = !DILocation(line: 57, column: 13, scope: !72)
!82 = distinct !{!82, !74, !83, !84}
!83 = !DILocation(line: 60, column: 13, scope: !69)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 63, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !56, file: !15, line: 63, column: 17)
!87 = !DILocation(line: 63, column: 22, scope: !86)
!88 = !DILocation(line: 63, column: 17, scope: !56)
!89 = !DILocation(line: 65, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !15, line: 64, column: 13)
!91 = !DILocation(line: 65, column: 24, scope: !90)
!92 = !DILocation(line: 65, column: 30, scope: !90)
!93 = !DILocation(line: 67, column: 23, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 67, column: 17)
!95 = !DILocation(line: 67, column: 21, scope: !94)
!96 = !DILocation(line: 67, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !15, line: 67, column: 17)
!98 = !DILocation(line: 67, column: 30, scope: !97)
!99 = !DILocation(line: 67, column: 17, scope: !94)
!100 = !DILocation(line: 69, column: 34, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 68, column: 17)
!102 = !DILocation(line: 69, column: 41, scope: !101)
!103 = !DILocation(line: 69, column: 21, scope: !101)
!104 = !DILocation(line: 70, column: 17, scope: !101)
!105 = !DILocation(line: 67, column: 37, scope: !97)
!106 = !DILocation(line: 67, column: 17, scope: !97)
!107 = distinct !{!107, !99, !108, !84}
!108 = !DILocation(line: 70, column: 17, scope: !94)
!109 = !DILocation(line: 71, column: 13, scope: !90)
!110 = !DILocation(line: 74, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !86, file: !15, line: 73, column: 13)
!112 = !DILocation(line: 76, column: 18, scope: !56)
!113 = !DILocation(line: 76, column: 13, scope: !56)
!114 = !DILocation(line: 79, column: 1, scope: !14)
!115 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_good", scope: !15, file: !15, line: 178, type: !16, scopeLine: 179, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 180, column: 5, scope: !115)
!117 = !DILocation(line: 181, column: 5, scope: !115)
!118 = !DILocation(line: 182, column: 1, scope: !115)
!119 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 192, type: !120, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{!6, !6, !122}
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!124 = !DILocalVariable(name: "argc", arg: 1, scope: !119, file: !15, line: 192, type: !6)
!125 = !DILocation(line: 192, column: 14, scope: !119)
!126 = !DILocalVariable(name: "argv", arg: 2, scope: !119, file: !15, line: 192, type: !122)
!127 = !DILocation(line: 192, column: 27, scope: !119)
!128 = !DILocation(line: 195, column: 22, scope: !119)
!129 = !DILocation(line: 195, column: 12, scope: !119)
!130 = !DILocation(line: 195, column: 5, scope: !119)
!131 = !DILocation(line: 197, column: 5, scope: !119)
!132 = !DILocation(line: 198, column: 5, scope: !119)
!133 = !DILocation(line: 199, column: 5, scope: !119)
!134 = !DILocation(line: 202, column: 5, scope: !119)
!135 = !DILocation(line: 203, column: 5, scope: !119)
!136 = !DILocation(line: 204, column: 5, scope: !119)
!137 = !DILocation(line: 206, column: 5, scope: !119)
!138 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !15, line: 88, type: !6)
!140 = !DILocation(line: 88, column: 9, scope: !138)
!141 = !DILocalVariable(name: "myUnion", scope: !138, file: !15, line: 89, type: !21)
!142 = !DILocation(line: 89, column: 68, scope: !138)
!143 = !DILocation(line: 91, column: 10, scope: !138)
!144 = !DILocation(line: 94, column: 10, scope: !138)
!145 = !DILocation(line: 95, column: 26, scope: !138)
!146 = !DILocation(line: 95, column: 13, scope: !138)
!147 = !DILocation(line: 95, column: 24, scope: !138)
!148 = !DILocalVariable(name: "data", scope: !149, file: !15, line: 97, type: !6)
!149 = distinct !DILexicalBlock(scope: !138, file: !15, line: 96, column: 5)
!150 = !DILocation(line: 97, column: 13, scope: !149)
!151 = !DILocation(line: 97, column: 28, scope: !149)
!152 = !DILocalVariable(name: "i", scope: !153, file: !15, line: 99, type: !6)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 98, column: 9)
!154 = !DILocation(line: 99, column: 17, scope: !153)
!155 = !DILocalVariable(name: "buffer", scope: !153, file: !15, line: 100, type: !5)
!156 = !DILocation(line: 100, column: 19, scope: !153)
!157 = !DILocation(line: 100, column: 35, scope: !153)
!158 = !DILocation(line: 100, column: 28, scope: !153)
!159 = !DILocation(line: 101, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !15, line: 101, column: 17)
!161 = !DILocation(line: 101, column: 24, scope: !160)
!162 = !DILocation(line: 101, column: 17, scope: !153)
!163 = !DILocation(line: 101, column: 34, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 101, column: 33)
!165 = !DILocation(line: 103, column: 20, scope: !166)
!166 = distinct !DILexicalBlock(scope: !153, file: !15, line: 103, column: 13)
!167 = !DILocation(line: 103, column: 18, scope: !166)
!168 = !DILocation(line: 103, column: 25, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !15, line: 103, column: 13)
!170 = !DILocation(line: 103, column: 27, scope: !169)
!171 = !DILocation(line: 103, column: 13, scope: !166)
!172 = !DILocation(line: 105, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !15, line: 104, column: 13)
!174 = !DILocation(line: 105, column: 24, scope: !173)
!175 = !DILocation(line: 105, column: 27, scope: !173)
!176 = !DILocation(line: 106, column: 13, scope: !173)
!177 = !DILocation(line: 103, column: 34, scope: !169)
!178 = !DILocation(line: 103, column: 13, scope: !169)
!179 = distinct !{!179, !171, !180, !84}
!180 = !DILocation(line: 106, column: 13, scope: !166)
!181 = !DILocation(line: 109, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !153, file: !15, line: 109, column: 17)
!183 = !DILocation(line: 109, column: 22, scope: !182)
!184 = !DILocation(line: 109, column: 17, scope: !153)
!185 = !DILocation(line: 111, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !15, line: 110, column: 13)
!187 = !DILocation(line: 111, column: 24, scope: !186)
!188 = !DILocation(line: 111, column: 30, scope: !186)
!189 = !DILocation(line: 113, column: 23, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !15, line: 113, column: 17)
!191 = !DILocation(line: 113, column: 21, scope: !190)
!192 = !DILocation(line: 113, column: 28, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !15, line: 113, column: 17)
!194 = !DILocation(line: 113, column: 30, scope: !193)
!195 = !DILocation(line: 113, column: 17, scope: !190)
!196 = !DILocation(line: 115, column: 34, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !15, line: 114, column: 17)
!198 = !DILocation(line: 115, column: 41, scope: !197)
!199 = !DILocation(line: 115, column: 21, scope: !197)
!200 = !DILocation(line: 116, column: 17, scope: !197)
!201 = !DILocation(line: 113, column: 37, scope: !193)
!202 = !DILocation(line: 113, column: 17, scope: !193)
!203 = distinct !{!203, !195, !204, !84}
!204 = !DILocation(line: 116, column: 17, scope: !190)
!205 = !DILocation(line: 117, column: 13, scope: !186)
!206 = !DILocation(line: 120, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !182, file: !15, line: 119, column: 13)
!208 = !DILocation(line: 122, column: 18, scope: !153)
!209 = !DILocation(line: 122, column: 13, scope: !153)
!210 = !DILocation(line: 125, column: 1, scope: !138)
!211 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 128, type: !16, scopeLine: 129, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!212 = !DILocalVariable(name: "data", scope: !211, file: !15, line: 130, type: !6)
!213 = !DILocation(line: 130, column: 9, scope: !211)
!214 = !DILocalVariable(name: "myUnion", scope: !211, file: !15, line: 131, type: !21)
!215 = !DILocation(line: 131, column: 68, scope: !211)
!216 = !DILocation(line: 133, column: 10, scope: !211)
!217 = !DILocalVariable(name: "inputBuffer", scope: !218, file: !15, line: 135, type: !30)
!218 = distinct !DILexicalBlock(scope: !211, file: !15, line: 134, column: 5)
!219 = !DILocation(line: 135, column: 14, scope: !218)
!220 = !DILocation(line: 137, column: 19, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !15, line: 137, column: 13)
!222 = !DILocation(line: 137, column: 49, scope: !221)
!223 = !DILocation(line: 137, column: 13, scope: !221)
!224 = !DILocation(line: 137, column: 56, scope: !221)
!225 = !DILocation(line: 137, column: 13, scope: !218)
!226 = !DILocation(line: 140, column: 25, scope: !227)
!227 = distinct !DILexicalBlock(scope: !221, file: !15, line: 138, column: 9)
!228 = !DILocation(line: 140, column: 20, scope: !227)
!229 = !DILocation(line: 140, column: 18, scope: !227)
!230 = !DILocation(line: 141, column: 9, scope: !227)
!231 = !DILocation(line: 144, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !221, file: !15, line: 143, column: 9)
!233 = !DILocation(line: 147, column: 26, scope: !211)
!234 = !DILocation(line: 147, column: 13, scope: !211)
!235 = !DILocation(line: 147, column: 24, scope: !211)
!236 = !DILocalVariable(name: "data", scope: !237, file: !15, line: 149, type: !6)
!237 = distinct !DILexicalBlock(scope: !211, file: !15, line: 148, column: 5)
!238 = !DILocation(line: 149, column: 13, scope: !237)
!239 = !DILocation(line: 149, column: 28, scope: !237)
!240 = !DILocalVariable(name: "i", scope: !241, file: !15, line: 151, type: !6)
!241 = distinct !DILexicalBlock(scope: !237, file: !15, line: 150, column: 9)
!242 = !DILocation(line: 151, column: 17, scope: !241)
!243 = !DILocalVariable(name: "buffer", scope: !241, file: !15, line: 152, type: !5)
!244 = !DILocation(line: 152, column: 19, scope: !241)
!245 = !DILocation(line: 152, column: 35, scope: !241)
!246 = !DILocation(line: 152, column: 28, scope: !241)
!247 = !DILocation(line: 153, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !241, file: !15, line: 153, column: 17)
!249 = !DILocation(line: 153, column: 24, scope: !248)
!250 = !DILocation(line: 153, column: 17, scope: !241)
!251 = !DILocation(line: 153, column: 34, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !15, line: 153, column: 33)
!253 = !DILocation(line: 155, column: 20, scope: !254)
!254 = distinct !DILexicalBlock(scope: !241, file: !15, line: 155, column: 13)
!255 = !DILocation(line: 155, column: 18, scope: !254)
!256 = !DILocation(line: 155, column: 25, scope: !257)
!257 = distinct !DILexicalBlock(scope: !254, file: !15, line: 155, column: 13)
!258 = !DILocation(line: 155, column: 27, scope: !257)
!259 = !DILocation(line: 155, column: 13, scope: !254)
!260 = !DILocation(line: 157, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !15, line: 156, column: 13)
!262 = !DILocation(line: 157, column: 24, scope: !261)
!263 = !DILocation(line: 157, column: 27, scope: !261)
!264 = !DILocation(line: 158, column: 13, scope: !261)
!265 = !DILocation(line: 155, column: 34, scope: !257)
!266 = !DILocation(line: 155, column: 13, scope: !257)
!267 = distinct !{!267, !259, !268, !84}
!268 = !DILocation(line: 158, column: 13, scope: !254)
!269 = !DILocation(line: 160, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !241, file: !15, line: 160, column: 17)
!271 = !DILocation(line: 160, column: 22, scope: !270)
!272 = !DILocation(line: 160, column: 27, scope: !270)
!273 = !DILocation(line: 160, column: 30, scope: !270)
!274 = !DILocation(line: 160, column: 35, scope: !270)
!275 = !DILocation(line: 160, column: 17, scope: !241)
!276 = !DILocation(line: 162, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !270, file: !15, line: 161, column: 13)
!278 = !DILocation(line: 162, column: 24, scope: !277)
!279 = !DILocation(line: 162, column: 30, scope: !277)
!280 = !DILocation(line: 164, column: 23, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !15, line: 164, column: 17)
!282 = !DILocation(line: 164, column: 21, scope: !281)
!283 = !DILocation(line: 164, column: 28, scope: !284)
!284 = distinct !DILexicalBlock(scope: !281, file: !15, line: 164, column: 17)
!285 = !DILocation(line: 164, column: 30, scope: !284)
!286 = !DILocation(line: 164, column: 17, scope: !281)
!287 = !DILocation(line: 166, column: 34, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !15, line: 165, column: 17)
!289 = !DILocation(line: 166, column: 41, scope: !288)
!290 = !DILocation(line: 166, column: 21, scope: !288)
!291 = !DILocation(line: 167, column: 17, scope: !288)
!292 = !DILocation(line: 164, column: 37, scope: !284)
!293 = !DILocation(line: 164, column: 17, scope: !284)
!294 = distinct !{!294, !286, !295, !84}
!295 = !DILocation(line: 167, column: 17, scope: !281)
!296 = !DILocation(line: 168, column: 13, scope: !277)
!297 = !DILocation(line: 171, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !270, file: !15, line: 170, column: 13)
!299 = !DILocation(line: 173, column: 18, scope: !241)
!300 = !DILocation(line: 173, column: 13, scope: !241)
!301 = !DILocation(line: 176, column: 1, scope: !211)
