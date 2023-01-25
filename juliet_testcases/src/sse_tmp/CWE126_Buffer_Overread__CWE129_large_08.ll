; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 @staticReturnsTrue(), !dbg !19
  %tobool = icmp ne i32 %call, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !22
  br label %if.end, !dbg !24

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !25
  %tobool2 = icmp ne i32 %call1, 0, !dbg !25
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !27

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !28, metadata !DIExpression()), !dbg !34
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !34
  %1 = load i32, i32* %data, align 4, !dbg !35
  %cmp = icmp sge i32 %1, 0, !dbg !37
  br i1 %cmp, label %if.then4, label %if.else, !dbg !38

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !39
  %idxprom = sext i32 %2 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !41
  %3 = load i32, i32* %arrayidx, align 4, !dbg !41
  call void @printIntLine(i32 %3), !dbg !42
  br label %if.end5, !dbg !43

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !46

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_08_good() #0 !dbg !48 {
entry:
  call void @goodB2G1(), !dbg !49
  call void @goodB2G2(), !dbg !50
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE126_Buffer_Overread__CWE129_large_08_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__CWE129_large_08_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !78 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 -1, i32* %data, align 4, !dbg !81
  %call = call i32 @staticReturnsTrue(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !85
  br label %if.end, !dbg !87

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !88
  %tobool2 = icmp ne i32 %call1, 0, !dbg !88
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !90

if.then3:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !91
  br label %if.end8, !dbg !93

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !94, metadata !DIExpression()), !dbg !97
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !97
  %1 = load i32, i32* %data, align 4, !dbg !98
  %cmp = icmp sge i32 %1, 0, !dbg !100
  br i1 %cmp, label %land.lhs.true, label %if.else6, !dbg !101

land.lhs.true:                                    ; preds = %if.else
  %2 = load i32, i32* %data, align 4, !dbg !102
  %cmp4 = icmp slt i32 %2, 10, !dbg !103
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !104

if.then5:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !105
  %idxprom = sext i32 %3 to i64, !dbg !107
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !107
  %4 = load i32, i32* %arrayidx, align 4, !dbg !107
  call void @printIntLine(i32 %4), !dbg !108
  br label %if.end7, !dbg !109

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !110
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then3
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !113 {
entry:
  ret i32 0, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !115 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %data, align 4, !dbg !118
  %call = call i32 @staticReturnsTrue(), !dbg !119
  %tobool = icmp ne i32 %call, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !122
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !125
  %tobool2 = icmp ne i32 %call1, 0, !dbg !125
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !127

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !128, metadata !DIExpression()), !dbg !131
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !131
  %1 = load i32, i32* %data, align 4, !dbg !132
  %cmp = icmp sge i32 %1, 0, !dbg !134
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !135

land.lhs.true:                                    ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !136
  %cmp4 = icmp slt i32 %2, 10, !dbg !137
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !138

if.then5:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !139
  %idxprom = sext i32 %3 to i64, !dbg !141
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !141
  %4 = load i32, i32* %arrayidx, align 4, !dbg !141
  call void @printIntLine(i32 %4), !dbg !142
  br label %if.end6, !dbg !143

if.else:                                          ; preds = %land.lhs.true, %if.then3
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !144
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then5
  br label %if.end7, !dbg !146

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 -1, i32* %data, align 4, !dbg !151
  %call = call i32 @staticReturnsFalse(), !dbg !152
  %tobool = icmp ne i32 %call, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.else, !dbg !154

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !155
  br label %if.end, !dbg !157

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !158
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !160
  %tobool2 = icmp ne i32 %call1, 0, !dbg !160
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !162

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !163, metadata !DIExpression()), !dbg !166
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !166
  %1 = load i32, i32* %data, align 4, !dbg !167
  %cmp = icmp sge i32 %1, 0, !dbg !169
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !170

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !171
  %idxprom = sext i32 %2 to i64, !dbg !173
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !173
  %3 = load i32, i32* %arrayidx, align 4, !dbg !173
  call void @printIntLine(i32 %3), !dbg !174
  br label %if.end6, !dbg !175

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !176
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !178

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !180 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !181, metadata !DIExpression()), !dbg !182
  store i32 -1, i32* %data, align 4, !dbg !183
  %call = call i32 @staticReturnsTrue(), !dbg !184
  %tobool = icmp ne i32 %call, 0, !dbg !184
  br i1 %tobool, label %if.then, label %if.end, !dbg !186

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !187
  br label %if.end, !dbg !189

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !190
  %tobool2 = icmp ne i32 %call1, 0, !dbg !190
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !192

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !193, metadata !DIExpression()), !dbg !196
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !196
  %1 = load i32, i32* %data, align 4, !dbg !197
  %cmp = icmp sge i32 %1, 0, !dbg !199
  br i1 %cmp, label %if.then4, label %if.else, !dbg !200

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !201
  %idxprom = sext i32 %2 to i64, !dbg !203
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !203
  %3 = load i32, i32* %arrayidx, align 4, !dbg !203
  call void @printIntLine(i32 %3), !dbg !204
  br label %if.end5, !dbg !205

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !206
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !208

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !209
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 37, column: 9, scope: !11)
!18 = !DILocation(line: 39, column: 10, scope: !11)
!19 = !DILocation(line: 40, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!21 = !DILocation(line: 40, column: 8, scope: !11)
!22 = !DILocation(line: 43, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 5)
!24 = !DILocation(line: 44, column: 5, scope: !23)
!25 = !DILocation(line: 45, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 8)
!27 = !DILocation(line: 45, column: 8, scope: !11)
!28 = !DILocalVariable(name: "buffer", scope: !29, file: !12, line: 48, type: !31)
!29 = distinct !DILexicalBlock(scope: !30, file: !12, line: 47, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !12, line: 46, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 10)
!34 = !DILocation(line: 48, column: 17, scope: !29)
!35 = !DILocation(line: 51, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !29, file: !12, line: 51, column: 17)
!37 = !DILocation(line: 51, column: 22, scope: !36)
!38 = !DILocation(line: 51, column: 17, scope: !29)
!39 = !DILocation(line: 53, column: 37, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 52, column: 13)
!41 = !DILocation(line: 53, column: 30, scope: !40)
!42 = !DILocation(line: 53, column: 17, scope: !40)
!43 = !DILocation(line: 54, column: 13, scope: !40)
!44 = !DILocation(line: 57, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !36, file: !12, line: 56, column: 13)
!46 = !DILocation(line: 60, column: 5, scope: !30)
!47 = !DILocation(line: 61, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_08_good", scope: !12, file: !12, line: 193, type: !13, scopeLine: 194, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 195, column: 5, scope: !48)
!50 = !DILocation(line: 196, column: 5, scope: !48)
!51 = !DILocation(line: 197, column: 5, scope: !48)
!52 = !DILocation(line: 198, column: 5, scope: !48)
!53 = !DILocation(line: 199, column: 1, scope: !48)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 210, type: !55, scopeLine: 211, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!16, !16, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 210, type: !16)
!61 = !DILocation(line: 210, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 210, type: !57)
!63 = !DILocation(line: 210, column: 27, scope: !54)
!64 = !DILocation(line: 213, column: 22, scope: !54)
!65 = !DILocation(line: 213, column: 12, scope: !54)
!66 = !DILocation(line: 213, column: 5, scope: !54)
!67 = !DILocation(line: 215, column: 5, scope: !54)
!68 = !DILocation(line: 216, column: 5, scope: !54)
!69 = !DILocation(line: 217, column: 5, scope: !54)
!70 = !DILocation(line: 220, column: 5, scope: !54)
!71 = !DILocation(line: 221, column: 5, scope: !54)
!72 = !DILocation(line: 222, column: 5, scope: !54)
!73 = !DILocation(line: 224, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !75, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!16}
!77 = !DILocation(line: 25, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 70, type: !16)
!80 = !DILocation(line: 70, column: 9, scope: !78)
!81 = !DILocation(line: 72, column: 10, scope: !78)
!82 = !DILocation(line: 73, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !12, line: 73, column: 8)
!84 = !DILocation(line: 73, column: 8, scope: !78)
!85 = !DILocation(line: 76, column: 14, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !12, line: 74, column: 5)
!87 = !DILocation(line: 77, column: 5, scope: !86)
!88 = !DILocation(line: 78, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !78, file: !12, line: 78, column: 8)
!90 = !DILocation(line: 78, column: 8, scope: !78)
!91 = !DILocation(line: 81, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 79, column: 5)
!93 = !DILocation(line: 82, column: 5, scope: !92)
!94 = !DILocalVariable(name: "buffer", scope: !95, file: !12, line: 86, type: !31)
!95 = distinct !DILexicalBlock(scope: !96, file: !12, line: 85, column: 9)
!96 = distinct !DILexicalBlock(scope: !89, file: !12, line: 84, column: 5)
!97 = !DILocation(line: 86, column: 17, scope: !95)
!98 = !DILocation(line: 88, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 88, column: 17)
!100 = !DILocation(line: 88, column: 22, scope: !99)
!101 = !DILocation(line: 88, column: 27, scope: !99)
!102 = !DILocation(line: 88, column: 30, scope: !99)
!103 = !DILocation(line: 88, column: 35, scope: !99)
!104 = !DILocation(line: 88, column: 17, scope: !95)
!105 = !DILocation(line: 90, column: 37, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !12, line: 89, column: 13)
!107 = !DILocation(line: 90, column: 30, scope: !106)
!108 = !DILocation(line: 90, column: 17, scope: !106)
!109 = !DILocation(line: 91, column: 13, scope: !106)
!110 = !DILocation(line: 94, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !12, line: 93, column: 13)
!112 = !DILocation(line: 98, column: 1, scope: !78)
!113 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !75, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocation(line: 30, column: 5, scope: !113)
!115 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !12, line: 103, type: !16)
!117 = !DILocation(line: 103, column: 9, scope: !115)
!118 = !DILocation(line: 105, column: 10, scope: !115)
!119 = !DILocation(line: 106, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !12, line: 106, column: 8)
!121 = !DILocation(line: 106, column: 8, scope: !115)
!122 = !DILocation(line: 109, column: 14, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 107, column: 5)
!124 = !DILocation(line: 110, column: 5, scope: !123)
!125 = !DILocation(line: 111, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !115, file: !12, line: 111, column: 8)
!127 = !DILocation(line: 111, column: 8, scope: !115)
!128 = !DILocalVariable(name: "buffer", scope: !129, file: !12, line: 114, type: !31)
!129 = distinct !DILexicalBlock(scope: !130, file: !12, line: 113, column: 9)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 112, column: 5)
!131 = !DILocation(line: 114, column: 17, scope: !129)
!132 = !DILocation(line: 116, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 116, column: 17)
!134 = !DILocation(line: 116, column: 22, scope: !133)
!135 = !DILocation(line: 116, column: 27, scope: !133)
!136 = !DILocation(line: 116, column: 30, scope: !133)
!137 = !DILocation(line: 116, column: 35, scope: !133)
!138 = !DILocation(line: 116, column: 17, scope: !129)
!139 = !DILocation(line: 118, column: 37, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !12, line: 117, column: 13)
!141 = !DILocation(line: 118, column: 30, scope: !140)
!142 = !DILocation(line: 118, column: 17, scope: !140)
!143 = !DILocation(line: 119, column: 13, scope: !140)
!144 = !DILocation(line: 122, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !133, file: !12, line: 121, column: 13)
!146 = !DILocation(line: 125, column: 5, scope: !130)
!147 = !DILocation(line: 126, column: 1, scope: !115)
!148 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 129, type: !13, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", scope: !148, file: !12, line: 131, type: !16)
!150 = !DILocation(line: 131, column: 9, scope: !148)
!151 = !DILocation(line: 133, column: 10, scope: !148)
!152 = !DILocation(line: 134, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !12, line: 134, column: 8)
!154 = !DILocation(line: 134, column: 8, scope: !148)
!155 = !DILocation(line: 137, column: 9, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !12, line: 135, column: 5)
!157 = !DILocation(line: 138, column: 5, scope: !156)
!158 = !DILocation(line: 143, column: 14, scope: !159)
!159 = distinct !DILexicalBlock(scope: !153, file: !12, line: 140, column: 5)
!160 = !DILocation(line: 145, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !148, file: !12, line: 145, column: 8)
!162 = !DILocation(line: 145, column: 8, scope: !148)
!163 = !DILocalVariable(name: "buffer", scope: !164, file: !12, line: 148, type: !31)
!164 = distinct !DILexicalBlock(scope: !165, file: !12, line: 147, column: 9)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 146, column: 5)
!166 = !DILocation(line: 148, column: 17, scope: !164)
!167 = !DILocation(line: 151, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !12, line: 151, column: 17)
!169 = !DILocation(line: 151, column: 22, scope: !168)
!170 = !DILocation(line: 151, column: 17, scope: !164)
!171 = !DILocation(line: 153, column: 37, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !12, line: 152, column: 13)
!173 = !DILocation(line: 153, column: 30, scope: !172)
!174 = !DILocation(line: 153, column: 17, scope: !172)
!175 = !DILocation(line: 154, column: 13, scope: !172)
!176 = !DILocation(line: 157, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !168, file: !12, line: 156, column: 13)
!178 = !DILocation(line: 160, column: 5, scope: !165)
!179 = !DILocation(line: 161, column: 1, scope: !148)
!180 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 164, type: !13, scopeLine: 165, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!181 = !DILocalVariable(name: "data", scope: !180, file: !12, line: 166, type: !16)
!182 = !DILocation(line: 166, column: 9, scope: !180)
!183 = !DILocation(line: 168, column: 10, scope: !180)
!184 = !DILocation(line: 169, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !12, line: 169, column: 8)
!186 = !DILocation(line: 169, column: 8, scope: !180)
!187 = !DILocation(line: 173, column: 14, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !12, line: 170, column: 5)
!189 = !DILocation(line: 174, column: 5, scope: !188)
!190 = !DILocation(line: 175, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !180, file: !12, line: 175, column: 8)
!192 = !DILocation(line: 175, column: 8, scope: !180)
!193 = !DILocalVariable(name: "buffer", scope: !194, file: !12, line: 178, type: !31)
!194 = distinct !DILexicalBlock(scope: !195, file: !12, line: 177, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !12, line: 176, column: 5)
!196 = !DILocation(line: 178, column: 17, scope: !194)
!197 = !DILocation(line: 181, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !12, line: 181, column: 17)
!199 = !DILocation(line: 181, column: 22, scope: !198)
!200 = !DILocation(line: 181, column: 17, scope: !194)
!201 = !DILocation(line: 183, column: 37, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !12, line: 182, column: 13)
!203 = !DILocation(line: 183, column: 30, scope: !202)
!204 = !DILocation(line: 183, column: 17, scope: !202)
!205 = !DILocation(line: 184, column: 13, scope: !202)
!206 = !DILocation(line: 187, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !198, file: !12, line: 186, column: 13)
!208 = !DILocation(line: 190, column: 5, scope: !195)
!209 = !DILocation(line: 191, column: 1, scope: !180)
