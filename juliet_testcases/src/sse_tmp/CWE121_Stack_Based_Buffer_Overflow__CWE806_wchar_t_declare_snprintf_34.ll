; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType = type { i32* }

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %2, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType* %myUnion to i32**, !dbg !45
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %3, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !51
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !52
  %5 = load i32*, i32** %data1, align 8, !dbg !53
  %call3 = call i64 @wcslen(i32* %5) #7, !dbg !54
  %6 = load i32*, i32** %data1, align 8, !dbg !55
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay2, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #6, !dbg !56
  %7 = load i32*, i32** %data1, align 8, !dbg !57
  call void @printWLine(i32* %7), !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType* %myUnion, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !90
  store i32* %arraydecay, i32** %data, align 8, !dbg !91
  %0 = load i32*, i32** %data, align 8, !dbg !92
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  %2 = load i32*, i32** %data, align 8, !dbg !96
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType* %myUnion to i32**, !dbg !97
  store i32* %2, i32** %unionFirst, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !99, metadata !DIExpression()), !dbg !101
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType* %myUnion to i32**, !dbg !102
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !102
  store i32* %3, i32** %data1, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !105
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !106
  %5 = load i32*, i32** %data1, align 8, !dbg !107
  %call3 = call i64 @wcslen(i32* %5) #7, !dbg !108
  %6 = load i32*, i32** %data1, align 8, !dbg !109
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay2, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #6, !dbg !110
  %7 = load i32*, i32** %data1, align 8, !dbg !111
  call void @printWLine(i32* %7), !dbg !112
  ret void, !dbg !113
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 37, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 38, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_unionType", file: !12, line: 31, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 27, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 29, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 30, baseType: !16, size: 64)
!27 = !DILocation(line: 38, column: 86, scope: !11)
!28 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 39, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 39, column: 13, scope: !11)
!33 = !DILocation(line: 40, column: 12, scope: !11)
!34 = !DILocation(line: 40, column: 10, scope: !11)
!35 = !DILocation(line: 42, column: 13, scope: !11)
!36 = !DILocation(line: 42, column: 5, scope: !11)
!37 = !DILocation(line: 43, column: 5, scope: !11)
!38 = !DILocation(line: 43, column: 17, scope: !11)
!39 = !DILocation(line: 44, column: 26, scope: !11)
!40 = !DILocation(line: 44, column: 13, scope: !11)
!41 = !DILocation(line: 44, column: 24, scope: !11)
!42 = !DILocalVariable(name: "data", scope: !43, file: !12, line: 46, type: !16)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 5)
!44 = !DILocation(line: 46, column: 19, scope: !43)
!45 = !DILocation(line: 46, column: 34, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 48, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 47, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 48, column: 21, scope: !47)
!52 = !DILocation(line: 50, column: 22, scope: !47)
!53 = !DILocation(line: 50, column: 35, scope: !47)
!54 = !DILocation(line: 50, column: 28, scope: !47)
!55 = !DILocation(line: 50, column: 49, scope: !47)
!56 = !DILocation(line: 50, column: 13, scope: !47)
!57 = !DILocation(line: 51, column: 24, scope: !47)
!58 = !DILocation(line: 51, column: 13, scope: !47)
!59 = !DILocation(line: 54, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_34_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 84, column: 5, scope: !60)
!62 = !DILocation(line: 85, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !64, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!19, !19, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 96, type: !19)
!70 = !DILocation(line: 96, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 96, type: !66)
!72 = !DILocation(line: 96, column: 27, scope: !63)
!73 = !DILocation(line: 99, column: 22, scope: !63)
!74 = !DILocation(line: 99, column: 12, scope: !63)
!75 = !DILocation(line: 99, column: 5, scope: !63)
!76 = !DILocation(line: 101, column: 5, scope: !63)
!77 = !DILocation(line: 102, column: 5, scope: !63)
!78 = !DILocation(line: 103, column: 5, scope: !63)
!79 = !DILocation(line: 106, column: 5, scope: !63)
!80 = !DILocation(line: 107, column: 5, scope: !63)
!81 = !DILocation(line: 108, column: 5, scope: !63)
!82 = !DILocation(line: 110, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 63, type: !16)
!85 = !DILocation(line: 63, column: 15, scope: !83)
!86 = !DILocalVariable(name: "myUnion", scope: !83, file: !12, line: 64, type: !22)
!87 = !DILocation(line: 64, column: 86, scope: !83)
!88 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !12, line: 65, type: !29)
!89 = !DILocation(line: 65, column: 13, scope: !83)
!90 = !DILocation(line: 66, column: 12, scope: !83)
!91 = !DILocation(line: 66, column: 10, scope: !83)
!92 = !DILocation(line: 68, column: 13, scope: !83)
!93 = !DILocation(line: 68, column: 5, scope: !83)
!94 = !DILocation(line: 69, column: 5, scope: !83)
!95 = !DILocation(line: 69, column: 16, scope: !83)
!96 = !DILocation(line: 70, column: 26, scope: !83)
!97 = !DILocation(line: 70, column: 13, scope: !83)
!98 = !DILocation(line: 70, column: 24, scope: !83)
!99 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 72, type: !16)
!100 = distinct !DILexicalBlock(scope: !83, file: !12, line: 71, column: 5)
!101 = !DILocation(line: 72, column: 19, scope: !100)
!102 = !DILocation(line: 72, column: 34, scope: !100)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !12, line: 74, type: !48)
!104 = distinct !DILexicalBlock(scope: !100, file: !12, line: 73, column: 9)
!105 = !DILocation(line: 74, column: 21, scope: !104)
!106 = !DILocation(line: 76, column: 22, scope: !104)
!107 = !DILocation(line: 76, column: 35, scope: !104)
!108 = !DILocation(line: 76, column: 28, scope: !104)
!109 = !DILocation(line: 76, column: 49, scope: !104)
!110 = !DILocation(line: 76, column: 13, scope: !104)
!111 = !DILocation(line: 77, column: 24, scope: !104)
!112 = !DILocation(line: 77, column: 13, scope: !104)
!113 = !DILocation(line: 80, column: 1, scope: !83)
