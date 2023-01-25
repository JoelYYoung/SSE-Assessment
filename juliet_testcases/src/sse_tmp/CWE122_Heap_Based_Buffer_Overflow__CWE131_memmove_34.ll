; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion to i32**, !dbg !38
  store i32* %2, i32** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion to i32**, !dbg !43
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !43
  store i32* %3, i32** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !49
  %5 = load i32*, i32** %data1, align 8, !dbg !50
  %6 = bitcast i32* %5 to i8*, !dbg !51
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !51
  %7 = bitcast i32* %arraydecay to i8*, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !51
  %8 = load i32*, i32** %data1, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !52
  %9 = load i32, i32* %arrayidx, align 4, !dbg !52
  call void @printIntLine(i32 %9), !dbg !53
  %10 = load i32*, i32** %data1, align 8, !dbg !54
  %11 = bitcast i32* %10 to i8*, !dbg !54
  call void @free(i8* %11) #7, !dbg !55
  ret void, !dbg !56
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
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
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
  %call = call i64 @time(i64* null) #7, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #7, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !95
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion to i32**, !dbg !96
  store i32* %2, i32** %unionFirst, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !98, metadata !DIExpression()), !dbg !100
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion to i32**, !dbg !101
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !101
  store i32* %3, i32** %data1, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !104
  %5 = load i32*, i32** %data1, align 8, !dbg !105
  %6 = bitcast i32* %5 to i8*, !dbg !106
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !106
  %7 = bitcast i32* %arraydecay to i8*, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !106
  %8 = load i32*, i32** %data1, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !107
  %9 = load i32, i32* %arrayidx, align 4, !dbg !107
  call void @printIntLine(i32 %9), !dbg !108
  %10 = load i32*, i32** %data1, align 8, !dbg !109
  %11 = bitcast i32* %10 to i8*, !dbg !109
  call void @free(i8* %11) #7, !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 29, type: !4)
!19 = !DILocation(line: 29, column: 11, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 30, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType", file: !15, line: 23, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 19, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 21, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 22, baseType: !4, size: 64)
!26 = !DILocation(line: 30, column: 68, scope: !14)
!27 = !DILocation(line: 31, column: 10, scope: !14)
!28 = !DILocation(line: 33, column: 19, scope: !14)
!29 = !DILocation(line: 33, column: 12, scope: !14)
!30 = !DILocation(line: 33, column: 10, scope: !14)
!31 = !DILocation(line: 34, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!33 = !DILocation(line: 34, column: 14, scope: !32)
!34 = !DILocation(line: 34, column: 9, scope: !14)
!35 = !DILocation(line: 34, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 34, column: 23)
!37 = !DILocation(line: 35, column: 26, scope: !14)
!38 = !DILocation(line: 35, column: 13, scope: !14)
!39 = !DILocation(line: 35, column: 24, scope: !14)
!40 = !DILocalVariable(name: "data", scope: !41, file: !15, line: 37, type: !4)
!41 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 5)
!42 = !DILocation(line: 37, column: 15, scope: !41)
!43 = !DILocation(line: 37, column: 30, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !15, line: 39, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 38, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 10)
!49 = !DILocation(line: 39, column: 17, scope: !45)
!50 = !DILocation(line: 41, column: 21, scope: !45)
!51 = !DILocation(line: 41, column: 13, scope: !45)
!52 = !DILocation(line: 42, column: 26, scope: !45)
!53 = !DILocation(line: 42, column: 13, scope: !45)
!54 = !DILocation(line: 43, column: 18, scope: !45)
!55 = !DILocation(line: 43, column: 13, scope: !45)
!56 = !DILocation(line: 46, column: 1, scope: !14)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_good", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 76, column: 5, scope: !57)
!59 = !DILocation(line: 77, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 88, type: !61, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!5, !5, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 88, type: !5)
!67 = !DILocation(line: 88, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 88, type: !63)
!69 = !DILocation(line: 88, column: 27, scope: !60)
!70 = !DILocation(line: 91, column: 22, scope: !60)
!71 = !DILocation(line: 91, column: 12, scope: !60)
!72 = !DILocation(line: 91, column: 5, scope: !60)
!73 = !DILocation(line: 93, column: 5, scope: !60)
!74 = !DILocation(line: 94, column: 5, scope: !60)
!75 = !DILocation(line: 95, column: 5, scope: !60)
!76 = !DILocation(line: 98, column: 5, scope: !60)
!77 = !DILocation(line: 99, column: 5, scope: !60)
!78 = !DILocation(line: 100, column: 5, scope: !60)
!79 = !DILocation(line: 102, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 55, type: !4)
!82 = !DILocation(line: 55, column: 11, scope: !80)
!83 = !DILocalVariable(name: "myUnion", scope: !80, file: !15, line: 56, type: !21)
!84 = !DILocation(line: 56, column: 68, scope: !80)
!85 = !DILocation(line: 57, column: 10, scope: !80)
!86 = !DILocation(line: 59, column: 19, scope: !80)
!87 = !DILocation(line: 59, column: 12, scope: !80)
!88 = !DILocation(line: 59, column: 10, scope: !80)
!89 = !DILocation(line: 60, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !15, line: 60, column: 9)
!91 = !DILocation(line: 60, column: 14, scope: !90)
!92 = !DILocation(line: 60, column: 9, scope: !80)
!93 = !DILocation(line: 60, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 60, column: 23)
!95 = !DILocation(line: 61, column: 26, scope: !80)
!96 = !DILocation(line: 61, column: 13, scope: !80)
!97 = !DILocation(line: 61, column: 24, scope: !80)
!98 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 63, type: !4)
!99 = distinct !DILexicalBlock(scope: !80, file: !15, line: 62, column: 5)
!100 = !DILocation(line: 63, column: 15, scope: !99)
!101 = !DILocation(line: 63, column: 30, scope: !99)
!102 = !DILocalVariable(name: "source", scope: !103, file: !15, line: 65, type: !46)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 64, column: 9)
!104 = !DILocation(line: 65, column: 17, scope: !103)
!105 = !DILocation(line: 67, column: 21, scope: !103)
!106 = !DILocation(line: 67, column: 13, scope: !103)
!107 = !DILocation(line: 68, column: 26, scope: !103)
!108 = !DILocation(line: 68, column: 13, scope: !103)
!109 = !DILocation(line: 69, column: 18, scope: !103)
!110 = !DILocation(line: 69, column: 13, scope: !103)
!111 = !DILocation(line: 72, column: 1, scope: !80)
