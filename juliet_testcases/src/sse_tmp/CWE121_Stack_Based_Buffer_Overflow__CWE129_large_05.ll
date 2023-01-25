; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  %0 = load i32, i32* @staticTrue, align 4, !dbg !24
  %tobool = icmp ne i32 %0, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !27
  br label %if.end, !dbg !29

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !30
  %tobool1 = icmp ne i32 %1, 0, !dbg !30
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !32

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !37, metadata !DIExpression()), !dbg !41
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !41
  %3 = load i32, i32* %data, align 4, !dbg !42
  %cmp = icmp sge i32 %3, 0, !dbg !44
  br i1 %cmp, label %if.then3, label %if.else, !dbg !45

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !46
  %idxprom = sext i32 %4 to i64, !dbg !48
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !48
  store i32 1, i32* %arrayidx, align 4, !dbg !49
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !53
  %cmp4 = icmp slt i32 %5, 10, !dbg !55
  br i1 %cmp4, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !57
  %idxprom5 = sext i32 %6 to i64, !dbg !59
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !59
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !59
  call void @printIntLine(i32 %7), !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !62
  %inc = add nsw i32 %8, 1, !dbg !62
  store i32 %inc, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !67

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !68
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !70

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_good() #0 !dbg !72 {
entry:
  call void @goodB2G1(), !dbg !73
  call void @goodB2G2(), !dbg !74
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !98 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 -1, i32* %data, align 4, !dbg !101
  %0 = load i32, i32* @staticTrue, align 4, !dbg !102
  %tobool = icmp ne i32 %0, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !105
  br label %if.end, !dbg !107

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !108
  %tobool1 = icmp ne i32 %1, 0, !dbg !108
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !110

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !111
  br label %if.end10, !dbg !113

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !114, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !118, metadata !DIExpression()), !dbg !119
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !119
  %3 = load i32, i32* %data, align 4, !dbg !120
  %cmp = icmp sge i32 %3, 0, !dbg !122
  br i1 %cmp, label %land.lhs.true, label %if.else8, !dbg !123

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !124
  %cmp3 = icmp slt i32 %4, 10, !dbg !125
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !126

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !127
  %idxprom = sext i32 %5 to i64, !dbg !129
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !129
  store i32 1, i32* %arrayidx, align 4, !dbg !130
  store i32 0, i32* %i, align 4, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.then4
  %6 = load i32, i32* %i, align 4, !dbg !134
  %cmp5 = icmp slt i32 %6, 10, !dbg !136
  br i1 %cmp5, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !138
  %idxprom6 = sext i32 %7 to i64, !dbg !140
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !140
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !140
  call void @printIntLine(i32 %8), !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !143
  %inc = add nsw i32 %9, 1, !dbg !143
  store i32 %inc, i32* %i, align 4, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !147

if.else8:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !148
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then2
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !151 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i32 -1, i32* %data, align 4, !dbg !154
  %0 = load i32, i32* @staticTrue, align 4, !dbg !155
  %tobool = icmp ne i32 %0, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !158
  br label %if.end, !dbg !160

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !161
  %tobool1 = icmp ne i32 %1, 0, !dbg !161
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !163

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !164, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !168, metadata !DIExpression()), !dbg !169
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !169
  %3 = load i32, i32* %data, align 4, !dbg !170
  %cmp = icmp sge i32 %3, 0, !dbg !172
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !173

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !174
  %cmp3 = icmp slt i32 %4, 10, !dbg !175
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !176

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !177
  %idxprom = sext i32 %5 to i64, !dbg !179
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !179
  store i32 1, i32* %arrayidx, align 4, !dbg !180
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.then4
  %6 = load i32, i32* %i, align 4, !dbg !184
  %cmp5 = icmp slt i32 %6, 10, !dbg !186
  br i1 %cmp5, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !188
  %idxprom6 = sext i32 %7 to i64, !dbg !190
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !190
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !190
  call void @printIntLine(i32 %8), !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !193
  %inc = add nsw i32 %9, 1, !dbg !193
  store i32 %inc, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !197

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !198
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !200

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !202 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !203, metadata !DIExpression()), !dbg !204
  store i32 -1, i32* %data, align 4, !dbg !205
  %0 = load i32, i32* @staticFalse, align 4, !dbg !206
  %tobool = icmp ne i32 %0, 0, !dbg !206
  br i1 %tobool, label %if.then, label %if.else, !dbg !208

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !209
  br label %if.end, !dbg !211

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !212
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !214
  %tobool1 = icmp ne i32 %1, 0, !dbg !214
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !216

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !217, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !221, metadata !DIExpression()), !dbg !222
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !222
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !222
  %3 = load i32, i32* %data, align 4, !dbg !223
  %cmp = icmp sge i32 %3, 0, !dbg !225
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !226

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !227
  %idxprom = sext i32 %4 to i64, !dbg !229
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !229
  store i32 1, i32* %arrayidx, align 4, !dbg !230
  store i32 0, i32* %i, align 4, !dbg !231
  br label %for.cond, !dbg !233

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !234
  %cmp4 = icmp slt i32 %5, 10, !dbg !236
  br i1 %cmp4, label %for.body, label %for.end, !dbg !237

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !238
  %idxprom5 = sext i32 %6 to i64, !dbg !240
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !240
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !240
  call void @printIntLine(i32 %7), !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !243
  %inc = add nsw i32 %8, 1, !dbg !243
  store i32 %inc, i32* %i, align 4, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !247

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !248
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !250

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !251
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !252 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %data, align 4, !dbg !255
  %0 = load i32, i32* @staticTrue, align 4, !dbg !256
  %tobool = icmp ne i32 %0, 0, !dbg !256
  br i1 %tobool, label %if.then, label %if.end, !dbg !258

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !259
  br label %if.end, !dbg !261

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !262
  %tobool1 = icmp ne i32 %1, 0, !dbg !262
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !264

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !265, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !269, metadata !DIExpression()), !dbg !270
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !270
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !270
  %3 = load i32, i32* %data, align 4, !dbg !271
  %cmp = icmp sge i32 %3, 0, !dbg !273
  br i1 %cmp, label %if.then3, label %if.else, !dbg !274

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !275
  %idxprom = sext i32 %4 to i64, !dbg !277
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !277
  store i32 1, i32* %arrayidx, align 4, !dbg !278
  store i32 0, i32* %i, align 4, !dbg !279
  br label %for.cond, !dbg !281

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !282
  %cmp4 = icmp slt i32 %5, 10, !dbg !284
  br i1 %cmp4, label %for.body, label %for.end, !dbg !285

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !286
  %idxprom5 = sext i32 %6 to i64, !dbg !288
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !288
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !288
  call void @printIntLine(i32 %7), !dbg !289
  br label %for.inc, !dbg !290

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !291
  %inc = add nsw i32 %8, 1, !dbg !291
  store i32 %inc, i32* %i, align 4, !dbg !291
  br label %for.cond, !dbg !292, !llvm.loop !293

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !295

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !296
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !298

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !299
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !11)
!22 = !DILocation(line: 30, column: 9, scope: !18)
!23 = !DILocation(line: 32, column: 10, scope: !18)
!24 = !DILocation(line: 33, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!26 = !DILocation(line: 33, column: 8, scope: !18)
!27 = !DILocation(line: 36, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !10, line: 34, column: 5)
!29 = !DILocation(line: 37, column: 5, scope: !28)
!30 = !DILocation(line: 38, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !18, file: !10, line: 38, column: 8)
!32 = !DILocation(line: 38, column: 8, scope: !18)
!33 = !DILocalVariable(name: "i", scope: !34, file: !10, line: 41, type: !11)
!34 = distinct !DILexicalBlock(scope: !35, file: !10, line: 40, column: 9)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 39, column: 5)
!36 = !DILocation(line: 41, column: 17, scope: !34)
!37 = !DILocalVariable(name: "buffer", scope: !34, file: !10, line: 42, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 10)
!41 = !DILocation(line: 42, column: 17, scope: !34)
!42 = !DILocation(line: 45, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !10, line: 45, column: 17)
!44 = !DILocation(line: 45, column: 22, scope: !43)
!45 = !DILocation(line: 45, column: 17, scope: !34)
!46 = !DILocation(line: 47, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !10, line: 46, column: 13)
!48 = !DILocation(line: 47, column: 17, scope: !47)
!49 = !DILocation(line: 47, column: 30, scope: !47)
!50 = !DILocation(line: 49, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !10, line: 49, column: 17)
!52 = !DILocation(line: 49, column: 21, scope: !51)
!53 = !DILocation(line: 49, column: 28, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !10, line: 49, column: 17)
!55 = !DILocation(line: 49, column: 30, scope: !54)
!56 = !DILocation(line: 49, column: 17, scope: !51)
!57 = !DILocation(line: 51, column: 41, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !10, line: 50, column: 17)
!59 = !DILocation(line: 51, column: 34, scope: !58)
!60 = !DILocation(line: 51, column: 21, scope: !58)
!61 = !DILocation(line: 52, column: 17, scope: !58)
!62 = !DILocation(line: 49, column: 37, scope: !54)
!63 = !DILocation(line: 49, column: 17, scope: !54)
!64 = distinct !{!64, !56, !65, !66}
!65 = !DILocation(line: 52, column: 17, scope: !51)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 53, column: 13, scope: !47)
!68 = !DILocation(line: 56, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !43, file: !10, line: 55, column: 13)
!70 = !DILocation(line: 59, column: 5, scope: !35)
!71 = !DILocation(line: 60, column: 1, scope: !18)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_good", scope: !10, file: !10, line: 216, type: !19, scopeLine: 217, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 218, column: 5, scope: !72)
!74 = !DILocation(line: 219, column: 5, scope: !72)
!75 = !DILocation(line: 220, column: 5, scope: !72)
!76 = !DILocation(line: 221, column: 5, scope: !72)
!77 = !DILocation(line: 222, column: 1, scope: !72)
!78 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 233, type: !79, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!11, !11, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !10, line: 233, type: !11)
!85 = !DILocation(line: 233, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !10, line: 233, type: !81)
!87 = !DILocation(line: 233, column: 27, scope: !78)
!88 = !DILocation(line: 236, column: 22, scope: !78)
!89 = !DILocation(line: 236, column: 12, scope: !78)
!90 = !DILocation(line: 236, column: 5, scope: !78)
!91 = !DILocation(line: 238, column: 5, scope: !78)
!92 = !DILocation(line: 239, column: 5, scope: !78)
!93 = !DILocation(line: 240, column: 5, scope: !78)
!94 = !DILocation(line: 243, column: 5, scope: !78)
!95 = !DILocation(line: 244, column: 5, scope: !78)
!96 = !DILocation(line: 245, column: 5, scope: !78)
!97 = !DILocation(line: 247, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 67, type: !19, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !10, line: 69, type: !11)
!100 = !DILocation(line: 69, column: 9, scope: !98)
!101 = !DILocation(line: 71, column: 10, scope: !98)
!102 = !DILocation(line: 72, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !10, line: 72, column: 8)
!104 = !DILocation(line: 72, column: 8, scope: !98)
!105 = !DILocation(line: 75, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !10, line: 73, column: 5)
!107 = !DILocation(line: 76, column: 5, scope: !106)
!108 = !DILocation(line: 77, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !98, file: !10, line: 77, column: 8)
!110 = !DILocation(line: 77, column: 8, scope: !98)
!111 = !DILocation(line: 80, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !10, line: 78, column: 5)
!113 = !DILocation(line: 81, column: 5, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !115, file: !10, line: 85, type: !11)
!115 = distinct !DILexicalBlock(scope: !116, file: !10, line: 84, column: 9)
!116 = distinct !DILexicalBlock(scope: !109, file: !10, line: 83, column: 5)
!117 = !DILocation(line: 85, column: 17, scope: !115)
!118 = !DILocalVariable(name: "buffer", scope: !115, file: !10, line: 86, type: !38)
!119 = !DILocation(line: 86, column: 17, scope: !115)
!120 = !DILocation(line: 88, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !10, line: 88, column: 17)
!122 = !DILocation(line: 88, column: 22, scope: !121)
!123 = !DILocation(line: 88, column: 27, scope: !121)
!124 = !DILocation(line: 88, column: 30, scope: !121)
!125 = !DILocation(line: 88, column: 35, scope: !121)
!126 = !DILocation(line: 88, column: 17, scope: !115)
!127 = !DILocation(line: 90, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !10, line: 89, column: 13)
!129 = !DILocation(line: 90, column: 17, scope: !128)
!130 = !DILocation(line: 90, column: 30, scope: !128)
!131 = !DILocation(line: 92, column: 23, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !10, line: 92, column: 17)
!133 = !DILocation(line: 92, column: 21, scope: !132)
!134 = !DILocation(line: 92, column: 28, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !10, line: 92, column: 17)
!136 = !DILocation(line: 92, column: 30, scope: !135)
!137 = !DILocation(line: 92, column: 17, scope: !132)
!138 = !DILocation(line: 94, column: 41, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !10, line: 93, column: 17)
!140 = !DILocation(line: 94, column: 34, scope: !139)
!141 = !DILocation(line: 94, column: 21, scope: !139)
!142 = !DILocation(line: 95, column: 17, scope: !139)
!143 = !DILocation(line: 92, column: 37, scope: !135)
!144 = !DILocation(line: 92, column: 17, scope: !135)
!145 = distinct !{!145, !137, !146, !66}
!146 = !DILocation(line: 95, column: 17, scope: !132)
!147 = !DILocation(line: 96, column: 13, scope: !128)
!148 = !DILocation(line: 99, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !121, file: !10, line: 98, column: 13)
!150 = !DILocation(line: 103, column: 1, scope: !98)
!151 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 106, type: !19, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!152 = !DILocalVariable(name: "data", scope: !151, file: !10, line: 108, type: !11)
!153 = !DILocation(line: 108, column: 9, scope: !151)
!154 = !DILocation(line: 110, column: 10, scope: !151)
!155 = !DILocation(line: 111, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !10, line: 111, column: 8)
!157 = !DILocation(line: 111, column: 8, scope: !151)
!158 = !DILocation(line: 114, column: 14, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !10, line: 112, column: 5)
!160 = !DILocation(line: 115, column: 5, scope: !159)
!161 = !DILocation(line: 116, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !151, file: !10, line: 116, column: 8)
!163 = !DILocation(line: 116, column: 8, scope: !151)
!164 = !DILocalVariable(name: "i", scope: !165, file: !10, line: 119, type: !11)
!165 = distinct !DILexicalBlock(scope: !166, file: !10, line: 118, column: 9)
!166 = distinct !DILexicalBlock(scope: !162, file: !10, line: 117, column: 5)
!167 = !DILocation(line: 119, column: 17, scope: !165)
!168 = !DILocalVariable(name: "buffer", scope: !165, file: !10, line: 120, type: !38)
!169 = !DILocation(line: 120, column: 17, scope: !165)
!170 = !DILocation(line: 122, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !165, file: !10, line: 122, column: 17)
!172 = !DILocation(line: 122, column: 22, scope: !171)
!173 = !DILocation(line: 122, column: 27, scope: !171)
!174 = !DILocation(line: 122, column: 30, scope: !171)
!175 = !DILocation(line: 122, column: 35, scope: !171)
!176 = !DILocation(line: 122, column: 17, scope: !165)
!177 = !DILocation(line: 124, column: 24, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !10, line: 123, column: 13)
!179 = !DILocation(line: 124, column: 17, scope: !178)
!180 = !DILocation(line: 124, column: 30, scope: !178)
!181 = !DILocation(line: 126, column: 23, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !10, line: 126, column: 17)
!183 = !DILocation(line: 126, column: 21, scope: !182)
!184 = !DILocation(line: 126, column: 28, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !10, line: 126, column: 17)
!186 = !DILocation(line: 126, column: 30, scope: !185)
!187 = !DILocation(line: 126, column: 17, scope: !182)
!188 = !DILocation(line: 128, column: 41, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !10, line: 127, column: 17)
!190 = !DILocation(line: 128, column: 34, scope: !189)
!191 = !DILocation(line: 128, column: 21, scope: !189)
!192 = !DILocation(line: 129, column: 17, scope: !189)
!193 = !DILocation(line: 126, column: 37, scope: !185)
!194 = !DILocation(line: 126, column: 17, scope: !185)
!195 = distinct !{!195, !187, !196, !66}
!196 = !DILocation(line: 129, column: 17, scope: !182)
!197 = !DILocation(line: 130, column: 13, scope: !178)
!198 = !DILocation(line: 133, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !171, file: !10, line: 132, column: 13)
!200 = !DILocation(line: 136, column: 5, scope: !166)
!201 = !DILocation(line: 137, column: 1, scope: !151)
!202 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 140, type: !19, scopeLine: 141, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!203 = !DILocalVariable(name: "data", scope: !202, file: !10, line: 142, type: !11)
!204 = !DILocation(line: 142, column: 9, scope: !202)
!205 = !DILocation(line: 144, column: 10, scope: !202)
!206 = !DILocation(line: 145, column: 8, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !10, line: 145, column: 8)
!208 = !DILocation(line: 145, column: 8, scope: !202)
!209 = !DILocation(line: 148, column: 9, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !10, line: 146, column: 5)
!211 = !DILocation(line: 149, column: 5, scope: !210)
!212 = !DILocation(line: 154, column: 14, scope: !213)
!213 = distinct !DILexicalBlock(scope: !207, file: !10, line: 151, column: 5)
!214 = !DILocation(line: 156, column: 8, scope: !215)
!215 = distinct !DILexicalBlock(scope: !202, file: !10, line: 156, column: 8)
!216 = !DILocation(line: 156, column: 8, scope: !202)
!217 = !DILocalVariable(name: "i", scope: !218, file: !10, line: 159, type: !11)
!218 = distinct !DILexicalBlock(scope: !219, file: !10, line: 158, column: 9)
!219 = distinct !DILexicalBlock(scope: !215, file: !10, line: 157, column: 5)
!220 = !DILocation(line: 159, column: 17, scope: !218)
!221 = !DILocalVariable(name: "buffer", scope: !218, file: !10, line: 160, type: !38)
!222 = !DILocation(line: 160, column: 17, scope: !218)
!223 = !DILocation(line: 163, column: 17, scope: !224)
!224 = distinct !DILexicalBlock(scope: !218, file: !10, line: 163, column: 17)
!225 = !DILocation(line: 163, column: 22, scope: !224)
!226 = !DILocation(line: 163, column: 17, scope: !218)
!227 = !DILocation(line: 165, column: 24, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !10, line: 164, column: 13)
!229 = !DILocation(line: 165, column: 17, scope: !228)
!230 = !DILocation(line: 165, column: 30, scope: !228)
!231 = !DILocation(line: 167, column: 23, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !10, line: 167, column: 17)
!233 = !DILocation(line: 167, column: 21, scope: !232)
!234 = !DILocation(line: 167, column: 28, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !10, line: 167, column: 17)
!236 = !DILocation(line: 167, column: 30, scope: !235)
!237 = !DILocation(line: 167, column: 17, scope: !232)
!238 = !DILocation(line: 169, column: 41, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !10, line: 168, column: 17)
!240 = !DILocation(line: 169, column: 34, scope: !239)
!241 = !DILocation(line: 169, column: 21, scope: !239)
!242 = !DILocation(line: 170, column: 17, scope: !239)
!243 = !DILocation(line: 167, column: 37, scope: !235)
!244 = !DILocation(line: 167, column: 17, scope: !235)
!245 = distinct !{!245, !237, !246, !66}
!246 = !DILocation(line: 170, column: 17, scope: !232)
!247 = !DILocation(line: 171, column: 13, scope: !228)
!248 = !DILocation(line: 174, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !224, file: !10, line: 173, column: 13)
!250 = !DILocation(line: 177, column: 5, scope: !219)
!251 = !DILocation(line: 178, column: 1, scope: !202)
!252 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 181, type: !19, scopeLine: 182, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!253 = !DILocalVariable(name: "data", scope: !252, file: !10, line: 183, type: !11)
!254 = !DILocation(line: 183, column: 9, scope: !252)
!255 = !DILocation(line: 185, column: 10, scope: !252)
!256 = !DILocation(line: 186, column: 8, scope: !257)
!257 = distinct !DILexicalBlock(scope: !252, file: !10, line: 186, column: 8)
!258 = !DILocation(line: 186, column: 8, scope: !252)
!259 = !DILocation(line: 190, column: 14, scope: !260)
!260 = distinct !DILexicalBlock(scope: !257, file: !10, line: 187, column: 5)
!261 = !DILocation(line: 191, column: 5, scope: !260)
!262 = !DILocation(line: 192, column: 8, scope: !263)
!263 = distinct !DILexicalBlock(scope: !252, file: !10, line: 192, column: 8)
!264 = !DILocation(line: 192, column: 8, scope: !252)
!265 = !DILocalVariable(name: "i", scope: !266, file: !10, line: 195, type: !11)
!266 = distinct !DILexicalBlock(scope: !267, file: !10, line: 194, column: 9)
!267 = distinct !DILexicalBlock(scope: !263, file: !10, line: 193, column: 5)
!268 = !DILocation(line: 195, column: 17, scope: !266)
!269 = !DILocalVariable(name: "buffer", scope: !266, file: !10, line: 196, type: !38)
!270 = !DILocation(line: 196, column: 17, scope: !266)
!271 = !DILocation(line: 199, column: 17, scope: !272)
!272 = distinct !DILexicalBlock(scope: !266, file: !10, line: 199, column: 17)
!273 = !DILocation(line: 199, column: 22, scope: !272)
!274 = !DILocation(line: 199, column: 17, scope: !266)
!275 = !DILocation(line: 201, column: 24, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !10, line: 200, column: 13)
!277 = !DILocation(line: 201, column: 17, scope: !276)
!278 = !DILocation(line: 201, column: 30, scope: !276)
!279 = !DILocation(line: 203, column: 23, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !10, line: 203, column: 17)
!281 = !DILocation(line: 203, column: 21, scope: !280)
!282 = !DILocation(line: 203, column: 28, scope: !283)
!283 = distinct !DILexicalBlock(scope: !280, file: !10, line: 203, column: 17)
!284 = !DILocation(line: 203, column: 30, scope: !283)
!285 = !DILocation(line: 203, column: 17, scope: !280)
!286 = !DILocation(line: 205, column: 41, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !10, line: 204, column: 17)
!288 = !DILocation(line: 205, column: 34, scope: !287)
!289 = !DILocation(line: 205, column: 21, scope: !287)
!290 = !DILocation(line: 206, column: 17, scope: !287)
!291 = !DILocation(line: 203, column: 37, scope: !283)
!292 = !DILocation(line: 203, column: 17, scope: !283)
!293 = distinct !{!293, !285, !294, !66}
!294 = !DILocation(line: 206, column: 17, scope: !280)
!295 = !DILocation(line: 207, column: 13, scope: !276)
!296 = !DILocation(line: 210, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !272, file: !10, line: 209, column: 13)
!298 = !DILocation(line: 213, column: 5, scope: !267)
!299 = !DILocation(line: 214, column: 1, scope: !252)
