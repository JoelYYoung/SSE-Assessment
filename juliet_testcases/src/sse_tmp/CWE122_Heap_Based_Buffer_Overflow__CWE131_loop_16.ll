; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !32

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %while.end
  %3 = load i64, i64* %i, align 8, !dbg !47
  %cmp1 = icmp ult i64 %3, 10, !dbg !49
  br i1 %cmp1, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !53
  %5 = load i32, i32* %arrayidx, align 4, !dbg !53
  %6 = load i32*, i32** %data, align 8, !dbg !54
  %7 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !54
  store i32 %5, i32* %arrayidx2, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %8, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !63
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !63
  call void @printIntLine(i32 %10), !dbg !64
  %11 = load i32*, i32** %data, align 8, !dbg !65
  %12 = bitcast i32* %11 to i8*, !dbg !65
  call void @free(i8* %12) #6, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  br label %while.body, !dbg !95

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !96
  %0 = bitcast i8* %call to i32*, !dbg !98
  store i32* %0, i32** %data, align 8, !dbg !99
  %1 = load i32*, i32** %data, align 8, !dbg !100
  %cmp = icmp eq i32* %1, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !106

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %while.end
  %3 = load i64, i64* %i, align 8, !dbg !115
  %cmp1 = icmp ult i64 %3, 10, !dbg !117
  br i1 %cmp1, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !121
  %5 = load i32, i32* %arrayidx, align 4, !dbg !121
  %6 = load i32*, i32** %data, align 8, !dbg !122
  %7 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !122
  store i32 %5, i32* %arrayidx2, align 4, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %8, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !130
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !130
  call void @printIntLine(i32 %10), !dbg !131
  %11 = load i32*, i32** %data, align 8, !dbg !132
  %12 = bitcast i32* %11 to i8*, !dbg !132
  call void @free(i8* %12) #6, !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 25, column: 5, scope: !14)
!22 = !DILocation(line: 28, column: 23, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 26, column: 5)
!24 = !DILocation(line: 28, column: 16, scope: !23)
!25 = !DILocation(line: 28, column: 14, scope: !23)
!26 = !DILocation(line: 29, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 29, column: 13)
!28 = !DILocation(line: 29, column: 18, scope: !27)
!29 = !DILocation(line: 29, column: 13, scope: !23)
!30 = !DILocation(line: 29, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 29, column: 27)
!32 = !DILocation(line: 30, column: 9, scope: !23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 33, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 33, column: 13, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !15, line: 34, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 34, column: 16, scope: !34)
!44 = !DILocation(line: 36, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !15, line: 36, column: 9)
!46 = !DILocation(line: 36, column: 14, scope: !45)
!47 = !DILocation(line: 36, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !15, line: 36, column: 9)
!49 = !DILocation(line: 36, column: 23, scope: !48)
!50 = !DILocation(line: 36, column: 9, scope: !45)
!51 = !DILocation(line: 38, column: 30, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 37, column: 9)
!53 = !DILocation(line: 38, column: 23, scope: !52)
!54 = !DILocation(line: 38, column: 13, scope: !52)
!55 = !DILocation(line: 38, column: 18, scope: !52)
!56 = !DILocation(line: 38, column: 21, scope: !52)
!57 = !DILocation(line: 39, column: 9, scope: !52)
!58 = !DILocation(line: 36, column: 30, scope: !48)
!59 = !DILocation(line: 36, column: 9, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 39, column: 9, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 40, column: 22, scope: !34)
!64 = !DILocation(line: 40, column: 9, scope: !34)
!65 = !DILocation(line: 41, column: 14, scope: !34)
!66 = !DILocation(line: 41, column: 9, scope: !34)
!67 = !DILocation(line: 43, column: 1, scope: !14)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_16_good", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 76, column: 5, scope: !68)
!70 = !DILocation(line: 77, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 89, type: !72, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!5, !5, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 89, type: !5)
!78 = !DILocation(line: 89, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 89, type: !74)
!80 = !DILocation(line: 89, column: 27, scope: !71)
!81 = !DILocation(line: 92, column: 22, scope: !71)
!82 = !DILocation(line: 92, column: 12, scope: !71)
!83 = !DILocation(line: 92, column: 5, scope: !71)
!84 = !DILocation(line: 94, column: 5, scope: !71)
!85 = !DILocation(line: 95, column: 5, scope: !71)
!86 = !DILocation(line: 96, column: 5, scope: !71)
!87 = !DILocation(line: 99, column: 5, scope: !71)
!88 = !DILocation(line: 100, column: 5, scope: !71)
!89 = !DILocation(line: 101, column: 5, scope: !71)
!90 = !DILocation(line: 103, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !15, line: 52, type: !4)
!93 = !DILocation(line: 52, column: 11, scope: !91)
!94 = !DILocation(line: 53, column: 10, scope: !91)
!95 = !DILocation(line: 54, column: 5, scope: !91)
!96 = !DILocation(line: 57, column: 23, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !15, line: 55, column: 5)
!98 = !DILocation(line: 57, column: 16, scope: !97)
!99 = !DILocation(line: 57, column: 14, scope: !97)
!100 = !DILocation(line: 58, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 58, column: 13)
!102 = !DILocation(line: 58, column: 18, scope: !101)
!103 = !DILocation(line: 58, column: 13, scope: !97)
!104 = !DILocation(line: 58, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 58, column: 27)
!106 = !DILocation(line: 59, column: 9, scope: !97)
!107 = !DILocalVariable(name: "source", scope: !108, file: !15, line: 62, type: !35)
!108 = distinct !DILexicalBlock(scope: !91, file: !15, line: 61, column: 5)
!109 = !DILocation(line: 62, column: 13, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !108, file: !15, line: 63, type: !40)
!111 = !DILocation(line: 63, column: 16, scope: !108)
!112 = !DILocation(line: 65, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !15, line: 65, column: 9)
!114 = !DILocation(line: 65, column: 14, scope: !113)
!115 = !DILocation(line: 65, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !15, line: 65, column: 9)
!117 = !DILocation(line: 65, column: 23, scope: !116)
!118 = !DILocation(line: 65, column: 9, scope: !113)
!119 = !DILocation(line: 67, column: 30, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 66, column: 9)
!121 = !DILocation(line: 67, column: 23, scope: !120)
!122 = !DILocation(line: 67, column: 13, scope: !120)
!123 = !DILocation(line: 67, column: 18, scope: !120)
!124 = !DILocation(line: 67, column: 21, scope: !120)
!125 = !DILocation(line: 68, column: 9, scope: !120)
!126 = !DILocation(line: 65, column: 30, scope: !116)
!127 = !DILocation(line: 65, column: 9, scope: !116)
!128 = distinct !{!128, !118, !129, !62}
!129 = !DILocation(line: 68, column: 9, scope: !113)
!130 = !DILocation(line: 69, column: 22, scope: !108)
!131 = !DILocation(line: 69, column: 9, scope: !108)
!132 = !DILocation(line: 70, column: 14, scope: !108)
!133 = !DILocation(line: 70, column: 9, scope: !108)
!134 = !DILocation(line: 72, column: 1, scope: !91)
