; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_badSource(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_badGlobal, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !24
  %1 = bitcast i8* %call to i32*, !dbg !26
  store i32* %1, i32** %data.addr, align 8, !dbg !27
  %2 = load i32*, i32** %data.addr, align 8, !dbg !28
  %cmp = icmp eq i32* %2, null, !dbg !30
  br i1 %cmp, label %if.then1, label %if.end, !dbg !31

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !34

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !35
  ret i32* %3, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B1Source(i32* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B1Global, align 4, !dbg !40
  %tobool = icmp ne i32 %0, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end2, !dbg !45

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #5, !dbg !46
  %1 = bitcast i8* %call to i32*, !dbg !48
  store i32* %1, i32** %data.addr, align 8, !dbg !49
  %2 = load i32*, i32** %data.addr, align 8, !dbg !50
  %cmp = icmp eq i32* %2, null, !dbg !52
  br i1 %cmp, label %if.then1, label %if.end, !dbg !53

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !56
  ret i32* %3, !dbg !57
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B2Source(i32* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B2Global, align 4, !dbg !61
  %tobool = icmp ne i32 %0, 0, !dbg !61
  br i1 %tobool, label %if.then, label %if.end2, !dbg !63

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #5, !dbg !64
  %1 = bitcast i8* %call to i32*, !dbg !66
  store i32* %1, i32** %data.addr, align 8, !dbg !67
  %2 = load i32*, i32** %data.addr, align 8, !dbg !68
  %cmp = icmp eq i32* %2, null, !dbg !70
  br i1 %cmp, label %if.then1, label %if.end, !dbg !71

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !74

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !75
  ret i32* %3, !dbg !76
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_badSource", scope: !16, file: !16, line: 31, type: !17, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{!4, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 91, scope: !15)
!21 = !DILocation(line: 33, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 8)
!23 = !DILocation(line: 33, column: 8, scope: !15)
!24 = !DILocation(line: 36, column: 27, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !16, line: 34, column: 5)
!26 = !DILocation(line: 36, column: 16, scope: !25)
!27 = !DILocation(line: 36, column: 14, scope: !25)
!28 = !DILocation(line: 37, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !16, line: 37, column: 13)
!30 = !DILocation(line: 37, column: 18, scope: !29)
!31 = !DILocation(line: 37, column: 13, scope: !25)
!32 = !DILocation(line: 37, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !16, line: 37, column: 27)
!34 = !DILocation(line: 38, column: 5, scope: !25)
!35 = !DILocation(line: 39, column: 12, scope: !15)
!36 = !DILocation(line: 39, column: 5, scope: !15)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B1Source", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !16, line: 51, type: !4)
!39 = !DILocation(line: 51, column: 96, scope: !37)
!40 = !DILocation(line: 53, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !16, line: 53, column: 8)
!42 = !DILocation(line: 53, column: 8, scope: !37)
!43 = !DILocation(line: 56, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !16, line: 54, column: 5)
!45 = !DILocation(line: 57, column: 5, scope: !44)
!46 = !DILocation(line: 61, column: 27, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !16, line: 59, column: 5)
!48 = !DILocation(line: 61, column: 16, scope: !47)
!49 = !DILocation(line: 61, column: 14, scope: !47)
!50 = !DILocation(line: 62, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !16, line: 62, column: 13)
!52 = !DILocation(line: 62, column: 18, scope: !51)
!53 = !DILocation(line: 62, column: 13, scope: !47)
!54 = !DILocation(line: 62, column: 28, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !16, line: 62, column: 27)
!56 = !DILocation(line: 64, column: 12, scope: !37)
!57 = !DILocation(line: 64, column: 5, scope: !37)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_22_goodG2B2Source", scope: !16, file: !16, line: 68, type: !17, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !16, line: 68, type: !4)
!60 = !DILocation(line: 68, column: 96, scope: !58)
!61 = !DILocation(line: 70, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !16, line: 70, column: 8)
!63 = !DILocation(line: 70, column: 8, scope: !58)
!64 = !DILocation(line: 73, column: 27, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !16, line: 71, column: 5)
!66 = !DILocation(line: 73, column: 16, scope: !65)
!67 = !DILocation(line: 73, column: 14, scope: !65)
!68 = !DILocation(line: 74, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !16, line: 74, column: 13)
!70 = !DILocation(line: 74, column: 18, scope: !69)
!71 = !DILocation(line: 74, column: 13, scope: !65)
!72 = !DILocation(line: 74, column: 28, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !16, line: 74, column: 27)
!74 = !DILocation(line: 75, column: 5, scope: !65)
!75 = !DILocation(line: 76, column: 12, scope: !58)
!76 = !DILocation(line: 76, column: 5, scope: !58)
