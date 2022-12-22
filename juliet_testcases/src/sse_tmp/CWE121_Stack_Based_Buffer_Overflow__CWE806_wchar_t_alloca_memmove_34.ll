; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %2, i32** %data, align 8, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !35
  %4 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType* %myUnion to i32**, !dbg !39
  store i32* %5, i32** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType* %myUnion to i32**, !dbg !44
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !44
  store i32* %6, i32** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %8 = bitcast i32* %arraydecay to i8*, !dbg !51
  %9 = load i32*, i32** %data1, align 8, !dbg !52
  %10 = bitcast i32* %9 to i8*, !dbg !51
  %11 = load i32*, i32** %data1, align 8, !dbg !53
  %call2 = call i64 @wcslen(i32* %11) #8, !dbg !54
  %mul = mul i64 %call2, 4, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %8, i8* align 4 %10, i64 %mul, i1 false), !dbg !51
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !56
  store i32 0, i32* %arrayidx3, align 4, !dbg !57
  %12 = load i32*, i32** %data1, align 8, !dbg !58
  call void @printWLine(i32* %12), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType* %myUnion, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 400, align 16, !dbg !91
  %1 = bitcast i8* %0 to i32*, !dbg !92
  store i32* %1, i32** %dataBuffer, align 8, !dbg !90
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  store i32* %2, i32** %data, align 8, !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !96
  %4 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType* %myUnion to i32**, !dbg !100
  store i32* %5, i32** %unionFirst, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !102, metadata !DIExpression()), !dbg !104
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType* %myUnion to i32**, !dbg !105
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !105
  store i32* %6, i32** %data1, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !109
  %8 = bitcast i32* %arraydecay to i8*, !dbg !109
  %9 = load i32*, i32** %data1, align 8, !dbg !110
  %10 = bitcast i32* %9 to i8*, !dbg !109
  %11 = load i32*, i32** %data1, align 8, !dbg !111
  %call2 = call i64 @wcslen(i32* %11) #8, !dbg !112
  %mul = mul i64 %call2, 4, !dbg !113
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %8, i8* align 4 %10, i64 %mul, i1 false), !dbg !109
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !114
  store i32 0, i32* %arrayidx3, align 4, !dbg !115
  %12 = load i32*, i32** %data1, align 8, !dbg !116
  call void @printWLine(i32* %12), !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 84, scope: !15)
!28 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 33, type: !4)
!29 = !DILocation(line: 33, column: 15, scope: !15)
!30 = !DILocation(line: 33, column: 39, scope: !15)
!31 = !DILocation(line: 33, column: 28, scope: !15)
!32 = !DILocation(line: 34, column: 12, scope: !15)
!33 = !DILocation(line: 34, column: 10, scope: !15)
!34 = !DILocation(line: 36, column: 13, scope: !15)
!35 = !DILocation(line: 36, column: 5, scope: !15)
!36 = !DILocation(line: 37, column: 5, scope: !15)
!37 = !DILocation(line: 37, column: 17, scope: !15)
!38 = !DILocation(line: 38, column: 26, scope: !15)
!39 = !DILocation(line: 38, column: 13, scope: !15)
!40 = !DILocation(line: 38, column: 24, scope: !15)
!41 = !DILocalVariable(name: "data", scope: !42, file: !16, line: 40, type: !4)
!42 = distinct !DILexicalBlock(scope: !15, file: !16, line: 39, column: 5)
!43 = !DILocation(line: 40, column: 19, scope: !42)
!44 = !DILocation(line: 40, column: 34, scope: !42)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !16, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !16, line: 41, column: 9)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 42, column: 21, scope: !46)
!51 = !DILocation(line: 44, column: 13, scope: !46)
!52 = !DILocation(line: 44, column: 27, scope: !46)
!53 = !DILocation(line: 44, column: 40, scope: !46)
!54 = !DILocation(line: 44, column: 33, scope: !46)
!55 = !DILocation(line: 44, column: 45, scope: !46)
!56 = !DILocation(line: 45, column: 13, scope: !46)
!57 = !DILocation(line: 45, column: 24, scope: !46)
!58 = !DILocation(line: 46, column: 24, scope: !46)
!59 = !DILocation(line: 46, column: 13, scope: !46)
!60 = !DILocation(line: 49, column: 1, scope: !15)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_34_good", scope: !16, file: !16, line: 78, type: !17, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 80, column: 5, scope: !61)
!63 = !DILocation(line: 81, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 92, type: !65, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !16, line: 92, type: !7)
!71 = !DILocation(line: 92, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !16, line: 92, type: !67)
!73 = !DILocation(line: 92, column: 27, scope: !64)
!74 = !DILocation(line: 95, column: 22, scope: !64)
!75 = !DILocation(line: 95, column: 12, scope: !64)
!76 = !DILocation(line: 95, column: 5, scope: !64)
!77 = !DILocation(line: 97, column: 5, scope: !64)
!78 = !DILocation(line: 98, column: 5, scope: !64)
!79 = !DILocation(line: 99, column: 5, scope: !64)
!80 = !DILocation(line: 102, column: 5, scope: !64)
!81 = !DILocation(line: 103, column: 5, scope: !64)
!82 = !DILocation(line: 104, column: 5, scope: !64)
!83 = !DILocation(line: 106, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !16, line: 58, type: !4)
!86 = !DILocation(line: 58, column: 15, scope: !84)
!87 = !DILocalVariable(name: "myUnion", scope: !84, file: !16, line: 59, type: !22)
!88 = !DILocation(line: 59, column: 84, scope: !84)
!89 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !16, line: 60, type: !4)
!90 = !DILocation(line: 60, column: 15, scope: !84)
!91 = !DILocation(line: 60, column: 39, scope: !84)
!92 = !DILocation(line: 60, column: 28, scope: !84)
!93 = !DILocation(line: 61, column: 12, scope: !84)
!94 = !DILocation(line: 61, column: 10, scope: !84)
!95 = !DILocation(line: 63, column: 13, scope: !84)
!96 = !DILocation(line: 63, column: 5, scope: !84)
!97 = !DILocation(line: 64, column: 5, scope: !84)
!98 = !DILocation(line: 64, column: 16, scope: !84)
!99 = !DILocation(line: 65, column: 26, scope: !84)
!100 = !DILocation(line: 65, column: 13, scope: !84)
!101 = !DILocation(line: 65, column: 24, scope: !84)
!102 = !DILocalVariable(name: "data", scope: !103, file: !16, line: 67, type: !4)
!103 = distinct !DILexicalBlock(scope: !84, file: !16, line: 66, column: 5)
!104 = !DILocation(line: 67, column: 19, scope: !103)
!105 = !DILocation(line: 67, column: 34, scope: !103)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !16, line: 69, type: !47)
!107 = distinct !DILexicalBlock(scope: !103, file: !16, line: 68, column: 9)
!108 = !DILocation(line: 69, column: 21, scope: !107)
!109 = !DILocation(line: 71, column: 13, scope: !107)
!110 = !DILocation(line: 71, column: 27, scope: !107)
!111 = !DILocation(line: 71, column: 40, scope: !107)
!112 = !DILocation(line: 71, column: 33, scope: !107)
!113 = !DILocation(line: 71, column: 45, scope: !107)
!114 = !DILocation(line: 72, column: 13, scope: !107)
!115 = !DILocation(line: 72, column: 24, scope: !107)
!116 = !DILocation(line: 73, column: 24, scope: !107)
!117 = !DILocation(line: 73, column: 13, scope: !107)
!118 = !DILocation(line: 76, column: 1, scope: !84)
