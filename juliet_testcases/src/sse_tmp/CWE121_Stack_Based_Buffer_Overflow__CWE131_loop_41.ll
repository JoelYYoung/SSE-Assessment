; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_badSink(i32* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !29
  store i64 0, i64* %i, align 8, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !33
  %cmp = icmp ult i64 %1, 10, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !39
  %3 = load i32, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %data.addr, align 8, !dbg !40
  %5 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !40
  store i32 %3, i32* %arrayidx1, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !44
  %inc = add i64 %6, 1, !dbg !44
  store i64 %inc, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !49
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !49
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !49
  call void @printIntLine(i32 %8), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_bad() #0 !dbg !52 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !55, metadata !DIExpression()), !dbg !56
  store i32* null, i32** %data, align 8, !dbg !57
  %0 = alloca i8, i64 10, align 16, !dbg !58
  %1 = bitcast i8* %0 to i32*, !dbg !59
  store i32* %1, i32** %data, align 8, !dbg !60
  %2 = load i32*, i32** %data, align 8, !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_badSink(i32* %2), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_goodG2BSink(i32* %data) #0 !dbg !64 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !67, metadata !DIExpression()), !dbg !69
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !69
  call void @llvm.dbg.declare(metadata i64* %i, metadata !70, metadata !DIExpression()), !dbg !71
  store i64 0, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !75
  %cmp = icmp ult i64 %1, 10, !dbg !77
  br i1 %cmp, label %for.body, label %for.end, !dbg !78

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !81
  %3 = load i32, i32* %arrayidx, align 4, !dbg !81
  %4 = load i32*, i32** %data.addr, align 8, !dbg !82
  %5 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !82
  store i32 %3, i32* %arrayidx1, align 4, !dbg !84
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !86
  %inc = add i64 %6, 1, !dbg !86
  store i64 %inc, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !87, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !90
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !90
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !90
  call void @printIntLine(i32 %8), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #5, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #5, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32* null, i32** %data, align 8, !dbg !119
  %0 = alloca i8, i64 40, align 16, !dbg !120
  %1 = bitcast i8* %0 to i32*, !dbg !121
  store i32* %1, i32** %data, align 8, !dbg !122
  %2 = load i32*, i32** %data, align 8, !dbg !123
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_goodG2BSink(i32* %2), !dbg !124
  ret void, !dbg !125
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 21, type: !4)
!18 = !DILocation(line: 21, column: 71, scope: !13)
!19 = !DILocalVariable(name: "source", scope: !20, file: !14, line: 24, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 23, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 10)
!24 = !DILocation(line: 24, column: 13, scope: !20)
!25 = !DILocalVariable(name: "i", scope: !20, file: !14, line: 25, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 25, column: 16, scope: !20)
!30 = !DILocation(line: 27, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !14, line: 27, column: 9)
!32 = !DILocation(line: 27, column: 14, scope: !31)
!33 = !DILocation(line: 27, column: 21, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !14, line: 27, column: 9)
!35 = !DILocation(line: 27, column: 23, scope: !34)
!36 = !DILocation(line: 27, column: 9, scope: !31)
!37 = !DILocation(line: 29, column: 30, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !14, line: 28, column: 9)
!39 = !DILocation(line: 29, column: 23, scope: !38)
!40 = !DILocation(line: 29, column: 13, scope: !38)
!41 = !DILocation(line: 29, column: 18, scope: !38)
!42 = !DILocation(line: 29, column: 21, scope: !38)
!43 = !DILocation(line: 30, column: 9, scope: !38)
!44 = !DILocation(line: 27, column: 30, scope: !34)
!45 = !DILocation(line: 27, column: 9, scope: !34)
!46 = distinct !{!46, !36, !47, !48}
!47 = !DILocation(line: 30, column: 9, scope: !31)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 31, column: 22, scope: !20)
!50 = !DILocation(line: 31, column: 9, scope: !20)
!51 = !DILocation(line: 33, column: 1, scope: !13)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_bad", scope: !14, file: !14, line: 35, type: !53, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{null}
!55 = !DILocalVariable(name: "data", scope: !52, file: !14, line: 37, type: !4)
!56 = !DILocation(line: 37, column: 11, scope: !52)
!57 = !DILocation(line: 38, column: 10, scope: !52)
!58 = !DILocation(line: 40, column: 19, scope: !52)
!59 = !DILocation(line: 40, column: 12, scope: !52)
!60 = !DILocation(line: 40, column: 10, scope: !52)
!61 = !DILocation(line: 41, column: 64, scope: !52)
!62 = !DILocation(line: 41, column: 5, scope: !52)
!63 = !DILocation(line: 42, column: 1, scope: !52)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_goodG2BSink", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", arg: 1, scope: !64, file: !14, line: 48, type: !4)
!66 = !DILocation(line: 48, column: 75, scope: !64)
!67 = !DILocalVariable(name: "source", scope: !68, file: !14, line: 51, type: !21)
!68 = distinct !DILexicalBlock(scope: !64, file: !14, line: 50, column: 5)
!69 = !DILocation(line: 51, column: 13, scope: !68)
!70 = !DILocalVariable(name: "i", scope: !68, file: !14, line: 52, type: !26)
!71 = !DILocation(line: 52, column: 16, scope: !68)
!72 = !DILocation(line: 54, column: 16, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !14, line: 54, column: 9)
!74 = !DILocation(line: 54, column: 14, scope: !73)
!75 = !DILocation(line: 54, column: 21, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !14, line: 54, column: 9)
!77 = !DILocation(line: 54, column: 23, scope: !76)
!78 = !DILocation(line: 54, column: 9, scope: !73)
!79 = !DILocation(line: 56, column: 30, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !14, line: 55, column: 9)
!81 = !DILocation(line: 56, column: 23, scope: !80)
!82 = !DILocation(line: 56, column: 13, scope: !80)
!83 = !DILocation(line: 56, column: 18, scope: !80)
!84 = !DILocation(line: 56, column: 21, scope: !80)
!85 = !DILocation(line: 57, column: 9, scope: !80)
!86 = !DILocation(line: 54, column: 30, scope: !76)
!87 = !DILocation(line: 54, column: 9, scope: !76)
!88 = distinct !{!88, !78, !89, !48}
!89 = !DILocation(line: 57, column: 9, scope: !73)
!90 = !DILocation(line: 58, column: 22, scope: !68)
!91 = !DILocation(line: 58, column: 9, scope: !68)
!92 = !DILocation(line: 60, column: 1, scope: !64)
!93 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_good", scope: !14, file: !14, line: 72, type: !53, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 74, column: 5, scope: !93)
!95 = !DILocation(line: 75, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !97, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!5, !5, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !14, line: 87, type: !5)
!103 = !DILocation(line: 87, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !14, line: 87, type: !99)
!105 = !DILocation(line: 87, column: 27, scope: !96)
!106 = !DILocation(line: 90, column: 22, scope: !96)
!107 = !DILocation(line: 90, column: 12, scope: !96)
!108 = !DILocation(line: 90, column: 5, scope: !96)
!109 = !DILocation(line: 92, column: 5, scope: !96)
!110 = !DILocation(line: 93, column: 5, scope: !96)
!111 = !DILocation(line: 94, column: 5, scope: !96)
!112 = !DILocation(line: 97, column: 5, scope: !96)
!113 = !DILocation(line: 98, column: 5, scope: !96)
!114 = !DILocation(line: 99, column: 5, scope: !96)
!115 = !DILocation(line: 101, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 63, type: !53, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !14, line: 65, type: !4)
!118 = !DILocation(line: 65, column: 11, scope: !116)
!119 = !DILocation(line: 66, column: 10, scope: !116)
!120 = !DILocation(line: 68, column: 19, scope: !116)
!121 = !DILocation(line: 68, column: 12, scope: !116)
!122 = !DILocation(line: 68, column: 10, scope: !116)
!123 = !DILocation(line: 69, column: 68, scope: !116)
!124 = !DILocation(line: 69, column: 5, scope: !116)
!125 = !DILocation(line: 70, column: 1, scope: !116)
