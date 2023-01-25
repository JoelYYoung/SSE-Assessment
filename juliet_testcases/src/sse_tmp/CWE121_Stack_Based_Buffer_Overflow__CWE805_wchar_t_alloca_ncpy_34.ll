; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 200, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 400, align 16, !dbg !34
  %3 = bitcast i8* %2 to i32*, !dbg !35
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %4, i32** %data, align 8, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !41
  store i32* %6, i32** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !46
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !46
  store i32* %7, i32** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx2, align 4, !dbg !56
  %8 = load i32*, i32** %data1, align 8, !dbg !57
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call4 = call i32* @wcsncpy(i32* %8, i32* %arraydecay3, i64 99) #4, !dbg !59
  %9 = load i32*, i32** %data1, align 8, !dbg !60
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !60
  store i32 0, i32* %arrayidx5, align 4, !dbg !61
  %10 = load i32*, i32** %data1, align 8, !dbg !62
  call void @printWLine(i32* %10), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #4, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #4, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType* %myUnion, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 200, align 16, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %2 = alloca i8, i64 400, align 16, !dbg !99
  %3 = bitcast i8* %2 to i32*, !dbg !100
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !98
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !101
  store i32* %4, i32** %data, align 8, !dbg !102
  %5 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %6 = load i32*, i32** %data, align 8, !dbg !105
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !106
  store i32* %6, i32** %unionFirst, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !108, metadata !DIExpression()), !dbg !110
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType* %myUnion to i32**, !dbg !111
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !111
  store i32* %7, i32** %data1, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !116
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !117
  store i32 0, i32* %arrayidx2, align 4, !dbg !118
  %8 = load i32*, i32** %data1, align 8, !dbg !119
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !120
  %call4 = call i32* @wcsncpy(i32* %8, i32* %arraydecay3, i64 99) #4, !dbg !121
  %9 = load i32*, i32** %data1, align 8, !dbg !122
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !122
  store i32 0, i32* %arrayidx5, align 4, !dbg !123
  %10 = load i32*, i32** %data1, align 8, !dbg !124
  call void @printWLine(i32* %10), !dbg !125
  ret void, !dbg !126
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 81, scope: !15)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 33, type: !4)
!29 = !DILocation(line: 33, column: 15, scope: !15)
!30 = !DILocation(line: 33, column: 42, scope: !15)
!31 = !DILocation(line: 33, column: 31, scope: !15)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 34, type: !4)
!33 = !DILocation(line: 34, column: 15, scope: !15)
!34 = !DILocation(line: 34, column: 43, scope: !15)
!35 = !DILocation(line: 34, column: 32, scope: !15)
!36 = !DILocation(line: 37, column: 12, scope: !15)
!37 = !DILocation(line: 37, column: 10, scope: !15)
!38 = !DILocation(line: 38, column: 5, scope: !15)
!39 = !DILocation(line: 38, column: 13, scope: !15)
!40 = !DILocation(line: 39, column: 26, scope: !15)
!41 = !DILocation(line: 39, column: 13, scope: !15)
!42 = !DILocation(line: 39, column: 24, scope: !15)
!43 = !DILocalVariable(name: "data", scope: !44, file: !16, line: 41, type: !4)
!44 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!45 = !DILocation(line: 41, column: 19, scope: !44)
!46 = !DILocation(line: 41, column: 34, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !16, line: 43, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !16, line: 42, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 43, column: 21, scope: !48)
!53 = !DILocation(line: 44, column: 21, scope: !48)
!54 = !DILocation(line: 44, column: 13, scope: !48)
!55 = !DILocation(line: 45, column: 13, scope: !48)
!56 = !DILocation(line: 45, column: 27, scope: !48)
!57 = !DILocation(line: 47, column: 21, scope: !48)
!58 = !DILocation(line: 47, column: 27, scope: !48)
!59 = !DILocation(line: 47, column: 13, scope: !48)
!60 = !DILocation(line: 48, column: 13, scope: !48)
!61 = !DILocation(line: 48, column: 25, scope: !48)
!62 = !DILocation(line: 49, column: 24, scope: !48)
!63 = !DILocation(line: 49, column: 13, scope: !48)
!64 = !DILocation(line: 52, column: 1, scope: !15)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_34_good", scope: !16, file: !16, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 85, column: 5, scope: !65)
!67 = !DILocation(line: 86, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 97, type: !69, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !16, line: 97, type: !7)
!75 = !DILocation(line: 97, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !16, line: 97, type: !71)
!77 = !DILocation(line: 97, column: 27, scope: !68)
!78 = !DILocation(line: 100, column: 22, scope: !68)
!79 = !DILocation(line: 100, column: 12, scope: !68)
!80 = !DILocation(line: 100, column: 5, scope: !68)
!81 = !DILocation(line: 102, column: 5, scope: !68)
!82 = !DILocation(line: 103, column: 5, scope: !68)
!83 = !DILocation(line: 104, column: 5, scope: !68)
!84 = !DILocation(line: 107, column: 5, scope: !68)
!85 = !DILocation(line: 108, column: 5, scope: !68)
!86 = !DILocation(line: 109, column: 5, scope: !68)
!87 = !DILocation(line: 111, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !16, line: 61, type: !4)
!90 = !DILocation(line: 61, column: 15, scope: !88)
!91 = !DILocalVariable(name: "myUnion", scope: !88, file: !16, line: 62, type: !22)
!92 = !DILocation(line: 62, column: 81, scope: !88)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !16, line: 63, type: !4)
!94 = !DILocation(line: 63, column: 15, scope: !88)
!95 = !DILocation(line: 63, column: 42, scope: !88)
!96 = !DILocation(line: 63, column: 31, scope: !88)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !16, line: 64, type: !4)
!98 = !DILocation(line: 64, column: 15, scope: !88)
!99 = !DILocation(line: 64, column: 43, scope: !88)
!100 = !DILocation(line: 64, column: 32, scope: !88)
!101 = !DILocation(line: 66, column: 12, scope: !88)
!102 = !DILocation(line: 66, column: 10, scope: !88)
!103 = !DILocation(line: 67, column: 5, scope: !88)
!104 = !DILocation(line: 67, column: 13, scope: !88)
!105 = !DILocation(line: 68, column: 26, scope: !88)
!106 = !DILocation(line: 68, column: 13, scope: !88)
!107 = !DILocation(line: 68, column: 24, scope: !88)
!108 = !DILocalVariable(name: "data", scope: !109, file: !16, line: 70, type: !4)
!109 = distinct !DILexicalBlock(scope: !88, file: !16, line: 69, column: 5)
!110 = !DILocation(line: 70, column: 19, scope: !109)
!111 = !DILocation(line: 70, column: 34, scope: !109)
!112 = !DILocalVariable(name: "source", scope: !113, file: !16, line: 72, type: !49)
!113 = distinct !DILexicalBlock(scope: !109, file: !16, line: 71, column: 9)
!114 = !DILocation(line: 72, column: 21, scope: !113)
!115 = !DILocation(line: 73, column: 21, scope: !113)
!116 = !DILocation(line: 73, column: 13, scope: !113)
!117 = !DILocation(line: 74, column: 13, scope: !113)
!118 = !DILocation(line: 74, column: 27, scope: !113)
!119 = !DILocation(line: 76, column: 21, scope: !113)
!120 = !DILocation(line: 76, column: 27, scope: !113)
!121 = !DILocation(line: 76, column: 13, scope: !113)
!122 = !DILocation(line: 77, column: 13, scope: !113)
!123 = !DILocation(line: 77, column: 25, scope: !113)
!124 = !DILocation(line: 78, column: 24, scope: !113)
!125 = !DILocation(line: 78, column: 13, scope: !113)
!126 = !DILocation(line: 81, column: 1, scope: !88)
