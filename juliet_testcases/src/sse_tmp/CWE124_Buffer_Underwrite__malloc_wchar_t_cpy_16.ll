; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16_bad() #0 !dbg !16 {
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
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #5, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %6), !dbg !58
  ret void, !dbg !59
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
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  br label %while.body, !dbg !87

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %dataBuffer, align 8, !dbg !91
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %cmp = icmp eq i32* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !101
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  store i32* %4, i32** %data, align 8, !dbg !105
  br label %while.end, !dbg !106

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !111
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx3, align 4, !dbg !113
  %5 = load i32*, i32** %data, align 8, !dbg !114
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call5 = call i32* @wcscpy(i32* %5, i32* %arraydecay4) #5, !dbg !116
  %6 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* %6), !dbg !118
  ret void, !dbg !119
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!54 = !DILocation(line: 44, column: 16, scope: !45)
!55 = !DILocation(line: 44, column: 22, scope: !45)
!56 = !DILocation(line: 44, column: 9, scope: !45)
!57 = !DILocation(line: 45, column: 20, scope: !45)
!58 = !DILocation(line: 45, column: 9, scope: !45)
!59 = !DILocation(line: 49, column: 1, scope: !16)
!60 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_16_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 86, column: 5, scope: !60)
!62 = !DILocation(line: 87, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 99, type: !64, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 99, type: !7)
!70 = !DILocation(line: 99, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 99, type: !66)
!72 = !DILocation(line: 99, column: 27, scope: !63)
!73 = !DILocation(line: 102, column: 22, scope: !63)
!74 = !DILocation(line: 102, column: 12, scope: !63)
!75 = !DILocation(line: 102, column: 5, scope: !63)
!76 = !DILocation(line: 104, column: 5, scope: !63)
!77 = !DILocation(line: 105, column: 5, scope: !63)
!78 = !DILocation(line: 106, column: 5, scope: !63)
!79 = !DILocation(line: 109, column: 5, scope: !63)
!80 = !DILocation(line: 110, column: 5, scope: !63)
!81 = !DILocation(line: 111, column: 5, scope: !63)
!82 = !DILocation(line: 113, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 58, type: !4)
!85 = !DILocation(line: 58, column: 15, scope: !83)
!86 = !DILocation(line: 59, column: 10, scope: !83)
!87 = !DILocation(line: 60, column: 5, scope: !83)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !17, line: 63, type: !4)
!89 = distinct !DILexicalBlock(scope: !90, file: !17, line: 62, column: 9)
!90 = distinct !DILexicalBlock(scope: !83, file: !17, line: 61, column: 5)
!91 = !DILocation(line: 63, column: 23, scope: !89)
!92 = !DILocation(line: 63, column: 47, scope: !89)
!93 = !DILocation(line: 63, column: 36, scope: !89)
!94 = !DILocation(line: 64, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !17, line: 64, column: 17)
!96 = !DILocation(line: 64, column: 28, scope: !95)
!97 = !DILocation(line: 64, column: 17, scope: !89)
!98 = !DILocation(line: 64, column: 38, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !17, line: 64, column: 37)
!100 = !DILocation(line: 65, column: 21, scope: !89)
!101 = !DILocation(line: 65, column: 13, scope: !89)
!102 = !DILocation(line: 66, column: 13, scope: !89)
!103 = !DILocation(line: 66, column: 31, scope: !89)
!104 = !DILocation(line: 68, column: 20, scope: !89)
!105 = !DILocation(line: 68, column: 18, scope: !89)
!106 = !DILocation(line: 70, column: 9, scope: !90)
!107 = !DILocalVariable(name: "source", scope: !108, file: !17, line: 73, type: !46)
!108 = distinct !DILexicalBlock(scope: !83, file: !17, line: 72, column: 5)
!109 = !DILocation(line: 73, column: 17, scope: !108)
!110 = !DILocation(line: 74, column: 17, scope: !108)
!111 = !DILocation(line: 74, column: 9, scope: !108)
!112 = !DILocation(line: 75, column: 9, scope: !108)
!113 = !DILocation(line: 75, column: 23, scope: !108)
!114 = !DILocation(line: 77, column: 16, scope: !108)
!115 = !DILocation(line: 77, column: 22, scope: !108)
!116 = !DILocation(line: 77, column: 9, scope: !108)
!117 = !DILocation(line: 78, column: 20, scope: !108)
!118 = !DILocation(line: 78, column: 9, scope: !108)
!119 = !DILocation(line: 82, column: 1, scope: !83)
