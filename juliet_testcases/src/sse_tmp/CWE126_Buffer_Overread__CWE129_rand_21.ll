; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_21.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !9
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !12
@goodG2BStatic = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 -1, i32* %data, align 4, !dbg !27
  %call = call i32 @rand() #5, !dbg !28
  %and = and i32 %call, 1, !dbg !28
  %tobool = icmp ne i32 %and, 0, !dbg !28
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !28

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !28
  %shl = shl i32 %call1, 30, !dbg !28
  %call2 = call i32 @rand() #5, !dbg !28
  %shl3 = shl i32 %call2, 15, !dbg !28
  %xor = xor i32 %shl, %shl3, !dbg !28
  %call4 = call i32 @rand() #5, !dbg !28
  %xor5 = xor i32 %xor, %call4, !dbg !28
  br label %cond.end, !dbg !28

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !28
  %shl7 = shl i32 %call6, 30, !dbg !28
  %call8 = call i32 @rand() #5, !dbg !28
  %shl9 = shl i32 %call8, 15, !dbg !28
  %xor10 = xor i32 %shl7, %shl9, !dbg !28
  %call11 = call i32 @rand() #5, !dbg !28
  %xor12 = xor i32 %xor10, %call11, !dbg !28
  %sub = sub i32 0, %xor12, !dbg !28
  %sub13 = sub i32 %sub, 1, !dbg !28
  br label %cond.end, !dbg !28

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !28
  store i32 %cond, i32* %data, align 4, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32, i32* %data, align 4, !dbg !31
  call void @badSink(i32 %0), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @badStatic, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end2, !dbg !41

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !42, metadata !DIExpression()), !dbg !48
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !48
  %2 = load i32, i32* %data.addr, align 4, !dbg !49
  %cmp = icmp sge i32 %2, 0, !dbg !51
  br i1 %cmp, label %if.then1, label %if.else, !dbg !52

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !53
  %idxprom = sext i32 %3 to i64, !dbg !55
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !55
  %4 = load i32, i32* %arrayidx, align 4, !dbg !55
  call void @printIntLine(i32 %4), !dbg !56
  br label %if.end, !dbg !57

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !58
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !60

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_21_good() #0 !dbg !62 {
entry:
  call void @goodB2G1(), !dbg !63
  call void @goodB2G2(), !dbg !64
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__CWE129_rand_21_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__CWE129_rand_21_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !87 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 -1, i32* %data, align 4, !dbg !90
  %call = call i32 @rand() #5, !dbg !91
  %and = and i32 %call, 1, !dbg !91
  %tobool = icmp ne i32 %and, 0, !dbg !91
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !91

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !91
  %shl = shl i32 %call1, 30, !dbg !91
  %call2 = call i32 @rand() #5, !dbg !91
  %shl3 = shl i32 %call2, 15, !dbg !91
  %xor = xor i32 %shl, %shl3, !dbg !91
  %call4 = call i32 @rand() #5, !dbg !91
  %xor5 = xor i32 %xor, %call4, !dbg !91
  br label %cond.end, !dbg !91

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !91
  %shl7 = shl i32 %call6, 30, !dbg !91
  %call8 = call i32 @rand() #5, !dbg !91
  %shl9 = shl i32 %call8, 15, !dbg !91
  %xor10 = xor i32 %shl7, %shl9, !dbg !91
  %call11 = call i32 @rand() #5, !dbg !91
  %xor12 = xor i32 %xor10, %call11, !dbg !91
  %sub = sub i32 0, %xor12, !dbg !91
  %sub13 = sub i32 %sub, 1, !dbg !91
  br label %cond.end, !dbg !91

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !91
  store i32 %cond, i32* %data, align 4, !dbg !92
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !93
  %0 = load i32, i32* %data, align 4, !dbg !94
  call void @goodB2G1Sink(i32 %0), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !100
  %tobool = icmp ne i32 %0, 0, !dbg !100
  br i1 %tobool, label %if.then, label %if.else, !dbg !102

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !103
  br label %if.end4, !dbg !105

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !106, metadata !DIExpression()), !dbg !109
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !109
  %2 = load i32, i32* %data.addr, align 4, !dbg !110
  %cmp = icmp sge i32 %2, 0, !dbg !112
  br i1 %cmp, label %land.lhs.true, label %if.else3, !dbg !113

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !114
  %cmp1 = icmp slt i32 %3, 10, !dbg !115
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !116

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !117
  %idxprom = sext i32 %4 to i64, !dbg !119
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !119
  %5 = load i32, i32* %arrayidx, align 4, !dbg !119
  call void @printIntLine(i32 %5), !dbg !120
  br label %if.end, !dbg !121

if.else3:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !125 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i32 -1, i32* %data, align 4, !dbg !128
  %call = call i32 @rand() #5, !dbg !129
  %and = and i32 %call, 1, !dbg !129
  %tobool = icmp ne i32 %and, 0, !dbg !129
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !129

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !129
  %shl = shl i32 %call1, 30, !dbg !129
  %call2 = call i32 @rand() #5, !dbg !129
  %shl3 = shl i32 %call2, 15, !dbg !129
  %xor = xor i32 %shl, %shl3, !dbg !129
  %call4 = call i32 @rand() #5, !dbg !129
  %xor5 = xor i32 %xor, %call4, !dbg !129
  br label %cond.end, !dbg !129

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !129
  %shl7 = shl i32 %call6, 30, !dbg !129
  %call8 = call i32 @rand() #5, !dbg !129
  %shl9 = shl i32 %call8, 15, !dbg !129
  %xor10 = xor i32 %shl7, %shl9, !dbg !129
  %call11 = call i32 @rand() #5, !dbg !129
  %xor12 = xor i32 %xor10, %call11, !dbg !129
  %sub = sub i32 0, %xor12, !dbg !129
  %sub13 = sub i32 %sub, 1, !dbg !129
  br label %cond.end, !dbg !129

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !129
  store i32 %cond, i32* %data, align 4, !dbg !130
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !131
  %0 = load i32, i32* %data, align 4, !dbg !132
  call void @goodB2G2Sink(i32 %0), !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !135 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !136, metadata !DIExpression()), !dbg !137
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !138
  %tobool = icmp ne i32 %0, 0, !dbg !138
  br i1 %tobool, label %if.then, label %if.end3, !dbg !140

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !141, metadata !DIExpression()), !dbg !144
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !144
  %2 = load i32, i32* %data.addr, align 4, !dbg !145
  %cmp = icmp sge i32 %2, 0, !dbg !147
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !148

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !149
  %cmp1 = icmp slt i32 %3, 10, !dbg !150
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !151

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !152
  %idxprom = sext i32 %4 to i64, !dbg !154
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !154
  %5 = load i32, i32* %arrayidx, align 4, !dbg !154
  call void @printIntLine(i32 %5), !dbg !155
  br label %if.end, !dbg !156

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !157
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !159

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !161 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !162, metadata !DIExpression()), !dbg !163
  store i32 -1, i32* %data, align 4, !dbg !164
  store i32 7, i32* %data, align 4, !dbg !165
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !166
  %0 = load i32, i32* %data, align 4, !dbg !167
  call void @goodG2BSink(i32 %0), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !170 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !171, metadata !DIExpression()), !dbg !172
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !173
  %tobool = icmp ne i32 %0, 0, !dbg !173
  br i1 %tobool, label %if.then, label %if.end2, !dbg !175

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !176, metadata !DIExpression()), !dbg !179
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !179
  %2 = load i32, i32* %data.addr, align 4, !dbg !180
  %cmp = icmp sge i32 %2, 0, !dbg !182
  br i1 %cmp, label %if.then1, label %if.else, !dbg !183

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !184
  %idxprom = sext i32 %3 to i64, !dbg !186
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !186
  %4 = load i32, i32* %arrayidx, align 4, !dbg !186
  call void @printIntLine(i32 %4), !dbg !187
  br label %if.end, !dbg !188

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !189
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !191

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !192
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !11, line: 23, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !12, !14}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !11, line: 61, type: !6, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_21.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !11, line: 62, type: !6, isLocal: true, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !11, line: 63, type: !6, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_21_bad", scope: !11, file: !11, line: 45, type: !23, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !11, line: 47, type: !6)
!26 = !DILocation(line: 47, column: 9, scope: !22)
!27 = !DILocation(line: 49, column: 10, scope: !22)
!28 = !DILocation(line: 51, column: 12, scope: !22)
!29 = !DILocation(line: 51, column: 10, scope: !22)
!30 = !DILocation(line: 52, column: 15, scope: !22)
!31 = !DILocation(line: 53, column: 13, scope: !22)
!32 = !DILocation(line: 53, column: 5, scope: !22)
!33 = !DILocation(line: 54, column: 1, scope: !22)
!34 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 25, type: !35, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !6}
!37 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !11, line: 25, type: !6)
!38 = !DILocation(line: 25, column: 25, scope: !34)
!39 = !DILocation(line: 27, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !11, line: 27, column: 8)
!41 = !DILocation(line: 27, column: 8, scope: !34)
!42 = !DILocalVariable(name: "buffer", scope: !43, file: !11, line: 30, type: !45)
!43 = distinct !DILexicalBlock(scope: !44, file: !11, line: 29, column: 9)
!44 = distinct !DILexicalBlock(scope: !40, file: !11, line: 28, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 10)
!48 = !DILocation(line: 30, column: 17, scope: !43)
!49 = !DILocation(line: 33, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !43, file: !11, line: 33, column: 17)
!51 = !DILocation(line: 33, column: 22, scope: !50)
!52 = !DILocation(line: 33, column: 17, scope: !43)
!53 = !DILocation(line: 35, column: 37, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !11, line: 34, column: 13)
!55 = !DILocation(line: 35, column: 30, scope: !54)
!56 = !DILocation(line: 35, column: 17, scope: !54)
!57 = !DILocation(line: 36, column: 13, scope: !54)
!58 = !DILocation(line: 39, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !50, file: !11, line: 38, column: 13)
!60 = !DILocation(line: 42, column: 5, scope: !44)
!61 = !DILocation(line: 43, column: 1, scope: !34)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_21_good", scope: !11, file: !11, line: 165, type: !23, scopeLine: 166, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocation(line: 167, column: 5, scope: !62)
!64 = !DILocation(line: 168, column: 5, scope: !62)
!65 = !DILocation(line: 169, column: 5, scope: !62)
!66 = !DILocation(line: 170, column: 1, scope: !62)
!67 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 181, type: !68, scopeLine: 182, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!6, !6, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !11, line: 181, type: !6)
!74 = !DILocation(line: 181, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !11, line: 181, type: !70)
!76 = !DILocation(line: 181, column: 27, scope: !67)
!77 = !DILocation(line: 184, column: 22, scope: !67)
!78 = !DILocation(line: 184, column: 12, scope: !67)
!79 = !DILocation(line: 184, column: 5, scope: !67)
!80 = !DILocation(line: 186, column: 5, scope: !67)
!81 = !DILocation(line: 187, column: 5, scope: !67)
!82 = !DILocation(line: 188, column: 5, scope: !67)
!83 = !DILocation(line: 191, column: 5, scope: !67)
!84 = !DILocation(line: 192, column: 5, scope: !67)
!85 = !DILocation(line: 193, column: 5, scope: !67)
!86 = !DILocation(line: 195, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 90, type: !23, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocalVariable(name: "data", scope: !87, file: !11, line: 92, type: !6)
!89 = !DILocation(line: 92, column: 9, scope: !87)
!90 = !DILocation(line: 94, column: 10, scope: !87)
!91 = !DILocation(line: 96, column: 12, scope: !87)
!92 = !DILocation(line: 96, column: 10, scope: !87)
!93 = !DILocation(line: 97, column: 20, scope: !87)
!94 = !DILocation(line: 98, column: 18, scope: !87)
!95 = !DILocation(line: 98, column: 5, scope: !87)
!96 = !DILocation(line: 99, column: 1, scope: !87)
!97 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !11, file: !11, line: 66, type: !35, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !11, line: 66, type: !6)
!99 = !DILocation(line: 66, column: 30, scope: !97)
!100 = !DILocation(line: 68, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !11, line: 68, column: 8)
!102 = !DILocation(line: 68, column: 8, scope: !97)
!103 = !DILocation(line: 71, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !11, line: 69, column: 5)
!105 = !DILocation(line: 72, column: 5, scope: !104)
!106 = !DILocalVariable(name: "buffer", scope: !107, file: !11, line: 76, type: !45)
!107 = distinct !DILexicalBlock(scope: !108, file: !11, line: 75, column: 9)
!108 = distinct !DILexicalBlock(scope: !101, file: !11, line: 74, column: 5)
!109 = !DILocation(line: 76, column: 17, scope: !107)
!110 = !DILocation(line: 78, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !11, line: 78, column: 17)
!112 = !DILocation(line: 78, column: 22, scope: !111)
!113 = !DILocation(line: 78, column: 27, scope: !111)
!114 = !DILocation(line: 78, column: 30, scope: !111)
!115 = !DILocation(line: 78, column: 35, scope: !111)
!116 = !DILocation(line: 78, column: 17, scope: !107)
!117 = !DILocation(line: 80, column: 37, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !11, line: 79, column: 13)
!119 = !DILocation(line: 80, column: 30, scope: !118)
!120 = !DILocation(line: 80, column: 17, scope: !118)
!121 = !DILocation(line: 81, column: 13, scope: !118)
!122 = !DILocation(line: 84, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !111, file: !11, line: 83, column: 13)
!124 = !DILocation(line: 88, column: 1, scope: !97)
!125 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 121, type: !23, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !11, line: 123, type: !6)
!127 = !DILocation(line: 123, column: 9, scope: !125)
!128 = !DILocation(line: 125, column: 10, scope: !125)
!129 = !DILocation(line: 127, column: 12, scope: !125)
!130 = !DILocation(line: 127, column: 10, scope: !125)
!131 = !DILocation(line: 128, column: 20, scope: !125)
!132 = !DILocation(line: 129, column: 18, scope: !125)
!133 = !DILocation(line: 129, column: 5, scope: !125)
!134 = !DILocation(line: 130, column: 1, scope: !125)
!135 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !11, file: !11, line: 102, type: !35, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!136 = !DILocalVariable(name: "data", arg: 1, scope: !135, file: !11, line: 102, type: !6)
!137 = !DILocation(line: 102, column: 30, scope: !135)
!138 = !DILocation(line: 104, column: 8, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !11, line: 104, column: 8)
!140 = !DILocation(line: 104, column: 8, scope: !135)
!141 = !DILocalVariable(name: "buffer", scope: !142, file: !11, line: 107, type: !45)
!142 = distinct !DILexicalBlock(scope: !143, file: !11, line: 106, column: 9)
!143 = distinct !DILexicalBlock(scope: !139, file: !11, line: 105, column: 5)
!144 = !DILocation(line: 107, column: 17, scope: !142)
!145 = !DILocation(line: 109, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !11, line: 109, column: 17)
!147 = !DILocation(line: 109, column: 22, scope: !146)
!148 = !DILocation(line: 109, column: 27, scope: !146)
!149 = !DILocation(line: 109, column: 30, scope: !146)
!150 = !DILocation(line: 109, column: 35, scope: !146)
!151 = !DILocation(line: 109, column: 17, scope: !142)
!152 = !DILocation(line: 111, column: 37, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !11, line: 110, column: 13)
!154 = !DILocation(line: 111, column: 30, scope: !153)
!155 = !DILocation(line: 111, column: 17, scope: !153)
!156 = !DILocation(line: 112, column: 13, scope: !153)
!157 = !DILocation(line: 115, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !146, file: !11, line: 114, column: 13)
!159 = !DILocation(line: 118, column: 5, scope: !143)
!160 = !DILocation(line: 119, column: 1, scope: !135)
!161 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 153, type: !23, scopeLine: 154, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!162 = !DILocalVariable(name: "data", scope: !161, file: !11, line: 155, type: !6)
!163 = !DILocation(line: 155, column: 9, scope: !161)
!164 = !DILocation(line: 157, column: 10, scope: !161)
!165 = !DILocation(line: 160, column: 10, scope: !161)
!166 = !DILocation(line: 161, column: 19, scope: !161)
!167 = !DILocation(line: 162, column: 17, scope: !161)
!168 = !DILocation(line: 162, column: 5, scope: !161)
!169 = !DILocation(line: 163, column: 1, scope: !161)
!170 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 133, type: !35, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocalVariable(name: "data", arg: 1, scope: !170, file: !11, line: 133, type: !6)
!172 = !DILocation(line: 133, column: 29, scope: !170)
!173 = !DILocation(line: 135, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !11, line: 135, column: 8)
!175 = !DILocation(line: 135, column: 8, scope: !170)
!176 = !DILocalVariable(name: "buffer", scope: !177, file: !11, line: 138, type: !45)
!177 = distinct !DILexicalBlock(scope: !178, file: !11, line: 137, column: 9)
!178 = distinct !DILexicalBlock(scope: !174, file: !11, line: 136, column: 5)
!179 = !DILocation(line: 138, column: 17, scope: !177)
!180 = !DILocation(line: 141, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !11, line: 141, column: 17)
!182 = !DILocation(line: 141, column: 22, scope: !181)
!183 = !DILocation(line: 141, column: 17, scope: !177)
!184 = !DILocation(line: 143, column: 37, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !11, line: 142, column: 13)
!186 = !DILocation(line: 143, column: 30, scope: !185)
!187 = !DILocation(line: 143, column: 17, scope: !185)
!188 = !DILocation(line: 144, column: 13, scope: !185)
!189 = !DILocation(line: 147, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !181, file: !11, line: 146, column: 13)
!191 = !DILocation(line: 150, column: 5, scope: !178)
!192 = !DILocation(line: 151, column: 1, scope: !170)
