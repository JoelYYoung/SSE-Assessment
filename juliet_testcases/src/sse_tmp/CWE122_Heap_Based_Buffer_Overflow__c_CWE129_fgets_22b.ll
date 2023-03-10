; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_badGlobal = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G1Global = external dso_local global i32, align 4
@.str.1 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G2Global = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodG2BGlobal = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_badSink(i32 %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_badGlobal, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end16, !dbg !21

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !28
  %1 = bitcast i8* %call to i32*, !dbg !29
  store i32* %1, i32** %buffer, align 8, !dbg !27
  %2 = load i32*, i32** %buffer, align 8, !dbg !30
  %cmp = icmp eq i32* %2, null, !dbg !32
  br i1 %cmp, label %if.then1, label %if.end, !dbg !33

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !39
  %cmp2 = icmp slt i32 %3, 10, !dbg !41
  br i1 %cmp2, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !43
  %5 = load i32, i32* %i, align 4, !dbg !45
  %idxprom = sext i32 %5 to i64, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %6, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !53
  %cmp3 = icmp sge i32 %7, 0, !dbg !55
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !56

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !57
  %9 = load i32, i32* %data.addr, align 4, !dbg !59
  %idxprom5 = sext i32 %9 to i64, !dbg !57
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !57
  store i32 1, i32* %arrayidx6, align 4, !dbg !60
  store i32 0, i32* %i, align 4, !dbg !61
  br label %for.cond7, !dbg !63

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !64
  %cmp8 = icmp slt i32 %10, 10, !dbg !66
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !67

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !68
  %12 = load i32, i32* %i, align 4, !dbg !70
  %idxprom10 = sext i32 %12 to i64, !dbg !68
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !68
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !68
  call void @printIntLine(i32 %13), !dbg !71
  br label %for.inc12, !dbg !72

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !73
  %inc13 = add nsw i32 %14, 1, !dbg !73
  store i32 %inc13, i32* %i, align 4, !dbg !73
  br label %for.cond7, !dbg !74, !llvm.loop !75

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !77

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !78
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !80
  %16 = bitcast i32* %15 to i8*, !dbg !80
  call void @free(i8* %16) #5, !dbg !81
  br label %if.end16, !dbg !82

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G1Sink(i32 %data) #0 !dbg !84 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G1Global, align 4, !dbg !87
  %tobool = icmp ne i32 %0, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  br label %if.end18, !dbg !92

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !93, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !99
  %1 = bitcast i8* %call to i32*, !dbg !100
  store i32* %1, i32** %buffer, align 8, !dbg !98
  %2 = load i32*, i32** %buffer, align 8, !dbg !101
  %cmp = icmp eq i32* %2, null, !dbg !103
  br i1 %cmp, label %if.then1, label %if.end, !dbg !104

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !107
  br label %for.cond, !dbg !109

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !110
  %cmp2 = icmp slt i32 %3, 10, !dbg !112
  br i1 %cmp2, label %for.body, label %for.end, !dbg !113

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !114
  %5 = load i32, i32* %i, align 4, !dbg !116
  %idxprom = sext i32 %5 to i64, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !119
  %inc = add nsw i32 %6, 1, !dbg !119
  store i32 %inc, i32* %i, align 4, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !123
  %cmp3 = icmp sge i32 %7, 0, !dbg !125
  br i1 %cmp3, label %land.lhs.true, label %if.else16, !dbg !126

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !127
  %cmp4 = icmp slt i32 %8, 10, !dbg !128
  br i1 %cmp4, label %if.then5, label %if.else16, !dbg !129

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !130
  %10 = load i32, i32* %data.addr, align 4, !dbg !132
  %idxprom6 = sext i32 %10 to i64, !dbg !130
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !130
  store i32 1, i32* %arrayidx7, align 4, !dbg !133
  store i32 0, i32* %i, align 4, !dbg !134
  br label %for.cond8, !dbg !136

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !137
  %cmp9 = icmp slt i32 %11, 10, !dbg !139
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !140

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !141
  %13 = load i32, i32* %i, align 4, !dbg !143
  %idxprom11 = sext i32 %13 to i64, !dbg !141
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !141
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !141
  call void @printIntLine(i32 %14), !dbg !144
  br label %for.inc13, !dbg !145

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !146
  %inc14 = add nsw i32 %15, 1, !dbg !146
  store i32 %inc14, i32* %i, align 4, !dbg !146
  br label %for.cond8, !dbg !147, !llvm.loop !148

for.end15:                                        ; preds = %for.cond8
  br label %if.end17, !dbg !150

if.else16:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !151
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !153
  %17 = bitcast i32* %16 to i8*, !dbg !153
  call void @free(i8* %17) #5, !dbg !154
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G2Sink(i32 %data) #0 !dbg !156 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !157, metadata !DIExpression()), !dbg !158
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G2Global, align 4, !dbg !159
  %tobool = icmp ne i32 %0, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end17, !dbg !161

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !162, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !166, metadata !DIExpression()), !dbg !167
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !168
  %1 = bitcast i8* %call to i32*, !dbg !169
  store i32* %1, i32** %buffer, align 8, !dbg !167
  %2 = load i32*, i32** %buffer, align 8, !dbg !170
  %cmp = icmp eq i32* %2, null, !dbg !172
  br i1 %cmp, label %if.then1, label %if.end, !dbg !173

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !174
  unreachable, !dbg !174

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !179
  %cmp2 = icmp slt i32 %3, 10, !dbg !181
  br i1 %cmp2, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !183
  %5 = load i32, i32* %i, align 4, !dbg !185
  %idxprom = sext i32 %5 to i64, !dbg !183
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !183
  store i32 0, i32* %arrayidx, align 4, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !188
  %inc = add nsw i32 %6, 1, !dbg !188
  store i32 %inc, i32* %i, align 4, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !192
  %cmp3 = icmp sge i32 %7, 0, !dbg !194
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !195

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !196
  %cmp4 = icmp slt i32 %8, 10, !dbg !197
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !198

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !199
  %10 = load i32, i32* %data.addr, align 4, !dbg !201
  %idxprom6 = sext i32 %10 to i64, !dbg !199
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !199
  store i32 1, i32* %arrayidx7, align 4, !dbg !202
  store i32 0, i32* %i, align 4, !dbg !203
  br label %for.cond8, !dbg !205

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !206
  %cmp9 = icmp slt i32 %11, 10, !dbg !208
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !209

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !210
  %13 = load i32, i32* %i, align 4, !dbg !212
  %idxprom11 = sext i32 %13 to i64, !dbg !210
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !210
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !210
  call void @printIntLine(i32 %14), !dbg !213
  br label %for.inc13, !dbg !214

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !215
  %inc14 = add nsw i32 %15, 1, !dbg !215
  store i32 %inc14, i32* %i, align 4, !dbg !215
  br label %for.cond8, !dbg !216, !llvm.loop !217

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !219

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !220
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !222
  %17 = bitcast i32* %16 to i8*, !dbg !222
  call void @free(i8* %17) #5, !dbg !223
  br label %if.end17, !dbg !224

if.end17:                                         ; preds = %if.end16, %entry
  ret void, !dbg !225
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodG2BSink(i32 %data) #0 !dbg !226 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !227, metadata !DIExpression()), !dbg !228
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodG2BGlobal, align 4, !dbg !229
  %tobool = icmp ne i32 %0, 0, !dbg !229
  br i1 %tobool, label %if.then, label %if.end16, !dbg !231

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !232, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !236, metadata !DIExpression()), !dbg !237
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !238
  %1 = bitcast i8* %call to i32*, !dbg !239
  store i32* %1, i32** %buffer, align 8, !dbg !237
  %2 = load i32*, i32** %buffer, align 8, !dbg !240
  %cmp = icmp eq i32* %2, null, !dbg !242
  br i1 %cmp, label %if.then1, label %if.end, !dbg !243

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !244
  unreachable, !dbg !244

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !246
  br label %for.cond, !dbg !248

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !249
  %cmp2 = icmp slt i32 %3, 10, !dbg !251
  br i1 %cmp2, label %for.body, label %for.end, !dbg !252

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !253
  %5 = load i32, i32* %i, align 4, !dbg !255
  %idxprom = sext i32 %5 to i64, !dbg !253
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !253
  store i32 0, i32* %arrayidx, align 4, !dbg !256
  br label %for.inc, !dbg !257

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !258
  %inc = add nsw i32 %6, 1, !dbg !258
  store i32 %inc, i32* %i, align 4, !dbg !258
  br label %for.cond, !dbg !259, !llvm.loop !260

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !262
  %cmp3 = icmp sge i32 %7, 0, !dbg !264
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !265

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !266
  %9 = load i32, i32* %data.addr, align 4, !dbg !268
  %idxprom5 = sext i32 %9 to i64, !dbg !266
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !266
  store i32 1, i32* %arrayidx6, align 4, !dbg !269
  store i32 0, i32* %i, align 4, !dbg !270
  br label %for.cond7, !dbg !272

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !273
  %cmp8 = icmp slt i32 %10, 10, !dbg !275
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !276

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !277
  %12 = load i32, i32* %i, align 4, !dbg !279
  %idxprom10 = sext i32 %12 to i64, !dbg !277
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !277
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !277
  call void @printIntLine(i32 %13), !dbg !280
  br label %for.inc12, !dbg !281

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !282
  %inc13 = add nsw i32 %14, 1, !dbg !282
  store i32 %inc13, i32* %i, align 4, !dbg !282
  br label %for.cond7, !dbg !283, !llvm.loop !284

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !286

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !287
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !289
  %16 = bitcast i32* %15 to i8*, !dbg !289
  call void @free(i8* %16) #5, !dbg !290
  br label %if.end16, !dbg !291

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !292
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_badSink", scope: !14, file: !14, line: 25, type: !15, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !5}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 25, type: !5)
!18 = !DILocation(line: 25, column: 71, scope: !13)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 8, scope: !13)
!22 = !DILocalVariable(name: "i", scope: !23, file: !14, line: 30, type: !5)
!23 = distinct !DILexicalBlock(scope: !24, file: !14, line: 29, column: 9)
!24 = distinct !DILexicalBlock(scope: !20, file: !14, line: 28, column: 5)
!25 = !DILocation(line: 30, column: 17, scope: !23)
!26 = !DILocalVariable(name: "buffer", scope: !23, file: !14, line: 31, type: !4)
!27 = !DILocation(line: 31, column: 19, scope: !23)
!28 = !DILocation(line: 31, column: 35, scope: !23)
!29 = !DILocation(line: 31, column: 28, scope: !23)
!30 = !DILocation(line: 32, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !14, line: 32, column: 17)
!32 = !DILocation(line: 32, column: 24, scope: !31)
!33 = !DILocation(line: 32, column: 17, scope: !23)
!34 = !DILocation(line: 32, column: 34, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !14, line: 32, column: 33)
!36 = !DILocation(line: 34, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !23, file: !14, line: 34, column: 13)
!38 = !DILocation(line: 34, column: 18, scope: !37)
!39 = !DILocation(line: 34, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !14, line: 34, column: 13)
!41 = !DILocation(line: 34, column: 27, scope: !40)
!42 = !DILocation(line: 34, column: 13, scope: !37)
!43 = !DILocation(line: 36, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !14, line: 35, column: 13)
!45 = !DILocation(line: 36, column: 24, scope: !44)
!46 = !DILocation(line: 36, column: 27, scope: !44)
!47 = !DILocation(line: 37, column: 13, scope: !44)
!48 = !DILocation(line: 34, column: 34, scope: !40)
!49 = !DILocation(line: 34, column: 13, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 37, column: 13, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 40, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !23, file: !14, line: 40, column: 17)
!55 = !DILocation(line: 40, column: 22, scope: !54)
!56 = !DILocation(line: 40, column: 17, scope: !23)
!57 = !DILocation(line: 42, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !14, line: 41, column: 13)
!59 = !DILocation(line: 42, column: 24, scope: !58)
!60 = !DILocation(line: 42, column: 30, scope: !58)
!61 = !DILocation(line: 44, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !14, line: 44, column: 17)
!63 = !DILocation(line: 44, column: 21, scope: !62)
!64 = !DILocation(line: 44, column: 28, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !14, line: 44, column: 17)
!66 = !DILocation(line: 44, column: 30, scope: !65)
!67 = !DILocation(line: 44, column: 17, scope: !62)
!68 = !DILocation(line: 46, column: 34, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !14, line: 45, column: 17)
!70 = !DILocation(line: 46, column: 41, scope: !69)
!71 = !DILocation(line: 46, column: 21, scope: !69)
!72 = !DILocation(line: 47, column: 17, scope: !69)
!73 = !DILocation(line: 44, column: 37, scope: !65)
!74 = !DILocation(line: 44, column: 17, scope: !65)
!75 = distinct !{!75, !67, !76, !52}
!76 = !DILocation(line: 47, column: 17, scope: !62)
!77 = !DILocation(line: 48, column: 13, scope: !58)
!78 = !DILocation(line: 51, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !54, file: !14, line: 50, column: 13)
!80 = !DILocation(line: 53, column: 18, scope: !23)
!81 = !DILocation(line: 53, column: 13, scope: !23)
!82 = !DILocation(line: 55, column: 5, scope: !24)
!83 = !DILocation(line: 56, column: 1, scope: !13)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G1Sink", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", arg: 1, scope: !84, file: !14, line: 68, type: !5)
!86 = !DILocation(line: 68, column: 76, scope: !84)
!87 = !DILocation(line: 70, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !14, line: 70, column: 8)
!89 = !DILocation(line: 70, column: 8, scope: !84)
!90 = !DILocation(line: 73, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !14, line: 71, column: 5)
!92 = !DILocation(line: 74, column: 5, scope: !91)
!93 = !DILocalVariable(name: "i", scope: !94, file: !14, line: 78, type: !5)
!94 = distinct !DILexicalBlock(scope: !95, file: !14, line: 77, column: 9)
!95 = distinct !DILexicalBlock(scope: !88, file: !14, line: 76, column: 5)
!96 = !DILocation(line: 78, column: 17, scope: !94)
!97 = !DILocalVariable(name: "buffer", scope: !94, file: !14, line: 79, type: !4)
!98 = !DILocation(line: 79, column: 19, scope: !94)
!99 = !DILocation(line: 79, column: 35, scope: !94)
!100 = !DILocation(line: 79, column: 28, scope: !94)
!101 = !DILocation(line: 80, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !14, line: 80, column: 17)
!103 = !DILocation(line: 80, column: 24, scope: !102)
!104 = !DILocation(line: 80, column: 17, scope: !94)
!105 = !DILocation(line: 80, column: 34, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !14, line: 80, column: 33)
!107 = !DILocation(line: 82, column: 20, scope: !108)
!108 = distinct !DILexicalBlock(scope: !94, file: !14, line: 82, column: 13)
!109 = !DILocation(line: 82, column: 18, scope: !108)
!110 = !DILocation(line: 82, column: 25, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !14, line: 82, column: 13)
!112 = !DILocation(line: 82, column: 27, scope: !111)
!113 = !DILocation(line: 82, column: 13, scope: !108)
!114 = !DILocation(line: 84, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !14, line: 83, column: 13)
!116 = !DILocation(line: 84, column: 24, scope: !115)
!117 = !DILocation(line: 84, column: 27, scope: !115)
!118 = !DILocation(line: 85, column: 13, scope: !115)
!119 = !DILocation(line: 82, column: 34, scope: !111)
!120 = !DILocation(line: 82, column: 13, scope: !111)
!121 = distinct !{!121, !113, !122, !52}
!122 = !DILocation(line: 85, column: 13, scope: !108)
!123 = !DILocation(line: 87, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !94, file: !14, line: 87, column: 17)
!125 = !DILocation(line: 87, column: 22, scope: !124)
!126 = !DILocation(line: 87, column: 27, scope: !124)
!127 = !DILocation(line: 87, column: 30, scope: !124)
!128 = !DILocation(line: 87, column: 35, scope: !124)
!129 = !DILocation(line: 87, column: 17, scope: !94)
!130 = !DILocation(line: 89, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !14, line: 88, column: 13)
!132 = !DILocation(line: 89, column: 24, scope: !131)
!133 = !DILocation(line: 89, column: 30, scope: !131)
!134 = !DILocation(line: 91, column: 23, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !14, line: 91, column: 17)
!136 = !DILocation(line: 91, column: 21, scope: !135)
!137 = !DILocation(line: 91, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !14, line: 91, column: 17)
!139 = !DILocation(line: 91, column: 30, scope: !138)
!140 = !DILocation(line: 91, column: 17, scope: !135)
!141 = !DILocation(line: 93, column: 34, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !14, line: 92, column: 17)
!143 = !DILocation(line: 93, column: 41, scope: !142)
!144 = !DILocation(line: 93, column: 21, scope: !142)
!145 = !DILocation(line: 94, column: 17, scope: !142)
!146 = !DILocation(line: 91, column: 37, scope: !138)
!147 = !DILocation(line: 91, column: 17, scope: !138)
!148 = distinct !{!148, !140, !149, !52}
!149 = !DILocation(line: 94, column: 17, scope: !135)
!150 = !DILocation(line: 95, column: 13, scope: !131)
!151 = !DILocation(line: 98, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !124, file: !14, line: 97, column: 13)
!153 = !DILocation(line: 100, column: 18, scope: !94)
!154 = !DILocation(line: 100, column: 13, scope: !94)
!155 = !DILocation(line: 103, column: 1, scope: !84)
!156 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodB2G2Sink", scope: !14, file: !14, line: 106, type: !15, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "data", arg: 1, scope: !156, file: !14, line: 106, type: !5)
!158 = !DILocation(line: 106, column: 76, scope: !156)
!159 = !DILocation(line: 108, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !14, line: 108, column: 8)
!161 = !DILocation(line: 108, column: 8, scope: !156)
!162 = !DILocalVariable(name: "i", scope: !163, file: !14, line: 111, type: !5)
!163 = distinct !DILexicalBlock(scope: !164, file: !14, line: 110, column: 9)
!164 = distinct !DILexicalBlock(scope: !160, file: !14, line: 109, column: 5)
!165 = !DILocation(line: 111, column: 17, scope: !163)
!166 = !DILocalVariable(name: "buffer", scope: !163, file: !14, line: 112, type: !4)
!167 = !DILocation(line: 112, column: 19, scope: !163)
!168 = !DILocation(line: 112, column: 35, scope: !163)
!169 = !DILocation(line: 112, column: 28, scope: !163)
!170 = !DILocation(line: 113, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !163, file: !14, line: 113, column: 17)
!172 = !DILocation(line: 113, column: 24, scope: !171)
!173 = !DILocation(line: 113, column: 17, scope: !163)
!174 = !DILocation(line: 113, column: 34, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !14, line: 113, column: 33)
!176 = !DILocation(line: 115, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !163, file: !14, line: 115, column: 13)
!178 = !DILocation(line: 115, column: 18, scope: !177)
!179 = !DILocation(line: 115, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !14, line: 115, column: 13)
!181 = !DILocation(line: 115, column: 27, scope: !180)
!182 = !DILocation(line: 115, column: 13, scope: !177)
!183 = !DILocation(line: 117, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !14, line: 116, column: 13)
!185 = !DILocation(line: 117, column: 24, scope: !184)
!186 = !DILocation(line: 117, column: 27, scope: !184)
!187 = !DILocation(line: 118, column: 13, scope: !184)
!188 = !DILocation(line: 115, column: 34, scope: !180)
!189 = !DILocation(line: 115, column: 13, scope: !180)
!190 = distinct !{!190, !182, !191, !52}
!191 = !DILocation(line: 118, column: 13, scope: !177)
!192 = !DILocation(line: 120, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !163, file: !14, line: 120, column: 17)
!194 = !DILocation(line: 120, column: 22, scope: !193)
!195 = !DILocation(line: 120, column: 27, scope: !193)
!196 = !DILocation(line: 120, column: 30, scope: !193)
!197 = !DILocation(line: 120, column: 35, scope: !193)
!198 = !DILocation(line: 120, column: 17, scope: !163)
!199 = !DILocation(line: 122, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !193, file: !14, line: 121, column: 13)
!201 = !DILocation(line: 122, column: 24, scope: !200)
!202 = !DILocation(line: 122, column: 30, scope: !200)
!203 = !DILocation(line: 124, column: 23, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !14, line: 124, column: 17)
!205 = !DILocation(line: 124, column: 21, scope: !204)
!206 = !DILocation(line: 124, column: 28, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !14, line: 124, column: 17)
!208 = !DILocation(line: 124, column: 30, scope: !207)
!209 = !DILocation(line: 124, column: 17, scope: !204)
!210 = !DILocation(line: 126, column: 34, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !14, line: 125, column: 17)
!212 = !DILocation(line: 126, column: 41, scope: !211)
!213 = !DILocation(line: 126, column: 21, scope: !211)
!214 = !DILocation(line: 127, column: 17, scope: !211)
!215 = !DILocation(line: 124, column: 37, scope: !207)
!216 = !DILocation(line: 124, column: 17, scope: !207)
!217 = distinct !{!217, !209, !218, !52}
!218 = !DILocation(line: 127, column: 17, scope: !204)
!219 = !DILocation(line: 128, column: 13, scope: !200)
!220 = !DILocation(line: 131, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !193, file: !14, line: 130, column: 13)
!222 = !DILocation(line: 133, column: 18, scope: !163)
!223 = !DILocation(line: 133, column: 13, scope: !163)
!224 = !DILocation(line: 135, column: 5, scope: !164)
!225 = !DILocation(line: 136, column: 1, scope: !156)
!226 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_22_goodG2BSink", scope: !14, file: !14, line: 139, type: !15, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!227 = !DILocalVariable(name: "data", arg: 1, scope: !226, file: !14, line: 139, type: !5)
!228 = !DILocation(line: 139, column: 75, scope: !226)
!229 = !DILocation(line: 141, column: 8, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !14, line: 141, column: 8)
!231 = !DILocation(line: 141, column: 8, scope: !226)
!232 = !DILocalVariable(name: "i", scope: !233, file: !14, line: 144, type: !5)
!233 = distinct !DILexicalBlock(scope: !234, file: !14, line: 143, column: 9)
!234 = distinct !DILexicalBlock(scope: !230, file: !14, line: 142, column: 5)
!235 = !DILocation(line: 144, column: 17, scope: !233)
!236 = !DILocalVariable(name: "buffer", scope: !233, file: !14, line: 145, type: !4)
!237 = !DILocation(line: 145, column: 19, scope: !233)
!238 = !DILocation(line: 145, column: 35, scope: !233)
!239 = !DILocation(line: 145, column: 28, scope: !233)
!240 = !DILocation(line: 146, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !233, file: !14, line: 146, column: 17)
!242 = !DILocation(line: 146, column: 24, scope: !241)
!243 = !DILocation(line: 146, column: 17, scope: !233)
!244 = !DILocation(line: 146, column: 34, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !14, line: 146, column: 33)
!246 = !DILocation(line: 148, column: 20, scope: !247)
!247 = distinct !DILexicalBlock(scope: !233, file: !14, line: 148, column: 13)
!248 = !DILocation(line: 148, column: 18, scope: !247)
!249 = !DILocation(line: 148, column: 25, scope: !250)
!250 = distinct !DILexicalBlock(scope: !247, file: !14, line: 148, column: 13)
!251 = !DILocation(line: 148, column: 27, scope: !250)
!252 = !DILocation(line: 148, column: 13, scope: !247)
!253 = !DILocation(line: 150, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !14, line: 149, column: 13)
!255 = !DILocation(line: 150, column: 24, scope: !254)
!256 = !DILocation(line: 150, column: 27, scope: !254)
!257 = !DILocation(line: 151, column: 13, scope: !254)
!258 = !DILocation(line: 148, column: 34, scope: !250)
!259 = !DILocation(line: 148, column: 13, scope: !250)
!260 = distinct !{!260, !252, !261, !52}
!261 = !DILocation(line: 151, column: 13, scope: !247)
!262 = !DILocation(line: 154, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !233, file: !14, line: 154, column: 17)
!264 = !DILocation(line: 154, column: 22, scope: !263)
!265 = !DILocation(line: 154, column: 17, scope: !233)
!266 = !DILocation(line: 156, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !14, line: 155, column: 13)
!268 = !DILocation(line: 156, column: 24, scope: !267)
!269 = !DILocation(line: 156, column: 30, scope: !267)
!270 = !DILocation(line: 158, column: 23, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !14, line: 158, column: 17)
!272 = !DILocation(line: 158, column: 21, scope: !271)
!273 = !DILocation(line: 158, column: 28, scope: !274)
!274 = distinct !DILexicalBlock(scope: !271, file: !14, line: 158, column: 17)
!275 = !DILocation(line: 158, column: 30, scope: !274)
!276 = !DILocation(line: 158, column: 17, scope: !271)
!277 = !DILocation(line: 160, column: 34, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !14, line: 159, column: 17)
!279 = !DILocation(line: 160, column: 41, scope: !278)
!280 = !DILocation(line: 160, column: 21, scope: !278)
!281 = !DILocation(line: 161, column: 17, scope: !278)
!282 = !DILocation(line: 158, column: 37, scope: !274)
!283 = !DILocation(line: 158, column: 17, scope: !274)
!284 = distinct !{!284, !276, !285, !52}
!285 = !DILocation(line: 161, column: 17, scope: !271)
!286 = !DILocation(line: 162, column: 13, scope: !267)
!287 = !DILocation(line: 165, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !263, file: !14, line: 164, column: 13)
!289 = !DILocation(line: 167, column: 18, scope: !233)
!290 = !DILocation(line: 167, column: 13, scope: !233)
!291 = !DILocation(line: 169, column: 5, scope: !234)
!292 = !DILocation(line: 170, column: 1, scope: !226)
