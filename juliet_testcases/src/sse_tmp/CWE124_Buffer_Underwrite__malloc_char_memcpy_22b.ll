; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_22b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__malloc_char_memcpy_22_badGlobal = external dso_local global i32, align 4
@CWE124_Buffer_Underwrite__malloc_char_memcpy_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE124_Buffer_Underwrite__malloc_char_memcpy_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE124_Buffer_Underwrite__malloc_char_memcpy_22_badSource(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__malloc_char_memcpy_22_badGlobal, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end2, !dbg !21

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !26
  store i8* %call, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %cmp = icmp eq i8* %1, null, !dbg !29
  br i1 %cmp, label %if.then1, label %if.end, !dbg !30

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !39
  br label %if.end2, !dbg !40

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !41
  ret i8* %5, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE124_Buffer_Underwrite__malloc_char_memcpy_22_goodG2B1Source(i8* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__malloc_char_memcpy_22_goodG2B1Global, align 4, !dbg !46
  %tobool = icmp ne i32 %0, 0, !dbg !46
  br i1 %tobool, label %if.then, label %if.else, !dbg !48

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !49
  br label %if.end2, !dbg !51

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !52, metadata !DIExpression()), !dbg !55
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !56
  store i8* %call, i8** %dataBuffer, align 8, !dbg !55
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !57
  %cmp = icmp eq i8* %1, null, !dbg !59
  br i1 %cmp, label %if.then1, label %if.end, !dbg !60

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !61
  unreachable, !dbg !61

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !64
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  store i8* %4, i8** %data.addr, align 8, !dbg !68
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data.addr, align 8, !dbg !69
  ret i8* %5, !dbg !70
}

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE124_Buffer_Underwrite__malloc_char_memcpy_22_goodG2B2Source(i8* %data) #0 !dbg !71 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__malloc_char_memcpy_22_goodG2B2Global, align 4, !dbg !74
  %tobool = icmp ne i32 %0, 0, !dbg !74
  br i1 %tobool, label %if.then, label %if.end2, !dbg !76

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !81
  store i8* %call, i8** %dataBuffer, align 8, !dbg !80
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  %cmp = icmp eq i8* %1, null, !dbg !84
  br i1 %cmp, label %if.then1, label %if.end, !dbg !85

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !89
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  store i8* %4, i8** %data.addr, align 8, !dbg !93
  br label %if.end2, !dbg !94

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !95
  ret i8* %5, !dbg !96
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memcpy_22_badSource", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_memcpy_22b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 26, type: !4)
!18 = !DILocation(line: 26, column: 73, scope: !13)
!19 = !DILocation(line: 28, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!21 = !DILocation(line: 28, column: 8, scope: !13)
!22 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !14, line: 31, type: !4)
!23 = distinct !DILexicalBlock(scope: !24, file: !14, line: 30, column: 9)
!24 = distinct !DILexicalBlock(scope: !20, file: !14, line: 29, column: 5)
!25 = !DILocation(line: 31, column: 20, scope: !23)
!26 = !DILocation(line: 31, column: 41, scope: !23)
!27 = !DILocation(line: 32, column: 17, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !14, line: 32, column: 17)
!29 = !DILocation(line: 32, column: 28, scope: !28)
!30 = !DILocation(line: 32, column: 17, scope: !23)
!31 = !DILocation(line: 32, column: 38, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !14, line: 32, column: 37)
!33 = !DILocation(line: 33, column: 20, scope: !23)
!34 = !DILocation(line: 33, column: 13, scope: !23)
!35 = !DILocation(line: 34, column: 13, scope: !23)
!36 = !DILocation(line: 34, column: 31, scope: !23)
!37 = !DILocation(line: 36, column: 20, scope: !23)
!38 = !DILocation(line: 36, column: 31, scope: !23)
!39 = !DILocation(line: 36, column: 18, scope: !23)
!40 = !DILocation(line: 38, column: 5, scope: !24)
!41 = !DILocation(line: 39, column: 12, scope: !13)
!42 = !DILocation(line: 39, column: 5, scope: !13)
!43 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memcpy_22_goodG2B1Source", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !14, line: 51, type: !4)
!45 = !DILocation(line: 51, column: 78, scope: !43)
!46 = !DILocation(line: 53, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !14, line: 53, column: 8)
!48 = !DILocation(line: 53, column: 8, scope: !43)
!49 = !DILocation(line: 56, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !14, line: 54, column: 5)
!51 = !DILocation(line: 57, column: 5, scope: !50)
!52 = !DILocalVariable(name: "dataBuffer", scope: !53, file: !14, line: 61, type: !4)
!53 = distinct !DILexicalBlock(scope: !54, file: !14, line: 60, column: 9)
!54 = distinct !DILexicalBlock(scope: !47, file: !14, line: 59, column: 5)
!55 = !DILocation(line: 61, column: 20, scope: !53)
!56 = !DILocation(line: 61, column: 41, scope: !53)
!57 = !DILocation(line: 62, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !14, line: 62, column: 17)
!59 = !DILocation(line: 62, column: 28, scope: !58)
!60 = !DILocation(line: 62, column: 17, scope: !53)
!61 = !DILocation(line: 62, column: 38, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !14, line: 62, column: 37)
!63 = !DILocation(line: 63, column: 20, scope: !53)
!64 = !DILocation(line: 63, column: 13, scope: !53)
!65 = !DILocation(line: 64, column: 13, scope: !53)
!66 = !DILocation(line: 64, column: 31, scope: !53)
!67 = !DILocation(line: 66, column: 20, scope: !53)
!68 = !DILocation(line: 66, column: 18, scope: !53)
!69 = !DILocation(line: 69, column: 12, scope: !43)
!70 = !DILocation(line: 69, column: 5, scope: !43)
!71 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_memcpy_22_goodG2B2Source", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", arg: 1, scope: !71, file: !14, line: 73, type: !4)
!73 = !DILocation(line: 73, column: 78, scope: !71)
!74 = !DILocation(line: 75, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !14, line: 75, column: 8)
!76 = !DILocation(line: 75, column: 8, scope: !71)
!77 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !14, line: 78, type: !4)
!78 = distinct !DILexicalBlock(scope: !79, file: !14, line: 77, column: 9)
!79 = distinct !DILexicalBlock(scope: !75, file: !14, line: 76, column: 5)
!80 = !DILocation(line: 78, column: 20, scope: !78)
!81 = !DILocation(line: 78, column: 41, scope: !78)
!82 = !DILocation(line: 79, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !14, line: 79, column: 17)
!84 = !DILocation(line: 79, column: 28, scope: !83)
!85 = !DILocation(line: 79, column: 17, scope: !78)
!86 = !DILocation(line: 79, column: 38, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !14, line: 79, column: 37)
!88 = !DILocation(line: 80, column: 20, scope: !78)
!89 = !DILocation(line: 80, column: 13, scope: !78)
!90 = !DILocation(line: 81, column: 13, scope: !78)
!91 = !DILocation(line: 81, column: 31, scope: !78)
!92 = !DILocation(line: 83, column: 20, scope: !78)
!93 = !DILocation(line: 83, column: 18, scope: !78)
!94 = !DILocation(line: 85, column: 5, scope: !79)
!95 = !DILocation(line: 86, column: 12, scope: !71)
!96 = !DILocation(line: 86, column: 5, scope: !71)
