; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  %0 = alloca i8, i64 10, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %data, align 8, !dbg !27
  %2 = load i32*, i32** %data, align 8, !dbg !28
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_badData, align 8, !dbg !29
  call void @badSink(), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_good() #0 !dbg !32 {
entry:
  call void @goodG2B(), !dbg !33
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_bad(), !dbg !52
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
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_badData, align 8, !dbg !58
  store i32* %0, i32** %data, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !59, metadata !DIExpression()), !dbg !64
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %i, metadata !65, metadata !DIExpression()), !dbg !69
  store i64 0, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !73
  %cmp = icmp ult i64 %2, 10, !dbg !75
  br i1 %cmp, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !79
  %4 = load i32, i32* %arrayidx, align 4, !dbg !79
  %5 = load i32*, i32** %data, align 8, !dbg !80
  %6 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !80
  store i32 %4, i32* %arrayidx1, align 4, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %7, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !89
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !89
  call void @printIntLine(i32 %9), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  %0 = alloca i8, i64 40, align 16, !dbg !96
  %1 = bitcast i8* %0 to i32*, !dbg !97
  store i32* %1, i32** %data, align 8, !dbg !98
  %2 = load i32*, i32** %data, align 8, !dbg !99
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData, align 8, !dbg !100
  call void @goodG2BSink(), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData, align 8, !dbg !106
  store i32* %0, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !115
  %cmp = icmp ult i64 %2, 10, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !121
  %4 = load i32, i32* %arrayidx, align 4, !dbg !121
  %5 = load i32*, i32** %data, align 8, !dbg !122
  %6 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !122
  store i32 %4, i32* %arrayidx1, align 4, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %7, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !130
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !130
  call void @printIntLine(i32 %9), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_badData", scope: !2, file: !12, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData", scope: !2, file: !12, line: 20, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45.c", directory: "/root/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_bad", scope: !12, file: !12, line: 39, type: !20, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 41, type: !6)
!23 = !DILocation(line: 41, column: 11, scope: !19)
!24 = !DILocation(line: 42, column: 10, scope: !19)
!25 = !DILocation(line: 44, column: 19, scope: !19)
!26 = !DILocation(line: 44, column: 12, scope: !19)
!27 = !DILocation(line: 44, column: 10, scope: !19)
!28 = !DILocation(line: 45, column: 66, scope: !19)
!29 = !DILocation(line: 45, column: 64, scope: !19)
!30 = !DILocation(line: 46, column: 5, scope: !19)
!31 = !DILocation(line: 47, column: 1, scope: !19)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_good", scope: !12, file: !12, line: 79, type: !20, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DILocation(line: 81, column: 5, scope: !32)
!34 = !DILocation(line: 82, column: 1, scope: !32)
!35 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 93, type: !36, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{!7, !7, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !12, line: 93, type: !7)
!42 = !DILocation(line: 93, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !12, line: 93, type: !38)
!44 = !DILocation(line: 93, column: 27, scope: !35)
!45 = !DILocation(line: 96, column: 22, scope: !35)
!46 = !DILocation(line: 96, column: 12, scope: !35)
!47 = !DILocation(line: 96, column: 5, scope: !35)
!48 = !DILocation(line: 98, column: 5, scope: !35)
!49 = !DILocation(line: 99, column: 5, scope: !35)
!50 = !DILocation(line: 100, column: 5, scope: !35)
!51 = !DILocation(line: 103, column: 5, scope: !35)
!52 = !DILocation(line: 104, column: 5, scope: !35)
!53 = !DILocation(line: 105, column: 5, scope: !35)
!54 = !DILocation(line: 107, column: 5, scope: !35)
!55 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocalVariable(name: "data", scope: !55, file: !12, line: 26, type: !6)
!57 = !DILocation(line: 26, column: 11, scope: !55)
!58 = !DILocation(line: 26, column: 18, scope: !55)
!59 = !DILocalVariable(name: "source", scope: !60, file: !12, line: 28, type: !61)
!60 = distinct !DILexicalBlock(scope: !55, file: !12, line: 27, column: 5)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 10)
!64 = !DILocation(line: 28, column: 13, scope: !60)
!65 = !DILocalVariable(name: "i", scope: !60, file: !12, line: 29, type: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !67, line: 46, baseType: !68)
!67 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!68 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!69 = !DILocation(line: 29, column: 16, scope: !60)
!70 = !DILocation(line: 31, column: 16, scope: !71)
!71 = distinct !DILexicalBlock(scope: !60, file: !12, line: 31, column: 9)
!72 = !DILocation(line: 31, column: 14, scope: !71)
!73 = !DILocation(line: 31, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !12, line: 31, column: 9)
!75 = !DILocation(line: 31, column: 23, scope: !74)
!76 = !DILocation(line: 31, column: 9, scope: !71)
!77 = !DILocation(line: 33, column: 30, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !12, line: 32, column: 9)
!79 = !DILocation(line: 33, column: 23, scope: !78)
!80 = !DILocation(line: 33, column: 13, scope: !78)
!81 = !DILocation(line: 33, column: 18, scope: !78)
!82 = !DILocation(line: 33, column: 21, scope: !78)
!83 = !DILocation(line: 34, column: 9, scope: !78)
!84 = !DILocation(line: 31, column: 30, scope: !74)
!85 = !DILocation(line: 31, column: 9, scope: !74)
!86 = distinct !{!86, !76, !87, !88}
!87 = !DILocation(line: 34, column: 9, scope: !71)
!88 = !{!"llvm.loop.mustprogress"}
!89 = !DILocation(line: 35, column: 22, scope: !60)
!90 = !DILocation(line: 35, column: 9, scope: !60)
!91 = !DILocation(line: 37, column: 1, scope: !55)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !20, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 71, type: !6)
!94 = !DILocation(line: 71, column: 11, scope: !92)
!95 = !DILocation(line: 72, column: 10, scope: !92)
!96 = !DILocation(line: 74, column: 19, scope: !92)
!97 = !DILocation(line: 74, column: 12, scope: !92)
!98 = !DILocation(line: 74, column: 10, scope: !92)
!99 = !DILocation(line: 75, column: 70, scope: !92)
!100 = !DILocation(line: 75, column: 68, scope: !92)
!101 = !DILocation(line: 76, column: 5, scope: !92)
!102 = !DILocation(line: 77, column: 1, scope: !92)
!103 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 56, type: !6)
!105 = !DILocation(line: 56, column: 11, scope: !103)
!106 = !DILocation(line: 56, column: 18, scope: !103)
!107 = !DILocalVariable(name: "source", scope: !108, file: !12, line: 58, type: !61)
!108 = distinct !DILexicalBlock(scope: !103, file: !12, line: 57, column: 5)
!109 = !DILocation(line: 58, column: 13, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !108, file: !12, line: 59, type: !66)
!111 = !DILocation(line: 59, column: 16, scope: !108)
!112 = !DILocation(line: 61, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !12, line: 61, column: 9)
!114 = !DILocation(line: 61, column: 14, scope: !113)
!115 = !DILocation(line: 61, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 61, column: 9)
!117 = !DILocation(line: 61, column: 23, scope: !116)
!118 = !DILocation(line: 61, column: 9, scope: !113)
!119 = !DILocation(line: 63, column: 30, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 62, column: 9)
!121 = !DILocation(line: 63, column: 23, scope: !120)
!122 = !DILocation(line: 63, column: 13, scope: !120)
!123 = !DILocation(line: 63, column: 18, scope: !120)
!124 = !DILocation(line: 63, column: 21, scope: !120)
!125 = !DILocation(line: 64, column: 9, scope: !120)
!126 = !DILocation(line: 61, column: 30, scope: !116)
!127 = !DILocation(line: 61, column: 9, scope: !116)
!128 = distinct !{!128, !118, !129, !88}
!129 = !DILocation(line: 64, column: 9, scope: !113)
!130 = !DILocation(line: 65, column: 22, scope: !108)
!131 = !DILocation(line: 65, column: 9, scope: !108)
!132 = !DILocation(line: 67, column: 1, scope: !103)
