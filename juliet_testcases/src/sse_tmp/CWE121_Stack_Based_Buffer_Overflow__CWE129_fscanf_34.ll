; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType = type { i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType* %myUnion, metadata !18, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !26
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !27
  %1 = load i32, i32* %data, align 4, !dbg !28
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !29
  store i32 %1, i32* %unionFirst, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !34
  %2 = load i32, i32* %unionSecond, align 4, !dbg !34
  store i32 %2, i32* %data1, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !38, metadata !DIExpression()), !dbg !42
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !42
  %4 = load i32, i32* %data1, align 4, !dbg !43
  %cmp = icmp sge i32 %4, 0, !dbg !45
  br i1 %cmp, label %if.then, label %if.else, !dbg !46

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %data1, align 4, !dbg !47
  %idxprom = sext i32 %5 to i64, !dbg !49
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !49
  store i32 1, i32* %arrayidx, align 4, !dbg !50
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !54
  %cmp2 = icmp slt i32 %6, 10, !dbg !56
  br i1 %cmp2, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !58
  %idxprom3 = sext i32 %7 to i64, !dbg !60
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !60
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !60
  call void @printIntLine(i32 %8), !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !63
  %inc = add nsw i32 %9, 1, !dbg !63
  store i32 %inc, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !68

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  call void @goodB2G(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType* %myUnion, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 -1, i32* %data, align 4, !dbg !101
  store i32 7, i32* %data, align 4, !dbg !102
  %0 = load i32, i32* %data, align 4, !dbg !103
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !104
  store i32 %0, i32* %unionFirst, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !106, metadata !DIExpression()), !dbg !108
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !109
  %1 = load i32, i32* %unionSecond, align 4, !dbg !109
  store i32 %1, i32* %data1, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i32* %i, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !113, metadata !DIExpression()), !dbg !114
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !114
  %3 = load i32, i32* %data1, align 4, !dbg !115
  %cmp = icmp sge i32 %3, 0, !dbg !117
  br i1 %cmp, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !119
  %idxprom = sext i32 %4 to i64, !dbg !121
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !121
  store i32 1, i32* %arrayidx, align 4, !dbg !122
  store i32 0, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !126
  %cmp2 = icmp slt i32 %5, 10, !dbg !128
  br i1 %cmp2, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !130
  %idxprom3 = sext i32 %6 to i64, !dbg !132
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !132
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !132
  call void @printIntLine(i32 %7), !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !135
  %inc = add nsw i32 %8, 1, !dbg !135
  store i32 %inc, i32* %i, align 4, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !139

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !140
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !143 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType* %myUnion, metadata !146, metadata !DIExpression()), !dbg !147
  store i32 -1, i32* %data, align 4, !dbg !148
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !149
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !150
  %1 = load i32, i32* %data, align 4, !dbg !151
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !152
  store i32 %1, i32* %unionFirst, align 4, !dbg !153
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !154, metadata !DIExpression()), !dbg !156
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !157
  %2 = load i32, i32* %unionSecond, align 4, !dbg !157
  store i32 %2, i32* %data1, align 4, !dbg !156
  call void @llvm.dbg.declare(metadata i32* %i, metadata !158, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !161, metadata !DIExpression()), !dbg !162
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !162
  %4 = load i32, i32* %data1, align 4, !dbg !163
  %cmp = icmp sge i32 %4, 0, !dbg !165
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !166

land.lhs.true:                                    ; preds = %entry
  %5 = load i32, i32* %data1, align 4, !dbg !167
  %cmp2 = icmp slt i32 %5, 10, !dbg !168
  br i1 %cmp2, label %if.then, label %if.else, !dbg !169

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, i32* %data1, align 4, !dbg !170
  %idxprom = sext i32 %6 to i64, !dbg !172
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !172
  store i32 1, i32* %arrayidx, align 4, !dbg !173
  store i32 0, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.then
  %7 = load i32, i32* %i, align 4, !dbg !177
  %cmp3 = icmp slt i32 %7, 10, !dbg !179
  br i1 %cmp3, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !181
  %idxprom4 = sext i32 %8 to i64, !dbg !183
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !183
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !183
  call void @printIntLine(i32 %9), !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !186
  %inc = add nsw i32 %10, 1, !dbg !186
  store i32 %inc, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !190

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !191
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !193
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 31, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_unionType", file: !12, line: 24, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 20, size: 32, elements: !21)
!21 = !{!22, !23}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !20, file: !12, line: 22, baseType: !16, size: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !20, file: !12, line: 23, baseType: !16, size: 32)
!24 = !DILocation(line: 31, column: 68, scope: !11)
!25 = !DILocation(line: 33, column: 10, scope: !11)
!26 = !DILocation(line: 35, column: 12, scope: !11)
!27 = !DILocation(line: 35, column: 5, scope: !11)
!28 = !DILocation(line: 36, column: 26, scope: !11)
!29 = !DILocation(line: 36, column: 13, scope: !11)
!30 = !DILocation(line: 36, column: 24, scope: !11)
!31 = !DILocalVariable(name: "data", scope: !32, file: !12, line: 38, type: !16)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!33 = !DILocation(line: 38, column: 13, scope: !32)
!34 = !DILocation(line: 38, column: 28, scope: !32)
!35 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 40, type: !16)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 39, column: 9)
!37 = !DILocation(line: 40, column: 17, scope: !36)
!38 = !DILocalVariable(name: "buffer", scope: !36, file: !12, line: 41, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 10)
!42 = !DILocation(line: 41, column: 17, scope: !36)
!43 = !DILocation(line: 44, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !36, file: !12, line: 44, column: 17)
!45 = !DILocation(line: 44, column: 22, scope: !44)
!46 = !DILocation(line: 44, column: 17, scope: !36)
!47 = !DILocation(line: 46, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 45, column: 13)
!49 = !DILocation(line: 46, column: 17, scope: !48)
!50 = !DILocation(line: 46, column: 30, scope: !48)
!51 = !DILocation(line: 48, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 48, column: 17)
!53 = !DILocation(line: 48, column: 21, scope: !52)
!54 = !DILocation(line: 48, column: 28, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 48, column: 17)
!56 = !DILocation(line: 48, column: 30, scope: !55)
!57 = !DILocation(line: 48, column: 17, scope: !52)
!58 = !DILocation(line: 50, column: 41, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 49, column: 17)
!60 = !DILocation(line: 50, column: 34, scope: !59)
!61 = !DILocation(line: 50, column: 21, scope: !59)
!62 = !DILocation(line: 51, column: 17, scope: !59)
!63 = !DILocation(line: 48, column: 37, scope: !55)
!64 = !DILocation(line: 48, column: 17, scope: !55)
!65 = distinct !{!65, !57, !66, !67}
!66 = !DILocation(line: 51, column: 17, scope: !52)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 52, column: 13, scope: !48)
!69 = !DILocation(line: 55, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !44, file: !12, line: 54, column: 13)
!71 = !DILocation(line: 59, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_34_good", scope: !12, file: !12, line: 133, type: !13, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 135, column: 5, scope: !72)
!74 = !DILocation(line: 136, column: 5, scope: !72)
!75 = !DILocation(line: 137, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 147, type: !77, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!16, !16, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 147, type: !16)
!83 = !DILocation(line: 147, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 147, type: !79)
!85 = !DILocation(line: 147, column: 27, scope: !76)
!86 = !DILocation(line: 150, column: 22, scope: !76)
!87 = !DILocation(line: 150, column: 12, scope: !76)
!88 = !DILocation(line: 150, column: 5, scope: !76)
!89 = !DILocation(line: 152, column: 5, scope: !76)
!90 = !DILocation(line: 153, column: 5, scope: !76)
!91 = !DILocation(line: 154, column: 5, scope: !76)
!92 = !DILocation(line: 157, column: 5, scope: !76)
!93 = !DILocation(line: 158, column: 5, scope: !76)
!94 = !DILocation(line: 159, column: 5, scope: !76)
!95 = !DILocation(line: 161, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 68, type: !16)
!98 = !DILocation(line: 68, column: 9, scope: !96)
!99 = !DILocalVariable(name: "myUnion", scope: !96, file: !12, line: 69, type: !19)
!100 = !DILocation(line: 69, column: 68, scope: !96)
!101 = !DILocation(line: 71, column: 10, scope: !96)
!102 = !DILocation(line: 74, column: 10, scope: !96)
!103 = !DILocation(line: 75, column: 26, scope: !96)
!104 = !DILocation(line: 75, column: 13, scope: !96)
!105 = !DILocation(line: 75, column: 24, scope: !96)
!106 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 77, type: !16)
!107 = distinct !DILexicalBlock(scope: !96, file: !12, line: 76, column: 5)
!108 = !DILocation(line: 77, column: 13, scope: !107)
!109 = !DILocation(line: 77, column: 28, scope: !107)
!110 = !DILocalVariable(name: "i", scope: !111, file: !12, line: 79, type: !16)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 78, column: 9)
!112 = !DILocation(line: 79, column: 17, scope: !111)
!113 = !DILocalVariable(name: "buffer", scope: !111, file: !12, line: 80, type: !39)
!114 = !DILocation(line: 80, column: 17, scope: !111)
!115 = !DILocation(line: 83, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !12, line: 83, column: 17)
!117 = !DILocation(line: 83, column: 22, scope: !116)
!118 = !DILocation(line: 83, column: 17, scope: !111)
!119 = !DILocation(line: 85, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 84, column: 13)
!121 = !DILocation(line: 85, column: 17, scope: !120)
!122 = !DILocation(line: 85, column: 30, scope: !120)
!123 = !DILocation(line: 87, column: 23, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 87, column: 17)
!125 = !DILocation(line: 87, column: 21, scope: !124)
!126 = !DILocation(line: 87, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 87, column: 17)
!128 = !DILocation(line: 87, column: 30, scope: !127)
!129 = !DILocation(line: 87, column: 17, scope: !124)
!130 = !DILocation(line: 89, column: 41, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !12, line: 88, column: 17)
!132 = !DILocation(line: 89, column: 34, scope: !131)
!133 = !DILocation(line: 89, column: 21, scope: !131)
!134 = !DILocation(line: 90, column: 17, scope: !131)
!135 = !DILocation(line: 87, column: 37, scope: !127)
!136 = !DILocation(line: 87, column: 17, scope: !127)
!137 = distinct !{!137, !129, !138, !67}
!138 = !DILocation(line: 90, column: 17, scope: !124)
!139 = !DILocation(line: 91, column: 13, scope: !120)
!140 = !DILocation(line: 94, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !116, file: !12, line: 93, column: 13)
!142 = !DILocation(line: 98, column: 1, scope: !96)
!143 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", scope: !143, file: !12, line: 103, type: !16)
!145 = !DILocation(line: 103, column: 9, scope: !143)
!146 = !DILocalVariable(name: "myUnion", scope: !143, file: !12, line: 104, type: !19)
!147 = !DILocation(line: 104, column: 68, scope: !143)
!148 = !DILocation(line: 106, column: 10, scope: !143)
!149 = !DILocation(line: 108, column: 12, scope: !143)
!150 = !DILocation(line: 108, column: 5, scope: !143)
!151 = !DILocation(line: 109, column: 26, scope: !143)
!152 = !DILocation(line: 109, column: 13, scope: !143)
!153 = !DILocation(line: 109, column: 24, scope: !143)
!154 = !DILocalVariable(name: "data", scope: !155, file: !12, line: 111, type: !16)
!155 = distinct !DILexicalBlock(scope: !143, file: !12, line: 110, column: 5)
!156 = !DILocation(line: 111, column: 13, scope: !155)
!157 = !DILocation(line: 111, column: 28, scope: !155)
!158 = !DILocalVariable(name: "i", scope: !159, file: !12, line: 113, type: !16)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 112, column: 9)
!160 = !DILocation(line: 113, column: 17, scope: !159)
!161 = !DILocalVariable(name: "buffer", scope: !159, file: !12, line: 114, type: !39)
!162 = !DILocation(line: 114, column: 17, scope: !159)
!163 = !DILocation(line: 116, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !12, line: 116, column: 17)
!165 = !DILocation(line: 116, column: 22, scope: !164)
!166 = !DILocation(line: 116, column: 27, scope: !164)
!167 = !DILocation(line: 116, column: 30, scope: !164)
!168 = !DILocation(line: 116, column: 35, scope: !164)
!169 = !DILocation(line: 116, column: 17, scope: !159)
!170 = !DILocation(line: 118, column: 24, scope: !171)
!171 = distinct !DILexicalBlock(scope: !164, file: !12, line: 117, column: 13)
!172 = !DILocation(line: 118, column: 17, scope: !171)
!173 = !DILocation(line: 118, column: 30, scope: !171)
!174 = !DILocation(line: 120, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !12, line: 120, column: 17)
!176 = !DILocation(line: 120, column: 21, scope: !175)
!177 = !DILocation(line: 120, column: 28, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !12, line: 120, column: 17)
!179 = !DILocation(line: 120, column: 30, scope: !178)
!180 = !DILocation(line: 120, column: 17, scope: !175)
!181 = !DILocation(line: 122, column: 41, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !12, line: 121, column: 17)
!183 = !DILocation(line: 122, column: 34, scope: !182)
!184 = !DILocation(line: 122, column: 21, scope: !182)
!185 = !DILocation(line: 123, column: 17, scope: !182)
!186 = !DILocation(line: 120, column: 37, scope: !178)
!187 = !DILocation(line: 120, column: 17, scope: !178)
!188 = distinct !{!188, !180, !189, !67}
!189 = !DILocation(line: 123, column: 17, scope: !175)
!190 = !DILocation(line: 124, column: 13, scope: !171)
!191 = !DILocation(line: 127, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !164, file: !12, line: 126, column: 13)
!193 = !DILocation(line: 131, column: 1, scope: !143)
