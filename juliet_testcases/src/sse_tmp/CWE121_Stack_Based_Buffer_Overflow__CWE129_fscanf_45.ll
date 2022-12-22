; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_badData = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_goodG2BData = internal global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_goodB2GData = internal global i32 0, align 4, !dbg !12
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !26
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !27
  %1 = load i32, i32* %data, align 4, !dbg !28
  store i32 %1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_badData, align 4, !dbg !29
  call void @badSink(), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_good() #0 !dbg !32 {
entry:
  call void @goodG2B(), !dbg !33
  call void @goodB2G(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i64 @time(i64* null) #5, !dbg !46
  %conv = trunc i64 %call to i32, !dbg !47
  call void @srand(i32 %conv) #5, !dbg !48
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_good(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_bad(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !56 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_badData, align 4, !dbg !59
  store i32 %0, i32* %data, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata i32* %i, metadata !60, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !63, metadata !DIExpression()), !dbg !67
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !67
  %2 = load i32, i32* %data, align 4, !dbg !68
  %cmp = icmp sge i32 %2, 0, !dbg !70
  br i1 %cmp, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !72
  %idxprom = sext i32 %3 to i64, !dbg !74
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !74
  store i32 1, i32* %arrayidx, align 4, !dbg !75
  store i32 0, i32* %i, align 4, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !79
  %cmp1 = icmp slt i32 %4, 10, !dbg !81
  br i1 %cmp1, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !83
  %idxprom2 = sext i32 %5 to i64, !dbg !85
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !85
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !85
  call void @printIntLine(i32 %6), !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !88
  %inc = add nsw i32 %7, 1, !dbg !88
  store i32 %inc, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !96
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  store i32 7, i32* %data, align 4, !dbg !101
  %0 = load i32, i32* %data, align 4, !dbg !102
  store i32 %0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_goodG2BData, align 4, !dbg !103
  call void @goodG2BSink(), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_goodG2BData, align 4, !dbg !109
  store i32 %0, i32* %data, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i32* %i, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !113, metadata !DIExpression()), !dbg !114
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !114
  %2 = load i32, i32* %data, align 4, !dbg !115
  %cmp = icmp sge i32 %2, 0, !dbg !117
  br i1 %cmp, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !119
  %idxprom = sext i32 %3 to i64, !dbg !121
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !121
  store i32 1, i32* %arrayidx, align 4, !dbg !122
  store i32 0, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !126
  %cmp1 = icmp slt i32 %4, 10, !dbg !128
  br i1 %cmp1, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !130
  %idxprom2 = sext i32 %5 to i64, !dbg !132
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !132
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !132
  call void @printIntLine(i32 %6), !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !135
  %inc = add nsw i32 %7, 1, !dbg !135
  store i32 %inc, i32* %i, align 4, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !139

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !140
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !143 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !144, metadata !DIExpression()), !dbg !145
  store i32 -1, i32* %data, align 4, !dbg !146
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !147
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !148
  %1 = load i32, i32* %data, align 4, !dbg !149
  store i32 %1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_goodB2GData, align 4, !dbg !150
  call void @goodB2GSink(), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !153 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_goodB2GData, align 4, !dbg !156
  store i32 %0, i32* %data, align 4, !dbg !155
  call void @llvm.dbg.declare(metadata i32* %i, metadata !157, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !160, metadata !DIExpression()), !dbg !161
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !161
  %2 = load i32, i32* %data, align 4, !dbg !162
  %cmp = icmp sge i32 %2, 0, !dbg !164
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !165

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !166
  %cmp1 = icmp slt i32 %3, 10, !dbg !167
  br i1 %cmp1, label %if.then, label %if.else, !dbg !168

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !169
  %idxprom = sext i32 %4 to i64, !dbg !171
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !171
  store i32 1, i32* %arrayidx, align 4, !dbg !172
  store i32 0, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !176
  %cmp2 = icmp slt i32 %5, 10, !dbg !178
  br i1 %cmp2, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !180
  %idxprom3 = sext i32 %6 to i64, !dbg !182
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !182
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !182
  call void @printIntLine(i32 %7), !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !185
  %inc = add nsw i32 %8, 1, !dbg !185
  store i32 %inc, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !189

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !190
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !192
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_badData", scope: !2, file: !10, line: 20, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_goodG2BData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_goodB2GData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_bad", scope: !10, file: !10, line: 50, type: !21, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 52, type: !11)
!24 = !DILocation(line: 52, column: 9, scope: !20)
!25 = !DILocation(line: 54, column: 10, scope: !20)
!26 = !DILocation(line: 56, column: 12, scope: !20)
!27 = !DILocation(line: 56, column: 5, scope: !20)
!28 = !DILocation(line: 57, column: 68, scope: !20)
!29 = !DILocation(line: 57, column: 66, scope: !20)
!30 = !DILocation(line: 58, column: 5, scope: !20)
!31 = !DILocation(line: 59, column: 1, scope: !20)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_45_good", scope: !10, file: !10, line: 137, type: !21, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DILocation(line: 139, column: 5, scope: !32)
!34 = !DILocation(line: 140, column: 5, scope: !32)
!35 = !DILocation(line: 141, column: 1, scope: !32)
!36 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 151, type: !37, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{!11, !11, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !10, line: 151, type: !11)
!43 = !DILocation(line: 151, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !10, line: 151, type: !39)
!45 = !DILocation(line: 151, column: 27, scope: !36)
!46 = !DILocation(line: 154, column: 22, scope: !36)
!47 = !DILocation(line: 154, column: 12, scope: !36)
!48 = !DILocation(line: 154, column: 5, scope: !36)
!49 = !DILocation(line: 156, column: 5, scope: !36)
!50 = !DILocation(line: 157, column: 5, scope: !36)
!51 = !DILocation(line: 158, column: 5, scope: !36)
!52 = !DILocation(line: 161, column: 5, scope: !36)
!53 = !DILocation(line: 162, column: 5, scope: !36)
!54 = !DILocation(line: 163, column: 5, scope: !36)
!55 = !DILocation(line: 165, column: 5, scope: !36)
!56 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 28, type: !11)
!58 = !DILocation(line: 28, column: 9, scope: !56)
!59 = !DILocation(line: 28, column: 16, scope: !56)
!60 = !DILocalVariable(name: "i", scope: !61, file: !10, line: 30, type: !11)
!61 = distinct !DILexicalBlock(scope: !56, file: !10, line: 29, column: 5)
!62 = !DILocation(line: 30, column: 13, scope: !61)
!63 = !DILocalVariable(name: "buffer", scope: !61, file: !10, line: 31, type: !64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 10)
!67 = !DILocation(line: 31, column: 13, scope: !61)
!68 = !DILocation(line: 34, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !61, file: !10, line: 34, column: 13)
!70 = !DILocation(line: 34, column: 18, scope: !69)
!71 = !DILocation(line: 34, column: 13, scope: !61)
!72 = !DILocation(line: 36, column: 20, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !10, line: 35, column: 9)
!74 = !DILocation(line: 36, column: 13, scope: !73)
!75 = !DILocation(line: 36, column: 26, scope: !73)
!76 = !DILocation(line: 38, column: 19, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !10, line: 38, column: 13)
!78 = !DILocation(line: 38, column: 17, scope: !77)
!79 = !DILocation(line: 38, column: 24, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !10, line: 38, column: 13)
!81 = !DILocation(line: 38, column: 26, scope: !80)
!82 = !DILocation(line: 38, column: 13, scope: !77)
!83 = !DILocation(line: 40, column: 37, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !10, line: 39, column: 13)
!85 = !DILocation(line: 40, column: 30, scope: !84)
!86 = !DILocation(line: 40, column: 17, scope: !84)
!87 = !DILocation(line: 41, column: 13, scope: !84)
!88 = !DILocation(line: 38, column: 33, scope: !80)
!89 = !DILocation(line: 38, column: 13, scope: !80)
!90 = distinct !{!90, !82, !91, !92}
!91 = !DILocation(line: 41, column: 13, scope: !77)
!92 = !{!"llvm.loop.mustprogress"}
!93 = !DILocation(line: 42, column: 9, scope: !73)
!94 = !DILocation(line: 45, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !69, file: !10, line: 44, column: 9)
!96 = !DILocation(line: 48, column: 1, scope: !56)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", scope: !97, file: !10, line: 92, type: !11)
!99 = !DILocation(line: 92, column: 9, scope: !97)
!100 = !DILocation(line: 94, column: 10, scope: !97)
!101 = !DILocation(line: 97, column: 10, scope: !97)
!102 = !DILocation(line: 98, column: 72, scope: !97)
!103 = !DILocation(line: 98, column: 70, scope: !97)
!104 = !DILocation(line: 99, column: 5, scope: !97)
!105 = !DILocation(line: 100, column: 1, scope: !97)
!106 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 66, type: !21, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !10, line: 68, type: !11)
!108 = !DILocation(line: 68, column: 9, scope: !106)
!109 = !DILocation(line: 68, column: 16, scope: !106)
!110 = !DILocalVariable(name: "i", scope: !111, file: !10, line: 70, type: !11)
!111 = distinct !DILexicalBlock(scope: !106, file: !10, line: 69, column: 5)
!112 = !DILocation(line: 70, column: 13, scope: !111)
!113 = !DILocalVariable(name: "buffer", scope: !111, file: !10, line: 71, type: !64)
!114 = !DILocation(line: 71, column: 13, scope: !111)
!115 = !DILocation(line: 74, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !10, line: 74, column: 13)
!117 = !DILocation(line: 74, column: 18, scope: !116)
!118 = !DILocation(line: 74, column: 13, scope: !111)
!119 = !DILocation(line: 76, column: 20, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !10, line: 75, column: 9)
!121 = !DILocation(line: 76, column: 13, scope: !120)
!122 = !DILocation(line: 76, column: 26, scope: !120)
!123 = !DILocation(line: 78, column: 19, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !10, line: 78, column: 13)
!125 = !DILocation(line: 78, column: 17, scope: !124)
!126 = !DILocation(line: 78, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !10, line: 78, column: 13)
!128 = !DILocation(line: 78, column: 26, scope: !127)
!129 = !DILocation(line: 78, column: 13, scope: !124)
!130 = !DILocation(line: 80, column: 37, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !10, line: 79, column: 13)
!132 = !DILocation(line: 80, column: 30, scope: !131)
!133 = !DILocation(line: 80, column: 17, scope: !131)
!134 = !DILocation(line: 81, column: 13, scope: !131)
!135 = !DILocation(line: 78, column: 33, scope: !127)
!136 = !DILocation(line: 78, column: 13, scope: !127)
!137 = distinct !{!137, !129, !138, !92}
!138 = !DILocation(line: 81, column: 13, scope: !124)
!139 = !DILocation(line: 82, column: 9, scope: !120)
!140 = !DILocation(line: 85, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !116, file: !10, line: 84, column: 9)
!142 = !DILocation(line: 88, column: 1, scope: !106)
!143 = distinct !DISubprogram(name: "goodB2G", scope: !10, file: !10, line: 126, type: !21, scopeLine: 127, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!144 = !DILocalVariable(name: "data", scope: !143, file: !10, line: 128, type: !11)
!145 = !DILocation(line: 128, column: 9, scope: !143)
!146 = !DILocation(line: 130, column: 10, scope: !143)
!147 = !DILocation(line: 132, column: 12, scope: !143)
!148 = !DILocation(line: 132, column: 5, scope: !143)
!149 = !DILocation(line: 133, column: 72, scope: !143)
!150 = !DILocation(line: 133, column: 70, scope: !143)
!151 = !DILocation(line: 134, column: 5, scope: !143)
!152 = !DILocation(line: 135, column: 1, scope: !143)
!153 = distinct !DISubprogram(name: "goodB2GSink", scope: !10, file: !10, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!154 = !DILocalVariable(name: "data", scope: !153, file: !10, line: 105, type: !11)
!155 = !DILocation(line: 105, column: 9, scope: !153)
!156 = !DILocation(line: 105, column: 16, scope: !153)
!157 = !DILocalVariable(name: "i", scope: !158, file: !10, line: 107, type: !11)
!158 = distinct !DILexicalBlock(scope: !153, file: !10, line: 106, column: 5)
!159 = !DILocation(line: 107, column: 13, scope: !158)
!160 = !DILocalVariable(name: "buffer", scope: !158, file: !10, line: 108, type: !64)
!161 = !DILocation(line: 108, column: 13, scope: !158)
!162 = !DILocation(line: 110, column: 13, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !10, line: 110, column: 13)
!164 = !DILocation(line: 110, column: 18, scope: !163)
!165 = !DILocation(line: 110, column: 23, scope: !163)
!166 = !DILocation(line: 110, column: 26, scope: !163)
!167 = !DILocation(line: 110, column: 31, scope: !163)
!168 = !DILocation(line: 110, column: 13, scope: !158)
!169 = !DILocation(line: 112, column: 20, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !10, line: 111, column: 9)
!171 = !DILocation(line: 112, column: 13, scope: !170)
!172 = !DILocation(line: 112, column: 26, scope: !170)
!173 = !DILocation(line: 114, column: 19, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !10, line: 114, column: 13)
!175 = !DILocation(line: 114, column: 17, scope: !174)
!176 = !DILocation(line: 114, column: 24, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !10, line: 114, column: 13)
!178 = !DILocation(line: 114, column: 26, scope: !177)
!179 = !DILocation(line: 114, column: 13, scope: !174)
!180 = !DILocation(line: 116, column: 37, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !10, line: 115, column: 13)
!182 = !DILocation(line: 116, column: 30, scope: !181)
!183 = !DILocation(line: 116, column: 17, scope: !181)
!184 = !DILocation(line: 117, column: 13, scope: !181)
!185 = !DILocation(line: 114, column: 33, scope: !177)
!186 = !DILocation(line: 114, column: 13, scope: !177)
!187 = distinct !{!187, !179, !188, !92}
!188 = !DILocation(line: 117, column: 13, scope: !174)
!189 = !DILocation(line: 118, column: 9, scope: !170)
!190 = !DILocation(line: 121, column: 13, scope: !191)
!191 = distinct !DILexicalBlock(scope: !163, file: !10, line: 120, column: 9)
!192 = !DILocation(line: 124, column: 1, scope: !153)
