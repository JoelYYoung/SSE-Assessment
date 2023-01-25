; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = alloca i8, i64 10, align 16, !dbg !20
  %1 = bitcast i8* %0 to i32*, !dbg !21
  store i32* %1, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %3, 10, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !43
  %5 = load i32, i32* %arrayidx, align 4, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !44
  %7 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !44
  store i32 %5, i32* %arrayidx1, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %8, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !53
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !53
  call void @printIntLine(i32 %10), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i32* null, i32** %data, align 8, !dbg !83
  %0 = alloca i8, i64 40, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !89
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !95
  %cmp = icmp ult i64 %3, 10, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !101
  %5 = load i32, i32* %arrayidx, align 4, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  %7 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !102
  store i32 %5, i32* %arrayidx1, align 4, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !106
  %inc = add i64 %8, 1, !dbg !106
  store i64 %inc, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !110
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !110
  call void @printIntLine(i32 %10), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32* null, i32** %data, align 8, !dbg !116
  %0 = alloca i8, i64 40, align 16, !dbg !117
  %1 = bitcast i8* %0 to i32*, !dbg !118
  store i32* %1, i32** %data, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !128
  %cmp = icmp ult i64 %3, 10, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !134
  %5 = load i32, i32* %arrayidx, align 4, !dbg !134
  %6 = load i32*, i32** %data, align 8, !dbg !135
  %7 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !135
  store i32 %5, i32* %arrayidx1, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %8, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !143
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !143
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !143
  call void @printIntLine(i32 %10), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 29, column: 23, scope: !13)
!21 = !DILocation(line: 29, column: 16, scope: !13)
!22 = !DILocation(line: 29, column: 14, scope: !13)
!23 = !DILocalVariable(name: "source", scope: !24, file: !14, line: 37, type: !25)
!24 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 37, column: 13, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !24, file: !14, line: 38, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 38, column: 16, scope: !24)
!34 = !DILocation(line: 40, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !24, file: !14, line: 40, column: 9)
!36 = !DILocation(line: 40, column: 14, scope: !35)
!37 = !DILocation(line: 40, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 40, column: 9)
!39 = !DILocation(line: 40, column: 23, scope: !38)
!40 = !DILocation(line: 40, column: 9, scope: !35)
!41 = !DILocation(line: 42, column: 30, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !14, line: 41, column: 9)
!43 = !DILocation(line: 42, column: 23, scope: !42)
!44 = !DILocation(line: 42, column: 13, scope: !42)
!45 = !DILocation(line: 42, column: 18, scope: !42)
!46 = !DILocation(line: 42, column: 21, scope: !42)
!47 = !DILocation(line: 43, column: 9, scope: !42)
!48 = !DILocation(line: 40, column: 30, scope: !38)
!49 = !DILocation(line: 40, column: 9, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 43, column: 9, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 44, column: 22, scope: !24)
!54 = !DILocation(line: 44, column: 9, scope: !24)
!55 = !DILocation(line: 46, column: 1, scope: !13)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_15_good", scope: !14, file: !14, line: 108, type: !15, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 110, column: 5, scope: !56)
!58 = !DILocation(line: 111, column: 5, scope: !56)
!59 = !DILocation(line: 112, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 124, type: !61, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!5, !5, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !14, line: 124, type: !5)
!67 = !DILocation(line: 124, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !14, line: 124, type: !63)
!69 = !DILocation(line: 124, column: 27, scope: !60)
!70 = !DILocation(line: 127, column: 22, scope: !60)
!71 = !DILocation(line: 127, column: 12, scope: !60)
!72 = !DILocation(line: 127, column: 5, scope: !60)
!73 = !DILocation(line: 129, column: 5, scope: !60)
!74 = !DILocation(line: 130, column: 5, scope: !60)
!75 = !DILocation(line: 131, column: 5, scope: !60)
!76 = !DILocation(line: 134, column: 5, scope: !60)
!77 = !DILocation(line: 135, column: 5, scope: !60)
!78 = !DILocation(line: 136, column: 5, scope: !60)
!79 = !DILocation(line: 138, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !14, line: 55, type: !4)
!82 = !DILocation(line: 55, column: 11, scope: !80)
!83 = !DILocation(line: 56, column: 10, scope: !80)
!84 = !DILocation(line: 65, column: 23, scope: !80)
!85 = !DILocation(line: 65, column: 16, scope: !80)
!86 = !DILocation(line: 65, column: 14, scope: !80)
!87 = !DILocalVariable(name: "source", scope: !88, file: !14, line: 69, type: !25)
!88 = distinct !DILexicalBlock(scope: !80, file: !14, line: 68, column: 5)
!89 = !DILocation(line: 69, column: 13, scope: !88)
!90 = !DILocalVariable(name: "i", scope: !88, file: !14, line: 70, type: !30)
!91 = !DILocation(line: 70, column: 16, scope: !88)
!92 = !DILocation(line: 72, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !14, line: 72, column: 9)
!94 = !DILocation(line: 72, column: 14, scope: !93)
!95 = !DILocation(line: 72, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !14, line: 72, column: 9)
!97 = !DILocation(line: 72, column: 23, scope: !96)
!98 = !DILocation(line: 72, column: 9, scope: !93)
!99 = !DILocation(line: 74, column: 30, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !14, line: 73, column: 9)
!101 = !DILocation(line: 74, column: 23, scope: !100)
!102 = !DILocation(line: 74, column: 13, scope: !100)
!103 = !DILocation(line: 74, column: 18, scope: !100)
!104 = !DILocation(line: 74, column: 21, scope: !100)
!105 = !DILocation(line: 75, column: 9, scope: !100)
!106 = !DILocation(line: 72, column: 30, scope: !96)
!107 = !DILocation(line: 72, column: 9, scope: !96)
!108 = distinct !{!108, !98, !109, !52}
!109 = !DILocation(line: 75, column: 9, scope: !93)
!110 = !DILocation(line: 76, column: 22, scope: !88)
!111 = !DILocation(line: 76, column: 9, scope: !88)
!112 = !DILocation(line: 78, column: 1, scope: !80)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !14, line: 83, type: !4)
!115 = !DILocation(line: 83, column: 11, scope: !113)
!116 = !DILocation(line: 84, column: 10, scope: !113)
!117 = !DILocation(line: 89, column: 23, scope: !113)
!118 = !DILocation(line: 89, column: 16, scope: !113)
!119 = !DILocation(line: 89, column: 14, scope: !113)
!120 = !DILocalVariable(name: "source", scope: !121, file: !14, line: 97, type: !25)
!121 = distinct !DILexicalBlock(scope: !113, file: !14, line: 96, column: 5)
!122 = !DILocation(line: 97, column: 13, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !14, line: 98, type: !30)
!124 = !DILocation(line: 98, column: 16, scope: !121)
!125 = !DILocation(line: 100, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !14, line: 100, column: 9)
!127 = !DILocation(line: 100, column: 14, scope: !126)
!128 = !DILocation(line: 100, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !14, line: 100, column: 9)
!130 = !DILocation(line: 100, column: 23, scope: !129)
!131 = !DILocation(line: 100, column: 9, scope: !126)
!132 = !DILocation(line: 102, column: 30, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !14, line: 101, column: 9)
!134 = !DILocation(line: 102, column: 23, scope: !133)
!135 = !DILocation(line: 102, column: 13, scope: !133)
!136 = !DILocation(line: 102, column: 18, scope: !133)
!137 = !DILocation(line: 102, column: 21, scope: !133)
!138 = !DILocation(line: 103, column: 9, scope: !133)
!139 = !DILocation(line: 100, column: 30, scope: !129)
!140 = !DILocation(line: 100, column: 9, scope: !129)
!141 = distinct !{!141, !131, !142, !52}
!142 = !DILocation(line: 103, column: 9, scope: !126)
!143 = !DILocation(line: 104, column: 22, scope: !121)
!144 = !DILocation(line: 104, column: 9, scope: !121)
!145 = !DILocation(line: 106, column: 1, scope: !113)
