; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !33
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !37
  store i32* %add.ptr, i32** %data, align 8, !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %5, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType* %myUnion to i32**, !dbg !45
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %6, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !53
  %arrayidx3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !54
  store i32 0, i32* %arrayidx3, align 4, !dbg !55
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !56
  %7 = load i32*, i32** %data1, align 8, !dbg !57
  %call5 = call i32* @wcscpy(i32* %arraydecay4, i32* %7) #4, !dbg !58
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !59
  call void @printWLine(i32* %arraydecay6), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_good() #0 !dbg !62 {
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
  %call = call i64 @time(i64* null) #4, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #4, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType* %myUnion, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 400, align 16, !dbg !92
  %1 = bitcast i8* %0 to i32*, !dbg !93
  store i32* %1, i32** %dataBuffer, align 8, !dbg !91
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !95
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  store i32* %4, i32** %data, align 8, !dbg !99
  %5 = load i32*, i32** %data, align 8, !dbg !100
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType* %myUnion to i32**, !dbg !101
  store i32* %5, i32** %unionFirst, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !103, metadata !DIExpression()), !dbg !105
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType* %myUnion to i32**, !dbg !106
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !106
  store i32* %6, i32** %data1, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !110
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !111
  %arrayidx3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !112
  store i32 0, i32* %arrayidx3, align 4, !dbg !113
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !114
  %7 = load i32*, i32** %data1, align 8, !dbg !115
  %call5 = call i32* @wcscpy(i32* %arraydecay4, i32* %7) #4, !dbg !116
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !117
  call void @printWLine(i32* %arraydecay6), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 62, scope: !15)
!28 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 33, type: !4)
!29 = !DILocation(line: 33, column: 15, scope: !15)
!30 = !DILocation(line: 33, column: 39, scope: !15)
!31 = !DILocation(line: 33, column: 28, scope: !15)
!32 = !DILocation(line: 34, column: 13, scope: !15)
!33 = !DILocation(line: 34, column: 5, scope: !15)
!34 = !DILocation(line: 35, column: 5, scope: !15)
!35 = !DILocation(line: 35, column: 23, scope: !15)
!36 = !DILocation(line: 37, column: 12, scope: !15)
!37 = !DILocation(line: 37, column: 23, scope: !15)
!38 = !DILocation(line: 37, column: 10, scope: !15)
!39 = !DILocation(line: 38, column: 26, scope: !15)
!40 = !DILocation(line: 38, column: 13, scope: !15)
!41 = !DILocation(line: 38, column: 24, scope: !15)
!42 = !DILocalVariable(name: "data", scope: !43, file: !16, line: 40, type: !4)
!43 = distinct !DILexicalBlock(scope: !15, file: !16, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 19, scope: !43)
!45 = !DILocation(line: 40, column: 34, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !16, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !16, line: 41, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 200)
!51 = !DILocation(line: 42, column: 21, scope: !47)
!52 = !DILocation(line: 43, column: 21, scope: !47)
!53 = !DILocation(line: 43, column: 13, scope: !47)
!54 = !DILocation(line: 44, column: 13, scope: !47)
!55 = !DILocation(line: 44, column: 27, scope: !47)
!56 = !DILocation(line: 46, column: 20, scope: !47)
!57 = !DILocation(line: 46, column: 26, scope: !47)
!58 = !DILocation(line: 46, column: 13, scope: !47)
!59 = !DILocation(line: 47, column: 24, scope: !47)
!60 = !DILocation(line: 47, column: 13, scope: !47)
!61 = !DILocation(line: 50, column: 1, scope: !15)
!62 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_cpy_34_good", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 82, column: 5, scope: !62)
!64 = !DILocation(line: 83, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 94, type: !66, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!7, !7, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !16, line: 94, type: !7)
!72 = !DILocation(line: 94, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !16, line: 94, type: !68)
!74 = !DILocation(line: 94, column: 27, scope: !65)
!75 = !DILocation(line: 97, column: 22, scope: !65)
!76 = !DILocation(line: 97, column: 12, scope: !65)
!77 = !DILocation(line: 97, column: 5, scope: !65)
!78 = !DILocation(line: 99, column: 5, scope: !65)
!79 = !DILocation(line: 100, column: 5, scope: !65)
!80 = !DILocation(line: 101, column: 5, scope: !65)
!81 = !DILocation(line: 104, column: 5, scope: !65)
!82 = !DILocation(line: 105, column: 5, scope: !65)
!83 = !DILocation(line: 106, column: 5, scope: !65)
!84 = !DILocation(line: 108, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !16, line: 59, type: !4)
!87 = !DILocation(line: 59, column: 15, scope: !85)
!88 = !DILocalVariable(name: "myUnion", scope: !85, file: !16, line: 60, type: !22)
!89 = !DILocation(line: 60, column: 62, scope: !85)
!90 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !16, line: 61, type: !4)
!91 = !DILocation(line: 61, column: 15, scope: !85)
!92 = !DILocation(line: 61, column: 39, scope: !85)
!93 = !DILocation(line: 61, column: 28, scope: !85)
!94 = !DILocation(line: 62, column: 13, scope: !85)
!95 = !DILocation(line: 62, column: 5, scope: !85)
!96 = !DILocation(line: 63, column: 5, scope: !85)
!97 = !DILocation(line: 63, column: 23, scope: !85)
!98 = !DILocation(line: 65, column: 12, scope: !85)
!99 = !DILocation(line: 65, column: 10, scope: !85)
!100 = !DILocation(line: 66, column: 26, scope: !85)
!101 = !DILocation(line: 66, column: 13, scope: !85)
!102 = !DILocation(line: 66, column: 24, scope: !85)
!103 = !DILocalVariable(name: "data", scope: !104, file: !16, line: 68, type: !4)
!104 = distinct !DILexicalBlock(scope: !85, file: !16, line: 67, column: 5)
!105 = !DILocation(line: 68, column: 19, scope: !104)
!106 = !DILocation(line: 68, column: 34, scope: !104)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !16, line: 70, type: !48)
!108 = distinct !DILexicalBlock(scope: !104, file: !16, line: 69, column: 9)
!109 = !DILocation(line: 70, column: 21, scope: !108)
!110 = !DILocation(line: 71, column: 21, scope: !108)
!111 = !DILocation(line: 71, column: 13, scope: !108)
!112 = !DILocation(line: 72, column: 13, scope: !108)
!113 = !DILocation(line: 72, column: 27, scope: !108)
!114 = !DILocation(line: 74, column: 20, scope: !108)
!115 = !DILocation(line: 74, column: 26, scope: !108)
!116 = !DILocation(line: 74, column: 13, scope: !108)
!117 = !DILocation(line: 75, column: 24, scope: !108)
!118 = !DILocation(line: 75, column: 13, scope: !108)
!119 = !DILocation(line: 78, column: 1, scope: !85)
