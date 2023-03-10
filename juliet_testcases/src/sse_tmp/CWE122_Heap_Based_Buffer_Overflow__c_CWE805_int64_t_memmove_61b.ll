; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_61b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_61b_badSource(i64* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !23
  %0 = bitcast i8* %call to i64*, !dbg !24
  store i64* %0, i64** %data.addr, align 8, !dbg !25
  %1 = load i64*, i64** %data.addr, align 8, !dbg !26
  %cmp = icmp eq i64* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data.addr, align 8, !dbg !32
  ret i64* %2, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_61b_goodG2BSource(i64* %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !35, metadata !DIExpression()), !dbg !36
  %call = call noalias align 16 i8* @malloc(i64 800) #4, !dbg !37
  %0 = bitcast i8* %call to i64*, !dbg !38
  store i64* %0, i64** %data.addr, align 8, !dbg !39
  %1 = load i64*, i64** %data.addr, align 8, !dbg !40
  %cmp = icmp eq i64* %1, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data.addr, align 8, !dbg !46
  ret i64* %2, !dbg !47
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_61b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_61b_badSource", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_61b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{!4, !4}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 21, type: !4)
!22 = !DILocation(line: 21, column: 95, scope: !17)
!23 = !DILocation(line: 24, column: 23, scope: !17)
!24 = !DILocation(line: 24, column: 12, scope: !17)
!25 = !DILocation(line: 24, column: 10, scope: !17)
!26 = !DILocation(line: 25, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !17, file: !18, line: 25, column: 9)
!28 = !DILocation(line: 25, column: 14, scope: !27)
!29 = !DILocation(line: 25, column: 9, scope: !17)
!30 = !DILocation(line: 25, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !18, line: 25, column: 23)
!32 = !DILocation(line: 26, column: 12, scope: !17)
!33 = !DILocation(line: 26, column: 5, scope: !17)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_61b_goodG2BSource", scope: !18, file: !18, line: 34, type: !19, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !18, line: 34, type: !4)
!36 = !DILocation(line: 34, column: 99, scope: !34)
!37 = !DILocation(line: 37, column: 23, scope: !34)
!38 = !DILocation(line: 37, column: 12, scope: !34)
!39 = !DILocation(line: 37, column: 10, scope: !34)
!40 = !DILocation(line: 38, column: 9, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !18, line: 38, column: 9)
!42 = !DILocation(line: 38, column: 14, scope: !41)
!43 = !DILocation(line: 38, column: 9, scope: !34)
!44 = !DILocation(line: 38, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !18, line: 38, column: 23)
!46 = !DILocation(line: 39, column: 12, scope: !34)
!47 = !DILocation(line: 39, column: 5, scope: !34)
