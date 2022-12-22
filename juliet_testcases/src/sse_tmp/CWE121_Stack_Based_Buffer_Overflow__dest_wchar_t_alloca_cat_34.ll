; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
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
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType* %myUnion to i32**, !dbg !41
  store i32* %6, i32** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType* %myUnion to i32**, !dbg !46
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !46
  store i32* %7, i32** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx2, align 4, !dbg !56
  %8 = load i32*, i32** %data1, align 8, !dbg !57
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call4 = call i32* @wcscat(i32* %8, i32* %arraydecay3) #4, !dbg !59
  %9 = load i32*, i32** %data1, align 8, !dbg !60
  call void @printWLine(i32* %9), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #4, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #4, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType* %myUnion, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 200, align 16, !dbg !93
  %1 = bitcast i8* %0 to i32*, !dbg !94
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %2 = alloca i8, i64 400, align 16, !dbg !97
  %3 = bitcast i8* %2 to i32*, !dbg !98
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !96
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  store i32* %4, i32** %data, align 8, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %6 = load i32*, i32** %data, align 8, !dbg !103
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType* %myUnion to i32**, !dbg !104
  store i32* %6, i32** %unionFirst, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !106, metadata !DIExpression()), !dbg !108
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType* %myUnion to i32**, !dbg !109
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !109
  store i32* %7, i32** %data1, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !114
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx2, align 4, !dbg !116
  %8 = load i32*, i32** %data1, align 8, !dbg !117
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %call4 = call i32* @wcscat(i32* %8, i32* %arraydecay3) #4, !dbg !119
  %9 = load i32*, i32** %data1, align 8, !dbg !120
  call void @printWLine(i32* %9), !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 78, scope: !15)
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
!57 = !DILocation(line: 47, column: 20, scope: !48)
!58 = !DILocation(line: 47, column: 26, scope: !48)
!59 = !DILocation(line: 47, column: 13, scope: !48)
!60 = !DILocation(line: 48, column: 24, scope: !48)
!61 = !DILocation(line: 48, column: 13, scope: !48)
!62 = !DILocation(line: 51, column: 1, scope: !15)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_34_good", scope: !16, file: !16, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 83, column: 5, scope: !63)
!65 = !DILocation(line: 84, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 95, type: !67, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !16, line: 95, type: !7)
!73 = !DILocation(line: 95, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !16, line: 95, type: !69)
!75 = !DILocation(line: 95, column: 27, scope: !66)
!76 = !DILocation(line: 98, column: 22, scope: !66)
!77 = !DILocation(line: 98, column: 12, scope: !66)
!78 = !DILocation(line: 98, column: 5, scope: !66)
!79 = !DILocation(line: 100, column: 5, scope: !66)
!80 = !DILocation(line: 101, column: 5, scope: !66)
!81 = !DILocation(line: 102, column: 5, scope: !66)
!82 = !DILocation(line: 105, column: 5, scope: !66)
!83 = !DILocation(line: 106, column: 5, scope: !66)
!84 = !DILocation(line: 107, column: 5, scope: !66)
!85 = !DILocation(line: 109, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 58, type: !17, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !16, line: 60, type: !4)
!88 = !DILocation(line: 60, column: 15, scope: !86)
!89 = !DILocalVariable(name: "myUnion", scope: !86, file: !16, line: 61, type: !22)
!90 = !DILocation(line: 61, column: 78, scope: !86)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !16, line: 62, type: !4)
!92 = !DILocation(line: 62, column: 15, scope: !86)
!93 = !DILocation(line: 62, column: 42, scope: !86)
!94 = !DILocation(line: 62, column: 31, scope: !86)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !16, line: 63, type: !4)
!96 = !DILocation(line: 63, column: 15, scope: !86)
!97 = !DILocation(line: 63, column: 43, scope: !86)
!98 = !DILocation(line: 63, column: 32, scope: !86)
!99 = !DILocation(line: 65, column: 12, scope: !86)
!100 = !DILocation(line: 65, column: 10, scope: !86)
!101 = !DILocation(line: 66, column: 5, scope: !86)
!102 = !DILocation(line: 66, column: 13, scope: !86)
!103 = !DILocation(line: 67, column: 26, scope: !86)
!104 = !DILocation(line: 67, column: 13, scope: !86)
!105 = !DILocation(line: 67, column: 24, scope: !86)
!106 = !DILocalVariable(name: "data", scope: !107, file: !16, line: 69, type: !4)
!107 = distinct !DILexicalBlock(scope: !86, file: !16, line: 68, column: 5)
!108 = !DILocation(line: 69, column: 19, scope: !107)
!109 = !DILocation(line: 69, column: 34, scope: !107)
!110 = !DILocalVariable(name: "source", scope: !111, file: !16, line: 71, type: !49)
!111 = distinct !DILexicalBlock(scope: !107, file: !16, line: 70, column: 9)
!112 = !DILocation(line: 71, column: 21, scope: !111)
!113 = !DILocation(line: 72, column: 21, scope: !111)
!114 = !DILocation(line: 72, column: 13, scope: !111)
!115 = !DILocation(line: 73, column: 13, scope: !111)
!116 = !DILocation(line: 73, column: 27, scope: !111)
!117 = !DILocation(line: 75, column: 20, scope: !111)
!118 = !DILocation(line: 75, column: 26, scope: !111)
!119 = !DILocation(line: 75, column: 13, scope: !111)
!120 = !DILocation(line: 76, column: 24, scope: !111)
!121 = !DILocation(line: 76, column: 13, scope: !111)
!122 = !DILocation(line: 79, column: 1, scope: !86)
