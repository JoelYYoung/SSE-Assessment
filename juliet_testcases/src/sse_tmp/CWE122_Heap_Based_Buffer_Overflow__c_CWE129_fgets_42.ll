; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* %data, align 4, !dbg !21
  %call = call i32 @badSource(i32 %0), !dbg !22
  store i32 %call, i32* %data, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !27, metadata !DIExpression()), !dbg !28
  %call1 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !29
  %1 = bitcast i8* %call1 to i32*, !dbg !30
  store i32* %1, i32** %buffer, align 8, !dbg !28
  %2 = load i32*, i32** %buffer, align 8, !dbg !31
  %cmp = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !40
  %cmp2 = icmp slt i32 %3, 10, !dbg !42
  br i1 %cmp2, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !44
  %5 = load i32, i32* %i, align 4, !dbg !46
  %idxprom = sext i32 %5 to i64, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %6, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !54
  %cmp3 = icmp sge i32 %7, 0, !dbg !56
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !57

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !58
  %9 = load i32, i32* %data, align 4, !dbg !60
  %idxprom5 = sext i32 %9 to i64, !dbg !58
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !58
  store i32 1, i32* %arrayidx6, align 4, !dbg !61
  store i32 0, i32* %i, align 4, !dbg !62
  br label %for.cond7, !dbg !64

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !65
  %cmp8 = icmp slt i32 %10, 10, !dbg !67
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !68

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !69
  %12 = load i32, i32* %i, align 4, !dbg !71
  %idxprom10 = sext i32 %12 to i64, !dbg !69
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !69
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !69
  call void @printIntLine(i32 %13), !dbg !72
  br label %for.inc12, !dbg !73

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !74
  %inc13 = add nsw i32 %14, 1, !dbg !74
  store i32 %inc13, i32* %i, align 4, !dbg !74
  br label %for.cond7, !dbg !75, !llvm.loop !76

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !78

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !79
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !81
  %16 = bitcast i32* %15 to i8*, !dbg !81
  call void @free(i8* %16) #7, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !84 {
entry:
  %data.addr = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !89, metadata !DIExpression()), !dbg !95
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !96
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !98
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !99
  %cmp = icmp ne i8* %call, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !102
  %call2 = call i32 @atoi(i8* %arraydecay1) #9, !dbg !104
  store i32 %call2, i32* %data.addr, align 4, !dbg !105
  br label %if.end, !dbg !106

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0)), !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data.addr, align 4, !dbg !109
  ret i32 %2, !dbg !110
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42_good() #0 !dbg !111 {
entry:
  call void @goodB2G(), !dbg !112
  call void @goodG2B(), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !120, metadata !DIExpression()), !dbg !121
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !122, metadata !DIExpression()), !dbg !123
  %call = call i64 @time(i64* null) #7, !dbg !124
  %conv = trunc i64 %call to i32, !dbg !125
  call void @srand(i32 %conv) #7, !dbg !126
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !127
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42_good(), !dbg !128
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !129
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !130
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42_bad(), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !132
  ret i32 0, !dbg !133
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !134 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 -1, i32* %data, align 4, !dbg !137
  %0 = load i32, i32* %data, align 4, !dbg !138
  %call = call i32 @goodB2GSource(i32 %0), !dbg !139
  store i32 %call, i32* %data, align 4, !dbg !140
  call void @llvm.dbg.declare(metadata i32* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !144, metadata !DIExpression()), !dbg !145
  %call1 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !146
  %1 = bitcast i8* %call1 to i32*, !dbg !147
  store i32* %1, i32** %buffer, align 8, !dbg !145
  %2 = load i32*, i32** %buffer, align 8, !dbg !148
  %cmp = icmp eq i32* %2, null, !dbg !150
  br i1 %cmp, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !152
  unreachable, !dbg !152

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !157
  %cmp2 = icmp slt i32 %3, 10, !dbg !159
  br i1 %cmp2, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !161
  %5 = load i32, i32* %i, align 4, !dbg !163
  %idxprom = sext i32 %5 to i64, !dbg !161
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !161
  store i32 0, i32* %arrayidx, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !166
  %inc = add nsw i32 %6, 1, !dbg !166
  store i32 %inc, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !170
  %cmp3 = icmp sge i32 %7, 0, !dbg !172
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !173

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !174
  %cmp4 = icmp slt i32 %8, 10, !dbg !175
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !176

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !177
  %10 = load i32, i32* %data, align 4, !dbg !179
  %idxprom6 = sext i32 %10 to i64, !dbg !177
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !177
  store i32 1, i32* %arrayidx7, align 4, !dbg !180
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond8, !dbg !183

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !184
  %cmp9 = icmp slt i32 %11, 10, !dbg !186
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !187

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !188
  %13 = load i32, i32* %i, align 4, !dbg !190
  %idxprom11 = sext i32 %13 to i64, !dbg !188
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !188
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !188
  call void @printIntLine(i32 %14), !dbg !191
  br label %for.inc13, !dbg !192

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !193
  %inc14 = add nsw i32 %15, 1, !dbg !193
  store i32 %inc14, i32* %i, align 4, !dbg !193
  br label %for.cond8, !dbg !194, !llvm.loop !195

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !197

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !198
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !200
  %17 = bitcast i32* %16 to i8*, !dbg !200
  call void @free(i8* %17) #7, !dbg !201
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !203 {
entry:
  %data.addr = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !204, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !206, metadata !DIExpression()), !dbg !208
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !208
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !208
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !209
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !211
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !212
  %cmp = icmp ne i8* %call, null, !dbg !213
  br i1 %cmp, label %if.then, label %if.else, !dbg !214

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !215
  %call2 = call i32 @atoi(i8* %arraydecay1) #9, !dbg !217
  store i32 %call2, i32* %data.addr, align 4, !dbg !218
  br label %if.end, !dbg !219

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0)), !dbg !220
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data.addr, align 4, !dbg !222
  ret i32 %2, !dbg !223
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !224 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !225, metadata !DIExpression()), !dbg !226
  store i32 -1, i32* %data, align 4, !dbg !227
  %0 = load i32, i32* %data, align 4, !dbg !228
  %call = call i32 @goodG2BSource(i32 %0), !dbg !229
  store i32 %call, i32* %data, align 4, !dbg !230
  call void @llvm.dbg.declare(metadata i32* %i, metadata !231, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !234, metadata !DIExpression()), !dbg !235
  %call1 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !236
  %1 = bitcast i8* %call1 to i32*, !dbg !237
  store i32* %1, i32** %buffer, align 8, !dbg !235
  %2 = load i32*, i32** %buffer, align 8, !dbg !238
  %cmp = icmp eq i32* %2, null, !dbg !240
  br i1 %cmp, label %if.then, label %if.end, !dbg !241

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !242
  unreachable, !dbg !242

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !246

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !247
  %cmp2 = icmp slt i32 %3, 10, !dbg !249
  br i1 %cmp2, label %for.body, label %for.end, !dbg !250

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !251
  %5 = load i32, i32* %i, align 4, !dbg !253
  %idxprom = sext i32 %5 to i64, !dbg !251
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !251
  store i32 0, i32* %arrayidx, align 4, !dbg !254
  br label %for.inc, !dbg !255

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !256
  %inc = add nsw i32 %6, 1, !dbg !256
  store i32 %inc, i32* %i, align 4, !dbg !256
  br label %for.cond, !dbg !257, !llvm.loop !258

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !260
  %cmp3 = icmp sge i32 %7, 0, !dbg !262
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !263

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !264
  %9 = load i32, i32* %data, align 4, !dbg !266
  %idxprom5 = sext i32 %9 to i64, !dbg !264
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !264
  store i32 1, i32* %arrayidx6, align 4, !dbg !267
  store i32 0, i32* %i, align 4, !dbg !268
  br label %for.cond7, !dbg !270

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !271
  %cmp8 = icmp slt i32 %10, 10, !dbg !273
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !274

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !275
  %12 = load i32, i32* %i, align 4, !dbg !277
  %idxprom10 = sext i32 %12 to i64, !dbg !275
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !275
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !275
  call void @printIntLine(i32 %13), !dbg !278
  br label %for.inc12, !dbg !279

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !280
  %inc13 = add nsw i32 %14, 1, !dbg !280
  store i32 %inc13, i32* %i, align 4, !dbg !280
  br label %for.cond7, !dbg !281, !llvm.loop !282

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !284

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !285
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !287
  %16 = bitcast i32* %15 to i8*, !dbg !287
  call void @free(i8* %16) #7, !dbg !288
  ret void, !dbg !289
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !290 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !291, metadata !DIExpression()), !dbg !292
  store i32 7, i32* %data.addr, align 4, !dbg !293
  %0 = load i32, i32* %data.addr, align 4, !dbg !294
  ret i32 %0, !dbg !295
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42_bad", scope: !15, file: !15, line: 42, type: !16, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 44, type: !5)
!19 = !DILocation(line: 44, column: 9, scope: !14)
!20 = !DILocation(line: 46, column: 10, scope: !14)
!21 = !DILocation(line: 47, column: 22, scope: !14)
!22 = !DILocation(line: 47, column: 12, scope: !14)
!23 = !DILocation(line: 47, column: 10, scope: !14)
!24 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 49, type: !5)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!26 = !DILocation(line: 49, column: 13, scope: !25)
!27 = !DILocalVariable(name: "buffer", scope: !25, file: !15, line: 50, type: !4)
!28 = !DILocation(line: 50, column: 15, scope: !25)
!29 = !DILocation(line: 50, column: 31, scope: !25)
!30 = !DILocation(line: 50, column: 24, scope: !25)
!31 = !DILocation(line: 51, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !15, line: 51, column: 13)
!33 = !DILocation(line: 51, column: 20, scope: !32)
!34 = !DILocation(line: 51, column: 13, scope: !25)
!35 = !DILocation(line: 51, column: 30, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 51, column: 29)
!37 = !DILocation(line: 53, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !25, file: !15, line: 53, column: 9)
!39 = !DILocation(line: 53, column: 14, scope: !38)
!40 = !DILocation(line: 53, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !15, line: 53, column: 9)
!42 = !DILocation(line: 53, column: 23, scope: !41)
!43 = !DILocation(line: 53, column: 9, scope: !38)
!44 = !DILocation(line: 55, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 54, column: 9)
!46 = !DILocation(line: 55, column: 20, scope: !45)
!47 = !DILocation(line: 55, column: 23, scope: !45)
!48 = !DILocation(line: 56, column: 9, scope: !45)
!49 = !DILocation(line: 53, column: 30, scope: !41)
!50 = !DILocation(line: 53, column: 9, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 56, column: 9, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 59, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !25, file: !15, line: 59, column: 13)
!56 = !DILocation(line: 59, column: 18, scope: !55)
!57 = !DILocation(line: 59, column: 13, scope: !25)
!58 = !DILocation(line: 61, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !15, line: 60, column: 9)
!60 = !DILocation(line: 61, column: 20, scope: !59)
!61 = !DILocation(line: 61, column: 26, scope: !59)
!62 = !DILocation(line: 63, column: 19, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !15, line: 63, column: 13)
!64 = !DILocation(line: 63, column: 17, scope: !63)
!65 = !DILocation(line: 63, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 63, column: 13)
!67 = !DILocation(line: 63, column: 26, scope: !66)
!68 = !DILocation(line: 63, column: 13, scope: !63)
!69 = !DILocation(line: 65, column: 30, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 64, column: 13)
!71 = !DILocation(line: 65, column: 37, scope: !70)
!72 = !DILocation(line: 65, column: 17, scope: !70)
!73 = !DILocation(line: 66, column: 13, scope: !70)
!74 = !DILocation(line: 63, column: 33, scope: !66)
!75 = !DILocation(line: 63, column: 13, scope: !66)
!76 = distinct !{!76, !68, !77, !53}
!77 = !DILocation(line: 66, column: 13, scope: !63)
!78 = !DILocation(line: 67, column: 9, scope: !59)
!79 = !DILocation(line: 70, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !55, file: !15, line: 69, column: 9)
!81 = !DILocation(line: 72, column: 14, scope: !25)
!82 = !DILocation(line: 72, column: 9, scope: !25)
!83 = !DILocation(line: 74, column: 1, scope: !14)
!84 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 24, type: !85, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!5, !5}
!87 = !DILocalVariable(name: "data", arg: 1, scope: !84, file: !15, line: 24, type: !5)
!88 = !DILocation(line: 24, column: 26, scope: !84)
!89 = !DILocalVariable(name: "inputBuffer", scope: !90, file: !15, line: 27, type: !91)
!90 = distinct !DILexicalBlock(scope: !84, file: !15, line: 26, column: 5)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !92, size: 112, elements: !93)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !{!94}
!94 = !DISubrange(count: 14)
!95 = !DILocation(line: 27, column: 14, scope: !90)
!96 = !DILocation(line: 29, column: 19, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !15, line: 29, column: 13)
!98 = !DILocation(line: 29, column: 49, scope: !97)
!99 = !DILocation(line: 29, column: 13, scope: !97)
!100 = !DILocation(line: 29, column: 56, scope: !97)
!101 = !DILocation(line: 29, column: 13, scope: !90)
!102 = !DILocation(line: 32, column: 25, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !15, line: 30, column: 9)
!104 = !DILocation(line: 32, column: 20, scope: !103)
!105 = !DILocation(line: 32, column: 18, scope: !103)
!106 = !DILocation(line: 33, column: 9, scope: !103)
!107 = !DILocation(line: 36, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !97, file: !15, line: 35, column: 9)
!109 = !DILocation(line: 39, column: 12, scope: !84)
!110 = !DILocation(line: 39, column: 5, scope: !84)
!111 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_42_good", scope: !15, file: !15, line: 175, type: !16, scopeLine: 176, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocation(line: 177, column: 5, scope: !111)
!113 = !DILocation(line: 178, column: 5, scope: !111)
!114 = !DILocation(line: 179, column: 1, scope: !111)
!115 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 190, type: !116, scopeLine: 191, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DISubroutineType(types: !117)
!117 = !{!5, !5, !118}
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!120 = !DILocalVariable(name: "argc", arg: 1, scope: !115, file: !15, line: 190, type: !5)
!121 = !DILocation(line: 190, column: 14, scope: !115)
!122 = !DILocalVariable(name: "argv", arg: 2, scope: !115, file: !15, line: 190, type: !118)
!123 = !DILocation(line: 190, column: 27, scope: !115)
!124 = !DILocation(line: 193, column: 22, scope: !115)
!125 = !DILocation(line: 193, column: 12, scope: !115)
!126 = !DILocation(line: 193, column: 5, scope: !115)
!127 = !DILocation(line: 195, column: 5, scope: !115)
!128 = !DILocation(line: 196, column: 5, scope: !115)
!129 = !DILocation(line: 197, column: 5, scope: !115)
!130 = !DILocation(line: 200, column: 5, scope: !115)
!131 = !DILocation(line: 201, column: 5, scope: !115)
!132 = !DILocation(line: 202, column: 5, scope: !115)
!133 = !DILocation(line: 204, column: 5, scope: !115)
!134 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 142, type: !16, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !15, line: 144, type: !5)
!136 = !DILocation(line: 144, column: 9, scope: !134)
!137 = !DILocation(line: 146, column: 10, scope: !134)
!138 = !DILocation(line: 147, column: 26, scope: !134)
!139 = !DILocation(line: 147, column: 12, scope: !134)
!140 = !DILocation(line: 147, column: 10, scope: !134)
!141 = !DILocalVariable(name: "i", scope: !142, file: !15, line: 149, type: !5)
!142 = distinct !DILexicalBlock(scope: !134, file: !15, line: 148, column: 5)
!143 = !DILocation(line: 149, column: 13, scope: !142)
!144 = !DILocalVariable(name: "buffer", scope: !142, file: !15, line: 150, type: !4)
!145 = !DILocation(line: 150, column: 15, scope: !142)
!146 = !DILocation(line: 150, column: 31, scope: !142)
!147 = !DILocation(line: 150, column: 24, scope: !142)
!148 = !DILocation(line: 151, column: 13, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !15, line: 151, column: 13)
!150 = !DILocation(line: 151, column: 20, scope: !149)
!151 = !DILocation(line: 151, column: 13, scope: !142)
!152 = !DILocation(line: 151, column: 30, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 151, column: 29)
!154 = !DILocation(line: 153, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !142, file: !15, line: 153, column: 9)
!156 = !DILocation(line: 153, column: 14, scope: !155)
!157 = !DILocation(line: 153, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !15, line: 153, column: 9)
!159 = !DILocation(line: 153, column: 23, scope: !158)
!160 = !DILocation(line: 153, column: 9, scope: !155)
!161 = !DILocation(line: 155, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !15, line: 154, column: 9)
!163 = !DILocation(line: 155, column: 20, scope: !162)
!164 = !DILocation(line: 155, column: 23, scope: !162)
!165 = !DILocation(line: 156, column: 9, scope: !162)
!166 = !DILocation(line: 153, column: 30, scope: !158)
!167 = !DILocation(line: 153, column: 9, scope: !158)
!168 = distinct !{!168, !160, !169, !53}
!169 = !DILocation(line: 156, column: 9, scope: !155)
!170 = !DILocation(line: 158, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !142, file: !15, line: 158, column: 13)
!172 = !DILocation(line: 158, column: 18, scope: !171)
!173 = !DILocation(line: 158, column: 23, scope: !171)
!174 = !DILocation(line: 158, column: 26, scope: !171)
!175 = !DILocation(line: 158, column: 31, scope: !171)
!176 = !DILocation(line: 158, column: 13, scope: !142)
!177 = !DILocation(line: 160, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !15, line: 159, column: 9)
!179 = !DILocation(line: 160, column: 20, scope: !178)
!180 = !DILocation(line: 160, column: 26, scope: !178)
!181 = !DILocation(line: 162, column: 19, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 162, column: 13)
!183 = !DILocation(line: 162, column: 17, scope: !182)
!184 = !DILocation(line: 162, column: 24, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !15, line: 162, column: 13)
!186 = !DILocation(line: 162, column: 26, scope: !185)
!187 = !DILocation(line: 162, column: 13, scope: !182)
!188 = !DILocation(line: 164, column: 30, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 163, column: 13)
!190 = !DILocation(line: 164, column: 37, scope: !189)
!191 = !DILocation(line: 164, column: 17, scope: !189)
!192 = !DILocation(line: 165, column: 13, scope: !189)
!193 = !DILocation(line: 162, column: 33, scope: !185)
!194 = !DILocation(line: 162, column: 13, scope: !185)
!195 = distinct !{!195, !187, !196, !53}
!196 = !DILocation(line: 165, column: 13, scope: !182)
!197 = !DILocation(line: 166, column: 9, scope: !178)
!198 = !DILocation(line: 169, column: 13, scope: !199)
!199 = distinct !DILexicalBlock(scope: !171, file: !15, line: 168, column: 9)
!200 = !DILocation(line: 171, column: 14, scope: !142)
!201 = !DILocation(line: 171, column: 9, scope: !142)
!202 = !DILocation(line: 173, column: 1, scope: !134)
!203 = distinct !DISubprogram(name: "goodB2GSource", scope: !15, file: !15, line: 124, type: !85, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!204 = !DILocalVariable(name: "data", arg: 1, scope: !203, file: !15, line: 124, type: !5)
!205 = !DILocation(line: 124, column: 30, scope: !203)
!206 = !DILocalVariable(name: "inputBuffer", scope: !207, file: !15, line: 127, type: !91)
!207 = distinct !DILexicalBlock(scope: !203, file: !15, line: 126, column: 5)
!208 = !DILocation(line: 127, column: 14, scope: !207)
!209 = !DILocation(line: 129, column: 19, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !15, line: 129, column: 13)
!211 = !DILocation(line: 129, column: 49, scope: !210)
!212 = !DILocation(line: 129, column: 13, scope: !210)
!213 = !DILocation(line: 129, column: 56, scope: !210)
!214 = !DILocation(line: 129, column: 13, scope: !207)
!215 = !DILocation(line: 132, column: 25, scope: !216)
!216 = distinct !DILexicalBlock(scope: !210, file: !15, line: 130, column: 9)
!217 = !DILocation(line: 132, column: 20, scope: !216)
!218 = !DILocation(line: 132, column: 18, scope: !216)
!219 = !DILocation(line: 133, column: 9, scope: !216)
!220 = !DILocation(line: 136, column: 13, scope: !221)
!221 = distinct !DILexicalBlock(scope: !210, file: !15, line: 135, column: 9)
!222 = !DILocation(line: 139, column: 12, scope: !203)
!223 = !DILocation(line: 139, column: 5, scope: !203)
!224 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!225 = !DILocalVariable(name: "data", scope: !224, file: !15, line: 91, type: !5)
!226 = !DILocation(line: 91, column: 9, scope: !224)
!227 = !DILocation(line: 93, column: 10, scope: !224)
!228 = !DILocation(line: 94, column: 26, scope: !224)
!229 = !DILocation(line: 94, column: 12, scope: !224)
!230 = !DILocation(line: 94, column: 10, scope: !224)
!231 = !DILocalVariable(name: "i", scope: !232, file: !15, line: 96, type: !5)
!232 = distinct !DILexicalBlock(scope: !224, file: !15, line: 95, column: 5)
!233 = !DILocation(line: 96, column: 13, scope: !232)
!234 = !DILocalVariable(name: "buffer", scope: !232, file: !15, line: 97, type: !4)
!235 = !DILocation(line: 97, column: 15, scope: !232)
!236 = !DILocation(line: 97, column: 31, scope: !232)
!237 = !DILocation(line: 97, column: 24, scope: !232)
!238 = !DILocation(line: 98, column: 13, scope: !239)
!239 = distinct !DILexicalBlock(scope: !232, file: !15, line: 98, column: 13)
!240 = !DILocation(line: 98, column: 20, scope: !239)
!241 = !DILocation(line: 98, column: 13, scope: !232)
!242 = !DILocation(line: 98, column: 30, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 98, column: 29)
!244 = !DILocation(line: 100, column: 16, scope: !245)
!245 = distinct !DILexicalBlock(scope: !232, file: !15, line: 100, column: 9)
!246 = !DILocation(line: 100, column: 14, scope: !245)
!247 = !DILocation(line: 100, column: 21, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !15, line: 100, column: 9)
!249 = !DILocation(line: 100, column: 23, scope: !248)
!250 = !DILocation(line: 100, column: 9, scope: !245)
!251 = !DILocation(line: 102, column: 13, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !15, line: 101, column: 9)
!253 = !DILocation(line: 102, column: 20, scope: !252)
!254 = !DILocation(line: 102, column: 23, scope: !252)
!255 = !DILocation(line: 103, column: 9, scope: !252)
!256 = !DILocation(line: 100, column: 30, scope: !248)
!257 = !DILocation(line: 100, column: 9, scope: !248)
!258 = distinct !{!258, !250, !259, !53}
!259 = !DILocation(line: 103, column: 9, scope: !245)
!260 = !DILocation(line: 106, column: 13, scope: !261)
!261 = distinct !DILexicalBlock(scope: !232, file: !15, line: 106, column: 13)
!262 = !DILocation(line: 106, column: 18, scope: !261)
!263 = !DILocation(line: 106, column: 13, scope: !232)
!264 = !DILocation(line: 108, column: 13, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !15, line: 107, column: 9)
!266 = !DILocation(line: 108, column: 20, scope: !265)
!267 = !DILocation(line: 108, column: 26, scope: !265)
!268 = !DILocation(line: 110, column: 19, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !15, line: 110, column: 13)
!270 = !DILocation(line: 110, column: 17, scope: !269)
!271 = !DILocation(line: 110, column: 24, scope: !272)
!272 = distinct !DILexicalBlock(scope: !269, file: !15, line: 110, column: 13)
!273 = !DILocation(line: 110, column: 26, scope: !272)
!274 = !DILocation(line: 110, column: 13, scope: !269)
!275 = !DILocation(line: 112, column: 30, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !15, line: 111, column: 13)
!277 = !DILocation(line: 112, column: 37, scope: !276)
!278 = !DILocation(line: 112, column: 17, scope: !276)
!279 = !DILocation(line: 113, column: 13, scope: !276)
!280 = !DILocation(line: 110, column: 33, scope: !272)
!281 = !DILocation(line: 110, column: 13, scope: !272)
!282 = distinct !{!282, !274, !283, !53}
!283 = !DILocation(line: 113, column: 13, scope: !269)
!284 = !DILocation(line: 114, column: 9, scope: !265)
!285 = !DILocation(line: 117, column: 13, scope: !286)
!286 = distinct !DILexicalBlock(scope: !261, file: !15, line: 116, column: 9)
!287 = !DILocation(line: 119, column: 14, scope: !232)
!288 = !DILocation(line: 119, column: 9, scope: !232)
!289 = !DILocation(line: 121, column: 1, scope: !224)
!290 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 81, type: !85, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!291 = !DILocalVariable(name: "data", arg: 1, scope: !290, file: !15, line: 81, type: !5)
!292 = !DILocation(line: 81, column: 30, scope: !290)
!293 = !DILocation(line: 85, column: 10, scope: !290)
!294 = !DILocation(line: 86, column: 12, scope: !290)
!295 = !DILocation(line: 86, column: 5, scope: !290)
