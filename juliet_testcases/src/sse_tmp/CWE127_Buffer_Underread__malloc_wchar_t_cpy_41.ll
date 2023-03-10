; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !28
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !29
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %arraydecay1 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !32
  %0 = load i32*, i32** %data.addr, align 8, !dbg !33
  %call2 = call i32* @wcscpy(i32* %arraydecay1, i32* %0) #5, !dbg !34
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !35
  call void @printWLine(i32* %arraydecay3), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_bad() #0 !dbg !38 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !41, metadata !DIExpression()), !dbg !42
  store i32* null, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !44, metadata !DIExpression()), !dbg !46
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !47
  %0 = bitcast i8* %call to i32*, !dbg !48
  store i32* %0, i32** %dataBuffer, align 8, !dbg !46
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !49
  %cmp = icmp eq i32* %1, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !53
  unreachable, !dbg !53

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !55
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !56
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !58
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !60
  store i32* %add.ptr, i32** %data, align 8, !dbg !61
  %5 = load i32*, i32** %data, align 8, !dbg !62
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_badSink(i32* %5), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_goodG2BSink(i32* %data) #0 !dbg !65 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !68, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !71
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !72
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %arraydecay1 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !75
  %0 = load i32*, i32** %data.addr, align 8, !dbg !76
  %call2 = call i32* @wcscpy(i32* %arraydecay1, i32* %0) #5, !dbg !77
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !78
  call void @printWLine(i32* %arraydecay3), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i32* null, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !110
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !111
  %0 = bitcast i8* %call to i32*, !dbg !112
  store i32* %0, i32** %dataBuffer, align 8, !dbg !110
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %cmp = icmp eq i32* %1, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !119
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !120
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !123
  store i32* %4, i32** %data, align 8, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_goodG2BSink(i32* %5), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 71, scope: !16)
!22 = !DILocalVariable(name: "dest", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 200)
!27 = !DILocation(line: 26, column: 17, scope: !23)
!28 = !DILocation(line: 27, column: 17, scope: !23)
!29 = !DILocation(line: 27, column: 9, scope: !23)
!30 = !DILocation(line: 28, column: 9, scope: !23)
!31 = !DILocation(line: 28, column: 23, scope: !23)
!32 = !DILocation(line: 30, column: 16, scope: !23)
!33 = !DILocation(line: 30, column: 22, scope: !23)
!34 = !DILocation(line: 30, column: 9, scope: !23)
!35 = !DILocation(line: 31, column: 20, scope: !23)
!36 = !DILocation(line: 31, column: 9, scope: !23)
!37 = !DILocation(line: 35, column: 1, scope: !16)
!38 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_bad", scope: !17, file: !17, line: 37, type: !39, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !17, line: 39, type: !4)
!42 = !DILocation(line: 39, column: 15, scope: !38)
!43 = !DILocation(line: 40, column: 10, scope: !38)
!44 = !DILocalVariable(name: "dataBuffer", scope: !45, file: !17, line: 42, type: !4)
!45 = distinct !DILexicalBlock(scope: !38, file: !17, line: 41, column: 5)
!46 = !DILocation(line: 42, column: 19, scope: !45)
!47 = !DILocation(line: 42, column: 43, scope: !45)
!48 = !DILocation(line: 42, column: 32, scope: !45)
!49 = !DILocation(line: 43, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !17, line: 43, column: 13)
!51 = !DILocation(line: 43, column: 24, scope: !50)
!52 = !DILocation(line: 43, column: 13, scope: !45)
!53 = !DILocation(line: 43, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !17, line: 43, column: 33)
!55 = !DILocation(line: 44, column: 17, scope: !45)
!56 = !DILocation(line: 44, column: 9, scope: !45)
!57 = !DILocation(line: 45, column: 9, scope: !45)
!58 = !DILocation(line: 45, column: 27, scope: !45)
!59 = !DILocation(line: 47, column: 16, scope: !45)
!60 = !DILocation(line: 47, column: 27, scope: !45)
!61 = !DILocation(line: 47, column: 14, scope: !45)
!62 = !DILocation(line: 49, column: 60, scope: !38)
!63 = !DILocation(line: 49, column: 5, scope: !38)
!64 = !DILocation(line: 50, column: 1, scope: !38)
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_goodG2BSink", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", arg: 1, scope: !65, file: !17, line: 56, type: !4)
!67 = !DILocation(line: 56, column: 75, scope: !65)
!68 = !DILocalVariable(name: "dest", scope: !69, file: !17, line: 59, type: !24)
!69 = distinct !DILexicalBlock(scope: !65, file: !17, line: 58, column: 5)
!70 = !DILocation(line: 59, column: 17, scope: !69)
!71 = !DILocation(line: 60, column: 17, scope: !69)
!72 = !DILocation(line: 60, column: 9, scope: !69)
!73 = !DILocation(line: 61, column: 9, scope: !69)
!74 = !DILocation(line: 61, column: 23, scope: !69)
!75 = !DILocation(line: 63, column: 16, scope: !69)
!76 = !DILocation(line: 63, column: 22, scope: !69)
!77 = !DILocation(line: 63, column: 9, scope: !69)
!78 = !DILocation(line: 64, column: 20, scope: !69)
!79 = !DILocation(line: 64, column: 9, scope: !69)
!80 = !DILocation(line: 68, column: 1, scope: !65)
!81 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_41_good", scope: !17, file: !17, line: 86, type: !39, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 88, column: 5, scope: !81)
!83 = !DILocation(line: 89, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 101, type: !85, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!7, !7, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !17, line: 101, type: !7)
!91 = !DILocation(line: 101, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !17, line: 101, type: !87)
!93 = !DILocation(line: 101, column: 27, scope: !84)
!94 = !DILocation(line: 104, column: 22, scope: !84)
!95 = !DILocation(line: 104, column: 12, scope: !84)
!96 = !DILocation(line: 104, column: 5, scope: !84)
!97 = !DILocation(line: 106, column: 5, scope: !84)
!98 = !DILocation(line: 107, column: 5, scope: !84)
!99 = !DILocation(line: 108, column: 5, scope: !84)
!100 = !DILocation(line: 111, column: 5, scope: !84)
!101 = !DILocation(line: 112, column: 5, scope: !84)
!102 = !DILocation(line: 113, column: 5, scope: !84)
!103 = !DILocation(line: 115, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 71, type: !39, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !17, line: 73, type: !4)
!106 = !DILocation(line: 73, column: 15, scope: !104)
!107 = !DILocation(line: 74, column: 10, scope: !104)
!108 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !17, line: 76, type: !4)
!109 = distinct !DILexicalBlock(scope: !104, file: !17, line: 75, column: 5)
!110 = !DILocation(line: 76, column: 19, scope: !109)
!111 = !DILocation(line: 76, column: 43, scope: !109)
!112 = !DILocation(line: 76, column: 32, scope: !109)
!113 = !DILocation(line: 77, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !17, line: 77, column: 13)
!115 = !DILocation(line: 77, column: 24, scope: !114)
!116 = !DILocation(line: 77, column: 13, scope: !109)
!117 = !DILocation(line: 77, column: 34, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 77, column: 33)
!119 = !DILocation(line: 78, column: 17, scope: !109)
!120 = !DILocation(line: 78, column: 9, scope: !109)
!121 = !DILocation(line: 79, column: 9, scope: !109)
!122 = !DILocation(line: 79, column: 27, scope: !109)
!123 = !DILocation(line: 81, column: 16, scope: !109)
!124 = !DILocation(line: 81, column: 14, scope: !109)
!125 = !DILocation(line: 83, column: 64, scope: !104)
!126 = !DILocation(line: 83, column: 5, scope: !104)
!127 = !DILocation(line: 84, column: 1, scope: !104)
