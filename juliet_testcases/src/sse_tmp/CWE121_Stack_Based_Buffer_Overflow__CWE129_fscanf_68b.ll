; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68_badData = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68_goodG2BData = external dso_local global i32, align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68_goodB2GData = external dso_local global i32, align 4
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !13, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68_badData, align 4, !dbg !16
  store i32 %0, i32* %data, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !20, metadata !DIExpression()), !dbg !24
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !24
  %2 = load i32, i32* %data, align 4, !dbg !25
  %cmp = icmp sge i32 %2, 0, !dbg !27
  br i1 %cmp, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !29
  %idxprom = sext i32 %3 to i64, !dbg !31
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !31
  store i32 1, i32* %arrayidx, align 4, !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !36
  %cmp1 = icmp slt i32 %4, 10, !dbg !38
  br i1 %cmp1, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !40
  %idxprom2 = sext i32 %5 to i64, !dbg !42
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !42
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !42
  call void @printIntLine(i32 %6), !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %7, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !50

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !51
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b_goodG2BSink() #0 !dbg !54 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68_goodG2BData, align 4, !dbg !57
  store i32 %0, i32* %data, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %i, metadata !58, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !61, metadata !DIExpression()), !dbg !62
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !62
  %2 = load i32, i32* %data, align 4, !dbg !63
  %cmp = icmp sge i32 %2, 0, !dbg !65
  br i1 %cmp, label %if.then, label %if.else, !dbg !66

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !67
  %idxprom = sext i32 %3 to i64, !dbg !69
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !69
  store i32 1, i32* %arrayidx, align 4, !dbg !70
  store i32 0, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !74
  %cmp1 = icmp slt i32 %4, 10, !dbg !76
  br i1 %cmp1, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !78
  %idxprom2 = sext i32 %5 to i64, !dbg !80
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !80
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !80
  call void @printIntLine(i32 %6), !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !83
  %inc = add nsw i32 %7, 1, !dbg !83
  store i32 %inc, i32* %i, align 4, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b_goodB2GSink() #0 !dbg !91 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68_goodB2GData, align 4, !dbg !94
  store i32 %0, i32* %data, align 4, !dbg !93
  call void @llvm.dbg.declare(metadata i32* %i, metadata !95, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !98, metadata !DIExpression()), !dbg !99
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !99
  %2 = load i32, i32* %data, align 4, !dbg !100
  %cmp = icmp sge i32 %2, 0, !dbg !102
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !103

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !104
  %cmp1 = icmp slt i32 %3, 10, !dbg !105
  br i1 %cmp1, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !107
  %idxprom = sext i32 %4 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !109
  store i32 1, i32* %arrayidx, align 4, !dbg !110
  store i32 0, i32* %i, align 4, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !114
  %cmp2 = icmp slt i32 %5, 10, !dbg !116
  br i1 %cmp2, label %for.body, label %for.end, !dbg !117

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !118
  %idxprom3 = sext i32 %6 to i64, !dbg !120
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !120
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !120
  call void @printIntLine(i32 %7), !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !123
  %inc = add nsw i32 %8, 1, !dbg !123
  store i32 %inc, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !127

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !128
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocation(line: 28, column: 9, scope: !9)
!16 = !DILocation(line: 28, column: 16, scope: !9)
!17 = !DILocalVariable(name: "i", scope: !18, file: !10, line: 30, type: !14)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!19 = !DILocation(line: 30, column: 13, scope: !18)
!20 = !DILocalVariable(name: "buffer", scope: !18, file: !10, line: 31, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 10)
!24 = !DILocation(line: 31, column: 13, scope: !18)
!25 = !DILocation(line: 34, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !10, line: 34, column: 13)
!27 = !DILocation(line: 34, column: 18, scope: !26)
!28 = !DILocation(line: 34, column: 13, scope: !18)
!29 = !DILocation(line: 36, column: 20, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !10, line: 35, column: 9)
!31 = !DILocation(line: 36, column: 13, scope: !30)
!32 = !DILocation(line: 36, column: 26, scope: !30)
!33 = !DILocation(line: 38, column: 19, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 38, column: 13)
!35 = !DILocation(line: 38, column: 17, scope: !34)
!36 = !DILocation(line: 38, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 38, column: 13)
!38 = !DILocation(line: 38, column: 26, scope: !37)
!39 = !DILocation(line: 38, column: 13, scope: !34)
!40 = !DILocation(line: 40, column: 37, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 39, column: 13)
!42 = !DILocation(line: 40, column: 30, scope: !41)
!43 = !DILocation(line: 40, column: 17, scope: !41)
!44 = !DILocation(line: 41, column: 13, scope: !41)
!45 = !DILocation(line: 38, column: 33, scope: !37)
!46 = !DILocation(line: 38, column: 13, scope: !37)
!47 = distinct !{!47, !39, !48, !49}
!48 = !DILocation(line: 41, column: 13, scope: !34)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 42, column: 9, scope: !30)
!51 = !DILocation(line: 45, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !26, file: !10, line: 44, column: 9)
!53 = !DILocation(line: 48, column: 1, scope: !9)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b_goodG2BSink", scope: !10, file: !10, line: 55, type: !11, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", scope: !54, file: !10, line: 57, type: !14)
!56 = !DILocation(line: 57, column: 9, scope: !54)
!57 = !DILocation(line: 57, column: 16, scope: !54)
!58 = !DILocalVariable(name: "i", scope: !59, file: !10, line: 59, type: !14)
!59 = distinct !DILexicalBlock(scope: !54, file: !10, line: 58, column: 5)
!60 = !DILocation(line: 59, column: 13, scope: !59)
!61 = !DILocalVariable(name: "buffer", scope: !59, file: !10, line: 60, type: !21)
!62 = !DILocation(line: 60, column: 13, scope: !59)
!63 = !DILocation(line: 63, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !10, line: 63, column: 13)
!65 = !DILocation(line: 63, column: 18, scope: !64)
!66 = !DILocation(line: 63, column: 13, scope: !59)
!67 = !DILocation(line: 65, column: 20, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !10, line: 64, column: 9)
!69 = !DILocation(line: 65, column: 13, scope: !68)
!70 = !DILocation(line: 65, column: 26, scope: !68)
!71 = !DILocation(line: 67, column: 19, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !10, line: 67, column: 13)
!73 = !DILocation(line: 67, column: 17, scope: !72)
!74 = !DILocation(line: 67, column: 24, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 67, column: 13)
!76 = !DILocation(line: 67, column: 26, scope: !75)
!77 = !DILocation(line: 67, column: 13, scope: !72)
!78 = !DILocation(line: 69, column: 37, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 68, column: 13)
!80 = !DILocation(line: 69, column: 30, scope: !79)
!81 = !DILocation(line: 69, column: 17, scope: !79)
!82 = !DILocation(line: 70, column: 13, scope: !79)
!83 = !DILocation(line: 67, column: 33, scope: !75)
!84 = !DILocation(line: 67, column: 13, scope: !75)
!85 = distinct !{!85, !77, !86, !49}
!86 = !DILocation(line: 70, column: 13, scope: !72)
!87 = !DILocation(line: 71, column: 9, scope: !68)
!88 = !DILocation(line: 74, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !64, file: !10, line: 73, column: 9)
!90 = !DILocation(line: 77, column: 1, scope: !54)
!91 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_68b_goodB2GSink", scope: !10, file: !10, line: 80, type: !11, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !10, line: 82, type: !14)
!93 = !DILocation(line: 82, column: 9, scope: !91)
!94 = !DILocation(line: 82, column: 16, scope: !91)
!95 = !DILocalVariable(name: "i", scope: !96, file: !10, line: 84, type: !14)
!96 = distinct !DILexicalBlock(scope: !91, file: !10, line: 83, column: 5)
!97 = !DILocation(line: 84, column: 13, scope: !96)
!98 = !DILocalVariable(name: "buffer", scope: !96, file: !10, line: 85, type: !21)
!99 = !DILocation(line: 85, column: 13, scope: !96)
!100 = !DILocation(line: 87, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !10, line: 87, column: 13)
!102 = !DILocation(line: 87, column: 18, scope: !101)
!103 = !DILocation(line: 87, column: 23, scope: !101)
!104 = !DILocation(line: 87, column: 26, scope: !101)
!105 = !DILocation(line: 87, column: 31, scope: !101)
!106 = !DILocation(line: 87, column: 13, scope: !96)
!107 = !DILocation(line: 89, column: 20, scope: !108)
!108 = distinct !DILexicalBlock(scope: !101, file: !10, line: 88, column: 9)
!109 = !DILocation(line: 89, column: 13, scope: !108)
!110 = !DILocation(line: 89, column: 26, scope: !108)
!111 = !DILocation(line: 91, column: 19, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !10, line: 91, column: 13)
!113 = !DILocation(line: 91, column: 17, scope: !112)
!114 = !DILocation(line: 91, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !10, line: 91, column: 13)
!116 = !DILocation(line: 91, column: 26, scope: !115)
!117 = !DILocation(line: 91, column: 13, scope: !112)
!118 = !DILocation(line: 93, column: 37, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !10, line: 92, column: 13)
!120 = !DILocation(line: 93, column: 30, scope: !119)
!121 = !DILocation(line: 93, column: 17, scope: !119)
!122 = !DILocation(line: 94, column: 13, scope: !119)
!123 = !DILocation(line: 91, column: 33, scope: !115)
!124 = !DILocation(line: 91, column: 13, scope: !115)
!125 = distinct !{!125, !117, !126, !49}
!126 = !DILocation(line: 94, column: 13, scope: !112)
!127 = !DILocation(line: 95, column: 9, scope: !108)
!128 = !DILocation(line: 98, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !101, file: !10, line: 97, column: 9)
!130 = !DILocation(line: 101, column: 1, scope: !91)
