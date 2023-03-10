; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_22b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_char_loop_22_badGlobal = external dso_local global i32, align 4
@CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE126_Buffer_Overread__malloc_char_loop_22_badSource(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @CWE126_Buffer_Overread__malloc_char_loop_22_badGlobal, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end2, !dbg !21

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !22
  store i8* %call, i8** %data.addr, align 8, !dbg !24
  %1 = load i8*, i8** %data.addr, align 8, !dbg !25
  %cmp = icmp eq i8* %1, null, !dbg !27
  br i1 %cmp, label %if.then1, label %if.end, !dbg !28

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !32
  %3 = load i8*, i8** %data.addr, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end2, !dbg !35

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i8*, i8** %data.addr, align 8, !dbg !36
  ret i8* %4, !dbg !37
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
define dso_local i8* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B1Source(i8* %data) #0 !dbg !38 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i32, i32* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B1Global, align 4, !dbg !41
  %tobool = icmp ne i32 %0, 0, !dbg !41
  br i1 %tobool, label %if.then, label %if.else, !dbg !43

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end2, !dbg !46

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !47
  store i8* %call, i8** %data.addr, align 8, !dbg !49
  %1 = load i8*, i8** %data.addr, align 8, !dbg !50
  %cmp = icmp eq i8* %1, null, !dbg !52
  br i1 %cmp, label %if.then1, label %if.end, !dbg !53

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data.addr, align 8, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !57
  %3 = load i8*, i8** %data.addr, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !58
  store i8 0, i8* %arrayidx, align 1, !dbg !59
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i8*, i8** %data.addr, align 8, !dbg !60
  ret i8* %4, !dbg !61
}

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B2Source(i8* %data) #0 !dbg !62 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i32, i32* @CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B2Global, align 4, !dbg !65
  %tobool = icmp ne i32 %0, 0, !dbg !65
  br i1 %tobool, label %if.then, label %if.end2, !dbg !67

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !68
  store i8* %call, i8** %data.addr, align 8, !dbg !70
  %1 = load i8*, i8** %data.addr, align 8, !dbg !71
  %cmp = icmp eq i8* %1, null, !dbg !73
  br i1 %cmp, label %if.then1, label %if.end, !dbg !74

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !78
  %3 = load i8*, i8** %data.addr, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  br label %if.end2, !dbg !81

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i8*, i8** %data.addr, align 8, !dbg !82
  ret i8* %4, !dbg !83
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_22_badSource", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_22b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 26, type: !4)
!18 = !DILocation(line: 26, column: 69, scope: !13)
!19 = !DILocation(line: 28, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!21 = !DILocation(line: 28, column: 8, scope: !13)
!22 = !DILocation(line: 31, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !14, line: 29, column: 5)
!24 = !DILocation(line: 31, column: 14, scope: !23)
!25 = !DILocation(line: 32, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !14, line: 32, column: 13)
!27 = !DILocation(line: 32, column: 18, scope: !26)
!28 = !DILocation(line: 32, column: 13, scope: !23)
!29 = !DILocation(line: 32, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !14, line: 32, column: 27)
!31 = !DILocation(line: 33, column: 16, scope: !23)
!32 = !DILocation(line: 33, column: 9, scope: !23)
!33 = !DILocation(line: 34, column: 9, scope: !23)
!34 = !DILocation(line: 34, column: 20, scope: !23)
!35 = !DILocation(line: 35, column: 5, scope: !23)
!36 = !DILocation(line: 36, column: 12, scope: !13)
!37 = !DILocation(line: 36, column: 5, scope: !13)
!38 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B1Source", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "data", arg: 1, scope: !38, file: !14, line: 48, type: !4)
!40 = !DILocation(line: 48, column: 74, scope: !38)
!41 = !DILocation(line: 50, column: 8, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !14, line: 50, column: 8)
!43 = !DILocation(line: 50, column: 8, scope: !38)
!44 = !DILocation(line: 53, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !14, line: 51, column: 5)
!46 = !DILocation(line: 54, column: 5, scope: !45)
!47 = !DILocation(line: 58, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !14, line: 56, column: 5)
!49 = !DILocation(line: 58, column: 14, scope: !48)
!50 = !DILocation(line: 59, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !14, line: 59, column: 13)
!52 = !DILocation(line: 59, column: 18, scope: !51)
!53 = !DILocation(line: 59, column: 13, scope: !48)
!54 = !DILocation(line: 59, column: 28, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !14, line: 59, column: 27)
!56 = !DILocation(line: 60, column: 16, scope: !48)
!57 = !DILocation(line: 60, column: 9, scope: !48)
!58 = !DILocation(line: 61, column: 9, scope: !48)
!59 = !DILocation(line: 61, column: 21, scope: !48)
!60 = !DILocation(line: 63, column: 12, scope: !38)
!61 = !DILocation(line: 63, column: 5, scope: !38)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_22_goodG2B2Source", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !14, line: 67, type: !4)
!64 = !DILocation(line: 67, column: 74, scope: !62)
!65 = !DILocation(line: 69, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !14, line: 69, column: 8)
!67 = !DILocation(line: 69, column: 8, scope: !62)
!68 = !DILocation(line: 72, column: 24, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !14, line: 70, column: 5)
!70 = !DILocation(line: 72, column: 14, scope: !69)
!71 = !DILocation(line: 73, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !14, line: 73, column: 13)
!73 = !DILocation(line: 73, column: 18, scope: !72)
!74 = !DILocation(line: 73, column: 13, scope: !69)
!75 = !DILocation(line: 73, column: 28, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !14, line: 73, column: 27)
!77 = !DILocation(line: 74, column: 16, scope: !69)
!78 = !DILocation(line: 74, column: 9, scope: !69)
!79 = !DILocation(line: 75, column: 9, scope: !69)
!80 = !DILocation(line: 75, column: 21, scope: !69)
!81 = !DILocation(line: 76, column: 5, scope: !69)
!82 = !DILocation(line: 77, column: 12, scope: !62)
!83 = !DILocation(line: 77, column: 5, scope: !62)
