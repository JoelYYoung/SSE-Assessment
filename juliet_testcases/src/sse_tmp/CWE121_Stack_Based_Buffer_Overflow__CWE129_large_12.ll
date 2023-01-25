; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i11 = alloca i32, align 4
  %buffer12 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !19
  %tobool = icmp ne i32 %call, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.else, !dbg !21

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !22
  br label %if.end, !dbg !24

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !25
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool2 = icmp ne i32 %call1, 0, !dbg !27
  br i1 %tobool2, label %if.then3, label %if.else10, !dbg !29

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !34, metadata !DIExpression()), !dbg !38
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !38
  %1 = load i32, i32* %data, align 4, !dbg !39
  %cmp = icmp sge i32 %1, 0, !dbg !41
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !42

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !43
  %idxprom = sext i32 %2 to i64, !dbg !45
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !45
  store i32 1, i32* %arrayidx, align 4, !dbg !46
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !50
  %cmp5 = icmp slt i32 %3, 10, !dbg !52
  br i1 %cmp5, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !54
  %idxprom6 = sext i32 %4 to i64, !dbg !56
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !56
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !56
  call void @printIntLine(i32 %5), !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %6, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !64

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !65
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end28, !dbg !67

if.else10:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !68, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer12, metadata !72, metadata !DIExpression()), !dbg !73
  %7 = bitcast [10 x i32]* %buffer12 to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !73
  %8 = load i32, i32* %data, align 4, !dbg !74
  %cmp13 = icmp sge i32 %8, 0, !dbg !76
  br i1 %cmp13, label %land.lhs.true, label %if.else26, !dbg !77

land.lhs.true:                                    ; preds = %if.else10
  %9 = load i32, i32* %data, align 4, !dbg !78
  %cmp14 = icmp slt i32 %9, 10, !dbg !79
  br i1 %cmp14, label %if.then15, label %if.else26, !dbg !80

if.then15:                                        ; preds = %land.lhs.true
  %10 = load i32, i32* %data, align 4, !dbg !81
  %idxprom16 = sext i32 %10 to i64, !dbg !83
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom16, !dbg !83
  store i32 1, i32* %arrayidx17, align 4, !dbg !84
  store i32 0, i32* %i11, align 4, !dbg !85
  br label %for.cond18, !dbg !87

for.cond18:                                       ; preds = %for.inc23, %if.then15
  %11 = load i32, i32* %i11, align 4, !dbg !88
  %cmp19 = icmp slt i32 %11, 10, !dbg !90
  br i1 %cmp19, label %for.body20, label %for.end25, !dbg !91

for.body20:                                       ; preds = %for.cond18
  %12 = load i32, i32* %i11, align 4, !dbg !92
  %idxprom21 = sext i32 %12 to i64, !dbg !94
  %arrayidx22 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom21, !dbg !94
  %13 = load i32, i32* %arrayidx22, align 4, !dbg !94
  call void @printIntLine(i32 %13), !dbg !95
  br label %for.inc23, !dbg !96

for.inc23:                                        ; preds = %for.body20
  %14 = load i32, i32* %i11, align 4, !dbg !97
  %inc24 = add nsw i32 %14, 1, !dbg !97
  store i32 %inc24, i32* %i11, align 4, !dbg !97
  br label %for.cond18, !dbg !98, !llvm.loop !99

for.end25:                                        ; preds = %for.cond18
  br label %if.end27, !dbg !101

if.else26:                                        ; preds = %land.lhs.true, %if.else10
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %for.end25
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end9
  ret void, !dbg !104
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12_good() #0 !dbg !105 {
entry:
  call void @goodB2G(), !dbg !106
  call void @goodG2B(), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i64 @time(i64* null) #5, !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 %conv) #5, !dbg !121
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !122
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12_good(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !125
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12_bad(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !129 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i12 = alloca i32, align 4
  %buffer13 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i32 -1, i32* %data, align 4, !dbg !132
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !133
  %tobool = icmp ne i32 %call, 0, !dbg !133
  br i1 %tobool, label %if.then, label %if.else, !dbg !135

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !136
  br label %if.end, !dbg !138

if.else:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !141
  %tobool2 = icmp ne i32 %call1, 0, !dbg !141
  br i1 %tobool2, label %if.then3, label %if.else11, !dbg !143

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !144, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !149
  %1 = load i32, i32* %data, align 4, !dbg !150
  %cmp = icmp sge i32 %1, 0, !dbg !152
  br i1 %cmp, label %land.lhs.true, label %if.else9, !dbg !153

land.lhs.true:                                    ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !154
  %cmp4 = icmp slt i32 %2, 10, !dbg !155
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !156

if.then5:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !157
  %idxprom = sext i32 %3 to i64, !dbg !159
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !159
  store i32 1, i32* %arrayidx, align 4, !dbg !160
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %if.then5
  %4 = load i32, i32* %i, align 4, !dbg !164
  %cmp6 = icmp slt i32 %4, 10, !dbg !166
  br i1 %cmp6, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !168
  %idxprom7 = sext i32 %5 to i64, !dbg !170
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !170
  %6 = load i32, i32* %arrayidx8, align 4, !dbg !170
  call void @printIntLine(i32 %6), !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !173
  %inc = add nsw i32 %7, 1, !dbg !173
  store i32 %inc, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !177

if.else9:                                         ; preds = %land.lhs.true, %if.then3
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !178
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %if.end30, !dbg !180

if.else11:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i12, metadata !181, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer13, metadata !185, metadata !DIExpression()), !dbg !186
  %8 = bitcast [10 x i32]* %buffer13 to i8*, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !186
  %9 = load i32, i32* %data, align 4, !dbg !187
  %cmp14 = icmp sge i32 %9, 0, !dbg !189
  br i1 %cmp14, label %land.lhs.true15, label %if.else28, !dbg !190

land.lhs.true15:                                  ; preds = %if.else11
  %10 = load i32, i32* %data, align 4, !dbg !191
  %cmp16 = icmp slt i32 %10, 10, !dbg !192
  br i1 %cmp16, label %if.then17, label %if.else28, !dbg !193

if.then17:                                        ; preds = %land.lhs.true15
  %11 = load i32, i32* %data, align 4, !dbg !194
  %idxprom18 = sext i32 %11 to i64, !dbg !196
  %arrayidx19 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer13, i64 0, i64 %idxprom18, !dbg !196
  store i32 1, i32* %arrayidx19, align 4, !dbg !197
  store i32 0, i32* %i12, align 4, !dbg !198
  br label %for.cond20, !dbg !200

for.cond20:                                       ; preds = %for.inc25, %if.then17
  %12 = load i32, i32* %i12, align 4, !dbg !201
  %cmp21 = icmp slt i32 %12, 10, !dbg !203
  br i1 %cmp21, label %for.body22, label %for.end27, !dbg !204

for.body22:                                       ; preds = %for.cond20
  %13 = load i32, i32* %i12, align 4, !dbg !205
  %idxprom23 = sext i32 %13 to i64, !dbg !207
  %arrayidx24 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer13, i64 0, i64 %idxprom23, !dbg !207
  %14 = load i32, i32* %arrayidx24, align 4, !dbg !207
  call void @printIntLine(i32 %14), !dbg !208
  br label %for.inc25, !dbg !209

for.inc25:                                        ; preds = %for.body22
  %15 = load i32, i32* %i12, align 4, !dbg !210
  %inc26 = add nsw i32 %15, 1, !dbg !210
  store i32 %inc26, i32* %i12, align 4, !dbg !210
  br label %for.cond20, !dbg !211, !llvm.loop !212

for.end27:                                        ; preds = %for.cond20
  br label %if.end29, !dbg !214

if.else28:                                        ; preds = %land.lhs.true15, %if.else11
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !215
  br label %if.end29

if.end29:                                         ; preds = %if.else28, %for.end27
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.end10
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !218 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i11 = alloca i32, align 4
  %buffer12 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 -1, i32* %data, align 4, !dbg !221
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !222
  %tobool = icmp ne i32 %call, 0, !dbg !222
  br i1 %tobool, label %if.then, label %if.else, !dbg !224

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !225
  br label %if.end, !dbg !227

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !228
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !230
  %tobool2 = icmp ne i32 %call1, 0, !dbg !230
  br i1 %tobool2, label %if.then3, label %if.else10, !dbg !232

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !233, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !237, metadata !DIExpression()), !dbg !238
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !238
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !238
  %1 = load i32, i32* %data, align 4, !dbg !239
  %cmp = icmp sge i32 %1, 0, !dbg !241
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !242

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !243
  %idxprom = sext i32 %2 to i64, !dbg !245
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !245
  store i32 1, i32* %arrayidx, align 4, !dbg !246
  store i32 0, i32* %i, align 4, !dbg !247
  br label %for.cond, !dbg !249

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !250
  %cmp5 = icmp slt i32 %3, 10, !dbg !252
  br i1 %cmp5, label %for.body, label %for.end, !dbg !253

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !254
  %idxprom6 = sext i32 %4 to i64, !dbg !256
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !256
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !256
  call void @printIntLine(i32 %5), !dbg !257
  br label %for.inc, !dbg !258

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !259
  %inc = add nsw i32 %6, 1, !dbg !259
  store i32 %inc, i32* %i, align 4, !dbg !259
  br label %for.cond, !dbg !260, !llvm.loop !261

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !263

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !264
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end27, !dbg !266

if.else10:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !267, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer12, metadata !271, metadata !DIExpression()), !dbg !272
  %7 = bitcast [10 x i32]* %buffer12 to i8*, !dbg !272
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !272
  %8 = load i32, i32* %data, align 4, !dbg !273
  %cmp13 = icmp sge i32 %8, 0, !dbg !275
  br i1 %cmp13, label %if.then14, label %if.else25, !dbg !276

if.then14:                                        ; preds = %if.else10
  %9 = load i32, i32* %data, align 4, !dbg !277
  %idxprom15 = sext i32 %9 to i64, !dbg !279
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom15, !dbg !279
  store i32 1, i32* %arrayidx16, align 4, !dbg !280
  store i32 0, i32* %i11, align 4, !dbg !281
  br label %for.cond17, !dbg !283

for.cond17:                                       ; preds = %for.inc22, %if.then14
  %10 = load i32, i32* %i11, align 4, !dbg !284
  %cmp18 = icmp slt i32 %10, 10, !dbg !286
  br i1 %cmp18, label %for.body19, label %for.end24, !dbg !287

for.body19:                                       ; preds = %for.cond17
  %11 = load i32, i32* %i11, align 4, !dbg !288
  %idxprom20 = sext i32 %11 to i64, !dbg !290
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom20, !dbg !290
  %12 = load i32, i32* %arrayidx21, align 4, !dbg !290
  call void @printIntLine(i32 %12), !dbg !291
  br label %for.inc22, !dbg !292

for.inc22:                                        ; preds = %for.body19
  %13 = load i32, i32* %i11, align 4, !dbg !293
  %inc23 = add nsw i32 %13, 1, !dbg !293
  store i32 %inc23, i32* %i11, align 4, !dbg !293
  br label %for.cond17, !dbg !294, !llvm.loop !295

for.end24:                                        ; preds = %for.cond17
  br label %if.end26, !dbg !297

if.else25:                                        ; preds = %if.else10
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !298
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end24
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end9
  ret void, !dbg !300
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!25 = !DILocation(line: 36, column: 14, scope: !26)
!26 = distinct !DILexicalBlock(scope: !20, file: !12, line: 33, column: 5)
!27 = !DILocation(line: 38, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 8)
!29 = !DILocation(line: 38, column: 8, scope: !11)
!30 = !DILocalVariable(name: "i", scope: !31, file: !12, line: 41, type: !16)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 40, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 39, column: 5)
!33 = !DILocation(line: 41, column: 17, scope: !31)
!34 = !DILocalVariable(name: "buffer", scope: !31, file: !12, line: 42, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 42, column: 17, scope: !31)
!39 = !DILocation(line: 45, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !31, file: !12, line: 45, column: 17)
!41 = !DILocation(line: 45, column: 22, scope: !40)
!42 = !DILocation(line: 45, column: 17, scope: !31)
!43 = !DILocation(line: 47, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 46, column: 13)
!45 = !DILocation(line: 47, column: 17, scope: !44)
!46 = !DILocation(line: 47, column: 30, scope: !44)
!47 = !DILocation(line: 49, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 49, column: 17)
!49 = !DILocation(line: 49, column: 21, scope: !48)
!50 = !DILocation(line: 49, column: 28, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 49, column: 17)
!52 = !DILocation(line: 49, column: 30, scope: !51)
!53 = !DILocation(line: 49, column: 17, scope: !48)
!54 = !DILocation(line: 51, column: 41, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 50, column: 17)
!56 = !DILocation(line: 51, column: 34, scope: !55)
!57 = !DILocation(line: 51, column: 21, scope: !55)
!58 = !DILocation(line: 52, column: 17, scope: !55)
!59 = !DILocation(line: 49, column: 37, scope: !51)
!60 = !DILocation(line: 49, column: 17, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 52, column: 17, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 53, column: 13, scope: !44)
!65 = !DILocation(line: 56, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !40, file: !12, line: 55, column: 13)
!67 = !DILocation(line: 59, column: 5, scope: !32)
!68 = !DILocalVariable(name: "i", scope: !69, file: !12, line: 63, type: !16)
!69 = distinct !DILexicalBlock(scope: !70, file: !12, line: 62, column: 9)
!70 = distinct !DILexicalBlock(scope: !28, file: !12, line: 61, column: 5)
!71 = !DILocation(line: 63, column: 17, scope: !69)
!72 = !DILocalVariable(name: "buffer", scope: !69, file: !12, line: 64, type: !35)
!73 = !DILocation(line: 64, column: 17, scope: !69)
!74 = !DILocation(line: 66, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !12, line: 66, column: 17)
!76 = !DILocation(line: 66, column: 22, scope: !75)
!77 = !DILocation(line: 66, column: 27, scope: !75)
!78 = !DILocation(line: 66, column: 30, scope: !75)
!79 = !DILocation(line: 66, column: 35, scope: !75)
!80 = !DILocation(line: 66, column: 17, scope: !69)
!81 = !DILocation(line: 68, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !12, line: 67, column: 13)
!83 = !DILocation(line: 68, column: 17, scope: !82)
!84 = !DILocation(line: 68, column: 30, scope: !82)
!85 = !DILocation(line: 70, column: 23, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !12, line: 70, column: 17)
!87 = !DILocation(line: 70, column: 21, scope: !86)
!88 = !DILocation(line: 70, column: 28, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 70, column: 17)
!90 = !DILocation(line: 70, column: 30, scope: !89)
!91 = !DILocation(line: 70, column: 17, scope: !86)
!92 = !DILocation(line: 72, column: 41, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !12, line: 71, column: 17)
!94 = !DILocation(line: 72, column: 34, scope: !93)
!95 = !DILocation(line: 72, column: 21, scope: !93)
!96 = !DILocation(line: 73, column: 17, scope: !93)
!97 = !DILocation(line: 70, column: 37, scope: !89)
!98 = !DILocation(line: 70, column: 17, scope: !89)
!99 = distinct !{!99, !91, !100, !63}
!100 = !DILocation(line: 73, column: 17, scope: !86)
!101 = !DILocation(line: 74, column: 13, scope: !82)
!102 = !DILocation(line: 77, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !75, file: !12, line: 76, column: 13)
!104 = !DILocation(line: 81, column: 1, scope: !11)
!105 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_12_good", scope: !12, file: !12, line: 215, type: !13, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 217, column: 5, scope: !105)
!107 = !DILocation(line: 218, column: 5, scope: !105)
!108 = !DILocation(line: 219, column: 1, scope: !105)
!109 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 230, type: !110, scopeLine: 231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!16, !16, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !12, line: 230, type: !16)
!116 = !DILocation(line: 230, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !12, line: 230, type: !112)
!118 = !DILocation(line: 230, column: 27, scope: !109)
!119 = !DILocation(line: 233, column: 22, scope: !109)
!120 = !DILocation(line: 233, column: 12, scope: !109)
!121 = !DILocation(line: 233, column: 5, scope: !109)
!122 = !DILocation(line: 235, column: 5, scope: !109)
!123 = !DILocation(line: 236, column: 5, scope: !109)
!124 = !DILocation(line: 237, column: 5, scope: !109)
!125 = !DILocation(line: 240, column: 5, scope: !109)
!126 = !DILocation(line: 241, column: 5, scope: !109)
!127 = !DILocation(line: 242, column: 5, scope: !109)
!128 = !DILocation(line: 244, column: 5, scope: !109)
!129 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !12, line: 92, type: !16)
!131 = !DILocation(line: 92, column: 9, scope: !129)
!132 = !DILocation(line: 94, column: 10, scope: !129)
!133 = !DILocation(line: 95, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !12, line: 95, column: 8)
!135 = !DILocation(line: 95, column: 8, scope: !129)
!136 = !DILocation(line: 98, column: 14, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 96, column: 5)
!138 = !DILocation(line: 99, column: 5, scope: !137)
!139 = !DILocation(line: 103, column: 14, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !12, line: 101, column: 5)
!141 = !DILocation(line: 105, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !129, file: !12, line: 105, column: 8)
!143 = !DILocation(line: 105, column: 8, scope: !129)
!144 = !DILocalVariable(name: "i", scope: !145, file: !12, line: 108, type: !16)
!145 = distinct !DILexicalBlock(scope: !146, file: !12, line: 107, column: 9)
!146 = distinct !DILexicalBlock(scope: !142, file: !12, line: 106, column: 5)
!147 = !DILocation(line: 108, column: 17, scope: !145)
!148 = !DILocalVariable(name: "buffer", scope: !145, file: !12, line: 109, type: !35)
!149 = !DILocation(line: 109, column: 17, scope: !145)
!150 = !DILocation(line: 111, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !12, line: 111, column: 17)
!152 = !DILocation(line: 111, column: 22, scope: !151)
!153 = !DILocation(line: 111, column: 27, scope: !151)
!154 = !DILocation(line: 111, column: 30, scope: !151)
!155 = !DILocation(line: 111, column: 35, scope: !151)
!156 = !DILocation(line: 111, column: 17, scope: !145)
!157 = !DILocation(line: 113, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !12, line: 112, column: 13)
!159 = !DILocation(line: 113, column: 17, scope: !158)
!160 = !DILocation(line: 113, column: 30, scope: !158)
!161 = !DILocation(line: 115, column: 23, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 115, column: 17)
!163 = !DILocation(line: 115, column: 21, scope: !162)
!164 = !DILocation(line: 115, column: 28, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !12, line: 115, column: 17)
!166 = !DILocation(line: 115, column: 30, scope: !165)
!167 = !DILocation(line: 115, column: 17, scope: !162)
!168 = !DILocation(line: 117, column: 41, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !12, line: 116, column: 17)
!170 = !DILocation(line: 117, column: 34, scope: !169)
!171 = !DILocation(line: 117, column: 21, scope: !169)
!172 = !DILocation(line: 118, column: 17, scope: !169)
!173 = !DILocation(line: 115, column: 37, scope: !165)
!174 = !DILocation(line: 115, column: 17, scope: !165)
!175 = distinct !{!175, !167, !176, !63}
!176 = !DILocation(line: 118, column: 17, scope: !162)
!177 = !DILocation(line: 119, column: 13, scope: !158)
!178 = !DILocation(line: 122, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !151, file: !12, line: 121, column: 13)
!180 = !DILocation(line: 125, column: 5, scope: !146)
!181 = !DILocalVariable(name: "i", scope: !182, file: !12, line: 129, type: !16)
!182 = distinct !DILexicalBlock(scope: !183, file: !12, line: 128, column: 9)
!183 = distinct !DILexicalBlock(scope: !142, file: !12, line: 127, column: 5)
!184 = !DILocation(line: 129, column: 17, scope: !182)
!185 = !DILocalVariable(name: "buffer", scope: !182, file: !12, line: 130, type: !35)
!186 = !DILocation(line: 130, column: 17, scope: !182)
!187 = !DILocation(line: 132, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !182, file: !12, line: 132, column: 17)
!189 = !DILocation(line: 132, column: 22, scope: !188)
!190 = !DILocation(line: 132, column: 27, scope: !188)
!191 = !DILocation(line: 132, column: 30, scope: !188)
!192 = !DILocation(line: 132, column: 35, scope: !188)
!193 = !DILocation(line: 132, column: 17, scope: !182)
!194 = !DILocation(line: 134, column: 24, scope: !195)
!195 = distinct !DILexicalBlock(scope: !188, file: !12, line: 133, column: 13)
!196 = !DILocation(line: 134, column: 17, scope: !195)
!197 = !DILocation(line: 134, column: 30, scope: !195)
!198 = !DILocation(line: 136, column: 23, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !12, line: 136, column: 17)
!200 = !DILocation(line: 136, column: 21, scope: !199)
!201 = !DILocation(line: 136, column: 28, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !12, line: 136, column: 17)
!203 = !DILocation(line: 136, column: 30, scope: !202)
!204 = !DILocation(line: 136, column: 17, scope: !199)
!205 = !DILocation(line: 138, column: 41, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !12, line: 137, column: 17)
!207 = !DILocation(line: 138, column: 34, scope: !206)
!208 = !DILocation(line: 138, column: 21, scope: !206)
!209 = !DILocation(line: 139, column: 17, scope: !206)
!210 = !DILocation(line: 136, column: 37, scope: !202)
!211 = !DILocation(line: 136, column: 17, scope: !202)
!212 = distinct !{!212, !204, !213, !63}
!213 = !DILocation(line: 139, column: 17, scope: !199)
!214 = !DILocation(line: 140, column: 13, scope: !195)
!215 = !DILocation(line: 143, column: 17, scope: !216)
!216 = distinct !DILexicalBlock(scope: !188, file: !12, line: 142, column: 13)
!217 = !DILocation(line: 147, column: 1, scope: !129)
!218 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 152, type: !13, scopeLine: 153, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!219 = !DILocalVariable(name: "data", scope: !218, file: !12, line: 154, type: !16)
!220 = !DILocation(line: 154, column: 9, scope: !218)
!221 = !DILocation(line: 156, column: 10, scope: !218)
!222 = !DILocation(line: 157, column: 8, scope: !223)
!223 = distinct !DILexicalBlock(scope: !218, file: !12, line: 157, column: 8)
!224 = !DILocation(line: 157, column: 8, scope: !218)
!225 = !DILocation(line: 161, column: 14, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !12, line: 158, column: 5)
!227 = !DILocation(line: 162, column: 5, scope: !226)
!228 = !DILocation(line: 167, column: 14, scope: !229)
!229 = distinct !DILexicalBlock(scope: !223, file: !12, line: 164, column: 5)
!230 = !DILocation(line: 169, column: 8, scope: !231)
!231 = distinct !DILexicalBlock(scope: !218, file: !12, line: 169, column: 8)
!232 = !DILocation(line: 169, column: 8, scope: !218)
!233 = !DILocalVariable(name: "i", scope: !234, file: !12, line: 172, type: !16)
!234 = distinct !DILexicalBlock(scope: !235, file: !12, line: 171, column: 9)
!235 = distinct !DILexicalBlock(scope: !231, file: !12, line: 170, column: 5)
!236 = !DILocation(line: 172, column: 17, scope: !234)
!237 = !DILocalVariable(name: "buffer", scope: !234, file: !12, line: 173, type: !35)
!238 = !DILocation(line: 173, column: 17, scope: !234)
!239 = !DILocation(line: 176, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !234, file: !12, line: 176, column: 17)
!241 = !DILocation(line: 176, column: 22, scope: !240)
!242 = !DILocation(line: 176, column: 17, scope: !234)
!243 = !DILocation(line: 178, column: 24, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !12, line: 177, column: 13)
!245 = !DILocation(line: 178, column: 17, scope: !244)
!246 = !DILocation(line: 178, column: 30, scope: !244)
!247 = !DILocation(line: 180, column: 23, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !12, line: 180, column: 17)
!249 = !DILocation(line: 180, column: 21, scope: !248)
!250 = !DILocation(line: 180, column: 28, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !12, line: 180, column: 17)
!252 = !DILocation(line: 180, column: 30, scope: !251)
!253 = !DILocation(line: 180, column: 17, scope: !248)
!254 = !DILocation(line: 182, column: 41, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !12, line: 181, column: 17)
!256 = !DILocation(line: 182, column: 34, scope: !255)
!257 = !DILocation(line: 182, column: 21, scope: !255)
!258 = !DILocation(line: 183, column: 17, scope: !255)
!259 = !DILocation(line: 180, column: 37, scope: !251)
!260 = !DILocation(line: 180, column: 17, scope: !251)
!261 = distinct !{!261, !253, !262, !63}
!262 = !DILocation(line: 183, column: 17, scope: !248)
!263 = !DILocation(line: 184, column: 13, scope: !244)
!264 = !DILocation(line: 187, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !240, file: !12, line: 186, column: 13)
!266 = !DILocation(line: 190, column: 5, scope: !235)
!267 = !DILocalVariable(name: "i", scope: !268, file: !12, line: 194, type: !16)
!268 = distinct !DILexicalBlock(scope: !269, file: !12, line: 193, column: 9)
!269 = distinct !DILexicalBlock(scope: !231, file: !12, line: 192, column: 5)
!270 = !DILocation(line: 194, column: 17, scope: !268)
!271 = !DILocalVariable(name: "buffer", scope: !268, file: !12, line: 195, type: !35)
!272 = !DILocation(line: 195, column: 17, scope: !268)
!273 = !DILocation(line: 198, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !268, file: !12, line: 198, column: 17)
!275 = !DILocation(line: 198, column: 22, scope: !274)
!276 = !DILocation(line: 198, column: 17, scope: !268)
!277 = !DILocation(line: 200, column: 24, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !12, line: 199, column: 13)
!279 = !DILocation(line: 200, column: 17, scope: !278)
!280 = !DILocation(line: 200, column: 30, scope: !278)
!281 = !DILocation(line: 202, column: 23, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !12, line: 202, column: 17)
!283 = !DILocation(line: 202, column: 21, scope: !282)
!284 = !DILocation(line: 202, column: 28, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !12, line: 202, column: 17)
!286 = !DILocation(line: 202, column: 30, scope: !285)
!287 = !DILocation(line: 202, column: 17, scope: !282)
!288 = !DILocation(line: 204, column: 41, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !12, line: 203, column: 17)
!290 = !DILocation(line: 204, column: 34, scope: !289)
!291 = !DILocation(line: 204, column: 21, scope: !289)
!292 = !DILocation(line: 205, column: 17, scope: !289)
!293 = !DILocation(line: 202, column: 37, scope: !285)
!294 = !DILocation(line: 202, column: 17, scope: !285)
!295 = distinct !{!295, !287, !296, !63}
!296 = !DILocation(line: 205, column: 17, scope: !282)
!297 = !DILocation(line: 206, column: 13, scope: !278)
!298 = !DILocation(line: 209, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !274, file: !12, line: 208, column: 13)
!300 = !DILocation(line: 213, column: 1, scope: !218)
