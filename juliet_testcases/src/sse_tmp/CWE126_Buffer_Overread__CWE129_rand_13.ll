; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_13_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !23
  %and = and i32 %call, 1, !dbg !23
  %tobool = icmp ne i32 %and, 0, !dbg !23
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !23

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand() #5, !dbg !23
  %shl = shl i32 %call1, 30, !dbg !23
  %call2 = call i32 @rand() #5, !dbg !23
  %shl3 = shl i32 %call2, 15, !dbg !23
  %xor = xor i32 %shl, %shl3, !dbg !23
  %call4 = call i32 @rand() #5, !dbg !23
  %xor5 = xor i32 %xor, %call4, !dbg !23
  br label %cond.end, !dbg !23

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand() #5, !dbg !23
  %shl7 = shl i32 %call6, 30, !dbg !23
  %call8 = call i32 @rand() #5, !dbg !23
  %shl9 = shl i32 %call8, 15, !dbg !23
  %xor10 = xor i32 %shl7, %shl9, !dbg !23
  %call11 = call i32 @rand() #5, !dbg !23
  %xor12 = xor i32 %xor10, %call11, !dbg !23
  %sub = sub i32 0, %xor12, !dbg !23
  %sub13 = sub i32 %sub, 1, !dbg !23
  br label %cond.end, !dbg !23

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !23
  store i32 %cond, i32* %data, align 4, !dbg !25
  br label %if.end, !dbg !26

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !27
  %cmp14 = icmp eq i32 %1, 5, !dbg !29
  br i1 %cmp14, label %if.then15, label %if.end19, !dbg !30

if.then15:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !31, metadata !DIExpression()), !dbg !37
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !37
  %3 = load i32, i32* %data, align 4, !dbg !38
  %cmp16 = icmp sge i32 %3, 0, !dbg !40
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !41

if.then17:                                        ; preds = %if.then15
  %4 = load i32, i32* %data, align 4, !dbg !42
  %idxprom = sext i32 %4 to i64, !dbg !44
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !44
  %5 = load i32, i32* %arrayidx, align 4, !dbg !44
  call void @printIntLine(i32 %5), !dbg !45
  br label %if.end18, !dbg !46

if.else:                                          ; preds = %if.then15
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end18

if.end18:                                         ; preds = %if.else, %if.then17
  br label %if.end19, !dbg !49

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !50
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
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_13_good() #0 !dbg !51 {
entry:
  call void @goodB2G1(), !dbg !52
  call void @goodB2G2(), !dbg !53
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__CWE129_rand_13_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__CWE129_rand_13_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !77 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !81
  %cmp = icmp eq i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !85
  %and = and i32 %call, 1, !dbg !85
  %tobool = icmp ne i32 %and, 0, !dbg !85
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !85

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand() #5, !dbg !85
  %shl = shl i32 %call1, 30, !dbg !85
  %call2 = call i32 @rand() #5, !dbg !85
  %shl3 = shl i32 %call2, 15, !dbg !85
  %xor = xor i32 %shl, %shl3, !dbg !85
  %call4 = call i32 @rand() #5, !dbg !85
  %xor5 = xor i32 %xor, %call4, !dbg !85
  br label %cond.end, !dbg !85

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand() #5, !dbg !85
  %shl7 = shl i32 %call6, 30, !dbg !85
  %call8 = call i32 @rand() #5, !dbg !85
  %shl9 = shl i32 %call8, 15, !dbg !85
  %xor10 = xor i32 %shl7, %shl9, !dbg !85
  %call11 = call i32 @rand() #5, !dbg !85
  %xor12 = xor i32 %xor10, %call11, !dbg !85
  %sub = sub i32 0, %xor12, !dbg !85
  %sub13 = sub i32 %sub, 1, !dbg !85
  br label %cond.end, !dbg !85

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !85
  store i32 %cond, i32* %data, align 4, !dbg !87
  br label %if.end, !dbg !88

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !89
  %cmp14 = icmp ne i32 %1, 5, !dbg !91
  br i1 %cmp14, label %if.then15, label %if.else, !dbg !92

if.then15:                                        ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  br label %if.end21, !dbg !95

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !96, metadata !DIExpression()), !dbg !99
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !99
  %3 = load i32, i32* %data, align 4, !dbg !100
  %cmp16 = icmp sge i32 %3, 0, !dbg !102
  br i1 %cmp16, label %land.lhs.true, label %if.else19, !dbg !103

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !104
  %cmp17 = icmp slt i32 %4, 10, !dbg !105
  br i1 %cmp17, label %if.then18, label %if.else19, !dbg !106

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !107
  %idxprom = sext i32 %5 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !109
  %6 = load i32, i32* %arrayidx, align 4, !dbg !109
  call void @printIntLine(i32 %6), !dbg !110
  br label %if.end20, !dbg !111

if.else19:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !112
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.then18
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then15
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !115 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %data, align 4, !dbg !118
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !119
  %cmp = icmp eq i32 %0, 5, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %call = call i32 @rand() #5, !dbg !123
  %and = and i32 %call, 1, !dbg !123
  %tobool = icmp ne i32 %and, 0, !dbg !123
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !123

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand() #5, !dbg !123
  %shl = shl i32 %call1, 30, !dbg !123
  %call2 = call i32 @rand() #5, !dbg !123
  %shl3 = shl i32 %call2, 15, !dbg !123
  %xor = xor i32 %shl, %shl3, !dbg !123
  %call4 = call i32 @rand() #5, !dbg !123
  %xor5 = xor i32 %xor, %call4, !dbg !123
  br label %cond.end, !dbg !123

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand() #5, !dbg !123
  %shl7 = shl i32 %call6, 30, !dbg !123
  %call8 = call i32 @rand() #5, !dbg !123
  %shl9 = shl i32 %call8, 15, !dbg !123
  %xor10 = xor i32 %shl7, %shl9, !dbg !123
  %call11 = call i32 @rand() #5, !dbg !123
  %xor12 = xor i32 %xor10, %call11, !dbg !123
  %sub = sub i32 0, %xor12, !dbg !123
  %sub13 = sub i32 %sub, 1, !dbg !123
  br label %cond.end, !dbg !123

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !123
  store i32 %cond, i32* %data, align 4, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !127
  %cmp14 = icmp eq i32 %1, 5, !dbg !129
  br i1 %cmp14, label %if.then15, label %if.end20, !dbg !130

if.then15:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !134
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !134
  %3 = load i32, i32* %data, align 4, !dbg !135
  %cmp16 = icmp sge i32 %3, 0, !dbg !137
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !138

land.lhs.true:                                    ; preds = %if.then15
  %4 = load i32, i32* %data, align 4, !dbg !139
  %cmp17 = icmp slt i32 %4, 10, !dbg !140
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !141

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !142
  %idxprom = sext i32 %5 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  %6 = load i32, i32* %arrayidx, align 4, !dbg !144
  call void @printIntLine(i32 %6), !dbg !145
  br label %if.end19, !dbg !146

if.else:                                          ; preds = %land.lhs.true, %if.then15
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !147
  br label %if.end19

if.end19:                                         ; preds = %if.else, %if.then18
  br label %if.end20, !dbg !149

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !151 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i32 -1, i32* %data, align 4, !dbg !154
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !155
  %cmp = icmp ne i32 %0, 5, !dbg !157
  br i1 %cmp, label %if.then, label %if.else, !dbg !158

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !159
  br label %if.end, !dbg !161

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !162
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !164
  %cmp1 = icmp eq i32 %1, 5, !dbg !166
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !167

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !168, metadata !DIExpression()), !dbg !171
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !171
  %3 = load i32, i32* %data, align 4, !dbg !172
  %cmp3 = icmp sge i32 %3, 0, !dbg !174
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !175

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !176
  %idxprom = sext i32 %4 to i64, !dbg !178
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !178
  %5 = load i32, i32* %arrayidx, align 4, !dbg !178
  call void @printIntLine(i32 %5), !dbg !179
  br label %if.end6, !dbg !180

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !181
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !183

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 -1, i32* %data, align 4, !dbg !188
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !189
  %cmp = icmp eq i32 %0, 5, !dbg !191
  br i1 %cmp, label %if.then, label %if.end, !dbg !192

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !193
  br label %if.end, !dbg !195

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !196
  %cmp1 = icmp eq i32 %1, 5, !dbg !198
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !199

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !200, metadata !DIExpression()), !dbg !203
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !203
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !203
  %3 = load i32, i32* %data, align 4, !dbg !204
  %cmp3 = icmp sge i32 %3, 0, !dbg !206
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !207

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !208
  %idxprom = sext i32 %4 to i64, !dbg !210
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !210
  %5 = load i32, i32* %arrayidx, align 4, !dbg !210
  call void @printIntLine(i32 %5), !dbg !211
  br label %if.end5, !dbg !212

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !213
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !215

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !216
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_13.c", directory: "/root/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_13_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_13.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !12, file: !13, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 25, scope: !20)
!22 = !DILocation(line: 27, column: 8, scope: !12)
!23 = !DILocation(line: 30, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !13, line: 28, column: 5)
!25 = !DILocation(line: 30, column: 14, scope: !24)
!26 = !DILocation(line: 31, column: 5, scope: !24)
!27 = !DILocation(line: 32, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !12, file: !13, line: 32, column: 8)
!29 = !DILocation(line: 32, column: 25, scope: !28)
!30 = !DILocation(line: 32, column: 8, scope: !12)
!31 = !DILocalVariable(name: "buffer", scope: !32, file: !13, line: 35, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !13, line: 34, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !13, line: 33, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 35, column: 17, scope: !32)
!38 = !DILocation(line: 38, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !13, line: 38, column: 17)
!40 = !DILocation(line: 38, column: 22, scope: !39)
!41 = !DILocation(line: 38, column: 17, scope: !32)
!42 = !DILocation(line: 40, column: 37, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !13, line: 39, column: 13)
!44 = !DILocation(line: 40, column: 30, scope: !43)
!45 = !DILocation(line: 40, column: 17, scope: !43)
!46 = !DILocation(line: 41, column: 13, scope: !43)
!47 = !DILocation(line: 44, column: 17, scope: !48)
!48 = distinct !DILexicalBlock(scope: !39, file: !13, line: 43, column: 13)
!49 = !DILocation(line: 47, column: 5, scope: !33)
!50 = !DILocation(line: 48, column: 1, scope: !12)
!51 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_13_good", scope: !13, file: !13, line: 180, type: !14, scopeLine: 181, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 182, column: 5, scope: !51)
!53 = !DILocation(line: 183, column: 5, scope: !51)
!54 = !DILocation(line: 184, column: 5, scope: !51)
!55 = !DILocation(line: 185, column: 5, scope: !51)
!56 = !DILocation(line: 186, column: 1, scope: !51)
!57 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 197, type: !58, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!4, !4, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !13, line: 197, type: !4)
!64 = !DILocation(line: 197, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !13, line: 197, type: !60)
!66 = !DILocation(line: 197, column: 27, scope: !57)
!67 = !DILocation(line: 200, column: 22, scope: !57)
!68 = !DILocation(line: 200, column: 12, scope: !57)
!69 = !DILocation(line: 200, column: 5, scope: !57)
!70 = !DILocation(line: 202, column: 5, scope: !57)
!71 = !DILocation(line: 203, column: 5, scope: !57)
!72 = !DILocation(line: 204, column: 5, scope: !57)
!73 = !DILocation(line: 207, column: 5, scope: !57)
!74 = !DILocation(line: 208, column: 5, scope: !57)
!75 = !DILocation(line: 209, column: 5, scope: !57)
!76 = !DILocation(line: 211, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 55, type: !14, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !13, line: 57, type: !4)
!79 = !DILocation(line: 57, column: 9, scope: !77)
!80 = !DILocation(line: 59, column: 10, scope: !77)
!81 = !DILocation(line: 60, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !13, line: 60, column: 8)
!83 = !DILocation(line: 60, column: 25, scope: !82)
!84 = !DILocation(line: 60, column: 8, scope: !77)
!85 = !DILocation(line: 63, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !13, line: 61, column: 5)
!87 = !DILocation(line: 63, column: 14, scope: !86)
!88 = !DILocation(line: 64, column: 5, scope: !86)
!89 = !DILocation(line: 65, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !77, file: !13, line: 65, column: 8)
!91 = !DILocation(line: 65, column: 25, scope: !90)
!92 = !DILocation(line: 65, column: 8, scope: !77)
!93 = !DILocation(line: 68, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !13, line: 66, column: 5)
!95 = !DILocation(line: 69, column: 5, scope: !94)
!96 = !DILocalVariable(name: "buffer", scope: !97, file: !13, line: 73, type: !34)
!97 = distinct !DILexicalBlock(scope: !98, file: !13, line: 72, column: 9)
!98 = distinct !DILexicalBlock(scope: !90, file: !13, line: 71, column: 5)
!99 = !DILocation(line: 73, column: 17, scope: !97)
!100 = !DILocation(line: 75, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !13, line: 75, column: 17)
!102 = !DILocation(line: 75, column: 22, scope: !101)
!103 = !DILocation(line: 75, column: 27, scope: !101)
!104 = !DILocation(line: 75, column: 30, scope: !101)
!105 = !DILocation(line: 75, column: 35, scope: !101)
!106 = !DILocation(line: 75, column: 17, scope: !97)
!107 = !DILocation(line: 77, column: 37, scope: !108)
!108 = distinct !DILexicalBlock(scope: !101, file: !13, line: 76, column: 13)
!109 = !DILocation(line: 77, column: 30, scope: !108)
!110 = !DILocation(line: 77, column: 17, scope: !108)
!111 = !DILocation(line: 78, column: 13, scope: !108)
!112 = !DILocation(line: 81, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !101, file: !13, line: 80, column: 13)
!114 = !DILocation(line: 85, column: 1, scope: !77)
!115 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 88, type: !14, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !13, line: 90, type: !4)
!117 = !DILocation(line: 90, column: 9, scope: !115)
!118 = !DILocation(line: 92, column: 10, scope: !115)
!119 = !DILocation(line: 93, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !13, line: 93, column: 8)
!121 = !DILocation(line: 93, column: 25, scope: !120)
!122 = !DILocation(line: 93, column: 8, scope: !115)
!123 = !DILocation(line: 96, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !13, line: 94, column: 5)
!125 = !DILocation(line: 96, column: 14, scope: !124)
!126 = !DILocation(line: 97, column: 5, scope: !124)
!127 = !DILocation(line: 98, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !115, file: !13, line: 98, column: 8)
!129 = !DILocation(line: 98, column: 25, scope: !128)
!130 = !DILocation(line: 98, column: 8, scope: !115)
!131 = !DILocalVariable(name: "buffer", scope: !132, file: !13, line: 101, type: !34)
!132 = distinct !DILexicalBlock(scope: !133, file: !13, line: 100, column: 9)
!133 = distinct !DILexicalBlock(scope: !128, file: !13, line: 99, column: 5)
!134 = !DILocation(line: 101, column: 17, scope: !132)
!135 = !DILocation(line: 103, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !13, line: 103, column: 17)
!137 = !DILocation(line: 103, column: 22, scope: !136)
!138 = !DILocation(line: 103, column: 27, scope: !136)
!139 = !DILocation(line: 103, column: 30, scope: !136)
!140 = !DILocation(line: 103, column: 35, scope: !136)
!141 = !DILocation(line: 103, column: 17, scope: !132)
!142 = !DILocation(line: 105, column: 37, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !13, line: 104, column: 13)
!144 = !DILocation(line: 105, column: 30, scope: !143)
!145 = !DILocation(line: 105, column: 17, scope: !143)
!146 = !DILocation(line: 106, column: 13, scope: !143)
!147 = !DILocation(line: 109, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !136, file: !13, line: 108, column: 13)
!149 = !DILocation(line: 112, column: 5, scope: !133)
!150 = !DILocation(line: 113, column: 1, scope: !115)
!151 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 116, type: !14, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !13, line: 118, type: !4)
!153 = !DILocation(line: 118, column: 9, scope: !151)
!154 = !DILocation(line: 120, column: 10, scope: !151)
!155 = !DILocation(line: 121, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !13, line: 121, column: 8)
!157 = !DILocation(line: 121, column: 25, scope: !156)
!158 = !DILocation(line: 121, column: 8, scope: !151)
!159 = !DILocation(line: 124, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !13, line: 122, column: 5)
!161 = !DILocation(line: 125, column: 5, scope: !160)
!162 = !DILocation(line: 130, column: 14, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !13, line: 127, column: 5)
!164 = !DILocation(line: 132, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !151, file: !13, line: 132, column: 8)
!166 = !DILocation(line: 132, column: 25, scope: !165)
!167 = !DILocation(line: 132, column: 8, scope: !151)
!168 = !DILocalVariable(name: "buffer", scope: !169, file: !13, line: 135, type: !34)
!169 = distinct !DILexicalBlock(scope: !170, file: !13, line: 134, column: 9)
!170 = distinct !DILexicalBlock(scope: !165, file: !13, line: 133, column: 5)
!171 = !DILocation(line: 135, column: 17, scope: !169)
!172 = !DILocation(line: 138, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !13, line: 138, column: 17)
!174 = !DILocation(line: 138, column: 22, scope: !173)
!175 = !DILocation(line: 138, column: 17, scope: !169)
!176 = !DILocation(line: 140, column: 37, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !13, line: 139, column: 13)
!178 = !DILocation(line: 140, column: 30, scope: !177)
!179 = !DILocation(line: 140, column: 17, scope: !177)
!180 = !DILocation(line: 141, column: 13, scope: !177)
!181 = !DILocation(line: 144, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !173, file: !13, line: 143, column: 13)
!183 = !DILocation(line: 147, column: 5, scope: !170)
!184 = !DILocation(line: 148, column: 1, scope: !151)
!185 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 151, type: !14, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!186 = !DILocalVariable(name: "data", scope: !185, file: !13, line: 153, type: !4)
!187 = !DILocation(line: 153, column: 9, scope: !185)
!188 = !DILocation(line: 155, column: 10, scope: !185)
!189 = !DILocation(line: 156, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !185, file: !13, line: 156, column: 8)
!191 = !DILocation(line: 156, column: 25, scope: !190)
!192 = !DILocation(line: 156, column: 8, scope: !185)
!193 = !DILocation(line: 160, column: 14, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !13, line: 157, column: 5)
!195 = !DILocation(line: 161, column: 5, scope: !194)
!196 = !DILocation(line: 162, column: 8, scope: !197)
!197 = distinct !DILexicalBlock(scope: !185, file: !13, line: 162, column: 8)
!198 = !DILocation(line: 162, column: 25, scope: !197)
!199 = !DILocation(line: 162, column: 8, scope: !185)
!200 = !DILocalVariable(name: "buffer", scope: !201, file: !13, line: 165, type: !34)
!201 = distinct !DILexicalBlock(scope: !202, file: !13, line: 164, column: 9)
!202 = distinct !DILexicalBlock(scope: !197, file: !13, line: 163, column: 5)
!203 = !DILocation(line: 165, column: 17, scope: !201)
!204 = !DILocation(line: 168, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !13, line: 168, column: 17)
!206 = !DILocation(line: 168, column: 22, scope: !205)
!207 = !DILocation(line: 168, column: 17, scope: !201)
!208 = !DILocation(line: 170, column: 37, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !13, line: 169, column: 13)
!210 = !DILocation(line: 170, column: 30, scope: !209)
!211 = !DILocation(line: 170, column: 17, scope: !209)
!212 = !DILocation(line: 171, column: 13, scope: !209)
!213 = !DILocation(line: 174, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !205, file: !13, line: 173, column: 13)
!215 = !DILocation(line: 177, column: 5, scope: !202)
!216 = !DILocation(line: 178, column: 1, scope: !185)
