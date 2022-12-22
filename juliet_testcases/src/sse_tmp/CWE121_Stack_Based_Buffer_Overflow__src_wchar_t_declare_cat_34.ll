; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #5, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %2, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType* %myUnion to i32**, !dbg !45
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %3, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !51
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !52
  %5 = load i32*, i32** %data1, align 8, !dbg !53
  %call3 = call i32* @wcscat(i32* %arraydecay2, i32* %5) #5, !dbg !54
  %6 = load i32*, i32** %data1, align 8, !dbg !55
  call void @printWLine(i32* %6), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType* %myUnion, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !88
  store i32* %arraydecay, i32** %data, align 8, !dbg !89
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #5, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType* %myUnion to i32**, !dbg !95
  store i32* %2, i32** %unionFirst, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType* %myUnion to i32**, !dbg !100
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !100
  store i32* %3, i32** %data1, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !103
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !104
  %5 = load i32*, i32** %data1, align 8, !dbg !105
  %call3 = call i32* @wcscat(i32* %arraydecay2, i32* %5) #5, !dbg !106
  %6 = load i32*, i32** %data1, align 8, !dbg !107
  call void @printWLine(i32* %6), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_unionType", file: !12, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 24, baseType: !16, size: 64)
!27 = !DILocation(line: 32, column: 78, scope: !11)
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
!52 = !DILocation(line: 44, column: 20, scope: !47)
!53 = !DILocation(line: 44, column: 26, scope: !47)
!54 = !DILocation(line: 44, column: 13, scope: !47)
!55 = !DILocation(line: 45, column: 24, scope: !47)
!56 = !DILocation(line: 45, column: 13, scope: !47)
!57 = !DILocation(line: 48, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_34_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 78, column: 5, scope: !58)
!60 = !DILocation(line: 79, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !62, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!19, !19, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 90, type: !19)
!68 = !DILocation(line: 90, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 90, type: !64)
!70 = !DILocation(line: 90, column: 27, scope: !61)
!71 = !DILocation(line: 93, column: 22, scope: !61)
!72 = !DILocation(line: 93, column: 12, scope: !61)
!73 = !DILocation(line: 93, column: 5, scope: !61)
!74 = !DILocation(line: 95, column: 5, scope: !61)
!75 = !DILocation(line: 96, column: 5, scope: !61)
!76 = !DILocation(line: 97, column: 5, scope: !61)
!77 = !DILocation(line: 100, column: 5, scope: !61)
!78 = !DILocation(line: 101, column: 5, scope: !61)
!79 = !DILocation(line: 102, column: 5, scope: !61)
!80 = !DILocation(line: 104, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 57, type: !16)
!83 = !DILocation(line: 57, column: 15, scope: !81)
!84 = !DILocalVariable(name: "myUnion", scope: !81, file: !12, line: 58, type: !22)
!85 = !DILocation(line: 58, column: 78, scope: !81)
!86 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !12, line: 59, type: !29)
!87 = !DILocation(line: 59, column: 13, scope: !81)
!88 = !DILocation(line: 60, column: 12, scope: !81)
!89 = !DILocation(line: 60, column: 10, scope: !81)
!90 = !DILocation(line: 62, column: 13, scope: !81)
!91 = !DILocation(line: 62, column: 5, scope: !81)
!92 = !DILocation(line: 63, column: 5, scope: !81)
!93 = !DILocation(line: 63, column: 16, scope: !81)
!94 = !DILocation(line: 64, column: 26, scope: !81)
!95 = !DILocation(line: 64, column: 13, scope: !81)
!96 = !DILocation(line: 64, column: 24, scope: !81)
!97 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 66, type: !16)
!98 = distinct !DILexicalBlock(scope: !81, file: !12, line: 65, column: 5)
!99 = !DILocation(line: 66, column: 19, scope: !98)
!100 = !DILocation(line: 66, column: 34, scope: !98)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !12, line: 68, type: !48)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 67, column: 9)
!103 = !DILocation(line: 68, column: 21, scope: !102)
!104 = !DILocation(line: 70, column: 20, scope: !102)
!105 = !DILocation(line: 70, column: 26, scope: !102)
!106 = !DILocation(line: 70, column: 13, scope: !102)
!107 = !DILocation(line: 71, column: 24, scope: !102)
!108 = !DILocation(line: 71, column: 13, scope: !102)
!109 = !DILocation(line: 74, column: 1, scope: !81)
