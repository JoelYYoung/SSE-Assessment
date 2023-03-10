; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_badSource(i32* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_badGlobal, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end2, !dbg !21

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !22
  %1 = bitcast i8* %call to i32*, !dbg !24
  store i32* %1, i32** %data.addr, align 8, !dbg !25
  %2 = load i32*, i32** %data.addr, align 8, !dbg !26
  %cmp = icmp eq i32* %2, null, !dbg !28
  br i1 %cmp, label %if.then1, label %if.end, !dbg !29

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !32

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !33
  ret i32* %3, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B1Source(i32* %data) #0 !dbg !35 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B1Global, align 4, !dbg !38
  %tobool = icmp ne i32 %0, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.else, !dbg !40

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %if.end2, !dbg !43

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !44
  %1 = bitcast i8* %call to i32*, !dbg !46
  store i32* %1, i32** %data.addr, align 8, !dbg !47
  %2 = load i32*, i32** %data.addr, align 8, !dbg !48
  %cmp = icmp eq i32* %2, null, !dbg !50
  br i1 %cmp, label %if.then1, label %if.end, !dbg !51

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !54
  ret i32* %3, !dbg !55
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B2Source(i32* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B2Global, align 4, !dbg !59
  %tobool = icmp ne i32 %0, 0, !dbg !59
  br i1 %tobool, label %if.then, label %if.end2, !dbg !61

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !62
  %1 = bitcast i8* %call to i32*, !dbg !64
  store i32* %1, i32** %data.addr, align 8, !dbg !65
  %2 = load i32*, i32** %data.addr, align 8, !dbg !66
  %cmp = icmp eq i32* %2, null, !dbg !68
  br i1 %cmp, label %if.then1, label %if.end, !dbg !69

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !70
  unreachable, !dbg !70

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !72

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !73
  ret i32* %3, !dbg !74
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_badSource", scope: !14, file: !14, line: 24, type: !15, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 24, type: !4)
!18 = !DILocation(line: 24, column: 81, scope: !13)
!19 = !DILocation(line: 26, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!21 = !DILocation(line: 26, column: 8, scope: !13)
!22 = !DILocation(line: 29, column: 23, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !14, line: 27, column: 5)
!24 = !DILocation(line: 29, column: 16, scope: !23)
!25 = !DILocation(line: 29, column: 14, scope: !23)
!26 = !DILocation(line: 30, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !14, line: 30, column: 13)
!28 = !DILocation(line: 30, column: 18, scope: !27)
!29 = !DILocation(line: 30, column: 13, scope: !23)
!30 = !DILocation(line: 30, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 27)
!32 = !DILocation(line: 31, column: 5, scope: !23)
!33 = !DILocation(line: 32, column: 12, scope: !13)
!34 = !DILocation(line: 32, column: 5, scope: !13)
!35 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B1Source", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocalVariable(name: "data", arg: 1, scope: !35, file: !14, line: 44, type: !4)
!37 = !DILocation(line: 44, column: 86, scope: !35)
!38 = !DILocation(line: 46, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !14, line: 46, column: 8)
!40 = !DILocation(line: 46, column: 8, scope: !35)
!41 = !DILocation(line: 49, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !14, line: 47, column: 5)
!43 = !DILocation(line: 50, column: 5, scope: !42)
!44 = !DILocation(line: 54, column: 23, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !14, line: 52, column: 5)
!46 = !DILocation(line: 54, column: 16, scope: !45)
!47 = !DILocation(line: 54, column: 14, scope: !45)
!48 = !DILocation(line: 55, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !14, line: 55, column: 13)
!50 = !DILocation(line: 55, column: 18, scope: !49)
!51 = !DILocation(line: 55, column: 13, scope: !45)
!52 = !DILocation(line: 55, column: 28, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !14, line: 55, column: 27)
!54 = !DILocation(line: 57, column: 12, scope: !35)
!55 = !DILocation(line: 57, column: 5, scope: !35)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B2Source", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !14, line: 61, type: !4)
!58 = !DILocation(line: 61, column: 86, scope: !56)
!59 = !DILocation(line: 63, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !14, line: 63, column: 8)
!61 = !DILocation(line: 63, column: 8, scope: !56)
!62 = !DILocation(line: 66, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !14, line: 64, column: 5)
!64 = !DILocation(line: 66, column: 16, scope: !63)
!65 = !DILocation(line: 66, column: 14, scope: !63)
!66 = !DILocation(line: 67, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !14, line: 67, column: 13)
!68 = !DILocation(line: 67, column: 18, scope: !67)
!69 = !DILocation(line: 67, column: 13, scope: !63)
!70 = !DILocation(line: 67, column: 28, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !14, line: 67, column: 27)
!72 = !DILocation(line: 68, column: 5, scope: !63)
!73 = !DILocation(line: 69, column: 12, scope: !56)
!74 = !DILocation(line: 69, column: 5, scope: !56)
