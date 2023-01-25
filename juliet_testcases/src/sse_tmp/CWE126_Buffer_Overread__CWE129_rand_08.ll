; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_08_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 @staticReturnsTrue(), !dbg !19
  %tobool = icmp ne i32 %call, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !22
  %and = and i32 %call1, 1, !dbg !22
  %tobool2 = icmp ne i32 %and, 0, !dbg !22
  br i1 %tobool2, label %cond.true, label %cond.false, !dbg !22

cond.true:                                        ; preds = %if.then
  %call3 = call i32 @rand() #5, !dbg !22
  %shl = shl i32 %call3, 30, !dbg !22
  %call4 = call i32 @rand() #5, !dbg !22
  %shl5 = shl i32 %call4, 15, !dbg !22
  %xor = xor i32 %shl, %shl5, !dbg !22
  %call6 = call i32 @rand() #5, !dbg !22
  %xor7 = xor i32 %xor, %call6, !dbg !22
  br label %cond.end, !dbg !22

cond.false:                                       ; preds = %if.then
  %call8 = call i32 @rand() #5, !dbg !22
  %shl9 = shl i32 %call8, 30, !dbg !22
  %call10 = call i32 @rand() #5, !dbg !22
  %shl11 = shl i32 %call10, 15, !dbg !22
  %xor12 = xor i32 %shl9, %shl11, !dbg !22
  %call13 = call i32 @rand() #5, !dbg !22
  %xor14 = xor i32 %xor12, %call13, !dbg !22
  %sub = sub i32 0, %xor14, !dbg !22
  %sub15 = sub i32 %sub, 1, !dbg !22
  br label %cond.end, !dbg !22

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor7, %cond.true ], [ %sub15, %cond.false ], !dbg !22
  store i32 %cond, i32* %data, align 4, !dbg !24
  br label %if.end, !dbg !25

if.end:                                           ; preds = %cond.end, %entry
  %call16 = call i32 @staticReturnsTrue(), !dbg !26
  %tobool17 = icmp ne i32 %call16, 0, !dbg !26
  br i1 %tobool17, label %if.then18, label %if.end21, !dbg !28

if.then18:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !29, metadata !DIExpression()), !dbg !35
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !35
  %1 = load i32, i32* %data, align 4, !dbg !36
  %cmp = icmp sge i32 %1, 0, !dbg !38
  br i1 %cmp, label %if.then19, label %if.else, !dbg !39

if.then19:                                        ; preds = %if.then18
  %2 = load i32, i32* %data, align 4, !dbg !40
  %idxprom = sext i32 %2 to i64, !dbg !42
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !42
  %3 = load i32, i32* %arrayidx, align 4, !dbg !42
  call void @printIntLine(i32 %3), !dbg !43
  br label %if.end20, !dbg !44

if.else:                                          ; preds = %if.then18
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !45
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then19
  br label %if.end21, !dbg !47

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_08_good() #0 !dbg !49 {
entry:
  call void @goodB2G1(), !dbg !50
  call void @goodB2G2(), !dbg !51
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__CWE129_rand_08_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__CWE129_rand_08_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !75 {
entry:
  ret i32 1, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !79 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 -1, i32* %data, align 4, !dbg !82
  %call = call i32 @staticReturnsTrue(), !dbg !83
  %tobool = icmp ne i32 %call, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !86
  %and = and i32 %call1, 1, !dbg !86
  %tobool2 = icmp ne i32 %and, 0, !dbg !86
  br i1 %tobool2, label %cond.true, label %cond.false, !dbg !86

cond.true:                                        ; preds = %if.then
  %call3 = call i32 @rand() #5, !dbg !86
  %shl = shl i32 %call3, 30, !dbg !86
  %call4 = call i32 @rand() #5, !dbg !86
  %shl5 = shl i32 %call4, 15, !dbg !86
  %xor = xor i32 %shl, %shl5, !dbg !86
  %call6 = call i32 @rand() #5, !dbg !86
  %xor7 = xor i32 %xor, %call6, !dbg !86
  br label %cond.end, !dbg !86

cond.false:                                       ; preds = %if.then
  %call8 = call i32 @rand() #5, !dbg !86
  %shl9 = shl i32 %call8, 30, !dbg !86
  %call10 = call i32 @rand() #5, !dbg !86
  %shl11 = shl i32 %call10, 15, !dbg !86
  %xor12 = xor i32 %shl9, %shl11, !dbg !86
  %call13 = call i32 @rand() #5, !dbg !86
  %xor14 = xor i32 %xor12, %call13, !dbg !86
  %sub = sub i32 0, %xor14, !dbg !86
  %sub15 = sub i32 %sub, 1, !dbg !86
  br label %cond.end, !dbg !86

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor7, %cond.true ], [ %sub15, %cond.false ], !dbg !86
  store i32 %cond, i32* %data, align 4, !dbg !88
  br label %if.end, !dbg !89

if.end:                                           ; preds = %cond.end, %entry
  %call16 = call i32 @staticReturnsFalse(), !dbg !90
  %tobool17 = icmp ne i32 %call16, 0, !dbg !90
  br i1 %tobool17, label %if.then18, label %if.else, !dbg !92

if.then18:                                        ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  br label %if.end23, !dbg !95

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !96, metadata !DIExpression()), !dbg !99
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !99
  %1 = load i32, i32* %data, align 4, !dbg !100
  %cmp = icmp sge i32 %1, 0, !dbg !102
  br i1 %cmp, label %land.lhs.true, label %if.else21, !dbg !103

land.lhs.true:                                    ; preds = %if.else
  %2 = load i32, i32* %data, align 4, !dbg !104
  %cmp19 = icmp slt i32 %2, 10, !dbg !105
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !106

if.then20:                                        ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !107
  %idxprom = sext i32 %3 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !109
  %4 = load i32, i32* %arrayidx, align 4, !dbg !109
  call void @printIntLine(i32 %4), !dbg !110
  br label %if.end22, !dbg !111

if.else21:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !112
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %if.then20
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then18
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !115 {
entry:
  ret i32 0, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !117 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 -1, i32* %data, align 4, !dbg !120
  %call = call i32 @staticReturnsTrue(), !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !124
  %and = and i32 %call1, 1, !dbg !124
  %tobool2 = icmp ne i32 %and, 0, !dbg !124
  br i1 %tobool2, label %cond.true, label %cond.false, !dbg !124

cond.true:                                        ; preds = %if.then
  %call3 = call i32 @rand() #5, !dbg !124
  %shl = shl i32 %call3, 30, !dbg !124
  %call4 = call i32 @rand() #5, !dbg !124
  %shl5 = shl i32 %call4, 15, !dbg !124
  %xor = xor i32 %shl, %shl5, !dbg !124
  %call6 = call i32 @rand() #5, !dbg !124
  %xor7 = xor i32 %xor, %call6, !dbg !124
  br label %cond.end, !dbg !124

cond.false:                                       ; preds = %if.then
  %call8 = call i32 @rand() #5, !dbg !124
  %shl9 = shl i32 %call8, 30, !dbg !124
  %call10 = call i32 @rand() #5, !dbg !124
  %shl11 = shl i32 %call10, 15, !dbg !124
  %xor12 = xor i32 %shl9, %shl11, !dbg !124
  %call13 = call i32 @rand() #5, !dbg !124
  %xor14 = xor i32 %xor12, %call13, !dbg !124
  %sub = sub i32 0, %xor14, !dbg !124
  %sub15 = sub i32 %sub, 1, !dbg !124
  br label %cond.end, !dbg !124

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor7, %cond.true ], [ %sub15, %cond.false ], !dbg !124
  store i32 %cond, i32* %data, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %cond.end, %entry
  %call16 = call i32 @staticReturnsTrue(), !dbg !128
  %tobool17 = icmp ne i32 %call16, 0, !dbg !128
  br i1 %tobool17, label %if.then18, label %if.end22, !dbg !130

if.then18:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !134
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !134
  %1 = load i32, i32* %data, align 4, !dbg !135
  %cmp = icmp sge i32 %1, 0, !dbg !137
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !138

land.lhs.true:                                    ; preds = %if.then18
  %2 = load i32, i32* %data, align 4, !dbg !139
  %cmp19 = icmp slt i32 %2, 10, !dbg !140
  br i1 %cmp19, label %if.then20, label %if.else, !dbg !141

if.then20:                                        ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !142
  %idxprom = sext i32 %3 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  %4 = load i32, i32* %arrayidx, align 4, !dbg !144
  call void @printIntLine(i32 %4), !dbg !145
  br label %if.end21, !dbg !146

if.else:                                          ; preds = %land.lhs.true, %if.then18
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !147
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then20
  br label %if.end22, !dbg !149

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !151 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i32 -1, i32* %data, align 4, !dbg !154
  %call = call i32 @staticReturnsFalse(), !dbg !155
  %tobool = icmp ne i32 %call, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.else, !dbg !157

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !158
  br label %if.end, !dbg !160

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !161
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !163
  %tobool2 = icmp ne i32 %call1, 0, !dbg !163
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !165

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !166, metadata !DIExpression()), !dbg !169
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !169
  %1 = load i32, i32* %data, align 4, !dbg !170
  %cmp = icmp sge i32 %1, 0, !dbg !172
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !173

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !174
  %idxprom = sext i32 %2 to i64, !dbg !176
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !176
  %3 = load i32, i32* %arrayidx, align 4, !dbg !176
  call void @printIntLine(i32 %3), !dbg !177
  br label %if.end6, !dbg !178

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !179
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !181

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !183 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !184, metadata !DIExpression()), !dbg !185
  store i32 -1, i32* %data, align 4, !dbg !186
  %call = call i32 @staticReturnsTrue(), !dbg !187
  %tobool = icmp ne i32 %call, 0, !dbg !187
  br i1 %tobool, label %if.then, label %if.end, !dbg !189

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !190
  br label %if.end, !dbg !192

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !193
  %tobool2 = icmp ne i32 %call1, 0, !dbg !193
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !195

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !196, metadata !DIExpression()), !dbg !199
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !199
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !199
  %1 = load i32, i32* %data, align 4, !dbg !200
  %cmp = icmp sge i32 %1, 0, !dbg !202
  br i1 %cmp, label %if.then4, label %if.else, !dbg !203

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !204
  %idxprom = sext i32 %2 to i64, !dbg !206
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !206
  %3 = load i32, i32* %arrayidx, align 4, !dbg !206
  call void @printIntLine(i32 %3), !dbg !207
  br label %if.end5, !dbg !208

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !209
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !211

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !212
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_08_bad", scope: !13, file: !13, line: 35, type: !14, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_08.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 37, type: !4)
!17 = !DILocation(line: 37, column: 9, scope: !12)
!18 = !DILocation(line: 39, column: 10, scope: !12)
!19 = !DILocation(line: 40, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !12, file: !13, line: 40, column: 8)
!21 = !DILocation(line: 40, column: 8, scope: !12)
!22 = !DILocation(line: 43, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !13, line: 41, column: 5)
!24 = !DILocation(line: 43, column: 14, scope: !23)
!25 = !DILocation(line: 44, column: 5, scope: !23)
!26 = !DILocation(line: 45, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!28 = !DILocation(line: 45, column: 8, scope: !12)
!29 = !DILocalVariable(name: "buffer", scope: !30, file: !13, line: 48, type: !32)
!30 = distinct !DILexicalBlock(scope: !31, file: !13, line: 47, column: 9)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 46, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DILocation(line: 48, column: 17, scope: !30)
!36 = !DILocation(line: 51, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !13, line: 51, column: 17)
!38 = !DILocation(line: 51, column: 22, scope: !37)
!39 = !DILocation(line: 51, column: 17, scope: !30)
!40 = !DILocation(line: 53, column: 37, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !13, line: 52, column: 13)
!42 = !DILocation(line: 53, column: 30, scope: !41)
!43 = !DILocation(line: 53, column: 17, scope: !41)
!44 = !DILocation(line: 54, column: 13, scope: !41)
!45 = !DILocation(line: 57, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !37, file: !13, line: 56, column: 13)
!47 = !DILocation(line: 60, column: 5, scope: !31)
!48 = !DILocation(line: 61, column: 1, scope: !12)
!49 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_08_good", scope: !13, file: !13, line: 193, type: !14, scopeLine: 194, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 195, column: 5, scope: !49)
!51 = !DILocation(line: 196, column: 5, scope: !49)
!52 = !DILocation(line: 197, column: 5, scope: !49)
!53 = !DILocation(line: 198, column: 5, scope: !49)
!54 = !DILocation(line: 199, column: 1, scope: !49)
!55 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 210, type: !56, scopeLine: 211, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!4, !4, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !13, line: 210, type: !4)
!62 = !DILocation(line: 210, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !13, line: 210, type: !58)
!64 = !DILocation(line: 210, column: 27, scope: !55)
!65 = !DILocation(line: 213, column: 22, scope: !55)
!66 = !DILocation(line: 213, column: 12, scope: !55)
!67 = !DILocation(line: 213, column: 5, scope: !55)
!68 = !DILocation(line: 215, column: 5, scope: !55)
!69 = !DILocation(line: 216, column: 5, scope: !55)
!70 = !DILocation(line: 217, column: 5, scope: !55)
!71 = !DILocation(line: 220, column: 5, scope: !55)
!72 = !DILocation(line: 221, column: 5, scope: !55)
!73 = !DILocation(line: 222, column: 5, scope: !55)
!74 = !DILocation(line: 224, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !13, file: !13, line: 23, type: !76, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!4}
!78 = !DILocation(line: 25, column: 5, scope: !75)
!79 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 68, type: !14, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !13, line: 70, type: !4)
!81 = !DILocation(line: 70, column: 9, scope: !79)
!82 = !DILocation(line: 72, column: 10, scope: !79)
!83 = !DILocation(line: 73, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !13, line: 73, column: 8)
!85 = !DILocation(line: 73, column: 8, scope: !79)
!86 = !DILocation(line: 76, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !13, line: 74, column: 5)
!88 = !DILocation(line: 76, column: 14, scope: !87)
!89 = !DILocation(line: 77, column: 5, scope: !87)
!90 = !DILocation(line: 78, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !13, line: 78, column: 8)
!92 = !DILocation(line: 78, column: 8, scope: !79)
!93 = !DILocation(line: 81, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !13, line: 79, column: 5)
!95 = !DILocation(line: 82, column: 5, scope: !94)
!96 = !DILocalVariable(name: "buffer", scope: !97, file: !13, line: 86, type: !32)
!97 = distinct !DILexicalBlock(scope: !98, file: !13, line: 85, column: 9)
!98 = distinct !DILexicalBlock(scope: !91, file: !13, line: 84, column: 5)
!99 = !DILocation(line: 86, column: 17, scope: !97)
!100 = !DILocation(line: 88, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !13, line: 88, column: 17)
!102 = !DILocation(line: 88, column: 22, scope: !101)
!103 = !DILocation(line: 88, column: 27, scope: !101)
!104 = !DILocation(line: 88, column: 30, scope: !101)
!105 = !DILocation(line: 88, column: 35, scope: !101)
!106 = !DILocation(line: 88, column: 17, scope: !97)
!107 = !DILocation(line: 90, column: 37, scope: !108)
!108 = distinct !DILexicalBlock(scope: !101, file: !13, line: 89, column: 13)
!109 = !DILocation(line: 90, column: 30, scope: !108)
!110 = !DILocation(line: 90, column: 17, scope: !108)
!111 = !DILocation(line: 91, column: 13, scope: !108)
!112 = !DILocation(line: 94, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !101, file: !13, line: 93, column: 13)
!114 = !DILocation(line: 98, column: 1, scope: !79)
!115 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !13, file: !13, line: 28, type: !76, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 30, column: 5, scope: !115)
!117 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 101, type: !14, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !13, line: 103, type: !4)
!119 = !DILocation(line: 103, column: 9, scope: !117)
!120 = !DILocation(line: 105, column: 10, scope: !117)
!121 = !DILocation(line: 106, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !13, line: 106, column: 8)
!123 = !DILocation(line: 106, column: 8, scope: !117)
!124 = !DILocation(line: 109, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !13, line: 107, column: 5)
!126 = !DILocation(line: 109, column: 14, scope: !125)
!127 = !DILocation(line: 110, column: 5, scope: !125)
!128 = !DILocation(line: 111, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !117, file: !13, line: 111, column: 8)
!130 = !DILocation(line: 111, column: 8, scope: !117)
!131 = !DILocalVariable(name: "buffer", scope: !132, file: !13, line: 114, type: !32)
!132 = distinct !DILexicalBlock(scope: !133, file: !13, line: 113, column: 9)
!133 = distinct !DILexicalBlock(scope: !129, file: !13, line: 112, column: 5)
!134 = !DILocation(line: 114, column: 17, scope: !132)
!135 = !DILocation(line: 116, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !13, line: 116, column: 17)
!137 = !DILocation(line: 116, column: 22, scope: !136)
!138 = !DILocation(line: 116, column: 27, scope: !136)
!139 = !DILocation(line: 116, column: 30, scope: !136)
!140 = !DILocation(line: 116, column: 35, scope: !136)
!141 = !DILocation(line: 116, column: 17, scope: !132)
!142 = !DILocation(line: 118, column: 37, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !13, line: 117, column: 13)
!144 = !DILocation(line: 118, column: 30, scope: !143)
!145 = !DILocation(line: 118, column: 17, scope: !143)
!146 = !DILocation(line: 119, column: 13, scope: !143)
!147 = !DILocation(line: 122, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !136, file: !13, line: 121, column: 13)
!149 = !DILocation(line: 125, column: 5, scope: !133)
!150 = !DILocation(line: 126, column: 1, scope: !117)
!151 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 129, type: !14, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !13, line: 131, type: !4)
!153 = !DILocation(line: 131, column: 9, scope: !151)
!154 = !DILocation(line: 133, column: 10, scope: !151)
!155 = !DILocation(line: 134, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !13, line: 134, column: 8)
!157 = !DILocation(line: 134, column: 8, scope: !151)
!158 = !DILocation(line: 137, column: 9, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !13, line: 135, column: 5)
!160 = !DILocation(line: 138, column: 5, scope: !159)
!161 = !DILocation(line: 143, column: 14, scope: !162)
!162 = distinct !DILexicalBlock(scope: !156, file: !13, line: 140, column: 5)
!163 = !DILocation(line: 145, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !151, file: !13, line: 145, column: 8)
!165 = !DILocation(line: 145, column: 8, scope: !151)
!166 = !DILocalVariable(name: "buffer", scope: !167, file: !13, line: 148, type: !32)
!167 = distinct !DILexicalBlock(scope: !168, file: !13, line: 147, column: 9)
!168 = distinct !DILexicalBlock(scope: !164, file: !13, line: 146, column: 5)
!169 = !DILocation(line: 148, column: 17, scope: !167)
!170 = !DILocation(line: 151, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !13, line: 151, column: 17)
!172 = !DILocation(line: 151, column: 22, scope: !171)
!173 = !DILocation(line: 151, column: 17, scope: !167)
!174 = !DILocation(line: 153, column: 37, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !13, line: 152, column: 13)
!176 = !DILocation(line: 153, column: 30, scope: !175)
!177 = !DILocation(line: 153, column: 17, scope: !175)
!178 = !DILocation(line: 154, column: 13, scope: !175)
!179 = !DILocation(line: 157, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !171, file: !13, line: 156, column: 13)
!181 = !DILocation(line: 160, column: 5, scope: !168)
!182 = !DILocation(line: 161, column: 1, scope: !151)
!183 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 164, type: !14, scopeLine: 165, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!184 = !DILocalVariable(name: "data", scope: !183, file: !13, line: 166, type: !4)
!185 = !DILocation(line: 166, column: 9, scope: !183)
!186 = !DILocation(line: 168, column: 10, scope: !183)
!187 = !DILocation(line: 169, column: 8, scope: !188)
!188 = distinct !DILexicalBlock(scope: !183, file: !13, line: 169, column: 8)
!189 = !DILocation(line: 169, column: 8, scope: !183)
!190 = !DILocation(line: 173, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !13, line: 170, column: 5)
!192 = !DILocation(line: 174, column: 5, scope: !191)
!193 = !DILocation(line: 175, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !183, file: !13, line: 175, column: 8)
!195 = !DILocation(line: 175, column: 8, scope: !183)
!196 = !DILocalVariable(name: "buffer", scope: !197, file: !13, line: 178, type: !32)
!197 = distinct !DILexicalBlock(scope: !198, file: !13, line: 177, column: 9)
!198 = distinct !DILexicalBlock(scope: !194, file: !13, line: 176, column: 5)
!199 = !DILocation(line: 178, column: 17, scope: !197)
!200 = !DILocation(line: 181, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !13, line: 181, column: 17)
!202 = !DILocation(line: 181, column: 22, scope: !201)
!203 = !DILocation(line: 181, column: 17, scope: !197)
!204 = !DILocation(line: 183, column: 37, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !13, line: 182, column: 13)
!206 = !DILocation(line: 183, column: 30, scope: !205)
!207 = !DILocation(line: 183, column: 17, scope: !205)
!208 = !DILocation(line: 184, column: 13, scope: !205)
!209 = !DILocation(line: 187, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !201, file: !13, line: 186, column: 13)
!211 = !DILocation(line: 190, column: 5, scope: !198)
!212 = !DILocation(line: 191, column: 1, scope: !183)
