; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_12_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer23 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !19
  %tobool = icmp ne i32 %call, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.else, !dbg !21

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

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !26
  br label %if.end

if.end:                                           ; preds = %if.else, %cond.end
  %call16 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !28
  %tobool17 = icmp ne i32 %call16, 0, !dbg !28
  br i1 %tobool17, label %if.then18, label %if.else22, !dbg !30

if.then18:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !31, metadata !DIExpression()), !dbg !37
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !37
  %1 = load i32, i32* %data, align 4, !dbg !38
  %cmp = icmp sge i32 %1, 0, !dbg !40
  br i1 %cmp, label %if.then19, label %if.else20, !dbg !41

if.then19:                                        ; preds = %if.then18
  %2 = load i32, i32* %data, align 4, !dbg !42
  %idxprom = sext i32 %2 to i64, !dbg !44
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !44
  %3 = load i32, i32* %arrayidx, align 4, !dbg !44
  call void @printIntLine(i32 %3), !dbg !45
  br label %if.end21, !dbg !46

if.else20:                                        ; preds = %if.then18
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %if.then19
  br label %if.end31, !dbg !49

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer23, metadata !50, metadata !DIExpression()), !dbg !53
  %4 = bitcast [10 x i32]* %buffer23 to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !53
  %5 = load i32, i32* %data, align 4, !dbg !54
  %cmp24 = icmp sge i32 %5, 0, !dbg !56
  br i1 %cmp24, label %land.lhs.true, label %if.else29, !dbg !57

land.lhs.true:                                    ; preds = %if.else22
  %6 = load i32, i32* %data, align 4, !dbg !58
  %cmp25 = icmp slt i32 %6, 10, !dbg !59
  br i1 %cmp25, label %if.then26, label %if.else29, !dbg !60

if.then26:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !61
  %idxprom27 = sext i32 %7 to i64, !dbg !63
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer23, i64 0, i64 %idxprom27, !dbg !63
  %8 = load i32, i32* %arrayidx28, align 4, !dbg !63
  call void @printIntLine(i32 %8), !dbg !64
  br label %if.end30, !dbg !65

if.else29:                                        ; preds = %land.lhs.true, %if.else22
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then26
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.end21
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_12_good() #0 !dbg !69 {
entry:
  call void @goodB2G(), !dbg !70
  call void @goodG2B(), !dbg !71
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE126_Buffer_Overread__CWE129_rand_12_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  call void @CWE126_Buffer_Overread__CWE129_rand_12_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !93 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer47 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i32 -1, i32* %data, align 4, !dbg !96
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !97
  %tobool = icmp ne i32 %call, 0, !dbg !97
  br i1 %tobool, label %if.then, label %if.else, !dbg !99

if.then:                                          ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !100
  %and = and i32 %call1, 1, !dbg !100
  %tobool2 = icmp ne i32 %and, 0, !dbg !100
  br i1 %tobool2, label %cond.true, label %cond.false, !dbg !100

cond.true:                                        ; preds = %if.then
  %call3 = call i32 @rand() #5, !dbg !100
  %shl = shl i32 %call3, 30, !dbg !100
  %call4 = call i32 @rand() #5, !dbg !100
  %shl5 = shl i32 %call4, 15, !dbg !100
  %xor = xor i32 %shl, %shl5, !dbg !100
  %call6 = call i32 @rand() #5, !dbg !100
  %xor7 = xor i32 %xor, %call6, !dbg !100
  br label %cond.end, !dbg !100

cond.false:                                       ; preds = %if.then
  %call8 = call i32 @rand() #5, !dbg !100
  %shl9 = shl i32 %call8, 30, !dbg !100
  %call10 = call i32 @rand() #5, !dbg !100
  %shl11 = shl i32 %call10, 15, !dbg !100
  %xor12 = xor i32 %shl9, %shl11, !dbg !100
  %call13 = call i32 @rand() #5, !dbg !100
  %xor14 = xor i32 %xor12, %call13, !dbg !100
  %sub = sub i32 0, %xor14, !dbg !100
  %sub15 = sub i32 %sub, 1, !dbg !100
  br label %cond.end, !dbg !100

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor7, %cond.true ], [ %sub15, %cond.false ], !dbg !100
  store i32 %cond, i32* %data, align 4, !dbg !102
  br label %if.end, !dbg !103

if.else:                                          ; preds = %entry
  %call16 = call i32 @rand() #5, !dbg !104
  %and17 = and i32 %call16, 1, !dbg !104
  %tobool18 = icmp ne i32 %and17, 0, !dbg !104
  br i1 %tobool18, label %cond.true19, label %cond.false27, !dbg !104

cond.true19:                                      ; preds = %if.else
  %call20 = call i32 @rand() #5, !dbg !104
  %shl21 = shl i32 %call20, 30, !dbg !104
  %call22 = call i32 @rand() #5, !dbg !104
  %shl23 = shl i32 %call22, 15, !dbg !104
  %xor24 = xor i32 %shl21, %shl23, !dbg !104
  %call25 = call i32 @rand() #5, !dbg !104
  %xor26 = xor i32 %xor24, %call25, !dbg !104
  br label %cond.end37, !dbg !104

cond.false27:                                     ; preds = %if.else
  %call28 = call i32 @rand() #5, !dbg !104
  %shl29 = shl i32 %call28, 30, !dbg !104
  %call30 = call i32 @rand() #5, !dbg !104
  %shl31 = shl i32 %call30, 15, !dbg !104
  %xor32 = xor i32 %shl29, %shl31, !dbg !104
  %call33 = call i32 @rand() #5, !dbg !104
  %xor34 = xor i32 %xor32, %call33, !dbg !104
  %sub35 = sub i32 0, %xor34, !dbg !104
  %sub36 = sub i32 %sub35, 1, !dbg !104
  br label %cond.end37, !dbg !104

cond.end37:                                       ; preds = %cond.false27, %cond.true19
  %cond38 = phi i32 [ %xor26, %cond.true19 ], [ %sub36, %cond.false27 ], !dbg !104
  store i32 %cond38, i32* %data, align 4, !dbg !106
  br label %if.end

if.end:                                           ; preds = %cond.end37, %cond.end
  %call39 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !107
  %tobool40 = icmp ne i32 %call39, 0, !dbg !107
  br i1 %tobool40, label %if.then41, label %if.else46, !dbg !109

if.then41:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !110, metadata !DIExpression()), !dbg !113
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !113
  %1 = load i32, i32* %data, align 4, !dbg !114
  %cmp = icmp sge i32 %1, 0, !dbg !116
  br i1 %cmp, label %land.lhs.true, label %if.else44, !dbg !117

land.lhs.true:                                    ; preds = %if.then41
  %2 = load i32, i32* %data, align 4, !dbg !118
  %cmp42 = icmp slt i32 %2, 10, !dbg !119
  br i1 %cmp42, label %if.then43, label %if.else44, !dbg !120

if.then43:                                        ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !121
  %idxprom = sext i32 %3 to i64, !dbg !123
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !123
  %4 = load i32, i32* %arrayidx, align 4, !dbg !123
  call void @printIntLine(i32 %4), !dbg !124
  br label %if.end45, !dbg !125

if.else44:                                        ; preds = %land.lhs.true, %if.then41
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !126
  br label %if.end45

if.end45:                                         ; preds = %if.else44, %if.then43
  br label %if.end56, !dbg !128

if.else46:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer47, metadata !129, metadata !DIExpression()), !dbg !132
  %5 = bitcast [10 x i32]* %buffer47 to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false), !dbg !132
  %6 = load i32, i32* %data, align 4, !dbg !133
  %cmp48 = icmp sge i32 %6, 0, !dbg !135
  br i1 %cmp48, label %land.lhs.true49, label %if.else54, !dbg !136

land.lhs.true49:                                  ; preds = %if.else46
  %7 = load i32, i32* %data, align 4, !dbg !137
  %cmp50 = icmp slt i32 %7, 10, !dbg !138
  br i1 %cmp50, label %if.then51, label %if.else54, !dbg !139

if.then51:                                        ; preds = %land.lhs.true49
  %8 = load i32, i32* %data, align 4, !dbg !140
  %idxprom52 = sext i32 %8 to i64, !dbg !142
  %arrayidx53 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer47, i64 0, i64 %idxprom52, !dbg !142
  %9 = load i32, i32* %arrayidx53, align 4, !dbg !142
  call void @printIntLine(i32 %9), !dbg !143
  br label %if.end55, !dbg !144

if.else54:                                        ; preds = %land.lhs.true49, %if.else46
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !145
  br label %if.end55

if.end55:                                         ; preds = %if.else54, %if.then51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end45
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer8 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 -1, i32* %data, align 4, !dbg !151
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !152
  %tobool = icmp ne i32 %call, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.else, !dbg !154

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !155
  br label %if.end, !dbg !157

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !158
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !160
  %tobool2 = icmp ne i32 %call1, 0, !dbg !160
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !162

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !163, metadata !DIExpression()), !dbg !166
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !166
  %1 = load i32, i32* %data, align 4, !dbg !167
  %cmp = icmp sge i32 %1, 0, !dbg !169
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !170

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !171
  %idxprom = sext i32 %2 to i64, !dbg !173
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !173
  %3 = load i32, i32* %arrayidx, align 4, !dbg !173
  call void @printIntLine(i32 %3), !dbg !174
  br label %if.end6, !dbg !175

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !176
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end15, !dbg !178

if.else7:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer8, metadata !179, metadata !DIExpression()), !dbg !182
  %4 = bitcast [10 x i32]* %buffer8 to i8*, !dbg !182
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !182
  %5 = load i32, i32* %data, align 4, !dbg !183
  %cmp9 = icmp sge i32 %5, 0, !dbg !185
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !186

if.then10:                                        ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !187
  %idxprom11 = sext i32 %6 to i64, !dbg !189
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer8, i64 0, i64 %idxprom11, !dbg !189
  %7 = load i32, i32* %arrayidx12, align 4, !dbg !189
  call void @printIntLine(i32 %7), !dbg !190
  br label %if.end14, !dbg !191

if.else13:                                        ; preds = %if.else7
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !192
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end6
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_12_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_12.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !12, file: !13, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 8, scope: !12)
!22 = !DILocation(line: 30, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !13, line: 28, column: 5)
!24 = !DILocation(line: 30, column: 14, scope: !23)
!25 = !DILocation(line: 31, column: 5, scope: !23)
!26 = !DILocation(line: 36, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 5)
!28 = !DILocation(line: 38, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !12, file: !13, line: 38, column: 8)
!30 = !DILocation(line: 38, column: 8, scope: !12)
!31 = !DILocalVariable(name: "buffer", scope: !32, file: !13, line: 41, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !13, line: 40, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 39, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 41, column: 17, scope: !32)
!38 = !DILocation(line: 44, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !13, line: 44, column: 17)
!40 = !DILocation(line: 44, column: 22, scope: !39)
!41 = !DILocation(line: 44, column: 17, scope: !32)
!42 = !DILocation(line: 46, column: 37, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !13, line: 45, column: 13)
!44 = !DILocation(line: 46, column: 30, scope: !43)
!45 = !DILocation(line: 46, column: 17, scope: !43)
!46 = !DILocation(line: 47, column: 13, scope: !43)
!47 = !DILocation(line: 50, column: 17, scope: !48)
!48 = distinct !DILexicalBlock(scope: !39, file: !13, line: 49, column: 13)
!49 = !DILocation(line: 53, column: 5, scope: !33)
!50 = !DILocalVariable(name: "buffer", scope: !51, file: !13, line: 57, type: !34)
!51 = distinct !DILexicalBlock(scope: !52, file: !13, line: 56, column: 9)
!52 = distinct !DILexicalBlock(scope: !29, file: !13, line: 55, column: 5)
!53 = !DILocation(line: 57, column: 17, scope: !51)
!54 = !DILocation(line: 59, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !13, line: 59, column: 17)
!56 = !DILocation(line: 59, column: 22, scope: !55)
!57 = !DILocation(line: 59, column: 27, scope: !55)
!58 = !DILocation(line: 59, column: 30, scope: !55)
!59 = !DILocation(line: 59, column: 35, scope: !55)
!60 = !DILocation(line: 59, column: 17, scope: !51)
!61 = !DILocation(line: 61, column: 37, scope: !62)
!62 = distinct !DILexicalBlock(scope: !55, file: !13, line: 60, column: 13)
!63 = !DILocation(line: 61, column: 30, scope: !62)
!64 = !DILocation(line: 61, column: 17, scope: !62)
!65 = !DILocation(line: 62, column: 13, scope: !62)
!66 = !DILocation(line: 65, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !55, file: !13, line: 64, column: 13)
!68 = !DILocation(line: 69, column: 1, scope: !12)
!69 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_12_good", scope: !13, file: !13, line: 179, type: !14, scopeLine: 180, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 181, column: 5, scope: !69)
!71 = !DILocation(line: 182, column: 5, scope: !69)
!72 = !DILocation(line: 183, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 194, type: !74, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!4, !4, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !13, line: 194, type: !4)
!80 = !DILocation(line: 194, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !13, line: 194, type: !76)
!82 = !DILocation(line: 194, column: 27, scope: !73)
!83 = !DILocation(line: 197, column: 22, scope: !73)
!84 = !DILocation(line: 197, column: 12, scope: !73)
!85 = !DILocation(line: 197, column: 5, scope: !73)
!86 = !DILocation(line: 199, column: 5, scope: !73)
!87 = !DILocation(line: 200, column: 5, scope: !73)
!88 = !DILocation(line: 201, column: 5, scope: !73)
!89 = !DILocation(line: 204, column: 5, scope: !73)
!90 = !DILocation(line: 205, column: 5, scope: !73)
!91 = !DILocation(line: 206, column: 5, scope: !73)
!92 = !DILocation(line: 208, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 78, type: !14, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !13, line: 80, type: !4)
!95 = !DILocation(line: 80, column: 9, scope: !93)
!96 = !DILocation(line: 82, column: 10, scope: !93)
!97 = !DILocation(line: 83, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !13, line: 83, column: 8)
!99 = !DILocation(line: 83, column: 8, scope: !93)
!100 = !DILocation(line: 86, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !13, line: 84, column: 5)
!102 = !DILocation(line: 86, column: 14, scope: !101)
!103 = !DILocation(line: 87, column: 5, scope: !101)
!104 = !DILocation(line: 91, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !13, line: 89, column: 5)
!106 = !DILocation(line: 91, column: 14, scope: !105)
!107 = !DILocation(line: 93, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !93, file: !13, line: 93, column: 8)
!109 = !DILocation(line: 93, column: 8, scope: !93)
!110 = !DILocalVariable(name: "buffer", scope: !111, file: !13, line: 96, type: !34)
!111 = distinct !DILexicalBlock(scope: !112, file: !13, line: 95, column: 9)
!112 = distinct !DILexicalBlock(scope: !108, file: !13, line: 94, column: 5)
!113 = !DILocation(line: 96, column: 17, scope: !111)
!114 = !DILocation(line: 98, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !13, line: 98, column: 17)
!116 = !DILocation(line: 98, column: 22, scope: !115)
!117 = !DILocation(line: 98, column: 27, scope: !115)
!118 = !DILocation(line: 98, column: 30, scope: !115)
!119 = !DILocation(line: 98, column: 35, scope: !115)
!120 = !DILocation(line: 98, column: 17, scope: !111)
!121 = !DILocation(line: 100, column: 37, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !13, line: 99, column: 13)
!123 = !DILocation(line: 100, column: 30, scope: !122)
!124 = !DILocation(line: 100, column: 17, scope: !122)
!125 = !DILocation(line: 101, column: 13, scope: !122)
!126 = !DILocation(line: 104, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !115, file: !13, line: 103, column: 13)
!128 = !DILocation(line: 107, column: 5, scope: !112)
!129 = !DILocalVariable(name: "buffer", scope: !130, file: !13, line: 111, type: !34)
!130 = distinct !DILexicalBlock(scope: !131, file: !13, line: 110, column: 9)
!131 = distinct !DILexicalBlock(scope: !108, file: !13, line: 109, column: 5)
!132 = !DILocation(line: 111, column: 17, scope: !130)
!133 = !DILocation(line: 113, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !13, line: 113, column: 17)
!135 = !DILocation(line: 113, column: 22, scope: !134)
!136 = !DILocation(line: 113, column: 27, scope: !134)
!137 = !DILocation(line: 113, column: 30, scope: !134)
!138 = !DILocation(line: 113, column: 35, scope: !134)
!139 = !DILocation(line: 113, column: 17, scope: !130)
!140 = !DILocation(line: 115, column: 37, scope: !141)
!141 = distinct !DILexicalBlock(scope: !134, file: !13, line: 114, column: 13)
!142 = !DILocation(line: 115, column: 30, scope: !141)
!143 = !DILocation(line: 115, column: 17, scope: !141)
!144 = !DILocation(line: 116, column: 13, scope: !141)
!145 = !DILocation(line: 119, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !134, file: !13, line: 118, column: 13)
!147 = !DILocation(line: 123, column: 1, scope: !93)
!148 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 128, type: !14, scopeLine: 129, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", scope: !148, file: !13, line: 130, type: !4)
!150 = !DILocation(line: 130, column: 9, scope: !148)
!151 = !DILocation(line: 132, column: 10, scope: !148)
!152 = !DILocation(line: 133, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !13, line: 133, column: 8)
!154 = !DILocation(line: 133, column: 8, scope: !148)
!155 = !DILocation(line: 137, column: 14, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !13, line: 134, column: 5)
!157 = !DILocation(line: 138, column: 5, scope: !156)
!158 = !DILocation(line: 143, column: 14, scope: !159)
!159 = distinct !DILexicalBlock(scope: !153, file: !13, line: 140, column: 5)
!160 = !DILocation(line: 145, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !148, file: !13, line: 145, column: 8)
!162 = !DILocation(line: 145, column: 8, scope: !148)
!163 = !DILocalVariable(name: "buffer", scope: !164, file: !13, line: 148, type: !34)
!164 = distinct !DILexicalBlock(scope: !165, file: !13, line: 147, column: 9)
!165 = distinct !DILexicalBlock(scope: !161, file: !13, line: 146, column: 5)
!166 = !DILocation(line: 148, column: 17, scope: !164)
!167 = !DILocation(line: 151, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !13, line: 151, column: 17)
!169 = !DILocation(line: 151, column: 22, scope: !168)
!170 = !DILocation(line: 151, column: 17, scope: !164)
!171 = !DILocation(line: 153, column: 37, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !13, line: 152, column: 13)
!173 = !DILocation(line: 153, column: 30, scope: !172)
!174 = !DILocation(line: 153, column: 17, scope: !172)
!175 = !DILocation(line: 154, column: 13, scope: !172)
!176 = !DILocation(line: 157, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !168, file: !13, line: 156, column: 13)
!178 = !DILocation(line: 160, column: 5, scope: !165)
!179 = !DILocalVariable(name: "buffer", scope: !180, file: !13, line: 164, type: !34)
!180 = distinct !DILexicalBlock(scope: !181, file: !13, line: 163, column: 9)
!181 = distinct !DILexicalBlock(scope: !161, file: !13, line: 162, column: 5)
!182 = !DILocation(line: 164, column: 17, scope: !180)
!183 = !DILocation(line: 167, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !13, line: 167, column: 17)
!185 = !DILocation(line: 167, column: 22, scope: !184)
!186 = !DILocation(line: 167, column: 17, scope: !180)
!187 = !DILocation(line: 169, column: 37, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !13, line: 168, column: 13)
!189 = !DILocation(line: 169, column: 30, scope: !188)
!190 = !DILocation(line: 169, column: 17, scope: !188)
!191 = !DILocation(line: 170, column: 13, scope: !188)
!192 = !DILocation(line: 173, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !184, file: !13, line: 172, column: 13)
!194 = !DILocation(line: 177, column: 1, scope: !148)
