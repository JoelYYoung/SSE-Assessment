; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_64b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_64b_badSink(i8* %dataVoidPtr) #0 !dbg !12 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataPtr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataPtr, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = load i32*, i32** %dataPtr, align 8, !dbg !25
  %3 = load i32, i32* %2, align 4, !dbg !26
  store i32 %3, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !30, metadata !DIExpression()), !dbg !34
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !34
  %5 = load i32, i32* %data, align 4, !dbg !35
  %cmp = icmp slt i32 %5, 10, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %6 = load i32, i32* %data, align 4, !dbg !39
  %idxprom = sext i32 %6 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !41
  store i32 1, i32* %arrayidx, align 4, !dbg !42
  store i32 0, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %7 = load i32, i32* %i, align 4, !dbg !46
  %cmp1 = icmp slt i32 %7, 10, !dbg !48
  br i1 %cmp1, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !50
  %idxprom2 = sext i32 %8 to i64, !dbg !52
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !52
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !52
  call void @printIntLine(i32 %9), !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !55
  %inc = add nsw i32 %10, 1, !dbg !55
  store i32 %inc, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !60

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !61
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !64 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32** %dataPtr, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !69
  %1 = bitcast i8* %0 to i32*, !dbg !70
  store i32* %1, i32** %dataPtr, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32* %data, metadata !71, metadata !DIExpression()), !dbg !72
  %2 = load i32*, i32** %dataPtr, align 8, !dbg !73
  %3 = load i32, i32* %2, align 4, !dbg !74
  store i32 %3, i32* %data, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata i32* %i, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !78, metadata !DIExpression()), !dbg !79
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !79
  %5 = load i32, i32* %data, align 4, !dbg !80
  %cmp = icmp slt i32 %5, 10, !dbg !82
  br i1 %cmp, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  %6 = load i32, i32* %data, align 4, !dbg !84
  %idxprom = sext i32 %6 to i64, !dbg !86
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !86
  store i32 1, i32* %arrayidx, align 4, !dbg !87
  store i32 0, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %if.then
  %7 = load i32, i32* %i, align 4, !dbg !91
  %cmp1 = icmp slt i32 %7, 10, !dbg !93
  br i1 %cmp1, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !95
  %idxprom2 = sext i32 %8 to i64, !dbg !97
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !97
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !97
  call void @printIntLine(i32 %9), !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !100
  %inc = add nsw i32 %10, 1, !dbg !100
  store i32 %inc, i32* %i, align 4, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !104

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !105
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_64b_goodB2GSink(i8* %dataVoidPtr) #0 !dbg !108 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataPtr, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !113
  %1 = bitcast i8* %0 to i32*, !dbg !114
  store i32* %1, i32** %dataPtr, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = load i32*, i32** %dataPtr, align 8, !dbg !117
  %3 = load i32, i32* %2, align 4, !dbg !118
  store i32 %3, i32* %data, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !122, metadata !DIExpression()), !dbg !123
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !123
  %5 = load i32, i32* %data, align 4, !dbg !124
  %cmp = icmp sge i32 %5, 0, !dbg !126
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !127

land.lhs.true:                                    ; preds = %entry
  %6 = load i32, i32* %data, align 4, !dbg !128
  %cmp1 = icmp slt i32 %6, 10, !dbg !129
  br i1 %cmp1, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !131
  %idxprom = sext i32 %7 to i64, !dbg !133
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !133
  store i32 1, i32* %arrayidx, align 4, !dbg !134
  store i32 0, i32* %i, align 4, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.then
  %8 = load i32, i32* %i, align 4, !dbg !138
  %cmp2 = icmp slt i32 %8, 10, !dbg !140
  br i1 %cmp2, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !142
  %idxprom3 = sext i32 %9 to i64, !dbg !144
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !144
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !144
  call void @printIntLine(i32 %10), !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !147
  %inc = add nsw i32 %11, 1, !dbg !147
  store i32 %inc, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !151

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !152
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_64b_badSink", scope: !13, file: !13, line: 44, type: !14, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_64b.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !12, file: !13, line: 44, type: !16)
!18 = !DILocation(line: 44, column: 73, scope: !12)
!19 = !DILocalVariable(name: "dataPtr", scope: !12, file: !13, line: 47, type: !4)
!20 = !DILocation(line: 47, column: 11, scope: !12)
!21 = !DILocation(line: 47, column: 28, scope: !12)
!22 = !DILocation(line: 47, column: 21, scope: !12)
!23 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 49, type: !5)
!24 = !DILocation(line: 49, column: 9, scope: !12)
!25 = !DILocation(line: 49, column: 18, scope: !12)
!26 = !DILocation(line: 49, column: 17, scope: !12)
!27 = !DILocalVariable(name: "i", scope: !28, file: !13, line: 51, type: !5)
!28 = distinct !DILexicalBlock(scope: !12, file: !13, line: 50, column: 5)
!29 = !DILocation(line: 51, column: 13, scope: !28)
!30 = !DILocalVariable(name: "buffer", scope: !28, file: !13, line: 52, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 10)
!34 = !DILocation(line: 52, column: 13, scope: !28)
!35 = !DILocation(line: 55, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !13, line: 55, column: 13)
!37 = !DILocation(line: 55, column: 18, scope: !36)
!38 = !DILocation(line: 55, column: 13, scope: !28)
!39 = !DILocation(line: 57, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !13, line: 56, column: 9)
!41 = !DILocation(line: 57, column: 13, scope: !40)
!42 = !DILocation(line: 57, column: 26, scope: !40)
!43 = !DILocation(line: 59, column: 19, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !13, line: 59, column: 13)
!45 = !DILocation(line: 59, column: 17, scope: !44)
!46 = !DILocation(line: 59, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !13, line: 59, column: 13)
!48 = !DILocation(line: 59, column: 26, scope: !47)
!49 = !DILocation(line: 59, column: 13, scope: !44)
!50 = !DILocation(line: 61, column: 37, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !13, line: 60, column: 13)
!52 = !DILocation(line: 61, column: 30, scope: !51)
!53 = !DILocation(line: 61, column: 17, scope: !51)
!54 = !DILocation(line: 62, column: 13, scope: !51)
!55 = !DILocation(line: 59, column: 33, scope: !47)
!56 = !DILocation(line: 59, column: 13, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 62, column: 13, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 63, column: 9, scope: !40)
!61 = !DILocation(line: 66, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !36, file: !13, line: 65, column: 9)
!63 = !DILocation(line: 69, column: 1, scope: !12)
!64 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_64b_goodG2BSink", scope: !13, file: !13, line: 76, type: !14, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !64, file: !13, line: 76, type: !16)
!66 = !DILocation(line: 76, column: 77, scope: !64)
!67 = !DILocalVariable(name: "dataPtr", scope: !64, file: !13, line: 79, type: !4)
!68 = !DILocation(line: 79, column: 11, scope: !64)
!69 = !DILocation(line: 79, column: 28, scope: !64)
!70 = !DILocation(line: 79, column: 21, scope: !64)
!71 = !DILocalVariable(name: "data", scope: !64, file: !13, line: 81, type: !5)
!72 = !DILocation(line: 81, column: 9, scope: !64)
!73 = !DILocation(line: 81, column: 18, scope: !64)
!74 = !DILocation(line: 81, column: 17, scope: !64)
!75 = !DILocalVariable(name: "i", scope: !76, file: !13, line: 83, type: !5)
!76 = distinct !DILexicalBlock(scope: !64, file: !13, line: 82, column: 5)
!77 = !DILocation(line: 83, column: 13, scope: !76)
!78 = !DILocalVariable(name: "buffer", scope: !76, file: !13, line: 84, type: !31)
!79 = !DILocation(line: 84, column: 13, scope: !76)
!80 = !DILocation(line: 87, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !13, line: 87, column: 13)
!82 = !DILocation(line: 87, column: 18, scope: !81)
!83 = !DILocation(line: 87, column: 13, scope: !76)
!84 = !DILocation(line: 89, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !13, line: 88, column: 9)
!86 = !DILocation(line: 89, column: 13, scope: !85)
!87 = !DILocation(line: 89, column: 26, scope: !85)
!88 = !DILocation(line: 91, column: 19, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !13, line: 91, column: 13)
!90 = !DILocation(line: 91, column: 17, scope: !89)
!91 = !DILocation(line: 91, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !13, line: 91, column: 13)
!93 = !DILocation(line: 91, column: 26, scope: !92)
!94 = !DILocation(line: 91, column: 13, scope: !89)
!95 = !DILocation(line: 93, column: 37, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !13, line: 92, column: 13)
!97 = !DILocation(line: 93, column: 30, scope: !96)
!98 = !DILocation(line: 93, column: 17, scope: !96)
!99 = !DILocation(line: 94, column: 13, scope: !96)
!100 = !DILocation(line: 91, column: 33, scope: !92)
!101 = !DILocation(line: 91, column: 13, scope: !92)
!102 = distinct !{!102, !94, !103, !59}
!103 = !DILocation(line: 94, column: 13, scope: !89)
!104 = !DILocation(line: 95, column: 9, scope: !85)
!105 = !DILocation(line: 98, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !81, file: !13, line: 97, column: 9)
!107 = !DILocation(line: 101, column: 1, scope: !64)
!108 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_64b_goodB2GSink", scope: !13, file: !13, line: 104, type: !14, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !108, file: !13, line: 104, type: !16)
!110 = !DILocation(line: 104, column: 77, scope: !108)
!111 = !DILocalVariable(name: "dataPtr", scope: !108, file: !13, line: 107, type: !4)
!112 = !DILocation(line: 107, column: 11, scope: !108)
!113 = !DILocation(line: 107, column: 28, scope: !108)
!114 = !DILocation(line: 107, column: 21, scope: !108)
!115 = !DILocalVariable(name: "data", scope: !108, file: !13, line: 109, type: !5)
!116 = !DILocation(line: 109, column: 9, scope: !108)
!117 = !DILocation(line: 109, column: 18, scope: !108)
!118 = !DILocation(line: 109, column: 17, scope: !108)
!119 = !DILocalVariable(name: "i", scope: !120, file: !13, line: 111, type: !5)
!120 = distinct !DILexicalBlock(scope: !108, file: !13, line: 110, column: 5)
!121 = !DILocation(line: 111, column: 13, scope: !120)
!122 = !DILocalVariable(name: "buffer", scope: !120, file: !13, line: 112, type: !31)
!123 = !DILocation(line: 112, column: 13, scope: !120)
!124 = !DILocation(line: 114, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !13, line: 114, column: 13)
!126 = !DILocation(line: 114, column: 18, scope: !125)
!127 = !DILocation(line: 114, column: 23, scope: !125)
!128 = !DILocation(line: 114, column: 26, scope: !125)
!129 = !DILocation(line: 114, column: 31, scope: !125)
!130 = !DILocation(line: 114, column: 13, scope: !120)
!131 = !DILocation(line: 116, column: 20, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !13, line: 115, column: 9)
!133 = !DILocation(line: 116, column: 13, scope: !132)
!134 = !DILocation(line: 116, column: 26, scope: !132)
!135 = !DILocation(line: 118, column: 19, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !13, line: 118, column: 13)
!137 = !DILocation(line: 118, column: 17, scope: !136)
!138 = !DILocation(line: 118, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !13, line: 118, column: 13)
!140 = !DILocation(line: 118, column: 26, scope: !139)
!141 = !DILocation(line: 118, column: 13, scope: !136)
!142 = !DILocation(line: 120, column: 37, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !13, line: 119, column: 13)
!144 = !DILocation(line: 120, column: 30, scope: !143)
!145 = !DILocation(line: 120, column: 17, scope: !143)
!146 = !DILocation(line: 121, column: 13, scope: !143)
!147 = !DILocation(line: 118, column: 33, scope: !139)
!148 = !DILocation(line: 118, column: 13, scope: !139)
!149 = distinct !{!149, !141, !150, !59}
!150 = !DILocation(line: 121, column: 13, scope: !136)
!151 = !DILocation(line: 122, column: 9, scope: !132)
!152 = !DILocation(line: 125, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !125, file: !13, line: 124, column: 9)
!154 = !DILocation(line: 128, column: 1, scope: !108)
