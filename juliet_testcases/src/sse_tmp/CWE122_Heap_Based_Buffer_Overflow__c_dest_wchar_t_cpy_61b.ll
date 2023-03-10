; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_61b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_61b_badSource(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 200) #4, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %data.addr, align 8, !dbg !23
  %1 = load i32*, i32** %data.addr, align 8, !dbg !24
  %cmp = icmp eq i32* %1, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %3 = load i32*, i32** %data.addr, align 8, !dbg !32
  ret i32* %3, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_61b_goodG2BSource(i32* %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !35, metadata !DIExpression()), !dbg !36
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !37
  %0 = bitcast i8* %call to i32*, !dbg !38
  store i32* %0, i32** %data.addr, align 8, !dbg !39
  %1 = load i32*, i32** %data.addr, align 8, !dbg !40
  %cmp = icmp eq i32* %1, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %3 = load i32*, i32** %data.addr, align 8, !dbg !48
  ret i32* %3, !dbg !49
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_61b_badSource", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{!4, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 89, scope: !15)
!21 = !DILocation(line: 26, column: 23, scope: !15)
!22 = !DILocation(line: 26, column: 12, scope: !15)
!23 = !DILocation(line: 26, column: 10, scope: !15)
!24 = !DILocation(line: 27, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !15, file: !16, line: 27, column: 9)
!26 = !DILocation(line: 27, column: 14, scope: !25)
!27 = !DILocation(line: 27, column: 9, scope: !15)
!28 = !DILocation(line: 27, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !16, line: 27, column: 23)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 28, column: 13, scope: !15)
!32 = !DILocation(line: 29, column: 12, scope: !15)
!33 = !DILocation(line: 29, column: 5, scope: !15)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_61b_goodG2BSource", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !16, line: 37, type: !4)
!36 = !DILocation(line: 37, column: 93, scope: !34)
!37 = !DILocation(line: 40, column: 23, scope: !34)
!38 = !DILocation(line: 40, column: 12, scope: !34)
!39 = !DILocation(line: 40, column: 10, scope: !34)
!40 = !DILocation(line: 41, column: 9, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !16, line: 41, column: 9)
!42 = !DILocation(line: 41, column: 14, scope: !41)
!43 = !DILocation(line: 41, column: 9, scope: !34)
!44 = !DILocation(line: 41, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !16, line: 41, column: 23)
!46 = !DILocation(line: 42, column: 5, scope: !34)
!47 = !DILocation(line: 42, column: 13, scope: !34)
!48 = !DILocation(line: 43, column: 12, scope: !34)
!49 = !DILocation(line: 43, column: 5, scope: !34)
