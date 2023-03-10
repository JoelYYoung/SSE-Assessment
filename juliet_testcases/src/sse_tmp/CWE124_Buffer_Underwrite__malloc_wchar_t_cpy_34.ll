; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !33
  %0 = bitcast i8* %call to i32*, !dbg !34
  store i32* %0, i32** %dataBuffer, align 8, !dbg !32
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  %cmp = icmp eq i32* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !42
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !45
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !46
  store i32* %add.ptr, i32** %data, align 8, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !49
  store i32* %5, i32** %unionFirst, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !51, metadata !DIExpression()), !dbg !53
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !54
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !54
  store i32* %6, i32** %data2, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !55, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !62
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx4, align 4, !dbg !64
  %7 = load i32*, i32** %data2, align 8, !dbg !65
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !66
  %call6 = call i32* @wcscpy(i32* %7, i32* %arraydecay5) #5, !dbg !67
  %8 = load i32*, i32** %data2, align 8, !dbg !68
  call void @printWLine(i32* %8), !dbg !69
  ret void, !dbg !70
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType* %myUnion, metadata !97, metadata !DIExpression()), !dbg !98
  store i32* null, i32** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !102
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !103
  %0 = bitcast i8* %call to i32*, !dbg !104
  store i32* %0, i32** %dataBuffer, align 8, !dbg !102
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  %cmp = icmp eq i32* %1, null, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !112
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  store i32* %4, i32** %data, align 8, !dbg !116
  %5 = load i32*, i32** %data, align 8, !dbg !117
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !118
  store i32* %5, i32** %unionFirst, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !120, metadata !DIExpression()), !dbg !122
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !123
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !123
  store i32* %6, i32** %data2, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !128
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx4, align 4, !dbg !130
  %7 = load i32*, i32** %data2, align 8, !dbg !131
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call6 = call i32* @wcscpy(i32* %7, i32* %arraydecay5) #5, !dbg !133
  %8 = load i32*, i32** %data2, align 8, !dbg !134
  call void @printWLine(i32* %8), !dbg !135
  ret void, !dbg !136
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 63, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !17, line: 35, type: !4)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!32 = !DILocation(line: 35, column: 19, scope: !31)
!33 = !DILocation(line: 35, column: 43, scope: !31)
!34 = !DILocation(line: 35, column: 32, scope: !31)
!35 = !DILocation(line: 36, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !17, line: 36, column: 13)
!37 = !DILocation(line: 36, column: 24, scope: !36)
!38 = !DILocation(line: 36, column: 13, scope: !31)
!39 = !DILocation(line: 36, column: 34, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !17, line: 36, column: 33)
!41 = !DILocation(line: 37, column: 17, scope: !31)
!42 = !DILocation(line: 37, column: 9, scope: !31)
!43 = !DILocation(line: 38, column: 9, scope: !31)
!44 = !DILocation(line: 38, column: 27, scope: !31)
!45 = !DILocation(line: 40, column: 16, scope: !31)
!46 = !DILocation(line: 40, column: 27, scope: !31)
!47 = !DILocation(line: 40, column: 14, scope: !31)
!48 = !DILocation(line: 42, column: 26, scope: !16)
!49 = !DILocation(line: 42, column: 13, scope: !16)
!50 = !DILocation(line: 42, column: 24, scope: !16)
!51 = !DILocalVariable(name: "data", scope: !52, file: !17, line: 44, type: !4)
!52 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!53 = !DILocation(line: 44, column: 19, scope: !52)
!54 = !DILocation(line: 44, column: 34, scope: !52)
!55 = !DILocalVariable(name: "source", scope: !56, file: !17, line: 46, type: !57)
!56 = distinct !DILexicalBlock(scope: !52, file: !17, line: 45, column: 9)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 46, column: 21, scope: !56)
!61 = !DILocation(line: 47, column: 21, scope: !56)
!62 = !DILocation(line: 47, column: 13, scope: !56)
!63 = !DILocation(line: 48, column: 13, scope: !56)
!64 = !DILocation(line: 48, column: 27, scope: !56)
!65 = !DILocation(line: 50, column: 20, scope: !56)
!66 = !DILocation(line: 50, column: 26, scope: !56)
!67 = !DILocation(line: 50, column: 13, scope: !56)
!68 = !DILocation(line: 51, column: 24, scope: !56)
!69 = !DILocation(line: 51, column: 13, scope: !56)
!70 = !DILocation(line: 56, column: 1, scope: !16)
!71 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_34_good", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 94, column: 5, scope: !71)
!73 = !DILocation(line: 95, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 106, type: !75, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7, !7, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !17, line: 106, type: !7)
!81 = !DILocation(line: 106, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !17, line: 106, type: !77)
!83 = !DILocation(line: 106, column: 27, scope: !74)
!84 = !DILocation(line: 109, column: 22, scope: !74)
!85 = !DILocation(line: 109, column: 12, scope: !74)
!86 = !DILocation(line: 109, column: 5, scope: !74)
!87 = !DILocation(line: 111, column: 5, scope: !74)
!88 = !DILocation(line: 112, column: 5, scope: !74)
!89 = !DILocation(line: 113, column: 5, scope: !74)
!90 = !DILocation(line: 116, column: 5, scope: !74)
!91 = !DILocation(line: 117, column: 5, scope: !74)
!92 = !DILocation(line: 118, column: 5, scope: !74)
!93 = !DILocation(line: 120, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !17, line: 65, type: !4)
!96 = !DILocation(line: 65, column: 15, scope: !94)
!97 = !DILocalVariable(name: "myUnion", scope: !94, file: !17, line: 66, type: !23)
!98 = !DILocation(line: 66, column: 63, scope: !94)
!99 = !DILocation(line: 67, column: 10, scope: !94)
!100 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !17, line: 69, type: !4)
!101 = distinct !DILexicalBlock(scope: !94, file: !17, line: 68, column: 5)
!102 = !DILocation(line: 69, column: 19, scope: !101)
!103 = !DILocation(line: 69, column: 43, scope: !101)
!104 = !DILocation(line: 69, column: 32, scope: !101)
!105 = !DILocation(line: 70, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !17, line: 70, column: 13)
!107 = !DILocation(line: 70, column: 24, scope: !106)
!108 = !DILocation(line: 70, column: 13, scope: !101)
!109 = !DILocation(line: 70, column: 34, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !17, line: 70, column: 33)
!111 = !DILocation(line: 71, column: 17, scope: !101)
!112 = !DILocation(line: 71, column: 9, scope: !101)
!113 = !DILocation(line: 72, column: 9, scope: !101)
!114 = !DILocation(line: 72, column: 27, scope: !101)
!115 = !DILocation(line: 74, column: 16, scope: !101)
!116 = !DILocation(line: 74, column: 14, scope: !101)
!117 = !DILocation(line: 76, column: 26, scope: !94)
!118 = !DILocation(line: 76, column: 13, scope: !94)
!119 = !DILocation(line: 76, column: 24, scope: !94)
!120 = !DILocalVariable(name: "data", scope: !121, file: !17, line: 78, type: !4)
!121 = distinct !DILexicalBlock(scope: !94, file: !17, line: 77, column: 5)
!122 = !DILocation(line: 78, column: 19, scope: !121)
!123 = !DILocation(line: 78, column: 34, scope: !121)
!124 = !DILocalVariable(name: "source", scope: !125, file: !17, line: 80, type: !57)
!125 = distinct !DILexicalBlock(scope: !121, file: !17, line: 79, column: 9)
!126 = !DILocation(line: 80, column: 21, scope: !125)
!127 = !DILocation(line: 81, column: 21, scope: !125)
!128 = !DILocation(line: 81, column: 13, scope: !125)
!129 = !DILocation(line: 82, column: 13, scope: !125)
!130 = !DILocation(line: 82, column: 27, scope: !125)
!131 = !DILocation(line: 84, column: 20, scope: !125)
!132 = !DILocation(line: 84, column: 26, scope: !125)
!133 = !DILocation(line: 84, column: 13, scope: !125)
!134 = !DILocation(line: 85, column: 24, scope: !125)
!135 = !DILocation(line: 85, column: 13, scope: !125)
!136 = !DILocation(line: 90, column: 1, scope: !94)
