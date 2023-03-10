; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_61b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_61b_badSource(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !24
  %0 = bitcast i8* %call to i32*, !dbg !25
  store i32* %0, i32** %dataBuffer, align 8, !dbg !23
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !33
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !37
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !38
  %5 = load i32*, i32** %data.addr, align 8, !dbg !39
  ret i32* %5, !dbg !40
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
define dso_local i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_61b_goodG2BSource(i32* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !44, metadata !DIExpression()), !dbg !46
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !47
  %0 = bitcast i8* %call to i32*, !dbg !48
  store i32* %0, i32** %dataBuffer, align 8, !dbg !46
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !49
  %cmp = icmp eq i32* %1, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !53
  unreachable, !dbg !53

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !55
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !56
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !58
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  store i32* %4, i32** %data.addr, align 8, !dbg !60
  %5 = load i32*, i32** %data.addr, align 8, !dbg !61
  ret i32* %5, !dbg !62
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_61b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_61b_badSource", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_61b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{!4, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 84, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !16, line: 26, type: !4)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 25, column: 5)
!23 = !DILocation(line: 26, column: 19, scope: !22)
!24 = !DILocation(line: 26, column: 43, scope: !22)
!25 = !DILocation(line: 26, column: 32, scope: !22)
!26 = !DILocation(line: 27, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !16, line: 27, column: 13)
!28 = !DILocation(line: 27, column: 24, scope: !27)
!29 = !DILocation(line: 27, column: 13, scope: !22)
!30 = !DILocation(line: 27, column: 34, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !16, line: 27, column: 33)
!32 = !DILocation(line: 28, column: 17, scope: !22)
!33 = !DILocation(line: 28, column: 9, scope: !22)
!34 = !DILocation(line: 29, column: 9, scope: !22)
!35 = !DILocation(line: 29, column: 27, scope: !22)
!36 = !DILocation(line: 31, column: 16, scope: !22)
!37 = !DILocation(line: 31, column: 27, scope: !22)
!38 = !DILocation(line: 31, column: 14, scope: !22)
!39 = !DILocation(line: 33, column: 12, scope: !15)
!40 = !DILocation(line: 33, column: 5, scope: !15)
!41 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_61b_goodG2BSource", scope: !16, file: !16, line: 41, type: !17, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !16, line: 41, type: !4)
!43 = !DILocation(line: 41, column: 88, scope: !41)
!44 = !DILocalVariable(name: "dataBuffer", scope: !45, file: !16, line: 44, type: !4)
!45 = distinct !DILexicalBlock(scope: !41, file: !16, line: 43, column: 5)
!46 = !DILocation(line: 44, column: 19, scope: !45)
!47 = !DILocation(line: 44, column: 43, scope: !45)
!48 = !DILocation(line: 44, column: 32, scope: !45)
!49 = !DILocation(line: 45, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !16, line: 45, column: 13)
!51 = !DILocation(line: 45, column: 24, scope: !50)
!52 = !DILocation(line: 45, column: 13, scope: !45)
!53 = !DILocation(line: 45, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !16, line: 45, column: 33)
!55 = !DILocation(line: 46, column: 17, scope: !45)
!56 = !DILocation(line: 46, column: 9, scope: !45)
!57 = !DILocation(line: 47, column: 9, scope: !45)
!58 = !DILocation(line: 47, column: 27, scope: !45)
!59 = !DILocation(line: 49, column: 16, scope: !45)
!60 = !DILocation(line: 49, column: 14, scope: !45)
!61 = !DILocation(line: 51, column: 12, scope: !41)
!62 = !DILocation(line: 51, column: 5, scope: !41)
