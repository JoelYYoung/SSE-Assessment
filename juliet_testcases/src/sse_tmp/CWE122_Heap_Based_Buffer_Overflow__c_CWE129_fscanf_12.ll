; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i24 = alloca i32, align 4
  %buffer25 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !24
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !26
  br label %if.end, !dbg !27

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !28
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call2 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !30
  %tobool3 = icmp ne i32 %call2, 0, !dbg !30
  br i1 %tobool3, label %if.then4, label %if.else23, !dbg !32

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !37, metadata !DIExpression()), !dbg !38
  %call5 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !39
  %1 = bitcast i8* %call5 to i32*, !dbg !40
  store i32* %1, i32** %buffer, align 8, !dbg !38
  %2 = load i32*, i32** %buffer, align 8, !dbg !41
  %cmp = icmp eq i32* %2, null, !dbg !43
  br i1 %cmp, label %if.then6, label %if.end7, !dbg !44

if.then6:                                         ; preds = %if.then4
  call void @exit(i32 -1) #6, !dbg !45
  unreachable, !dbg !45

if.end7:                                          ; preds = %if.then4
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end7
  %3 = load i32, i32* %i, align 4, !dbg !50
  %cmp8 = icmp slt i32 %3, 10, !dbg !52
  br i1 %cmp8, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !54
  %5 = load i32, i32* %i, align 4, !dbg !56
  %idxprom = sext i32 %5 to i64, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %6, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !64
  %cmp9 = icmp sge i32 %7, 0, !dbg !66
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !67

if.then10:                                        ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !68
  %9 = load i32, i32* %data, align 4, !dbg !70
  %idxprom11 = sext i32 %9 to i64, !dbg !68
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !68
  store i32 1, i32* %arrayidx12, align 4, !dbg !71
  store i32 0, i32* %i, align 4, !dbg !72
  br label %for.cond13, !dbg !74

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !75
  %cmp14 = icmp slt i32 %10, 10, !dbg !77
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !78

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !79
  %12 = load i32, i32* %i, align 4, !dbg !81
  %idxprom16 = sext i32 %12 to i64, !dbg !79
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !79
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !79
  call void @printIntLine(i32 %13), !dbg !82
  br label %for.inc18, !dbg !83

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !84
  %inc19 = add nsw i32 %14, 1, !dbg !84
  store i32 %inc19, i32* %i, align 4, !dbg !84
  br label %for.cond13, !dbg !85, !llvm.loop !86

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !88

if.else21:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !91
  %16 = bitcast i32* %15 to i8*, !dbg !91
  call void @free(i8* %16) #5, !dbg !92
  br label %if.end53, !dbg !93

if.else23:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i24, metadata !94, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32** %buffer25, metadata !98, metadata !DIExpression()), !dbg !99
  %call26 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !100
  %17 = bitcast i8* %call26 to i32*, !dbg !101
  store i32* %17, i32** %buffer25, align 8, !dbg !99
  %18 = load i32*, i32** %buffer25, align 8, !dbg !102
  %cmp27 = icmp eq i32* %18, null, !dbg !104
  br i1 %cmp27, label %if.then28, label %if.end29, !dbg !105

if.then28:                                        ; preds = %if.else23
  call void @exit(i32 -1) #6, !dbg !106
  unreachable, !dbg !106

if.end29:                                         ; preds = %if.else23
  store i32 0, i32* %i24, align 4, !dbg !108
  br label %for.cond30, !dbg !110

for.cond30:                                       ; preds = %for.inc35, %if.end29
  %19 = load i32, i32* %i24, align 4, !dbg !111
  %cmp31 = icmp slt i32 %19, 10, !dbg !113
  br i1 %cmp31, label %for.body32, label %for.end37, !dbg !114

for.body32:                                       ; preds = %for.cond30
  %20 = load i32*, i32** %buffer25, align 8, !dbg !115
  %21 = load i32, i32* %i24, align 4, !dbg !117
  %idxprom33 = sext i32 %21 to i64, !dbg !115
  %arrayidx34 = getelementptr inbounds i32, i32* %20, i64 %idxprom33, !dbg !115
  store i32 0, i32* %arrayidx34, align 4, !dbg !118
  br label %for.inc35, !dbg !119

for.inc35:                                        ; preds = %for.body32
  %22 = load i32, i32* %i24, align 4, !dbg !120
  %inc36 = add nsw i32 %22, 1, !dbg !120
  store i32 %inc36, i32* %i24, align 4, !dbg !120
  br label %for.cond30, !dbg !121, !llvm.loop !122

for.end37:                                        ; preds = %for.cond30
  %23 = load i32, i32* %data, align 4, !dbg !124
  %cmp38 = icmp sge i32 %23, 0, !dbg !126
  br i1 %cmp38, label %land.lhs.true, label %if.else51, !dbg !127

land.lhs.true:                                    ; preds = %for.end37
  %24 = load i32, i32* %data, align 4, !dbg !128
  %cmp39 = icmp slt i32 %24, 10, !dbg !129
  br i1 %cmp39, label %if.then40, label %if.else51, !dbg !130

if.then40:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer25, align 8, !dbg !131
  %26 = load i32, i32* %data, align 4, !dbg !133
  %idxprom41 = sext i32 %26 to i64, !dbg !131
  %arrayidx42 = getelementptr inbounds i32, i32* %25, i64 %idxprom41, !dbg !131
  store i32 1, i32* %arrayidx42, align 4, !dbg !134
  store i32 0, i32* %i24, align 4, !dbg !135
  br label %for.cond43, !dbg !137

for.cond43:                                       ; preds = %for.inc48, %if.then40
  %27 = load i32, i32* %i24, align 4, !dbg !138
  %cmp44 = icmp slt i32 %27, 10, !dbg !140
  br i1 %cmp44, label %for.body45, label %for.end50, !dbg !141

for.body45:                                       ; preds = %for.cond43
  %28 = load i32*, i32** %buffer25, align 8, !dbg !142
  %29 = load i32, i32* %i24, align 4, !dbg !144
  %idxprom46 = sext i32 %29 to i64, !dbg !142
  %arrayidx47 = getelementptr inbounds i32, i32* %28, i64 %idxprom46, !dbg !142
  %30 = load i32, i32* %arrayidx47, align 4, !dbg !142
  call void @printIntLine(i32 %30), !dbg !145
  br label %for.inc48, !dbg !146

for.inc48:                                        ; preds = %for.body45
  %31 = load i32, i32* %i24, align 4, !dbg !147
  %inc49 = add nsw i32 %31, 1, !dbg !147
  store i32 %inc49, i32* %i24, align 4, !dbg !147
  br label %for.cond43, !dbg !148, !llvm.loop !149

for.end50:                                        ; preds = %for.cond43
  br label %if.end52, !dbg !151

if.else51:                                        ; preds = %land.lhs.true, %for.end37
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !152
  br label %if.end52

if.end52:                                         ; preds = %if.else51, %for.end50
  %32 = load i32*, i32** %buffer25, align 8, !dbg !154
  %33 = bitcast i32* %32 to i8*, !dbg !154
  call void @free(i8* %33) #5, !dbg !155
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.end22
  ret void, !dbg !156
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12_good() #0 !dbg !157 {
entry:
  call void @goodB2G(), !dbg !158
  call void @goodG2B(), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !161 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !167, metadata !DIExpression()), !dbg !168
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !169, metadata !DIExpression()), !dbg !170
  %call = call i64 @time(i64* null) #5, !dbg !171
  %conv = trunc i64 %call to i32, !dbg !172
  call void @srand(i32 %conv) #5, !dbg !173
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !174
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12_good(), !dbg !175
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !176
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !177
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12_bad(), !dbg !178
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !179
  ret i32 0, !dbg !180
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !181 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i26 = alloca i32, align 4
  %buffer27 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !182, metadata !DIExpression()), !dbg !183
  store i32 -1, i32* %data, align 4, !dbg !184
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !185
  %tobool = icmp ne i32 %call, 0, !dbg !185
  br i1 %tobool, label %if.then, label %if.else, !dbg !187

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !188
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !190
  br label %if.end, !dbg !191

if.else:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !192
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !194
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call3 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !195
  %tobool4 = icmp ne i32 %call3, 0, !dbg !195
  br i1 %tobool4, label %if.then5, label %if.else25, !dbg !197

if.then5:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !202, metadata !DIExpression()), !dbg !203
  %call6 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !204
  %2 = bitcast i8* %call6 to i32*, !dbg !205
  store i32* %2, i32** %buffer, align 8, !dbg !203
  %3 = load i32*, i32** %buffer, align 8, !dbg !206
  %cmp = icmp eq i32* %3, null, !dbg !208
  br i1 %cmp, label %if.then7, label %if.end8, !dbg !209

if.then7:                                         ; preds = %if.then5
  call void @exit(i32 -1) #6, !dbg !210
  unreachable, !dbg !210

if.end8:                                          ; preds = %if.then5
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.end8
  %4 = load i32, i32* %i, align 4, !dbg !215
  %cmp9 = icmp slt i32 %4, 10, !dbg !217
  br i1 %cmp9, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !219
  %6 = load i32, i32* %i, align 4, !dbg !221
  %idxprom = sext i32 %6 to i64, !dbg !219
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !219
  store i32 0, i32* %arrayidx, align 4, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !224
  %inc = add nsw i32 %7, 1, !dbg !224
  store i32 %inc, i32* %i, align 4, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !228
  %cmp10 = icmp sge i32 %8, 0, !dbg !230
  br i1 %cmp10, label %land.lhs.true, label %if.else23, !dbg !231

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !232
  %cmp11 = icmp slt i32 %9, 10, !dbg !233
  br i1 %cmp11, label %if.then12, label %if.else23, !dbg !234

if.then12:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !235
  %11 = load i32, i32* %data, align 4, !dbg !237
  %idxprom13 = sext i32 %11 to i64, !dbg !235
  %arrayidx14 = getelementptr inbounds i32, i32* %10, i64 %idxprom13, !dbg !235
  store i32 1, i32* %arrayidx14, align 4, !dbg !238
  store i32 0, i32* %i, align 4, !dbg !239
  br label %for.cond15, !dbg !241

for.cond15:                                       ; preds = %for.inc20, %if.then12
  %12 = load i32, i32* %i, align 4, !dbg !242
  %cmp16 = icmp slt i32 %12, 10, !dbg !244
  br i1 %cmp16, label %for.body17, label %for.end22, !dbg !245

for.body17:                                       ; preds = %for.cond15
  %13 = load i32*, i32** %buffer, align 8, !dbg !246
  %14 = load i32, i32* %i, align 4, !dbg !248
  %idxprom18 = sext i32 %14 to i64, !dbg !246
  %arrayidx19 = getelementptr inbounds i32, i32* %13, i64 %idxprom18, !dbg !246
  %15 = load i32, i32* %arrayidx19, align 4, !dbg !246
  call void @printIntLine(i32 %15), !dbg !249
  br label %for.inc20, !dbg !250

for.inc20:                                        ; preds = %for.body17
  %16 = load i32, i32* %i, align 4, !dbg !251
  %inc21 = add nsw i32 %16, 1, !dbg !251
  store i32 %inc21, i32* %i, align 4, !dbg !251
  br label %for.cond15, !dbg !252, !llvm.loop !253

for.end22:                                        ; preds = %for.cond15
  br label %if.end24, !dbg !255

if.else23:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !256
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %for.end22
  %17 = load i32*, i32** %buffer, align 8, !dbg !258
  %18 = bitcast i32* %17 to i8*, !dbg !258
  call void @free(i8* %18) #5, !dbg !259
  br label %if.end56, !dbg !260

if.else25:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i26, metadata !261, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.declare(metadata i32** %buffer27, metadata !265, metadata !DIExpression()), !dbg !266
  %call28 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !267
  %19 = bitcast i8* %call28 to i32*, !dbg !268
  store i32* %19, i32** %buffer27, align 8, !dbg !266
  %20 = load i32*, i32** %buffer27, align 8, !dbg !269
  %cmp29 = icmp eq i32* %20, null, !dbg !271
  br i1 %cmp29, label %if.then30, label %if.end31, !dbg !272

if.then30:                                        ; preds = %if.else25
  call void @exit(i32 -1) #6, !dbg !273
  unreachable, !dbg !273

if.end31:                                         ; preds = %if.else25
  store i32 0, i32* %i26, align 4, !dbg !275
  br label %for.cond32, !dbg !277

for.cond32:                                       ; preds = %for.inc37, %if.end31
  %21 = load i32, i32* %i26, align 4, !dbg !278
  %cmp33 = icmp slt i32 %21, 10, !dbg !280
  br i1 %cmp33, label %for.body34, label %for.end39, !dbg !281

for.body34:                                       ; preds = %for.cond32
  %22 = load i32*, i32** %buffer27, align 8, !dbg !282
  %23 = load i32, i32* %i26, align 4, !dbg !284
  %idxprom35 = sext i32 %23 to i64, !dbg !282
  %arrayidx36 = getelementptr inbounds i32, i32* %22, i64 %idxprom35, !dbg !282
  store i32 0, i32* %arrayidx36, align 4, !dbg !285
  br label %for.inc37, !dbg !286

for.inc37:                                        ; preds = %for.body34
  %24 = load i32, i32* %i26, align 4, !dbg !287
  %inc38 = add nsw i32 %24, 1, !dbg !287
  store i32 %inc38, i32* %i26, align 4, !dbg !287
  br label %for.cond32, !dbg !288, !llvm.loop !289

for.end39:                                        ; preds = %for.cond32
  %25 = load i32, i32* %data, align 4, !dbg !291
  %cmp40 = icmp sge i32 %25, 0, !dbg !293
  br i1 %cmp40, label %land.lhs.true41, label %if.else54, !dbg !294

land.lhs.true41:                                  ; preds = %for.end39
  %26 = load i32, i32* %data, align 4, !dbg !295
  %cmp42 = icmp slt i32 %26, 10, !dbg !296
  br i1 %cmp42, label %if.then43, label %if.else54, !dbg !297

if.then43:                                        ; preds = %land.lhs.true41
  %27 = load i32*, i32** %buffer27, align 8, !dbg !298
  %28 = load i32, i32* %data, align 4, !dbg !300
  %idxprom44 = sext i32 %28 to i64, !dbg !298
  %arrayidx45 = getelementptr inbounds i32, i32* %27, i64 %idxprom44, !dbg !298
  store i32 1, i32* %arrayidx45, align 4, !dbg !301
  store i32 0, i32* %i26, align 4, !dbg !302
  br label %for.cond46, !dbg !304

for.cond46:                                       ; preds = %for.inc51, %if.then43
  %29 = load i32, i32* %i26, align 4, !dbg !305
  %cmp47 = icmp slt i32 %29, 10, !dbg !307
  br i1 %cmp47, label %for.body48, label %for.end53, !dbg !308

for.body48:                                       ; preds = %for.cond46
  %30 = load i32*, i32** %buffer27, align 8, !dbg !309
  %31 = load i32, i32* %i26, align 4, !dbg !311
  %idxprom49 = sext i32 %31 to i64, !dbg !309
  %arrayidx50 = getelementptr inbounds i32, i32* %30, i64 %idxprom49, !dbg !309
  %32 = load i32, i32* %arrayidx50, align 4, !dbg !309
  call void @printIntLine(i32 %32), !dbg !312
  br label %for.inc51, !dbg !313

for.inc51:                                        ; preds = %for.body48
  %33 = load i32, i32* %i26, align 4, !dbg !314
  %inc52 = add nsw i32 %33, 1, !dbg !314
  store i32 %inc52, i32* %i26, align 4, !dbg !314
  br label %for.cond46, !dbg !315, !llvm.loop !316

for.end53:                                        ; preds = %for.cond46
  br label %if.end55, !dbg !318

if.else54:                                        ; preds = %land.lhs.true41, %for.end39
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !319
  br label %if.end55

if.end55:                                         ; preds = %if.else54, %for.end53
  %34 = load i32*, i32** %buffer27, align 8, !dbg !321
  %35 = bitcast i32* %34 to i8*, !dbg !321
  call void @free(i8* %35) #5, !dbg !322
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end24
  ret void, !dbg !323
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !324 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %buffer24 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !325, metadata !DIExpression()), !dbg !326
  store i32 -1, i32* %data, align 4, !dbg !327
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !328
  %tobool = icmp ne i32 %call, 0, !dbg !328
  br i1 %tobool, label %if.then, label %if.else, !dbg !330

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !331
  br label %if.end, !dbg !333

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !334
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !336
  %tobool2 = icmp ne i32 %call1, 0, !dbg !336
  br i1 %tobool2, label %if.then3, label %if.else22, !dbg !338

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !339, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !343, metadata !DIExpression()), !dbg !344
  %call4 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !345
  %0 = bitcast i8* %call4 to i32*, !dbg !346
  store i32* %0, i32** %buffer, align 8, !dbg !344
  %1 = load i32*, i32** %buffer, align 8, !dbg !347
  %cmp = icmp eq i32* %1, null, !dbg !349
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !350

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #6, !dbg !351
  unreachable, !dbg !351

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !353
  br label %for.cond, !dbg !355

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !356
  %cmp7 = icmp slt i32 %2, 10, !dbg !358
  br i1 %cmp7, label %for.body, label %for.end, !dbg !359

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !360
  %4 = load i32, i32* %i, align 4, !dbg !362
  %idxprom = sext i32 %4 to i64, !dbg !360
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !360
  store i32 0, i32* %arrayidx, align 4, !dbg !363
  br label %for.inc, !dbg !364

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !365
  %inc = add nsw i32 %5, 1, !dbg !365
  store i32 %inc, i32* %i, align 4, !dbg !365
  br label %for.cond, !dbg !366, !llvm.loop !367

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !369
  %cmp8 = icmp sge i32 %6, 0, !dbg !371
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !372

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !373
  %8 = load i32, i32* %data, align 4, !dbg !375
  %idxprom10 = sext i32 %8 to i64, !dbg !373
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !373
  store i32 1, i32* %arrayidx11, align 4, !dbg !376
  store i32 0, i32* %i, align 4, !dbg !377
  br label %for.cond12, !dbg !379

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !380
  %cmp13 = icmp slt i32 %9, 10, !dbg !382
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !383

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !384
  %11 = load i32, i32* %i, align 4, !dbg !386
  %idxprom15 = sext i32 %11 to i64, !dbg !384
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !384
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !384
  call void @printIntLine(i32 %12), !dbg !387
  br label %for.inc17, !dbg !388

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !389
  %inc18 = add nsw i32 %13, 1, !dbg !389
  store i32 %inc18, i32* %i, align 4, !dbg !389
  br label %for.cond12, !dbg !390, !llvm.loop !391

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !393

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !394
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !396
  %15 = bitcast i32* %14 to i8*, !dbg !396
  call void @free(i8* %15) #5, !dbg !397
  br label %if.end51, !dbg !398

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !399, metadata !DIExpression()), !dbg !402
  call void @llvm.dbg.declare(metadata i32** %buffer24, metadata !403, metadata !DIExpression()), !dbg !404
  %call25 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !405
  %16 = bitcast i8* %call25 to i32*, !dbg !406
  store i32* %16, i32** %buffer24, align 8, !dbg !404
  %17 = load i32*, i32** %buffer24, align 8, !dbg !407
  %cmp26 = icmp eq i32* %17, null, !dbg !409
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !410

if.then27:                                        ; preds = %if.else22
  call void @exit(i32 -1) #6, !dbg !411
  unreachable, !dbg !411

if.end28:                                         ; preds = %if.else22
  store i32 0, i32* %i23, align 4, !dbg !413
  br label %for.cond29, !dbg !415

for.cond29:                                       ; preds = %for.inc34, %if.end28
  %18 = load i32, i32* %i23, align 4, !dbg !416
  %cmp30 = icmp slt i32 %18, 10, !dbg !418
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !419

for.body31:                                       ; preds = %for.cond29
  %19 = load i32*, i32** %buffer24, align 8, !dbg !420
  %20 = load i32, i32* %i23, align 4, !dbg !422
  %idxprom32 = sext i32 %20 to i64, !dbg !420
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %idxprom32, !dbg !420
  store i32 0, i32* %arrayidx33, align 4, !dbg !423
  br label %for.inc34, !dbg !424

for.inc34:                                        ; preds = %for.body31
  %21 = load i32, i32* %i23, align 4, !dbg !425
  %inc35 = add nsw i32 %21, 1, !dbg !425
  store i32 %inc35, i32* %i23, align 4, !dbg !425
  br label %for.cond29, !dbg !426, !llvm.loop !427

for.end36:                                        ; preds = %for.cond29
  %22 = load i32, i32* %data, align 4, !dbg !429
  %cmp37 = icmp sge i32 %22, 0, !dbg !431
  br i1 %cmp37, label %if.then38, label %if.else49, !dbg !432

if.then38:                                        ; preds = %for.end36
  %23 = load i32*, i32** %buffer24, align 8, !dbg !433
  %24 = load i32, i32* %data, align 4, !dbg !435
  %idxprom39 = sext i32 %24 to i64, !dbg !433
  %arrayidx40 = getelementptr inbounds i32, i32* %23, i64 %idxprom39, !dbg !433
  store i32 1, i32* %arrayidx40, align 4, !dbg !436
  store i32 0, i32* %i23, align 4, !dbg !437
  br label %for.cond41, !dbg !439

for.cond41:                                       ; preds = %for.inc46, %if.then38
  %25 = load i32, i32* %i23, align 4, !dbg !440
  %cmp42 = icmp slt i32 %25, 10, !dbg !442
  br i1 %cmp42, label %for.body43, label %for.end48, !dbg !443

for.body43:                                       ; preds = %for.cond41
  %26 = load i32*, i32** %buffer24, align 8, !dbg !444
  %27 = load i32, i32* %i23, align 4, !dbg !446
  %idxprom44 = sext i32 %27 to i64, !dbg !444
  %arrayidx45 = getelementptr inbounds i32, i32* %26, i64 %idxprom44, !dbg !444
  %28 = load i32, i32* %arrayidx45, align 4, !dbg !444
  call void @printIntLine(i32 %28), !dbg !447
  br label %for.inc46, !dbg !448

for.inc46:                                        ; preds = %for.body43
  %29 = load i32, i32* %i23, align 4, !dbg !449
  %inc47 = add nsw i32 %29, 1, !dbg !449
  store i32 %inc47, i32* %i23, align 4, !dbg !449
  br label %for.cond41, !dbg !450, !llvm.loop !451

for.end48:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !453

if.else49:                                        ; preds = %for.end36
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !454
  br label %if.end50

if.end50:                                         ; preds = %if.else49, %for.end48
  %30 = load i32*, i32** %buffer24, align 8, !dbg !456
  %31 = bitcast i32* %30 to i8*, !dbg !456
  call void @free(i8* %31) #5, !dbg !457
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end21
  ret void, !dbg !458
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 9, scope: !25)
!27 = !DILocation(line: 31, column: 5, scope: !25)
!28 = !DILocation(line: 36, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!30 = !DILocation(line: 38, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 8)
!32 = !DILocation(line: 38, column: 8, scope: !14)
!33 = !DILocalVariable(name: "i", scope: !34, file: !15, line: 41, type: !5)
!34 = distinct !DILexicalBlock(scope: !35, file: !15, line: 40, column: 9)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 39, column: 5)
!36 = !DILocation(line: 41, column: 17, scope: !34)
!37 = !DILocalVariable(name: "buffer", scope: !34, file: !15, line: 42, type: !4)
!38 = !DILocation(line: 42, column: 19, scope: !34)
!39 = !DILocation(line: 42, column: 35, scope: !34)
!40 = !DILocation(line: 42, column: 28, scope: !34)
!41 = !DILocation(line: 43, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !34, file: !15, line: 43, column: 17)
!43 = !DILocation(line: 43, column: 24, scope: !42)
!44 = !DILocation(line: 43, column: 17, scope: !34)
!45 = !DILocation(line: 43, column: 34, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 43, column: 33)
!47 = !DILocation(line: 45, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !15, line: 45, column: 13)
!49 = !DILocation(line: 45, column: 18, scope: !48)
!50 = !DILocation(line: 45, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 45, column: 13)
!52 = !DILocation(line: 45, column: 27, scope: !51)
!53 = !DILocation(line: 45, column: 13, scope: !48)
!54 = !DILocation(line: 47, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 46, column: 13)
!56 = !DILocation(line: 47, column: 24, scope: !55)
!57 = !DILocation(line: 47, column: 27, scope: !55)
!58 = !DILocation(line: 48, column: 13, scope: !55)
!59 = !DILocation(line: 45, column: 34, scope: !51)
!60 = !DILocation(line: 45, column: 13, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 48, column: 13, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 51, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !34, file: !15, line: 51, column: 17)
!66 = !DILocation(line: 51, column: 22, scope: !65)
!67 = !DILocation(line: 51, column: 17, scope: !34)
!68 = !DILocation(line: 53, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 52, column: 13)
!70 = !DILocation(line: 53, column: 24, scope: !69)
!71 = !DILocation(line: 53, column: 30, scope: !69)
!72 = !DILocation(line: 55, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 55, column: 17)
!74 = !DILocation(line: 55, column: 21, scope: !73)
!75 = !DILocation(line: 55, column: 28, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !15, line: 55, column: 17)
!77 = !DILocation(line: 55, column: 30, scope: !76)
!78 = !DILocation(line: 55, column: 17, scope: !73)
!79 = !DILocation(line: 57, column: 34, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 56, column: 17)
!81 = !DILocation(line: 57, column: 41, scope: !80)
!82 = !DILocation(line: 57, column: 21, scope: !80)
!83 = !DILocation(line: 58, column: 17, scope: !80)
!84 = !DILocation(line: 55, column: 37, scope: !76)
!85 = !DILocation(line: 55, column: 17, scope: !76)
!86 = distinct !{!86, !78, !87, !63}
!87 = !DILocation(line: 58, column: 17, scope: !73)
!88 = !DILocation(line: 59, column: 13, scope: !69)
!89 = !DILocation(line: 62, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !65, file: !15, line: 61, column: 13)
!91 = !DILocation(line: 64, column: 18, scope: !34)
!92 = !DILocation(line: 64, column: 13, scope: !34)
!93 = !DILocation(line: 66, column: 5, scope: !35)
!94 = !DILocalVariable(name: "i", scope: !95, file: !15, line: 70, type: !5)
!95 = distinct !DILexicalBlock(scope: !96, file: !15, line: 69, column: 9)
!96 = distinct !DILexicalBlock(scope: !31, file: !15, line: 68, column: 5)
!97 = !DILocation(line: 70, column: 17, scope: !95)
!98 = !DILocalVariable(name: "buffer", scope: !95, file: !15, line: 71, type: !4)
!99 = !DILocation(line: 71, column: 19, scope: !95)
!100 = !DILocation(line: 71, column: 35, scope: !95)
!101 = !DILocation(line: 71, column: 28, scope: !95)
!102 = !DILocation(line: 72, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !95, file: !15, line: 72, column: 17)
!104 = !DILocation(line: 72, column: 24, scope: !103)
!105 = !DILocation(line: 72, column: 17, scope: !95)
!106 = !DILocation(line: 72, column: 34, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 72, column: 33)
!108 = !DILocation(line: 74, column: 20, scope: !109)
!109 = distinct !DILexicalBlock(scope: !95, file: !15, line: 74, column: 13)
!110 = !DILocation(line: 74, column: 18, scope: !109)
!111 = !DILocation(line: 74, column: 25, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !15, line: 74, column: 13)
!113 = !DILocation(line: 74, column: 27, scope: !112)
!114 = !DILocation(line: 74, column: 13, scope: !109)
!115 = !DILocation(line: 76, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 75, column: 13)
!117 = !DILocation(line: 76, column: 24, scope: !116)
!118 = !DILocation(line: 76, column: 27, scope: !116)
!119 = !DILocation(line: 77, column: 13, scope: !116)
!120 = !DILocation(line: 74, column: 34, scope: !112)
!121 = !DILocation(line: 74, column: 13, scope: !112)
!122 = distinct !{!122, !114, !123, !63}
!123 = !DILocation(line: 77, column: 13, scope: !109)
!124 = !DILocation(line: 79, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !95, file: !15, line: 79, column: 17)
!126 = !DILocation(line: 79, column: 22, scope: !125)
!127 = !DILocation(line: 79, column: 27, scope: !125)
!128 = !DILocation(line: 79, column: 30, scope: !125)
!129 = !DILocation(line: 79, column: 35, scope: !125)
!130 = !DILocation(line: 79, column: 17, scope: !95)
!131 = !DILocation(line: 81, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !15, line: 80, column: 13)
!133 = !DILocation(line: 81, column: 24, scope: !132)
!134 = !DILocation(line: 81, column: 30, scope: !132)
!135 = !DILocation(line: 83, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 83, column: 17)
!137 = !DILocation(line: 83, column: 21, scope: !136)
!138 = !DILocation(line: 83, column: 28, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !15, line: 83, column: 17)
!140 = !DILocation(line: 83, column: 30, scope: !139)
!141 = !DILocation(line: 83, column: 17, scope: !136)
!142 = !DILocation(line: 85, column: 34, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !15, line: 84, column: 17)
!144 = !DILocation(line: 85, column: 41, scope: !143)
!145 = !DILocation(line: 85, column: 21, scope: !143)
!146 = !DILocation(line: 86, column: 17, scope: !143)
!147 = !DILocation(line: 83, column: 37, scope: !139)
!148 = !DILocation(line: 83, column: 17, scope: !139)
!149 = distinct !{!149, !141, !150, !63}
!150 = !DILocation(line: 86, column: 17, scope: !136)
!151 = !DILocation(line: 87, column: 13, scope: !132)
!152 = !DILocation(line: 90, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !125, file: !15, line: 89, column: 13)
!154 = !DILocation(line: 92, column: 18, scope: !95)
!155 = !DILocation(line: 92, column: 13, scope: !95)
!156 = !DILocation(line: 95, column: 1, scope: !14)
!157 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_12_good", scope: !15, file: !15, line: 257, type: !16, scopeLine: 258, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocation(line: 259, column: 5, scope: !157)
!159 = !DILocation(line: 260, column: 5, scope: !157)
!160 = !DILocation(line: 261, column: 1, scope: !157)
!161 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 272, type: !162, scopeLine: 273, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DISubroutineType(types: !163)
!163 = !{!5, !5, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!166 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!167 = !DILocalVariable(name: "argc", arg: 1, scope: !161, file: !15, line: 272, type: !5)
!168 = !DILocation(line: 272, column: 14, scope: !161)
!169 = !DILocalVariable(name: "argv", arg: 2, scope: !161, file: !15, line: 272, type: !164)
!170 = !DILocation(line: 272, column: 27, scope: !161)
!171 = !DILocation(line: 275, column: 22, scope: !161)
!172 = !DILocation(line: 275, column: 12, scope: !161)
!173 = !DILocation(line: 275, column: 5, scope: !161)
!174 = !DILocation(line: 277, column: 5, scope: !161)
!175 = !DILocation(line: 278, column: 5, scope: !161)
!176 = !DILocation(line: 279, column: 5, scope: !161)
!177 = !DILocation(line: 282, column: 5, scope: !161)
!178 = !DILocation(line: 283, column: 5, scope: !161)
!179 = !DILocation(line: 284, column: 5, scope: !161)
!180 = !DILocation(line: 286, column: 5, scope: !161)
!181 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 104, type: !16, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!182 = !DILocalVariable(name: "data", scope: !181, file: !15, line: 106, type: !5)
!183 = !DILocation(line: 106, column: 9, scope: !181)
!184 = !DILocation(line: 108, column: 10, scope: !181)
!185 = !DILocation(line: 109, column: 8, scope: !186)
!186 = distinct !DILexicalBlock(scope: !181, file: !15, line: 109, column: 8)
!187 = !DILocation(line: 109, column: 8, scope: !181)
!188 = !DILocation(line: 112, column: 16, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !15, line: 110, column: 5)
!190 = !DILocation(line: 112, column: 9, scope: !189)
!191 = !DILocation(line: 113, column: 5, scope: !189)
!192 = !DILocation(line: 117, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !186, file: !15, line: 115, column: 5)
!194 = !DILocation(line: 117, column: 9, scope: !193)
!195 = !DILocation(line: 119, column: 8, scope: !196)
!196 = distinct !DILexicalBlock(scope: !181, file: !15, line: 119, column: 8)
!197 = !DILocation(line: 119, column: 8, scope: !181)
!198 = !DILocalVariable(name: "i", scope: !199, file: !15, line: 122, type: !5)
!199 = distinct !DILexicalBlock(scope: !200, file: !15, line: 121, column: 9)
!200 = distinct !DILexicalBlock(scope: !196, file: !15, line: 120, column: 5)
!201 = !DILocation(line: 122, column: 17, scope: !199)
!202 = !DILocalVariable(name: "buffer", scope: !199, file: !15, line: 123, type: !4)
!203 = !DILocation(line: 123, column: 19, scope: !199)
!204 = !DILocation(line: 123, column: 35, scope: !199)
!205 = !DILocation(line: 123, column: 28, scope: !199)
!206 = !DILocation(line: 124, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !199, file: !15, line: 124, column: 17)
!208 = !DILocation(line: 124, column: 24, scope: !207)
!209 = !DILocation(line: 124, column: 17, scope: !199)
!210 = !DILocation(line: 124, column: 34, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !15, line: 124, column: 33)
!212 = !DILocation(line: 126, column: 20, scope: !213)
!213 = distinct !DILexicalBlock(scope: !199, file: !15, line: 126, column: 13)
!214 = !DILocation(line: 126, column: 18, scope: !213)
!215 = !DILocation(line: 126, column: 25, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !15, line: 126, column: 13)
!217 = !DILocation(line: 126, column: 27, scope: !216)
!218 = !DILocation(line: 126, column: 13, scope: !213)
!219 = !DILocation(line: 128, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !15, line: 127, column: 13)
!221 = !DILocation(line: 128, column: 24, scope: !220)
!222 = !DILocation(line: 128, column: 27, scope: !220)
!223 = !DILocation(line: 129, column: 13, scope: !220)
!224 = !DILocation(line: 126, column: 34, scope: !216)
!225 = !DILocation(line: 126, column: 13, scope: !216)
!226 = distinct !{!226, !218, !227, !63}
!227 = !DILocation(line: 129, column: 13, scope: !213)
!228 = !DILocation(line: 131, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !199, file: !15, line: 131, column: 17)
!230 = !DILocation(line: 131, column: 22, scope: !229)
!231 = !DILocation(line: 131, column: 27, scope: !229)
!232 = !DILocation(line: 131, column: 30, scope: !229)
!233 = !DILocation(line: 131, column: 35, scope: !229)
!234 = !DILocation(line: 131, column: 17, scope: !199)
!235 = !DILocation(line: 133, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !229, file: !15, line: 132, column: 13)
!237 = !DILocation(line: 133, column: 24, scope: !236)
!238 = !DILocation(line: 133, column: 30, scope: !236)
!239 = !DILocation(line: 135, column: 23, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !15, line: 135, column: 17)
!241 = !DILocation(line: 135, column: 21, scope: !240)
!242 = !DILocation(line: 135, column: 28, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !15, line: 135, column: 17)
!244 = !DILocation(line: 135, column: 30, scope: !243)
!245 = !DILocation(line: 135, column: 17, scope: !240)
!246 = !DILocation(line: 137, column: 34, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !15, line: 136, column: 17)
!248 = !DILocation(line: 137, column: 41, scope: !247)
!249 = !DILocation(line: 137, column: 21, scope: !247)
!250 = !DILocation(line: 138, column: 17, scope: !247)
!251 = !DILocation(line: 135, column: 37, scope: !243)
!252 = !DILocation(line: 135, column: 17, scope: !243)
!253 = distinct !{!253, !245, !254, !63}
!254 = !DILocation(line: 138, column: 17, scope: !240)
!255 = !DILocation(line: 139, column: 13, scope: !236)
!256 = !DILocation(line: 142, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !229, file: !15, line: 141, column: 13)
!258 = !DILocation(line: 144, column: 18, scope: !199)
!259 = !DILocation(line: 144, column: 13, scope: !199)
!260 = !DILocation(line: 146, column: 5, scope: !200)
!261 = !DILocalVariable(name: "i", scope: !262, file: !15, line: 150, type: !5)
!262 = distinct !DILexicalBlock(scope: !263, file: !15, line: 149, column: 9)
!263 = distinct !DILexicalBlock(scope: !196, file: !15, line: 148, column: 5)
!264 = !DILocation(line: 150, column: 17, scope: !262)
!265 = !DILocalVariable(name: "buffer", scope: !262, file: !15, line: 151, type: !4)
!266 = !DILocation(line: 151, column: 19, scope: !262)
!267 = !DILocation(line: 151, column: 35, scope: !262)
!268 = !DILocation(line: 151, column: 28, scope: !262)
!269 = !DILocation(line: 152, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !262, file: !15, line: 152, column: 17)
!271 = !DILocation(line: 152, column: 24, scope: !270)
!272 = !DILocation(line: 152, column: 17, scope: !262)
!273 = !DILocation(line: 152, column: 34, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !15, line: 152, column: 33)
!275 = !DILocation(line: 154, column: 20, scope: !276)
!276 = distinct !DILexicalBlock(scope: !262, file: !15, line: 154, column: 13)
!277 = !DILocation(line: 154, column: 18, scope: !276)
!278 = !DILocation(line: 154, column: 25, scope: !279)
!279 = distinct !DILexicalBlock(scope: !276, file: !15, line: 154, column: 13)
!280 = !DILocation(line: 154, column: 27, scope: !279)
!281 = !DILocation(line: 154, column: 13, scope: !276)
!282 = !DILocation(line: 156, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !15, line: 155, column: 13)
!284 = !DILocation(line: 156, column: 24, scope: !283)
!285 = !DILocation(line: 156, column: 27, scope: !283)
!286 = !DILocation(line: 157, column: 13, scope: !283)
!287 = !DILocation(line: 154, column: 34, scope: !279)
!288 = !DILocation(line: 154, column: 13, scope: !279)
!289 = distinct !{!289, !281, !290, !63}
!290 = !DILocation(line: 157, column: 13, scope: !276)
!291 = !DILocation(line: 159, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !262, file: !15, line: 159, column: 17)
!293 = !DILocation(line: 159, column: 22, scope: !292)
!294 = !DILocation(line: 159, column: 27, scope: !292)
!295 = !DILocation(line: 159, column: 30, scope: !292)
!296 = !DILocation(line: 159, column: 35, scope: !292)
!297 = !DILocation(line: 159, column: 17, scope: !262)
!298 = !DILocation(line: 161, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !292, file: !15, line: 160, column: 13)
!300 = !DILocation(line: 161, column: 24, scope: !299)
!301 = !DILocation(line: 161, column: 30, scope: !299)
!302 = !DILocation(line: 163, column: 23, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !15, line: 163, column: 17)
!304 = !DILocation(line: 163, column: 21, scope: !303)
!305 = !DILocation(line: 163, column: 28, scope: !306)
!306 = distinct !DILexicalBlock(scope: !303, file: !15, line: 163, column: 17)
!307 = !DILocation(line: 163, column: 30, scope: !306)
!308 = !DILocation(line: 163, column: 17, scope: !303)
!309 = !DILocation(line: 165, column: 34, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !15, line: 164, column: 17)
!311 = !DILocation(line: 165, column: 41, scope: !310)
!312 = !DILocation(line: 165, column: 21, scope: !310)
!313 = !DILocation(line: 166, column: 17, scope: !310)
!314 = !DILocation(line: 163, column: 37, scope: !306)
!315 = !DILocation(line: 163, column: 17, scope: !306)
!316 = distinct !{!316, !308, !317, !63}
!317 = !DILocation(line: 166, column: 17, scope: !303)
!318 = !DILocation(line: 167, column: 13, scope: !299)
!319 = !DILocation(line: 170, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !292, file: !15, line: 169, column: 13)
!321 = !DILocation(line: 172, column: 18, scope: !262)
!322 = !DILocation(line: 172, column: 13, scope: !262)
!323 = !DILocation(line: 175, column: 1, scope: !181)
!324 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 180, type: !16, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!325 = !DILocalVariable(name: "data", scope: !324, file: !15, line: 182, type: !5)
!326 = !DILocation(line: 182, column: 9, scope: !324)
!327 = !DILocation(line: 184, column: 10, scope: !324)
!328 = !DILocation(line: 185, column: 8, scope: !329)
!329 = distinct !DILexicalBlock(scope: !324, file: !15, line: 185, column: 8)
!330 = !DILocation(line: 185, column: 8, scope: !324)
!331 = !DILocation(line: 189, column: 14, scope: !332)
!332 = distinct !DILexicalBlock(scope: !329, file: !15, line: 186, column: 5)
!333 = !DILocation(line: 190, column: 5, scope: !332)
!334 = !DILocation(line: 195, column: 14, scope: !335)
!335 = distinct !DILexicalBlock(scope: !329, file: !15, line: 192, column: 5)
!336 = !DILocation(line: 197, column: 8, scope: !337)
!337 = distinct !DILexicalBlock(scope: !324, file: !15, line: 197, column: 8)
!338 = !DILocation(line: 197, column: 8, scope: !324)
!339 = !DILocalVariable(name: "i", scope: !340, file: !15, line: 200, type: !5)
!340 = distinct !DILexicalBlock(scope: !341, file: !15, line: 199, column: 9)
!341 = distinct !DILexicalBlock(scope: !337, file: !15, line: 198, column: 5)
!342 = !DILocation(line: 200, column: 17, scope: !340)
!343 = !DILocalVariable(name: "buffer", scope: !340, file: !15, line: 201, type: !4)
!344 = !DILocation(line: 201, column: 19, scope: !340)
!345 = !DILocation(line: 201, column: 35, scope: !340)
!346 = !DILocation(line: 201, column: 28, scope: !340)
!347 = !DILocation(line: 202, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !340, file: !15, line: 202, column: 17)
!349 = !DILocation(line: 202, column: 24, scope: !348)
!350 = !DILocation(line: 202, column: 17, scope: !340)
!351 = !DILocation(line: 202, column: 34, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !15, line: 202, column: 33)
!353 = !DILocation(line: 204, column: 20, scope: !354)
!354 = distinct !DILexicalBlock(scope: !340, file: !15, line: 204, column: 13)
!355 = !DILocation(line: 204, column: 18, scope: !354)
!356 = !DILocation(line: 204, column: 25, scope: !357)
!357 = distinct !DILexicalBlock(scope: !354, file: !15, line: 204, column: 13)
!358 = !DILocation(line: 204, column: 27, scope: !357)
!359 = !DILocation(line: 204, column: 13, scope: !354)
!360 = !DILocation(line: 206, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !15, line: 205, column: 13)
!362 = !DILocation(line: 206, column: 24, scope: !361)
!363 = !DILocation(line: 206, column: 27, scope: !361)
!364 = !DILocation(line: 207, column: 13, scope: !361)
!365 = !DILocation(line: 204, column: 34, scope: !357)
!366 = !DILocation(line: 204, column: 13, scope: !357)
!367 = distinct !{!367, !359, !368, !63}
!368 = !DILocation(line: 207, column: 13, scope: !354)
!369 = !DILocation(line: 210, column: 17, scope: !370)
!370 = distinct !DILexicalBlock(scope: !340, file: !15, line: 210, column: 17)
!371 = !DILocation(line: 210, column: 22, scope: !370)
!372 = !DILocation(line: 210, column: 17, scope: !340)
!373 = !DILocation(line: 212, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !15, line: 211, column: 13)
!375 = !DILocation(line: 212, column: 24, scope: !374)
!376 = !DILocation(line: 212, column: 30, scope: !374)
!377 = !DILocation(line: 214, column: 23, scope: !378)
!378 = distinct !DILexicalBlock(scope: !374, file: !15, line: 214, column: 17)
!379 = !DILocation(line: 214, column: 21, scope: !378)
!380 = !DILocation(line: 214, column: 28, scope: !381)
!381 = distinct !DILexicalBlock(scope: !378, file: !15, line: 214, column: 17)
!382 = !DILocation(line: 214, column: 30, scope: !381)
!383 = !DILocation(line: 214, column: 17, scope: !378)
!384 = !DILocation(line: 216, column: 34, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !15, line: 215, column: 17)
!386 = !DILocation(line: 216, column: 41, scope: !385)
!387 = !DILocation(line: 216, column: 21, scope: !385)
!388 = !DILocation(line: 217, column: 17, scope: !385)
!389 = !DILocation(line: 214, column: 37, scope: !381)
!390 = !DILocation(line: 214, column: 17, scope: !381)
!391 = distinct !{!391, !383, !392, !63}
!392 = !DILocation(line: 217, column: 17, scope: !378)
!393 = !DILocation(line: 218, column: 13, scope: !374)
!394 = !DILocation(line: 221, column: 17, scope: !395)
!395 = distinct !DILexicalBlock(scope: !370, file: !15, line: 220, column: 13)
!396 = !DILocation(line: 223, column: 18, scope: !340)
!397 = !DILocation(line: 223, column: 13, scope: !340)
!398 = !DILocation(line: 225, column: 5, scope: !341)
!399 = !DILocalVariable(name: "i", scope: !400, file: !15, line: 229, type: !5)
!400 = distinct !DILexicalBlock(scope: !401, file: !15, line: 228, column: 9)
!401 = distinct !DILexicalBlock(scope: !337, file: !15, line: 227, column: 5)
!402 = !DILocation(line: 229, column: 17, scope: !400)
!403 = !DILocalVariable(name: "buffer", scope: !400, file: !15, line: 230, type: !4)
!404 = !DILocation(line: 230, column: 19, scope: !400)
!405 = !DILocation(line: 230, column: 35, scope: !400)
!406 = !DILocation(line: 230, column: 28, scope: !400)
!407 = !DILocation(line: 231, column: 17, scope: !408)
!408 = distinct !DILexicalBlock(scope: !400, file: !15, line: 231, column: 17)
!409 = !DILocation(line: 231, column: 24, scope: !408)
!410 = !DILocation(line: 231, column: 17, scope: !400)
!411 = !DILocation(line: 231, column: 34, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !15, line: 231, column: 33)
!413 = !DILocation(line: 233, column: 20, scope: !414)
!414 = distinct !DILexicalBlock(scope: !400, file: !15, line: 233, column: 13)
!415 = !DILocation(line: 233, column: 18, scope: !414)
!416 = !DILocation(line: 233, column: 25, scope: !417)
!417 = distinct !DILexicalBlock(scope: !414, file: !15, line: 233, column: 13)
!418 = !DILocation(line: 233, column: 27, scope: !417)
!419 = !DILocation(line: 233, column: 13, scope: !414)
!420 = !DILocation(line: 235, column: 17, scope: !421)
!421 = distinct !DILexicalBlock(scope: !417, file: !15, line: 234, column: 13)
!422 = !DILocation(line: 235, column: 24, scope: !421)
!423 = !DILocation(line: 235, column: 27, scope: !421)
!424 = !DILocation(line: 236, column: 13, scope: !421)
!425 = !DILocation(line: 233, column: 34, scope: !417)
!426 = !DILocation(line: 233, column: 13, scope: !417)
!427 = distinct !{!427, !419, !428, !63}
!428 = !DILocation(line: 236, column: 13, scope: !414)
!429 = !DILocation(line: 239, column: 17, scope: !430)
!430 = distinct !DILexicalBlock(scope: !400, file: !15, line: 239, column: 17)
!431 = !DILocation(line: 239, column: 22, scope: !430)
!432 = !DILocation(line: 239, column: 17, scope: !400)
!433 = !DILocation(line: 241, column: 17, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !15, line: 240, column: 13)
!435 = !DILocation(line: 241, column: 24, scope: !434)
!436 = !DILocation(line: 241, column: 30, scope: !434)
!437 = !DILocation(line: 243, column: 23, scope: !438)
!438 = distinct !DILexicalBlock(scope: !434, file: !15, line: 243, column: 17)
!439 = !DILocation(line: 243, column: 21, scope: !438)
!440 = !DILocation(line: 243, column: 28, scope: !441)
!441 = distinct !DILexicalBlock(scope: !438, file: !15, line: 243, column: 17)
!442 = !DILocation(line: 243, column: 30, scope: !441)
!443 = !DILocation(line: 243, column: 17, scope: !438)
!444 = !DILocation(line: 245, column: 34, scope: !445)
!445 = distinct !DILexicalBlock(scope: !441, file: !15, line: 244, column: 17)
!446 = !DILocation(line: 245, column: 41, scope: !445)
!447 = !DILocation(line: 245, column: 21, scope: !445)
!448 = !DILocation(line: 246, column: 17, scope: !445)
!449 = !DILocation(line: 243, column: 37, scope: !441)
!450 = !DILocation(line: 243, column: 17, scope: !441)
!451 = distinct !{!451, !443, !452, !63}
!452 = !DILocation(line: 246, column: 17, scope: !438)
!453 = !DILocation(line: 247, column: 13, scope: !434)
!454 = !DILocation(line: 250, column: 17, scope: !455)
!455 = distinct !DILexicalBlock(scope: !430, file: !15, line: 249, column: 13)
!456 = !DILocation(line: 252, column: 18, scope: !400)
!457 = !DILocation(line: 252, column: 13, scope: !400)
!458 = !DILocation(line: 255, column: 1, scope: !324)
