; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_63b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_63b_badSink(i32* %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32* %dataPtr, i32** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataPtr.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** %dataPtr.addr, align 8, !dbg !19
  %1 = load i32, i32* %0, align 4, !dbg !20
  store i32 %1, i32* %data, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !24, metadata !DIExpression()), !dbg !28
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !28
  %3 = load i32, i32* %data, align 4, !dbg !29
  %cmp = icmp slt i32 %3, 10, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data, align 4, !dbg !33
  %idxprom = sext i32 %4 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !35
  store i32 1, i32* %arrayidx, align 4, !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !40
  %cmp1 = icmp slt i32 %5, 10, !dbg !42
  br i1 %cmp1, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !44
  %idxprom2 = sext i32 %6 to i64, !dbg !46
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !46
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !46
  call void @printIntLine(i32 %7), !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %8, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !54

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !55
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_63b_goodG2BSink(i32* %dataPtr) #0 !dbg !58 {
entry:
  %dataPtr.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32* %dataPtr, i32** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataPtr.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32* %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32*, i32** %dataPtr.addr, align 8, !dbg !63
  %1 = load i32, i32* %0, align 4, !dbg !64
  store i32 %1, i32* %data, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata i32* %i, metadata !65, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !68, metadata !DIExpression()), !dbg !69
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !69
  %3 = load i32, i32* %data, align 4, !dbg !70
  %cmp = icmp slt i32 %3, 10, !dbg !72
  br i1 %cmp, label %if.then, label %if.else, !dbg !73

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data, align 4, !dbg !74
  %idxprom = sext i32 %4 to i64, !dbg !76
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !76
  store i32 1, i32* %arrayidx, align 4, !dbg !77
  store i32 0, i32* %i, align 4, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !81
  %cmp1 = icmp slt i32 %5, 10, !dbg !83
  br i1 %cmp1, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !85
  %idxprom2 = sext i32 %6 to i64, !dbg !87
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !87
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !87
  call void @printIntLine(i32 %7), !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !90
  %inc = add nsw i32 %8, 1, !dbg !90
  store i32 %inc, i32* %i, align 4, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_63b_goodB2GSink(i32* %dataPtr) #0 !dbg !98 {
entry:
  %dataPtr.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32* %dataPtr, i32** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataPtr.addr, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %data, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32*, i32** %dataPtr.addr, align 8, !dbg !103
  %1 = load i32, i32* %0, align 4, !dbg !104
  store i32 %1, i32* %data, align 4, !dbg !102
  call void @llvm.dbg.declare(metadata i32* %i, metadata !105, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !108, metadata !DIExpression()), !dbg !109
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !109
  %3 = load i32, i32* %data, align 4, !dbg !110
  %cmp = icmp sge i32 %3, 0, !dbg !112
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !113

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %data, align 4, !dbg !114
  %cmp1 = icmp slt i32 %4, 10, !dbg !115
  br i1 %cmp1, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !117
  %idxprom = sext i32 %5 to i64, !dbg !119
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !119
  store i32 1, i32* %arrayidx, align 4, !dbg !120
  store i32 0, i32* %i, align 4, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !124
  %cmp2 = icmp slt i32 %6, 10, !dbg !126
  br i1 %cmp2, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !128
  %idxprom3 = sext i32 %7 to i64, !dbg !130
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !130
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !130
  call void @printIntLine(i32 %8), !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !133
  %inc = add nsw i32 %9, 1, !dbg !133
  store i32 %inc, i32* %i, align 4, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !137

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !138
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_63b_badSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 44, type: !13)
!16 = !DILocation(line: 44, column: 71, scope: !9)
!17 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 46, type: !14)
!18 = !DILocation(line: 46, column: 9, scope: !9)
!19 = !DILocation(line: 46, column: 17, scope: !9)
!20 = !DILocation(line: 46, column: 16, scope: !9)
!21 = !DILocalVariable(name: "i", scope: !22, file: !10, line: 48, type: !14)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 47, column: 5)
!23 = !DILocation(line: 48, column: 13, scope: !22)
!24 = !DILocalVariable(name: "buffer", scope: !22, file: !10, line: 49, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 49, column: 13, scope: !22)
!29 = !DILocation(line: 52, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !10, line: 52, column: 13)
!31 = !DILocation(line: 52, column: 18, scope: !30)
!32 = !DILocation(line: 52, column: 13, scope: !22)
!33 = !DILocation(line: 54, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 53, column: 9)
!35 = !DILocation(line: 54, column: 13, scope: !34)
!36 = !DILocation(line: 54, column: 26, scope: !34)
!37 = !DILocation(line: 56, column: 19, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 56, column: 13)
!39 = !DILocation(line: 56, column: 17, scope: !38)
!40 = !DILocation(line: 56, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !10, line: 56, column: 13)
!42 = !DILocation(line: 56, column: 26, scope: !41)
!43 = !DILocation(line: 56, column: 13, scope: !38)
!44 = !DILocation(line: 58, column: 37, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !10, line: 57, column: 13)
!46 = !DILocation(line: 58, column: 30, scope: !45)
!47 = !DILocation(line: 58, column: 17, scope: !45)
!48 = !DILocation(line: 59, column: 13, scope: !45)
!49 = !DILocation(line: 56, column: 33, scope: !41)
!50 = !DILocation(line: 56, column: 13, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 59, column: 13, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 60, column: 9, scope: !34)
!55 = !DILocation(line: 63, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !30, file: !10, line: 62, column: 9)
!57 = !DILocation(line: 66, column: 1, scope: !9)
!58 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_63b_goodG2BSink", scope: !10, file: !10, line: 73, type: !11, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !58, file: !10, line: 73, type: !13)
!60 = !DILocation(line: 73, column: 75, scope: !58)
!61 = !DILocalVariable(name: "data", scope: !58, file: !10, line: 75, type: !14)
!62 = !DILocation(line: 75, column: 9, scope: !58)
!63 = !DILocation(line: 75, column: 17, scope: !58)
!64 = !DILocation(line: 75, column: 16, scope: !58)
!65 = !DILocalVariable(name: "i", scope: !66, file: !10, line: 77, type: !14)
!66 = distinct !DILexicalBlock(scope: !58, file: !10, line: 76, column: 5)
!67 = !DILocation(line: 77, column: 13, scope: !66)
!68 = !DILocalVariable(name: "buffer", scope: !66, file: !10, line: 78, type: !25)
!69 = !DILocation(line: 78, column: 13, scope: !66)
!70 = !DILocation(line: 81, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !10, line: 81, column: 13)
!72 = !DILocation(line: 81, column: 18, scope: !71)
!73 = !DILocation(line: 81, column: 13, scope: !66)
!74 = !DILocation(line: 83, column: 20, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !10, line: 82, column: 9)
!76 = !DILocation(line: 83, column: 13, scope: !75)
!77 = !DILocation(line: 83, column: 26, scope: !75)
!78 = !DILocation(line: 85, column: 19, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 85, column: 13)
!80 = !DILocation(line: 85, column: 17, scope: !79)
!81 = !DILocation(line: 85, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !10, line: 85, column: 13)
!83 = !DILocation(line: 85, column: 26, scope: !82)
!84 = !DILocation(line: 85, column: 13, scope: !79)
!85 = !DILocation(line: 87, column: 37, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !10, line: 86, column: 13)
!87 = !DILocation(line: 87, column: 30, scope: !86)
!88 = !DILocation(line: 87, column: 17, scope: !86)
!89 = !DILocation(line: 88, column: 13, scope: !86)
!90 = !DILocation(line: 85, column: 33, scope: !82)
!91 = !DILocation(line: 85, column: 13, scope: !82)
!92 = distinct !{!92, !84, !93, !53}
!93 = !DILocation(line: 88, column: 13, scope: !79)
!94 = !DILocation(line: 89, column: 9, scope: !75)
!95 = !DILocation(line: 92, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !71, file: !10, line: 91, column: 9)
!97 = !DILocation(line: 95, column: 1, scope: !58)
!98 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_63b_goodB2GSink", scope: !10, file: !10, line: 98, type: !11, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !98, file: !10, line: 98, type: !13)
!100 = !DILocation(line: 98, column: 75, scope: !98)
!101 = !DILocalVariable(name: "data", scope: !98, file: !10, line: 100, type: !14)
!102 = !DILocation(line: 100, column: 9, scope: !98)
!103 = !DILocation(line: 100, column: 17, scope: !98)
!104 = !DILocation(line: 100, column: 16, scope: !98)
!105 = !DILocalVariable(name: "i", scope: !106, file: !10, line: 102, type: !14)
!106 = distinct !DILexicalBlock(scope: !98, file: !10, line: 101, column: 5)
!107 = !DILocation(line: 102, column: 13, scope: !106)
!108 = !DILocalVariable(name: "buffer", scope: !106, file: !10, line: 103, type: !25)
!109 = !DILocation(line: 103, column: 13, scope: !106)
!110 = !DILocation(line: 105, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !10, line: 105, column: 13)
!112 = !DILocation(line: 105, column: 18, scope: !111)
!113 = !DILocation(line: 105, column: 23, scope: !111)
!114 = !DILocation(line: 105, column: 26, scope: !111)
!115 = !DILocation(line: 105, column: 31, scope: !111)
!116 = !DILocation(line: 105, column: 13, scope: !106)
!117 = !DILocation(line: 107, column: 20, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !10, line: 106, column: 9)
!119 = !DILocation(line: 107, column: 13, scope: !118)
!120 = !DILocation(line: 107, column: 26, scope: !118)
!121 = !DILocation(line: 109, column: 19, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !10, line: 109, column: 13)
!123 = !DILocation(line: 109, column: 17, scope: !122)
!124 = !DILocation(line: 109, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !10, line: 109, column: 13)
!126 = !DILocation(line: 109, column: 26, scope: !125)
!127 = !DILocation(line: 109, column: 13, scope: !122)
!128 = !DILocation(line: 111, column: 37, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !10, line: 110, column: 13)
!130 = !DILocation(line: 111, column: 30, scope: !129)
!131 = !DILocation(line: 111, column: 17, scope: !129)
!132 = !DILocation(line: 112, column: 13, scope: !129)
!133 = !DILocation(line: 109, column: 33, scope: !125)
!134 = !DILocation(line: 109, column: 13, scope: !125)
!135 = distinct !{!135, !127, !136, !53}
!136 = !DILocation(line: 112, column: 13, scope: !122)
!137 = !DILocation(line: 113, column: 9, scope: !118)
!138 = !DILocation(line: 116, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !111, file: !10, line: 115, column: 9)
!140 = !DILocation(line: 119, column: 1, scope: !98)
