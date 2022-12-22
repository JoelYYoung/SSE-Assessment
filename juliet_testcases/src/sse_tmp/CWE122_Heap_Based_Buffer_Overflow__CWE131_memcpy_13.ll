; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !25
  %1 = bitcast i8* %call to i32*, !dbg !27
  store i32* %1, i32** %data, align 8, !dbg !28
  %2 = load i32*, i32** %data, align 8, !dbg !29
  %cmp1 = icmp eq i32* %2, null, !dbg !31
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !32

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %5 = bitcast i32* %4 to i8*, !dbg !43
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !43
  %6 = bitcast i32* %arraydecay to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !43
  %7 = load i32*, i32** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !44
  %8 = load i32, i32* %arrayidx, align 4, !dbg !44
  call void @printIntLine(i32 %8), !dbg !45
  %9 = load i32*, i32** %data, align 8, !dbg !46
  %10 = bitcast i32* %9 to i8*, !dbg !46
  call void @free(i8* %10) #7, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #7, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #7, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i32* null, i32** %data, align 8, !dbg !76
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !77
  %cmp = icmp ne i32 %0, 5, !dbg !79
  br i1 %cmp, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  br label %if.end3, !dbg !83

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !84
  %1 = bitcast i8* %call to i32*, !dbg !86
  store i32* %1, i32** %data, align 8, !dbg !87
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %cmp1 = icmp eq i32* %2, null, !dbg !90
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !91

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !96
  %4 = load i32*, i32** %data, align 8, !dbg !97
  %5 = bitcast i32* %4 to i8*, !dbg !98
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !98
  %6 = bitcast i32* %arraydecay to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !98
  %7 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !99
  %8 = load i32, i32* %arrayidx, align 4, !dbg !99
  call void @printIntLine(i32 %8), !dbg !100
  %9 = load i32*, i32** %data, align 8, !dbg !101
  %10 = bitcast i32* %9 to i8*, !dbg !101
  call void @free(i8* %10) #7, !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i32* null, i32** %data, align 8, !dbg !107
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !108
  %cmp = icmp eq i32 %0, 5, !dbg !110
  br i1 %cmp, label %if.then, label %if.end3, !dbg !111

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !112
  %1 = bitcast i8* %call to i32*, !dbg !114
  store i32* %1, i32** %data, align 8, !dbg !115
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %cmp1 = icmp eq i32* %2, null, !dbg !118
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !119

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !122

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !125
  %4 = load i32*, i32** %data, align 8, !dbg !126
  %5 = bitcast i32* %4 to i8*, !dbg !127
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !127
  %6 = bitcast i32* %arraydecay to i8*, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !127
  %7 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !128
  %8 = load i32, i32* %arrayidx, align 4, !dbg !128
  call void @printIntLine(i32 %8), !dbg !129
  %9 = load i32*, i32** %data, align 8, !dbg !130
  %10 = bitcast i32* %9 to i8*, !dbg !130
  call void @free(i8* %10) #7, !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 25, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 8)
!23 = !DILocation(line: 25, column: 25, scope: !22)
!24 = !DILocation(line: 25, column: 8, scope: !14)
!25 = !DILocation(line: 28, column: 23, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 26, column: 5)
!27 = !DILocation(line: 28, column: 16, scope: !26)
!28 = !DILocation(line: 28, column: 14, scope: !26)
!29 = !DILocation(line: 29, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 13)
!31 = !DILocation(line: 29, column: 18, scope: !30)
!32 = !DILocation(line: 29, column: 13, scope: !26)
!33 = !DILocation(line: 29, column: 28, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 29, column: 27)
!35 = !DILocation(line: 30, column: 5, scope: !26)
!36 = !DILocalVariable(name: "source", scope: !37, file: !15, line: 32, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 10)
!41 = !DILocation(line: 32, column: 13, scope: !37)
!42 = !DILocation(line: 34, column: 16, scope: !37)
!43 = !DILocation(line: 34, column: 9, scope: !37)
!44 = !DILocation(line: 35, column: 22, scope: !37)
!45 = !DILocation(line: 35, column: 9, scope: !37)
!46 = !DILocation(line: 36, column: 14, scope: !37)
!47 = !DILocation(line: 36, column: 9, scope: !37)
!48 = !DILocation(line: 38, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_13_good", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 91, column: 5, scope: !49)
!51 = !DILocation(line: 92, column: 5, scope: !49)
!52 = !DILocation(line: 93, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !54, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!5, !5, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 105, type: !5)
!60 = !DILocation(line: 105, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 105, type: !56)
!62 = !DILocation(line: 105, column: 27, scope: !53)
!63 = !DILocation(line: 108, column: 22, scope: !53)
!64 = !DILocation(line: 108, column: 12, scope: !53)
!65 = !DILocation(line: 108, column: 5, scope: !53)
!66 = !DILocation(line: 110, column: 5, scope: !53)
!67 = !DILocation(line: 111, column: 5, scope: !53)
!68 = !DILocation(line: 112, column: 5, scope: !53)
!69 = !DILocation(line: 115, column: 5, scope: !53)
!70 = !DILocation(line: 116, column: 5, scope: !53)
!71 = !DILocation(line: 117, column: 5, scope: !53)
!72 = !DILocation(line: 119, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 47, type: !4)
!75 = !DILocation(line: 47, column: 11, scope: !73)
!76 = !DILocation(line: 48, column: 10, scope: !73)
!77 = !DILocation(line: 49, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !15, line: 49, column: 8)
!79 = !DILocation(line: 49, column: 25, scope: !78)
!80 = !DILocation(line: 49, column: 8, scope: !73)
!81 = !DILocation(line: 52, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 50, column: 5)
!83 = !DILocation(line: 53, column: 5, scope: !82)
!84 = !DILocation(line: 57, column: 23, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !15, line: 55, column: 5)
!86 = !DILocation(line: 57, column: 16, scope: !85)
!87 = !DILocation(line: 57, column: 14, scope: !85)
!88 = !DILocation(line: 58, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 58, column: 13)
!90 = !DILocation(line: 58, column: 18, scope: !89)
!91 = !DILocation(line: 58, column: 13, scope: !85)
!92 = !DILocation(line: 58, column: 28, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 58, column: 27)
!94 = !DILocalVariable(name: "source", scope: !95, file: !15, line: 61, type: !38)
!95 = distinct !DILexicalBlock(scope: !73, file: !15, line: 60, column: 5)
!96 = !DILocation(line: 61, column: 13, scope: !95)
!97 = !DILocation(line: 63, column: 16, scope: !95)
!98 = !DILocation(line: 63, column: 9, scope: !95)
!99 = !DILocation(line: 64, column: 22, scope: !95)
!100 = !DILocation(line: 64, column: 9, scope: !95)
!101 = !DILocation(line: 65, column: 14, scope: !95)
!102 = !DILocation(line: 65, column: 9, scope: !95)
!103 = !DILocation(line: 67, column: 1, scope: !73)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 72, type: !4)
!106 = !DILocation(line: 72, column: 11, scope: !104)
!107 = !DILocation(line: 73, column: 10, scope: !104)
!108 = !DILocation(line: 74, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !15, line: 74, column: 8)
!110 = !DILocation(line: 74, column: 25, scope: !109)
!111 = !DILocation(line: 74, column: 8, scope: !104)
!112 = !DILocation(line: 77, column: 23, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 75, column: 5)
!114 = !DILocation(line: 77, column: 16, scope: !113)
!115 = !DILocation(line: 77, column: 14, scope: !113)
!116 = !DILocation(line: 78, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 78, column: 13)
!118 = !DILocation(line: 78, column: 18, scope: !117)
!119 = !DILocation(line: 78, column: 13, scope: !113)
!120 = !DILocation(line: 78, column: 28, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 78, column: 27)
!122 = !DILocation(line: 79, column: 5, scope: !113)
!123 = !DILocalVariable(name: "source", scope: !124, file: !15, line: 81, type: !38)
!124 = distinct !DILexicalBlock(scope: !104, file: !15, line: 80, column: 5)
!125 = !DILocation(line: 81, column: 13, scope: !124)
!126 = !DILocation(line: 83, column: 16, scope: !124)
!127 = !DILocation(line: 83, column: 9, scope: !124)
!128 = !DILocation(line: 84, column: 22, scope: !124)
!129 = !DILocation(line: 84, column: 9, scope: !124)
!130 = !DILocation(line: 85, column: 14, scope: !124)
!131 = !DILocation(line: 85, column: 9, scope: !124)
!132 = !DILocation(line: 87, column: 1, scope: !104)
