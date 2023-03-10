; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_badSource(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_badGlobal, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end2, !dbg !21

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #5, !dbg !22
  store i8* %call, i8** %data.addr, align 8, !dbg !24
  %1 = load i8*, i8** %data.addr, align 8, !dbg !25
  %cmp = icmp eq i8* %1, null, !dbg !27
  br i1 %cmp, label %if.then1, label %if.end, !dbg !28

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !31

if.end2:                                          ; preds = %if.end, %entry
  %2 = load i8*, i8** %data.addr, align 8, !dbg !32
  ret i8* %2, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B1Source(i8* %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B1Global, align 4, !dbg !37
  %tobool = icmp ne i32 %0, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !40
  br label %if.end2, !dbg !42

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #5, !dbg !43
  store i8* %call, i8** %data.addr, align 8, !dbg !45
  %1 = load i8*, i8** %data.addr, align 8, !dbg !46
  %cmp = icmp eq i8* %1, null, !dbg !48
  br i1 %cmp, label %if.then1, label %if.end, !dbg !49

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !50
  unreachable, !dbg !50

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !52
  ret i8* %2, !dbg !53
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B2Source(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B2Global, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.end2, !dbg !59

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #5, !dbg !60
  store i8* %call, i8** %data.addr, align 8, !dbg !62
  %1 = load i8*, i8** %data.addr, align 8, !dbg !63
  %cmp = icmp eq i8* %1, null, !dbg !65
  br i1 %cmp, label %if.then1, label %if.end, !dbg !66

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !67
  unreachable, !dbg !67

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !69

if.end2:                                          ; preds = %if.end, %entry
  %2 = load i8*, i8** %data.addr, align 8, !dbg !70
  ret i8* %2, !dbg !71
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_badSource", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 82, scope: !13)
!19 = !DILocation(line: 33, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 8)
!21 = !DILocation(line: 33, column: 8, scope: !13)
!22 = !DILocation(line: 36, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !14, line: 34, column: 5)
!24 = !DILocation(line: 36, column: 14, scope: !23)
!25 = !DILocation(line: 37, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !14, line: 37, column: 13)
!27 = !DILocation(line: 37, column: 18, scope: !26)
!28 = !DILocation(line: 37, column: 13, scope: !23)
!29 = !DILocation(line: 37, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !14, line: 37, column: 27)
!31 = !DILocation(line: 38, column: 5, scope: !23)
!32 = !DILocation(line: 39, column: 12, scope: !13)
!33 = !DILocation(line: 39, column: 5, scope: !13)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B1Source", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !14, line: 51, type: !4)
!36 = !DILocation(line: 51, column: 87, scope: !34)
!37 = !DILocation(line: 53, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !14, line: 53, column: 8)
!39 = !DILocation(line: 53, column: 8, scope: !34)
!40 = !DILocation(line: 56, column: 9, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !14, line: 54, column: 5)
!42 = !DILocation(line: 57, column: 5, scope: !41)
!43 = !DILocation(line: 61, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !14, line: 59, column: 5)
!45 = !DILocation(line: 61, column: 14, scope: !44)
!46 = !DILocation(line: 62, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !14, line: 62, column: 13)
!48 = !DILocation(line: 62, column: 18, scope: !47)
!49 = !DILocation(line: 62, column: 13, scope: !44)
!50 = !DILocation(line: 62, column: 28, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !14, line: 62, column: 27)
!52 = !DILocation(line: 64, column: 12, scope: !34)
!53 = !DILocation(line: 64, column: 5, scope: !34)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B2Source", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !14, line: 68, type: !4)
!56 = !DILocation(line: 68, column: 87, scope: !54)
!57 = !DILocation(line: 70, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !14, line: 70, column: 8)
!59 = !DILocation(line: 70, column: 8, scope: !54)
!60 = !DILocation(line: 73, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !14, line: 71, column: 5)
!62 = !DILocation(line: 73, column: 14, scope: !61)
!63 = !DILocation(line: 74, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !14, line: 74, column: 13)
!65 = !DILocation(line: 74, column: 18, scope: !64)
!66 = !DILocation(line: 74, column: 13, scope: !61)
!67 = !DILocation(line: 74, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !14, line: 74, column: 27)
!69 = !DILocation(line: 75, column: 5, scope: !61)
!70 = !DILocation(line: 76, column: 12, scope: !54)
!71 = !DILocation(line: 76, column: 5, scope: !54)
