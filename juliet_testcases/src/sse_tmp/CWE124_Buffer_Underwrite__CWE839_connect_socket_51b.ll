; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_51b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_51b_badSink(i32 %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !19, metadata !DIExpression()), !dbg !23
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !23
  %1 = load i32, i32* %data.addr, align 4, !dbg !24
  %cmp = icmp slt i32 %1, 10, !dbg !26
  br i1 %cmp, label %if.then, label %if.else, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !28
  %idxprom = sext i32 %2 to i64, !dbg !30
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !30
  store i32 1, i32* %arrayidx, align 4, !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !35
  %cmp1 = icmp slt i32 %3, 10, !dbg !37
  br i1 %cmp1, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !39
  %idxprom2 = sext i32 %4 to i64, !dbg !41
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !41
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !41
  call void @printIntLine(i32 %5), !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %6, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !49

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !50
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_51b_goodG2BSink(i32 %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %i, metadata !56, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !60
  %1 = load i32, i32* %data.addr, align 4, !dbg !61
  %cmp = icmp slt i32 %1, 10, !dbg !63
  br i1 %cmp, label %if.then, label %if.else, !dbg !64

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !65
  %idxprom = sext i32 %2 to i64, !dbg !67
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !67
  store i32 1, i32* %arrayidx, align 4, !dbg !68
  store i32 0, i32* %i, align 4, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !72
  %cmp1 = icmp slt i32 %3, 10, !dbg !74
  br i1 %cmp1, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !76
  %idxprom2 = sext i32 %4 to i64, !dbg !78
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !78
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !78
  call void @printIntLine(i32 %5), !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !81
  %inc = add nsw i32 %6, 1, !dbg !81
  store i32 %inc, i32* %i, align 4, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !86
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_51b_goodB2GSink(i32 %data) #0 !dbg !89 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32* %i, metadata !92, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !96
  %1 = load i32, i32* %data.addr, align 4, !dbg !97
  %cmp = icmp sge i32 %1, 0, !dbg !99
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !100

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !101
  %cmp1 = icmp slt i32 %2, 10, !dbg !102
  br i1 %cmp1, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !104
  %idxprom = sext i32 %3 to i64, !dbg !106
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !106
  store i32 1, i32* %arrayidx, align 4, !dbg !107
  store i32 0, i32* %i, align 4, !dbg !108
  br label %for.cond, !dbg !110

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !111
  %cmp2 = icmp slt i32 %4, 10, !dbg !113
  br i1 %cmp2, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !115
  %idxprom3 = sext i32 %5 to i64, !dbg !117
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !117
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !117
  call void @printIntLine(i32 %6), !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !120
  %inc = add nsw i32 %7, 1, !dbg !120
  store i32 %inc, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !124

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_51b_badSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 44, type: !13)
!15 = !DILocation(line: 44, column: 70, scope: !9)
!16 = !DILocalVariable(name: "i", scope: !17, file: !10, line: 47, type: !13)
!17 = distinct !DILexicalBlock(scope: !9, file: !10, line: 46, column: 5)
!18 = !DILocation(line: 47, column: 13, scope: !17)
!19 = !DILocalVariable(name: "buffer", scope: !17, file: !10, line: 48, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 48, column: 13, scope: !17)
!24 = !DILocation(line: 51, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !17, file: !10, line: 51, column: 13)
!26 = !DILocation(line: 51, column: 18, scope: !25)
!27 = !DILocation(line: 51, column: 13, scope: !17)
!28 = !DILocation(line: 53, column: 20, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !10, line: 52, column: 9)
!30 = !DILocation(line: 53, column: 13, scope: !29)
!31 = !DILocation(line: 53, column: 26, scope: !29)
!32 = !DILocation(line: 55, column: 19, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 55, column: 13)
!34 = !DILocation(line: 55, column: 17, scope: !33)
!35 = !DILocation(line: 55, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !10, line: 55, column: 13)
!37 = !DILocation(line: 55, column: 26, scope: !36)
!38 = !DILocation(line: 55, column: 13, scope: !33)
!39 = !DILocation(line: 57, column: 37, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !10, line: 56, column: 13)
!41 = !DILocation(line: 57, column: 30, scope: !40)
!42 = !DILocation(line: 57, column: 17, scope: !40)
!43 = !DILocation(line: 58, column: 13, scope: !40)
!44 = !DILocation(line: 55, column: 33, scope: !36)
!45 = !DILocation(line: 55, column: 13, scope: !36)
!46 = distinct !{!46, !38, !47, !48}
!47 = !DILocation(line: 58, column: 13, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 59, column: 9, scope: !29)
!50 = !DILocation(line: 62, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !25, file: !10, line: 61, column: 9)
!52 = !DILocation(line: 65, column: 1, scope: !9)
!53 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_51b_goodG2BSink", scope: !10, file: !10, line: 72, type: !11, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !10, line: 72, type: !13)
!55 = !DILocation(line: 72, column: 74, scope: !53)
!56 = !DILocalVariable(name: "i", scope: !57, file: !10, line: 75, type: !13)
!57 = distinct !DILexicalBlock(scope: !53, file: !10, line: 74, column: 5)
!58 = !DILocation(line: 75, column: 13, scope: !57)
!59 = !DILocalVariable(name: "buffer", scope: !57, file: !10, line: 76, type: !20)
!60 = !DILocation(line: 76, column: 13, scope: !57)
!61 = !DILocation(line: 79, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !10, line: 79, column: 13)
!63 = !DILocation(line: 79, column: 18, scope: !62)
!64 = !DILocation(line: 79, column: 13, scope: !57)
!65 = !DILocation(line: 81, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !10, line: 80, column: 9)
!67 = !DILocation(line: 81, column: 13, scope: !66)
!68 = !DILocation(line: 81, column: 26, scope: !66)
!69 = !DILocation(line: 83, column: 19, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !10, line: 83, column: 13)
!71 = !DILocation(line: 83, column: 17, scope: !70)
!72 = !DILocation(line: 83, column: 24, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !10, line: 83, column: 13)
!74 = !DILocation(line: 83, column: 26, scope: !73)
!75 = !DILocation(line: 83, column: 13, scope: !70)
!76 = !DILocation(line: 85, column: 37, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !10, line: 84, column: 13)
!78 = !DILocation(line: 85, column: 30, scope: !77)
!79 = !DILocation(line: 85, column: 17, scope: !77)
!80 = !DILocation(line: 86, column: 13, scope: !77)
!81 = !DILocation(line: 83, column: 33, scope: !73)
!82 = !DILocation(line: 83, column: 13, scope: !73)
!83 = distinct !{!83, !75, !84, !48}
!84 = !DILocation(line: 86, column: 13, scope: !70)
!85 = !DILocation(line: 87, column: 9, scope: !66)
!86 = !DILocation(line: 90, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !62, file: !10, line: 89, column: 9)
!88 = !DILocation(line: 93, column: 1, scope: !53)
!89 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_51b_goodB2GSink", scope: !10, file: !10, line: 96, type: !11, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", arg: 1, scope: !89, file: !10, line: 96, type: !13)
!91 = !DILocation(line: 96, column: 74, scope: !89)
!92 = !DILocalVariable(name: "i", scope: !93, file: !10, line: 99, type: !13)
!93 = distinct !DILexicalBlock(scope: !89, file: !10, line: 98, column: 5)
!94 = !DILocation(line: 99, column: 13, scope: !93)
!95 = !DILocalVariable(name: "buffer", scope: !93, file: !10, line: 100, type: !20)
!96 = !DILocation(line: 100, column: 13, scope: !93)
!97 = !DILocation(line: 102, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !10, line: 102, column: 13)
!99 = !DILocation(line: 102, column: 18, scope: !98)
!100 = !DILocation(line: 102, column: 23, scope: !98)
!101 = !DILocation(line: 102, column: 26, scope: !98)
!102 = !DILocation(line: 102, column: 31, scope: !98)
!103 = !DILocation(line: 102, column: 13, scope: !93)
!104 = !DILocation(line: 104, column: 20, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !10, line: 103, column: 9)
!106 = !DILocation(line: 104, column: 13, scope: !105)
!107 = !DILocation(line: 104, column: 26, scope: !105)
!108 = !DILocation(line: 106, column: 19, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !10, line: 106, column: 13)
!110 = !DILocation(line: 106, column: 17, scope: !109)
!111 = !DILocation(line: 106, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !10, line: 106, column: 13)
!113 = !DILocation(line: 106, column: 26, scope: !112)
!114 = !DILocation(line: 106, column: 13, scope: !109)
!115 = !DILocation(line: 108, column: 37, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !10, line: 107, column: 13)
!117 = !DILocation(line: 108, column: 30, scope: !116)
!118 = !DILocation(line: 108, column: 17, scope: !116)
!119 = !DILocation(line: 109, column: 13, scope: !116)
!120 = !DILocation(line: 106, column: 33, scope: !112)
!121 = !DILocation(line: 106, column: 13, scope: !112)
!122 = distinct !{!122, !114, !123, !48}
!123 = !DILocation(line: 109, column: 13, scope: !109)
!124 = !DILocation(line: 110, column: 9, scope: !105)
!125 = !DILocation(line: 113, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !98, file: !10, line: 112, column: 9)
!127 = !DILocation(line: 116, column: 1, scope: !89)
