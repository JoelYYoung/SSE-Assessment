; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_65b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_badSink(i8* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !23, metadata !DIExpression()), !dbg !27
  %0 = load i8*, i8** %data.addr, align 8, !dbg !28
  %call = call i64 @strlen(i8* %0) #6, !dbg !29
  store i64 %call, i64* %dataLen, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = load i64, i64* %dataLen, align 8, !dbg !32
  %add = add i64 %1, 1, !dbg !33
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !34
  store i8* %call1, i8** %dest, align 8, !dbg !31
  %2 = load i8*, i8** %dest, align 8, !dbg !35
  %cmp = icmp eq i8* %2, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dest, align 8, !dbg !41
  %4 = bitcast i8* %3 to i32*, !dbg !41
  %5 = load i8*, i8** %data.addr, align 8, !dbg !42
  %6 = bitcast i8* %5 to i32*, !dbg !42
  %call2 = call i32* @wcscpy(i32* %4, i32* %6) #7, !dbg !43
  %7 = load i8*, i8** %dest, align 8, !dbg !44
  call void @printLine(i8* %7), !dbg !45
  %8 = load i8*, i8** %dest, align 8, !dbg !46
  call void @free(i8* %8) #7, !dbg !47
  ret void, !dbg !48
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_goodG2BSink(i8* %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !54
  %0 = load i8*, i8** %data.addr, align 8, !dbg !55
  %call = call i64 @strlen(i8* %0) #6, !dbg !56
  store i64 %call, i64* %dataLen, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !57, metadata !DIExpression()), !dbg !58
  %1 = load i64, i64* %dataLen, align 8, !dbg !59
  %add = add i64 %1, 1, !dbg !60
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !61
  store i8* %call1, i8** %dest, align 8, !dbg !58
  %2 = load i8*, i8** %dest, align 8, !dbg !62
  %cmp = icmp eq i8* %2, null, !dbg !64
  br i1 %cmp, label %if.then, label %if.end, !dbg !65

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !66
  unreachable, !dbg !66

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dest, align 8, !dbg !68
  %4 = load i8*, i8** %data.addr, align 8, !dbg !69
  %call2 = call i8* @strcpy(i8* %3, i8* %4) #7, !dbg !70
  %5 = load i8*, i8** %dest, align 8, !dbg !71
  call void @printLine(i8* %5), !dbg !72
  %6 = load i8*, i8** %dest, align 8, !dbg !73
  call void @free(i8* %6) #7, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_goodB2GSink(i8* %data) #0 !dbg !76 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !79, metadata !DIExpression()), !dbg !81
  %0 = load i8*, i8** %data.addr, align 8, !dbg !82
  %1 = bitcast i8* %0 to i32*, !dbg !83
  %call = call i64 @wcslen(i32* %1) #6, !dbg !84
  store i64 %call, i64* %dataLen, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = load i64, i64* %dataLen, align 8, !dbg !87
  %add = add i64 %2, 1, !dbg !88
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !89
  store i8* %call1, i8** %dest, align 8, !dbg !86
  %3 = load i8*, i8** %dest, align 8, !dbg !90
  %cmp = icmp eq i8* %3, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !96
  %5 = bitcast i8* %4 to i32*, !dbg !96
  %6 = load i8*, i8** %data.addr, align 8, !dbg !97
  %7 = bitcast i8* %6 to i32*, !dbg !97
  %call2 = call i32* @wcscpy(i32* %5, i32* %7) #7, !dbg !98
  %8 = load i8*, i8** %dest, align 8, !dbg !99
  %9 = bitcast i8* %8 to i32*, !dbg !100
  call void @printWLine(i32* %9), !dbg !101
  %10 = load i8*, i8** %dest, align 8, !dbg !102
  call void @free(i8* %10) #7, !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_65b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_badSink", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_65b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !6}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 24, type: !6)
!22 = !DILocation(line: 24, column: 67, scope: !17)
!23 = !DILocalVariable(name: "dataLen", scope: !24, file: !18, line: 28, type: !25)
!24 = distinct !DILexicalBlock(scope: !17, file: !18, line: 26, column: 5)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !26)
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 28, column: 16, scope: !24)
!28 = !DILocation(line: 28, column: 41, scope: !24)
!29 = !DILocation(line: 28, column: 26, scope: !24)
!30 = !DILocalVariable(name: "dest", scope: !24, file: !18, line: 29, type: !6)
!31 = !DILocation(line: 29, column: 16, scope: !24)
!32 = !DILocation(line: 29, column: 38, scope: !24)
!33 = !DILocation(line: 29, column: 45, scope: !24)
!34 = !DILocation(line: 29, column: 31, scope: !24)
!35 = !DILocation(line: 30, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !24, file: !18, line: 30, column: 13)
!37 = !DILocation(line: 30, column: 18, scope: !36)
!38 = !DILocation(line: 30, column: 13, scope: !24)
!39 = !DILocation(line: 30, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !18, line: 30, column: 27)
!41 = !DILocation(line: 31, column: 22, scope: !24)
!42 = !DILocation(line: 31, column: 28, scope: !24)
!43 = !DILocation(line: 31, column: 15, scope: !24)
!44 = !DILocation(line: 32, column: 27, scope: !24)
!45 = !DILocation(line: 32, column: 9, scope: !24)
!46 = !DILocation(line: 33, column: 14, scope: !24)
!47 = !DILocation(line: 33, column: 9, scope: !24)
!48 = !DILocation(line: 35, column: 1, scope: !17)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_goodG2BSink", scope: !18, file: !18, line: 42, type: !19, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !18, line: 42, type: !6)
!51 = !DILocation(line: 42, column: 71, scope: !49)
!52 = !DILocalVariable(name: "dataLen", scope: !53, file: !18, line: 46, type: !25)
!53 = distinct !DILexicalBlock(scope: !49, file: !18, line: 44, column: 5)
!54 = !DILocation(line: 46, column: 16, scope: !53)
!55 = !DILocation(line: 46, column: 41, scope: !53)
!56 = !DILocation(line: 46, column: 26, scope: !53)
!57 = !DILocalVariable(name: "dest", scope: !53, file: !18, line: 47, type: !6)
!58 = !DILocation(line: 47, column: 16, scope: !53)
!59 = !DILocation(line: 47, column: 38, scope: !53)
!60 = !DILocation(line: 47, column: 45, scope: !53)
!61 = !DILocation(line: 47, column: 31, scope: !53)
!62 = !DILocation(line: 48, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !53, file: !18, line: 48, column: 13)
!64 = !DILocation(line: 48, column: 18, scope: !63)
!65 = !DILocation(line: 48, column: 13, scope: !53)
!66 = !DILocation(line: 48, column: 28, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !18, line: 48, column: 27)
!68 = !DILocation(line: 49, column: 22, scope: !53)
!69 = !DILocation(line: 49, column: 28, scope: !53)
!70 = !DILocation(line: 49, column: 15, scope: !53)
!71 = !DILocation(line: 50, column: 27, scope: !53)
!72 = !DILocation(line: 50, column: 9, scope: !53)
!73 = !DILocation(line: 51, column: 14, scope: !53)
!74 = !DILocation(line: 51, column: 9, scope: !53)
!75 = !DILocation(line: 53, column: 1, scope: !49)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_goodB2GSink", scope: !18, file: !18, line: 56, type: !19, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", arg: 1, scope: !76, file: !18, line: 56, type: !6)
!78 = !DILocation(line: 56, column: 71, scope: !76)
!79 = !DILocalVariable(name: "dataLen", scope: !80, file: !18, line: 60, type: !25)
!80 = distinct !DILexicalBlock(scope: !76, file: !18, line: 58, column: 5)
!81 = !DILocation(line: 60, column: 16, scope: !80)
!82 = !DILocation(line: 60, column: 44, scope: !80)
!83 = !DILocation(line: 60, column: 33, scope: !80)
!84 = !DILocation(line: 60, column: 26, scope: !80)
!85 = !DILocalVariable(name: "dest", scope: !80, file: !18, line: 61, type: !6)
!86 = !DILocation(line: 61, column: 16, scope: !80)
!87 = !DILocation(line: 61, column: 38, scope: !80)
!88 = !DILocation(line: 61, column: 45, scope: !80)
!89 = !DILocation(line: 61, column: 31, scope: !80)
!90 = !DILocation(line: 62, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !18, line: 62, column: 13)
!92 = !DILocation(line: 62, column: 18, scope: !91)
!93 = !DILocation(line: 62, column: 13, scope: !80)
!94 = !DILocation(line: 62, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !18, line: 62, column: 27)
!96 = !DILocation(line: 63, column: 22, scope: !80)
!97 = !DILocation(line: 63, column: 28, scope: !80)
!98 = !DILocation(line: 63, column: 15, scope: !80)
!99 = !DILocation(line: 64, column: 31, scope: !80)
!100 = !DILocation(line: 64, column: 20, scope: !80)
!101 = !DILocation(line: 64, column: 9, scope: !80)
!102 = !DILocation(line: 65, column: 14, scope: !80)
!103 = !DILocation(line: 65, column: 9, scope: !80)
!104 = !DILocation(line: 67, column: 1, scope: !76)
