; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !33
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !37
  store i32* %add.ptr, i32** %data, align 8, !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %5, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !45
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %6, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx3, align 4, !dbg !55
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %7 = load i32*, i32** %data1, align 8, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !59
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %7, i64 %call6) #5, !dbg !60
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx8, align 4, !dbg !62
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay9), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType* %myUnion, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = alloca i8, i64 400, align 16, !dbg !96
  %1 = bitcast i8* %0 to i32*, !dbg !97
  store i32* %1, i32** %dataBuffer, align 8, !dbg !95
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !99
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  store i32* %4, i32** %data, align 8, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !105
  store i32* %5, i32** %unionFirst, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !107, metadata !DIExpression()), !dbg !109
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !110
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !110
  store i32* %6, i32** %data1, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !114
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !115
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx3, align 4, !dbg !117
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %7 = load i32*, i32** %data1, align 8, !dbg !119
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !121
  %call7 = call i32* @wcsncpy(i32* %arraydecay4, i32* %7, i64 %call6) #5, !dbg !122
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx8, align 4, !dbg !124
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* %arraydecay9), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 63, scope: !15)
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
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 42, column: 21, scope: !47)
!52 = !DILocation(line: 43, column: 21, scope: !47)
!53 = !DILocation(line: 43, column: 13, scope: !47)
!54 = !DILocation(line: 44, column: 13, scope: !47)
!55 = !DILocation(line: 44, column: 25, scope: !47)
!56 = !DILocation(line: 46, column: 21, scope: !47)
!57 = !DILocation(line: 46, column: 27, scope: !47)
!58 = !DILocation(line: 46, column: 40, scope: !47)
!59 = !DILocation(line: 46, column: 33, scope: !47)
!60 = !DILocation(line: 46, column: 13, scope: !47)
!61 = !DILocation(line: 48, column: 13, scope: !47)
!62 = !DILocation(line: 48, column: 25, scope: !47)
!63 = !DILocation(line: 49, column: 24, scope: !47)
!64 = !DILocation(line: 49, column: 13, scope: !47)
!65 = !DILocation(line: 52, column: 1, scope: !15)
!66 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_34_good", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 86, column: 5, scope: !66)
!68 = !DILocation(line: 87, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 98, type: !70, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!7, !7, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !16, line: 98, type: !7)
!76 = !DILocation(line: 98, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !16, line: 98, type: !72)
!78 = !DILocation(line: 98, column: 27, scope: !69)
!79 = !DILocation(line: 101, column: 22, scope: !69)
!80 = !DILocation(line: 101, column: 12, scope: !69)
!81 = !DILocation(line: 101, column: 5, scope: !69)
!82 = !DILocation(line: 103, column: 5, scope: !69)
!83 = !DILocation(line: 104, column: 5, scope: !69)
!84 = !DILocation(line: 105, column: 5, scope: !69)
!85 = !DILocation(line: 108, column: 5, scope: !69)
!86 = !DILocation(line: 109, column: 5, scope: !69)
!87 = !DILocation(line: 110, column: 5, scope: !69)
!88 = !DILocation(line: 112, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !16, line: 61, type: !4)
!91 = !DILocation(line: 61, column: 15, scope: !89)
!92 = !DILocalVariable(name: "myUnion", scope: !89, file: !16, line: 62, type: !22)
!93 = !DILocation(line: 62, column: 63, scope: !89)
!94 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !16, line: 63, type: !4)
!95 = !DILocation(line: 63, column: 15, scope: !89)
!96 = !DILocation(line: 63, column: 39, scope: !89)
!97 = !DILocation(line: 63, column: 28, scope: !89)
!98 = !DILocation(line: 64, column: 13, scope: !89)
!99 = !DILocation(line: 64, column: 5, scope: !89)
!100 = !DILocation(line: 65, column: 5, scope: !89)
!101 = !DILocation(line: 65, column: 23, scope: !89)
!102 = !DILocation(line: 67, column: 12, scope: !89)
!103 = !DILocation(line: 67, column: 10, scope: !89)
!104 = !DILocation(line: 68, column: 26, scope: !89)
!105 = !DILocation(line: 68, column: 13, scope: !89)
!106 = !DILocation(line: 68, column: 24, scope: !89)
!107 = !DILocalVariable(name: "data", scope: !108, file: !16, line: 70, type: !4)
!108 = distinct !DILexicalBlock(scope: !89, file: !16, line: 69, column: 5)
!109 = !DILocation(line: 70, column: 19, scope: !108)
!110 = !DILocation(line: 70, column: 34, scope: !108)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !16, line: 72, type: !48)
!112 = distinct !DILexicalBlock(scope: !108, file: !16, line: 71, column: 9)
!113 = !DILocation(line: 72, column: 21, scope: !112)
!114 = !DILocation(line: 73, column: 21, scope: !112)
!115 = !DILocation(line: 73, column: 13, scope: !112)
!116 = !DILocation(line: 74, column: 13, scope: !112)
!117 = !DILocation(line: 74, column: 25, scope: !112)
!118 = !DILocation(line: 76, column: 21, scope: !112)
!119 = !DILocation(line: 76, column: 27, scope: !112)
!120 = !DILocation(line: 76, column: 40, scope: !112)
!121 = !DILocation(line: 76, column: 33, scope: !112)
!122 = !DILocation(line: 76, column: 13, scope: !112)
!123 = !DILocation(line: 78, column: 13, scope: !112)
!124 = !DILocation(line: 78, column: 25, scope: !112)
!125 = !DILocation(line: 79, column: 24, scope: !112)
!126 = !DILocation(line: 79, column: 13, scope: !112)
!127 = !DILocation(line: 82, column: 1, scope: !89)
