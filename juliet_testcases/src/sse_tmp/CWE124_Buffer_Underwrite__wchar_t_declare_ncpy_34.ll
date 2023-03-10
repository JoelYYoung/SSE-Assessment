; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !34
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !38
  store i32* %add.ptr, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !41
  store i32* %0, i32** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !46
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !46
  store i32* %1, i32** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !51
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx5, align 4, !dbg !53
  %2 = load i32*, i32** %data2, align 8, !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call7 = call i32* @wcsncpy(i32* %2, i32* %arraydecay6, i64 99) #4, !dbg !56
  %3 = load i32*, i32** %data2, align 8, !dbg !57
  %arrayidx8 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !57
  store i32 0, i32* %arrayidx8, align 4, !dbg !58
  %4 = load i32*, i32** %data2, align 8, !dbg !59
  call void @printWLine(i32* %4), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_good() #0 !dbg !62 {
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
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_bad(), !dbg !82
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
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType* %myUnion, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !92
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !93
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay1, i32** %data, align 8, !dbg !97
  %0 = load i32*, i32** %data, align 8, !dbg !98
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !99
  store i32* %0, i32** %unionFirst, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !101, metadata !DIExpression()), !dbg !103
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !104
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !104
  store i32* %1, i32** %data2, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !109
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx5, align 4, !dbg !111
  %2 = load i32*, i32** %data2, align 8, !dbg !112
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %call7 = call i32* @wcsncpy(i32* %2, i32* %arraydecay6, i64 99) #4, !dbg !114
  %3 = load i32*, i32** %data2, align 8, !dbg !115
  %arrayidx8 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !115
  store i32 0, i32* %arrayidx8, align 4, !dbg !116
  %4 = load i32*, i32** %data2, align 8, !dbg !117
  call void @printWLine(i32* %4), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_unionType", file: !12, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 24, baseType: !16, size: 64)
!27 = !DILocation(line: 32, column: 65, scope: !11)
!28 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocation(line: 34, column: 13, scope: !11)
!34 = !DILocation(line: 34, column: 5, scope: !11)
!35 = !DILocation(line: 35, column: 5, scope: !11)
!36 = !DILocation(line: 35, column: 23, scope: !11)
!37 = !DILocation(line: 37, column: 12, scope: !11)
!38 = !DILocation(line: 37, column: 23, scope: !11)
!39 = !DILocation(line: 37, column: 10, scope: !11)
!40 = !DILocation(line: 38, column: 26, scope: !11)
!41 = !DILocation(line: 38, column: 13, scope: !11)
!42 = !DILocation(line: 38, column: 24, scope: !11)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 40, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!45 = !DILocation(line: 40, column: 19, scope: !44)
!46 = !DILocation(line: 40, column: 34, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !12, line: 42, type: !29)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 41, column: 9)
!49 = !DILocation(line: 42, column: 21, scope: !48)
!50 = !DILocation(line: 43, column: 21, scope: !48)
!51 = !DILocation(line: 43, column: 13, scope: !48)
!52 = !DILocation(line: 44, column: 13, scope: !48)
!53 = !DILocation(line: 44, column: 27, scope: !48)
!54 = !DILocation(line: 46, column: 21, scope: !48)
!55 = !DILocation(line: 46, column: 27, scope: !48)
!56 = !DILocation(line: 46, column: 13, scope: !48)
!57 = !DILocation(line: 48, column: 13, scope: !48)
!58 = !DILocation(line: 48, column: 25, scope: !48)
!59 = !DILocation(line: 49, column: 24, scope: !48)
!60 = !DILocation(line: 49, column: 13, scope: !48)
!61 = !DILocation(line: 52, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_34_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 86, column: 5, scope: !62)
!64 = !DILocation(line: 87, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !66, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!19, !19, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 98, type: !19)
!72 = !DILocation(line: 98, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 98, type: !68)
!74 = !DILocation(line: 98, column: 27, scope: !65)
!75 = !DILocation(line: 101, column: 22, scope: !65)
!76 = !DILocation(line: 101, column: 12, scope: !65)
!77 = !DILocation(line: 101, column: 5, scope: !65)
!78 = !DILocation(line: 103, column: 5, scope: !65)
!79 = !DILocation(line: 104, column: 5, scope: !65)
!80 = !DILocation(line: 105, column: 5, scope: !65)
!81 = !DILocation(line: 108, column: 5, scope: !65)
!82 = !DILocation(line: 109, column: 5, scope: !65)
!83 = !DILocation(line: 110, column: 5, scope: !65)
!84 = !DILocation(line: 112, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 61, type: !16)
!87 = !DILocation(line: 61, column: 15, scope: !85)
!88 = !DILocalVariable(name: "myUnion", scope: !85, file: !12, line: 62, type: !22)
!89 = !DILocation(line: 62, column: 65, scope: !85)
!90 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !12, line: 63, type: !29)
!91 = !DILocation(line: 63, column: 13, scope: !85)
!92 = !DILocation(line: 64, column: 13, scope: !85)
!93 = !DILocation(line: 64, column: 5, scope: !85)
!94 = !DILocation(line: 65, column: 5, scope: !85)
!95 = !DILocation(line: 65, column: 23, scope: !85)
!96 = !DILocation(line: 67, column: 12, scope: !85)
!97 = !DILocation(line: 67, column: 10, scope: !85)
!98 = !DILocation(line: 68, column: 26, scope: !85)
!99 = !DILocation(line: 68, column: 13, scope: !85)
!100 = !DILocation(line: 68, column: 24, scope: !85)
!101 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 70, type: !16)
!102 = distinct !DILexicalBlock(scope: !85, file: !12, line: 69, column: 5)
!103 = !DILocation(line: 70, column: 19, scope: !102)
!104 = !DILocation(line: 70, column: 34, scope: !102)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 72, type: !29)
!106 = distinct !DILexicalBlock(scope: !102, file: !12, line: 71, column: 9)
!107 = !DILocation(line: 72, column: 21, scope: !106)
!108 = !DILocation(line: 73, column: 21, scope: !106)
!109 = !DILocation(line: 73, column: 13, scope: !106)
!110 = !DILocation(line: 74, column: 13, scope: !106)
!111 = !DILocation(line: 74, column: 27, scope: !106)
!112 = !DILocation(line: 76, column: 21, scope: !106)
!113 = !DILocation(line: 76, column: 27, scope: !106)
!114 = !DILocation(line: 76, column: 13, scope: !106)
!115 = !DILocation(line: 78, column: 13, scope: !106)
!116 = !DILocation(line: 78, column: 25, scope: !106)
!117 = !DILocation(line: 79, column: 24, scope: !106)
!118 = !DILocation(line: 79, column: 13, scope: !106)
!119 = !DILocation(line: 82, column: 1, scope: !85)
