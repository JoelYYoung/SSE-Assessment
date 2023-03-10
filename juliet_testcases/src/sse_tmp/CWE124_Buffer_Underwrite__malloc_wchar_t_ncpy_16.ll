; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %while.body, !dbg !23

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !37
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data, align 8, !dbg !42
  br label %while.end, !dbg !43

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !51
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx3, align 4, !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !57
  store i32 0, i32* %arrayidx6, align 4, !dbg !58
  %7 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* %7), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  br label %while.body, !dbg !89

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !93
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !94
  %0 = bitcast i8* %call to i32*, !dbg !95
  store i32* %0, i32** %dataBuffer, align 8, !dbg !93
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq i32* %1, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !103
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  store i32* %4, i32** %data, align 8, !dbg !107
  br label %while.end, !dbg !108

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !113
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx3, align 4, !dbg !115
  %5 = load i32*, i32** %data, align 8, !dbg !116
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !118
  %6 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !119
  store i32 0, i32* %arrayidx6, align 4, !dbg !120
  %7 = load i32*, i32** %data, align 8, !dbg !121
  call void @printWLine(i32* %7), !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 5, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !17, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !17, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 23, scope: !25)
!28 = !DILocation(line: 30, column: 47, scope: !25)
!29 = !DILocation(line: 30, column: 36, scope: !25)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !25, file: !17, line: 31, column: 17)
!32 = !DILocation(line: 31, column: 28, scope: !31)
!33 = !DILocation(line: 31, column: 17, scope: !25)
!34 = !DILocation(line: 31, column: 38, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 37)
!36 = !DILocation(line: 32, column: 21, scope: !25)
!37 = !DILocation(line: 32, column: 13, scope: !25)
!38 = !DILocation(line: 33, column: 13, scope: !25)
!39 = !DILocation(line: 33, column: 31, scope: !25)
!40 = !DILocation(line: 35, column: 20, scope: !25)
!41 = !DILocation(line: 35, column: 31, scope: !25)
!42 = !DILocation(line: 35, column: 18, scope: !25)
!43 = !DILocation(line: 37, column: 9, scope: !26)
!44 = !DILocalVariable(name: "source", scope: !45, file: !17, line: 40, type: !46)
!45 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 40, column: 17, scope: !45)
!50 = !DILocation(line: 41, column: 17, scope: !45)
!51 = !DILocation(line: 41, column: 9, scope: !45)
!52 = !DILocation(line: 42, column: 9, scope: !45)
!53 = !DILocation(line: 42, column: 23, scope: !45)
!54 = !DILocation(line: 44, column: 17, scope: !45)
!55 = !DILocation(line: 44, column: 23, scope: !45)
!56 = !DILocation(line: 44, column: 9, scope: !45)
!57 = !DILocation(line: 46, column: 9, scope: !45)
!58 = !DILocation(line: 46, column: 21, scope: !45)
!59 = !DILocation(line: 47, column: 20, scope: !45)
!60 = !DILocation(line: 47, column: 9, scope: !45)
!61 = !DILocation(line: 51, column: 1, scope: !16)
!62 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_16_good", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 90, column: 5, scope: !62)
!64 = !DILocation(line: 91, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 103, type: !66, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!7, !7, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !17, line: 103, type: !7)
!72 = !DILocation(line: 103, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !17, line: 103, type: !68)
!74 = !DILocation(line: 103, column: 27, scope: !65)
!75 = !DILocation(line: 106, column: 22, scope: !65)
!76 = !DILocation(line: 106, column: 12, scope: !65)
!77 = !DILocation(line: 106, column: 5, scope: !65)
!78 = !DILocation(line: 108, column: 5, scope: !65)
!79 = !DILocation(line: 109, column: 5, scope: !65)
!80 = !DILocation(line: 110, column: 5, scope: !65)
!81 = !DILocation(line: 113, column: 5, scope: !65)
!82 = !DILocation(line: 114, column: 5, scope: !65)
!83 = !DILocation(line: 115, column: 5, scope: !65)
!84 = !DILocation(line: 117, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !17, line: 60, type: !4)
!87 = !DILocation(line: 60, column: 15, scope: !85)
!88 = !DILocation(line: 61, column: 10, scope: !85)
!89 = !DILocation(line: 62, column: 5, scope: !85)
!90 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !17, line: 65, type: !4)
!91 = distinct !DILexicalBlock(scope: !92, file: !17, line: 64, column: 9)
!92 = distinct !DILexicalBlock(scope: !85, file: !17, line: 63, column: 5)
!93 = !DILocation(line: 65, column: 23, scope: !91)
!94 = !DILocation(line: 65, column: 47, scope: !91)
!95 = !DILocation(line: 65, column: 36, scope: !91)
!96 = !DILocation(line: 66, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !17, line: 66, column: 17)
!98 = !DILocation(line: 66, column: 28, scope: !97)
!99 = !DILocation(line: 66, column: 17, scope: !91)
!100 = !DILocation(line: 66, column: 38, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !17, line: 66, column: 37)
!102 = !DILocation(line: 67, column: 21, scope: !91)
!103 = !DILocation(line: 67, column: 13, scope: !91)
!104 = !DILocation(line: 68, column: 13, scope: !91)
!105 = !DILocation(line: 68, column: 31, scope: !91)
!106 = !DILocation(line: 70, column: 20, scope: !91)
!107 = !DILocation(line: 70, column: 18, scope: !91)
!108 = !DILocation(line: 72, column: 9, scope: !92)
!109 = !DILocalVariable(name: "source", scope: !110, file: !17, line: 75, type: !46)
!110 = distinct !DILexicalBlock(scope: !85, file: !17, line: 74, column: 5)
!111 = !DILocation(line: 75, column: 17, scope: !110)
!112 = !DILocation(line: 76, column: 17, scope: !110)
!113 = !DILocation(line: 76, column: 9, scope: !110)
!114 = !DILocation(line: 77, column: 9, scope: !110)
!115 = !DILocation(line: 77, column: 23, scope: !110)
!116 = !DILocation(line: 79, column: 17, scope: !110)
!117 = !DILocation(line: 79, column: 23, scope: !110)
!118 = !DILocation(line: 79, column: 9, scope: !110)
!119 = !DILocation(line: 81, column: 9, scope: !110)
!120 = !DILocation(line: 81, column: 21, scope: !110)
!121 = !DILocation(line: 82, column: 20, scope: !110)
!122 = !DILocation(line: 82, column: 9, scope: !110)
!123 = !DILocation(line: 86, column: 1, scope: !85)
