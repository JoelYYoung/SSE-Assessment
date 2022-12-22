; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType = type { i32* }

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %2, i32** %data, align 8, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !35
  %4 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType* %myUnion to i32**, !dbg !39
  store i32* %5, i32** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType* %myUnion to i32**, !dbg !44
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !44
  store i32* %6, i32** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %8 = load i32*, i32** %data1, align 8, !dbg !52
  %call2 = call i64 @wcslen(i32* %8) #7, !dbg !53
  %9 = load i32*, i32** %data1, align 8, !dbg !54
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %9) #6, !dbg !55
  %10 = load i32*, i32** %data1, align 8, !dbg !56
  call void @printWLine(i32* %10), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType* %myUnion, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 400, align 16, !dbg !89
  %1 = bitcast i8* %0 to i32*, !dbg !90
  store i32* %1, i32** %dataBuffer, align 8, !dbg !88
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  store i32* %2, i32** %data, align 8, !dbg !92
  %3 = load i32*, i32** %data, align 8, !dbg !93
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !94
  %4 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType* %myUnion to i32**, !dbg !98
  store i32* %5, i32** %unionFirst, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !100, metadata !DIExpression()), !dbg !102
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType* %myUnion to i32**, !dbg !103
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !103
  store i32* %6, i32** %data1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !107
  %8 = load i32*, i32** %data1, align 8, !dbg !108
  %call2 = call i64 @wcslen(i32* %8) #7, !dbg !109
  %9 = load i32*, i32** %data1, align 8, !dbg !110
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %9) #6, !dbg !111
  %10 = load i32*, i32** %data1, align 8, !dbg !112
  call void @printWLine(i32* %10), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_bad", scope: !16, file: !16, line: 35, type: !17, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 37, type: !4)
!20 = !DILocation(line: 37, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 38, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_unionType", file: !16, line: 31, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 27, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 29, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 30, baseType: !4, size: 64)
!27 = !DILocation(line: 38, column: 85, scope: !15)
!28 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 39, type: !4)
!29 = !DILocation(line: 39, column: 15, scope: !15)
!30 = !DILocation(line: 39, column: 39, scope: !15)
!31 = !DILocation(line: 39, column: 28, scope: !15)
!32 = !DILocation(line: 40, column: 12, scope: !15)
!33 = !DILocation(line: 40, column: 10, scope: !15)
!34 = !DILocation(line: 42, column: 13, scope: !15)
!35 = !DILocation(line: 42, column: 5, scope: !15)
!36 = !DILocation(line: 43, column: 5, scope: !15)
!37 = !DILocation(line: 43, column: 17, scope: !15)
!38 = !DILocation(line: 44, column: 26, scope: !15)
!39 = !DILocation(line: 44, column: 13, scope: !15)
!40 = !DILocation(line: 44, column: 24, scope: !15)
!41 = !DILocalVariable(name: "data", scope: !42, file: !16, line: 46, type: !4)
!42 = distinct !DILexicalBlock(scope: !15, file: !16, line: 45, column: 5)
!43 = !DILocation(line: 46, column: 19, scope: !42)
!44 = !DILocation(line: 46, column: 34, scope: !42)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !16, line: 48, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !16, line: 47, column: 9)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 48, column: 21, scope: !46)
!51 = !DILocation(line: 50, column: 22, scope: !46)
!52 = !DILocation(line: 50, column: 35, scope: !46)
!53 = !DILocation(line: 50, column: 28, scope: !46)
!54 = !DILocation(line: 50, column: 49, scope: !46)
!55 = !DILocation(line: 50, column: 13, scope: !46)
!56 = !DILocation(line: 51, column: 24, scope: !46)
!57 = !DILocation(line: 51, column: 13, scope: !46)
!58 = !DILocation(line: 54, column: 1, scope: !15)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_34_good", scope: !16, file: !16, line: 82, type: !17, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 84, column: 5, scope: !59)
!61 = !DILocation(line: 85, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 96, type: !63, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !16, line: 96, type: !7)
!69 = !DILocation(line: 96, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !16, line: 96, type: !65)
!71 = !DILocation(line: 96, column: 27, scope: !62)
!72 = !DILocation(line: 99, column: 22, scope: !62)
!73 = !DILocation(line: 99, column: 12, scope: !62)
!74 = !DILocation(line: 99, column: 5, scope: !62)
!75 = !DILocation(line: 101, column: 5, scope: !62)
!76 = !DILocation(line: 102, column: 5, scope: !62)
!77 = !DILocation(line: 103, column: 5, scope: !62)
!78 = !DILocation(line: 106, column: 5, scope: !62)
!79 = !DILocation(line: 107, column: 5, scope: !62)
!80 = !DILocation(line: 108, column: 5, scope: !62)
!81 = !DILocation(line: 110, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !16, line: 63, type: !4)
!84 = !DILocation(line: 63, column: 15, scope: !82)
!85 = !DILocalVariable(name: "myUnion", scope: !82, file: !16, line: 64, type: !22)
!86 = !DILocation(line: 64, column: 85, scope: !82)
!87 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !16, line: 65, type: !4)
!88 = !DILocation(line: 65, column: 15, scope: !82)
!89 = !DILocation(line: 65, column: 39, scope: !82)
!90 = !DILocation(line: 65, column: 28, scope: !82)
!91 = !DILocation(line: 66, column: 12, scope: !82)
!92 = !DILocation(line: 66, column: 10, scope: !82)
!93 = !DILocation(line: 68, column: 13, scope: !82)
!94 = !DILocation(line: 68, column: 5, scope: !82)
!95 = !DILocation(line: 69, column: 5, scope: !82)
!96 = !DILocation(line: 69, column: 16, scope: !82)
!97 = !DILocation(line: 70, column: 26, scope: !82)
!98 = !DILocation(line: 70, column: 13, scope: !82)
!99 = !DILocation(line: 70, column: 24, scope: !82)
!100 = !DILocalVariable(name: "data", scope: !101, file: !16, line: 72, type: !4)
!101 = distinct !DILexicalBlock(scope: !82, file: !16, line: 71, column: 5)
!102 = !DILocation(line: 72, column: 19, scope: !101)
!103 = !DILocation(line: 72, column: 34, scope: !101)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !16, line: 74, type: !47)
!105 = distinct !DILexicalBlock(scope: !101, file: !16, line: 73, column: 9)
!106 = !DILocation(line: 74, column: 21, scope: !105)
!107 = !DILocation(line: 76, column: 22, scope: !105)
!108 = !DILocation(line: 76, column: 35, scope: !105)
!109 = !DILocation(line: 76, column: 28, scope: !105)
!110 = !DILocation(line: 76, column: 49, scope: !105)
!111 = !DILocation(line: 76, column: 13, scope: !105)
!112 = !DILocation(line: 77, column: 24, scope: !105)
!113 = !DILocation(line: 77, column: 13, scope: !105)
!114 = !DILocation(line: 80, column: 1, scope: !82)
