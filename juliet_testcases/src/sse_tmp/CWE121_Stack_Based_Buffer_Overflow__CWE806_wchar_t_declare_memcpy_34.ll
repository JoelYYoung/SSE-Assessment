; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %2, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType* %myUnion to i32**, !dbg !45
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %3, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !51
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !52
  %5 = bitcast i32* %arraydecay2 to i8*, !dbg !52
  %6 = load i32*, i32** %data1, align 8, !dbg !53
  %7 = bitcast i32* %6 to i8*, !dbg !52
  %8 = load i32*, i32** %data1, align 8, !dbg !54
  %call3 = call i64 @wcslen(i32* %8) #8, !dbg !55
  %mul = mul i64 %call3, 4, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !52
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !57
  store i32 0, i32* %arrayidx4, align 4, !dbg !58
  %9 = load i32*, i32** %data1, align 8, !dbg !59
  call void @printWLine(i32* %9), !dbg !60
  ret void, !dbg !61
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_good() #0 !dbg !62 {
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
  %call = call i64 @time(i64* null) #7, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #7, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType* %myUnion, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay, i32** %data, align 8, !dbg !93
  %0 = load i32*, i32** %data, align 8, !dbg !94
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !95
  %1 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType* %myUnion to i32**, !dbg !99
  store i32* %2, i32** %unionFirst, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !101, metadata !DIExpression()), !dbg !103
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType* %myUnion to i32**, !dbg !104
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !104
  store i32* %3, i32** %data1, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !107
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !108
  %5 = bitcast i32* %arraydecay2 to i8*, !dbg !108
  %6 = load i32*, i32** %data1, align 8, !dbg !109
  %7 = bitcast i32* %6 to i8*, !dbg !108
  %8 = load i32*, i32** %data1, align 8, !dbg !110
  %call3 = call i64 @wcslen(i32* %8) #8, !dbg !111
  %mul = mul i64 %call3, 4, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !108
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !113
  store i32 0, i32* %arrayidx4, align 4, !dbg !114
  %9 = load i32*, i32** %data1, align 8, !dbg !115
  call void @printWLine(i32* %9), !dbg !116
  ret void, !dbg !117
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_unionType", file: !12, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 24, baseType: !16, size: 64)
!27 = !DILocation(line: 32, column: 84, scope: !11)
!28 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocation(line: 34, column: 12, scope: !11)
!34 = !DILocation(line: 34, column: 10, scope: !11)
!35 = !DILocation(line: 36, column: 13, scope: !11)
!36 = !DILocation(line: 36, column: 5, scope: !11)
!37 = !DILocation(line: 37, column: 5, scope: !11)
!38 = !DILocation(line: 37, column: 17, scope: !11)
!39 = !DILocation(line: 38, column: 26, scope: !11)
!40 = !DILocation(line: 38, column: 13, scope: !11)
!41 = !DILocation(line: 38, column: 24, scope: !11)
!42 = !DILocalVariable(name: "data", scope: !43, file: !12, line: 40, type: !16)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 19, scope: !43)
!45 = !DILocation(line: 40, column: 34, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 41, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 42, column: 21, scope: !47)
!52 = !DILocation(line: 44, column: 13, scope: !47)
!53 = !DILocation(line: 44, column: 26, scope: !47)
!54 = !DILocation(line: 44, column: 39, scope: !47)
!55 = !DILocation(line: 44, column: 32, scope: !47)
!56 = !DILocation(line: 44, column: 44, scope: !47)
!57 = !DILocation(line: 45, column: 13, scope: !47)
!58 = !DILocation(line: 45, column: 24, scope: !47)
!59 = !DILocation(line: 46, column: 24, scope: !47)
!60 = !DILocation(line: 46, column: 13, scope: !47)
!61 = !DILocation(line: 49, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_34_good", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 80, column: 5, scope: !62)
!64 = !DILocation(line: 81, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !66, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!19, !19, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 92, type: !19)
!72 = !DILocation(line: 92, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 92, type: !68)
!74 = !DILocation(line: 92, column: 27, scope: !65)
!75 = !DILocation(line: 95, column: 22, scope: !65)
!76 = !DILocation(line: 95, column: 12, scope: !65)
!77 = !DILocation(line: 95, column: 5, scope: !65)
!78 = !DILocation(line: 97, column: 5, scope: !65)
!79 = !DILocation(line: 98, column: 5, scope: !65)
!80 = !DILocation(line: 99, column: 5, scope: !65)
!81 = !DILocation(line: 102, column: 5, scope: !65)
!82 = !DILocation(line: 103, column: 5, scope: !65)
!83 = !DILocation(line: 104, column: 5, scope: !65)
!84 = !DILocation(line: 106, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 58, type: !16)
!87 = !DILocation(line: 58, column: 15, scope: !85)
!88 = !DILocalVariable(name: "myUnion", scope: !85, file: !12, line: 59, type: !22)
!89 = !DILocation(line: 59, column: 84, scope: !85)
!90 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !12, line: 60, type: !29)
!91 = !DILocation(line: 60, column: 13, scope: !85)
!92 = !DILocation(line: 61, column: 12, scope: !85)
!93 = !DILocation(line: 61, column: 10, scope: !85)
!94 = !DILocation(line: 63, column: 13, scope: !85)
!95 = !DILocation(line: 63, column: 5, scope: !85)
!96 = !DILocation(line: 64, column: 5, scope: !85)
!97 = !DILocation(line: 64, column: 16, scope: !85)
!98 = !DILocation(line: 65, column: 26, scope: !85)
!99 = !DILocation(line: 65, column: 13, scope: !85)
!100 = !DILocation(line: 65, column: 24, scope: !85)
!101 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 67, type: !16)
!102 = distinct !DILexicalBlock(scope: !85, file: !12, line: 66, column: 5)
!103 = !DILocation(line: 67, column: 19, scope: !102)
!104 = !DILocation(line: 67, column: 34, scope: !102)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !12, line: 69, type: !48)
!106 = distinct !DILexicalBlock(scope: !102, file: !12, line: 68, column: 9)
!107 = !DILocation(line: 69, column: 21, scope: !106)
!108 = !DILocation(line: 71, column: 13, scope: !106)
!109 = !DILocation(line: 71, column: 26, scope: !106)
!110 = !DILocation(line: 71, column: 39, scope: !106)
!111 = !DILocation(line: 71, column: 32, scope: !106)
!112 = !DILocation(line: 71, column: 44, scope: !106)
!113 = !DILocation(line: 72, column: 13, scope: !106)
!114 = !DILocation(line: 72, column: 24, scope: !106)
!115 = !DILocation(line: 73, column: 24, scope: !106)
!116 = !DILocation(line: 73, column: 13, scope: !106)
!117 = !DILocation(line: 76, column: 1, scope: !85)
