; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* %data, align 4, !dbg !19
  %call = call i32 @badSource(i32 %0), !dbg !20
  store i32 %call, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !25, metadata !DIExpression()), !dbg !29
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !29
  %2 = load i32, i32* %data, align 4, !dbg !30
  %cmp = icmp sge i32 %2, 0, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !34
  %idxprom = sext i32 %3 to i64, !dbg !36
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !36
  store i32 1, i32* %arrayidx, align 4, !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !41
  %cmp1 = icmp slt i32 %4, 10, !dbg !43
  br i1 %cmp1, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !45
  %idxprom2 = sext i32 %5 to i64, !dbg !47
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !47
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !47
  call void @printIntLine(i32 %6), !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %7, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !55

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !56
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !64
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* %data.addr), !dbg !65
  %1 = load i32, i32* %data.addr, align 4, !dbg !66
  ret i32 %1, !dbg !67
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_good() #0 !dbg !68 {
entry:
  call void @goodB2G(), !dbg !69
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !92 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32 -1, i32* %data, align 4, !dbg !95
  %0 = load i32, i32* %data, align 4, !dbg !96
  %call = call i32 @goodB2GSource(i32 %0), !dbg !97
  store i32 %call, i32* %data, align 4, !dbg !98
  call void @llvm.dbg.declare(metadata i32* %i, metadata !99, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !102, metadata !DIExpression()), !dbg !103
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !103
  %2 = load i32, i32* %data, align 4, !dbg !104
  %cmp = icmp sge i32 %2, 0, !dbg !106
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !107

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !108
  %cmp1 = icmp slt i32 %3, 10, !dbg !109
  br i1 %cmp1, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !111
  %idxprom = sext i32 %4 to i64, !dbg !113
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !113
  store i32 1, i32* %arrayidx, align 4, !dbg !114
  store i32 0, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !118
  %cmp2 = icmp slt i32 %5, 10, !dbg !120
  br i1 %cmp2, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !122
  %idxprom3 = sext i32 %6 to i64, !dbg !124
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !124
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !124
  call void @printIntLine(i32 %7), !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !127
  %inc = add nsw i32 %8, 1, !dbg !127
  store i32 %inc, i32* %i, align 4, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !131

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !135 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !136, metadata !DIExpression()), !dbg !137
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !138
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* %data.addr), !dbg !139
  %1 = load i32, i32* %data.addr, align 4, !dbg !140
  ret i32 %1, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !142 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !143, metadata !DIExpression()), !dbg !144
  store i32 -1, i32* %data, align 4, !dbg !145
  %0 = load i32, i32* %data, align 4, !dbg !146
  %call = call i32 @goodG2BSource(i32 %0), !dbg !147
  store i32 %call, i32* %data, align 4, !dbg !148
  call void @llvm.dbg.declare(metadata i32* %i, metadata !149, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !152, metadata !DIExpression()), !dbg !153
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !153
  %2 = load i32, i32* %data, align 4, !dbg !154
  %cmp = icmp sge i32 %2, 0, !dbg !156
  br i1 %cmp, label %if.then, label %if.else, !dbg !157

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !158
  %idxprom = sext i32 %3 to i64, !dbg !160
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !160
  store i32 1, i32* %arrayidx, align 4, !dbg !161
  store i32 0, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !165
  %cmp1 = icmp slt i32 %4, 10, !dbg !167
  br i1 %cmp1, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !169
  %idxprom2 = sext i32 %5 to i64, !dbg !171
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !171
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !171
  call void @printIntLine(i32 %6), !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !174
  %inc = add nsw i32 %7, 1, !dbg !174
  store i32 %inc, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !178

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !179
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !181
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !182 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !183, metadata !DIExpression()), !dbg !184
  store i32 7, i32* %data.addr, align 4, !dbg !185
  %0 = load i32, i32* %data.addr, align 4, !dbg !186
  ret i32 %0, !dbg !187
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 31, column: 9, scope: !11)
!18 = !DILocation(line: 33, column: 10, scope: !11)
!19 = !DILocation(line: 34, column: 22, scope: !11)
!20 = !DILocation(line: 34, column: 12, scope: !11)
!21 = !DILocation(line: 34, column: 10, scope: !11)
!22 = !DILocalVariable(name: "i", scope: !23, file: !12, line: 36, type: !16)
!23 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!24 = !DILocation(line: 36, column: 13, scope: !23)
!25 = !DILocalVariable(name: "buffer", scope: !23, file: !12, line: 37, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 37, column: 13, scope: !23)
!30 = !DILocation(line: 40, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !12, line: 40, column: 13)
!32 = !DILocation(line: 40, column: 18, scope: !31)
!33 = !DILocation(line: 40, column: 13, scope: !23)
!34 = !DILocation(line: 42, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 41, column: 9)
!36 = !DILocation(line: 42, column: 13, scope: !35)
!37 = !DILocation(line: 42, column: 26, scope: !35)
!38 = !DILocation(line: 44, column: 19, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 44, column: 13)
!40 = !DILocation(line: 44, column: 17, scope: !39)
!41 = !DILocation(line: 44, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 44, column: 13)
!43 = !DILocation(line: 44, column: 26, scope: !42)
!44 = !DILocation(line: 44, column: 13, scope: !39)
!45 = !DILocation(line: 46, column: 37, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 45, column: 13)
!47 = !DILocation(line: 46, column: 30, scope: !46)
!48 = !DILocation(line: 46, column: 17, scope: !46)
!49 = !DILocation(line: 47, column: 13, scope: !46)
!50 = !DILocation(line: 44, column: 33, scope: !42)
!51 = !DILocation(line: 44, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 47, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 48, column: 9, scope: !35)
!56 = !DILocation(line: 51, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !31, file: !12, line: 50, column: 9)
!58 = !DILocation(line: 54, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 22, type: !60, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!16, !16}
!62 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !12, line: 22, type: !16)
!63 = !DILocation(line: 22, column: 26, scope: !59)
!64 = !DILocation(line: 25, column: 12, scope: !59)
!65 = !DILocation(line: 25, column: 5, scope: !59)
!66 = !DILocation(line: 26, column: 12, scope: !59)
!67 = !DILocation(line: 26, column: 5, scope: !59)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_good", scope: !12, file: !12, line: 130, type: !13, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 132, column: 5, scope: !68)
!70 = !DILocation(line: 133, column: 5, scope: !68)
!71 = !DILocation(line: 134, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 145, type: !73, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!16, !16, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 145, type: !16)
!79 = !DILocation(line: 145, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 145, type: !75)
!81 = !DILocation(line: 145, column: 27, scope: !72)
!82 = !DILocation(line: 148, column: 22, scope: !72)
!83 = !DILocation(line: 148, column: 12, scope: !72)
!84 = !DILocation(line: 148, column: 5, scope: !72)
!85 = !DILocation(line: 150, column: 5, scope: !72)
!86 = !DILocation(line: 151, column: 5, scope: !72)
!87 = !DILocation(line: 152, column: 5, scope: !72)
!88 = !DILocation(line: 155, column: 5, scope: !72)
!89 = !DILocation(line: 156, column: 5, scope: !72)
!90 = !DILocation(line: 157, column: 5, scope: !72)
!91 = !DILocation(line: 159, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 104, type: !13, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 106, type: !16)
!94 = !DILocation(line: 106, column: 9, scope: !92)
!95 = !DILocation(line: 108, column: 10, scope: !92)
!96 = !DILocation(line: 109, column: 26, scope: !92)
!97 = !DILocation(line: 109, column: 12, scope: !92)
!98 = !DILocation(line: 109, column: 10, scope: !92)
!99 = !DILocalVariable(name: "i", scope: !100, file: !12, line: 111, type: !16)
!100 = distinct !DILexicalBlock(scope: !92, file: !12, line: 110, column: 5)
!101 = !DILocation(line: 111, column: 13, scope: !100)
!102 = !DILocalVariable(name: "buffer", scope: !100, file: !12, line: 112, type: !26)
!103 = !DILocation(line: 112, column: 13, scope: !100)
!104 = !DILocation(line: 114, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !12, line: 114, column: 13)
!106 = !DILocation(line: 114, column: 18, scope: !105)
!107 = !DILocation(line: 114, column: 23, scope: !105)
!108 = !DILocation(line: 114, column: 26, scope: !105)
!109 = !DILocation(line: 114, column: 31, scope: !105)
!110 = !DILocation(line: 114, column: 13, scope: !100)
!111 = !DILocation(line: 116, column: 20, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !12, line: 115, column: 9)
!113 = !DILocation(line: 116, column: 13, scope: !112)
!114 = !DILocation(line: 116, column: 26, scope: !112)
!115 = !DILocation(line: 118, column: 19, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !12, line: 118, column: 13)
!117 = !DILocation(line: 118, column: 17, scope: !116)
!118 = !DILocation(line: 118, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 118, column: 13)
!120 = !DILocation(line: 118, column: 26, scope: !119)
!121 = !DILocation(line: 118, column: 13, scope: !116)
!122 = !DILocation(line: 120, column: 37, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 119, column: 13)
!124 = !DILocation(line: 120, column: 30, scope: !123)
!125 = !DILocation(line: 120, column: 17, scope: !123)
!126 = !DILocation(line: 121, column: 13, scope: !123)
!127 = !DILocation(line: 118, column: 33, scope: !119)
!128 = !DILocation(line: 118, column: 13, scope: !119)
!129 = distinct !{!129, !121, !130, !54}
!130 = !DILocation(line: 121, column: 13, scope: !116)
!131 = !DILocation(line: 122, column: 9, scope: !112)
!132 = !DILocation(line: 125, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !105, file: !12, line: 124, column: 9)
!134 = !DILocation(line: 128, column: 1, scope: !92)
!135 = distinct !DISubprogram(name: "goodB2GSource", scope: !12, file: !12, line: 97, type: !60, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "data", arg: 1, scope: !135, file: !12, line: 97, type: !16)
!137 = !DILocation(line: 97, column: 30, scope: !135)
!138 = !DILocation(line: 100, column: 12, scope: !135)
!139 = !DILocation(line: 100, column: 5, scope: !135)
!140 = !DILocation(line: 101, column: 12, scope: !135)
!141 = !DILocation(line: 101, column: 5, scope: !135)
!142 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !12, line: 71, type: !16)
!144 = !DILocation(line: 71, column: 9, scope: !142)
!145 = !DILocation(line: 73, column: 10, scope: !142)
!146 = !DILocation(line: 74, column: 26, scope: !142)
!147 = !DILocation(line: 74, column: 12, scope: !142)
!148 = !DILocation(line: 74, column: 10, scope: !142)
!149 = !DILocalVariable(name: "i", scope: !150, file: !12, line: 76, type: !16)
!150 = distinct !DILexicalBlock(scope: !142, file: !12, line: 75, column: 5)
!151 = !DILocation(line: 76, column: 13, scope: !150)
!152 = !DILocalVariable(name: "buffer", scope: !150, file: !12, line: 77, type: !26)
!153 = !DILocation(line: 77, column: 13, scope: !150)
!154 = !DILocation(line: 80, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !12, line: 80, column: 13)
!156 = !DILocation(line: 80, column: 18, scope: !155)
!157 = !DILocation(line: 80, column: 13, scope: !150)
!158 = !DILocation(line: 82, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 81, column: 9)
!160 = !DILocation(line: 82, column: 13, scope: !159)
!161 = !DILocation(line: 82, column: 26, scope: !159)
!162 = !DILocation(line: 84, column: 19, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 84, column: 13)
!164 = !DILocation(line: 84, column: 17, scope: !163)
!165 = !DILocation(line: 84, column: 24, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 84, column: 13)
!167 = !DILocation(line: 84, column: 26, scope: !166)
!168 = !DILocation(line: 84, column: 13, scope: !163)
!169 = !DILocation(line: 86, column: 37, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !12, line: 85, column: 13)
!171 = !DILocation(line: 86, column: 30, scope: !170)
!172 = !DILocation(line: 86, column: 17, scope: !170)
!173 = !DILocation(line: 87, column: 13, scope: !170)
!174 = !DILocation(line: 84, column: 33, scope: !166)
!175 = !DILocation(line: 84, column: 13, scope: !166)
!176 = distinct !{!176, !168, !177, !54}
!177 = !DILocation(line: 87, column: 13, scope: !163)
!178 = !DILocation(line: 88, column: 9, scope: !159)
!179 = !DILocation(line: 91, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !155, file: !12, line: 90, column: 9)
!181 = !DILocation(line: 94, column: 1, scope: !142)
!182 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 61, type: !60, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!183 = !DILocalVariable(name: "data", arg: 1, scope: !182, file: !12, line: 61, type: !16)
!184 = !DILocation(line: 61, column: 30, scope: !182)
!185 = !DILocation(line: 65, column: 10, scope: !182)
!186 = !DILocation(line: 66, column: 12, scope: !182)
!187 = !DILocation(line: 66, column: 5, scope: !182)
