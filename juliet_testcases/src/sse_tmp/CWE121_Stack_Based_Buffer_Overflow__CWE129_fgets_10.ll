; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@globalTrue = external dso_local global i32, align 4
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* @globalTrue, align 4, !dbg !20
  %tobool = icmp ne i32 %0, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end4, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !23, metadata !DIExpression()), !dbg !30
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !30
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !31
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !33
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !34
  %cmp = icmp ne i8* %call, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.else, !dbg !36

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !39
  store i32 %call3, i32* %data, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !44

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalTrue, align 4, !dbg !45
  %tobool5 = icmp ne i32 %3, 0, !dbg !45
  br i1 %tobool5, label %if.then6, label %if.end14, !dbg !47

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !52, metadata !DIExpression()), !dbg !56
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !56
  %5 = load i32, i32* %data, align 4, !dbg !57
  %cmp7 = icmp sge i32 %5, 0, !dbg !59
  br i1 %cmp7, label %if.then8, label %if.else12, !dbg !60

if.then8:                                         ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !61
  %idxprom = sext i32 %6 to i64, !dbg !63
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !63
  store i32 1, i32* %arrayidx, align 4, !dbg !64
  store i32 0, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.then8
  %7 = load i32, i32* %i, align 4, !dbg !68
  %cmp9 = icmp slt i32 %7, 10, !dbg !70
  br i1 %cmp9, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !72
  %idxprom10 = sext i32 %8 to i64, !dbg !74
  %arrayidx11 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom10, !dbg !74
  %9 = load i32, i32* %arrayidx11, align 4, !dbg !74
  call void @printIntLine(i32 %9), !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !77
  %inc = add nsw i32 %10, 1, !dbg !77
  store i32 %inc, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  br label %if.end13, !dbg !82

if.else12:                                        ; preds = %if.then6
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %for.end
  br label %if.end14, !dbg !85

if.end14:                                         ; preds = %if.end13, %if.end4
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10_good() #0 !dbg !87 {
entry:
  call void @goodB2G1(), !dbg !88
  call void @goodB2G2(), !dbg !89
  call void @goodG2B1(), !dbg !90
  call void @goodG2B2(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #7, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #7, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !112 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 -1, i32* %data, align 4, !dbg !115
  %0 = load i32, i32* @globalTrue, align 4, !dbg !116
  %tobool = icmp ne i32 %0, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end4, !dbg !118

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !119, metadata !DIExpression()), !dbg !122
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !122
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !123
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !125
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !126
  %cmp = icmp ne i8* %call, null, !dbg !127
  br i1 %cmp, label %if.then1, label %if.else, !dbg !128

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !129
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !131
  store i32 %call3, i32* %data, align 4, !dbg !132
  br label %if.end, !dbg !133

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !134
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !136

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFalse, align 4, !dbg !137
  %tobool5 = icmp ne i32 %3, 0, !dbg !137
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !139

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !140
  br label %if.end16, !dbg !142

if.else7:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !143, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !147, metadata !DIExpression()), !dbg !148
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !148
  %5 = load i32, i32* %data, align 4, !dbg !149
  %cmp8 = icmp sge i32 %5, 0, !dbg !151
  br i1 %cmp8, label %land.lhs.true, label %if.else14, !dbg !152

land.lhs.true:                                    ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !153
  %cmp9 = icmp slt i32 %6, 10, !dbg !154
  br i1 %cmp9, label %if.then10, label %if.else14, !dbg !155

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !156
  %idxprom = sext i32 %7 to i64, !dbg !158
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !158
  store i32 1, i32* %arrayidx, align 4, !dbg !159
  store i32 0, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.then10
  %8 = load i32, i32* %i, align 4, !dbg !163
  %cmp11 = icmp slt i32 %8, 10, !dbg !165
  br i1 %cmp11, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !167
  %idxprom12 = sext i32 %9 to i64, !dbg !169
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !169
  %10 = load i32, i32* %arrayidx13, align 4, !dbg !169
  call void @printIntLine(i32 %10), !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !172
  %inc = add nsw i32 %11, 1, !dbg !172
  store i32 %inc, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  br label %if.end15, !dbg !176

if.else14:                                        ; preds = %land.lhs.true, %if.else7
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !177
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %for.end
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then6
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !180 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !181, metadata !DIExpression()), !dbg !182
  store i32 -1, i32* %data, align 4, !dbg !183
  %0 = load i32, i32* @globalTrue, align 4, !dbg !184
  %tobool = icmp ne i32 %0, 0, !dbg !184
  br i1 %tobool, label %if.then, label %if.end4, !dbg !186

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !187, metadata !DIExpression()), !dbg !190
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !190
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !191
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !193
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %2), !dbg !194
  %cmp = icmp ne i8* %call, null, !dbg !195
  br i1 %cmp, label %if.then1, label %if.else, !dbg !196

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !197
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !199
  store i32 %call3, i32* %data, align 4, !dbg !200
  br label %if.end, !dbg !201

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !202
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !204

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalTrue, align 4, !dbg !205
  %tobool5 = icmp ne i32 %3, 0, !dbg !205
  br i1 %tobool5, label %if.then6, label %if.end15, !dbg !207

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !208, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !212, metadata !DIExpression()), !dbg !213
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !213
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !213
  %5 = load i32, i32* %data, align 4, !dbg !214
  %cmp7 = icmp sge i32 %5, 0, !dbg !216
  br i1 %cmp7, label %land.lhs.true, label %if.else13, !dbg !217

land.lhs.true:                                    ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !218
  %cmp8 = icmp slt i32 %6, 10, !dbg !219
  br i1 %cmp8, label %if.then9, label %if.else13, !dbg !220

if.then9:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !221
  %idxprom = sext i32 %7 to i64, !dbg !223
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !223
  store i32 1, i32* %arrayidx, align 4, !dbg !224
  store i32 0, i32* %i, align 4, !dbg !225
  br label %for.cond, !dbg !227

for.cond:                                         ; preds = %for.inc, %if.then9
  %8 = load i32, i32* %i, align 4, !dbg !228
  %cmp10 = icmp slt i32 %8, 10, !dbg !230
  br i1 %cmp10, label %for.body, label %for.end, !dbg !231

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !232
  %idxprom11 = sext i32 %9 to i64, !dbg !234
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom11, !dbg !234
  %10 = load i32, i32* %arrayidx12, align 4, !dbg !234
  call void @printIntLine(i32 %10), !dbg !235
  br label %for.inc, !dbg !236

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !237
  %inc = add nsw i32 %11, 1, !dbg !237
  store i32 %inc, i32* %i, align 4, !dbg !237
  br label %for.cond, !dbg !238, !llvm.loop !239

for.end:                                          ; preds = %for.cond
  br label %if.end14, !dbg !241

if.else13:                                        ; preds = %land.lhs.true, %if.then6
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !242
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %for.end
  br label %if.end15, !dbg !244

if.end15:                                         ; preds = %if.end14, %if.end4
  ret void, !dbg !245
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !246 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !247, metadata !DIExpression()), !dbg !248
  store i32 -1, i32* %data, align 4, !dbg !249
  %0 = load i32, i32* @globalFalse, align 4, !dbg !250
  %tobool = icmp ne i32 %0, 0, !dbg !250
  br i1 %tobool, label %if.then, label %if.else, !dbg !252

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !253
  br label %if.end, !dbg !255

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !256
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalTrue, align 4, !dbg !258
  %tobool1 = icmp ne i32 %1, 0, !dbg !258
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !260

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !261, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !265, metadata !DIExpression()), !dbg !266
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !266
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !266
  %3 = load i32, i32* %data, align 4, !dbg !267
  %cmp = icmp sge i32 %3, 0, !dbg !269
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !270

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !271
  %idxprom = sext i32 %4 to i64, !dbg !273
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !273
  store i32 1, i32* %arrayidx, align 4, !dbg !274
  store i32 0, i32* %i, align 4, !dbg !275
  br label %for.cond, !dbg !277

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !278
  %cmp4 = icmp slt i32 %5, 10, !dbg !280
  br i1 %cmp4, label %for.body, label %for.end, !dbg !281

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !282
  %idxprom5 = sext i32 %6 to i64, !dbg !284
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !284
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !284
  call void @printIntLine(i32 %7), !dbg !285
  br label %for.inc, !dbg !286

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !287
  %inc = add nsw i32 %8, 1, !dbg !287
  store i32 %inc, i32* %i, align 4, !dbg !287
  br label %for.cond, !dbg !288, !llvm.loop !289

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !291

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !292
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !294

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !295
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !296 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !297, metadata !DIExpression()), !dbg !298
  store i32 -1, i32* %data, align 4, !dbg !299
  %0 = load i32, i32* @globalTrue, align 4, !dbg !300
  %tobool = icmp ne i32 %0, 0, !dbg !300
  br i1 %tobool, label %if.then, label %if.end, !dbg !302

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !303
  br label %if.end, !dbg !305

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !306
  %tobool1 = icmp ne i32 %1, 0, !dbg !306
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !308

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !309, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !313, metadata !DIExpression()), !dbg !314
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !314
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !314
  %3 = load i32, i32* %data, align 4, !dbg !315
  %cmp = icmp sge i32 %3, 0, !dbg !317
  br i1 %cmp, label %if.then3, label %if.else, !dbg !318

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !319
  %idxprom = sext i32 %4 to i64, !dbg !321
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !321
  store i32 1, i32* %arrayidx, align 4, !dbg !322
  store i32 0, i32* %i, align 4, !dbg !323
  br label %for.cond, !dbg !325

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !326
  %cmp4 = icmp slt i32 %5, 10, !dbg !328
  br i1 %cmp4, label %for.body, label %for.end, !dbg !329

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !330
  %idxprom5 = sext i32 %6 to i64, !dbg !332
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !332
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !332
  call void @printIntLine(i32 %7), !dbg !333
  br label %for.inc, !dbg !334

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !335
  %inc = add nsw i32 %8, 1, !dbg !335
  store i32 %inc, i32* %i, align 4, !dbg !335
  br label %for.cond, !dbg !336, !llvm.loop !337

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !339

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !340
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !342

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !343
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocation(line: 29, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!22 = !DILocation(line: 29, column: 8, scope: !12)
!23 = !DILocalVariable(name: "inputBuffer", scope: !24, file: !13, line: 32, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !13, line: 31, column: 9)
!25 = distinct !DILexicalBlock(scope: !21, file: !13, line: 30, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 112, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 14)
!30 = !DILocation(line: 32, column: 18, scope: !24)
!31 = !DILocation(line: 34, column: 23, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !13, line: 34, column: 17)
!33 = !DILocation(line: 34, column: 53, scope: !32)
!34 = !DILocation(line: 34, column: 17, scope: !32)
!35 = !DILocation(line: 34, column: 60, scope: !32)
!36 = !DILocation(line: 34, column: 17, scope: !24)
!37 = !DILocation(line: 37, column: 29, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !13, line: 35, column: 13)
!39 = !DILocation(line: 37, column: 24, scope: !38)
!40 = !DILocation(line: 37, column: 22, scope: !38)
!41 = !DILocation(line: 38, column: 13, scope: !38)
!42 = !DILocation(line: 41, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !32, file: !13, line: 40, column: 13)
!44 = !DILocation(line: 44, column: 5, scope: !25)
!45 = !DILocation(line: 45, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!47 = !DILocation(line: 45, column: 8, scope: !12)
!48 = !DILocalVariable(name: "i", scope: !49, file: !13, line: 48, type: !17)
!49 = distinct !DILexicalBlock(scope: !50, file: !13, line: 47, column: 9)
!50 = distinct !DILexicalBlock(scope: !46, file: !13, line: 46, column: 5)
!51 = !DILocation(line: 48, column: 17, scope: !49)
!52 = !DILocalVariable(name: "buffer", scope: !49, file: !13, line: 49, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 10)
!56 = !DILocation(line: 49, column: 17, scope: !49)
!57 = !DILocation(line: 52, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !49, file: !13, line: 52, column: 17)
!59 = !DILocation(line: 52, column: 22, scope: !58)
!60 = !DILocation(line: 52, column: 17, scope: !49)
!61 = !DILocation(line: 54, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !13, line: 53, column: 13)
!63 = !DILocation(line: 54, column: 17, scope: !62)
!64 = !DILocation(line: 54, column: 30, scope: !62)
!65 = !DILocation(line: 56, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !13, line: 56, column: 17)
!67 = !DILocation(line: 56, column: 21, scope: !66)
!68 = !DILocation(line: 56, column: 28, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !13, line: 56, column: 17)
!70 = !DILocation(line: 56, column: 30, scope: !69)
!71 = !DILocation(line: 56, column: 17, scope: !66)
!72 = !DILocation(line: 58, column: 41, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !13, line: 57, column: 17)
!74 = !DILocation(line: 58, column: 34, scope: !73)
!75 = !DILocation(line: 58, column: 21, scope: !73)
!76 = !DILocation(line: 59, column: 17, scope: !73)
!77 = !DILocation(line: 56, column: 37, scope: !69)
!78 = !DILocation(line: 56, column: 17, scope: !69)
!79 = distinct !{!79, !71, !80, !81}
!80 = !DILocation(line: 59, column: 17, scope: !66)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 60, column: 13, scope: !62)
!83 = !DILocation(line: 63, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !58, file: !13, line: 62, column: 13)
!85 = !DILocation(line: 66, column: 5, scope: !50)
!86 = !DILocation(line: 67, column: 1, scope: !12)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_10_good", scope: !13, file: !13, line: 245, type: !14, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 247, column: 5, scope: !87)
!89 = !DILocation(line: 248, column: 5, scope: !87)
!90 = !DILocation(line: 249, column: 5, scope: !87)
!91 = !DILocation(line: 250, column: 5, scope: !87)
!92 = !DILocation(line: 251, column: 1, scope: !87)
!93 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 262, type: !94, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!17, !17, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !13, line: 262, type: !17)
!99 = !DILocation(line: 262, column: 14, scope: !93)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !13, line: 262, type: !96)
!101 = !DILocation(line: 262, column: 27, scope: !93)
!102 = !DILocation(line: 265, column: 22, scope: !93)
!103 = !DILocation(line: 265, column: 12, scope: !93)
!104 = !DILocation(line: 265, column: 5, scope: !93)
!105 = !DILocation(line: 267, column: 5, scope: !93)
!106 = !DILocation(line: 268, column: 5, scope: !93)
!107 = !DILocation(line: 269, column: 5, scope: !93)
!108 = !DILocation(line: 272, column: 5, scope: !93)
!109 = !DILocation(line: 273, column: 5, scope: !93)
!110 = !DILocation(line: 274, column: 5, scope: !93)
!111 = !DILocation(line: 276, column: 5, scope: !93)
!112 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 74, type: !14, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !13, line: 76, type: !17)
!114 = !DILocation(line: 76, column: 9, scope: !112)
!115 = !DILocation(line: 78, column: 10, scope: !112)
!116 = !DILocation(line: 79, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !13, line: 79, column: 8)
!118 = !DILocation(line: 79, column: 8, scope: !112)
!119 = !DILocalVariable(name: "inputBuffer", scope: !120, file: !13, line: 82, type: !26)
!120 = distinct !DILexicalBlock(scope: !121, file: !13, line: 81, column: 9)
!121 = distinct !DILexicalBlock(scope: !117, file: !13, line: 80, column: 5)
!122 = !DILocation(line: 82, column: 18, scope: !120)
!123 = !DILocation(line: 84, column: 23, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !13, line: 84, column: 17)
!125 = !DILocation(line: 84, column: 53, scope: !124)
!126 = !DILocation(line: 84, column: 17, scope: !124)
!127 = !DILocation(line: 84, column: 60, scope: !124)
!128 = !DILocation(line: 84, column: 17, scope: !120)
!129 = !DILocation(line: 87, column: 29, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !13, line: 85, column: 13)
!131 = !DILocation(line: 87, column: 24, scope: !130)
!132 = !DILocation(line: 87, column: 22, scope: !130)
!133 = !DILocation(line: 88, column: 13, scope: !130)
!134 = !DILocation(line: 91, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !124, file: !13, line: 90, column: 13)
!136 = !DILocation(line: 94, column: 5, scope: !121)
!137 = !DILocation(line: 95, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !112, file: !13, line: 95, column: 8)
!139 = !DILocation(line: 95, column: 8, scope: !112)
!140 = !DILocation(line: 98, column: 9, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !13, line: 96, column: 5)
!142 = !DILocation(line: 99, column: 5, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !144, file: !13, line: 103, type: !17)
!144 = distinct !DILexicalBlock(scope: !145, file: !13, line: 102, column: 9)
!145 = distinct !DILexicalBlock(scope: !138, file: !13, line: 101, column: 5)
!146 = !DILocation(line: 103, column: 17, scope: !144)
!147 = !DILocalVariable(name: "buffer", scope: !144, file: !13, line: 104, type: !53)
!148 = !DILocation(line: 104, column: 17, scope: !144)
!149 = !DILocation(line: 106, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !13, line: 106, column: 17)
!151 = !DILocation(line: 106, column: 22, scope: !150)
!152 = !DILocation(line: 106, column: 27, scope: !150)
!153 = !DILocation(line: 106, column: 30, scope: !150)
!154 = !DILocation(line: 106, column: 35, scope: !150)
!155 = !DILocation(line: 106, column: 17, scope: !144)
!156 = !DILocation(line: 108, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !150, file: !13, line: 107, column: 13)
!158 = !DILocation(line: 108, column: 17, scope: !157)
!159 = !DILocation(line: 108, column: 30, scope: !157)
!160 = !DILocation(line: 110, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 110, column: 17)
!162 = !DILocation(line: 110, column: 21, scope: !161)
!163 = !DILocation(line: 110, column: 28, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !13, line: 110, column: 17)
!165 = !DILocation(line: 110, column: 30, scope: !164)
!166 = !DILocation(line: 110, column: 17, scope: !161)
!167 = !DILocation(line: 112, column: 41, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !13, line: 111, column: 17)
!169 = !DILocation(line: 112, column: 34, scope: !168)
!170 = !DILocation(line: 112, column: 21, scope: !168)
!171 = !DILocation(line: 113, column: 17, scope: !168)
!172 = !DILocation(line: 110, column: 37, scope: !164)
!173 = !DILocation(line: 110, column: 17, scope: !164)
!174 = distinct !{!174, !166, !175, !81}
!175 = !DILocation(line: 113, column: 17, scope: !161)
!176 = !DILocation(line: 114, column: 13, scope: !157)
!177 = !DILocation(line: 117, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !150, file: !13, line: 116, column: 13)
!179 = !DILocation(line: 121, column: 1, scope: !112)
!180 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 124, type: !14, scopeLine: 125, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!181 = !DILocalVariable(name: "data", scope: !180, file: !13, line: 126, type: !17)
!182 = !DILocation(line: 126, column: 9, scope: !180)
!183 = !DILocation(line: 128, column: 10, scope: !180)
!184 = !DILocation(line: 129, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !13, line: 129, column: 8)
!186 = !DILocation(line: 129, column: 8, scope: !180)
!187 = !DILocalVariable(name: "inputBuffer", scope: !188, file: !13, line: 132, type: !26)
!188 = distinct !DILexicalBlock(scope: !189, file: !13, line: 131, column: 9)
!189 = distinct !DILexicalBlock(scope: !185, file: !13, line: 130, column: 5)
!190 = !DILocation(line: 132, column: 18, scope: !188)
!191 = !DILocation(line: 134, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !13, line: 134, column: 17)
!193 = !DILocation(line: 134, column: 53, scope: !192)
!194 = !DILocation(line: 134, column: 17, scope: !192)
!195 = !DILocation(line: 134, column: 60, scope: !192)
!196 = !DILocation(line: 134, column: 17, scope: !188)
!197 = !DILocation(line: 137, column: 29, scope: !198)
!198 = distinct !DILexicalBlock(scope: !192, file: !13, line: 135, column: 13)
!199 = !DILocation(line: 137, column: 24, scope: !198)
!200 = !DILocation(line: 137, column: 22, scope: !198)
!201 = !DILocation(line: 138, column: 13, scope: !198)
!202 = !DILocation(line: 141, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !192, file: !13, line: 140, column: 13)
!204 = !DILocation(line: 144, column: 5, scope: !189)
!205 = !DILocation(line: 145, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !180, file: !13, line: 145, column: 8)
!207 = !DILocation(line: 145, column: 8, scope: !180)
!208 = !DILocalVariable(name: "i", scope: !209, file: !13, line: 148, type: !17)
!209 = distinct !DILexicalBlock(scope: !210, file: !13, line: 147, column: 9)
!210 = distinct !DILexicalBlock(scope: !206, file: !13, line: 146, column: 5)
!211 = !DILocation(line: 148, column: 17, scope: !209)
!212 = !DILocalVariable(name: "buffer", scope: !209, file: !13, line: 149, type: !53)
!213 = !DILocation(line: 149, column: 17, scope: !209)
!214 = !DILocation(line: 151, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !209, file: !13, line: 151, column: 17)
!216 = !DILocation(line: 151, column: 22, scope: !215)
!217 = !DILocation(line: 151, column: 27, scope: !215)
!218 = !DILocation(line: 151, column: 30, scope: !215)
!219 = !DILocation(line: 151, column: 35, scope: !215)
!220 = !DILocation(line: 151, column: 17, scope: !209)
!221 = !DILocation(line: 153, column: 24, scope: !222)
!222 = distinct !DILexicalBlock(scope: !215, file: !13, line: 152, column: 13)
!223 = !DILocation(line: 153, column: 17, scope: !222)
!224 = !DILocation(line: 153, column: 30, scope: !222)
!225 = !DILocation(line: 155, column: 23, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !13, line: 155, column: 17)
!227 = !DILocation(line: 155, column: 21, scope: !226)
!228 = !DILocation(line: 155, column: 28, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !13, line: 155, column: 17)
!230 = !DILocation(line: 155, column: 30, scope: !229)
!231 = !DILocation(line: 155, column: 17, scope: !226)
!232 = !DILocation(line: 157, column: 41, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !13, line: 156, column: 17)
!234 = !DILocation(line: 157, column: 34, scope: !233)
!235 = !DILocation(line: 157, column: 21, scope: !233)
!236 = !DILocation(line: 158, column: 17, scope: !233)
!237 = !DILocation(line: 155, column: 37, scope: !229)
!238 = !DILocation(line: 155, column: 17, scope: !229)
!239 = distinct !{!239, !231, !240, !81}
!240 = !DILocation(line: 158, column: 17, scope: !226)
!241 = !DILocation(line: 159, column: 13, scope: !222)
!242 = !DILocation(line: 162, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !215, file: !13, line: 161, column: 13)
!244 = !DILocation(line: 165, column: 5, scope: !210)
!245 = !DILocation(line: 166, column: 1, scope: !180)
!246 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 169, type: !14, scopeLine: 170, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!247 = !DILocalVariable(name: "data", scope: !246, file: !13, line: 171, type: !17)
!248 = !DILocation(line: 171, column: 9, scope: !246)
!249 = !DILocation(line: 173, column: 10, scope: !246)
!250 = !DILocation(line: 174, column: 8, scope: !251)
!251 = distinct !DILexicalBlock(scope: !246, file: !13, line: 174, column: 8)
!252 = !DILocation(line: 174, column: 8, scope: !246)
!253 = !DILocation(line: 177, column: 9, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !13, line: 175, column: 5)
!255 = !DILocation(line: 178, column: 5, scope: !254)
!256 = !DILocation(line: 183, column: 14, scope: !257)
!257 = distinct !DILexicalBlock(scope: !251, file: !13, line: 180, column: 5)
!258 = !DILocation(line: 185, column: 8, scope: !259)
!259 = distinct !DILexicalBlock(scope: !246, file: !13, line: 185, column: 8)
!260 = !DILocation(line: 185, column: 8, scope: !246)
!261 = !DILocalVariable(name: "i", scope: !262, file: !13, line: 188, type: !17)
!262 = distinct !DILexicalBlock(scope: !263, file: !13, line: 187, column: 9)
!263 = distinct !DILexicalBlock(scope: !259, file: !13, line: 186, column: 5)
!264 = !DILocation(line: 188, column: 17, scope: !262)
!265 = !DILocalVariable(name: "buffer", scope: !262, file: !13, line: 189, type: !53)
!266 = !DILocation(line: 189, column: 17, scope: !262)
!267 = !DILocation(line: 192, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !262, file: !13, line: 192, column: 17)
!269 = !DILocation(line: 192, column: 22, scope: !268)
!270 = !DILocation(line: 192, column: 17, scope: !262)
!271 = !DILocation(line: 194, column: 24, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !13, line: 193, column: 13)
!273 = !DILocation(line: 194, column: 17, scope: !272)
!274 = !DILocation(line: 194, column: 30, scope: !272)
!275 = !DILocation(line: 196, column: 23, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !13, line: 196, column: 17)
!277 = !DILocation(line: 196, column: 21, scope: !276)
!278 = !DILocation(line: 196, column: 28, scope: !279)
!279 = distinct !DILexicalBlock(scope: !276, file: !13, line: 196, column: 17)
!280 = !DILocation(line: 196, column: 30, scope: !279)
!281 = !DILocation(line: 196, column: 17, scope: !276)
!282 = !DILocation(line: 198, column: 41, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !13, line: 197, column: 17)
!284 = !DILocation(line: 198, column: 34, scope: !283)
!285 = !DILocation(line: 198, column: 21, scope: !283)
!286 = !DILocation(line: 199, column: 17, scope: !283)
!287 = !DILocation(line: 196, column: 37, scope: !279)
!288 = !DILocation(line: 196, column: 17, scope: !279)
!289 = distinct !{!289, !281, !290, !81}
!290 = !DILocation(line: 199, column: 17, scope: !276)
!291 = !DILocation(line: 200, column: 13, scope: !272)
!292 = !DILocation(line: 203, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !268, file: !13, line: 202, column: 13)
!294 = !DILocation(line: 206, column: 5, scope: !263)
!295 = !DILocation(line: 207, column: 1, scope: !246)
!296 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 210, type: !14, scopeLine: 211, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!297 = !DILocalVariable(name: "data", scope: !296, file: !13, line: 212, type: !17)
!298 = !DILocation(line: 212, column: 9, scope: !296)
!299 = !DILocation(line: 214, column: 10, scope: !296)
!300 = !DILocation(line: 215, column: 8, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !13, line: 215, column: 8)
!302 = !DILocation(line: 215, column: 8, scope: !296)
!303 = !DILocation(line: 219, column: 14, scope: !304)
!304 = distinct !DILexicalBlock(scope: !301, file: !13, line: 216, column: 5)
!305 = !DILocation(line: 220, column: 5, scope: !304)
!306 = !DILocation(line: 221, column: 8, scope: !307)
!307 = distinct !DILexicalBlock(scope: !296, file: !13, line: 221, column: 8)
!308 = !DILocation(line: 221, column: 8, scope: !296)
!309 = !DILocalVariable(name: "i", scope: !310, file: !13, line: 224, type: !17)
!310 = distinct !DILexicalBlock(scope: !311, file: !13, line: 223, column: 9)
!311 = distinct !DILexicalBlock(scope: !307, file: !13, line: 222, column: 5)
!312 = !DILocation(line: 224, column: 17, scope: !310)
!313 = !DILocalVariable(name: "buffer", scope: !310, file: !13, line: 225, type: !53)
!314 = !DILocation(line: 225, column: 17, scope: !310)
!315 = !DILocation(line: 228, column: 17, scope: !316)
!316 = distinct !DILexicalBlock(scope: !310, file: !13, line: 228, column: 17)
!317 = !DILocation(line: 228, column: 22, scope: !316)
!318 = !DILocation(line: 228, column: 17, scope: !310)
!319 = !DILocation(line: 230, column: 24, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !13, line: 229, column: 13)
!321 = !DILocation(line: 230, column: 17, scope: !320)
!322 = !DILocation(line: 230, column: 30, scope: !320)
!323 = !DILocation(line: 232, column: 23, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !13, line: 232, column: 17)
!325 = !DILocation(line: 232, column: 21, scope: !324)
!326 = !DILocation(line: 232, column: 28, scope: !327)
!327 = distinct !DILexicalBlock(scope: !324, file: !13, line: 232, column: 17)
!328 = !DILocation(line: 232, column: 30, scope: !327)
!329 = !DILocation(line: 232, column: 17, scope: !324)
!330 = !DILocation(line: 234, column: 41, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !13, line: 233, column: 17)
!332 = !DILocation(line: 234, column: 34, scope: !331)
!333 = !DILocation(line: 234, column: 21, scope: !331)
!334 = !DILocation(line: 235, column: 17, scope: !331)
!335 = !DILocation(line: 232, column: 37, scope: !327)
!336 = !DILocation(line: 232, column: 17, scope: !327)
!337 = distinct !{!337, !329, !338, !81}
!338 = !DILocation(line: 235, column: 17, scope: !324)
!339 = !DILocation(line: 236, column: 13, scope: !320)
!340 = !DILocation(line: 239, column: 17, scope: !341)
!341 = distinct !DILexicalBlock(scope: !316, file: !13, line: 238, column: 13)
!342 = !DILocation(line: 242, column: 5, scope: !311)
!343 = !DILocation(line: 243, column: 1, scope: !296)
