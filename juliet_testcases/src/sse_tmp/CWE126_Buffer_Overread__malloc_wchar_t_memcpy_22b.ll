; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_badGlobal = external dso_local global i32, align 4
@CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_badSource(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_badGlobal, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !24
  %1 = bitcast i8* %call to i32*, !dbg !26
  store i32* %1, i32** %data.addr, align 8, !dbg !27
  %2 = load i32*, i32** %data.addr, align 8, !dbg !28
  %cmp = icmp eq i32* %2, null, !dbg !30
  br i1 %cmp, label %if.then1, label %if.end, !dbg !31

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !34
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !35
  %4 = load i32*, i32** %data.addr, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
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
define dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_goodG2B1Source(i32* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_goodG2B1Global, align 4, !dbg !44
  %tobool = icmp ne i32 %0, 0, !dbg !44
  br i1 %tobool, label %if.then, label %if.else, !dbg !46

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end3, !dbg !49

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !50
  %1 = bitcast i8* %call to i32*, !dbg !52
  store i32* %1, i32** %data.addr, align 8, !dbg !53
  %2 = load i32*, i32** %data.addr, align 8, !dbg !54
  %cmp = icmp eq i32* %2, null, !dbg !56
  br i1 %cmp, label %if.then1, label %if.end, !dbg !57

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data.addr, align 8, !dbg !60
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !61
  %4 = load i32*, i32** %data.addr, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !62
  store i32 0, i32* %arrayidx, align 4, !dbg !63
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i32*, i32** %data.addr, align 8, !dbg !64
  ret i32* %5, !dbg !65
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_goodG2B2Source(i32* %data) #0 !dbg !66 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i32, i32* @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_goodG2B2Global, align 4, !dbg !69
  %tobool = icmp ne i32 %0, 0, !dbg !69
  br i1 %tobool, label %if.then, label %if.end3, !dbg !71

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !72
  %1 = bitcast i8* %call to i32*, !dbg !74
  store i32* %1, i32** %data.addr, align 8, !dbg !75
  %2 = load i32*, i32** %data.addr, align 8, !dbg !76
  %cmp = icmp eq i32* %2, null, !dbg !78
  br i1 %cmp, label %if.then1, label %if.end, !dbg !79

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !82
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !83
  %4 = load i32*, i32** %data.addr, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  br label %if.end3, !dbg !86

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i32*, i32** %data.addr, align 8, !dbg !87
  ret i32* %5, !dbg !88
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_badSource", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{!4, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 80, scope: !15)
!21 = !DILocation(line: 28, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!23 = !DILocation(line: 28, column: 8, scope: !15)
!24 = !DILocation(line: 31, column: 27, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !16, line: 29, column: 5)
!26 = !DILocation(line: 31, column: 16, scope: !25)
!27 = !DILocation(line: 31, column: 14, scope: !25)
!28 = !DILocation(line: 32, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !16, line: 32, column: 13)
!30 = !DILocation(line: 32, column: 18, scope: !29)
!31 = !DILocation(line: 32, column: 13, scope: !25)
!32 = !DILocation(line: 32, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !16, line: 32, column: 27)
!34 = !DILocation(line: 33, column: 17, scope: !25)
!35 = !DILocation(line: 33, column: 9, scope: !25)
!36 = !DILocation(line: 34, column: 9, scope: !25)
!37 = !DILocation(line: 34, column: 20, scope: !25)
!38 = !DILocation(line: 35, column: 5, scope: !25)
!39 = !DILocation(line: 36, column: 12, scope: !15)
!40 = !DILocation(line: 36, column: 5, scope: !15)
!41 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_goodG2B1Source", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !16, line: 48, type: !4)
!43 = !DILocation(line: 48, column: 85, scope: !41)
!44 = !DILocation(line: 50, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !16, line: 50, column: 8)
!46 = !DILocation(line: 50, column: 8, scope: !41)
!47 = !DILocation(line: 53, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !16, line: 51, column: 5)
!49 = !DILocation(line: 54, column: 5, scope: !48)
!50 = !DILocation(line: 58, column: 27, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !16, line: 56, column: 5)
!52 = !DILocation(line: 58, column: 16, scope: !51)
!53 = !DILocation(line: 58, column: 14, scope: !51)
!54 = !DILocation(line: 59, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !16, line: 59, column: 13)
!56 = !DILocation(line: 59, column: 18, scope: !55)
!57 = !DILocation(line: 59, column: 13, scope: !51)
!58 = !DILocation(line: 59, column: 28, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !16, line: 59, column: 27)
!60 = !DILocation(line: 60, column: 17, scope: !51)
!61 = !DILocation(line: 60, column: 9, scope: !51)
!62 = !DILocation(line: 61, column: 9, scope: !51)
!63 = !DILocation(line: 61, column: 21, scope: !51)
!64 = !DILocation(line: 63, column: 12, scope: !41)
!65 = !DILocation(line: 63, column: 5, scope: !41)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_22_goodG2B2Source", scope: !16, file: !16, line: 67, type: !17, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", arg: 1, scope: !66, file: !16, line: 67, type: !4)
!68 = !DILocation(line: 67, column: 85, scope: !66)
!69 = !DILocation(line: 69, column: 8, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !16, line: 69, column: 8)
!71 = !DILocation(line: 69, column: 8, scope: !66)
!72 = !DILocation(line: 72, column: 27, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !16, line: 70, column: 5)
!74 = !DILocation(line: 72, column: 16, scope: !73)
!75 = !DILocation(line: 72, column: 14, scope: !73)
!76 = !DILocation(line: 73, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !16, line: 73, column: 13)
!78 = !DILocation(line: 73, column: 18, scope: !77)
!79 = !DILocation(line: 73, column: 13, scope: !73)
!80 = !DILocation(line: 73, column: 28, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !16, line: 73, column: 27)
!82 = !DILocation(line: 74, column: 17, scope: !73)
!83 = !DILocation(line: 74, column: 9, scope: !73)
!84 = !DILocation(line: 75, column: 9, scope: !73)
!85 = !DILocation(line: 75, column: 21, scope: !73)
!86 = !DILocation(line: 76, column: 5, scope: !73)
!87 = !DILocation(line: 77, column: 12, scope: !66)
!88 = !DILocation(line: 77, column: 5, scope: !66)
