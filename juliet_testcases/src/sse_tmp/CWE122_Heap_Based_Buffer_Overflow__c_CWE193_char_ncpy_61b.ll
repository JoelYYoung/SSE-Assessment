; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b_badSource(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %call = call noalias align 16 i8* @malloc(i64 10) #4, !dbg !19
  store i8* %call, i8** %data.addr, align 8, !dbg !20
  %0 = load i8*, i8** %data.addr, align 8, !dbg !21
  %cmp = icmp eq i8* %0, null, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !25
  unreachable, !dbg !25

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !27
  ret i8* %1, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b_goodG2BSource(i8* %data) #0 !dbg !29 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !30, metadata !DIExpression()), !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 11) #4, !dbg !32
  store i8* %call, i8** %data.addr, align 8, !dbg !33
  %0 = load i8*, i8** %data.addr, align 8, !dbg !34
  %cmp = icmp eq i8* %0, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !40
  ret i8* %1, !dbg !41
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b_badSource", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 83, scope: !13)
!19 = !DILocation(line: 31, column: 20, scope: !13)
!20 = !DILocation(line: 31, column: 10, scope: !13)
!21 = !DILocation(line: 32, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 9)
!23 = !DILocation(line: 32, column: 14, scope: !22)
!24 = !DILocation(line: 32, column: 9, scope: !13)
!25 = !DILocation(line: 32, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !14, line: 32, column: 23)
!27 = !DILocation(line: 33, column: 12, scope: !13)
!28 = !DILocation(line: 33, column: 5, scope: !13)
!29 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_61b_goodG2BSource", scope: !14, file: !14, line: 41, type: !15, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocalVariable(name: "data", arg: 1, scope: !29, file: !14, line: 41, type: !4)
!31 = !DILocation(line: 41, column: 87, scope: !29)
!32 = !DILocation(line: 44, column: 20, scope: !29)
!33 = !DILocation(line: 44, column: 10, scope: !29)
!34 = !DILocation(line: 45, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !14, line: 45, column: 9)
!36 = !DILocation(line: 45, column: 14, scope: !35)
!37 = !DILocation(line: 45, column: 9, scope: !29)
!38 = !DILocation(line: 45, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !14, line: 45, column: 23)
!40 = !DILocation(line: 46, column: 12, scope: !29)
!41 = !DILocation(line: 46, column: 5, scope: !29)
