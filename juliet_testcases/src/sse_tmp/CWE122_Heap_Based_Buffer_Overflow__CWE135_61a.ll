; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_61_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_badSource(i8* %0), !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !28, metadata !DIExpression()), !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %call1 = call i64 @strlen(i8* %1) #6, !dbg !34
  store i64 %call1, i64* %dataLen, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = load i64, i64* %dataLen, align 8, !dbg !37
  %add = add i64 %2, 1, !dbg !38
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !39
  store i8* %call2, i8** %dest, align 8, !dbg !36
  %3 = load i8*, i8** %dest, align 8, !dbg !40
  %cmp = icmp eq i8* %3, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !46
  %5 = bitcast i8* %4 to i32*, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  %7 = bitcast i8* %6 to i32*, !dbg !47
  %call3 = call i32* @wcscpy(i32* %5, i32* %7) #7, !dbg !48
  %8 = load i8*, i8** %dest, align 8, !dbg !49
  call void @printLine(i8* %8), !dbg !50
  %9 = load i8*, i8** %dest, align 8, !dbg !51
  call void @free(i8* %9) #7, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_badSource(i8*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_61_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  call void @goodB2G(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_61_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_61_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* null, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_goodG2BSource(i8* %0), !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !83, metadata !DIExpression()), !dbg !85
  %1 = load i8*, i8** %data, align 8, !dbg !86
  %call1 = call i64 @strlen(i8* %1) #6, !dbg !87
  store i64 %call1, i64* %dataLen, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = load i64, i64* %dataLen, align 8, !dbg !90
  %add = add i64 %2, 1, !dbg !91
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !92
  store i8* %call2, i8** %dest, align 8, !dbg !89
  %3 = load i8*, i8** %dest, align 8, !dbg !93
  %cmp = icmp eq i8* %3, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !100
  %call3 = call i8* @strcpy(i8* %4, i8* %5) #7, !dbg !101
  %6 = load i8*, i8** %dest, align 8, !dbg !102
  call void @printLine(i8* %6), !dbg !103
  %7 = load i8*, i8** %dest, align 8, !dbg !104
  call void @free(i8* %7) #7, !dbg !105
  ret void, !dbg !106
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_goodG2BSource(i8*) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i8* null, i8** %data, align 8, !dbg !110
  %0 = load i8*, i8** %data, align 8, !dbg !111
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_goodB2GSource(i8* %0), !dbg !112
  store i8* %call, i8** %data, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !114, metadata !DIExpression()), !dbg !116
  %1 = load i8*, i8** %data, align 8, !dbg !117
  %2 = bitcast i8* %1 to i32*, !dbg !118
  %call1 = call i64 @wcslen(i32* %2) #6, !dbg !119
  store i64 %call1, i64* %dataLen, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !120, metadata !DIExpression()), !dbg !121
  %3 = load i64, i64* %dataLen, align 8, !dbg !122
  %add = add i64 %3, 1, !dbg !123
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !124
  store i8* %call2, i8** %dest, align 8, !dbg !121
  %4 = load i8*, i8** %dest, align 8, !dbg !125
  %cmp = icmp eq i8* %4, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %dest, align 8, !dbg !131
  %6 = bitcast i8* %5 to i32*, !dbg !131
  %7 = load i8*, i8** %data, align 8, !dbg !132
  %8 = bitcast i8* %7 to i32*, !dbg !132
  %call3 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !133
  %9 = load i8*, i8** %dest, align 8, !dbg !134
  %10 = bitcast i8* %9 to i32*, !dbg !135
  call void @printWLine(i32* %10), !dbg !136
  %11 = load i8*, i8** %dest, align 8, !dbg !137
  call void @free(i8* %11) #7, !dbg !138
  ret void, !dbg !139
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__CWE135_61b_goodB2GSource(i8*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_61_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_61a.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocation(line: 31, column: 68, scope: !18)
!26 = !DILocation(line: 31, column: 12, scope: !18)
!27 = !DILocation(line: 31, column: 10, scope: !18)
!28 = !DILocalVariable(name: "dataLen", scope: !29, file: !19, line: 34, type: !30)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !31)
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 34, column: 16, scope: !29)
!33 = !DILocation(line: 34, column: 41, scope: !29)
!34 = !DILocation(line: 34, column: 26, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !29, file: !19, line: 35, type: !4)
!36 = !DILocation(line: 35, column: 16, scope: !29)
!37 = !DILocation(line: 35, column: 38, scope: !29)
!38 = !DILocation(line: 35, column: 45, scope: !29)
!39 = !DILocation(line: 35, column: 31, scope: !29)
!40 = !DILocation(line: 36, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !29, file: !19, line: 36, column: 13)
!42 = !DILocation(line: 36, column: 18, scope: !41)
!43 = !DILocation(line: 36, column: 13, scope: !29)
!44 = !DILocation(line: 36, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !19, line: 36, column: 27)
!46 = !DILocation(line: 37, column: 22, scope: !29)
!47 = !DILocation(line: 37, column: 28, scope: !29)
!48 = !DILocation(line: 37, column: 15, scope: !29)
!49 = !DILocation(line: 38, column: 27, scope: !29)
!50 = !DILocation(line: 38, column: 9, scope: !29)
!51 = !DILocation(line: 39, column: 14, scope: !29)
!52 = !DILocation(line: 39, column: 9, scope: !29)
!53 = !DILocation(line: 41, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_61_good", scope: !19, file: !19, line: 85, type: !20, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 87, column: 5, scope: !54)
!56 = !DILocation(line: 88, column: 5, scope: !54)
!57 = !DILocation(line: 89, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 100, type: !59, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !19, line: 100, type: !11)
!63 = !DILocation(line: 100, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !19, line: 100, type: !61)
!65 = !DILocation(line: 100, column: 27, scope: !58)
!66 = !DILocation(line: 103, column: 22, scope: !58)
!67 = !DILocation(line: 103, column: 12, scope: !58)
!68 = !DILocation(line: 103, column: 5, scope: !58)
!69 = !DILocation(line: 105, column: 5, scope: !58)
!70 = !DILocation(line: 106, column: 5, scope: !58)
!71 = !DILocation(line: 107, column: 5, scope: !58)
!72 = !DILocation(line: 110, column: 5, scope: !58)
!73 = !DILocation(line: 111, column: 5, scope: !58)
!74 = !DILocation(line: 112, column: 5, scope: !58)
!75 = !DILocation(line: 114, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 50, type: !20, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !19, line: 52, type: !4)
!78 = !DILocation(line: 52, column: 12, scope: !76)
!79 = !DILocation(line: 53, column: 10, scope: !76)
!80 = !DILocation(line: 54, column: 72, scope: !76)
!81 = !DILocation(line: 54, column: 12, scope: !76)
!82 = !DILocation(line: 54, column: 10, scope: !76)
!83 = !DILocalVariable(name: "dataLen", scope: !84, file: !19, line: 57, type: !30)
!84 = distinct !DILexicalBlock(scope: !76, file: !19, line: 55, column: 5)
!85 = !DILocation(line: 57, column: 16, scope: !84)
!86 = !DILocation(line: 57, column: 41, scope: !84)
!87 = !DILocation(line: 57, column: 26, scope: !84)
!88 = !DILocalVariable(name: "dest", scope: !84, file: !19, line: 58, type: !4)
!89 = !DILocation(line: 58, column: 16, scope: !84)
!90 = !DILocation(line: 58, column: 38, scope: !84)
!91 = !DILocation(line: 58, column: 45, scope: !84)
!92 = !DILocation(line: 58, column: 31, scope: !84)
!93 = !DILocation(line: 59, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !84, file: !19, line: 59, column: 13)
!95 = !DILocation(line: 59, column: 18, scope: !94)
!96 = !DILocation(line: 59, column: 13, scope: !84)
!97 = !DILocation(line: 59, column: 28, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !19, line: 59, column: 27)
!99 = !DILocation(line: 60, column: 22, scope: !84)
!100 = !DILocation(line: 60, column: 28, scope: !84)
!101 = !DILocation(line: 60, column: 15, scope: !84)
!102 = !DILocation(line: 61, column: 27, scope: !84)
!103 = !DILocation(line: 61, column: 9, scope: !84)
!104 = !DILocation(line: 62, column: 14, scope: !84)
!105 = !DILocation(line: 62, column: 9, scope: !84)
!106 = !DILocation(line: 64, column: 1, scope: !76)
!107 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 69, type: !20, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !19, line: 71, type: !4)
!109 = !DILocation(line: 71, column: 12, scope: !107)
!110 = !DILocation(line: 72, column: 10, scope: !107)
!111 = !DILocation(line: 73, column: 72, scope: !107)
!112 = !DILocation(line: 73, column: 12, scope: !107)
!113 = !DILocation(line: 73, column: 10, scope: !107)
!114 = !DILocalVariable(name: "dataLen", scope: !115, file: !19, line: 76, type: !30)
!115 = distinct !DILexicalBlock(scope: !107, file: !19, line: 74, column: 5)
!116 = !DILocation(line: 76, column: 16, scope: !115)
!117 = !DILocation(line: 76, column: 44, scope: !115)
!118 = !DILocation(line: 76, column: 33, scope: !115)
!119 = !DILocation(line: 76, column: 26, scope: !115)
!120 = !DILocalVariable(name: "dest", scope: !115, file: !19, line: 77, type: !4)
!121 = !DILocation(line: 77, column: 16, scope: !115)
!122 = !DILocation(line: 77, column: 38, scope: !115)
!123 = !DILocation(line: 77, column: 45, scope: !115)
!124 = !DILocation(line: 77, column: 31, scope: !115)
!125 = !DILocation(line: 78, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !115, file: !19, line: 78, column: 13)
!127 = !DILocation(line: 78, column: 18, scope: !126)
!128 = !DILocation(line: 78, column: 13, scope: !115)
!129 = !DILocation(line: 78, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !19, line: 78, column: 27)
!131 = !DILocation(line: 79, column: 22, scope: !115)
!132 = !DILocation(line: 79, column: 28, scope: !115)
!133 = !DILocation(line: 79, column: 15, scope: !115)
!134 = !DILocation(line: 80, column: 31, scope: !115)
!135 = !DILocation(line: 80, column: 20, scope: !115)
!136 = !DILocation(line: 80, column: 9, scope: !115)
!137 = !DILocation(line: 81, column: 14, scope: !115)
!138 = !DILocation(line: 81, column: 9, scope: !115)
!139 = !DILocation(line: 83, column: 1, scope: !107)
