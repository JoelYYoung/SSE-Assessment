; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !22
  br label %if.end, !dbg !24

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !25
  %tobool1 = icmp ne i32 %1, 0, !dbg !25
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !27

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !32, metadata !DIExpression()), !dbg !36
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !36
  %3 = load i32, i32* %data, align 4, !dbg !37
  %cmp = icmp sge i32 %3, 0, !dbg !39
  br i1 %cmp, label %if.then3, label %if.else, !dbg !40

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !41
  %idxprom = sext i32 %4 to i64, !dbg !43
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !43
  store i32 1, i32* %arrayidx, align 4, !dbg !44
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !48
  %cmp4 = icmp slt i32 %5, 10, !dbg !50
  br i1 %cmp4, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !52
  %idxprom5 = sext i32 %6 to i64, !dbg !54
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !54
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !54
  call void @printIntLine(i32 %7), !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %8, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !62

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !63
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !65

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09_good() #0 !dbg !67 {
entry:
  call void @goodB2G1(), !dbg !68
  call void @goodB2G2(), !dbg !69
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !93 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i32 -1, i32* %data, align 4, !dbg !96
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !97
  %tobool = icmp ne i32 %0, 0, !dbg !97
  br i1 %tobool, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !100
  br label %if.end, !dbg !102

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !103
  %tobool1 = icmp ne i32 %1, 0, !dbg !103
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !105

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !106
  br label %if.end10, !dbg !108

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !109, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !113, metadata !DIExpression()), !dbg !114
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !114
  %3 = load i32, i32* %data, align 4, !dbg !115
  %cmp = icmp sge i32 %3, 0, !dbg !117
  br i1 %cmp, label %land.lhs.true, label %if.else8, !dbg !118

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !119
  %cmp3 = icmp slt i32 %4, 10, !dbg !120
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !121

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !122
  %idxprom = sext i32 %5 to i64, !dbg !124
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !124
  store i32 1, i32* %arrayidx, align 4, !dbg !125
  store i32 0, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.then4
  %6 = load i32, i32* %i, align 4, !dbg !129
  %cmp5 = icmp slt i32 %6, 10, !dbg !131
  br i1 %cmp5, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !133
  %idxprom6 = sext i32 %7 to i64, !dbg !135
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !135
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !135
  call void @printIntLine(i32 %8), !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !138
  %inc = add nsw i32 %9, 1, !dbg !138
  store i32 %inc, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !142

if.else8:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !143
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then2
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !146 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !147, metadata !DIExpression()), !dbg !148
  store i32 -1, i32* %data, align 4, !dbg !149
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !150
  %tobool = icmp ne i32 %0, 0, !dbg !150
  br i1 %tobool, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !153
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !156
  %tobool1 = icmp ne i32 %1, 0, !dbg !156
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !158

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !159, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !163, metadata !DIExpression()), !dbg !164
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !164
  %3 = load i32, i32* %data, align 4, !dbg !165
  %cmp = icmp sge i32 %3, 0, !dbg !167
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !168

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !169
  %cmp3 = icmp slt i32 %4, 10, !dbg !170
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !171

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !172
  %idxprom = sext i32 %5 to i64, !dbg !174
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !174
  store i32 1, i32* %arrayidx, align 4, !dbg !175
  store i32 0, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %if.then4
  %6 = load i32, i32* %i, align 4, !dbg !179
  %cmp5 = icmp slt i32 %6, 10, !dbg !181
  br i1 %cmp5, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !183
  %idxprom6 = sext i32 %7 to i64, !dbg !185
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !185
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !185
  call void @printIntLine(i32 %8), !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !188
  %inc = add nsw i32 %9, 1, !dbg !188
  store i32 %inc, i32* %i, align 4, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !192

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !193
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !195

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !196
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !197 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 -1, i32* %data, align 4, !dbg !200
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !201
  %tobool = icmp ne i32 %0, 0, !dbg !201
  br i1 %tobool, label %if.then, label %if.else, !dbg !203

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !204
  br label %if.end, !dbg !206

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !207
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !209
  %tobool1 = icmp ne i32 %1, 0, !dbg !209
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !211

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !212, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !216, metadata !DIExpression()), !dbg !217
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !217
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !217
  %3 = load i32, i32* %data, align 4, !dbg !218
  %cmp = icmp sge i32 %3, 0, !dbg !220
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !221

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !222
  %idxprom = sext i32 %4 to i64, !dbg !224
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !224
  store i32 1, i32* %arrayidx, align 4, !dbg !225
  store i32 0, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !228

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !229
  %cmp4 = icmp slt i32 %5, 10, !dbg !231
  br i1 %cmp4, label %for.body, label %for.end, !dbg !232

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !233
  %idxprom5 = sext i32 %6 to i64, !dbg !235
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !235
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !235
  call void @printIntLine(i32 %7), !dbg !236
  br label %for.inc, !dbg !237

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !238
  %inc = add nsw i32 %8, 1, !dbg !238
  store i32 %inc, i32* %i, align 4, !dbg !238
  br label %for.cond, !dbg !239, !llvm.loop !240

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !242

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !243
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !245

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !246
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !247 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !248, metadata !DIExpression()), !dbg !249
  store i32 -1, i32* %data, align 4, !dbg !250
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !251
  %tobool = icmp ne i32 %0, 0, !dbg !251
  br i1 %tobool, label %if.then, label %if.end, !dbg !253

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !254
  br label %if.end, !dbg !256

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !257
  %tobool1 = icmp ne i32 %1, 0, !dbg !257
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !259

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !260, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !264, metadata !DIExpression()), !dbg !265
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !265
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !265
  %3 = load i32, i32* %data, align 4, !dbg !266
  %cmp = icmp sge i32 %3, 0, !dbg !268
  br i1 %cmp, label %if.then3, label %if.else, !dbg !269

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !270
  %idxprom = sext i32 %4 to i64, !dbg !272
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !272
  store i32 1, i32* %arrayidx, align 4, !dbg !273
  store i32 0, i32* %i, align 4, !dbg !274
  br label %for.cond, !dbg !276

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !277
  %cmp4 = icmp slt i32 %5, 10, !dbg !279
  br i1 %cmp4, label %for.body, label %for.end, !dbg !280

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !281
  %idxprom5 = sext i32 %6 to i64, !dbg !283
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !283
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !283
  call void @printIntLine(i32 %7), !dbg !284
  br label %for.inc, !dbg !285

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !286
  %inc = add nsw i32 %8, 1, !dbg !286
  store i32 %inc, i32* %i, align 4, !dbg !286
  br label %for.cond, !dbg !287, !llvm.loop !288

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !290

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !291
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !293

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !294
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 8, scope: !11)
!22 = !DILocation(line: 30, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !12, line: 28, column: 5)
!24 = !DILocation(line: 31, column: 5, scope: !23)
!25 = !DILocation(line: 32, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!27 = !DILocation(line: 32, column: 8, scope: !11)
!28 = !DILocalVariable(name: "i", scope: !29, file: !12, line: 35, type: !16)
!29 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !12, line: 33, column: 5)
!31 = !DILocation(line: 35, column: 17, scope: !29)
!32 = !DILocalVariable(name: "buffer", scope: !29, file: !12, line: 36, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 10)
!36 = !DILocation(line: 36, column: 17, scope: !29)
!37 = !DILocation(line: 39, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !12, line: 39, column: 17)
!39 = !DILocation(line: 39, column: 22, scope: !38)
!40 = !DILocation(line: 39, column: 17, scope: !29)
!41 = !DILocation(line: 41, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 40, column: 13)
!43 = !DILocation(line: 41, column: 17, scope: !42)
!44 = !DILocation(line: 41, column: 30, scope: !42)
!45 = !DILocation(line: 43, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 43, column: 17)
!47 = !DILocation(line: 43, column: 21, scope: !46)
!48 = !DILocation(line: 43, column: 28, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 43, column: 17)
!50 = !DILocation(line: 43, column: 30, scope: !49)
!51 = !DILocation(line: 43, column: 17, scope: !46)
!52 = !DILocation(line: 45, column: 41, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 44, column: 17)
!54 = !DILocation(line: 45, column: 34, scope: !53)
!55 = !DILocation(line: 45, column: 21, scope: !53)
!56 = !DILocation(line: 46, column: 17, scope: !53)
!57 = !DILocation(line: 43, column: 37, scope: !49)
!58 = !DILocation(line: 43, column: 17, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 46, column: 17, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 47, column: 13, scope: !42)
!63 = !DILocation(line: 50, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !38, file: !12, line: 49, column: 13)
!65 = !DILocation(line: 53, column: 5, scope: !30)
!66 = !DILocation(line: 54, column: 1, scope: !11)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_09_good", scope: !12, file: !12, line: 210, type: !13, scopeLine: 211, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 212, column: 5, scope: !67)
!69 = !DILocation(line: 213, column: 5, scope: !67)
!70 = !DILocation(line: 214, column: 5, scope: !67)
!71 = !DILocation(line: 215, column: 5, scope: !67)
!72 = !DILocation(line: 216, column: 1, scope: !67)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 227, type: !74, scopeLine: 228, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!16, !16, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 227, type: !16)
!80 = !DILocation(line: 227, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 227, type: !76)
!82 = !DILocation(line: 227, column: 27, scope: !73)
!83 = !DILocation(line: 230, column: 22, scope: !73)
!84 = !DILocation(line: 230, column: 12, scope: !73)
!85 = !DILocation(line: 230, column: 5, scope: !73)
!86 = !DILocation(line: 232, column: 5, scope: !73)
!87 = !DILocation(line: 233, column: 5, scope: !73)
!88 = !DILocation(line: 234, column: 5, scope: !73)
!89 = !DILocation(line: 237, column: 5, scope: !73)
!90 = !DILocation(line: 238, column: 5, scope: !73)
!91 = !DILocation(line: 239, column: 5, scope: !73)
!92 = !DILocation(line: 241, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 63, type: !16)
!95 = !DILocation(line: 63, column: 9, scope: !93)
!96 = !DILocation(line: 65, column: 10, scope: !93)
!97 = !DILocation(line: 66, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !12, line: 66, column: 8)
!99 = !DILocation(line: 66, column: 8, scope: !93)
!100 = !DILocation(line: 69, column: 14, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !12, line: 67, column: 5)
!102 = !DILocation(line: 70, column: 5, scope: !101)
!103 = !DILocation(line: 71, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !93, file: !12, line: 71, column: 8)
!105 = !DILocation(line: 71, column: 8, scope: !93)
!106 = !DILocation(line: 74, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 72, column: 5)
!108 = !DILocation(line: 75, column: 5, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !110, file: !12, line: 79, type: !16)
!110 = distinct !DILexicalBlock(scope: !111, file: !12, line: 78, column: 9)
!111 = distinct !DILexicalBlock(scope: !104, file: !12, line: 77, column: 5)
!112 = !DILocation(line: 79, column: 17, scope: !110)
!113 = !DILocalVariable(name: "buffer", scope: !110, file: !12, line: 80, type: !33)
!114 = !DILocation(line: 80, column: 17, scope: !110)
!115 = !DILocation(line: 82, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !12, line: 82, column: 17)
!117 = !DILocation(line: 82, column: 22, scope: !116)
!118 = !DILocation(line: 82, column: 27, scope: !116)
!119 = !DILocation(line: 82, column: 30, scope: !116)
!120 = !DILocation(line: 82, column: 35, scope: !116)
!121 = !DILocation(line: 82, column: 17, scope: !110)
!122 = !DILocation(line: 84, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !12, line: 83, column: 13)
!124 = !DILocation(line: 84, column: 17, scope: !123)
!125 = !DILocation(line: 84, column: 30, scope: !123)
!126 = !DILocation(line: 86, column: 23, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 86, column: 17)
!128 = !DILocation(line: 86, column: 21, scope: !127)
!129 = !DILocation(line: 86, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 86, column: 17)
!131 = !DILocation(line: 86, column: 30, scope: !130)
!132 = !DILocation(line: 86, column: 17, scope: !127)
!133 = !DILocation(line: 88, column: 41, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 87, column: 17)
!135 = !DILocation(line: 88, column: 34, scope: !134)
!136 = !DILocation(line: 88, column: 21, scope: !134)
!137 = !DILocation(line: 89, column: 17, scope: !134)
!138 = !DILocation(line: 86, column: 37, scope: !130)
!139 = !DILocation(line: 86, column: 17, scope: !130)
!140 = distinct !{!140, !132, !141, !61}
!141 = !DILocation(line: 89, column: 17, scope: !127)
!142 = !DILocation(line: 90, column: 13, scope: !123)
!143 = !DILocation(line: 93, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !116, file: !12, line: 92, column: 13)
!145 = !DILocation(line: 97, column: 1, scope: !93)
!146 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", scope: !146, file: !12, line: 102, type: !16)
!148 = !DILocation(line: 102, column: 9, scope: !146)
!149 = !DILocation(line: 104, column: 10, scope: !146)
!150 = !DILocation(line: 105, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !12, line: 105, column: 8)
!152 = !DILocation(line: 105, column: 8, scope: !146)
!153 = !DILocation(line: 108, column: 14, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !12, line: 106, column: 5)
!155 = !DILocation(line: 109, column: 5, scope: !154)
!156 = !DILocation(line: 110, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !146, file: !12, line: 110, column: 8)
!158 = !DILocation(line: 110, column: 8, scope: !146)
!159 = !DILocalVariable(name: "i", scope: !160, file: !12, line: 113, type: !16)
!160 = distinct !DILexicalBlock(scope: !161, file: !12, line: 112, column: 9)
!161 = distinct !DILexicalBlock(scope: !157, file: !12, line: 111, column: 5)
!162 = !DILocation(line: 113, column: 17, scope: !160)
!163 = !DILocalVariable(name: "buffer", scope: !160, file: !12, line: 114, type: !33)
!164 = !DILocation(line: 114, column: 17, scope: !160)
!165 = !DILocation(line: 116, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !160, file: !12, line: 116, column: 17)
!167 = !DILocation(line: 116, column: 22, scope: !166)
!168 = !DILocation(line: 116, column: 27, scope: !166)
!169 = !DILocation(line: 116, column: 30, scope: !166)
!170 = !DILocation(line: 116, column: 35, scope: !166)
!171 = !DILocation(line: 116, column: 17, scope: !160)
!172 = !DILocation(line: 118, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !166, file: !12, line: 117, column: 13)
!174 = !DILocation(line: 118, column: 17, scope: !173)
!175 = !DILocation(line: 118, column: 30, scope: !173)
!176 = !DILocation(line: 120, column: 23, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !12, line: 120, column: 17)
!178 = !DILocation(line: 120, column: 21, scope: !177)
!179 = !DILocation(line: 120, column: 28, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !12, line: 120, column: 17)
!181 = !DILocation(line: 120, column: 30, scope: !180)
!182 = !DILocation(line: 120, column: 17, scope: !177)
!183 = !DILocation(line: 122, column: 41, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !12, line: 121, column: 17)
!185 = !DILocation(line: 122, column: 34, scope: !184)
!186 = !DILocation(line: 122, column: 21, scope: !184)
!187 = !DILocation(line: 123, column: 17, scope: !184)
!188 = !DILocation(line: 120, column: 37, scope: !180)
!189 = !DILocation(line: 120, column: 17, scope: !180)
!190 = distinct !{!190, !182, !191, !61}
!191 = !DILocation(line: 123, column: 17, scope: !177)
!192 = !DILocation(line: 124, column: 13, scope: !173)
!193 = !DILocation(line: 127, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !166, file: !12, line: 126, column: 13)
!195 = !DILocation(line: 130, column: 5, scope: !161)
!196 = !DILocation(line: 131, column: 1, scope: !146)
!197 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 134, type: !13, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!198 = !DILocalVariable(name: "data", scope: !197, file: !12, line: 136, type: !16)
!199 = !DILocation(line: 136, column: 9, scope: !197)
!200 = !DILocation(line: 138, column: 10, scope: !197)
!201 = !DILocation(line: 139, column: 8, scope: !202)
!202 = distinct !DILexicalBlock(scope: !197, file: !12, line: 139, column: 8)
!203 = !DILocation(line: 139, column: 8, scope: !197)
!204 = !DILocation(line: 142, column: 9, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !12, line: 140, column: 5)
!206 = !DILocation(line: 143, column: 5, scope: !205)
!207 = !DILocation(line: 148, column: 14, scope: !208)
!208 = distinct !DILexicalBlock(scope: !202, file: !12, line: 145, column: 5)
!209 = !DILocation(line: 150, column: 8, scope: !210)
!210 = distinct !DILexicalBlock(scope: !197, file: !12, line: 150, column: 8)
!211 = !DILocation(line: 150, column: 8, scope: !197)
!212 = !DILocalVariable(name: "i", scope: !213, file: !12, line: 153, type: !16)
!213 = distinct !DILexicalBlock(scope: !214, file: !12, line: 152, column: 9)
!214 = distinct !DILexicalBlock(scope: !210, file: !12, line: 151, column: 5)
!215 = !DILocation(line: 153, column: 17, scope: !213)
!216 = !DILocalVariable(name: "buffer", scope: !213, file: !12, line: 154, type: !33)
!217 = !DILocation(line: 154, column: 17, scope: !213)
!218 = !DILocation(line: 157, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !213, file: !12, line: 157, column: 17)
!220 = !DILocation(line: 157, column: 22, scope: !219)
!221 = !DILocation(line: 157, column: 17, scope: !213)
!222 = !DILocation(line: 159, column: 24, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !12, line: 158, column: 13)
!224 = !DILocation(line: 159, column: 17, scope: !223)
!225 = !DILocation(line: 159, column: 30, scope: !223)
!226 = !DILocation(line: 161, column: 23, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !12, line: 161, column: 17)
!228 = !DILocation(line: 161, column: 21, scope: !227)
!229 = !DILocation(line: 161, column: 28, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !12, line: 161, column: 17)
!231 = !DILocation(line: 161, column: 30, scope: !230)
!232 = !DILocation(line: 161, column: 17, scope: !227)
!233 = !DILocation(line: 163, column: 41, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !12, line: 162, column: 17)
!235 = !DILocation(line: 163, column: 34, scope: !234)
!236 = !DILocation(line: 163, column: 21, scope: !234)
!237 = !DILocation(line: 164, column: 17, scope: !234)
!238 = !DILocation(line: 161, column: 37, scope: !230)
!239 = !DILocation(line: 161, column: 17, scope: !230)
!240 = distinct !{!240, !232, !241, !61}
!241 = !DILocation(line: 164, column: 17, scope: !227)
!242 = !DILocation(line: 165, column: 13, scope: !223)
!243 = !DILocation(line: 168, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !219, file: !12, line: 167, column: 13)
!245 = !DILocation(line: 171, column: 5, scope: !214)
!246 = !DILocation(line: 172, column: 1, scope: !197)
!247 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 175, type: !13, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!248 = !DILocalVariable(name: "data", scope: !247, file: !12, line: 177, type: !16)
!249 = !DILocation(line: 177, column: 9, scope: !247)
!250 = !DILocation(line: 179, column: 10, scope: !247)
!251 = !DILocation(line: 180, column: 8, scope: !252)
!252 = distinct !DILexicalBlock(scope: !247, file: !12, line: 180, column: 8)
!253 = !DILocation(line: 180, column: 8, scope: !247)
!254 = !DILocation(line: 184, column: 14, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !12, line: 181, column: 5)
!256 = !DILocation(line: 185, column: 5, scope: !255)
!257 = !DILocation(line: 186, column: 8, scope: !258)
!258 = distinct !DILexicalBlock(scope: !247, file: !12, line: 186, column: 8)
!259 = !DILocation(line: 186, column: 8, scope: !247)
!260 = !DILocalVariable(name: "i", scope: !261, file: !12, line: 189, type: !16)
!261 = distinct !DILexicalBlock(scope: !262, file: !12, line: 188, column: 9)
!262 = distinct !DILexicalBlock(scope: !258, file: !12, line: 187, column: 5)
!263 = !DILocation(line: 189, column: 17, scope: !261)
!264 = !DILocalVariable(name: "buffer", scope: !261, file: !12, line: 190, type: !33)
!265 = !DILocation(line: 190, column: 17, scope: !261)
!266 = !DILocation(line: 193, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !261, file: !12, line: 193, column: 17)
!268 = !DILocation(line: 193, column: 22, scope: !267)
!269 = !DILocation(line: 193, column: 17, scope: !261)
!270 = !DILocation(line: 195, column: 24, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !12, line: 194, column: 13)
!272 = !DILocation(line: 195, column: 17, scope: !271)
!273 = !DILocation(line: 195, column: 30, scope: !271)
!274 = !DILocation(line: 197, column: 23, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !12, line: 197, column: 17)
!276 = !DILocation(line: 197, column: 21, scope: !275)
!277 = !DILocation(line: 197, column: 28, scope: !278)
!278 = distinct !DILexicalBlock(scope: !275, file: !12, line: 197, column: 17)
!279 = !DILocation(line: 197, column: 30, scope: !278)
!280 = !DILocation(line: 197, column: 17, scope: !275)
!281 = !DILocation(line: 199, column: 41, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !12, line: 198, column: 17)
!283 = !DILocation(line: 199, column: 34, scope: !282)
!284 = !DILocation(line: 199, column: 21, scope: !282)
!285 = !DILocation(line: 200, column: 17, scope: !282)
!286 = !DILocation(line: 197, column: 37, scope: !278)
!287 = !DILocation(line: 197, column: 17, scope: !278)
!288 = distinct !{!288, !280, !289, !61}
!289 = !DILocation(line: 200, column: 17, scope: !275)
!290 = !DILocation(line: 201, column: 13, scope: !271)
!291 = !DILocation(line: 204, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !267, file: !12, line: 203, column: 13)
!293 = !DILocation(line: 207, column: 5, scope: !262)
!294 = !DILocation(line: 208, column: 1, scope: !247)
