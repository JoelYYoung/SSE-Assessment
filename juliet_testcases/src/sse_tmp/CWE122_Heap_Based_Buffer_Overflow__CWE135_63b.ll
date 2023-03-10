; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_badSink(i8** %dataPtr) #0 !dbg !17 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !26
  %1 = load i8*, i8** %0, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !28, metadata !DIExpression()), !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %call = call i64 @strlen(i8* %2) #6, !dbg !34
  store i64 %call, i64* %dataLen, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !35, metadata !DIExpression()), !dbg !36
  %3 = load i64, i64* %dataLen, align 8, !dbg !37
  %add = add i64 %3, 1, !dbg !38
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !39
  store i8* %call1, i8** %dest, align 8, !dbg !36
  %4 = load i8*, i8** %dest, align 8, !dbg !40
  %cmp = icmp eq i8* %4, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %dest, align 8, !dbg !46
  %6 = bitcast i8* %5 to i32*, !dbg !46
  %7 = load i8*, i8** %data, align 8, !dbg !47
  %8 = bitcast i8* %7 to i32*, !dbg !47
  %call2 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !48
  %9 = load i8*, i8** %dest, align 8, !dbg !49
  call void @printLine(i8* %9), !dbg !50
  %10 = load i8*, i8** %dest, align 8, !dbg !51
  call void @free(i8* %10) #7, !dbg !52
  ret void, !dbg !53
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !54 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i8** %data, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !59
  %1 = load i8*, i8** %0, align 8, !dbg !60
  store i8* %1, i8** %data, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !61, metadata !DIExpression()), !dbg !63
  %2 = load i8*, i8** %data, align 8, !dbg !64
  %call = call i64 @strlen(i8* %2) #6, !dbg !65
  store i64 %call, i64* %dataLen, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !66, metadata !DIExpression()), !dbg !67
  %3 = load i64, i64* %dataLen, align 8, !dbg !68
  %add = add i64 %3, 1, !dbg !69
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !70
  store i8* %call1, i8** %dest, align 8, !dbg !67
  %4 = load i8*, i8** %dest, align 8, !dbg !71
  %cmp = icmp eq i8* %4, null, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %dest, align 8, !dbg !77
  %6 = load i8*, i8** %data, align 8, !dbg !78
  %call2 = call i8* @strcpy(i8* %5, i8* %6) #7, !dbg !79
  %7 = load i8*, i8** %dest, align 8, !dbg !80
  call void @printLine(i8* %7), !dbg !81
  %8 = load i8*, i8** %dest, align 8, !dbg !82
  call void @free(i8* %8) #7, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_goodB2GSink(i8** %dataPtr) #0 !dbg !85 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !90
  %1 = load i8*, i8** %0, align 8, !dbg !91
  store i8* %1, i8** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %3 = bitcast i8* %2 to i32*, !dbg !96
  %call = call i64 @wcslen(i32* %3) #6, !dbg !97
  store i64 %call, i64* %dataLen, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !98, metadata !DIExpression()), !dbg !99
  %4 = load i64, i64* %dataLen, align 8, !dbg !100
  %add = add i64 %4, 1, !dbg !101
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !102
  store i8* %call1, i8** %dest, align 8, !dbg !99
  %5 = load i8*, i8** %dest, align 8, !dbg !103
  %cmp = icmp eq i8* %5, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  %6 = load i8*, i8** %dest, align 8, !dbg !109
  %7 = bitcast i8* %6 to i32*, !dbg !109
  %8 = load i8*, i8** %data, align 8, !dbg !110
  %9 = bitcast i8* %8 to i32*, !dbg !110
  %call2 = call i32* @wcscpy(i32* %7, i32* %9) #7, !dbg !111
  %10 = load i8*, i8** %dest, align 8, !dbg !112
  %11 = bitcast i8* %10 to i32*, !dbg !113
  call void @printWLine(i32* %11), !dbg !114
  %12 = load i8*, i8** %dest, align 8, !dbg !115
  call void @free(i8* %12) #7, !dbg !116
  ret void, !dbg !117
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
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_badSink", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_63b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!22 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !17, file: !18, line: 24, type: !21)
!23 = !DILocation(line: 24, column: 69, scope: !17)
!24 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !6)
!25 = !DILocation(line: 26, column: 12, scope: !17)
!26 = !DILocation(line: 26, column: 20, scope: !17)
!27 = !DILocation(line: 26, column: 19, scope: !17)
!28 = !DILocalVariable(name: "dataLen", scope: !29, file: !18, line: 29, type: !30)
!29 = distinct !DILexicalBlock(scope: !17, file: !18, line: 27, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !31)
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 29, column: 16, scope: !29)
!33 = !DILocation(line: 29, column: 41, scope: !29)
!34 = !DILocation(line: 29, column: 26, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !29, file: !18, line: 30, type: !6)
!36 = !DILocation(line: 30, column: 16, scope: !29)
!37 = !DILocation(line: 30, column: 38, scope: !29)
!38 = !DILocation(line: 30, column: 45, scope: !29)
!39 = !DILocation(line: 30, column: 31, scope: !29)
!40 = !DILocation(line: 31, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !29, file: !18, line: 31, column: 13)
!42 = !DILocation(line: 31, column: 18, scope: !41)
!43 = !DILocation(line: 31, column: 13, scope: !29)
!44 = !DILocation(line: 31, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !18, line: 31, column: 27)
!46 = !DILocation(line: 32, column: 22, scope: !29)
!47 = !DILocation(line: 32, column: 28, scope: !29)
!48 = !DILocation(line: 32, column: 15, scope: !29)
!49 = !DILocation(line: 33, column: 27, scope: !29)
!50 = !DILocation(line: 33, column: 9, scope: !29)
!51 = !DILocation(line: 34, column: 14, scope: !29)
!52 = !DILocation(line: 34, column: 9, scope: !29)
!53 = !DILocation(line: 36, column: 1, scope: !17)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_goodG2BSink", scope: !18, file: !18, line: 43, type: !19, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !54, file: !18, line: 43, type: !21)
!56 = !DILocation(line: 43, column: 73, scope: !54)
!57 = !DILocalVariable(name: "data", scope: !54, file: !18, line: 45, type: !6)
!58 = !DILocation(line: 45, column: 12, scope: !54)
!59 = !DILocation(line: 45, column: 20, scope: !54)
!60 = !DILocation(line: 45, column: 19, scope: !54)
!61 = !DILocalVariable(name: "dataLen", scope: !62, file: !18, line: 48, type: !30)
!62 = distinct !DILexicalBlock(scope: !54, file: !18, line: 46, column: 5)
!63 = !DILocation(line: 48, column: 16, scope: !62)
!64 = !DILocation(line: 48, column: 41, scope: !62)
!65 = !DILocation(line: 48, column: 26, scope: !62)
!66 = !DILocalVariable(name: "dest", scope: !62, file: !18, line: 49, type: !6)
!67 = !DILocation(line: 49, column: 16, scope: !62)
!68 = !DILocation(line: 49, column: 38, scope: !62)
!69 = !DILocation(line: 49, column: 45, scope: !62)
!70 = !DILocation(line: 49, column: 31, scope: !62)
!71 = !DILocation(line: 50, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !62, file: !18, line: 50, column: 13)
!73 = !DILocation(line: 50, column: 18, scope: !72)
!74 = !DILocation(line: 50, column: 13, scope: !62)
!75 = !DILocation(line: 50, column: 28, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !18, line: 50, column: 27)
!77 = !DILocation(line: 51, column: 22, scope: !62)
!78 = !DILocation(line: 51, column: 28, scope: !62)
!79 = !DILocation(line: 51, column: 15, scope: !62)
!80 = !DILocation(line: 52, column: 27, scope: !62)
!81 = !DILocation(line: 52, column: 9, scope: !62)
!82 = !DILocation(line: 53, column: 14, scope: !62)
!83 = !DILocation(line: 53, column: 9, scope: !62)
!84 = !DILocation(line: 55, column: 1, scope: !54)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_goodB2GSink", scope: !18, file: !18, line: 58, type: !19, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !85, file: !18, line: 58, type: !21)
!87 = !DILocation(line: 58, column: 73, scope: !85)
!88 = !DILocalVariable(name: "data", scope: !85, file: !18, line: 60, type: !6)
!89 = !DILocation(line: 60, column: 12, scope: !85)
!90 = !DILocation(line: 60, column: 20, scope: !85)
!91 = !DILocation(line: 60, column: 19, scope: !85)
!92 = !DILocalVariable(name: "dataLen", scope: !93, file: !18, line: 63, type: !30)
!93 = distinct !DILexicalBlock(scope: !85, file: !18, line: 61, column: 5)
!94 = !DILocation(line: 63, column: 16, scope: !93)
!95 = !DILocation(line: 63, column: 44, scope: !93)
!96 = !DILocation(line: 63, column: 33, scope: !93)
!97 = !DILocation(line: 63, column: 26, scope: !93)
!98 = !DILocalVariable(name: "dest", scope: !93, file: !18, line: 64, type: !6)
!99 = !DILocation(line: 64, column: 16, scope: !93)
!100 = !DILocation(line: 64, column: 38, scope: !93)
!101 = !DILocation(line: 64, column: 45, scope: !93)
!102 = !DILocation(line: 64, column: 31, scope: !93)
!103 = !DILocation(line: 65, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !93, file: !18, line: 65, column: 13)
!105 = !DILocation(line: 65, column: 18, scope: !104)
!106 = !DILocation(line: 65, column: 13, scope: !93)
!107 = !DILocation(line: 65, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !18, line: 65, column: 27)
!109 = !DILocation(line: 66, column: 22, scope: !93)
!110 = !DILocation(line: 66, column: 28, scope: !93)
!111 = !DILocation(line: 66, column: 15, scope: !93)
!112 = !DILocation(line: 67, column: 31, scope: !93)
!113 = !DILocation(line: 67, column: 20, scope: !93)
!114 = !DILocation(line: 67, column: 9, scope: !93)
!115 = !DILocation(line: 68, column: 14, scope: !93)
!116 = !DILocation(line: 68, column: 9, scope: !93)
!117 = !DILocation(line: 70, column: 1, scope: !85)
