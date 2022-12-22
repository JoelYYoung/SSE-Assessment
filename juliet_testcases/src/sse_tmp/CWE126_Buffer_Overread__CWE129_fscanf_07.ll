; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@staticFive = internal global i32 5, align 4, !dbg !0
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
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %0 = load i32, i32* @staticFive, align 4, !dbg !22
  %cmp = icmp eq i32 %0, 5, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !26
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !28
  br label %if.end, !dbg !29

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp1 = icmp eq i32 %2, 5, !dbg !32
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !33

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !34, metadata !DIExpression()), !dbg !40
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !40
  %4 = load i32, i32* %data, align 4, !dbg !41
  %cmp3 = icmp sge i32 %4, 0, !dbg !43
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !44

if.then4:                                         ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !45
  %idxprom = sext i32 %5 to i64, !dbg !47
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !47
  %6 = load i32, i32* %arrayidx, align 4, !dbg !47
  call void @printIntLine(i32 %6), !dbg !48
  br label %if.end5, !dbg !49

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !52

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_07_good() #0 !dbg !54 {
entry:
  call void @goodB2G1(), !dbg !55
  call void @goodB2G2(), !dbg !56
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__CWE129_fscanf_07_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE129_fscanf_07_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !80 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  %0 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp eq i32 %0, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !88
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !90
  br label %if.end, !dbg !91

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !92
  %cmp1 = icmp ne i32 %2, 5, !dbg !94
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !95

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !96
  br label %if.end8, !dbg !98

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !99, metadata !DIExpression()), !dbg !102
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !102
  %4 = load i32, i32* %data, align 4, !dbg !103
  %cmp3 = icmp sge i32 %4, 0, !dbg !105
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !106

land.lhs.true:                                    ; preds = %if.else
  %5 = load i32, i32* %data, align 4, !dbg !107
  %cmp4 = icmp slt i32 %5, 10, !dbg !108
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !109

if.then5:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !110
  %idxprom = sext i32 %6 to i64, !dbg !112
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !112
  %7 = load i32, i32* %arrayidx, align 4, !dbg !112
  call void @printIntLine(i32 %7), !dbg !113
  br label %if.end7, !dbg !114

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !115
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then2
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !118 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i32 -1, i32* %data, align 4, !dbg !121
  %0 = load i32, i32* @staticFive, align 4, !dbg !122
  %cmp = icmp eq i32 %0, 5, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !126
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !130
  %cmp1 = icmp eq i32 %2, 5, !dbg !132
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !133

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !134, metadata !DIExpression()), !dbg !137
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !137
  %4 = load i32, i32* %data, align 4, !dbg !138
  %cmp3 = icmp sge i32 %4, 0, !dbg !140
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !141

land.lhs.true:                                    ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !142
  %cmp4 = icmp slt i32 %5, 10, !dbg !143
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !144

if.then5:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !145
  %idxprom = sext i32 %6 to i64, !dbg !147
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !147
  %7 = load i32, i32* %arrayidx, align 4, !dbg !147
  call void @printIntLine(i32 %7), !dbg !148
  br label %if.end6, !dbg !149

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !150
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then5
  br label %if.end7, !dbg !152

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !154 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !155, metadata !DIExpression()), !dbg !156
  store i32 -1, i32* %data, align 4, !dbg !157
  %0 = load i32, i32* @staticFive, align 4, !dbg !158
  %cmp = icmp ne i32 %0, 5, !dbg !160
  br i1 %cmp, label %if.then, label %if.else, !dbg !161

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !162
  br label %if.end, !dbg !164

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !165
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !167
  %cmp1 = icmp eq i32 %1, 5, !dbg !169
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !170

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !171, metadata !DIExpression()), !dbg !174
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !174
  %3 = load i32, i32* %data, align 4, !dbg !175
  %cmp3 = icmp sge i32 %3, 0, !dbg !177
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !178

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !179
  %idxprom = sext i32 %4 to i64, !dbg !181
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !181
  %5 = load i32, i32* %arrayidx, align 4, !dbg !181
  call void @printIntLine(i32 %5), !dbg !182
  br label %if.end6, !dbg !183

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !184
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !186

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !188 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !189, metadata !DIExpression()), !dbg !190
  store i32 -1, i32* %data, align 4, !dbg !191
  %0 = load i32, i32* @staticFive, align 4, !dbg !192
  %cmp = icmp eq i32 %0, 5, !dbg !194
  br i1 %cmp, label %if.then, label %if.end, !dbg !195

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !196
  br label %if.end, !dbg !198

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !199
  %cmp1 = icmp eq i32 %1, 5, !dbg !201
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !202

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !203, metadata !DIExpression()), !dbg !206
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !206
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !206
  %3 = load i32, i32* %data, align 4, !dbg !207
  %cmp3 = icmp sge i32 %3, 0, !dbg !209
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !210

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !211
  %idxprom = sext i32 %4 to i64, !dbg !213
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !213
  %5 = load i32, i32* %arrayidx, align 4, !dbg !213
  call void @printIntLine(i32 %5), !dbg !214
  br label %if.end5, !dbg !215

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !216
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !218

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !219
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !9)
!20 = !DILocation(line: 29, column: 9, scope: !16)
!21 = !DILocation(line: 31, column: 10, scope: !16)
!22 = !DILocation(line: 32, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!24 = !DILocation(line: 32, column: 18, scope: !23)
!25 = !DILocation(line: 32, column: 8, scope: !16)
!26 = !DILocation(line: 35, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !8, line: 33, column: 5)
!28 = !DILocation(line: 35, column: 9, scope: !27)
!29 = !DILocation(line: 36, column: 5, scope: !27)
!30 = !DILocation(line: 37, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !8, line: 37, column: 8)
!32 = !DILocation(line: 37, column: 18, scope: !31)
!33 = !DILocation(line: 37, column: 8, scope: !16)
!34 = !DILocalVariable(name: "buffer", scope: !35, file: !8, line: 40, type: !37)
!35 = distinct !DILexicalBlock(scope: !36, file: !8, line: 39, column: 9)
!36 = distinct !DILexicalBlock(scope: !31, file: !8, line: 38, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 320, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 10)
!40 = !DILocation(line: 40, column: 17, scope: !35)
!41 = !DILocation(line: 43, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !8, line: 43, column: 17)
!43 = !DILocation(line: 43, column: 22, scope: !42)
!44 = !DILocation(line: 43, column: 17, scope: !35)
!45 = !DILocation(line: 45, column: 37, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !8, line: 44, column: 13)
!47 = !DILocation(line: 45, column: 30, scope: !46)
!48 = !DILocation(line: 45, column: 17, scope: !46)
!49 = !DILocation(line: 46, column: 13, scope: !46)
!50 = !DILocation(line: 49, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !42, file: !8, line: 48, column: 13)
!52 = !DILocation(line: 52, column: 5, scope: !36)
!53 = !DILocation(line: 53, column: 1, scope: !16)
!54 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_07_good", scope: !8, file: !8, line: 185, type: !17, scopeLine: 186, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 187, column: 5, scope: !54)
!56 = !DILocation(line: 188, column: 5, scope: !54)
!57 = !DILocation(line: 189, column: 5, scope: !54)
!58 = !DILocation(line: 190, column: 5, scope: !54)
!59 = !DILocation(line: 191, column: 1, scope: !54)
!60 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 202, type: !61, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!9, !9, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !8, line: 202, type: !9)
!67 = !DILocation(line: 202, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !8, line: 202, type: !63)
!69 = !DILocation(line: 202, column: 27, scope: !60)
!70 = !DILocation(line: 205, column: 22, scope: !60)
!71 = !DILocation(line: 205, column: 12, scope: !60)
!72 = !DILocation(line: 205, column: 5, scope: !60)
!73 = !DILocation(line: 207, column: 5, scope: !60)
!74 = !DILocation(line: 208, column: 5, scope: !60)
!75 = !DILocation(line: 209, column: 5, scope: !60)
!76 = !DILocation(line: 212, column: 5, scope: !60)
!77 = !DILocation(line: 213, column: 5, scope: !60)
!78 = !DILocation(line: 214, column: 5, scope: !60)
!79 = !DILocation(line: 216, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodB2G1", scope: !8, file: !8, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !8, line: 62, type: !9)
!82 = !DILocation(line: 62, column: 9, scope: !80)
!83 = !DILocation(line: 64, column: 10, scope: !80)
!84 = !DILocation(line: 65, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !8, line: 65, column: 8)
!86 = !DILocation(line: 65, column: 18, scope: !85)
!87 = !DILocation(line: 65, column: 8, scope: !80)
!88 = !DILocation(line: 68, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !8, line: 66, column: 5)
!90 = !DILocation(line: 68, column: 9, scope: !89)
!91 = !DILocation(line: 69, column: 5, scope: !89)
!92 = !DILocation(line: 70, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !80, file: !8, line: 70, column: 8)
!94 = !DILocation(line: 70, column: 18, scope: !93)
!95 = !DILocation(line: 70, column: 8, scope: !80)
!96 = !DILocation(line: 73, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !8, line: 71, column: 5)
!98 = !DILocation(line: 74, column: 5, scope: !97)
!99 = !DILocalVariable(name: "buffer", scope: !100, file: !8, line: 78, type: !37)
!100 = distinct !DILexicalBlock(scope: !101, file: !8, line: 77, column: 9)
!101 = distinct !DILexicalBlock(scope: !93, file: !8, line: 76, column: 5)
!102 = !DILocation(line: 78, column: 17, scope: !100)
!103 = !DILocation(line: 80, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !8, line: 80, column: 17)
!105 = !DILocation(line: 80, column: 22, scope: !104)
!106 = !DILocation(line: 80, column: 27, scope: !104)
!107 = !DILocation(line: 80, column: 30, scope: !104)
!108 = !DILocation(line: 80, column: 35, scope: !104)
!109 = !DILocation(line: 80, column: 17, scope: !100)
!110 = !DILocation(line: 82, column: 37, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !8, line: 81, column: 13)
!112 = !DILocation(line: 82, column: 30, scope: !111)
!113 = !DILocation(line: 82, column: 17, scope: !111)
!114 = !DILocation(line: 83, column: 13, scope: !111)
!115 = !DILocation(line: 86, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !8, line: 85, column: 13)
!117 = !DILocation(line: 90, column: 1, scope: !80)
!118 = distinct !DISubprogram(name: "goodB2G2", scope: !8, file: !8, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !8, line: 95, type: !9)
!120 = !DILocation(line: 95, column: 9, scope: !118)
!121 = !DILocation(line: 97, column: 10, scope: !118)
!122 = !DILocation(line: 98, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !8, line: 98, column: 8)
!124 = !DILocation(line: 98, column: 18, scope: !123)
!125 = !DILocation(line: 98, column: 8, scope: !118)
!126 = !DILocation(line: 101, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !8, line: 99, column: 5)
!128 = !DILocation(line: 101, column: 9, scope: !127)
!129 = !DILocation(line: 102, column: 5, scope: !127)
!130 = !DILocation(line: 103, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !118, file: !8, line: 103, column: 8)
!132 = !DILocation(line: 103, column: 18, scope: !131)
!133 = !DILocation(line: 103, column: 8, scope: !118)
!134 = !DILocalVariable(name: "buffer", scope: !135, file: !8, line: 106, type: !37)
!135 = distinct !DILexicalBlock(scope: !136, file: !8, line: 105, column: 9)
!136 = distinct !DILexicalBlock(scope: !131, file: !8, line: 104, column: 5)
!137 = !DILocation(line: 106, column: 17, scope: !135)
!138 = !DILocation(line: 108, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !8, line: 108, column: 17)
!140 = !DILocation(line: 108, column: 22, scope: !139)
!141 = !DILocation(line: 108, column: 27, scope: !139)
!142 = !DILocation(line: 108, column: 30, scope: !139)
!143 = !DILocation(line: 108, column: 35, scope: !139)
!144 = !DILocation(line: 108, column: 17, scope: !135)
!145 = !DILocation(line: 110, column: 37, scope: !146)
!146 = distinct !DILexicalBlock(scope: !139, file: !8, line: 109, column: 13)
!147 = !DILocation(line: 110, column: 30, scope: !146)
!148 = !DILocation(line: 110, column: 17, scope: !146)
!149 = !DILocation(line: 111, column: 13, scope: !146)
!150 = !DILocation(line: 114, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !139, file: !8, line: 113, column: 13)
!152 = !DILocation(line: 117, column: 5, scope: !136)
!153 = !DILocation(line: 118, column: 1, scope: !118)
!154 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 121, type: !17, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocalVariable(name: "data", scope: !154, file: !8, line: 123, type: !9)
!156 = !DILocation(line: 123, column: 9, scope: !154)
!157 = !DILocation(line: 125, column: 10, scope: !154)
!158 = !DILocation(line: 126, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !8, line: 126, column: 8)
!160 = !DILocation(line: 126, column: 18, scope: !159)
!161 = !DILocation(line: 126, column: 8, scope: !154)
!162 = !DILocation(line: 129, column: 9, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !8, line: 127, column: 5)
!164 = !DILocation(line: 130, column: 5, scope: !163)
!165 = !DILocation(line: 135, column: 14, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !8, line: 132, column: 5)
!167 = !DILocation(line: 137, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !154, file: !8, line: 137, column: 8)
!169 = !DILocation(line: 137, column: 18, scope: !168)
!170 = !DILocation(line: 137, column: 8, scope: !154)
!171 = !DILocalVariable(name: "buffer", scope: !172, file: !8, line: 140, type: !37)
!172 = distinct !DILexicalBlock(scope: !173, file: !8, line: 139, column: 9)
!173 = distinct !DILexicalBlock(scope: !168, file: !8, line: 138, column: 5)
!174 = !DILocation(line: 140, column: 17, scope: !172)
!175 = !DILocation(line: 143, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !8, line: 143, column: 17)
!177 = !DILocation(line: 143, column: 22, scope: !176)
!178 = !DILocation(line: 143, column: 17, scope: !172)
!179 = !DILocation(line: 145, column: 37, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !8, line: 144, column: 13)
!181 = !DILocation(line: 145, column: 30, scope: !180)
!182 = !DILocation(line: 145, column: 17, scope: !180)
!183 = !DILocation(line: 146, column: 13, scope: !180)
!184 = !DILocation(line: 149, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !176, file: !8, line: 148, column: 13)
!186 = !DILocation(line: 152, column: 5, scope: !173)
!187 = !DILocation(line: 153, column: 1, scope: !154)
!188 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 156, type: !17, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!189 = !DILocalVariable(name: "data", scope: !188, file: !8, line: 158, type: !9)
!190 = !DILocation(line: 158, column: 9, scope: !188)
!191 = !DILocation(line: 160, column: 10, scope: !188)
!192 = !DILocation(line: 161, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !188, file: !8, line: 161, column: 8)
!194 = !DILocation(line: 161, column: 18, scope: !193)
!195 = !DILocation(line: 161, column: 8, scope: !188)
!196 = !DILocation(line: 165, column: 14, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !8, line: 162, column: 5)
!198 = !DILocation(line: 166, column: 5, scope: !197)
!199 = !DILocation(line: 167, column: 8, scope: !200)
!200 = distinct !DILexicalBlock(scope: !188, file: !8, line: 167, column: 8)
!201 = !DILocation(line: 167, column: 18, scope: !200)
!202 = !DILocation(line: 167, column: 8, scope: !188)
!203 = !DILocalVariable(name: "buffer", scope: !204, file: !8, line: 170, type: !37)
!204 = distinct !DILexicalBlock(scope: !205, file: !8, line: 169, column: 9)
!205 = distinct !DILexicalBlock(scope: !200, file: !8, line: 168, column: 5)
!206 = !DILocation(line: 170, column: 17, scope: !204)
!207 = !DILocation(line: 173, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !8, line: 173, column: 17)
!209 = !DILocation(line: 173, column: 22, scope: !208)
!210 = !DILocation(line: 173, column: 17, scope: !204)
!211 = !DILocation(line: 175, column: 37, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !8, line: 174, column: 13)
!213 = !DILocation(line: 175, column: 30, scope: !212)
!214 = !DILocation(line: 175, column: 17, scope: !212)
!215 = !DILocation(line: 176, column: 13, scope: !212)
!216 = !DILocation(line: 179, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !208, file: !8, line: 178, column: 13)
!218 = !DILocation(line: 182, column: 5, scope: !205)
!219 = !DILocation(line: 183, column: 1, scope: !188)
