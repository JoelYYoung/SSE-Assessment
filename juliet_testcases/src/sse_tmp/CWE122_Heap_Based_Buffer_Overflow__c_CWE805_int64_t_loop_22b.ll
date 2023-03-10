; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_badSource(i64* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_badGlobal, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end2, !dbg !25

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !26
  %1 = bitcast i8* %call to i64*, !dbg !28
  store i64* %1, i64** %data.addr, align 8, !dbg !29
  %2 = load i64*, i64** %data.addr, align 8, !dbg !30
  %cmp = icmp eq i64* %2, null, !dbg !32
  br i1 %cmp, label %if.then1, label %if.end, !dbg !33

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !36

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i64*, i64** %data.addr, align 8, !dbg !37
  ret i64* %3, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B1Source(i64* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B1Global, align 4, !dbg !42
  %tobool = icmp ne i32 %0, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.else, !dbg !44

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !45
  br label %if.end2, !dbg !47

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #5, !dbg !48
  %1 = bitcast i8* %call to i64*, !dbg !50
  store i64* %1, i64** %data.addr, align 8, !dbg !51
  %2 = load i64*, i64** %data.addr, align 8, !dbg !52
  %cmp = icmp eq i64* %2, null, !dbg !54
  br i1 %cmp, label %if.then1, label %if.end, !dbg !55

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i64*, i64** %data.addr, align 8, !dbg !58
  ret i64* %3, !dbg !59
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B2Source(i64* %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B2Global, align 4, !dbg !63
  %tobool = icmp ne i32 %0, 0, !dbg !63
  br i1 %tobool, label %if.then, label %if.end2, !dbg !65

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #5, !dbg !66
  %1 = bitcast i8* %call to i64*, !dbg !68
  store i64* %1, i64** %data.addr, align 8, !dbg !69
  %2 = load i64*, i64** %data.addr, align 8, !dbg !70
  %cmp = icmp eq i64* %2, null, !dbg !72
  br i1 %cmp, label %if.then1, label %if.end, !dbg !73

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !76

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i64*, i64** %data.addr, align 8, !dbg !77
  ret i64* %3, !dbg !78
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_badSource", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{!4, !4}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 24, type: !4)
!22 = !DILocation(line: 24, column: 91, scope: !17)
!23 = !DILocation(line: 26, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !18, line: 26, column: 8)
!25 = !DILocation(line: 26, column: 8, scope: !17)
!26 = !DILocation(line: 29, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !18, line: 27, column: 5)
!28 = !DILocation(line: 29, column: 16, scope: !27)
!29 = !DILocation(line: 29, column: 14, scope: !27)
!30 = !DILocation(line: 30, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !18, line: 30, column: 13)
!32 = !DILocation(line: 30, column: 18, scope: !31)
!33 = !DILocation(line: 30, column: 13, scope: !27)
!34 = !DILocation(line: 30, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !18, line: 30, column: 27)
!36 = !DILocation(line: 31, column: 5, scope: !27)
!37 = !DILocation(line: 32, column: 12, scope: !17)
!38 = !DILocation(line: 32, column: 5, scope: !17)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B1Source", scope: !18, file: !18, line: 44, type: !19, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !18, line: 44, type: !4)
!41 = !DILocation(line: 44, column: 96, scope: !39)
!42 = !DILocation(line: 46, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !18, line: 46, column: 8)
!44 = !DILocation(line: 46, column: 8, scope: !39)
!45 = !DILocation(line: 49, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !18, line: 47, column: 5)
!47 = !DILocation(line: 50, column: 5, scope: !46)
!48 = !DILocation(line: 54, column: 27, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !18, line: 52, column: 5)
!50 = !DILocation(line: 54, column: 16, scope: !49)
!51 = !DILocation(line: 54, column: 14, scope: !49)
!52 = !DILocation(line: 55, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !18, line: 55, column: 13)
!54 = !DILocation(line: 55, column: 18, scope: !53)
!55 = !DILocation(line: 55, column: 13, scope: !49)
!56 = !DILocation(line: 55, column: 28, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !18, line: 55, column: 27)
!58 = !DILocation(line: 57, column: 12, scope: !39)
!59 = !DILocation(line: 57, column: 5, scope: !39)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B2Source", scope: !18, file: !18, line: 61, type: !19, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !18, line: 61, type: !4)
!62 = !DILocation(line: 61, column: 96, scope: !60)
!63 = !DILocation(line: 63, column: 8, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !18, line: 63, column: 8)
!65 = !DILocation(line: 63, column: 8, scope: !60)
!66 = !DILocation(line: 66, column: 27, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !18, line: 64, column: 5)
!68 = !DILocation(line: 66, column: 16, scope: !67)
!69 = !DILocation(line: 66, column: 14, scope: !67)
!70 = !DILocation(line: 67, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !18, line: 67, column: 13)
!72 = !DILocation(line: 67, column: 18, scope: !71)
!73 = !DILocation(line: 67, column: 13, scope: !67)
!74 = !DILocation(line: 67, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !18, line: 67, column: 27)
!76 = !DILocation(line: 68, column: 5, scope: !67)
!77 = !DILocation(line: 69, column: 12, scope: !60)
!78 = !DILocation(line: 69, column: 5, scope: !60)
