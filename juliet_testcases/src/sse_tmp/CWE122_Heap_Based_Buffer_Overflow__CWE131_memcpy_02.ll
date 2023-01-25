; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %4 = bitcast i32* %3 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !39
  %5 = bitcast i32* %arraydecay to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !40
  %7 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 %7), !dbg !41
  %8 = load i32*, i32** %data, align 8, !dbg !42
  %9 = bitcast i32* %8 to i8*, !dbg !42
  call void @free(i8* %9) #7, !dbg !43
  ret void, !dbg !44
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #7, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #7, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32* null, i32** %data, align 8, !dbg !72
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !73
  %0 = bitcast i8* %call to i32*, !dbg !76
  store i32* %0, i32** %data, align 8, !dbg !77
  %1 = load i32*, i32** %data, align 8, !dbg !78
  %cmp = icmp eq i32* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !86
  %3 = load i32*, i32** %data, align 8, !dbg !87
  %4 = bitcast i32* %3 to i8*, !dbg !88
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !88
  %5 = bitcast i32* %arraydecay to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !88
  %6 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !89
  %7 = load i32, i32* %arrayidx, align 4, !dbg !89
  call void @printIntLine(i32 %7), !dbg !90
  %8 = load i32*, i32** %data, align 8, !dbg !91
  %9 = bitcast i32* %8 to i8*, !dbg !91
  call void @free(i8* %9) #7, !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !98
  %0 = bitcast i8* %call to i32*, !dbg !101
  store i32* %0, i32** %data, align 8, !dbg !102
  %1 = load i32*, i32** %data, align 8, !dbg !103
  %cmp = icmp eq i32* %1, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !111
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %4 = bitcast i32* %3 to i8*, !dbg !113
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !113
  %5 = bitcast i32* %arraydecay to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !114
  %7 = load i32, i32* %arrayidx, align 4, !dbg !114
  call void @printIntLine(i32 %7), !dbg !115
  %8 = load i32*, i32** %data, align 8, !dbg !116
  %9 = bitcast i32* %8 to i8*, !dbg !116
  call void @free(i8* %9) #7, !dbg !117
  ret void, !dbg !118
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 23, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 26, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 8)
!24 = !DILocation(line: 28, column: 16, scope: !22)
!25 = !DILocation(line: 28, column: 14, scope: !22)
!26 = !DILocation(line: 29, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !15, line: 29, column: 13)
!28 = !DILocation(line: 29, column: 18, scope: !27)
!29 = !DILocation(line: 29, column: 13, scope: !22)
!30 = !DILocation(line: 29, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 29, column: 27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !15, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 32, column: 13, scope: !33)
!38 = !DILocation(line: 34, column: 16, scope: !33)
!39 = !DILocation(line: 34, column: 9, scope: !33)
!40 = !DILocation(line: 35, column: 22, scope: !33)
!41 = !DILocation(line: 35, column: 9, scope: !33)
!42 = !DILocation(line: 36, column: 14, scope: !33)
!43 = !DILocation(line: 36, column: 9, scope: !33)
!44 = !DILocation(line: 38, column: 1, scope: !14)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_good", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 91, column: 5, scope: !45)
!47 = !DILocation(line: 92, column: 5, scope: !45)
!48 = !DILocation(line: 93, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !50, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!5, !5, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !15, line: 105, type: !5)
!56 = !DILocation(line: 105, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !15, line: 105, type: !52)
!58 = !DILocation(line: 105, column: 27, scope: !49)
!59 = !DILocation(line: 108, column: 22, scope: !49)
!60 = !DILocation(line: 108, column: 12, scope: !49)
!61 = !DILocation(line: 108, column: 5, scope: !49)
!62 = !DILocation(line: 110, column: 5, scope: !49)
!63 = !DILocation(line: 111, column: 5, scope: !49)
!64 = !DILocation(line: 112, column: 5, scope: !49)
!65 = !DILocation(line: 115, column: 5, scope: !49)
!66 = !DILocation(line: 116, column: 5, scope: !49)
!67 = !DILocation(line: 117, column: 5, scope: !49)
!68 = !DILocation(line: 119, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 47, type: !4)
!71 = !DILocation(line: 47, column: 11, scope: !69)
!72 = !DILocation(line: 48, column: 10, scope: !69)
!73 = !DILocation(line: 57, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !15, line: 55, column: 5)
!75 = distinct !DILexicalBlock(scope: !69, file: !15, line: 49, column: 8)
!76 = !DILocation(line: 57, column: 16, scope: !74)
!77 = !DILocation(line: 57, column: 14, scope: !74)
!78 = !DILocation(line: 58, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !15, line: 58, column: 13)
!80 = !DILocation(line: 58, column: 18, scope: !79)
!81 = !DILocation(line: 58, column: 13, scope: !74)
!82 = !DILocation(line: 58, column: 28, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 58, column: 27)
!84 = !DILocalVariable(name: "source", scope: !85, file: !15, line: 61, type: !34)
!85 = distinct !DILexicalBlock(scope: !69, file: !15, line: 60, column: 5)
!86 = !DILocation(line: 61, column: 13, scope: !85)
!87 = !DILocation(line: 63, column: 16, scope: !85)
!88 = !DILocation(line: 63, column: 9, scope: !85)
!89 = !DILocation(line: 64, column: 22, scope: !85)
!90 = !DILocation(line: 64, column: 9, scope: !85)
!91 = !DILocation(line: 65, column: 14, scope: !85)
!92 = !DILocation(line: 65, column: 9, scope: !85)
!93 = !DILocation(line: 67, column: 1, scope: !69)
!94 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 72, type: !4)
!96 = !DILocation(line: 72, column: 11, scope: !94)
!97 = !DILocation(line: 73, column: 10, scope: !94)
!98 = !DILocation(line: 77, column: 23, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !15, line: 75, column: 5)
!100 = distinct !DILexicalBlock(scope: !94, file: !15, line: 74, column: 8)
!101 = !DILocation(line: 77, column: 16, scope: !99)
!102 = !DILocation(line: 77, column: 14, scope: !99)
!103 = !DILocation(line: 78, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !15, line: 78, column: 13)
!105 = !DILocation(line: 78, column: 18, scope: !104)
!106 = !DILocation(line: 78, column: 13, scope: !99)
!107 = !DILocation(line: 78, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 78, column: 27)
!109 = !DILocalVariable(name: "source", scope: !110, file: !15, line: 81, type: !34)
!110 = distinct !DILexicalBlock(scope: !94, file: !15, line: 80, column: 5)
!111 = !DILocation(line: 81, column: 13, scope: !110)
!112 = !DILocation(line: 83, column: 16, scope: !110)
!113 = !DILocation(line: 83, column: 9, scope: !110)
!114 = !DILocation(line: 84, column: 22, scope: !110)
!115 = !DILocation(line: 84, column: 9, scope: !110)
!116 = !DILocation(line: 85, column: 14, scope: !110)
!117 = !DILocation(line: 85, column: 9, scope: !110)
!118 = !DILocation(line: 87, column: 1, scope: !94)
