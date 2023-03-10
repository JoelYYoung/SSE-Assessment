; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_32.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !18, metadata !DIExpression()), !dbg !20
  store i32* %data, i32** %dataPtr1, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !21, metadata !DIExpression()), !dbg !22
  store i32* %data, i32** %dataPtr2, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !24, metadata !DIExpression()), !dbg !26
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !27
  %1 = load i32, i32* %0, align 4, !dbg !28
  store i32 %1, i32* %data1, align 4, !dbg !26
  store i32 -5, i32* %data1, align 4, !dbg !29
  %2 = load i32, i32* %data1, align 4, !dbg !30
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !31
  store i32 %2, i32* %3, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !33, metadata !DIExpression()), !dbg !35
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !36
  %5 = load i32, i32* %4, align 4, !dbg !37
  store i32 %5, i32* %data2, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !38, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !41, metadata !DIExpression()), !dbg !45
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !45
  %7 = load i32, i32* %data2, align 4, !dbg !46
  %cmp = icmp slt i32 %7, 10, !dbg !48
  br i1 %cmp, label %if.then, label %if.else, !dbg !49

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !50
  %idxprom = sext i32 %8 to i64, !dbg !52
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !52
  store i32 1, i32* %arrayidx, align 4, !dbg !53
  store i32 0, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !57
  %cmp3 = icmp slt i32 %9, 10, !dbg !59
  br i1 %cmp3, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !61
  %idxprom4 = sext i32 %10 to i64, !dbg !63
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !63
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !63
  call void @printIntLine(i32 %11), !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !66
  %inc = add nsw i32 %12, 1, !dbg !66
  store i32 %inc, i32* %i, align 4, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !71

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !72
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_32_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  call void @goodB2G(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #5, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #5, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @CWE124_Buffer_Underwrite__CWE839_negative_32_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  call void @CWE124_Buffer_Underwrite__CWE839_negative_32_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !102, metadata !DIExpression()), !dbg !103
  store i32* %data, i32** %dataPtr1, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* %data, i32** %dataPtr2, align 8, !dbg !105
  store i32 -1, i32* %data, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !107, metadata !DIExpression()), !dbg !109
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !110
  %1 = load i32, i32* %0, align 4, !dbg !111
  store i32 %1, i32* %data1, align 4, !dbg !109
  store i32 7, i32* %data1, align 4, !dbg !112
  %2 = load i32, i32* %data1, align 4, !dbg !113
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !114
  store i32 %2, i32* %3, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !116, metadata !DIExpression()), !dbg !118
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !119
  %5 = load i32, i32* %4, align 4, !dbg !120
  store i32 %5, i32* %data2, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata i32* %i, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !124, metadata !DIExpression()), !dbg !125
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !125
  %7 = load i32, i32* %data2, align 4, !dbg !126
  %cmp = icmp slt i32 %7, 10, !dbg !128
  br i1 %cmp, label %if.then, label %if.else, !dbg !129

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !130
  %idxprom = sext i32 %8 to i64, !dbg !132
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !132
  store i32 1, i32* %arrayidx, align 4, !dbg !133
  store i32 0, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !137
  %cmp3 = icmp slt i32 %9, 10, !dbg !139
  br i1 %cmp3, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !141
  %idxprom4 = sext i32 %10 to i64, !dbg !143
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !143
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !143
  call void @printIntLine(i32 %11), !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !146
  %inc = add nsw i32 %12, 1, !dbg !146
  store i32 %inc, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !150

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !151
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !154 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !157, metadata !DIExpression()), !dbg !158
  store i32* %data, i32** %dataPtr1, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !159, metadata !DIExpression()), !dbg !160
  store i32* %data, i32** %dataPtr2, align 8, !dbg !160
  store i32 -1, i32* %data, align 4, !dbg !161
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !162, metadata !DIExpression()), !dbg !164
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !165
  %1 = load i32, i32* %0, align 4, !dbg !166
  store i32 %1, i32* %data1, align 4, !dbg !164
  store i32 -5, i32* %data1, align 4, !dbg !167
  %2 = load i32, i32* %data1, align 4, !dbg !168
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !169
  store i32 %2, i32* %3, align 4, !dbg !170
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !171, metadata !DIExpression()), !dbg !173
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !174
  %5 = load i32, i32* %4, align 4, !dbg !175
  store i32 %5, i32* %data2, align 4, !dbg !173
  call void @llvm.dbg.declare(metadata i32* %i, metadata !176, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !179, metadata !DIExpression()), !dbg !180
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !180
  %7 = load i32, i32* %data2, align 4, !dbg !181
  %cmp = icmp sge i32 %7, 0, !dbg !183
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !184

land.lhs.true:                                    ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !185
  %cmp3 = icmp slt i32 %8, 10, !dbg !186
  br i1 %cmp3, label %if.then, label %if.else, !dbg !187

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32, i32* %data2, align 4, !dbg !188
  %idxprom = sext i32 %9 to i64, !dbg !190
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !190
  store i32 1, i32* %arrayidx, align 4, !dbg !191
  store i32 0, i32* %i, align 4, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.then
  %10 = load i32, i32* %i, align 4, !dbg !195
  %cmp4 = icmp slt i32 %10, 10, !dbg !197
  br i1 %cmp4, label %for.body, label %for.end, !dbg !198

for.body:                                         ; preds = %for.cond
  %11 = load i32, i32* %i, align 4, !dbg !199
  %idxprom5 = sext i32 %11 to i64, !dbg !201
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !201
  %12 = load i32, i32* %arrayidx6, align 4, !dbg !201
  call void @printIntLine(i32 %12), !dbg !202
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4, !dbg !204
  %inc = add nsw i32 %13, 1, !dbg !204
  store i32 %inc, i32* %i, align 4, !dbg !204
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !208

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !209
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !211
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_32_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 25, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!20 = !DILocation(line: 25, column: 10, scope: !11)
!21 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 26, type: !19)
!22 = !DILocation(line: 26, column: 10, scope: !11)
!23 = !DILocation(line: 28, column: 10, scope: !11)
!24 = !DILocalVariable(name: "data", scope: !25, file: !12, line: 30, type: !16)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!26 = !DILocation(line: 30, column: 13, scope: !25)
!27 = !DILocation(line: 30, column: 21, scope: !25)
!28 = !DILocation(line: 30, column: 20, scope: !25)
!29 = !DILocation(line: 32, column: 14, scope: !25)
!30 = !DILocation(line: 33, column: 21, scope: !25)
!31 = !DILocation(line: 33, column: 10, scope: !25)
!32 = !DILocation(line: 33, column: 19, scope: !25)
!33 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 36, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!35 = !DILocation(line: 36, column: 13, scope: !34)
!36 = !DILocation(line: 36, column: 21, scope: !34)
!37 = !DILocation(line: 36, column: 20, scope: !34)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 38, type: !16)
!39 = distinct !DILexicalBlock(scope: !34, file: !12, line: 37, column: 9)
!40 = !DILocation(line: 38, column: 17, scope: !39)
!41 = !DILocalVariable(name: "buffer", scope: !39, file: !12, line: 39, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 10)
!45 = !DILocation(line: 39, column: 17, scope: !39)
!46 = !DILocation(line: 42, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !12, line: 42, column: 17)
!48 = !DILocation(line: 42, column: 22, scope: !47)
!49 = !DILocation(line: 42, column: 17, scope: !39)
!50 = !DILocation(line: 44, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !12, line: 43, column: 13)
!52 = !DILocation(line: 44, column: 17, scope: !51)
!53 = !DILocation(line: 44, column: 30, scope: !51)
!54 = !DILocation(line: 46, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 46, column: 17)
!56 = !DILocation(line: 46, column: 21, scope: !55)
!57 = !DILocation(line: 46, column: 28, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 46, column: 17)
!59 = !DILocation(line: 46, column: 30, scope: !58)
!60 = !DILocation(line: 46, column: 17, scope: !55)
!61 = !DILocation(line: 48, column: 41, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 47, column: 17)
!63 = !DILocation(line: 48, column: 34, scope: !62)
!64 = !DILocation(line: 48, column: 21, scope: !62)
!65 = !DILocation(line: 49, column: 17, scope: !62)
!66 = !DILocation(line: 46, column: 37, scope: !58)
!67 = !DILocation(line: 46, column: 17, scope: !58)
!68 = distinct !{!68, !60, !69, !70}
!69 = !DILocation(line: 49, column: 17, scope: !55)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 50, column: 13, scope: !51)
!72 = !DILocation(line: 53, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !47, file: !12, line: 52, column: 13)
!74 = !DILocation(line: 57, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_32_good", scope: !12, file: !12, line: 139, type: !13, scopeLine: 140, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 141, column: 5, scope: !75)
!77 = !DILocation(line: 142, column: 5, scope: !75)
!78 = !DILocation(line: 143, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 153, type: !80, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!16, !16, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 153, type: !16)
!86 = !DILocation(line: 153, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 153, type: !82)
!88 = !DILocation(line: 153, column: 27, scope: !79)
!89 = !DILocation(line: 156, column: 22, scope: !79)
!90 = !DILocation(line: 156, column: 12, scope: !79)
!91 = !DILocation(line: 156, column: 5, scope: !79)
!92 = !DILocation(line: 158, column: 5, scope: !79)
!93 = !DILocation(line: 159, column: 5, scope: !79)
!94 = !DILocation(line: 160, column: 5, scope: !79)
!95 = !DILocation(line: 163, column: 5, scope: !79)
!96 = !DILocation(line: 164, column: 5, scope: !79)
!97 = !DILocation(line: 165, column: 5, scope: !79)
!98 = !DILocation(line: 167, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 66, type: !16)
!101 = !DILocation(line: 66, column: 9, scope: !99)
!102 = !DILocalVariable(name: "dataPtr1", scope: !99, file: !12, line: 67, type: !19)
!103 = !DILocation(line: 67, column: 10, scope: !99)
!104 = !DILocalVariable(name: "dataPtr2", scope: !99, file: !12, line: 68, type: !19)
!105 = !DILocation(line: 68, column: 10, scope: !99)
!106 = !DILocation(line: 70, column: 10, scope: !99)
!107 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 72, type: !16)
!108 = distinct !DILexicalBlock(scope: !99, file: !12, line: 71, column: 5)
!109 = !DILocation(line: 72, column: 13, scope: !108)
!110 = !DILocation(line: 72, column: 21, scope: !108)
!111 = !DILocation(line: 72, column: 20, scope: !108)
!112 = !DILocation(line: 75, column: 14, scope: !108)
!113 = !DILocation(line: 76, column: 21, scope: !108)
!114 = !DILocation(line: 76, column: 10, scope: !108)
!115 = !DILocation(line: 76, column: 19, scope: !108)
!116 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 79, type: !16)
!117 = distinct !DILexicalBlock(scope: !99, file: !12, line: 78, column: 5)
!118 = !DILocation(line: 79, column: 13, scope: !117)
!119 = !DILocation(line: 79, column: 21, scope: !117)
!120 = !DILocation(line: 79, column: 20, scope: !117)
!121 = !DILocalVariable(name: "i", scope: !122, file: !12, line: 81, type: !16)
!122 = distinct !DILexicalBlock(scope: !117, file: !12, line: 80, column: 9)
!123 = !DILocation(line: 81, column: 17, scope: !122)
!124 = !DILocalVariable(name: "buffer", scope: !122, file: !12, line: 82, type: !42)
!125 = !DILocation(line: 82, column: 17, scope: !122)
!126 = !DILocation(line: 85, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !12, line: 85, column: 17)
!128 = !DILocation(line: 85, column: 22, scope: !127)
!129 = !DILocation(line: 85, column: 17, scope: !122)
!130 = !DILocation(line: 87, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !12, line: 86, column: 13)
!132 = !DILocation(line: 87, column: 17, scope: !131)
!133 = !DILocation(line: 87, column: 30, scope: !131)
!134 = !DILocation(line: 89, column: 23, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 89, column: 17)
!136 = !DILocation(line: 89, column: 21, scope: !135)
!137 = !DILocation(line: 89, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 89, column: 17)
!139 = !DILocation(line: 89, column: 30, scope: !138)
!140 = !DILocation(line: 89, column: 17, scope: !135)
!141 = !DILocation(line: 91, column: 41, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !12, line: 90, column: 17)
!143 = !DILocation(line: 91, column: 34, scope: !142)
!144 = !DILocation(line: 91, column: 21, scope: !142)
!145 = !DILocation(line: 92, column: 17, scope: !142)
!146 = !DILocation(line: 89, column: 37, scope: !138)
!147 = !DILocation(line: 89, column: 17, scope: !138)
!148 = distinct !{!148, !140, !149, !70}
!149 = !DILocation(line: 92, column: 17, scope: !135)
!150 = !DILocation(line: 93, column: 13, scope: !131)
!151 = !DILocation(line: 96, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !127, file: !12, line: 95, column: 13)
!153 = !DILocation(line: 100, column: 1, scope: !99)
!154 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocalVariable(name: "data", scope: !154, file: !12, line: 105, type: !16)
!156 = !DILocation(line: 105, column: 9, scope: !154)
!157 = !DILocalVariable(name: "dataPtr1", scope: !154, file: !12, line: 106, type: !19)
!158 = !DILocation(line: 106, column: 10, scope: !154)
!159 = !DILocalVariable(name: "dataPtr2", scope: !154, file: !12, line: 107, type: !19)
!160 = !DILocation(line: 107, column: 10, scope: !154)
!161 = !DILocation(line: 109, column: 10, scope: !154)
!162 = !DILocalVariable(name: "data", scope: !163, file: !12, line: 111, type: !16)
!163 = distinct !DILexicalBlock(scope: !154, file: !12, line: 110, column: 5)
!164 = !DILocation(line: 111, column: 13, scope: !163)
!165 = !DILocation(line: 111, column: 21, scope: !163)
!166 = !DILocation(line: 111, column: 20, scope: !163)
!167 = !DILocation(line: 113, column: 14, scope: !163)
!168 = !DILocation(line: 114, column: 21, scope: !163)
!169 = !DILocation(line: 114, column: 10, scope: !163)
!170 = !DILocation(line: 114, column: 19, scope: !163)
!171 = !DILocalVariable(name: "data", scope: !172, file: !12, line: 117, type: !16)
!172 = distinct !DILexicalBlock(scope: !154, file: !12, line: 116, column: 5)
!173 = !DILocation(line: 117, column: 13, scope: !172)
!174 = !DILocation(line: 117, column: 21, scope: !172)
!175 = !DILocation(line: 117, column: 20, scope: !172)
!176 = !DILocalVariable(name: "i", scope: !177, file: !12, line: 119, type: !16)
!177 = distinct !DILexicalBlock(scope: !172, file: !12, line: 118, column: 9)
!178 = !DILocation(line: 119, column: 17, scope: !177)
!179 = !DILocalVariable(name: "buffer", scope: !177, file: !12, line: 120, type: !42)
!180 = !DILocation(line: 120, column: 17, scope: !177)
!181 = !DILocation(line: 122, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !12, line: 122, column: 17)
!183 = !DILocation(line: 122, column: 22, scope: !182)
!184 = !DILocation(line: 122, column: 27, scope: !182)
!185 = !DILocation(line: 122, column: 30, scope: !182)
!186 = !DILocation(line: 122, column: 35, scope: !182)
!187 = !DILocation(line: 122, column: 17, scope: !177)
!188 = !DILocation(line: 124, column: 24, scope: !189)
!189 = distinct !DILexicalBlock(scope: !182, file: !12, line: 123, column: 13)
!190 = !DILocation(line: 124, column: 17, scope: !189)
!191 = !DILocation(line: 124, column: 30, scope: !189)
!192 = !DILocation(line: 126, column: 23, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !12, line: 126, column: 17)
!194 = !DILocation(line: 126, column: 21, scope: !193)
!195 = !DILocation(line: 126, column: 28, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !12, line: 126, column: 17)
!197 = !DILocation(line: 126, column: 30, scope: !196)
!198 = !DILocation(line: 126, column: 17, scope: !193)
!199 = !DILocation(line: 128, column: 41, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !12, line: 127, column: 17)
!201 = !DILocation(line: 128, column: 34, scope: !200)
!202 = !DILocation(line: 128, column: 21, scope: !200)
!203 = !DILocation(line: 129, column: 17, scope: !200)
!204 = !DILocation(line: 126, column: 37, scope: !196)
!205 = !DILocation(line: 126, column: 17, scope: !196)
!206 = distinct !{!206, !198, !207, !70}
!207 = !DILocation(line: 129, column: 17, scope: !193)
!208 = !DILocation(line: 130, column: 13, scope: !189)
!209 = !DILocation(line: 133, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !182, file: !12, line: 132, column: 13)
!211 = !DILocation(line: 137, column: 1, scope: !154)
