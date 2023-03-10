; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fscanf_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fscanf_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fscanf_41_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !19
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !20
  %1 = load i32, i32* %data, align 4, !dbg !21
  call void @badSink(i32 %1), !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !24 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !32, metadata !DIExpression()), !dbg !36
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !36
  %1 = load i32, i32* %data.addr, align 4, !dbg !37
  %cmp = icmp slt i32 %1, 10, !dbg !39
  br i1 %cmp, label %if.then, label %if.else, !dbg !40

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !41
  %idxprom = sext i32 %2 to i64, !dbg !43
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !43
  store i32 1, i32* %arrayidx, align 4, !dbg !44
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !48
  %cmp1 = icmp slt i32 %3, 10, !dbg !50
  br i1 %cmp1, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !52
  %idxprom2 = sext i32 %4 to i64, !dbg !54
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !54
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !54
  call void @printIntLine(i32 %5), !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %6, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !62

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !63
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fscanf_41_good() #0 !dbg !66 {
entry:
  call void @goodB2G(), !dbg !67
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__CWE839_fscanf_41_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  call void @CWE124_Buffer_Underwrite__CWE839_fscanf_41_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !90 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32 -1, i32* %data, align 4, !dbg !93
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !94
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !95
  %1 = load i32, i32* %data, align 4, !dbg !96
  call void @goodB2GSink(i32 %1), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !99 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %i, metadata !102, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !106
  %1 = load i32, i32* %data.addr, align 4, !dbg !107
  %cmp = icmp sge i32 %1, 0, !dbg !109
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !110

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !111
  %cmp1 = icmp slt i32 %2, 10, !dbg !112
  br i1 %cmp1, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !114
  %idxprom = sext i32 %3 to i64, !dbg !116
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !116
  store i32 1, i32* %arrayidx, align 4, !dbg !117
  store i32 0, i32* %i, align 4, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !121
  %cmp2 = icmp slt i32 %4, 10, !dbg !123
  br i1 %cmp2, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !125
  %idxprom3 = sext i32 %5 to i64, !dbg !127
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !127
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !127
  call void @printIntLine(i32 %6), !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !130
  %inc = add nsw i32 %7, 1, !dbg !130
  store i32 %inc, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !134

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !135
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !138 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !139, metadata !DIExpression()), !dbg !140
  store i32 -1, i32* %data, align 4, !dbg !141
  store i32 7, i32* %data, align 4, !dbg !142
  %0 = load i32, i32* %data, align 4, !dbg !143
  call void @goodG2BSink(i32 %0), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !146 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %i, metadata !149, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !153
  %1 = load i32, i32* %data.addr, align 4, !dbg !154
  %cmp = icmp slt i32 %1, 10, !dbg !156
  br i1 %cmp, label %if.then, label %if.else, !dbg !157

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !158
  %idxprom = sext i32 %2 to i64, !dbg !160
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !160
  store i32 1, i32* %arrayidx, align 4, !dbg !161
  store i32 0, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !165
  %cmp1 = icmp slt i32 %3, 10, !dbg !167
  br i1 %cmp1, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !169
  %idxprom2 = sext i32 %4 to i64, !dbg !171
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !171
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !171
  call void @printIntLine(i32 %5), !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !174
  %inc = add nsw i32 %6, 1, !dbg !174
  store i32 %inc, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !178

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !179
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !181
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fscanf_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fscanf_41_bad", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fscanf_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 47, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 47, column: 9, scope: !11)
!18 = !DILocation(line: 49, column: 10, scope: !11)
!19 = !DILocation(line: 51, column: 12, scope: !11)
!20 = !DILocation(line: 51, column: 5, scope: !11)
!21 = !DILocation(line: 52, column: 13, scope: !11)
!22 = !DILocation(line: 52, column: 5, scope: !11)
!23 = !DILocation(line: 53, column: 1, scope: !11)
!24 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 22, type: !25, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !16}
!27 = !DILocalVariable(name: "data", arg: 1, scope: !24, file: !12, line: 22, type: !16)
!28 = !DILocation(line: 22, column: 25, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !30, file: !12, line: 25, type: !16)
!30 = distinct !DILexicalBlock(scope: !24, file: !12, line: 24, column: 5)
!31 = !DILocation(line: 25, column: 13, scope: !30)
!32 = !DILocalVariable(name: "buffer", scope: !30, file: !12, line: 26, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 10)
!36 = !DILocation(line: 26, column: 13, scope: !30)
!37 = !DILocation(line: 29, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 13)
!39 = !DILocation(line: 29, column: 18, scope: !38)
!40 = !DILocation(line: 29, column: 13, scope: !30)
!41 = !DILocation(line: 31, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 30, column: 9)
!43 = !DILocation(line: 31, column: 13, scope: !42)
!44 = !DILocation(line: 31, column: 26, scope: !42)
!45 = !DILocation(line: 33, column: 19, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 33, column: 13)
!47 = !DILocation(line: 33, column: 17, scope: !46)
!48 = !DILocation(line: 33, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 33, column: 13)
!50 = !DILocation(line: 33, column: 26, scope: !49)
!51 = !DILocation(line: 33, column: 13, scope: !46)
!52 = !DILocation(line: 35, column: 37, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 34, column: 13)
!54 = !DILocation(line: 35, column: 30, scope: !53)
!55 = !DILocation(line: 35, column: 17, scope: !53)
!56 = !DILocation(line: 36, column: 13, scope: !53)
!57 = !DILocation(line: 33, column: 33, scope: !49)
!58 = !DILocation(line: 33, column: 13, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 36, column: 13, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 37, column: 9, scope: !42)
!63 = !DILocation(line: 40, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !38, file: !12, line: 39, column: 9)
!65 = !DILocation(line: 43, column: 1, scope: !24)
!66 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fscanf_41_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 129, column: 5, scope: !66)
!68 = !DILocation(line: 130, column: 5, scope: !66)
!69 = !DILocation(line: 131, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 142, type: !71, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!16, !16, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !12, line: 142, type: !16)
!77 = !DILocation(line: 142, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !12, line: 142, type: !73)
!79 = !DILocation(line: 142, column: 27, scope: !70)
!80 = !DILocation(line: 145, column: 22, scope: !70)
!81 = !DILocation(line: 145, column: 12, scope: !70)
!82 = !DILocation(line: 145, column: 5, scope: !70)
!83 = !DILocation(line: 147, column: 5, scope: !70)
!84 = !DILocation(line: 148, column: 5, scope: !70)
!85 = !DILocation(line: 149, column: 5, scope: !70)
!86 = !DILocation(line: 152, column: 5, scope: !70)
!87 = !DILocation(line: 153, column: 5, scope: !70)
!88 = !DILocation(line: 154, column: 5, scope: !70)
!89 = !DILocation(line: 156, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 119, type: !16)
!92 = !DILocation(line: 119, column: 9, scope: !90)
!93 = !DILocation(line: 121, column: 10, scope: !90)
!94 = !DILocation(line: 123, column: 12, scope: !90)
!95 = !DILocation(line: 123, column: 5, scope: !90)
!96 = !DILocation(line: 124, column: 17, scope: !90)
!97 = !DILocation(line: 124, column: 5, scope: !90)
!98 = !DILocation(line: 125, column: 1, scope: !90)
!99 = distinct !DISubprogram(name: "goodB2GSink", scope: !12, file: !12, line: 95, type: !25, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", arg: 1, scope: !99, file: !12, line: 95, type: !16)
!101 = !DILocation(line: 95, column: 29, scope: !99)
!102 = !DILocalVariable(name: "i", scope: !103, file: !12, line: 98, type: !16)
!103 = distinct !DILexicalBlock(scope: !99, file: !12, line: 97, column: 5)
!104 = !DILocation(line: 98, column: 13, scope: !103)
!105 = !DILocalVariable(name: "buffer", scope: !103, file: !12, line: 99, type: !33)
!106 = !DILocation(line: 99, column: 13, scope: !103)
!107 = !DILocation(line: 101, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !12, line: 101, column: 13)
!109 = !DILocation(line: 101, column: 18, scope: !108)
!110 = !DILocation(line: 101, column: 23, scope: !108)
!111 = !DILocation(line: 101, column: 26, scope: !108)
!112 = !DILocation(line: 101, column: 31, scope: !108)
!113 = !DILocation(line: 101, column: 13, scope: !103)
!114 = !DILocation(line: 103, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !12, line: 102, column: 9)
!116 = !DILocation(line: 103, column: 13, scope: !115)
!117 = !DILocation(line: 103, column: 26, scope: !115)
!118 = !DILocation(line: 105, column: 19, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 105, column: 13)
!120 = !DILocation(line: 105, column: 17, scope: !119)
!121 = !DILocation(line: 105, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 105, column: 13)
!123 = !DILocation(line: 105, column: 26, scope: !122)
!124 = !DILocation(line: 105, column: 13, scope: !119)
!125 = !DILocation(line: 107, column: 37, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 106, column: 13)
!127 = !DILocation(line: 107, column: 30, scope: !126)
!128 = !DILocation(line: 107, column: 17, scope: !126)
!129 = !DILocation(line: 108, column: 13, scope: !126)
!130 = !DILocation(line: 105, column: 33, scope: !122)
!131 = !DILocation(line: 105, column: 13, scope: !122)
!132 = distinct !{!132, !124, !133, !61}
!133 = !DILocation(line: 108, column: 13, scope: !119)
!134 = !DILocation(line: 109, column: 9, scope: !115)
!135 = !DILocation(line: 112, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !108, file: !12, line: 111, column: 9)
!137 = !DILocation(line: 115, column: 1, scope: !99)
!138 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !12, line: 85, type: !16)
!140 = !DILocation(line: 85, column: 9, scope: !138)
!141 = !DILocation(line: 87, column: 10, scope: !138)
!142 = !DILocation(line: 90, column: 10, scope: !138)
!143 = !DILocation(line: 91, column: 17, scope: !138)
!144 = !DILocation(line: 91, column: 5, scope: !138)
!145 = !DILocation(line: 92, column: 1, scope: !138)
!146 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 60, type: !25, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", arg: 1, scope: !146, file: !12, line: 60, type: !16)
!148 = !DILocation(line: 60, column: 29, scope: !146)
!149 = !DILocalVariable(name: "i", scope: !150, file: !12, line: 63, type: !16)
!150 = distinct !DILexicalBlock(scope: !146, file: !12, line: 62, column: 5)
!151 = !DILocation(line: 63, column: 13, scope: !150)
!152 = !DILocalVariable(name: "buffer", scope: !150, file: !12, line: 64, type: !33)
!153 = !DILocation(line: 64, column: 13, scope: !150)
!154 = !DILocation(line: 67, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !12, line: 67, column: 13)
!156 = !DILocation(line: 67, column: 18, scope: !155)
!157 = !DILocation(line: 67, column: 13, scope: !150)
!158 = !DILocation(line: 69, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 68, column: 9)
!160 = !DILocation(line: 69, column: 13, scope: !159)
!161 = !DILocation(line: 69, column: 26, scope: !159)
!162 = !DILocation(line: 71, column: 19, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 71, column: 13)
!164 = !DILocation(line: 71, column: 17, scope: !163)
!165 = !DILocation(line: 71, column: 24, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 71, column: 13)
!167 = !DILocation(line: 71, column: 26, scope: !166)
!168 = !DILocation(line: 71, column: 13, scope: !163)
!169 = !DILocation(line: 73, column: 37, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !12, line: 72, column: 13)
!171 = !DILocation(line: 73, column: 30, scope: !170)
!172 = !DILocation(line: 73, column: 17, scope: !170)
!173 = !DILocation(line: 74, column: 13, scope: !170)
!174 = !DILocation(line: 71, column: 33, scope: !166)
!175 = !DILocation(line: 71, column: 13, scope: !166)
!176 = distinct !{!176, !168, !177, !61}
!177 = !DILocation(line: 74, column: 13, scope: !163)
!178 = !DILocation(line: 75, column: 9, scope: !159)
!179 = !DILocation(line: 78, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !155, file: !12, line: 77, column: 9)
!181 = !DILocation(line: 81, column: 1, scope: !146)
