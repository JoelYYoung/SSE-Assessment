; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_11.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 (...) @globalReturnsTrue(), !dbg !19
  %tobool = icmp ne i32 %call, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !22
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !24
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 (...) @globalReturnsTrue(), !dbg !26
  %tobool3 = icmp ne i32 %call2, 0, !dbg !26
  br i1 %tobool3, label %if.then4, label %if.end7, !dbg !28

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !29, metadata !DIExpression()), !dbg !35
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !35
  %2 = load i32, i32* %data, align 4, !dbg !36
  %cmp = icmp sge i32 %2, 0, !dbg !38
  br i1 %cmp, label %if.then5, label %if.else, !dbg !39

if.then5:                                         ; preds = %if.then4
  %3 = load i32, i32* %data, align 4, !dbg !40
  %idxprom = sext i32 %3 to i64, !dbg !42
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !42
  %4 = load i32, i32* %arrayidx, align 4, !dbg !42
  call void @printIntLine(i32 %4), !dbg !43
  br label %if.end6, !dbg !44

if.else:                                          ; preds = %if.then4
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !45
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then5
  br label %if.end7, !dbg !47

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_11_good() #0 !dbg !49 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__CWE129_fscanf_11_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__CWE129_fscanf_11_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !75 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %call = call i32 (...) @globalReturnsTrue(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !82
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !84
  br label %if.end, !dbg !85

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 (...) @globalReturnsFalse(), !dbg !86
  %tobool3 = icmp ne i32 %call2, 0, !dbg !86
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !88

if.then4:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !89
  br label %if.end9, !dbg !91

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !92, metadata !DIExpression()), !dbg !95
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !95
  %2 = load i32, i32* %data, align 4, !dbg !96
  %cmp = icmp sge i32 %2, 0, !dbg !98
  br i1 %cmp, label %land.lhs.true, label %if.else7, !dbg !99

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data, align 4, !dbg !100
  %cmp5 = icmp slt i32 %3, 10, !dbg !101
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !102

if.then6:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !103
  %idxprom = sext i32 %4 to i64, !dbg !105
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !105
  %5 = load i32, i32* %arrayidx, align 4, !dbg !105
  call void @printIntLine(i32 %5), !dbg !106
  br label %if.end8, !dbg !107

if.else7:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !108
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then4
  ret void, !dbg !110
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !111 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 -1, i32* %data, align 4, !dbg !114
  %call = call i32 (...) @globalReturnsTrue(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !118
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 (...) @globalReturnsTrue(), !dbg !122
  %tobool3 = icmp ne i32 %call2, 0, !dbg !122
  br i1 %tobool3, label %if.then4, label %if.end8, !dbg !124

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !125, metadata !DIExpression()), !dbg !128
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !128
  %2 = load i32, i32* %data, align 4, !dbg !129
  %cmp = icmp sge i32 %2, 0, !dbg !131
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !132

land.lhs.true:                                    ; preds = %if.then4
  %3 = load i32, i32* %data, align 4, !dbg !133
  %cmp5 = icmp slt i32 %3, 10, !dbg !134
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !135

if.then6:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !136
  %idxprom = sext i32 %4 to i64, !dbg !138
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !138
  %5 = load i32, i32* %arrayidx, align 4, !dbg !138
  call void @printIntLine(i32 %5), !dbg !139
  br label %if.end7, !dbg !140

if.else:                                          ; preds = %land.lhs.true, %if.then4
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !141
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then6
  br label %if.end8, !dbg !143

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !145 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !146, metadata !DIExpression()), !dbg !147
  store i32 -1, i32* %data, align 4, !dbg !148
  %call = call i32 (...) @globalReturnsFalse(), !dbg !149
  %tobool = icmp ne i32 %call, 0, !dbg !149
  br i1 %tobool, label %if.then, label %if.else, !dbg !151

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !152
  br label %if.end, !dbg !154

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !155
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !157
  %tobool2 = icmp ne i32 %call1, 0, !dbg !157
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !159

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !160, metadata !DIExpression()), !dbg !163
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !163
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !163
  %1 = load i32, i32* %data, align 4, !dbg !164
  %cmp = icmp sge i32 %1, 0, !dbg !166
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !167

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !168
  %idxprom = sext i32 %2 to i64, !dbg !170
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !170
  %3 = load i32, i32* %arrayidx, align 4, !dbg !170
  call void @printIntLine(i32 %3), !dbg !171
  br label %if.end6, !dbg !172

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !173
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !175

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !177 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !178, metadata !DIExpression()), !dbg !179
  store i32 -1, i32* %data, align 4, !dbg !180
  %call = call i32 (...) @globalReturnsTrue(), !dbg !181
  %tobool = icmp ne i32 %call, 0, !dbg !181
  br i1 %tobool, label %if.then, label %if.end, !dbg !183

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !184
  br label %if.end, !dbg !186

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !187
  %tobool2 = icmp ne i32 %call1, 0, !dbg !187
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !189

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !190, metadata !DIExpression()), !dbg !193
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !193
  %1 = load i32, i32* %data, align 4, !dbg !194
  %cmp = icmp sge i32 %1, 0, !dbg !196
  br i1 %cmp, label %if.then4, label %if.else, !dbg !197

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !198
  %idxprom = sext i32 %2 to i64, !dbg !200
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !200
  %3 = load i32, i32* %arrayidx, align 4, !dbg !200
  call void @printIntLine(i32 %3), !dbg !201
  br label %if.end5, !dbg !202

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !203
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !205

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !206
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_11_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_11.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 8, scope: !11)
!22 = !DILocation(line: 30, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !12, line: 28, column: 5)
!24 = !DILocation(line: 30, column: 9, scope: !23)
!25 = !DILocation(line: 31, column: 5, scope: !23)
!26 = !DILocation(line: 32, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!28 = !DILocation(line: 32, column: 8, scope: !11)
!29 = !DILocalVariable(name: "buffer", scope: !30, file: !12, line: 35, type: !32)
!30 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 9)
!31 = distinct !DILexicalBlock(scope: !27, file: !12, line: 33, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DILocation(line: 35, column: 17, scope: !30)
!36 = !DILocation(line: 38, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !12, line: 38, column: 17)
!38 = !DILocation(line: 38, column: 22, scope: !37)
!39 = !DILocation(line: 38, column: 17, scope: !30)
!40 = !DILocation(line: 40, column: 37, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 39, column: 13)
!42 = !DILocation(line: 40, column: 30, scope: !41)
!43 = !DILocation(line: 40, column: 17, scope: !41)
!44 = !DILocation(line: 41, column: 13, scope: !41)
!45 = !DILocation(line: 44, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !37, file: !12, line: 43, column: 13)
!47 = !DILocation(line: 47, column: 5, scope: !31)
!48 = !DILocation(line: 48, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_11_good", scope: !12, file: !12, line: 180, type: !13, scopeLine: 181, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 182, column: 5, scope: !49)
!51 = !DILocation(line: 183, column: 5, scope: !49)
!52 = !DILocation(line: 184, column: 5, scope: !49)
!53 = !DILocation(line: 185, column: 5, scope: !49)
!54 = !DILocation(line: 186, column: 1, scope: !49)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 197, type: !56, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!16, !16, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 197, type: !16)
!62 = !DILocation(line: 197, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 197, type: !58)
!64 = !DILocation(line: 197, column: 27, scope: !55)
!65 = !DILocation(line: 200, column: 22, scope: !55)
!66 = !DILocation(line: 200, column: 12, scope: !55)
!67 = !DILocation(line: 200, column: 5, scope: !55)
!68 = !DILocation(line: 202, column: 5, scope: !55)
!69 = !DILocation(line: 203, column: 5, scope: !55)
!70 = !DILocation(line: 204, column: 5, scope: !55)
!71 = !DILocation(line: 207, column: 5, scope: !55)
!72 = !DILocation(line: 208, column: 5, scope: !55)
!73 = !DILocation(line: 209, column: 5, scope: !55)
!74 = !DILocation(line: 211, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 57, type: !16)
!77 = !DILocation(line: 57, column: 9, scope: !75)
!78 = !DILocation(line: 59, column: 10, scope: !75)
!79 = !DILocation(line: 60, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !12, line: 60, column: 8)
!81 = !DILocation(line: 60, column: 8, scope: !75)
!82 = !DILocation(line: 63, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 61, column: 5)
!84 = !DILocation(line: 63, column: 9, scope: !83)
!85 = !DILocation(line: 64, column: 5, scope: !83)
!86 = !DILocation(line: 65, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !75, file: !12, line: 65, column: 8)
!88 = !DILocation(line: 65, column: 8, scope: !75)
!89 = !DILocation(line: 68, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 66, column: 5)
!91 = !DILocation(line: 69, column: 5, scope: !90)
!92 = !DILocalVariable(name: "buffer", scope: !93, file: !12, line: 73, type: !32)
!93 = distinct !DILexicalBlock(scope: !94, file: !12, line: 72, column: 9)
!94 = distinct !DILexicalBlock(scope: !87, file: !12, line: 71, column: 5)
!95 = !DILocation(line: 73, column: 17, scope: !93)
!96 = !DILocation(line: 75, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 75, column: 17)
!98 = !DILocation(line: 75, column: 22, scope: !97)
!99 = !DILocation(line: 75, column: 27, scope: !97)
!100 = !DILocation(line: 75, column: 30, scope: !97)
!101 = !DILocation(line: 75, column: 35, scope: !97)
!102 = !DILocation(line: 75, column: 17, scope: !93)
!103 = !DILocation(line: 77, column: 37, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !12, line: 76, column: 13)
!105 = !DILocation(line: 77, column: 30, scope: !104)
!106 = !DILocation(line: 77, column: 17, scope: !104)
!107 = !DILocation(line: 78, column: 13, scope: !104)
!108 = !DILocation(line: 81, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !97, file: !12, line: 80, column: 13)
!110 = !DILocation(line: 85, column: 1, scope: !75)
!111 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 90, type: !16)
!113 = !DILocation(line: 90, column: 9, scope: !111)
!114 = !DILocation(line: 92, column: 10, scope: !111)
!115 = !DILocation(line: 93, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !12, line: 93, column: 8)
!117 = !DILocation(line: 93, column: 8, scope: !111)
!118 = !DILocation(line: 96, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 94, column: 5)
!120 = !DILocation(line: 96, column: 9, scope: !119)
!121 = !DILocation(line: 97, column: 5, scope: !119)
!122 = !DILocation(line: 98, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !111, file: !12, line: 98, column: 8)
!124 = !DILocation(line: 98, column: 8, scope: !111)
!125 = !DILocalVariable(name: "buffer", scope: !126, file: !12, line: 101, type: !32)
!126 = distinct !DILexicalBlock(scope: !127, file: !12, line: 100, column: 9)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 99, column: 5)
!128 = !DILocation(line: 101, column: 17, scope: !126)
!129 = !DILocation(line: 103, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 103, column: 17)
!131 = !DILocation(line: 103, column: 22, scope: !130)
!132 = !DILocation(line: 103, column: 27, scope: !130)
!133 = !DILocation(line: 103, column: 30, scope: !130)
!134 = !DILocation(line: 103, column: 35, scope: !130)
!135 = !DILocation(line: 103, column: 17, scope: !126)
!136 = !DILocation(line: 105, column: 37, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !12, line: 104, column: 13)
!138 = !DILocation(line: 105, column: 30, scope: !137)
!139 = !DILocation(line: 105, column: 17, scope: !137)
!140 = !DILocation(line: 106, column: 13, scope: !137)
!141 = !DILocation(line: 109, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !130, file: !12, line: 108, column: 13)
!143 = !DILocation(line: 112, column: 5, scope: !127)
!144 = !DILocation(line: 113, column: 1, scope: !111)
!145 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !12, line: 118, type: !16)
!147 = !DILocation(line: 118, column: 9, scope: !145)
!148 = !DILocation(line: 120, column: 10, scope: !145)
!149 = !DILocation(line: 121, column: 8, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !12, line: 121, column: 8)
!151 = !DILocation(line: 121, column: 8, scope: !145)
!152 = !DILocation(line: 124, column: 9, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !12, line: 122, column: 5)
!154 = !DILocation(line: 125, column: 5, scope: !153)
!155 = !DILocation(line: 130, column: 14, scope: !156)
!156 = distinct !DILexicalBlock(scope: !150, file: !12, line: 127, column: 5)
!157 = !DILocation(line: 132, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !145, file: !12, line: 132, column: 8)
!159 = !DILocation(line: 132, column: 8, scope: !145)
!160 = !DILocalVariable(name: "buffer", scope: !161, file: !12, line: 135, type: !32)
!161 = distinct !DILexicalBlock(scope: !162, file: !12, line: 134, column: 9)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 133, column: 5)
!163 = !DILocation(line: 135, column: 17, scope: !161)
!164 = !DILocation(line: 138, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 138, column: 17)
!166 = !DILocation(line: 138, column: 22, scope: !165)
!167 = !DILocation(line: 138, column: 17, scope: !161)
!168 = !DILocation(line: 140, column: 37, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !12, line: 139, column: 13)
!170 = !DILocation(line: 140, column: 30, scope: !169)
!171 = !DILocation(line: 140, column: 17, scope: !169)
!172 = !DILocation(line: 141, column: 13, scope: !169)
!173 = !DILocation(line: 144, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !165, file: !12, line: 143, column: 13)
!175 = !DILocation(line: 147, column: 5, scope: !162)
!176 = !DILocation(line: 148, column: 1, scope: !145)
!177 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 151, type: !13, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!178 = !DILocalVariable(name: "data", scope: !177, file: !12, line: 153, type: !16)
!179 = !DILocation(line: 153, column: 9, scope: !177)
!180 = !DILocation(line: 155, column: 10, scope: !177)
!181 = !DILocation(line: 156, column: 8, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !12, line: 156, column: 8)
!183 = !DILocation(line: 156, column: 8, scope: !177)
!184 = !DILocation(line: 160, column: 14, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !12, line: 157, column: 5)
!186 = !DILocation(line: 161, column: 5, scope: !185)
!187 = !DILocation(line: 162, column: 8, scope: !188)
!188 = distinct !DILexicalBlock(scope: !177, file: !12, line: 162, column: 8)
!189 = !DILocation(line: 162, column: 8, scope: !177)
!190 = !DILocalVariable(name: "buffer", scope: !191, file: !12, line: 165, type: !32)
!191 = distinct !DILexicalBlock(scope: !192, file: !12, line: 164, column: 9)
!192 = distinct !DILexicalBlock(scope: !188, file: !12, line: 163, column: 5)
!193 = !DILocation(line: 165, column: 17, scope: !191)
!194 = !DILocation(line: 168, column: 17, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !12, line: 168, column: 17)
!196 = !DILocation(line: 168, column: 22, scope: !195)
!197 = !DILocation(line: 168, column: 17, scope: !191)
!198 = !DILocation(line: 170, column: 37, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !12, line: 169, column: 13)
!200 = !DILocation(line: 170, column: 30, scope: !199)
!201 = !DILocation(line: 170, column: 17, scope: !199)
!202 = !DILocation(line: 171, column: 13, scope: !199)
!203 = !DILocation(line: 174, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !195, file: !12, line: 173, column: 13)
!205 = !DILocation(line: 177, column: 5, scope: !192)
!206 = !DILocation(line: 178, column: 1, scope: !177)
