; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType = type { i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i32 -1, i32* %data, align 4, !dbg !27
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !28
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !29
  %1 = load i32, i32* %data, align 4, !dbg !30
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !31
  store i32 %1, i32* %unionFirst, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !33, metadata !DIExpression()), !dbg !35
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !36
  %2 = load i32, i32* %unionSecond, align 4, !dbg !36
  store i32 %2, i32* %data1, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !37, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !40, metadata !DIExpression()), !dbg !41
  %call2 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !42
  %3 = bitcast i8* %call2 to i32*, !dbg !43
  store i32* %3, i32** %buffer, align 8, !dbg !41
  %4 = load i32*, i32** %buffer, align 8, !dbg !44
  %cmp = icmp eq i32* %4, null, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !48
  unreachable, !dbg !48

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !53
  %cmp3 = icmp slt i32 %5, 10, !dbg !55
  br i1 %cmp3, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !57
  %7 = load i32, i32* %i, align 4, !dbg !59
  %idxprom = sext i32 %7 to i64, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !62
  %inc = add nsw i32 %8, 1, !dbg !62
  store i32 %inc, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data1, align 4, !dbg !67
  %cmp4 = icmp sge i32 %9, 0, !dbg !69
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !70

if.then5:                                         ; preds = %for.end
  %10 = load i32*, i32** %buffer, align 8, !dbg !71
  %11 = load i32, i32* %data1, align 4, !dbg !73
  %idxprom6 = sext i32 %11 to i64, !dbg !71
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %idxprom6, !dbg !71
  store i32 1, i32* %arrayidx7, align 4, !dbg !74
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond8, !dbg !77

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %12 = load i32, i32* %i, align 4, !dbg !78
  %cmp9 = icmp slt i32 %12, 10, !dbg !80
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !81

for.body10:                                       ; preds = %for.cond8
  %13 = load i32*, i32** %buffer, align 8, !dbg !82
  %14 = load i32, i32* %i, align 4, !dbg !84
  %idxprom11 = sext i32 %14 to i64, !dbg !82
  %arrayidx12 = getelementptr inbounds i32, i32* %13, i64 %idxprom11, !dbg !82
  %15 = load i32, i32* %arrayidx12, align 4, !dbg !82
  call void @printIntLine(i32 %15), !dbg !85
  br label %for.inc13, !dbg !86

for.inc13:                                        ; preds = %for.body10
  %16 = load i32, i32* %i, align 4, !dbg !87
  %inc14 = add nsw i32 %16, 1, !dbg !87
  store i32 %inc14, i32* %i, align 4, !dbg !87
  br label %for.cond8, !dbg !88, !llvm.loop !89

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !91

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %17 = load i32*, i32** %buffer, align 8, !dbg !94
  %18 = bitcast i32* %17 to i8*, !dbg !94
  call void @free(i8* %18) #5, !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_good() #0 !dbg !97 {
entry:
  call void @goodG2B(), !dbg !98
  call void @goodB2G(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* null) #5, !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #5, !dbg !113
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !121 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType* %myUnion, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 -1, i32* %data, align 4, !dbg !126
  store i32 7, i32* %data, align 4, !dbg !127
  %0 = load i32, i32* %data, align 4, !dbg !128
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !129
  store i32 %0, i32* %unionFirst, align 4, !dbg !130
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !131, metadata !DIExpression()), !dbg !133
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !134
  %1 = load i32, i32* %unionSecond, align 4, !dbg !134
  store i32 %1, i32* %data1, align 4, !dbg !133
  call void @llvm.dbg.declare(metadata i32* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !138, metadata !DIExpression()), !dbg !139
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !140
  %2 = bitcast i8* %call to i32*, !dbg !141
  store i32* %2, i32** %buffer, align 8, !dbg !139
  %3 = load i32*, i32** %buffer, align 8, !dbg !142
  %cmp = icmp eq i32* %3, null, !dbg !144
  br i1 %cmp, label %if.then, label %if.end, !dbg !145

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !146
  unreachable, !dbg !146

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !151
  %cmp2 = icmp slt i32 %4, 10, !dbg !153
  br i1 %cmp2, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !155
  %6 = load i32, i32* %i, align 4, !dbg !157
  %idxprom = sext i32 %6 to i64, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !160
  %inc = add nsw i32 %7, 1, !dbg !160
  store i32 %inc, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !164
  %cmp3 = icmp sge i32 %8, 0, !dbg !166
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !167

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !168
  %10 = load i32, i32* %data1, align 4, !dbg !170
  %idxprom5 = sext i32 %10 to i64, !dbg !168
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !168
  store i32 1, i32* %arrayidx6, align 4, !dbg !171
  store i32 0, i32* %i, align 4, !dbg !172
  br label %for.cond7, !dbg !174

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !175
  %cmp8 = icmp slt i32 %11, 10, !dbg !177
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !178

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !179
  %13 = load i32, i32* %i, align 4, !dbg !181
  %idxprom10 = sext i32 %13 to i64, !dbg !179
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !179
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !179
  call void @printIntLine(i32 %14), !dbg !182
  br label %for.inc12, !dbg !183

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !184
  %inc13 = add nsw i32 %15, 1, !dbg !184
  store i32 %inc13, i32* %i, align 4, !dbg !184
  br label %for.cond7, !dbg !185, !llvm.loop !186

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !188

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !189
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !191
  %17 = bitcast i32* %16 to i8*, !dbg !191
  call void @free(i8* %17) #5, !dbg !192
  ret void, !dbg !193
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !194 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType* %myUnion, metadata !197, metadata !DIExpression()), !dbg !198
  store i32 -1, i32* %data, align 4, !dbg !199
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !200
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !201
  %1 = load i32, i32* %data, align 4, !dbg !202
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !203
  store i32 %1, i32* %unionFirst, align 4, !dbg !204
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !205, metadata !DIExpression()), !dbg !207
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !208
  %2 = load i32, i32* %unionSecond, align 4, !dbg !208
  store i32 %2, i32* %data1, align 4, !dbg !207
  call void @llvm.dbg.declare(metadata i32* %i, metadata !209, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !212, metadata !DIExpression()), !dbg !213
  %call2 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !214
  %3 = bitcast i8* %call2 to i32*, !dbg !215
  store i32* %3, i32** %buffer, align 8, !dbg !213
  %4 = load i32*, i32** %buffer, align 8, !dbg !216
  %cmp = icmp eq i32* %4, null, !dbg !218
  br i1 %cmp, label %if.then, label %if.end, !dbg !219

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !220
  unreachable, !dbg !220

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !222
  br label %for.cond, !dbg !224

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !225
  %cmp3 = icmp slt i32 %5, 10, !dbg !227
  br i1 %cmp3, label %for.body, label %for.end, !dbg !228

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !229
  %7 = load i32, i32* %i, align 4, !dbg !231
  %idxprom = sext i32 %7 to i64, !dbg !229
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !229
  store i32 0, i32* %arrayidx, align 4, !dbg !232
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !234
  %inc = add nsw i32 %8, 1, !dbg !234
  store i32 %inc, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !235, !llvm.loop !236

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data1, align 4, !dbg !238
  %cmp4 = icmp sge i32 %9, 0, !dbg !240
  br i1 %cmp4, label %land.lhs.true, label %if.else, !dbg !241

land.lhs.true:                                    ; preds = %for.end
  %10 = load i32, i32* %data1, align 4, !dbg !242
  %cmp5 = icmp slt i32 %10, 10, !dbg !243
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !244

if.then6:                                         ; preds = %land.lhs.true
  %11 = load i32*, i32** %buffer, align 8, !dbg !245
  %12 = load i32, i32* %data1, align 4, !dbg !247
  %idxprom7 = sext i32 %12 to i64, !dbg !245
  %arrayidx8 = getelementptr inbounds i32, i32* %11, i64 %idxprom7, !dbg !245
  store i32 1, i32* %arrayidx8, align 4, !dbg !248
  store i32 0, i32* %i, align 4, !dbg !249
  br label %for.cond9, !dbg !251

for.cond9:                                        ; preds = %for.inc14, %if.then6
  %13 = load i32, i32* %i, align 4, !dbg !252
  %cmp10 = icmp slt i32 %13, 10, !dbg !254
  br i1 %cmp10, label %for.body11, label %for.end16, !dbg !255

for.body11:                                       ; preds = %for.cond9
  %14 = load i32*, i32** %buffer, align 8, !dbg !256
  %15 = load i32, i32* %i, align 4, !dbg !258
  %idxprom12 = sext i32 %15 to i64, !dbg !256
  %arrayidx13 = getelementptr inbounds i32, i32* %14, i64 %idxprom12, !dbg !256
  %16 = load i32, i32* %arrayidx13, align 4, !dbg !256
  call void @printIntLine(i32 %16), !dbg !259
  br label %for.inc14, !dbg !260

for.inc14:                                        ; preds = %for.body11
  %17 = load i32, i32* %i, align 4, !dbg !261
  %inc15 = add nsw i32 %17, 1, !dbg !261
  store i32 %inc15, i32* %i, align 4, !dbg !261
  br label %for.cond9, !dbg !262, !llvm.loop !263

for.end16:                                        ; preds = %for.cond9
  br label %if.end17, !dbg !265

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !266
  br label %if.end17

if.end17:                                         ; preds = %if.else, %for.end16
  %18 = load i32*, i32** %buffer, align 8, !dbg !268
  %19 = bitcast i32* %18 to i8*, !dbg !268
  call void @free(i8* %19) #5, !dbg !269
  ret void, !dbg !270
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !5)
!19 = !DILocation(line: 30, column: 9, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_unionType", file: !15, line: 24, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 20, size: 32, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 22, baseType: !5, size: 32)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 23, baseType: !5, size: 32)
!26 = !DILocation(line: 31, column: 69, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocation(line: 35, column: 12, scope: !14)
!29 = !DILocation(line: 35, column: 5, scope: !14)
!30 = !DILocation(line: 36, column: 26, scope: !14)
!31 = !DILocation(line: 36, column: 13, scope: !14)
!32 = !DILocation(line: 36, column: 24, scope: !14)
!33 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 38, type: !5)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!35 = !DILocation(line: 38, column: 13, scope: !34)
!36 = !DILocation(line: 38, column: 28, scope: !34)
!37 = !DILocalVariable(name: "i", scope: !38, file: !15, line: 40, type: !5)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 39, column: 9)
!39 = !DILocation(line: 40, column: 17, scope: !38)
!40 = !DILocalVariable(name: "buffer", scope: !38, file: !15, line: 41, type: !4)
!41 = !DILocation(line: 41, column: 19, scope: !38)
!42 = !DILocation(line: 41, column: 35, scope: !38)
!43 = !DILocation(line: 41, column: 28, scope: !38)
!44 = !DILocation(line: 42, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !15, line: 42, column: 17)
!46 = !DILocation(line: 42, column: 24, scope: !45)
!47 = !DILocation(line: 42, column: 17, scope: !38)
!48 = !DILocation(line: 42, column: 34, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !15, line: 42, column: 33)
!50 = !DILocation(line: 44, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !38, file: !15, line: 44, column: 13)
!52 = !DILocation(line: 44, column: 18, scope: !51)
!53 = !DILocation(line: 44, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !15, line: 44, column: 13)
!55 = !DILocation(line: 44, column: 27, scope: !54)
!56 = !DILocation(line: 44, column: 13, scope: !51)
!57 = !DILocation(line: 46, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 45, column: 13)
!59 = !DILocation(line: 46, column: 24, scope: !58)
!60 = !DILocation(line: 46, column: 27, scope: !58)
!61 = !DILocation(line: 47, column: 13, scope: !58)
!62 = !DILocation(line: 44, column: 34, scope: !54)
!63 = !DILocation(line: 44, column: 13, scope: !54)
!64 = distinct !{!64, !56, !65, !66}
!65 = !DILocation(line: 47, column: 13, scope: !51)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 50, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !38, file: !15, line: 50, column: 17)
!69 = !DILocation(line: 50, column: 22, scope: !68)
!70 = !DILocation(line: 50, column: 17, scope: !38)
!71 = !DILocation(line: 52, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !15, line: 51, column: 13)
!73 = !DILocation(line: 52, column: 24, scope: !72)
!74 = !DILocation(line: 52, column: 30, scope: !72)
!75 = !DILocation(line: 54, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 54, column: 17)
!77 = !DILocation(line: 54, column: 21, scope: !76)
!78 = !DILocation(line: 54, column: 28, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !15, line: 54, column: 17)
!80 = !DILocation(line: 54, column: 30, scope: !79)
!81 = !DILocation(line: 54, column: 17, scope: !76)
!82 = !DILocation(line: 56, column: 34, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 55, column: 17)
!84 = !DILocation(line: 56, column: 41, scope: !83)
!85 = !DILocation(line: 56, column: 21, scope: !83)
!86 = !DILocation(line: 57, column: 17, scope: !83)
!87 = !DILocation(line: 54, column: 37, scope: !79)
!88 = !DILocation(line: 54, column: 17, scope: !79)
!89 = distinct !{!89, !81, !90, !66}
!90 = !DILocation(line: 57, column: 17, scope: !76)
!91 = !DILocation(line: 58, column: 13, scope: !72)
!92 = !DILocation(line: 61, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !68, file: !15, line: 60, column: 13)
!94 = !DILocation(line: 63, column: 18, scope: !38)
!95 = !DILocation(line: 63, column: 13, scope: !38)
!96 = !DILocation(line: 66, column: 1, scope: !14)
!97 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_34_good", scope: !15, file: !15, line: 154, type: !16, scopeLine: 155, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 156, column: 5, scope: !97)
!99 = !DILocation(line: 157, column: 5, scope: !97)
!100 = !DILocation(line: 158, column: 1, scope: !97)
!101 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 168, type: !102, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!5, !5, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !15, line: 168, type: !5)
!108 = !DILocation(line: 168, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !15, line: 168, type: !104)
!110 = !DILocation(line: 168, column: 27, scope: !101)
!111 = !DILocation(line: 171, column: 22, scope: !101)
!112 = !DILocation(line: 171, column: 12, scope: !101)
!113 = !DILocation(line: 171, column: 5, scope: !101)
!114 = !DILocation(line: 173, column: 5, scope: !101)
!115 = !DILocation(line: 174, column: 5, scope: !101)
!116 = !DILocation(line: 175, column: 5, scope: !101)
!117 = !DILocation(line: 178, column: 5, scope: !101)
!118 = !DILocation(line: 179, column: 5, scope: !101)
!119 = !DILocation(line: 180, column: 5, scope: !101)
!120 = !DILocation(line: 182, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 73, type: !16, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !15, line: 75, type: !5)
!123 = !DILocation(line: 75, column: 9, scope: !121)
!124 = !DILocalVariable(name: "myUnion", scope: !121, file: !15, line: 76, type: !21)
!125 = !DILocation(line: 76, column: 69, scope: !121)
!126 = !DILocation(line: 78, column: 10, scope: !121)
!127 = !DILocation(line: 81, column: 10, scope: !121)
!128 = !DILocation(line: 82, column: 26, scope: !121)
!129 = !DILocation(line: 82, column: 13, scope: !121)
!130 = !DILocation(line: 82, column: 24, scope: !121)
!131 = !DILocalVariable(name: "data", scope: !132, file: !15, line: 84, type: !5)
!132 = distinct !DILexicalBlock(scope: !121, file: !15, line: 83, column: 5)
!133 = !DILocation(line: 84, column: 13, scope: !132)
!134 = !DILocation(line: 84, column: 28, scope: !132)
!135 = !DILocalVariable(name: "i", scope: !136, file: !15, line: 86, type: !5)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 85, column: 9)
!137 = !DILocation(line: 86, column: 17, scope: !136)
!138 = !DILocalVariable(name: "buffer", scope: !136, file: !15, line: 87, type: !4)
!139 = !DILocation(line: 87, column: 19, scope: !136)
!140 = !DILocation(line: 87, column: 35, scope: !136)
!141 = !DILocation(line: 87, column: 28, scope: !136)
!142 = !DILocation(line: 88, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !15, line: 88, column: 17)
!144 = !DILocation(line: 88, column: 24, scope: !143)
!145 = !DILocation(line: 88, column: 17, scope: !136)
!146 = !DILocation(line: 88, column: 34, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 88, column: 33)
!148 = !DILocation(line: 90, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !136, file: !15, line: 90, column: 13)
!150 = !DILocation(line: 90, column: 18, scope: !149)
!151 = !DILocation(line: 90, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !15, line: 90, column: 13)
!153 = !DILocation(line: 90, column: 27, scope: !152)
!154 = !DILocation(line: 90, column: 13, scope: !149)
!155 = !DILocation(line: 92, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !15, line: 91, column: 13)
!157 = !DILocation(line: 92, column: 24, scope: !156)
!158 = !DILocation(line: 92, column: 27, scope: !156)
!159 = !DILocation(line: 93, column: 13, scope: !156)
!160 = !DILocation(line: 90, column: 34, scope: !152)
!161 = !DILocation(line: 90, column: 13, scope: !152)
!162 = distinct !{!162, !154, !163, !66}
!163 = !DILocation(line: 93, column: 13, scope: !149)
!164 = !DILocation(line: 96, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !136, file: !15, line: 96, column: 17)
!166 = !DILocation(line: 96, column: 22, scope: !165)
!167 = !DILocation(line: 96, column: 17, scope: !136)
!168 = !DILocation(line: 98, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !15, line: 97, column: 13)
!170 = !DILocation(line: 98, column: 24, scope: !169)
!171 = !DILocation(line: 98, column: 30, scope: !169)
!172 = !DILocation(line: 100, column: 23, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !15, line: 100, column: 17)
!174 = !DILocation(line: 100, column: 21, scope: !173)
!175 = !DILocation(line: 100, column: 28, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !15, line: 100, column: 17)
!177 = !DILocation(line: 100, column: 30, scope: !176)
!178 = !DILocation(line: 100, column: 17, scope: !173)
!179 = !DILocation(line: 102, column: 34, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 101, column: 17)
!181 = !DILocation(line: 102, column: 41, scope: !180)
!182 = !DILocation(line: 102, column: 21, scope: !180)
!183 = !DILocation(line: 103, column: 17, scope: !180)
!184 = !DILocation(line: 100, column: 37, scope: !176)
!185 = !DILocation(line: 100, column: 17, scope: !176)
!186 = distinct !{!186, !178, !187, !66}
!187 = !DILocation(line: 103, column: 17, scope: !173)
!188 = !DILocation(line: 104, column: 13, scope: !169)
!189 = !DILocation(line: 107, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !165, file: !15, line: 106, column: 13)
!191 = !DILocation(line: 109, column: 18, scope: !136)
!192 = !DILocation(line: 109, column: 13, scope: !136)
!193 = !DILocation(line: 112, column: 1, scope: !121)
!194 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 115, type: !16, scopeLine: 116, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!195 = !DILocalVariable(name: "data", scope: !194, file: !15, line: 117, type: !5)
!196 = !DILocation(line: 117, column: 9, scope: !194)
!197 = !DILocalVariable(name: "myUnion", scope: !194, file: !15, line: 118, type: !21)
!198 = !DILocation(line: 118, column: 69, scope: !194)
!199 = !DILocation(line: 120, column: 10, scope: !194)
!200 = !DILocation(line: 122, column: 12, scope: !194)
!201 = !DILocation(line: 122, column: 5, scope: !194)
!202 = !DILocation(line: 123, column: 26, scope: !194)
!203 = !DILocation(line: 123, column: 13, scope: !194)
!204 = !DILocation(line: 123, column: 24, scope: !194)
!205 = !DILocalVariable(name: "data", scope: !206, file: !15, line: 125, type: !5)
!206 = distinct !DILexicalBlock(scope: !194, file: !15, line: 124, column: 5)
!207 = !DILocation(line: 125, column: 13, scope: !206)
!208 = !DILocation(line: 125, column: 28, scope: !206)
!209 = !DILocalVariable(name: "i", scope: !210, file: !15, line: 127, type: !5)
!210 = distinct !DILexicalBlock(scope: !206, file: !15, line: 126, column: 9)
!211 = !DILocation(line: 127, column: 17, scope: !210)
!212 = !DILocalVariable(name: "buffer", scope: !210, file: !15, line: 128, type: !4)
!213 = !DILocation(line: 128, column: 19, scope: !210)
!214 = !DILocation(line: 128, column: 35, scope: !210)
!215 = !DILocation(line: 128, column: 28, scope: !210)
!216 = !DILocation(line: 129, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !210, file: !15, line: 129, column: 17)
!218 = !DILocation(line: 129, column: 24, scope: !217)
!219 = !DILocation(line: 129, column: 17, scope: !210)
!220 = !DILocation(line: 129, column: 34, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !15, line: 129, column: 33)
!222 = !DILocation(line: 131, column: 20, scope: !223)
!223 = distinct !DILexicalBlock(scope: !210, file: !15, line: 131, column: 13)
!224 = !DILocation(line: 131, column: 18, scope: !223)
!225 = !DILocation(line: 131, column: 25, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !15, line: 131, column: 13)
!227 = !DILocation(line: 131, column: 27, scope: !226)
!228 = !DILocation(line: 131, column: 13, scope: !223)
!229 = !DILocation(line: 133, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !15, line: 132, column: 13)
!231 = !DILocation(line: 133, column: 24, scope: !230)
!232 = !DILocation(line: 133, column: 27, scope: !230)
!233 = !DILocation(line: 134, column: 13, scope: !230)
!234 = !DILocation(line: 131, column: 34, scope: !226)
!235 = !DILocation(line: 131, column: 13, scope: !226)
!236 = distinct !{!236, !228, !237, !66}
!237 = !DILocation(line: 134, column: 13, scope: !223)
!238 = !DILocation(line: 136, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !210, file: !15, line: 136, column: 17)
!240 = !DILocation(line: 136, column: 22, scope: !239)
!241 = !DILocation(line: 136, column: 27, scope: !239)
!242 = !DILocation(line: 136, column: 30, scope: !239)
!243 = !DILocation(line: 136, column: 35, scope: !239)
!244 = !DILocation(line: 136, column: 17, scope: !210)
!245 = !DILocation(line: 138, column: 17, scope: !246)
!246 = distinct !DILexicalBlock(scope: !239, file: !15, line: 137, column: 13)
!247 = !DILocation(line: 138, column: 24, scope: !246)
!248 = !DILocation(line: 138, column: 30, scope: !246)
!249 = !DILocation(line: 140, column: 23, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !15, line: 140, column: 17)
!251 = !DILocation(line: 140, column: 21, scope: !250)
!252 = !DILocation(line: 140, column: 28, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !15, line: 140, column: 17)
!254 = !DILocation(line: 140, column: 30, scope: !253)
!255 = !DILocation(line: 140, column: 17, scope: !250)
!256 = !DILocation(line: 142, column: 34, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !15, line: 141, column: 17)
!258 = !DILocation(line: 142, column: 41, scope: !257)
!259 = !DILocation(line: 142, column: 21, scope: !257)
!260 = !DILocation(line: 143, column: 17, scope: !257)
!261 = !DILocation(line: 140, column: 37, scope: !253)
!262 = !DILocation(line: 140, column: 17, scope: !253)
!263 = distinct !{!263, !255, !264, !66}
!264 = !DILocation(line: 143, column: 17, scope: !250)
!265 = !DILocation(line: 144, column: 13, scope: !246)
!266 = !DILocation(line: 147, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !239, file: !15, line: 146, column: 13)
!268 = !DILocation(line: 149, column: 18, scope: !210)
!269 = !DILocation(line: 149, column: 13, scope: !210)
!270 = !DILocation(line: 152, column: 1, scope: !194)
