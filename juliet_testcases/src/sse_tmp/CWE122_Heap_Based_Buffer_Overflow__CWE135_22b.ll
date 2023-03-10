; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__CWE135_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G2Global = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_badSink(i8* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_badGlobal, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end4, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = load i8*, i8** %data.addr, align 8, !dbg !32
  %call = call i64 @strlen(i8* %1) #6, !dbg !33
  store i64 %call, i64* %dataLen, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = load i64, i64* %dataLen, align 8, !dbg !36
  %add = add i64 %2, 1, !dbg !37
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !38
  store i8* %call1, i8** %dest, align 8, !dbg !35
  %3 = load i8*, i8** %dest, align 8, !dbg !39
  %cmp = icmp eq i8* %3, null, !dbg !41
  br i1 %cmp, label %if.then2, label %if.end, !dbg !42

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %if.then
  %4 = load i8*, i8** %dest, align 8, !dbg !45
  %5 = bitcast i8* %4 to i32*, !dbg !45
  %6 = load i8*, i8** %data.addr, align 8, !dbg !46
  %7 = bitcast i8* %6 to i32*, !dbg !46
  %call3 = call i32* @wcscpy(i32* %5, i32* %7) #7, !dbg !47
  %8 = load i8*, i8** %dest, align 8, !dbg !48
  call void @printLine(i8* %8), !dbg !49
  %9 = load i8*, i8** %dest, align 8, !dbg !50
  call void @free(i8* %9) #7, !dbg !51
  br label %if.end4, !dbg !52

if.end4:                                          ; preds = %if.end, %entry
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G1Sink(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G1Global, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.else, !dbg !59

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !60
  br label %if.end4, !dbg !62

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !63, metadata !DIExpression()), !dbg !66
  %1 = load i8*, i8** %data.addr, align 8, !dbg !67
  %2 = bitcast i8* %1 to i32*, !dbg !68
  %call = call i64 @wcslen(i32* %2) #6, !dbg !69
  store i64 %call, i64* %dataLen, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !70, metadata !DIExpression()), !dbg !71
  %3 = load i64, i64* %dataLen, align 8, !dbg !72
  %add = add i64 %3, 1, !dbg !73
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !74
  store i8* %call1, i8** %dest, align 8, !dbg !71
  %4 = load i8*, i8** %dest, align 8, !dbg !75
  %cmp = icmp eq i8* %4, null, !dbg !77
  br i1 %cmp, label %if.then2, label %if.end, !dbg !78

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %if.else
  %5 = load i8*, i8** %dest, align 8, !dbg !81
  %6 = bitcast i8* %5 to i32*, !dbg !81
  %7 = load i8*, i8** %data.addr, align 8, !dbg !82
  %8 = bitcast i8* %7 to i32*, !dbg !82
  %call3 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !83
  %9 = load i8*, i8** %dest, align 8, !dbg !84
  %10 = bitcast i8* %9 to i32*, !dbg !85
  call void @printWLine(i32* %10), !dbg !86
  %11 = load i8*, i8** %dest, align 8, !dbg !87
  call void @free(i8* %11) #7, !dbg !88
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !89
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G2Sink(i8* %data) #0 !dbg !90 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G2Global, align 4, !dbg !93
  %tobool = icmp ne i32 %0, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.end4, !dbg !95

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !96, metadata !DIExpression()), !dbg !99
  %1 = load i8*, i8** %data.addr, align 8, !dbg !100
  %2 = bitcast i8* %1 to i32*, !dbg !101
  %call = call i64 @wcslen(i32* %2) #6, !dbg !102
  store i64 %call, i64* %dataLen, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %3 = load i64, i64* %dataLen, align 8, !dbg !105
  %add = add i64 %3, 1, !dbg !106
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !107
  store i8* %call1, i8** %dest, align 8, !dbg !104
  %4 = load i8*, i8** %dest, align 8, !dbg !108
  %cmp = icmp eq i8* %4, null, !dbg !110
  br i1 %cmp, label %if.then2, label %if.end, !dbg !111

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %if.then
  %5 = load i8*, i8** %dest, align 8, !dbg !114
  %6 = bitcast i8* %5 to i32*, !dbg !114
  %7 = load i8*, i8** %data.addr, align 8, !dbg !115
  %8 = bitcast i8* %7 to i32*, !dbg !115
  %call3 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !116
  %9 = load i8*, i8** %dest, align 8, !dbg !117
  %10 = bitcast i8* %9 to i32*, !dbg !118
  call void @printWLine(i32* %10), !dbg !119
  %11 = load i8*, i8** %dest, align 8, !dbg !120
  call void @free(i8* %11) #7, !dbg !121
  br label %if.end4, !dbg !122

if.end4:                                          ; preds = %if.end, %entry
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodG2BSink(i8* %data) #0 !dbg !124 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal, align 4, !dbg !127
  %tobool = icmp ne i32 %0, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end4, !dbg !129

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !130, metadata !DIExpression()), !dbg !133
  %1 = load i8*, i8** %data.addr, align 8, !dbg !134
  %call = call i64 @strlen(i8* %1) #6, !dbg !135
  store i64 %call, i64* %dataLen, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !136, metadata !DIExpression()), !dbg !137
  %2 = load i64, i64* %dataLen, align 8, !dbg !138
  %add = add i64 %2, 1, !dbg !139
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !140
  store i8* %call1, i8** %dest, align 8, !dbg !137
  %3 = load i8*, i8** %dest, align 8, !dbg !141
  %cmp = icmp eq i8* %3, null, !dbg !143
  br i1 %cmp, label %if.then2, label %if.end, !dbg !144

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %if.then
  %4 = load i8*, i8** %dest, align 8, !dbg !147
  %5 = load i8*, i8** %data.addr, align 8, !dbg !148
  %call3 = call i8* @strcpy(i8* %4, i8* %5) #7, !dbg !149
  %6 = load i8*, i8** %dest, align 8, !dbg !150
  call void @printLine(i8* %6), !dbg !151
  %7 = load i8*, i8** %dest, align 8, !dbg !152
  call void @free(i8* %7) #7, !dbg !153
  br label %if.end4, !dbg !154

if.end4:                                          ; preds = %if.end, %entry
  ret void, !dbg !155
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_22b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_badSink", scope: !18, file: !18, line: 27, type: !19, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_22b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !6}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 27, type: !6)
!22 = !DILocation(line: 27, column: 66, scope: !17)
!23 = !DILocation(line: 29, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !18, line: 29, column: 8)
!25 = !DILocation(line: 29, column: 8, scope: !17)
!26 = !DILocalVariable(name: "dataLen", scope: !27, file: !18, line: 33, type: !29)
!27 = distinct !DILexicalBlock(scope: !28, file: !18, line: 31, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !18, line: 30, column: 5)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !30)
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 33, column: 20, scope: !27)
!32 = !DILocation(line: 33, column: 45, scope: !27)
!33 = !DILocation(line: 33, column: 30, scope: !27)
!34 = !DILocalVariable(name: "dest", scope: !27, file: !18, line: 34, type: !6)
!35 = !DILocation(line: 34, column: 20, scope: !27)
!36 = !DILocation(line: 34, column: 42, scope: !27)
!37 = !DILocation(line: 34, column: 49, scope: !27)
!38 = !DILocation(line: 34, column: 35, scope: !27)
!39 = !DILocation(line: 35, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !27, file: !18, line: 35, column: 17)
!41 = !DILocation(line: 35, column: 22, scope: !40)
!42 = !DILocation(line: 35, column: 17, scope: !27)
!43 = !DILocation(line: 35, column: 32, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !18, line: 35, column: 31)
!45 = !DILocation(line: 36, column: 26, scope: !27)
!46 = !DILocation(line: 36, column: 32, scope: !27)
!47 = !DILocation(line: 36, column: 19, scope: !27)
!48 = !DILocation(line: 37, column: 31, scope: !27)
!49 = !DILocation(line: 37, column: 13, scope: !27)
!50 = !DILocation(line: 38, column: 18, scope: !27)
!51 = !DILocation(line: 38, column: 13, scope: !27)
!52 = !DILocation(line: 40, column: 5, scope: !28)
!53 = !DILocation(line: 41, column: 1, scope: !17)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G1Sink", scope: !18, file: !18, line: 53, type: !19, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !18, line: 53, type: !6)
!56 = !DILocation(line: 53, column: 71, scope: !54)
!57 = !DILocation(line: 55, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !18, line: 55, column: 8)
!59 = !DILocation(line: 55, column: 8, scope: !54)
!60 = !DILocation(line: 58, column: 9, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !18, line: 56, column: 5)
!62 = !DILocation(line: 59, column: 5, scope: !61)
!63 = !DILocalVariable(name: "dataLen", scope: !64, file: !18, line: 64, type: !29)
!64 = distinct !DILexicalBlock(scope: !65, file: !18, line: 62, column: 9)
!65 = distinct !DILexicalBlock(scope: !58, file: !18, line: 61, column: 5)
!66 = !DILocation(line: 64, column: 20, scope: !64)
!67 = !DILocation(line: 64, column: 48, scope: !64)
!68 = !DILocation(line: 64, column: 37, scope: !64)
!69 = !DILocation(line: 64, column: 30, scope: !64)
!70 = !DILocalVariable(name: "dest", scope: !64, file: !18, line: 65, type: !6)
!71 = !DILocation(line: 65, column: 20, scope: !64)
!72 = !DILocation(line: 65, column: 42, scope: !64)
!73 = !DILocation(line: 65, column: 49, scope: !64)
!74 = !DILocation(line: 65, column: 35, scope: !64)
!75 = !DILocation(line: 66, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !64, file: !18, line: 66, column: 17)
!77 = !DILocation(line: 66, column: 22, scope: !76)
!78 = !DILocation(line: 66, column: 17, scope: !64)
!79 = !DILocation(line: 66, column: 32, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !18, line: 66, column: 31)
!81 = !DILocation(line: 67, column: 26, scope: !64)
!82 = !DILocation(line: 67, column: 32, scope: !64)
!83 = !DILocation(line: 67, column: 19, scope: !64)
!84 = !DILocation(line: 68, column: 35, scope: !64)
!85 = !DILocation(line: 68, column: 24, scope: !64)
!86 = !DILocation(line: 68, column: 13, scope: !64)
!87 = !DILocation(line: 69, column: 18, scope: !64)
!88 = !DILocation(line: 69, column: 13, scope: !64)
!89 = !DILocation(line: 72, column: 1, scope: !54)
!90 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G2Sink", scope: !18, file: !18, line: 75, type: !19, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", arg: 1, scope: !90, file: !18, line: 75, type: !6)
!92 = !DILocation(line: 75, column: 71, scope: !90)
!93 = !DILocation(line: 77, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !18, line: 77, column: 8)
!95 = !DILocation(line: 77, column: 8, scope: !90)
!96 = !DILocalVariable(name: "dataLen", scope: !97, file: !18, line: 81, type: !29)
!97 = distinct !DILexicalBlock(scope: !98, file: !18, line: 79, column: 9)
!98 = distinct !DILexicalBlock(scope: !94, file: !18, line: 78, column: 5)
!99 = !DILocation(line: 81, column: 20, scope: !97)
!100 = !DILocation(line: 81, column: 48, scope: !97)
!101 = !DILocation(line: 81, column: 37, scope: !97)
!102 = !DILocation(line: 81, column: 30, scope: !97)
!103 = !DILocalVariable(name: "dest", scope: !97, file: !18, line: 82, type: !6)
!104 = !DILocation(line: 82, column: 20, scope: !97)
!105 = !DILocation(line: 82, column: 42, scope: !97)
!106 = !DILocation(line: 82, column: 49, scope: !97)
!107 = !DILocation(line: 82, column: 35, scope: !97)
!108 = !DILocation(line: 83, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !97, file: !18, line: 83, column: 17)
!110 = !DILocation(line: 83, column: 22, scope: !109)
!111 = !DILocation(line: 83, column: 17, scope: !97)
!112 = !DILocation(line: 83, column: 32, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !18, line: 83, column: 31)
!114 = !DILocation(line: 84, column: 26, scope: !97)
!115 = !DILocation(line: 84, column: 32, scope: !97)
!116 = !DILocation(line: 84, column: 19, scope: !97)
!117 = !DILocation(line: 85, column: 35, scope: !97)
!118 = !DILocation(line: 85, column: 24, scope: !97)
!119 = !DILocation(line: 85, column: 13, scope: !97)
!120 = !DILocation(line: 86, column: 18, scope: !97)
!121 = !DILocation(line: 86, column: 13, scope: !97)
!122 = !DILocation(line: 88, column: 5, scope: !98)
!123 = !DILocation(line: 89, column: 1, scope: !90)
!124 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodG2BSink", scope: !18, file: !18, line: 92, type: !19, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", arg: 1, scope: !124, file: !18, line: 92, type: !6)
!126 = !DILocation(line: 92, column: 70, scope: !124)
!127 = !DILocation(line: 94, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !18, line: 94, column: 8)
!129 = !DILocation(line: 94, column: 8, scope: !124)
!130 = !DILocalVariable(name: "dataLen", scope: !131, file: !18, line: 98, type: !29)
!131 = distinct !DILexicalBlock(scope: !132, file: !18, line: 96, column: 9)
!132 = distinct !DILexicalBlock(scope: !128, file: !18, line: 95, column: 5)
!133 = !DILocation(line: 98, column: 20, scope: !131)
!134 = !DILocation(line: 98, column: 45, scope: !131)
!135 = !DILocation(line: 98, column: 30, scope: !131)
!136 = !DILocalVariable(name: "dest", scope: !131, file: !18, line: 99, type: !6)
!137 = !DILocation(line: 99, column: 20, scope: !131)
!138 = !DILocation(line: 99, column: 42, scope: !131)
!139 = !DILocation(line: 99, column: 49, scope: !131)
!140 = !DILocation(line: 99, column: 35, scope: !131)
!141 = !DILocation(line: 100, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !131, file: !18, line: 100, column: 17)
!143 = !DILocation(line: 100, column: 22, scope: !142)
!144 = !DILocation(line: 100, column: 17, scope: !131)
!145 = !DILocation(line: 100, column: 32, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !18, line: 100, column: 31)
!147 = !DILocation(line: 101, column: 26, scope: !131)
!148 = !DILocation(line: 101, column: 32, scope: !131)
!149 = !DILocation(line: 101, column: 19, scope: !131)
!150 = !DILocation(line: 102, column: 31, scope: !131)
!151 = !DILocation(line: 102, column: 13, scope: !131)
!152 = !DILocation(line: 103, column: 18, scope: !131)
!153 = !DILocation(line: 103, column: 13, scope: !131)
!154 = !DILocation(line: 105, column: 5, scope: !132)
!155 = !DILocation(line: 106, column: 1, scope: !124)
