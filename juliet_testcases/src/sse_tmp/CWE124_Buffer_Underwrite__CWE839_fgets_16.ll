; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_16.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_16_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  br label %while.body, !dbg !20

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !21, metadata !DIExpression()), !dbg !28
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !28
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !29
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !31
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !32
  %cmp = icmp ne i8* %call, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %while.body
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !37
  store i32 %call2, i32* %data, align 4, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %while.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end, !dbg !42

while.end:                                        ; preds = %if.end
  br label %while.body3, !dbg !43

while.body3:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !48, metadata !DIExpression()), !dbg !52
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !52
  %3 = load i32, i32* %data, align 4, !dbg !53
  %cmp4 = icmp slt i32 %3, 10, !dbg !55
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !56

if.then5:                                         ; preds = %while.body3
  %4 = load i32, i32* %data, align 4, !dbg !57
  %idxprom = sext i32 %4 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !59
  store i32 1, i32* %arrayidx, align 4, !dbg !60
  store i32 0, i32* %i, align 4, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.then5
  %5 = load i32, i32* %i, align 4, !dbg !64
  %cmp6 = icmp slt i32 %5, 10, !dbg !66
  br i1 %cmp6, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !68
  %idxprom7 = sext i32 %6 to i64, !dbg !70
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !70
  %7 = load i32, i32* %arrayidx8, align 4, !dbg !70
  call void @printIntLine(i32 %7), !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !73
  %inc = add nsw i32 %8, 1, !dbg !73
  store i32 %inc, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !78

if.else9:                                         ; preds = %while.body3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %while.end11, !dbg !81

while.end11:                                      ; preds = %if.end10
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_fgets_16_good() #0 !dbg !83 {
entry:
  call void @goodB2G(), !dbg !84
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_16_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  call void @CWE124_Buffer_Underwrite__CWE839_fgets_16_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %data, align 4, !dbg !109
  br label %while.body, !dbg !110

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !114
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !114
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !115
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !117
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !118
  %cmp = icmp ne i8* %call, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %while.body
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !121
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !123
  store i32 %call2, i32* %data, align 4, !dbg !124
  br label %if.end, !dbg !125

if.else:                                          ; preds = %while.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end, !dbg !128

while.end:                                        ; preds = %if.end
  br label %while.body3, !dbg !129

while.body3:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !130, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !134, metadata !DIExpression()), !dbg !135
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !135
  %3 = load i32, i32* %data, align 4, !dbg !136
  %cmp4 = icmp sge i32 %3, 0, !dbg !138
  br i1 %cmp4, label %land.lhs.true, label %if.else10, !dbg !139

land.lhs.true:                                    ; preds = %while.body3
  %4 = load i32, i32* %data, align 4, !dbg !140
  %cmp5 = icmp slt i32 %4, 10, !dbg !141
  br i1 %cmp5, label %if.then6, label %if.else10, !dbg !142

if.then6:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !143
  %idxprom = sext i32 %5 to i64, !dbg !145
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !145
  store i32 1, i32* %arrayidx, align 4, !dbg !146
  store i32 0, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.then6
  %6 = load i32, i32* %i, align 4, !dbg !150
  %cmp7 = icmp slt i32 %6, 10, !dbg !152
  br i1 %cmp7, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !154
  %idxprom8 = sext i32 %7 to i64, !dbg !156
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !156
  %8 = load i32, i32* %arrayidx9, align 4, !dbg !156
  call void @printIntLine(i32 %8), !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !159
  %inc = add nsw i32 %9, 1, !dbg !159
  store i32 %inc, i32* %i, align 4, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  br label %if.end11, !dbg !163

if.else10:                                        ; preds = %land.lhs.true, %while.body3
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !164
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %for.end
  br label %while.end12, !dbg !166

while.end12:                                      ; preds = %if.end11
  ret void, !dbg !167
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !168 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !169, metadata !DIExpression()), !dbg !170
  store i32 -1, i32* %data, align 4, !dbg !171
  br label %while.body, !dbg !172

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !173
  br label %while.end, !dbg !175

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !176

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !177, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !181, metadata !DIExpression()), !dbg !182
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !182
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !182
  %1 = load i32, i32* %data, align 4, !dbg !183
  %cmp = icmp slt i32 %1, 10, !dbg !185
  br i1 %cmp, label %if.then, label %if.else, !dbg !186

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !187
  %idxprom = sext i32 %2 to i64, !dbg !189
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !189
  store i32 1, i32* %arrayidx, align 4, !dbg !190
  store i32 0, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !194
  %cmp2 = icmp slt i32 %3, 10, !dbg !196
  br i1 %cmp2, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !198
  %idxprom3 = sext i32 %4 to i64, !dbg !200
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !200
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !200
  call void @printIntLine(i32 %5), !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !203
  %inc = add nsw i32 %6, 1, !dbg !203
  store i32 %inc, i32* %i, align 4, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !207

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !208
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !210

while.end5:                                       ; preds = %if.end
  ret void, !dbg !211
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_16_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_fgets_16.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocation(line: 29, column: 5, scope: !12)
!21 = !DILocalVariable(name: "inputBuffer", scope: !22, file: !13, line: 32, type: !24)
!22 = distinct !DILexicalBlock(scope: !23, file: !13, line: 31, column: 9)
!23 = distinct !DILexicalBlock(scope: !12, file: !13, line: 30, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 112, elements: !26)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !{!27}
!27 = !DISubrange(count: 14)
!28 = !DILocation(line: 32, column: 18, scope: !22)
!29 = !DILocation(line: 34, column: 23, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !13, line: 34, column: 17)
!31 = !DILocation(line: 34, column: 53, scope: !30)
!32 = !DILocation(line: 34, column: 17, scope: !30)
!33 = !DILocation(line: 34, column: 60, scope: !30)
!34 = !DILocation(line: 34, column: 17, scope: !22)
!35 = !DILocation(line: 37, column: 29, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !13, line: 35, column: 13)
!37 = !DILocation(line: 37, column: 24, scope: !36)
!38 = !DILocation(line: 37, column: 22, scope: !36)
!39 = !DILocation(line: 38, column: 13, scope: !36)
!40 = !DILocation(line: 41, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !30, file: !13, line: 40, column: 13)
!42 = !DILocation(line: 44, column: 9, scope: !23)
!43 = !DILocation(line: 46, column: 5, scope: !12)
!44 = !DILocalVariable(name: "i", scope: !45, file: !13, line: 49, type: !17)
!45 = distinct !DILexicalBlock(scope: !46, file: !13, line: 48, column: 9)
!46 = distinct !DILexicalBlock(scope: !12, file: !13, line: 47, column: 5)
!47 = !DILocation(line: 49, column: 17, scope: !45)
!48 = !DILocalVariable(name: "buffer", scope: !45, file: !13, line: 50, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 10)
!52 = !DILocation(line: 50, column: 17, scope: !45)
!53 = !DILocation(line: 53, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !45, file: !13, line: 53, column: 17)
!55 = !DILocation(line: 53, column: 22, scope: !54)
!56 = !DILocation(line: 53, column: 17, scope: !45)
!57 = !DILocation(line: 55, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !13, line: 54, column: 13)
!59 = !DILocation(line: 55, column: 17, scope: !58)
!60 = !DILocation(line: 55, column: 30, scope: !58)
!61 = !DILocation(line: 57, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !13, line: 57, column: 17)
!63 = !DILocation(line: 57, column: 21, scope: !62)
!64 = !DILocation(line: 57, column: 28, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !13, line: 57, column: 17)
!66 = !DILocation(line: 57, column: 30, scope: !65)
!67 = !DILocation(line: 57, column: 17, scope: !62)
!68 = !DILocation(line: 59, column: 41, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !13, line: 58, column: 17)
!70 = !DILocation(line: 59, column: 34, scope: !69)
!71 = !DILocation(line: 59, column: 21, scope: !69)
!72 = !DILocation(line: 60, column: 17, scope: !69)
!73 = !DILocation(line: 57, column: 37, scope: !65)
!74 = !DILocation(line: 57, column: 17, scope: !65)
!75 = distinct !{!75, !67, !76, !77}
!76 = !DILocation(line: 60, column: 17, scope: !62)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 61, column: 13, scope: !58)
!79 = !DILocation(line: 64, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !54, file: !13, line: 63, column: 13)
!81 = !DILocation(line: 67, column: 9, scope: !46)
!82 = !DILocation(line: 69, column: 1, scope: !12)
!83 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_fgets_16_good", scope: !13, file: !13, line: 160, type: !14, scopeLine: 161, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 162, column: 5, scope: !83)
!85 = !DILocation(line: 163, column: 5, scope: !83)
!86 = !DILocation(line: 164, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 175, type: !88, scopeLine: 176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!17, !17, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !13, line: 175, type: !17)
!93 = !DILocation(line: 175, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !13, line: 175, type: !90)
!95 = !DILocation(line: 175, column: 27, scope: !87)
!96 = !DILocation(line: 178, column: 22, scope: !87)
!97 = !DILocation(line: 178, column: 12, scope: !87)
!98 = !DILocation(line: 178, column: 5, scope: !87)
!99 = !DILocation(line: 180, column: 5, scope: !87)
!100 = !DILocation(line: 181, column: 5, scope: !87)
!101 = !DILocation(line: 182, column: 5, scope: !87)
!102 = !DILocation(line: 185, column: 5, scope: !87)
!103 = !DILocation(line: 186, column: 5, scope: !87)
!104 = !DILocation(line: 187, column: 5, scope: !87)
!105 = !DILocation(line: 189, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 76, type: !14, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !13, line: 78, type: !17)
!108 = !DILocation(line: 78, column: 9, scope: !106)
!109 = !DILocation(line: 80, column: 10, scope: !106)
!110 = !DILocation(line: 81, column: 5, scope: !106)
!111 = !DILocalVariable(name: "inputBuffer", scope: !112, file: !13, line: 84, type: !24)
!112 = distinct !DILexicalBlock(scope: !113, file: !13, line: 83, column: 9)
!113 = distinct !DILexicalBlock(scope: !106, file: !13, line: 82, column: 5)
!114 = !DILocation(line: 84, column: 18, scope: !112)
!115 = !DILocation(line: 86, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !13, line: 86, column: 17)
!117 = !DILocation(line: 86, column: 53, scope: !116)
!118 = !DILocation(line: 86, column: 17, scope: !116)
!119 = !DILocation(line: 86, column: 60, scope: !116)
!120 = !DILocation(line: 86, column: 17, scope: !112)
!121 = !DILocation(line: 89, column: 29, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !13, line: 87, column: 13)
!123 = !DILocation(line: 89, column: 24, scope: !122)
!124 = !DILocation(line: 89, column: 22, scope: !122)
!125 = !DILocation(line: 90, column: 13, scope: !122)
!126 = !DILocation(line: 93, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !116, file: !13, line: 92, column: 13)
!128 = !DILocation(line: 96, column: 9, scope: !113)
!129 = !DILocation(line: 98, column: 5, scope: !106)
!130 = !DILocalVariable(name: "i", scope: !131, file: !13, line: 101, type: !17)
!131 = distinct !DILexicalBlock(scope: !132, file: !13, line: 100, column: 9)
!132 = distinct !DILexicalBlock(scope: !106, file: !13, line: 99, column: 5)
!133 = !DILocation(line: 101, column: 17, scope: !131)
!134 = !DILocalVariable(name: "buffer", scope: !131, file: !13, line: 102, type: !49)
!135 = !DILocation(line: 102, column: 17, scope: !131)
!136 = !DILocation(line: 104, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !13, line: 104, column: 17)
!138 = !DILocation(line: 104, column: 22, scope: !137)
!139 = !DILocation(line: 104, column: 27, scope: !137)
!140 = !DILocation(line: 104, column: 30, scope: !137)
!141 = !DILocation(line: 104, column: 35, scope: !137)
!142 = !DILocation(line: 104, column: 17, scope: !131)
!143 = !DILocation(line: 106, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !13, line: 105, column: 13)
!145 = !DILocation(line: 106, column: 17, scope: !144)
!146 = !DILocation(line: 106, column: 30, scope: !144)
!147 = !DILocation(line: 108, column: 23, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !13, line: 108, column: 17)
!149 = !DILocation(line: 108, column: 21, scope: !148)
!150 = !DILocation(line: 108, column: 28, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !13, line: 108, column: 17)
!152 = !DILocation(line: 108, column: 30, scope: !151)
!153 = !DILocation(line: 108, column: 17, scope: !148)
!154 = !DILocation(line: 110, column: 41, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !13, line: 109, column: 17)
!156 = !DILocation(line: 110, column: 34, scope: !155)
!157 = !DILocation(line: 110, column: 21, scope: !155)
!158 = !DILocation(line: 111, column: 17, scope: !155)
!159 = !DILocation(line: 108, column: 37, scope: !151)
!160 = !DILocation(line: 108, column: 17, scope: !151)
!161 = distinct !{!161, !153, !162, !77}
!162 = !DILocation(line: 111, column: 17, scope: !148)
!163 = !DILocation(line: 112, column: 13, scope: !144)
!164 = !DILocation(line: 115, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !137, file: !13, line: 114, column: 13)
!166 = !DILocation(line: 118, column: 9, scope: !132)
!167 = !DILocation(line: 120, column: 1, scope: !106)
!168 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 123, type: !14, scopeLine: 124, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!169 = !DILocalVariable(name: "data", scope: !168, file: !13, line: 125, type: !17)
!170 = !DILocation(line: 125, column: 9, scope: !168)
!171 = !DILocation(line: 127, column: 10, scope: !168)
!172 = !DILocation(line: 128, column: 5, scope: !168)
!173 = !DILocation(line: 132, column: 14, scope: !174)
!174 = distinct !DILexicalBlock(scope: !168, file: !13, line: 129, column: 5)
!175 = !DILocation(line: 133, column: 9, scope: !174)
!176 = !DILocation(line: 135, column: 5, scope: !168)
!177 = !DILocalVariable(name: "i", scope: !178, file: !13, line: 138, type: !17)
!178 = distinct !DILexicalBlock(scope: !179, file: !13, line: 137, column: 9)
!179 = distinct !DILexicalBlock(scope: !168, file: !13, line: 136, column: 5)
!180 = !DILocation(line: 138, column: 17, scope: !178)
!181 = !DILocalVariable(name: "buffer", scope: !178, file: !13, line: 139, type: !49)
!182 = !DILocation(line: 139, column: 17, scope: !178)
!183 = !DILocation(line: 142, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !178, file: !13, line: 142, column: 17)
!185 = !DILocation(line: 142, column: 22, scope: !184)
!186 = !DILocation(line: 142, column: 17, scope: !178)
!187 = !DILocation(line: 144, column: 24, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !13, line: 143, column: 13)
!189 = !DILocation(line: 144, column: 17, scope: !188)
!190 = !DILocation(line: 144, column: 30, scope: !188)
!191 = !DILocation(line: 146, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !13, line: 146, column: 17)
!193 = !DILocation(line: 146, column: 21, scope: !192)
!194 = !DILocation(line: 146, column: 28, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !13, line: 146, column: 17)
!196 = !DILocation(line: 146, column: 30, scope: !195)
!197 = !DILocation(line: 146, column: 17, scope: !192)
!198 = !DILocation(line: 148, column: 41, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !13, line: 147, column: 17)
!200 = !DILocation(line: 148, column: 34, scope: !199)
!201 = !DILocation(line: 148, column: 21, scope: !199)
!202 = !DILocation(line: 149, column: 17, scope: !199)
!203 = !DILocation(line: 146, column: 37, scope: !195)
!204 = !DILocation(line: 146, column: 17, scope: !195)
!205 = distinct !{!205, !197, !206, !77}
!206 = !DILocation(line: 149, column: 17, scope: !192)
!207 = !DILocation(line: 150, column: 13, scope: !188)
!208 = !DILocation(line: 153, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !184, file: !13, line: 152, column: 13)
!210 = !DILocation(line: 156, column: 9, scope: !179)
!211 = !DILocation(line: 158, column: 1, scope: !168)
