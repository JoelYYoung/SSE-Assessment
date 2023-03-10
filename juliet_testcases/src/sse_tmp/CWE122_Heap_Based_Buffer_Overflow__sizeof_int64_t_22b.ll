; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_badSource(i64* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_badGlobal, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end2, !dbg !25

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !26
  %1 = bitcast i8* %call to i64*, !dbg !28
  store i64* %1, i64** %data.addr, align 8, !dbg !29
  %2 = load i64*, i64** %data.addr, align 8, !dbg !30
  %cmp = icmp eq i64* %2, null, !dbg !32
  br i1 %cmp, label %if.then1, label %if.end, !dbg !33

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data.addr, align 8, !dbg !36
  store i64 2147483643, i64* %3, align 8, !dbg !37
  br label %if.end2, !dbg !38

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data.addr, align 8, !dbg !39
  ret i64* %4, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B1Source(i64* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B1Global, align 4, !dbg !44
  %tobool = icmp ne i32 %0, 0, !dbg !44
  br i1 %tobool, label %if.then, label %if.else, !dbg !46

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end2, !dbg !49

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !50
  %1 = bitcast i8* %call to i64*, !dbg !52
  store i64* %1, i64** %data.addr, align 8, !dbg !53
  %2 = load i64*, i64** %data.addr, align 8, !dbg !54
  %cmp = icmp eq i64* %2, null, !dbg !56
  br i1 %cmp, label %if.then1, label %if.end, !dbg !57

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %if.else
  %3 = load i64*, i64** %data.addr, align 8, !dbg !60
  store i64 2147483643, i64* %3, align 8, !dbg !61
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i64*, i64** %data.addr, align 8, !dbg !62
  ret i64* %4, !dbg !63
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B2Source(i64* %data) #0 !dbg !64 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B2Global, align 4, !dbg !67
  %tobool = icmp ne i32 %0, 0, !dbg !67
  br i1 %tobool, label %if.then, label %if.end2, !dbg !69

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !70
  %1 = bitcast i8* %call to i64*, !dbg !72
  store i64* %1, i64** %data.addr, align 8, !dbg !73
  %2 = load i64*, i64** %data.addr, align 8, !dbg !74
  %cmp = icmp eq i64* %2, null, !dbg !76
  br i1 %cmp, label %if.then1, label %if.end, !dbg !77

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data.addr, align 8, !dbg !80
  store i64 2147483643, i64* %3, align 8, !dbg !81
  br label %if.end2, !dbg !82

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data.addr, align 8, !dbg !83
  ret i64* %4, !dbg !84
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_badSource", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{!4, !4}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 24, type: !4)
!22 = !DILocation(line: 24, column: 84, scope: !17)
!23 = !DILocation(line: 26, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !18, line: 26, column: 8)
!25 = !DILocation(line: 26, column: 8, scope: !17)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !18, line: 27, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 14, scope: !27)
!30 = !DILocation(line: 31, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !18, line: 31, column: 13)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 13, scope: !27)
!34 = !DILocation(line: 31, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !18, line: 31, column: 27)
!36 = !DILocation(line: 32, column: 10, scope: !27)
!37 = !DILocation(line: 32, column: 15, scope: !27)
!38 = !DILocation(line: 33, column: 5, scope: !27)
!39 = !DILocation(line: 34, column: 12, scope: !17)
!40 = !DILocation(line: 34, column: 5, scope: !17)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B1Source", scope: !18, file: !18, line: 46, type: !19, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !18, line: 46, type: !4)
!43 = !DILocation(line: 46, column: 89, scope: !41)
!44 = !DILocation(line: 48, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !18, line: 48, column: 8)
!46 = !DILocation(line: 48, column: 8, scope: !41)
!47 = !DILocation(line: 51, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !18, line: 49, column: 5)
!49 = !DILocation(line: 52, column: 5, scope: !48)
!50 = !DILocation(line: 56, column: 27, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !18, line: 54, column: 5)
!52 = !DILocation(line: 56, column: 16, scope: !51)
!53 = !DILocation(line: 56, column: 14, scope: !51)
!54 = !DILocation(line: 57, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !18, line: 57, column: 13)
!56 = !DILocation(line: 57, column: 18, scope: !55)
!57 = !DILocation(line: 57, column: 13, scope: !51)
!58 = !DILocation(line: 57, column: 28, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !18, line: 57, column: 27)
!60 = !DILocation(line: 58, column: 10, scope: !51)
!61 = !DILocation(line: 58, column: 15, scope: !51)
!62 = !DILocation(line: 60, column: 12, scope: !41)
!63 = !DILocation(line: 60, column: 5, scope: !41)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_22_goodG2B2Source", scope: !18, file: !18, line: 64, type: !19, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", arg: 1, scope: !64, file: !18, line: 64, type: !4)
!66 = !DILocation(line: 64, column: 89, scope: !64)
!67 = !DILocation(line: 66, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !18, line: 66, column: 8)
!69 = !DILocation(line: 66, column: 8, scope: !64)
!70 = !DILocation(line: 69, column: 27, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !18, line: 67, column: 5)
!72 = !DILocation(line: 69, column: 16, scope: !71)
!73 = !DILocation(line: 69, column: 14, scope: !71)
!74 = !DILocation(line: 70, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !18, line: 70, column: 13)
!76 = !DILocation(line: 70, column: 18, scope: !75)
!77 = !DILocation(line: 70, column: 13, scope: !71)
!78 = !DILocation(line: 70, column: 28, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !18, line: 70, column: 27)
!80 = !DILocation(line: 71, column: 10, scope: !71)
!81 = !DILocation(line: 71, column: 15, scope: !71)
!82 = !DILocation(line: 72, column: 5, scope: !71)
!83 = !DILocation(line: 73, column: 12, scope: !64)
!84 = !DILocation(line: 73, column: 5, scope: !64)
