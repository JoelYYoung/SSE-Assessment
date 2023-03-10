; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_10.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load i32, i32* @globalTrue, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !22
  br label %if.end, !dbg !24

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !25
  %tobool1 = icmp ne i32 %1, 0, !dbg !25
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !27

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !28, metadata !DIExpression()), !dbg !34
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !34
  %3 = load i32, i32* %data, align 4, !dbg !35
  %cmp = icmp slt i32 %3, 10, !dbg !37
  br i1 %cmp, label %if.then3, label %if.else, !dbg !38

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !39
  %idxprom = sext i32 %4 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !41
  %5 = load i32, i32* %arrayidx, align 4, !dbg !41
  call void @printIntLine(i32 %5), !dbg !42
  br label %if.end4, !dbg !43

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !46

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_10_good() #0 !dbg !48 {
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
  call void @CWE127_Buffer_Underread__CWE839_negative_10_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__CWE839_negative_10_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 -1, i32* %data, align 4, !dbg !77
  %0 = load i32, i32* @globalTrue, align 4, !dbg !78
  %tobool = icmp ne i32 %0, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !81
  br label %if.end, !dbg !83

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFalse, align 4, !dbg !84
  %tobool1 = icmp ne i32 %1, 0, !dbg !84
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !86

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !87
  br label %if.end7, !dbg !89

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !90, metadata !DIExpression()), !dbg !93
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !93
  %3 = load i32, i32* %data, align 4, !dbg !94
  %cmp = icmp sge i32 %3, 0, !dbg !96
  br i1 %cmp, label %land.lhs.true, label %if.else5, !dbg !97

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !98
  %cmp3 = icmp slt i32 %4, 10, !dbg !99
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !100

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !101
  %idxprom = sext i32 %5 to i64, !dbg !103
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !103
  %6 = load i32, i32* %arrayidx, align 4, !dbg !103
  call void @printIntLine(i32 %6), !dbg !104
  br label %if.end6, !dbg !105

if.else5:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !106
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.then2
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !109 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %data, align 4, !dbg !112
  %0 = load i32, i32* @globalTrue, align 4, !dbg !113
  %tobool = icmp ne i32 %0, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  store i32 -5, i32* %data, align 4, !dbg !116
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !119
  %tobool1 = icmp ne i32 %1, 0, !dbg !119
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !121

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !122, metadata !DIExpression()), !dbg !125
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !125
  %3 = load i32, i32* %data, align 4, !dbg !126
  %cmp = icmp sge i32 %3, 0, !dbg !128
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !129

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !130
  %cmp3 = icmp slt i32 %4, 10, !dbg !131
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !132

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !133
  %idxprom = sext i32 %5 to i64, !dbg !135
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !135
  %6 = load i32, i32* %arrayidx, align 4, !dbg !135
  call void @printIntLine(i32 %6), !dbg !136
  br label %if.end5, !dbg !137

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !138
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !140

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !142 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !143, metadata !DIExpression()), !dbg !144
  store i32 -1, i32* %data, align 4, !dbg !145
  %0 = load i32, i32* @globalFalse, align 4, !dbg !146
  %tobool = icmp ne i32 %0, 0, !dbg !146
  br i1 %tobool, label %if.then, label %if.else, !dbg !148

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !149
  br label %if.end, !dbg !151

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !152
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalTrue, align 4, !dbg !154
  %tobool1 = icmp ne i32 %1, 0, !dbg !154
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !156

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !157, metadata !DIExpression()), !dbg !160
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !160
  %3 = load i32, i32* %data, align 4, !dbg !161
  %cmp = icmp slt i32 %3, 10, !dbg !163
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !164

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !165
  %idxprom = sext i32 %4 to i64, !dbg !167
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !167
  %5 = load i32, i32* %arrayidx, align 4, !dbg !167
  call void @printIntLine(i32 %5), !dbg !168
  br label %if.end5, !dbg !169

if.else4:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !170
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6, !dbg !172

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !173
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !174 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !175, metadata !DIExpression()), !dbg !176
  store i32 -1, i32* %data, align 4, !dbg !177
  %0 = load i32, i32* @globalTrue, align 4, !dbg !178
  %tobool = icmp ne i32 %0, 0, !dbg !178
  br i1 %tobool, label %if.then, label %if.end, !dbg !180

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !181
  br label %if.end, !dbg !183

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !184
  %tobool1 = icmp ne i32 %1, 0, !dbg !184
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !186

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !187, metadata !DIExpression()), !dbg !190
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !190
  %3 = load i32, i32* %data, align 4, !dbg !191
  %cmp = icmp slt i32 %3, 10, !dbg !193
  br i1 %cmp, label %if.then3, label %if.else, !dbg !194

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !195
  %idxprom = sext i32 %4 to i64, !dbg !197
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !197
  %5 = load i32, i32* %arrayidx, align 4, !dbg !197
  call void @printIntLine(i32 %5), !dbg !198
  br label %if.end4, !dbg !199

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !200
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !202

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !203
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_10_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_10.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!21 = !DILocation(line: 27, column: 8, scope: !11)
!22 = !DILocation(line: 30, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !12, line: 28, column: 5)
!24 = !DILocation(line: 31, column: 5, scope: !23)
!25 = !DILocation(line: 32, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!27 = !DILocation(line: 32, column: 8, scope: !11)
!28 = !DILocalVariable(name: "buffer", scope: !29, file: !12, line: 35, type: !31)
!29 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !12, line: 33, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 10)
!34 = !DILocation(line: 35, column: 17, scope: !29)
!35 = !DILocation(line: 38, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !29, file: !12, line: 38, column: 17)
!37 = !DILocation(line: 38, column: 22, scope: !36)
!38 = !DILocation(line: 38, column: 17, scope: !29)
!39 = !DILocation(line: 40, column: 37, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 39, column: 13)
!41 = !DILocation(line: 40, column: 30, scope: !40)
!42 = !DILocation(line: 40, column: 17, scope: !40)
!43 = !DILocation(line: 41, column: 13, scope: !40)
!44 = !DILocation(line: 44, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !36, file: !12, line: 43, column: 13)
!46 = !DILocation(line: 47, column: 5, scope: !30)
!47 = !DILocation(line: 48, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_10_good", scope: !12, file: !12, line: 180, type: !13, scopeLine: 181, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 182, column: 5, scope: !48)
!50 = !DILocation(line: 183, column: 5, scope: !48)
!51 = !DILocation(line: 184, column: 5, scope: !48)
!52 = !DILocation(line: 185, column: 5, scope: !48)
!53 = !DILocation(line: 186, column: 1, scope: !48)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 197, type: !55, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!16, !16, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 197, type: !16)
!61 = !DILocation(line: 197, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 197, type: !57)
!63 = !DILocation(line: 197, column: 27, scope: !54)
!64 = !DILocation(line: 200, column: 22, scope: !54)
!65 = !DILocation(line: 200, column: 12, scope: !54)
!66 = !DILocation(line: 200, column: 5, scope: !54)
!67 = !DILocation(line: 202, column: 5, scope: !54)
!68 = !DILocation(line: 203, column: 5, scope: !54)
!69 = !DILocation(line: 204, column: 5, scope: !54)
!70 = !DILocation(line: 207, column: 5, scope: !54)
!71 = !DILocation(line: 208, column: 5, scope: !54)
!72 = !DILocation(line: 209, column: 5, scope: !54)
!73 = !DILocation(line: 211, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 57, type: !16)
!76 = !DILocation(line: 57, column: 9, scope: !74)
!77 = !DILocation(line: 59, column: 10, scope: !74)
!78 = !DILocation(line: 60, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !12, line: 60, column: 8)
!80 = !DILocation(line: 60, column: 8, scope: !74)
!81 = !DILocation(line: 63, column: 14, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !12, line: 61, column: 5)
!83 = !DILocation(line: 64, column: 5, scope: !82)
!84 = !DILocation(line: 65, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !74, file: !12, line: 65, column: 8)
!86 = !DILocation(line: 65, column: 8, scope: !74)
!87 = !DILocation(line: 68, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 66, column: 5)
!89 = !DILocation(line: 69, column: 5, scope: !88)
!90 = !DILocalVariable(name: "buffer", scope: !91, file: !12, line: 73, type: !31)
!91 = distinct !DILexicalBlock(scope: !92, file: !12, line: 72, column: 9)
!92 = distinct !DILexicalBlock(scope: !85, file: !12, line: 71, column: 5)
!93 = !DILocation(line: 73, column: 17, scope: !91)
!94 = !DILocation(line: 75, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 75, column: 17)
!96 = !DILocation(line: 75, column: 22, scope: !95)
!97 = !DILocation(line: 75, column: 27, scope: !95)
!98 = !DILocation(line: 75, column: 30, scope: !95)
!99 = !DILocation(line: 75, column: 35, scope: !95)
!100 = !DILocation(line: 75, column: 17, scope: !91)
!101 = !DILocation(line: 77, column: 37, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !12, line: 76, column: 13)
!103 = !DILocation(line: 77, column: 30, scope: !102)
!104 = !DILocation(line: 77, column: 17, scope: !102)
!105 = !DILocation(line: 78, column: 13, scope: !102)
!106 = !DILocation(line: 81, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !95, file: !12, line: 80, column: 13)
!108 = !DILocation(line: 85, column: 1, scope: !74)
!109 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 90, type: !16)
!111 = !DILocation(line: 90, column: 9, scope: !109)
!112 = !DILocation(line: 92, column: 10, scope: !109)
!113 = !DILocation(line: 93, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !12, line: 93, column: 8)
!115 = !DILocation(line: 93, column: 8, scope: !109)
!116 = !DILocation(line: 96, column: 14, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 94, column: 5)
!118 = !DILocation(line: 97, column: 5, scope: !117)
!119 = !DILocation(line: 98, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !109, file: !12, line: 98, column: 8)
!121 = !DILocation(line: 98, column: 8, scope: !109)
!122 = !DILocalVariable(name: "buffer", scope: !123, file: !12, line: 101, type: !31)
!123 = distinct !DILexicalBlock(scope: !124, file: !12, line: 100, column: 9)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 99, column: 5)
!125 = !DILocation(line: 101, column: 17, scope: !123)
!126 = !DILocation(line: 103, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 103, column: 17)
!128 = !DILocation(line: 103, column: 22, scope: !127)
!129 = !DILocation(line: 103, column: 27, scope: !127)
!130 = !DILocation(line: 103, column: 30, scope: !127)
!131 = !DILocation(line: 103, column: 35, scope: !127)
!132 = !DILocation(line: 103, column: 17, scope: !123)
!133 = !DILocation(line: 105, column: 37, scope: !134)
!134 = distinct !DILexicalBlock(scope: !127, file: !12, line: 104, column: 13)
!135 = !DILocation(line: 105, column: 30, scope: !134)
!136 = !DILocation(line: 105, column: 17, scope: !134)
!137 = !DILocation(line: 106, column: 13, scope: !134)
!138 = !DILocation(line: 109, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !127, file: !12, line: 108, column: 13)
!140 = !DILocation(line: 112, column: 5, scope: !124)
!141 = !DILocation(line: 113, column: 1, scope: !109)
!142 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !12, line: 118, type: !16)
!144 = !DILocation(line: 118, column: 9, scope: !142)
!145 = !DILocation(line: 120, column: 10, scope: !142)
!146 = !DILocation(line: 121, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !12, line: 121, column: 8)
!148 = !DILocation(line: 121, column: 8, scope: !142)
!149 = !DILocation(line: 124, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 122, column: 5)
!151 = !DILocation(line: 125, column: 5, scope: !150)
!152 = !DILocation(line: 130, column: 14, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !12, line: 127, column: 5)
!154 = !DILocation(line: 132, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !142, file: !12, line: 132, column: 8)
!156 = !DILocation(line: 132, column: 8, scope: !142)
!157 = !DILocalVariable(name: "buffer", scope: !158, file: !12, line: 135, type: !31)
!158 = distinct !DILexicalBlock(scope: !159, file: !12, line: 134, column: 9)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 133, column: 5)
!160 = !DILocation(line: 135, column: 17, scope: !158)
!161 = !DILocation(line: 138, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 138, column: 17)
!163 = !DILocation(line: 138, column: 22, scope: !162)
!164 = !DILocation(line: 138, column: 17, scope: !158)
!165 = !DILocation(line: 140, column: 37, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 139, column: 13)
!167 = !DILocation(line: 140, column: 30, scope: !166)
!168 = !DILocation(line: 140, column: 17, scope: !166)
!169 = !DILocation(line: 141, column: 13, scope: !166)
!170 = !DILocation(line: 144, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !162, file: !12, line: 143, column: 13)
!172 = !DILocation(line: 147, column: 5, scope: !159)
!173 = !DILocation(line: 148, column: 1, scope: !142)
!174 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 151, type: !13, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!175 = !DILocalVariable(name: "data", scope: !174, file: !12, line: 153, type: !16)
!176 = !DILocation(line: 153, column: 9, scope: !174)
!177 = !DILocation(line: 155, column: 10, scope: !174)
!178 = !DILocation(line: 156, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !174, file: !12, line: 156, column: 8)
!180 = !DILocation(line: 156, column: 8, scope: !174)
!181 = !DILocation(line: 160, column: 14, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !12, line: 157, column: 5)
!183 = !DILocation(line: 161, column: 5, scope: !182)
!184 = !DILocation(line: 162, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !174, file: !12, line: 162, column: 8)
!186 = !DILocation(line: 162, column: 8, scope: !174)
!187 = !DILocalVariable(name: "buffer", scope: !188, file: !12, line: 165, type: !31)
!188 = distinct !DILexicalBlock(scope: !189, file: !12, line: 164, column: 9)
!189 = distinct !DILexicalBlock(scope: !185, file: !12, line: 163, column: 5)
!190 = !DILocation(line: 165, column: 17, scope: !188)
!191 = !DILocation(line: 168, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !12, line: 168, column: 17)
!193 = !DILocation(line: 168, column: 22, scope: !192)
!194 = !DILocation(line: 168, column: 17, scope: !188)
!195 = !DILocation(line: 170, column: 37, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !12, line: 169, column: 13)
!197 = !DILocation(line: 170, column: 30, scope: !196)
!198 = !DILocation(line: 170, column: 17, scope: !196)
!199 = !DILocation(line: 171, column: 13, scope: !196)
!200 = !DILocation(line: 174, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !192, file: !12, line: 173, column: 13)
!202 = !DILocation(line: 177, column: 5, scope: !189)
!203 = !DILocation(line: 178, column: 1, scope: !174)
