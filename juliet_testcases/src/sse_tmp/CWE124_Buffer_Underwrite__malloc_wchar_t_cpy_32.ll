; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !31
  %1 = load i32*, i32** %0, align 8, !dbg !32
  store i32* %1, i32** %data1, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !33, metadata !DIExpression()), !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !36
  %2 = bitcast i8* %call to i32*, !dbg !37
  store i32* %2, i32** %dataBuffer, align 8, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %cmp = icmp eq i32* %3, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #5, !dbg !45
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !48
  %add.ptr = getelementptr inbounds i32, i32* %6, i64 -8, !dbg !49
  store i32* %add.ptr, i32** %data1, align 8, !dbg !50
  %7 = load i32*, i32** %data1, align 8, !dbg !51
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !52
  store i32* %7, i32** %8, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !54, metadata !DIExpression()), !dbg !56
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !57
  %10 = load i32*, i32** %9, align 8, !dbg !58
  store i32* %10, i32** %data3, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !59, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !65
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !66
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx5, align 4, !dbg !68
  %11 = load i32*, i32** %data3, align 8, !dbg !69
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !70
  %call7 = call i32* @wcscpy(i32* %11, i32* %arraydecay6) #5, !dbg !71
  %12 = load i32*, i32** %data3, align 8, !dbg !72
  call void @printWLine(i32* %12), !dbg !73
  ret void, !dbg !74
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !101, metadata !DIExpression()), !dbg !102
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !103, metadata !DIExpression()), !dbg !104
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !104
  store i32* null, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !106, metadata !DIExpression()), !dbg !108
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !109
  %1 = load i32*, i32** %0, align 8, !dbg !110
  store i32* %1, i32** %data1, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !114
  %2 = bitcast i8* %call to i32*, !dbg !115
  store i32* %2, i32** %dataBuffer, align 8, !dbg !113
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  %cmp = icmp eq i32* %3, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !122
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #5, !dbg !123
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  store i32* %6, i32** %data1, align 8, !dbg !127
  %7 = load i32*, i32** %data1, align 8, !dbg !128
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !129
  store i32* %7, i32** %8, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !131, metadata !DIExpression()), !dbg !133
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !134
  %10 = load i32*, i32** %9, align 8, !dbg !135
  store i32* %10, i32** %data3, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !139
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !140
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx5, align 4, !dbg !142
  %11 = load i32*, i32** %data3, align 8, !dbg !143
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !144
  %call7 = call i32* @wcscpy(i32* %11, i32* %arraydecay6) #5, !dbg !145
  %12 = load i32*, i32** %data3, align 8, !dbg !146
  call void @printWLine(i32* %12), !dbg !147
  ret void, !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !17, line: 30, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!30 = !DILocation(line: 30, column: 19, scope: !29)
!31 = !DILocation(line: 30, column: 27, scope: !29)
!32 = !DILocation(line: 30, column: 26, scope: !29)
!33 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !17, line: 32, type: !4)
!34 = distinct !DILexicalBlock(scope: !29, file: !17, line: 31, column: 9)
!35 = !DILocation(line: 32, column: 23, scope: !34)
!36 = !DILocation(line: 32, column: 47, scope: !34)
!37 = !DILocation(line: 32, column: 36, scope: !34)
!38 = !DILocation(line: 33, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !17, line: 33, column: 17)
!40 = !DILocation(line: 33, column: 28, scope: !39)
!41 = !DILocation(line: 33, column: 17, scope: !34)
!42 = !DILocation(line: 33, column: 38, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !17, line: 33, column: 37)
!44 = !DILocation(line: 34, column: 21, scope: !34)
!45 = !DILocation(line: 34, column: 13, scope: !34)
!46 = !DILocation(line: 35, column: 13, scope: !34)
!47 = !DILocation(line: 35, column: 31, scope: !34)
!48 = !DILocation(line: 37, column: 20, scope: !34)
!49 = !DILocation(line: 37, column: 31, scope: !34)
!50 = !DILocation(line: 37, column: 18, scope: !34)
!51 = !DILocation(line: 39, column: 21, scope: !29)
!52 = !DILocation(line: 39, column: 10, scope: !29)
!53 = !DILocation(line: 39, column: 19, scope: !29)
!54 = !DILocalVariable(name: "data", scope: !55, file: !17, line: 42, type: !4)
!55 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!56 = !DILocation(line: 42, column: 19, scope: !55)
!57 = !DILocation(line: 42, column: 27, scope: !55)
!58 = !DILocation(line: 42, column: 26, scope: !55)
!59 = !DILocalVariable(name: "source", scope: !60, file: !17, line: 44, type: !61)
!60 = distinct !DILexicalBlock(scope: !55, file: !17, line: 43, column: 9)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 100)
!64 = !DILocation(line: 44, column: 21, scope: !60)
!65 = !DILocation(line: 45, column: 21, scope: !60)
!66 = !DILocation(line: 45, column: 13, scope: !60)
!67 = !DILocation(line: 46, column: 13, scope: !60)
!68 = !DILocation(line: 46, column: 27, scope: !60)
!69 = !DILocation(line: 48, column: 20, scope: !60)
!70 = !DILocation(line: 48, column: 26, scope: !60)
!71 = !DILocation(line: 48, column: 13, scope: !60)
!72 = !DILocation(line: 49, column: 24, scope: !60)
!73 = !DILocation(line: 49, column: 13, scope: !60)
!74 = !DILocation(line: 54, column: 1, scope: !16)
!75 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_32_good", scope: !17, file: !17, line: 94, type: !18, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 96, column: 5, scope: !75)
!77 = !DILocation(line: 97, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 108, type: !79, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !17, line: 108, type: !7)
!85 = !DILocation(line: 108, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !17, line: 108, type: !81)
!87 = !DILocation(line: 108, column: 27, scope: !78)
!88 = !DILocation(line: 111, column: 22, scope: !78)
!89 = !DILocation(line: 111, column: 12, scope: !78)
!90 = !DILocation(line: 111, column: 5, scope: !78)
!91 = !DILocation(line: 113, column: 5, scope: !78)
!92 = !DILocation(line: 114, column: 5, scope: !78)
!93 = !DILocation(line: 115, column: 5, scope: !78)
!94 = !DILocation(line: 118, column: 5, scope: !78)
!95 = !DILocation(line: 119, column: 5, scope: !78)
!96 = !DILocation(line: 120, column: 5, scope: !78)
!97 = !DILocation(line: 122, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !17, line: 63, type: !4)
!100 = !DILocation(line: 63, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataPtr1", scope: !98, file: !17, line: 64, type: !23)
!102 = !DILocation(line: 64, column: 16, scope: !98)
!103 = !DILocalVariable(name: "dataPtr2", scope: !98, file: !17, line: 65, type: !23)
!104 = !DILocation(line: 65, column: 16, scope: !98)
!105 = !DILocation(line: 66, column: 10, scope: !98)
!106 = !DILocalVariable(name: "data", scope: !107, file: !17, line: 68, type: !4)
!107 = distinct !DILexicalBlock(scope: !98, file: !17, line: 67, column: 5)
!108 = !DILocation(line: 68, column: 19, scope: !107)
!109 = !DILocation(line: 68, column: 27, scope: !107)
!110 = !DILocation(line: 68, column: 26, scope: !107)
!111 = !DILocalVariable(name: "dataBuffer", scope: !112, file: !17, line: 70, type: !4)
!112 = distinct !DILexicalBlock(scope: !107, file: !17, line: 69, column: 9)
!113 = !DILocation(line: 70, column: 23, scope: !112)
!114 = !DILocation(line: 70, column: 47, scope: !112)
!115 = !DILocation(line: 70, column: 36, scope: !112)
!116 = !DILocation(line: 71, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !17, line: 71, column: 17)
!118 = !DILocation(line: 71, column: 28, scope: !117)
!119 = !DILocation(line: 71, column: 17, scope: !112)
!120 = !DILocation(line: 71, column: 38, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 71, column: 37)
!122 = !DILocation(line: 72, column: 21, scope: !112)
!123 = !DILocation(line: 72, column: 13, scope: !112)
!124 = !DILocation(line: 73, column: 13, scope: !112)
!125 = !DILocation(line: 73, column: 31, scope: !112)
!126 = !DILocation(line: 75, column: 20, scope: !112)
!127 = !DILocation(line: 75, column: 18, scope: !112)
!128 = !DILocation(line: 77, column: 21, scope: !107)
!129 = !DILocation(line: 77, column: 10, scope: !107)
!130 = !DILocation(line: 77, column: 19, scope: !107)
!131 = !DILocalVariable(name: "data", scope: !132, file: !17, line: 80, type: !4)
!132 = distinct !DILexicalBlock(scope: !98, file: !17, line: 79, column: 5)
!133 = !DILocation(line: 80, column: 19, scope: !132)
!134 = !DILocation(line: 80, column: 27, scope: !132)
!135 = !DILocation(line: 80, column: 26, scope: !132)
!136 = !DILocalVariable(name: "source", scope: !137, file: !17, line: 82, type: !61)
!137 = distinct !DILexicalBlock(scope: !132, file: !17, line: 81, column: 9)
!138 = !DILocation(line: 82, column: 21, scope: !137)
!139 = !DILocation(line: 83, column: 21, scope: !137)
!140 = !DILocation(line: 83, column: 13, scope: !137)
!141 = !DILocation(line: 84, column: 13, scope: !137)
!142 = !DILocation(line: 84, column: 27, scope: !137)
!143 = !DILocation(line: 86, column: 20, scope: !137)
!144 = !DILocation(line: 86, column: 26, scope: !137)
!145 = !DILocation(line: 86, column: 13, scope: !137)
!146 = !DILocation(line: 87, column: 24, scope: !137)
!147 = !DILocation(line: 87, column: 13, scope: !137)
!148 = !DILocation(line: 92, column: 1, scope: !98)
