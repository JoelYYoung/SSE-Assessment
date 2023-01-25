; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_badData = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_goodG2BData = internal global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_goodB2GData = internal global i32 0, align 4, !dbg !12
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  store i32 10, i32* %data, align 4, !dbg !26
  %0 = load i32, i32* %data, align 4, !dbg !27
  store i32 %0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_badData, align 4, !dbg !28
  call void @badSink(), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_good() #0 !dbg !31 {
entry:
  call void @goodG2B(), !dbg !32
  call void @goodB2G(), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* null) #5, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #5, !dbg !47
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_bad(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !55 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_badData, align 4, !dbg !58
  store i32 %0, i32* %data, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata i32* %i, metadata !59, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !62, metadata !DIExpression()), !dbg !66
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !66
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !66
  %2 = load i32, i32* %data, align 4, !dbg !67
  %cmp = icmp sge i32 %2, 0, !dbg !69
  br i1 %cmp, label %if.then, label %if.else, !dbg !70

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !71
  %idxprom = sext i32 %3 to i64, !dbg !73
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !73
  store i32 1, i32* %arrayidx, align 4, !dbg !74
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !78
  %cmp1 = icmp slt i32 %4, 10, !dbg !80
  br i1 %cmp1, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !82
  %idxprom2 = sext i32 %5 to i64, !dbg !84
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !84
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !84
  call void @printIntLine(i32 %6), !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !87
  %inc = add nsw i32 %7, 1, !dbg !87
  store i32 %inc, i32* %i, align 4, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !95
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32 -1, i32* %data, align 4, !dbg !99
  store i32 7, i32* %data, align 4, !dbg !100
  %0 = load i32, i32* %data, align 4, !dbg !101
  store i32 %0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_goodG2BData, align 4, !dbg !102
  call void @goodG2BSink(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !105 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_goodG2BData, align 4, !dbg !108
  store i32 %0, i32* %data, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata i32* %i, metadata !109, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !112, metadata !DIExpression()), !dbg !113
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !113
  %2 = load i32, i32* %data, align 4, !dbg !114
  %cmp = icmp sge i32 %2, 0, !dbg !116
  br i1 %cmp, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !118
  %idxprom = sext i32 %3 to i64, !dbg !120
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !120
  store i32 1, i32* %arrayidx, align 4, !dbg !121
  store i32 0, i32* %i, align 4, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !125
  %cmp1 = icmp slt i32 %4, 10, !dbg !127
  br i1 %cmp1, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !129
  %idxprom2 = sext i32 %5 to i64, !dbg !131
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !131
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !131
  call void @printIntLine(i32 %6), !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !134
  %inc = add nsw i32 %7, 1, !dbg !134
  store i32 %inc, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !138

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !142 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !143, metadata !DIExpression()), !dbg !144
  store i32 -1, i32* %data, align 4, !dbg !145
  store i32 10, i32* %data, align 4, !dbg !146
  %0 = load i32, i32* %data, align 4, !dbg !147
  store i32 %0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_goodB2GData, align 4, !dbg !148
  call void @goodB2GSink(), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !151 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_goodB2GData, align 4, !dbg !154
  store i32 %0, i32* %data, align 4, !dbg !153
  call void @llvm.dbg.declare(metadata i32* %i, metadata !155, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !158, metadata !DIExpression()), !dbg !159
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !159
  %2 = load i32, i32* %data, align 4, !dbg !160
  %cmp = icmp sge i32 %2, 0, !dbg !162
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !163

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !164
  %cmp1 = icmp slt i32 %3, 10, !dbg !165
  br i1 %cmp1, label %if.then, label %if.else, !dbg !166

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !167
  %idxprom = sext i32 %4 to i64, !dbg !169
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !169
  store i32 1, i32* %arrayidx, align 4, !dbg !170
  store i32 0, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !174
  %cmp2 = icmp slt i32 %5, 10, !dbg !176
  br i1 %cmp2, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !178
  %idxprom3 = sext i32 %6 to i64, !dbg !180
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !180
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !180
  call void @printIntLine(i32 %7), !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !183
  %inc = add nsw i32 %8, 1, !dbg !183
  store i32 %inc, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !187

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !188
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !190
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_badData", scope: !2, file: !10, line: 20, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_goodG2BData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_goodB2GData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_bad", scope: !10, file: !10, line: 50, type: !21, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 52, type: !11)
!24 = !DILocation(line: 52, column: 9, scope: !20)
!25 = !DILocation(line: 54, column: 10, scope: !20)
!26 = !DILocation(line: 56, column: 10, scope: !20)
!27 = !DILocation(line: 57, column: 67, scope: !20)
!28 = !DILocation(line: 57, column: 65, scope: !20)
!29 = !DILocation(line: 58, column: 5, scope: !20)
!30 = !DILocation(line: 59, column: 1, scope: !20)
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_45_good", scope: !10, file: !10, line: 137, type: !21, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DILocation(line: 139, column: 5, scope: !31)
!33 = !DILocation(line: 140, column: 5, scope: !31)
!34 = !DILocation(line: 141, column: 1, scope: !31)
!35 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 151, type: !36, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{!11, !11, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !10, line: 151, type: !11)
!42 = !DILocation(line: 151, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !10, line: 151, type: !38)
!44 = !DILocation(line: 151, column: 27, scope: !35)
!45 = !DILocation(line: 154, column: 22, scope: !35)
!46 = !DILocation(line: 154, column: 12, scope: !35)
!47 = !DILocation(line: 154, column: 5, scope: !35)
!48 = !DILocation(line: 156, column: 5, scope: !35)
!49 = !DILocation(line: 157, column: 5, scope: !35)
!50 = !DILocation(line: 158, column: 5, scope: !35)
!51 = !DILocation(line: 161, column: 5, scope: !35)
!52 = !DILocation(line: 162, column: 5, scope: !35)
!53 = !DILocation(line: 163, column: 5, scope: !35)
!54 = !DILocation(line: 165, column: 5, scope: !35)
!55 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocalVariable(name: "data", scope: !55, file: !10, line: 28, type: !11)
!57 = !DILocation(line: 28, column: 9, scope: !55)
!58 = !DILocation(line: 28, column: 16, scope: !55)
!59 = !DILocalVariable(name: "i", scope: !60, file: !10, line: 30, type: !11)
!60 = distinct !DILexicalBlock(scope: !55, file: !10, line: 29, column: 5)
!61 = !DILocation(line: 30, column: 13, scope: !60)
!62 = !DILocalVariable(name: "buffer", scope: !60, file: !10, line: 31, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 10)
!66 = !DILocation(line: 31, column: 13, scope: !60)
!67 = !DILocation(line: 34, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !60, file: !10, line: 34, column: 13)
!69 = !DILocation(line: 34, column: 18, scope: !68)
!70 = !DILocation(line: 34, column: 13, scope: !60)
!71 = !DILocation(line: 36, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !10, line: 35, column: 9)
!73 = !DILocation(line: 36, column: 13, scope: !72)
!74 = !DILocation(line: 36, column: 26, scope: !72)
!75 = !DILocation(line: 38, column: 19, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !10, line: 38, column: 13)
!77 = !DILocation(line: 38, column: 17, scope: !76)
!78 = !DILocation(line: 38, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !10, line: 38, column: 13)
!80 = !DILocation(line: 38, column: 26, scope: !79)
!81 = !DILocation(line: 38, column: 13, scope: !76)
!82 = !DILocation(line: 40, column: 37, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !10, line: 39, column: 13)
!84 = !DILocation(line: 40, column: 30, scope: !83)
!85 = !DILocation(line: 40, column: 17, scope: !83)
!86 = !DILocation(line: 41, column: 13, scope: !83)
!87 = !DILocation(line: 38, column: 33, scope: !79)
!88 = !DILocation(line: 38, column: 13, scope: !79)
!89 = distinct !{!89, !81, !90, !91}
!90 = !DILocation(line: 41, column: 13, scope: !76)
!91 = !{!"llvm.loop.mustprogress"}
!92 = !DILocation(line: 42, column: 9, scope: !72)
!93 = !DILocation(line: 45, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !68, file: !10, line: 44, column: 9)
!95 = !DILocation(line: 48, column: 1, scope: !55)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 90, type: !21, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !10, line: 92, type: !11)
!98 = !DILocation(line: 92, column: 9, scope: !96)
!99 = !DILocation(line: 94, column: 10, scope: !96)
!100 = !DILocation(line: 97, column: 10, scope: !96)
!101 = !DILocation(line: 98, column: 71, scope: !96)
!102 = !DILocation(line: 98, column: 69, scope: !96)
!103 = !DILocation(line: 99, column: 5, scope: !96)
!104 = !DILocation(line: 100, column: 1, scope: !96)
!105 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 66, type: !21, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !10, line: 68, type: !11)
!107 = !DILocation(line: 68, column: 9, scope: !105)
!108 = !DILocation(line: 68, column: 16, scope: !105)
!109 = !DILocalVariable(name: "i", scope: !110, file: !10, line: 70, type: !11)
!110 = distinct !DILexicalBlock(scope: !105, file: !10, line: 69, column: 5)
!111 = !DILocation(line: 70, column: 13, scope: !110)
!112 = !DILocalVariable(name: "buffer", scope: !110, file: !10, line: 71, type: !63)
!113 = !DILocation(line: 71, column: 13, scope: !110)
!114 = !DILocation(line: 74, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !10, line: 74, column: 13)
!116 = !DILocation(line: 74, column: 18, scope: !115)
!117 = !DILocation(line: 74, column: 13, scope: !110)
!118 = !DILocation(line: 76, column: 20, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !10, line: 75, column: 9)
!120 = !DILocation(line: 76, column: 13, scope: !119)
!121 = !DILocation(line: 76, column: 26, scope: !119)
!122 = !DILocation(line: 78, column: 19, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !10, line: 78, column: 13)
!124 = !DILocation(line: 78, column: 17, scope: !123)
!125 = !DILocation(line: 78, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !10, line: 78, column: 13)
!127 = !DILocation(line: 78, column: 26, scope: !126)
!128 = !DILocation(line: 78, column: 13, scope: !123)
!129 = !DILocation(line: 80, column: 37, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !10, line: 79, column: 13)
!131 = !DILocation(line: 80, column: 30, scope: !130)
!132 = !DILocation(line: 80, column: 17, scope: !130)
!133 = !DILocation(line: 81, column: 13, scope: !130)
!134 = !DILocation(line: 78, column: 33, scope: !126)
!135 = !DILocation(line: 78, column: 13, scope: !126)
!136 = distinct !{!136, !128, !137, !91}
!137 = !DILocation(line: 81, column: 13, scope: !123)
!138 = !DILocation(line: 82, column: 9, scope: !119)
!139 = !DILocation(line: 85, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !115, file: !10, line: 84, column: 9)
!141 = !DILocation(line: 88, column: 1, scope: !105)
!142 = distinct !DISubprogram(name: "goodB2G", scope: !10, file: !10, line: 126, type: !21, scopeLine: 127, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!143 = !DILocalVariable(name: "data", scope: !142, file: !10, line: 128, type: !11)
!144 = !DILocation(line: 128, column: 9, scope: !142)
!145 = !DILocation(line: 130, column: 10, scope: !142)
!146 = !DILocation(line: 132, column: 10, scope: !142)
!147 = !DILocation(line: 133, column: 71, scope: !142)
!148 = !DILocation(line: 133, column: 69, scope: !142)
!149 = !DILocation(line: 134, column: 5, scope: !142)
!150 = !DILocation(line: 135, column: 1, scope: !142)
!151 = distinct !DISubprogram(name: "goodB2GSink", scope: !10, file: !10, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!152 = !DILocalVariable(name: "data", scope: !151, file: !10, line: 105, type: !11)
!153 = !DILocation(line: 105, column: 9, scope: !151)
!154 = !DILocation(line: 105, column: 16, scope: !151)
!155 = !DILocalVariable(name: "i", scope: !156, file: !10, line: 107, type: !11)
!156 = distinct !DILexicalBlock(scope: !151, file: !10, line: 106, column: 5)
!157 = !DILocation(line: 107, column: 13, scope: !156)
!158 = !DILocalVariable(name: "buffer", scope: !156, file: !10, line: 108, type: !63)
!159 = !DILocation(line: 108, column: 13, scope: !156)
!160 = !DILocation(line: 110, column: 13, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !10, line: 110, column: 13)
!162 = !DILocation(line: 110, column: 18, scope: !161)
!163 = !DILocation(line: 110, column: 23, scope: !161)
!164 = !DILocation(line: 110, column: 26, scope: !161)
!165 = !DILocation(line: 110, column: 31, scope: !161)
!166 = !DILocation(line: 110, column: 13, scope: !156)
!167 = !DILocation(line: 112, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !10, line: 111, column: 9)
!169 = !DILocation(line: 112, column: 13, scope: !168)
!170 = !DILocation(line: 112, column: 26, scope: !168)
!171 = !DILocation(line: 114, column: 19, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !10, line: 114, column: 13)
!173 = !DILocation(line: 114, column: 17, scope: !172)
!174 = !DILocation(line: 114, column: 24, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !10, line: 114, column: 13)
!176 = !DILocation(line: 114, column: 26, scope: !175)
!177 = !DILocation(line: 114, column: 13, scope: !172)
!178 = !DILocation(line: 116, column: 37, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !10, line: 115, column: 13)
!180 = !DILocation(line: 116, column: 30, scope: !179)
!181 = !DILocation(line: 116, column: 17, scope: !179)
!182 = !DILocation(line: 117, column: 13, scope: !179)
!183 = !DILocation(line: 114, column: 33, scope: !175)
!184 = !DILocation(line: 114, column: 13, scope: !175)
!185 = distinct !{!185, !177, !186, !91}
!186 = !DILocation(line: 117, column: 13, scope: !172)
!187 = !DILocation(line: 118, column: 9, scope: !168)
!188 = !DILocation(line: 121, column: 13, scope: !189)
!189 = distinct !DILexicalBlock(scope: !161, file: !10, line: 120, column: 9)
!190 = !DILocation(line: 124, column: 1, scope: !151)
