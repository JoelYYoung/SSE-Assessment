; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_08_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %call = call i32 @staticReturnsTrue(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end5, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !23, metadata !DIExpression()), !dbg !30
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !30
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !31
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !33
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !34
  %cmp = icmp ne i8* %call1, null, !dbg !35
  br i1 %cmp, label %if.then2, label %if.else, !dbg !36

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !39
  store i32 %call4, i32* %data, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !44

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsTrue(), !dbg !45
  %tobool7 = icmp ne i32 %call6, 0, !dbg !45
  br i1 %tobool7, label %if.then8, label %if.end16, !dbg !47

if.then8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !52, metadata !DIExpression()), !dbg !56
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !56
  %3 = load i32, i32* %data, align 4, !dbg !57
  %cmp9 = icmp slt i32 %3, 10, !dbg !59
  br i1 %cmp9, label %if.then10, label %if.else14, !dbg !60

if.then10:                                        ; preds = %if.then8
  %4 = load i32, i32* %data, align 4, !dbg !61
  %idxprom = sext i32 %4 to i64, !dbg !63
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !63
  store i32 1, i32* %arrayidx, align 4, !dbg !64
  store i32 0, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.then10
  %5 = load i32, i32* %i, align 4, !dbg !68
  %cmp11 = icmp slt i32 %5, 10, !dbg !70
  br i1 %cmp11, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !72
  %idxprom12 = sext i32 %6 to i64, !dbg !74
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !74
  %7 = load i32, i32* %arrayidx13, align 4, !dbg !74
  call void @printIntLine(i32 %7), !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !77
  %inc = add nsw i32 %8, 1, !dbg !77
  store i32 %inc, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  br label %if.end15, !dbg !82

if.else14:                                        ; preds = %if.then8
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %for.end
  br label %if.end16, !dbg !85

if.end16:                                         ; preds = %if.end15, %if.end5
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_08_good() #0 !dbg !87 {
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
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_08_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_08_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !112 {
entry:
  ret i32 1, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !116 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  %call = call i32 @staticReturnsTrue(), !dbg !120
  %tobool = icmp ne i32 %call, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.end5, !dbg !122

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !123, metadata !DIExpression()), !dbg !126
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !126
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !127
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !129
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !130
  %cmp = icmp ne i8* %call1, null, !dbg !131
  br i1 %cmp, label %if.then2, label %if.else, !dbg !132

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !133
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !135
  store i32 %call4, i32* %data, align 4, !dbg !136
  br label %if.end, !dbg !137

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !138
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !140

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsFalse(), !dbg !141
  %tobool7 = icmp ne i32 %call6, 0, !dbg !141
  br i1 %tobool7, label %if.then8, label %if.else9, !dbg !143

if.then8:                                         ; preds = %if.end5
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !144
  br label %if.end18, !dbg !146

if.else9:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !151, metadata !DIExpression()), !dbg !152
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !152
  %3 = load i32, i32* %data, align 4, !dbg !153
  %cmp10 = icmp sge i32 %3, 0, !dbg !155
  br i1 %cmp10, label %land.lhs.true, label %if.else16, !dbg !156

land.lhs.true:                                    ; preds = %if.else9
  %4 = load i32, i32* %data, align 4, !dbg !157
  %cmp11 = icmp slt i32 %4, 10, !dbg !158
  br i1 %cmp11, label %if.then12, label %if.else16, !dbg !159

if.then12:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !160
  %idxprom = sext i32 %5 to i64, !dbg !162
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !162
  store i32 1, i32* %arrayidx, align 4, !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.then12
  %6 = load i32, i32* %i, align 4, !dbg !167
  %cmp13 = icmp slt i32 %6, 10, !dbg !169
  br i1 %cmp13, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !171
  %idxprom14 = sext i32 %7 to i64, !dbg !173
  %arrayidx15 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom14, !dbg !173
  %8 = load i32, i32* %arrayidx15, align 4, !dbg !173
  call void @printIntLine(i32 %8), !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !176
  %inc = add nsw i32 %9, 1, !dbg !176
  store i32 %inc, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  br label %if.end17, !dbg !180

if.else16:                                        ; preds = %land.lhs.true, %if.else9
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !181
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then8
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !184 {
entry:
  ret i32 0, !dbg !185
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !186 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 -1, i32* %data, align 4, !dbg !189
  %call = call i32 @staticReturnsTrue(), !dbg !190
  %tobool = icmp ne i32 %call, 0, !dbg !190
  br i1 %tobool, label %if.then, label %if.end5, !dbg !192

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !193, metadata !DIExpression()), !dbg !196
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !196
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !197
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !199
  %call1 = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !200
  %cmp = icmp ne i8* %call1, null, !dbg !201
  br i1 %cmp, label %if.then2, label %if.else, !dbg !202

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !203
  %call4 = call i32 @atoi(i8* %arraydecay3) #6, !dbg !205
  store i32 %call4, i32* %data, align 4, !dbg !206
  br label %if.end, !dbg !207

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !208
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !210

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsTrue(), !dbg !211
  %tobool7 = icmp ne i32 %call6, 0, !dbg !211
  br i1 %tobool7, label %if.then8, label %if.end17, !dbg !213

if.then8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !214, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !218, metadata !DIExpression()), !dbg !219
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !219
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !219
  %3 = load i32, i32* %data, align 4, !dbg !220
  %cmp9 = icmp sge i32 %3, 0, !dbg !222
  br i1 %cmp9, label %land.lhs.true, label %if.else15, !dbg !223

land.lhs.true:                                    ; preds = %if.then8
  %4 = load i32, i32* %data, align 4, !dbg !224
  %cmp10 = icmp slt i32 %4, 10, !dbg !225
  br i1 %cmp10, label %if.then11, label %if.else15, !dbg !226

if.then11:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !227
  %idxprom = sext i32 %5 to i64, !dbg !229
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !229
  store i32 1, i32* %arrayidx, align 4, !dbg !230
  store i32 0, i32* %i, align 4, !dbg !231
  br label %for.cond, !dbg !233

for.cond:                                         ; preds = %for.inc, %if.then11
  %6 = load i32, i32* %i, align 4, !dbg !234
  %cmp12 = icmp slt i32 %6, 10, !dbg !236
  br i1 %cmp12, label %for.body, label %for.end, !dbg !237

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !238
  %idxprom13 = sext i32 %7 to i64, !dbg !240
  %arrayidx14 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom13, !dbg !240
  %8 = load i32, i32* %arrayidx14, align 4, !dbg !240
  call void @printIntLine(i32 %8), !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !243
  %inc = add nsw i32 %9, 1, !dbg !243
  store i32 %inc, i32* %i, align 4, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  br label %if.end16, !dbg !247

if.else15:                                        ; preds = %land.lhs.true, %if.then8
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !248
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %for.end
  br label %if.end17, !dbg !250

if.end17:                                         ; preds = %if.end16, %if.end5
  ret void, !dbg !251
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !252 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %data, align 4, !dbg !255
  %call = call i32 @staticReturnsFalse(), !dbg !256
  %tobool = icmp ne i32 %call, 0, !dbg !256
  br i1 %tobool, label %if.then, label %if.else, !dbg !258

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !259
  br label %if.end, !dbg !261

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !262
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !264
  %tobool2 = icmp ne i32 %call1, 0, !dbg !264
  br i1 %tobool2, label %if.then3, label %if.end10, !dbg !266

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !267, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !271, metadata !DIExpression()), !dbg !272
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !272
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !272
  %1 = load i32, i32* %data, align 4, !dbg !273
  %cmp = icmp slt i32 %1, 10, !dbg !275
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !276

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !277
  %idxprom = sext i32 %2 to i64, !dbg !279
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !279
  store i32 1, i32* %arrayidx, align 4, !dbg !280
  store i32 0, i32* %i, align 4, !dbg !281
  br label %for.cond, !dbg !283

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !284
  %cmp5 = icmp slt i32 %3, 10, !dbg !286
  br i1 %cmp5, label %for.body, label %for.end, !dbg !287

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !288
  %idxprom6 = sext i32 %4 to i64, !dbg !290
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !290
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !290
  call void @printIntLine(i32 %5), !dbg !291
  br label %for.inc, !dbg !292

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !293
  %inc = add nsw i32 %6, 1, !dbg !293
  store i32 %inc, i32* %i, align 4, !dbg !293
  br label %for.cond, !dbg !294, !llvm.loop !295

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !297

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !298
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !300

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !301
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !302 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !303, metadata !DIExpression()), !dbg !304
  store i32 -1, i32* %data, align 4, !dbg !305
  %call = call i32 @staticReturnsTrue(), !dbg !306
  %tobool = icmp ne i32 %call, 0, !dbg !306
  br i1 %tobool, label %if.then, label %if.end, !dbg !308

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !309
  br label %if.end, !dbg !311

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !312
  %tobool2 = icmp ne i32 %call1, 0, !dbg !312
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !314

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !315, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !319, metadata !DIExpression()), !dbg !320
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !320
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !320
  %1 = load i32, i32* %data, align 4, !dbg !321
  %cmp = icmp slt i32 %1, 10, !dbg !323
  br i1 %cmp, label %if.then4, label %if.else, !dbg !324

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !325
  %idxprom = sext i32 %2 to i64, !dbg !327
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !327
  store i32 1, i32* %arrayidx, align 4, !dbg !328
  store i32 0, i32* %i, align 4, !dbg !329
  br label %for.cond, !dbg !331

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !332
  %cmp5 = icmp slt i32 %3, 10, !dbg !334
  br i1 %cmp5, label %for.body, label %for.end, !dbg !335

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !336
  %idxprom6 = sext i32 %4 to i64, !dbg !338
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !338
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !338
  call void @printIntLine(i32 %5), !dbg !339
  br label %for.inc, !dbg !340

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !341
  %inc = add nsw i32 %6, 1, !dbg !341
  store i32 %inc, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !342, !llvm.loop !343

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !345

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !346
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !348

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !349
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_08_bad", scope: !13, file: !13, line: 37, type: !14, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_08.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 39, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 39, column: 9, scope: !12)
!19 = !DILocation(line: 41, column: 10, scope: !12)
!20 = !DILocation(line: 42, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 42, column: 8)
!22 = !DILocation(line: 42, column: 8, scope: !12)
!23 = !DILocalVariable(name: "inputBuffer", scope: !24, file: !13, line: 45, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !13, line: 44, column: 9)
!25 = distinct !DILexicalBlock(scope: !21, file: !13, line: 43, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 112, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 14)
!30 = !DILocation(line: 45, column: 18, scope: !24)
!31 = !DILocation(line: 47, column: 23, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !13, line: 47, column: 17)
!33 = !DILocation(line: 47, column: 53, scope: !32)
!34 = !DILocation(line: 47, column: 17, scope: !32)
!35 = !DILocation(line: 47, column: 60, scope: !32)
!36 = !DILocation(line: 47, column: 17, scope: !24)
!37 = !DILocation(line: 50, column: 29, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !13, line: 48, column: 13)
!39 = !DILocation(line: 50, column: 24, scope: !38)
!40 = !DILocation(line: 50, column: 22, scope: !38)
!41 = !DILocation(line: 51, column: 13, scope: !38)
!42 = !DILocation(line: 54, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !32, file: !13, line: 53, column: 13)
!44 = !DILocation(line: 57, column: 5, scope: !25)
!45 = !DILocation(line: 58, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !12, file: !13, line: 58, column: 8)
!47 = !DILocation(line: 58, column: 8, scope: !12)
!48 = !DILocalVariable(name: "i", scope: !49, file: !13, line: 61, type: !17)
!49 = distinct !DILexicalBlock(scope: !50, file: !13, line: 60, column: 9)
!50 = distinct !DILexicalBlock(scope: !46, file: !13, line: 59, column: 5)
!51 = !DILocation(line: 61, column: 17, scope: !49)
!52 = !DILocalVariable(name: "buffer", scope: !49, file: !13, line: 62, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 10)
!56 = !DILocation(line: 62, column: 17, scope: !49)
!57 = !DILocation(line: 65, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !49, file: !13, line: 65, column: 17)
!59 = !DILocation(line: 65, column: 22, scope: !58)
!60 = !DILocation(line: 65, column: 17, scope: !49)
!61 = !DILocation(line: 67, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !13, line: 66, column: 13)
!63 = !DILocation(line: 67, column: 17, scope: !62)
!64 = !DILocation(line: 67, column: 30, scope: !62)
!65 = !DILocation(line: 69, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !13, line: 69, column: 17)
!67 = !DILocation(line: 69, column: 21, scope: !66)
!68 = !DILocation(line: 69, column: 28, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !13, line: 69, column: 17)
!70 = !DILocation(line: 69, column: 30, scope: !69)
!71 = !DILocation(line: 69, column: 17, scope: !66)
!72 = !DILocation(line: 71, column: 41, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !13, line: 70, column: 17)
!74 = !DILocation(line: 71, column: 34, scope: !73)
!75 = !DILocation(line: 71, column: 21, scope: !73)
!76 = !DILocation(line: 72, column: 17, scope: !73)
!77 = !DILocation(line: 69, column: 37, scope: !69)
!78 = !DILocation(line: 69, column: 17, scope: !69)
!79 = distinct !{!79, !71, !80, !81}
!80 = !DILocation(line: 72, column: 17, scope: !66)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 73, column: 13, scope: !62)
!83 = !DILocation(line: 76, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !58, file: !13, line: 75, column: 13)
!85 = !DILocation(line: 79, column: 5, scope: !50)
!86 = !DILocation(line: 80, column: 1, scope: !12)
!87 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_08_good", scope: !13, file: !13, line: 258, type: !14, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 260, column: 5, scope: !87)
!89 = !DILocation(line: 261, column: 5, scope: !87)
!90 = !DILocation(line: 262, column: 5, scope: !87)
!91 = !DILocation(line: 263, column: 5, scope: !87)
!92 = !DILocation(line: 264, column: 1, scope: !87)
!93 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 275, type: !94, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!17, !17, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !13, line: 275, type: !17)
!99 = !DILocation(line: 275, column: 14, scope: !93)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !13, line: 275, type: !96)
!101 = !DILocation(line: 275, column: 27, scope: !93)
!102 = !DILocation(line: 278, column: 22, scope: !93)
!103 = !DILocation(line: 278, column: 12, scope: !93)
!104 = !DILocation(line: 278, column: 5, scope: !93)
!105 = !DILocation(line: 280, column: 5, scope: !93)
!106 = !DILocation(line: 281, column: 5, scope: !93)
!107 = !DILocation(line: 282, column: 5, scope: !93)
!108 = !DILocation(line: 285, column: 5, scope: !93)
!109 = !DILocation(line: 286, column: 5, scope: !93)
!110 = !DILocation(line: 287, column: 5, scope: !93)
!111 = !DILocation(line: 289, column: 5, scope: !93)
!112 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !13, file: !13, line: 25, type: !113, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!17}
!115 = !DILocation(line: 27, column: 5, scope: !112)
!116 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 87, type: !14, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !13, line: 89, type: !17)
!118 = !DILocation(line: 89, column: 9, scope: !116)
!119 = !DILocation(line: 91, column: 10, scope: !116)
!120 = !DILocation(line: 92, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !13, line: 92, column: 8)
!122 = !DILocation(line: 92, column: 8, scope: !116)
!123 = !DILocalVariable(name: "inputBuffer", scope: !124, file: !13, line: 95, type: !26)
!124 = distinct !DILexicalBlock(scope: !125, file: !13, line: 94, column: 9)
!125 = distinct !DILexicalBlock(scope: !121, file: !13, line: 93, column: 5)
!126 = !DILocation(line: 95, column: 18, scope: !124)
!127 = !DILocation(line: 97, column: 23, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !13, line: 97, column: 17)
!129 = !DILocation(line: 97, column: 53, scope: !128)
!130 = !DILocation(line: 97, column: 17, scope: !128)
!131 = !DILocation(line: 97, column: 60, scope: !128)
!132 = !DILocation(line: 97, column: 17, scope: !124)
!133 = !DILocation(line: 100, column: 29, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !13, line: 98, column: 13)
!135 = !DILocation(line: 100, column: 24, scope: !134)
!136 = !DILocation(line: 100, column: 22, scope: !134)
!137 = !DILocation(line: 101, column: 13, scope: !134)
!138 = !DILocation(line: 104, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !128, file: !13, line: 103, column: 13)
!140 = !DILocation(line: 107, column: 5, scope: !125)
!141 = !DILocation(line: 108, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !116, file: !13, line: 108, column: 8)
!143 = !DILocation(line: 108, column: 8, scope: !116)
!144 = !DILocation(line: 111, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !13, line: 109, column: 5)
!146 = !DILocation(line: 112, column: 5, scope: !145)
!147 = !DILocalVariable(name: "i", scope: !148, file: !13, line: 116, type: !17)
!148 = distinct !DILexicalBlock(scope: !149, file: !13, line: 115, column: 9)
!149 = distinct !DILexicalBlock(scope: !142, file: !13, line: 114, column: 5)
!150 = !DILocation(line: 116, column: 17, scope: !148)
!151 = !DILocalVariable(name: "buffer", scope: !148, file: !13, line: 117, type: !53)
!152 = !DILocation(line: 117, column: 17, scope: !148)
!153 = !DILocation(line: 119, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !148, file: !13, line: 119, column: 17)
!155 = !DILocation(line: 119, column: 22, scope: !154)
!156 = !DILocation(line: 119, column: 27, scope: !154)
!157 = !DILocation(line: 119, column: 30, scope: !154)
!158 = !DILocation(line: 119, column: 35, scope: !154)
!159 = !DILocation(line: 119, column: 17, scope: !148)
!160 = !DILocation(line: 121, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !13, line: 120, column: 13)
!162 = !DILocation(line: 121, column: 17, scope: !161)
!163 = !DILocation(line: 121, column: 30, scope: !161)
!164 = !DILocation(line: 123, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !13, line: 123, column: 17)
!166 = !DILocation(line: 123, column: 21, scope: !165)
!167 = !DILocation(line: 123, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !13, line: 123, column: 17)
!169 = !DILocation(line: 123, column: 30, scope: !168)
!170 = !DILocation(line: 123, column: 17, scope: !165)
!171 = !DILocation(line: 125, column: 41, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !13, line: 124, column: 17)
!173 = !DILocation(line: 125, column: 34, scope: !172)
!174 = !DILocation(line: 125, column: 21, scope: !172)
!175 = !DILocation(line: 126, column: 17, scope: !172)
!176 = !DILocation(line: 123, column: 37, scope: !168)
!177 = !DILocation(line: 123, column: 17, scope: !168)
!178 = distinct !{!178, !170, !179, !81}
!179 = !DILocation(line: 126, column: 17, scope: !165)
!180 = !DILocation(line: 127, column: 13, scope: !161)
!181 = !DILocation(line: 130, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !154, file: !13, line: 129, column: 13)
!183 = !DILocation(line: 134, column: 1, scope: !116)
!184 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !13, file: !13, line: 30, type: !113, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!185 = !DILocation(line: 32, column: 5, scope: !184)
!186 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 137, type: !14, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!187 = !DILocalVariable(name: "data", scope: !186, file: !13, line: 139, type: !17)
!188 = !DILocation(line: 139, column: 9, scope: !186)
!189 = !DILocation(line: 141, column: 10, scope: !186)
!190 = !DILocation(line: 142, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !13, line: 142, column: 8)
!192 = !DILocation(line: 142, column: 8, scope: !186)
!193 = !DILocalVariable(name: "inputBuffer", scope: !194, file: !13, line: 145, type: !26)
!194 = distinct !DILexicalBlock(scope: !195, file: !13, line: 144, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !13, line: 143, column: 5)
!196 = !DILocation(line: 145, column: 18, scope: !194)
!197 = !DILocation(line: 147, column: 23, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !13, line: 147, column: 17)
!199 = !DILocation(line: 147, column: 53, scope: !198)
!200 = !DILocation(line: 147, column: 17, scope: !198)
!201 = !DILocation(line: 147, column: 60, scope: !198)
!202 = !DILocation(line: 147, column: 17, scope: !194)
!203 = !DILocation(line: 150, column: 29, scope: !204)
!204 = distinct !DILexicalBlock(scope: !198, file: !13, line: 148, column: 13)
!205 = !DILocation(line: 150, column: 24, scope: !204)
!206 = !DILocation(line: 150, column: 22, scope: !204)
!207 = !DILocation(line: 151, column: 13, scope: !204)
!208 = !DILocation(line: 154, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !198, file: !13, line: 153, column: 13)
!210 = !DILocation(line: 157, column: 5, scope: !195)
!211 = !DILocation(line: 158, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !186, file: !13, line: 158, column: 8)
!213 = !DILocation(line: 158, column: 8, scope: !186)
!214 = !DILocalVariable(name: "i", scope: !215, file: !13, line: 161, type: !17)
!215 = distinct !DILexicalBlock(scope: !216, file: !13, line: 160, column: 9)
!216 = distinct !DILexicalBlock(scope: !212, file: !13, line: 159, column: 5)
!217 = !DILocation(line: 161, column: 17, scope: !215)
!218 = !DILocalVariable(name: "buffer", scope: !215, file: !13, line: 162, type: !53)
!219 = !DILocation(line: 162, column: 17, scope: !215)
!220 = !DILocation(line: 164, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !215, file: !13, line: 164, column: 17)
!222 = !DILocation(line: 164, column: 22, scope: !221)
!223 = !DILocation(line: 164, column: 27, scope: !221)
!224 = !DILocation(line: 164, column: 30, scope: !221)
!225 = !DILocation(line: 164, column: 35, scope: !221)
!226 = !DILocation(line: 164, column: 17, scope: !215)
!227 = !DILocation(line: 166, column: 24, scope: !228)
!228 = distinct !DILexicalBlock(scope: !221, file: !13, line: 165, column: 13)
!229 = !DILocation(line: 166, column: 17, scope: !228)
!230 = !DILocation(line: 166, column: 30, scope: !228)
!231 = !DILocation(line: 168, column: 23, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !13, line: 168, column: 17)
!233 = !DILocation(line: 168, column: 21, scope: !232)
!234 = !DILocation(line: 168, column: 28, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !13, line: 168, column: 17)
!236 = !DILocation(line: 168, column: 30, scope: !235)
!237 = !DILocation(line: 168, column: 17, scope: !232)
!238 = !DILocation(line: 170, column: 41, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !13, line: 169, column: 17)
!240 = !DILocation(line: 170, column: 34, scope: !239)
!241 = !DILocation(line: 170, column: 21, scope: !239)
!242 = !DILocation(line: 171, column: 17, scope: !239)
!243 = !DILocation(line: 168, column: 37, scope: !235)
!244 = !DILocation(line: 168, column: 17, scope: !235)
!245 = distinct !{!245, !237, !246, !81}
!246 = !DILocation(line: 171, column: 17, scope: !232)
!247 = !DILocation(line: 172, column: 13, scope: !228)
!248 = !DILocation(line: 175, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !221, file: !13, line: 174, column: 13)
!250 = !DILocation(line: 178, column: 5, scope: !216)
!251 = !DILocation(line: 179, column: 1, scope: !186)
!252 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 182, type: !14, scopeLine: 183, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!253 = !DILocalVariable(name: "data", scope: !252, file: !13, line: 184, type: !17)
!254 = !DILocation(line: 184, column: 9, scope: !252)
!255 = !DILocation(line: 186, column: 10, scope: !252)
!256 = !DILocation(line: 187, column: 8, scope: !257)
!257 = distinct !DILexicalBlock(scope: !252, file: !13, line: 187, column: 8)
!258 = !DILocation(line: 187, column: 8, scope: !252)
!259 = !DILocation(line: 190, column: 9, scope: !260)
!260 = distinct !DILexicalBlock(scope: !257, file: !13, line: 188, column: 5)
!261 = !DILocation(line: 191, column: 5, scope: !260)
!262 = !DILocation(line: 196, column: 14, scope: !263)
!263 = distinct !DILexicalBlock(scope: !257, file: !13, line: 193, column: 5)
!264 = !DILocation(line: 198, column: 8, scope: !265)
!265 = distinct !DILexicalBlock(scope: !252, file: !13, line: 198, column: 8)
!266 = !DILocation(line: 198, column: 8, scope: !252)
!267 = !DILocalVariable(name: "i", scope: !268, file: !13, line: 201, type: !17)
!268 = distinct !DILexicalBlock(scope: !269, file: !13, line: 200, column: 9)
!269 = distinct !DILexicalBlock(scope: !265, file: !13, line: 199, column: 5)
!270 = !DILocation(line: 201, column: 17, scope: !268)
!271 = !DILocalVariable(name: "buffer", scope: !268, file: !13, line: 202, type: !53)
!272 = !DILocation(line: 202, column: 17, scope: !268)
!273 = !DILocation(line: 205, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !268, file: !13, line: 205, column: 17)
!275 = !DILocation(line: 205, column: 22, scope: !274)
!276 = !DILocation(line: 205, column: 17, scope: !268)
!277 = !DILocation(line: 207, column: 24, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !13, line: 206, column: 13)
!279 = !DILocation(line: 207, column: 17, scope: !278)
!280 = !DILocation(line: 207, column: 30, scope: !278)
!281 = !DILocation(line: 209, column: 23, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !13, line: 209, column: 17)
!283 = !DILocation(line: 209, column: 21, scope: !282)
!284 = !DILocation(line: 209, column: 28, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !13, line: 209, column: 17)
!286 = !DILocation(line: 209, column: 30, scope: !285)
!287 = !DILocation(line: 209, column: 17, scope: !282)
!288 = !DILocation(line: 211, column: 41, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !13, line: 210, column: 17)
!290 = !DILocation(line: 211, column: 34, scope: !289)
!291 = !DILocation(line: 211, column: 21, scope: !289)
!292 = !DILocation(line: 212, column: 17, scope: !289)
!293 = !DILocation(line: 209, column: 37, scope: !285)
!294 = !DILocation(line: 209, column: 17, scope: !285)
!295 = distinct !{!295, !287, !296, !81}
!296 = !DILocation(line: 212, column: 17, scope: !282)
!297 = !DILocation(line: 213, column: 13, scope: !278)
!298 = !DILocation(line: 216, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !274, file: !13, line: 215, column: 13)
!300 = !DILocation(line: 219, column: 5, scope: !269)
!301 = !DILocation(line: 220, column: 1, scope: !252)
!302 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 223, type: !14, scopeLine: 224, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!303 = !DILocalVariable(name: "data", scope: !302, file: !13, line: 225, type: !17)
!304 = !DILocation(line: 225, column: 9, scope: !302)
!305 = !DILocation(line: 227, column: 10, scope: !302)
!306 = !DILocation(line: 228, column: 8, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !13, line: 228, column: 8)
!308 = !DILocation(line: 228, column: 8, scope: !302)
!309 = !DILocation(line: 232, column: 14, scope: !310)
!310 = distinct !DILexicalBlock(scope: !307, file: !13, line: 229, column: 5)
!311 = !DILocation(line: 233, column: 5, scope: !310)
!312 = !DILocation(line: 234, column: 8, scope: !313)
!313 = distinct !DILexicalBlock(scope: !302, file: !13, line: 234, column: 8)
!314 = !DILocation(line: 234, column: 8, scope: !302)
!315 = !DILocalVariable(name: "i", scope: !316, file: !13, line: 237, type: !17)
!316 = distinct !DILexicalBlock(scope: !317, file: !13, line: 236, column: 9)
!317 = distinct !DILexicalBlock(scope: !313, file: !13, line: 235, column: 5)
!318 = !DILocation(line: 237, column: 17, scope: !316)
!319 = !DILocalVariable(name: "buffer", scope: !316, file: !13, line: 238, type: !53)
!320 = !DILocation(line: 238, column: 17, scope: !316)
!321 = !DILocation(line: 241, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !316, file: !13, line: 241, column: 17)
!323 = !DILocation(line: 241, column: 22, scope: !322)
!324 = !DILocation(line: 241, column: 17, scope: !316)
!325 = !DILocation(line: 243, column: 24, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !13, line: 242, column: 13)
!327 = !DILocation(line: 243, column: 17, scope: !326)
!328 = !DILocation(line: 243, column: 30, scope: !326)
!329 = !DILocation(line: 245, column: 23, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !13, line: 245, column: 17)
!331 = !DILocation(line: 245, column: 21, scope: !330)
!332 = !DILocation(line: 245, column: 28, scope: !333)
!333 = distinct !DILexicalBlock(scope: !330, file: !13, line: 245, column: 17)
!334 = !DILocation(line: 245, column: 30, scope: !333)
!335 = !DILocation(line: 245, column: 17, scope: !330)
!336 = !DILocation(line: 247, column: 41, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !13, line: 246, column: 17)
!338 = !DILocation(line: 247, column: 34, scope: !337)
!339 = !DILocation(line: 247, column: 21, scope: !337)
!340 = !DILocation(line: 248, column: 17, scope: !337)
!341 = !DILocation(line: 245, column: 37, scope: !333)
!342 = !DILocation(line: 245, column: 17, scope: !333)
!343 = distinct !{!343, !335, !344, !81}
!344 = !DILocation(line: 248, column: 17, scope: !330)
!345 = !DILocation(line: 249, column: 13, scope: !326)
!346 = !DILocation(line: 252, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !322, file: !13, line: 251, column: 13)
!348 = !DILocation(line: 255, column: 5, scope: !317)
!349 = !DILocation(line: 256, column: 1, scope: !302)
