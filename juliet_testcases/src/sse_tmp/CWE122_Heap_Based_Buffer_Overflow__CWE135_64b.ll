; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_64b_badSink(i8* %dataVoidPtr) #0 !dbg !18 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !26
  %1 = bitcast i8* %0 to i8**, !dbg !27
  store i8** %1, i8*** %dataPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !30
  %3 = load i8*, i8** %2, align 8, !dbg !31
  store i8* %3, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !32, metadata !DIExpression()), !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %call = call i64 @strlen(i8* %4) #6, !dbg !38
  store i64 %call, i64* %dataLen, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i64, i64* %dataLen, align 8, !dbg !41
  %add = add i64 %5, 1, !dbg !42
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !43
  store i8* %call1, i8** %dest, align 8, !dbg !40
  %6 = load i8*, i8** %dest, align 8, !dbg !44
  %cmp = icmp eq i8* %6, null, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !48
  unreachable, !dbg !48

if.end:                                           ; preds = %entry
  %7 = load i8*, i8** %dest, align 8, !dbg !50
  %8 = bitcast i8* %7 to i32*, !dbg !50
  %9 = load i8*, i8** %data, align 8, !dbg !51
  %10 = bitcast i8* %9 to i32*, !dbg !51
  %call2 = call i32* @wcscpy(i32* %8, i32* %10) #7, !dbg !52
  %11 = load i8*, i8** %dest, align 8, !dbg !53
  call void @printLine(i8* %11), !dbg !54
  %12 = load i8*, i8** %dest, align 8, !dbg !55
  call void @free(i8* %12) #7, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !58 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !63
  %1 = bitcast i8* %0 to i8**, !dbg !64
  store i8** %1, i8*** %dataPtr, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !67
  %3 = load i8*, i8** %2, align 8, !dbg !68
  store i8* %3, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !69, metadata !DIExpression()), !dbg !71
  %4 = load i8*, i8** %data, align 8, !dbg !72
  %call = call i64 @strlen(i8* %4) #6, !dbg !73
  store i64 %call, i64* %dataLen, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !74, metadata !DIExpression()), !dbg !75
  %5 = load i64, i64* %dataLen, align 8, !dbg !76
  %add = add i64 %5, 1, !dbg !77
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !78
  store i8* %call1, i8** %dest, align 8, !dbg !75
  %6 = load i8*, i8** %dest, align 8, !dbg !79
  %cmp = icmp eq i8* %6, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  %7 = load i8*, i8** %dest, align 8, !dbg !85
  %8 = load i8*, i8** %data, align 8, !dbg !86
  %call2 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !87
  %9 = load i8*, i8** %dest, align 8, !dbg !88
  call void @printLine(i8* %9), !dbg !89
  %10 = load i8*, i8** %dest, align 8, !dbg !90
  call void @free(i8* %10) #7, !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_64b_goodB2GSink(i8* %dataVoidPtr) #0 !dbg !93 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !98
  %1 = bitcast i8* %0 to i8**, !dbg !99
  store i8** %1, i8*** %dataPtr, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !102
  %3 = load i8*, i8** %2, align 8, !dbg !103
  store i8* %3, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !104, metadata !DIExpression()), !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !107
  %5 = bitcast i8* %4 to i32*, !dbg !108
  %call = call i64 @wcslen(i32* %5) #6, !dbg !109
  store i64 %call, i64* %dataLen, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !110, metadata !DIExpression()), !dbg !111
  %6 = load i64, i64* %dataLen, align 8, !dbg !112
  %add = add i64 %6, 1, !dbg !113
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !114
  store i8* %call1, i8** %dest, align 8, !dbg !111
  %7 = load i8*, i8** %dest, align 8, !dbg !115
  %cmp = icmp eq i8* %7, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %8 = load i8*, i8** %dest, align 8, !dbg !121
  %9 = bitcast i8* %8 to i32*, !dbg !121
  %10 = load i8*, i8** %data, align 8, !dbg !122
  %11 = bitcast i8* %10 to i32*, !dbg !122
  %call2 = call i32* @wcscpy(i32* %9, i32* %11) #7, !dbg !123
  %12 = load i8*, i8** %dest, align 8, !dbg !124
  %13 = bitcast i8* %12 to i32*, !dbg !125
  call void @printWLine(i32* %13), !dbg !126
  %14 = load i8*, i8** %dest, align 8, !dbg !127
  call void @free(i8* %14) #7, !dbg !128
  ret void, !dbg !129
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !5, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_64b_badSink", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_64b.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !5}
!22 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !18, file: !19, line: 24, type: !5)
!23 = !DILocation(line: 24, column: 67, scope: !18)
!24 = !DILocalVariable(name: "dataPtr", scope: !18, file: !19, line: 27, type: !4)
!25 = !DILocation(line: 27, column: 14, scope: !18)
!26 = !DILocation(line: 27, column: 34, scope: !18)
!27 = !DILocation(line: 27, column: 24, scope: !18)
!28 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !5)
!29 = !DILocation(line: 29, column: 12, scope: !18)
!30 = !DILocation(line: 29, column: 21, scope: !18)
!31 = !DILocation(line: 29, column: 20, scope: !18)
!32 = !DILocalVariable(name: "dataLen", scope: !33, file: !19, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !18, file: !19, line: 30, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !35)
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 32, column: 16, scope: !33)
!37 = !DILocation(line: 32, column: 41, scope: !33)
!38 = !DILocation(line: 32, column: 26, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !33, file: !19, line: 33, type: !5)
!40 = !DILocation(line: 33, column: 16, scope: !33)
!41 = !DILocation(line: 33, column: 38, scope: !33)
!42 = !DILocation(line: 33, column: 45, scope: !33)
!43 = !DILocation(line: 33, column: 31, scope: !33)
!44 = !DILocation(line: 34, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !33, file: !19, line: 34, column: 13)
!46 = !DILocation(line: 34, column: 18, scope: !45)
!47 = !DILocation(line: 34, column: 13, scope: !33)
!48 = !DILocation(line: 34, column: 28, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !19, line: 34, column: 27)
!50 = !DILocation(line: 35, column: 22, scope: !33)
!51 = !DILocation(line: 35, column: 28, scope: !33)
!52 = !DILocation(line: 35, column: 15, scope: !33)
!53 = !DILocation(line: 36, column: 27, scope: !33)
!54 = !DILocation(line: 36, column: 9, scope: !33)
!55 = !DILocation(line: 37, column: 14, scope: !33)
!56 = !DILocation(line: 37, column: 9, scope: !33)
!57 = !DILocation(line: 39, column: 1, scope: !18)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_64b_goodG2BSink", scope: !19, file: !19, line: 46, type: !20, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !58, file: !19, line: 46, type: !5)
!60 = !DILocation(line: 46, column: 71, scope: !58)
!61 = !DILocalVariable(name: "dataPtr", scope: !58, file: !19, line: 49, type: !4)
!62 = !DILocation(line: 49, column: 14, scope: !58)
!63 = !DILocation(line: 49, column: 34, scope: !58)
!64 = !DILocation(line: 49, column: 24, scope: !58)
!65 = !DILocalVariable(name: "data", scope: !58, file: !19, line: 51, type: !5)
!66 = !DILocation(line: 51, column: 12, scope: !58)
!67 = !DILocation(line: 51, column: 21, scope: !58)
!68 = !DILocation(line: 51, column: 20, scope: !58)
!69 = !DILocalVariable(name: "dataLen", scope: !70, file: !19, line: 54, type: !34)
!70 = distinct !DILexicalBlock(scope: !58, file: !19, line: 52, column: 5)
!71 = !DILocation(line: 54, column: 16, scope: !70)
!72 = !DILocation(line: 54, column: 41, scope: !70)
!73 = !DILocation(line: 54, column: 26, scope: !70)
!74 = !DILocalVariable(name: "dest", scope: !70, file: !19, line: 55, type: !5)
!75 = !DILocation(line: 55, column: 16, scope: !70)
!76 = !DILocation(line: 55, column: 38, scope: !70)
!77 = !DILocation(line: 55, column: 45, scope: !70)
!78 = !DILocation(line: 55, column: 31, scope: !70)
!79 = !DILocation(line: 56, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !19, line: 56, column: 13)
!81 = !DILocation(line: 56, column: 18, scope: !80)
!82 = !DILocation(line: 56, column: 13, scope: !70)
!83 = !DILocation(line: 56, column: 28, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !19, line: 56, column: 27)
!85 = !DILocation(line: 57, column: 22, scope: !70)
!86 = !DILocation(line: 57, column: 28, scope: !70)
!87 = !DILocation(line: 57, column: 15, scope: !70)
!88 = !DILocation(line: 58, column: 27, scope: !70)
!89 = !DILocation(line: 58, column: 9, scope: !70)
!90 = !DILocation(line: 59, column: 14, scope: !70)
!91 = !DILocation(line: 59, column: 9, scope: !70)
!92 = !DILocation(line: 61, column: 1, scope: !58)
!93 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_64b_goodB2GSink", scope: !19, file: !19, line: 64, type: !20, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !93, file: !19, line: 64, type: !5)
!95 = !DILocation(line: 64, column: 71, scope: !93)
!96 = !DILocalVariable(name: "dataPtr", scope: !93, file: !19, line: 67, type: !4)
!97 = !DILocation(line: 67, column: 14, scope: !93)
!98 = !DILocation(line: 67, column: 34, scope: !93)
!99 = !DILocation(line: 67, column: 24, scope: !93)
!100 = !DILocalVariable(name: "data", scope: !93, file: !19, line: 69, type: !5)
!101 = !DILocation(line: 69, column: 12, scope: !93)
!102 = !DILocation(line: 69, column: 21, scope: !93)
!103 = !DILocation(line: 69, column: 20, scope: !93)
!104 = !DILocalVariable(name: "dataLen", scope: !105, file: !19, line: 72, type: !34)
!105 = distinct !DILexicalBlock(scope: !93, file: !19, line: 70, column: 5)
!106 = !DILocation(line: 72, column: 16, scope: !105)
!107 = !DILocation(line: 72, column: 44, scope: !105)
!108 = !DILocation(line: 72, column: 33, scope: !105)
!109 = !DILocation(line: 72, column: 26, scope: !105)
!110 = !DILocalVariable(name: "dest", scope: !105, file: !19, line: 73, type: !5)
!111 = !DILocation(line: 73, column: 16, scope: !105)
!112 = !DILocation(line: 73, column: 38, scope: !105)
!113 = !DILocation(line: 73, column: 45, scope: !105)
!114 = !DILocation(line: 73, column: 31, scope: !105)
!115 = !DILocation(line: 74, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !105, file: !19, line: 74, column: 13)
!117 = !DILocation(line: 74, column: 18, scope: !116)
!118 = !DILocation(line: 74, column: 13, scope: !105)
!119 = !DILocation(line: 74, column: 28, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !19, line: 74, column: 27)
!121 = !DILocation(line: 75, column: 22, scope: !105)
!122 = !DILocation(line: 75, column: 28, scope: !105)
!123 = !DILocation(line: 75, column: 15, scope: !105)
!124 = !DILocation(line: 76, column: 31, scope: !105)
!125 = !DILocation(line: 76, column: 20, scope: !105)
!126 = !DILocation(line: 76, column: 9, scope: !105)
!127 = !DILocation(line: 77, column: 14, scope: !105)
!128 = !DILocation(line: 77, column: 9, scope: !105)
!129 = !DILocation(line: 79, column: 1, scope: !93)
