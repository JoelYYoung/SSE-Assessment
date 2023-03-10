; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_badGlobal = external dso_local global i32, align 4
@CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_badSource(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_badGlobal, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !28
  %1 = bitcast i8* %call to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %2, null, !dbg !32
  br i1 %cmp, label %if.then1, label %if.end, !dbg !33

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !42
  br label %if.end3, !dbg !43

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !44
  ret i32* %6, !dbg !45
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
define dso_local i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_goodG2B1Source(i32* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_goodG2B1Global, align 4, !dbg !49
  %tobool = icmp ne i32 %0, 0, !dbg !49
  br i1 %tobool, label %if.then, label %if.else, !dbg !51

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !52
  br label %if.end3, !dbg !54

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !55, metadata !DIExpression()), !dbg !58
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !59
  %1 = bitcast i8* %call to i32*, !dbg !60
  store i32* %1, i32** %dataBuffer, align 8, !dbg !58
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !61
  %cmp = icmp eq i32* %2, null, !dbg !63
  br i1 %cmp, label %if.then1, label %if.end, !dbg !64

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !65
  unreachable, !dbg !65

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !68
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !69
  store i32 0, i32* %arrayidx, align 4, !dbg !70
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !71
  store i32* %5, i32** %data.addr, align 8, !dbg !72
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data.addr, align 8, !dbg !73
  ret i32* %6, !dbg !74
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_goodG2B2Source(i32* %data) #0 !dbg !75 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_goodG2B2Global, align 4, !dbg !78
  %tobool = icmp ne i32 %0, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.end3, !dbg !80

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !85
  %1 = bitcast i8* %call to i32*, !dbg !86
  store i32* %1, i32** %dataBuffer, align 8, !dbg !84
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %cmp = icmp eq i32* %2, null, !dbg !89
  br i1 %cmp, label %if.then1, label %if.end, !dbg !90

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !94
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  store i32* %5, i32** %data.addr, align 8, !dbg !98
  br label %if.end3, !dbg !99

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !100
  ret i32* %6, !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_badSource", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{!4, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 82, scope: !15)
!21 = !DILocation(line: 28, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!23 = !DILocation(line: 28, column: 8, scope: !15)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !16, line: 31, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !16, line: 30, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !16, line: 29, column: 5)
!27 = !DILocation(line: 31, column: 23, scope: !25)
!28 = !DILocation(line: 31, column: 47, scope: !25)
!29 = !DILocation(line: 31, column: 36, scope: !25)
!30 = !DILocation(line: 32, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !25, file: !16, line: 32, column: 17)
!32 = !DILocation(line: 32, column: 28, scope: !31)
!33 = !DILocation(line: 32, column: 17, scope: !25)
!34 = !DILocation(line: 32, column: 38, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !16, line: 32, column: 37)
!36 = !DILocation(line: 33, column: 21, scope: !25)
!37 = !DILocation(line: 33, column: 13, scope: !25)
!38 = !DILocation(line: 34, column: 13, scope: !25)
!39 = !DILocation(line: 34, column: 31, scope: !25)
!40 = !DILocation(line: 36, column: 20, scope: !25)
!41 = !DILocation(line: 36, column: 31, scope: !25)
!42 = !DILocation(line: 36, column: 18, scope: !25)
!43 = !DILocation(line: 38, column: 5, scope: !26)
!44 = !DILocation(line: 39, column: 12, scope: !15)
!45 = !DILocation(line: 39, column: 5, scope: !15)
!46 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_goodG2B1Source", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !16, line: 51, type: !4)
!48 = !DILocation(line: 51, column: 87, scope: !46)
!49 = !DILocation(line: 53, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !16, line: 53, column: 8)
!51 = !DILocation(line: 53, column: 8, scope: !46)
!52 = !DILocation(line: 56, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !16, line: 54, column: 5)
!54 = !DILocation(line: 57, column: 5, scope: !53)
!55 = !DILocalVariable(name: "dataBuffer", scope: !56, file: !16, line: 61, type: !4)
!56 = distinct !DILexicalBlock(scope: !57, file: !16, line: 60, column: 9)
!57 = distinct !DILexicalBlock(scope: !50, file: !16, line: 59, column: 5)
!58 = !DILocation(line: 61, column: 23, scope: !56)
!59 = !DILocation(line: 61, column: 47, scope: !56)
!60 = !DILocation(line: 61, column: 36, scope: !56)
!61 = !DILocation(line: 62, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !16, line: 62, column: 17)
!63 = !DILocation(line: 62, column: 28, scope: !62)
!64 = !DILocation(line: 62, column: 17, scope: !56)
!65 = !DILocation(line: 62, column: 38, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !16, line: 62, column: 37)
!67 = !DILocation(line: 63, column: 21, scope: !56)
!68 = !DILocation(line: 63, column: 13, scope: !56)
!69 = !DILocation(line: 64, column: 13, scope: !56)
!70 = !DILocation(line: 64, column: 31, scope: !56)
!71 = !DILocation(line: 66, column: 20, scope: !56)
!72 = !DILocation(line: 66, column: 18, scope: !56)
!73 = !DILocation(line: 69, column: 12, scope: !46)
!74 = !DILocation(line: 69, column: 5, scope: !46)
!75 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_22_goodG2B2Source", scope: !16, file: !16, line: 73, type: !17, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", arg: 1, scope: !75, file: !16, line: 73, type: !4)
!77 = !DILocation(line: 73, column: 87, scope: !75)
!78 = !DILocation(line: 75, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !16, line: 75, column: 8)
!80 = !DILocation(line: 75, column: 8, scope: !75)
!81 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !16, line: 78, type: !4)
!82 = distinct !DILexicalBlock(scope: !83, file: !16, line: 77, column: 9)
!83 = distinct !DILexicalBlock(scope: !79, file: !16, line: 76, column: 5)
!84 = !DILocation(line: 78, column: 23, scope: !82)
!85 = !DILocation(line: 78, column: 47, scope: !82)
!86 = !DILocation(line: 78, column: 36, scope: !82)
!87 = !DILocation(line: 79, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !16, line: 79, column: 17)
!89 = !DILocation(line: 79, column: 28, scope: !88)
!90 = !DILocation(line: 79, column: 17, scope: !82)
!91 = !DILocation(line: 79, column: 38, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !16, line: 79, column: 37)
!93 = !DILocation(line: 80, column: 21, scope: !82)
!94 = !DILocation(line: 80, column: 13, scope: !82)
!95 = !DILocation(line: 81, column: 13, scope: !82)
!96 = !DILocation(line: 81, column: 31, scope: !82)
!97 = !DILocation(line: 83, column: 20, scope: !82)
!98 = !DILocation(line: 83, column: 18, scope: !82)
!99 = !DILocation(line: 85, column: 5, scope: !83)
!100 = !DILocation(line: 86, column: 12, scope: !75)
!101 = !DILocation(line: 86, column: 5, scope: !75)
