; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = load i32*, i32** %data, align 8, !dbg !20
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61b_badSource(i32* %0), !dbg !21
  store i32* %call, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %2, 10, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !43
  %4 = load i32, i32* %arrayidx, align 4, !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !44
  %6 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !44
  store i32 %4, i32* %arrayidx1, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %7, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !53
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !53
  call void @printIntLine(i32 %9), !dbg !54
  %10 = load i32*, i32** %data, align 8, !dbg !55
  %11 = bitcast i32* %10 to i8*, !dbg !55
  call void @free(i8* %11) #5, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32* null, i32** %data, align 8, !dbg !84
  %0 = load i32*, i32** %data, align 8, !dbg !85
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61b_goodG2BSource(i32* %0), !dbg !86
  store i32* %call, i32** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !90
  call void @llvm.dbg.declare(metadata i64* %i, metadata !91, metadata !DIExpression()), !dbg !92
  store i64 0, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !96
  %cmp = icmp ult i64 %2, 10, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !102
  %4 = load i32, i32* %arrayidx, align 4, !dbg !102
  %5 = load i32*, i32** %data, align 8, !dbg !103
  %6 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !103
  store i32 %4, i32* %arrayidx1, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %7, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !111
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !111
  call void @printIntLine(i32 %9), !dbg !112
  %10 = load i32*, i32** %data, align 8, !dbg !113
  %11 = bitcast i32* %10 to i8*, !dbg !113
  call void @free(i8* %11) #5, !dbg !114
  ret void, !dbg !115
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61_bad", scope: !12, file: !12, line: 24, type: !13, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 11, scope: !11)
!19 = !DILocation(line: 27, column: 10, scope: !11)
!20 = !DILocation(line: 28, column: 73, scope: !11)
!21 = !DILocation(line: 28, column: 12, scope: !11)
!22 = !DILocation(line: 28, column: 10, scope: !11)
!23 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 30, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 30, column: 13, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !24, file: !12, line: 31, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 31, column: 16, scope: !24)
!34 = !DILocation(line: 33, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !24, file: !12, line: 33, column: 9)
!36 = !DILocation(line: 33, column: 14, scope: !35)
!37 = !DILocation(line: 33, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !12, line: 33, column: 9)
!39 = !DILocation(line: 33, column: 23, scope: !38)
!40 = !DILocation(line: 33, column: 9, scope: !35)
!41 = !DILocation(line: 35, column: 30, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 34, column: 9)
!43 = !DILocation(line: 35, column: 23, scope: !42)
!44 = !DILocation(line: 35, column: 13, scope: !42)
!45 = !DILocation(line: 35, column: 18, scope: !42)
!46 = !DILocation(line: 35, column: 21, scope: !42)
!47 = !DILocation(line: 36, column: 9, scope: !42)
!48 = !DILocation(line: 33, column: 30, scope: !38)
!49 = !DILocation(line: 33, column: 9, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 36, column: 9, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 37, column: 22, scope: !24)
!54 = !DILocation(line: 37, column: 9, scope: !24)
!55 = !DILocation(line: 38, column: 14, scope: !24)
!56 = !DILocation(line: 38, column: 9, scope: !24)
!57 = !DILocation(line: 40, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_61_good", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 69, column: 5, scope: !58)
!60 = !DILocation(line: 70, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !62, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!17, !17, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 82, type: !17)
!68 = !DILocation(line: 82, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 82, type: !64)
!70 = !DILocation(line: 82, column: 27, scope: !61)
!71 = !DILocation(line: 85, column: 22, scope: !61)
!72 = !DILocation(line: 85, column: 12, scope: !61)
!73 = !DILocation(line: 85, column: 5, scope: !61)
!74 = !DILocation(line: 87, column: 5, scope: !61)
!75 = !DILocation(line: 88, column: 5, scope: !61)
!76 = !DILocation(line: 89, column: 5, scope: !61)
!77 = !DILocation(line: 92, column: 5, scope: !61)
!78 = !DILocation(line: 93, column: 5, scope: !61)
!79 = !DILocation(line: 94, column: 5, scope: !61)
!80 = !DILocation(line: 96, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 51, type: !16)
!83 = !DILocation(line: 51, column: 11, scope: !81)
!84 = !DILocation(line: 52, column: 10, scope: !81)
!85 = !DILocation(line: 53, column: 77, scope: !81)
!86 = !DILocation(line: 53, column: 12, scope: !81)
!87 = !DILocation(line: 53, column: 10, scope: !81)
!88 = !DILocalVariable(name: "source", scope: !89, file: !12, line: 55, type: !25)
!89 = distinct !DILexicalBlock(scope: !81, file: !12, line: 54, column: 5)
!90 = !DILocation(line: 55, column: 13, scope: !89)
!91 = !DILocalVariable(name: "i", scope: !89, file: !12, line: 56, type: !30)
!92 = !DILocation(line: 56, column: 16, scope: !89)
!93 = !DILocation(line: 58, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !12, line: 58, column: 9)
!95 = !DILocation(line: 58, column: 14, scope: !94)
!96 = !DILocation(line: 58, column: 21, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !12, line: 58, column: 9)
!98 = !DILocation(line: 58, column: 23, scope: !97)
!99 = !DILocation(line: 58, column: 9, scope: !94)
!100 = !DILocation(line: 60, column: 30, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 59, column: 9)
!102 = !DILocation(line: 60, column: 23, scope: !101)
!103 = !DILocation(line: 60, column: 13, scope: !101)
!104 = !DILocation(line: 60, column: 18, scope: !101)
!105 = !DILocation(line: 60, column: 21, scope: !101)
!106 = !DILocation(line: 61, column: 9, scope: !101)
!107 = !DILocation(line: 58, column: 30, scope: !97)
!108 = !DILocation(line: 58, column: 9, scope: !97)
!109 = distinct !{!109, !99, !110, !52}
!110 = !DILocation(line: 61, column: 9, scope: !94)
!111 = !DILocation(line: 62, column: 22, scope: !89)
!112 = !DILocation(line: 62, column: 9, scope: !89)
!113 = !DILocation(line: 63, column: 14, scope: !89)
!114 = !DILocation(line: 63, column: 9, scope: !89)
!115 = !DILocation(line: 65, column: 1, scope: !81)
