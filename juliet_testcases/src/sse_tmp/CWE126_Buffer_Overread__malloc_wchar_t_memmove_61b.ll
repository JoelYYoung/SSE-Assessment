; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b_badSource(i32* %data) #0 !dbg !15 {
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
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #4, !dbg !31
  %3 = load i32*, i32** %data.addr, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32*, i32** %data.addr, align 8, !dbg !34
  ret i32* %4, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b_goodG2BSource(i32* %data) #0 !dbg !36 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !39
  %0 = bitcast i8* %call to i32*, !dbg !40
  store i32* %0, i32** %data.addr, align 8, !dbg !41
  %1 = load i32*, i32** %data.addr, align 8, !dbg !42
  %cmp = icmp eq i32* %1, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !48
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !49
  %3 = load i32*, i32** %data.addr, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %4 = load i32*, i32** %data.addr, align 8, !dbg !52
  ret i32* %4, !dbg !53
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b_badSource", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{!4, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 82, scope: !15)
!21 = !DILocation(line: 26, column: 23, scope: !15)
!22 = !DILocation(line: 26, column: 12, scope: !15)
!23 = !DILocation(line: 26, column: 10, scope: !15)
!24 = !DILocation(line: 27, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !15, file: !16, line: 27, column: 9)
!26 = !DILocation(line: 27, column: 14, scope: !25)
!27 = !DILocation(line: 27, column: 9, scope: !15)
!28 = !DILocation(line: 27, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !16, line: 27, column: 23)
!30 = !DILocation(line: 28, column: 13, scope: !15)
!31 = !DILocation(line: 28, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 5, scope: !15)
!33 = !DILocation(line: 29, column: 16, scope: !15)
!34 = !DILocation(line: 30, column: 12, scope: !15)
!35 = !DILocation(line: 30, column: 5, scope: !15)
!36 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b_goodG2BSource", scope: !16, file: !16, line: 38, type: !17, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "data", arg: 1, scope: !36, file: !16, line: 38, type: !4)
!38 = !DILocation(line: 38, column: 86, scope: !36)
!39 = !DILocation(line: 41, column: 23, scope: !36)
!40 = !DILocation(line: 41, column: 12, scope: !36)
!41 = !DILocation(line: 41, column: 10, scope: !36)
!42 = !DILocation(line: 42, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !16, line: 42, column: 9)
!44 = !DILocation(line: 42, column: 14, scope: !43)
!45 = !DILocation(line: 42, column: 9, scope: !36)
!46 = !DILocation(line: 42, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !16, line: 42, column: 23)
!48 = !DILocation(line: 43, column: 13, scope: !36)
!49 = !DILocation(line: 43, column: 5, scope: !36)
!50 = !DILocation(line: 44, column: 5, scope: !36)
!51 = !DILocation(line: 44, column: 17, scope: !36)
!52 = !DILocation(line: 45, column: 12, scope: !36)
!53 = !DILocation(line: 45, column: 5, scope: !36)
