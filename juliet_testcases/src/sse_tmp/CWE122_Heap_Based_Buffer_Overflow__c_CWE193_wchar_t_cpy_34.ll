; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType = type { i32* }

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %2, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !45
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %3, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_bad.source to i8*), i64 44, i1 false), !dbg !51
  %5 = load i32*, i32** %data1, align 8, !dbg !52
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !53
  %call2 = call i32* @wcscpy(i32* %5, i32* %arraydecay) #6, !dbg !54
  %6 = load i32*, i32** %data1, align 8, !dbg !55
  call void @printWLine(i32* %6), !dbg !56
  %7 = load i32*, i32** %data1, align 8, !dbg !57
  %8 = bitcast i32* %7 to i8*, !dbg !57
  call void @free(i8* %8) #6, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_good() #0 !dbg !60 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
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
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType* %myUnion, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !99
  store i32* %2, i32** %unionFirst, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !101, metadata !DIExpression()), !dbg !103
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !104
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !104
  store i32* %3, i32** %data1, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !107
  %5 = load i32*, i32** %data1, align 8, !dbg !108
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !109
  %call2 = call i32* @wcscpy(i32* %5, i32* %arraydecay) #6, !dbg !110
  %6 = load i32*, i32** %data1, align 8, !dbg !111
  call void @printWLine(i32* %6), !dbg !112
  %7 = load i32*, i32** %data1, align 8, !dbg !113
  %8 = bitcast i32* %7 to i8*, !dbg !113
  call void @free(i8* %8) #6, !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_bad", scope: !17, file: !17, line: 34, type: !18, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 36, type: !4)
!21 = !DILocation(line: 36, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 37, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_unionType", file: !17, line: 30, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 26, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 28, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 29, baseType: !4, size: 64)
!28 = !DILocation(line: 37, column: 74, scope: !16)
!29 = !DILocation(line: 38, column: 10, scope: !16)
!30 = !DILocation(line: 40, column: 23, scope: !16)
!31 = !DILocation(line: 40, column: 12, scope: !16)
!32 = !DILocation(line: 40, column: 10, scope: !16)
!33 = !DILocation(line: 41, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 9)
!35 = !DILocation(line: 41, column: 14, scope: !34)
!36 = !DILocation(line: 41, column: 9, scope: !16)
!37 = !DILocation(line: 41, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 41, column: 23)
!39 = !DILocation(line: 42, column: 26, scope: !16)
!40 = !DILocation(line: 42, column: 13, scope: !16)
!41 = !DILocation(line: 42, column: 24, scope: !16)
!42 = !DILocalVariable(name: "data", scope: !43, file: !17, line: 44, type: !4)
!43 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!44 = !DILocation(line: 44, column: 19, scope: !43)
!45 = !DILocation(line: 44, column: 34, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !17, line: 46, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !17, line: 45, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 11)
!51 = !DILocation(line: 46, column: 21, scope: !47)
!52 = !DILocation(line: 48, column: 20, scope: !47)
!53 = !DILocation(line: 48, column: 26, scope: !47)
!54 = !DILocation(line: 48, column: 13, scope: !47)
!55 = !DILocation(line: 49, column: 24, scope: !47)
!56 = !DILocation(line: 49, column: 13, scope: !47)
!57 = !DILocation(line: 50, column: 18, scope: !47)
!58 = !DILocation(line: 50, column: 13, scope: !47)
!59 = !DILocation(line: 53, column: 1, scope: !16)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_34_good", scope: !17, file: !17, line: 81, type: !18, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 83, column: 5, scope: !60)
!62 = !DILocation(line: 84, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 95, type: !64, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 95, type: !7)
!70 = !DILocation(line: 95, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 95, type: !66)
!72 = !DILocation(line: 95, column: 27, scope: !63)
!73 = !DILocation(line: 98, column: 22, scope: !63)
!74 = !DILocation(line: 98, column: 12, scope: !63)
!75 = !DILocation(line: 98, column: 5, scope: !63)
!76 = !DILocation(line: 100, column: 5, scope: !63)
!77 = !DILocation(line: 101, column: 5, scope: !63)
!78 = !DILocation(line: 102, column: 5, scope: !63)
!79 = !DILocation(line: 105, column: 5, scope: !63)
!80 = !DILocation(line: 106, column: 5, scope: !63)
!81 = !DILocation(line: 107, column: 5, scope: !63)
!82 = !DILocation(line: 109, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 60, type: !18, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 62, type: !4)
!85 = !DILocation(line: 62, column: 15, scope: !83)
!86 = !DILocalVariable(name: "myUnion", scope: !83, file: !17, line: 63, type: !23)
!87 = !DILocation(line: 63, column: 74, scope: !83)
!88 = !DILocation(line: 64, column: 10, scope: !83)
!89 = !DILocation(line: 66, column: 23, scope: !83)
!90 = !DILocation(line: 66, column: 12, scope: !83)
!91 = !DILocation(line: 66, column: 10, scope: !83)
!92 = !DILocation(line: 67, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !17, line: 67, column: 9)
!94 = !DILocation(line: 67, column: 14, scope: !93)
!95 = !DILocation(line: 67, column: 9, scope: !83)
!96 = !DILocation(line: 67, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 67, column: 23)
!98 = !DILocation(line: 68, column: 26, scope: !83)
!99 = !DILocation(line: 68, column: 13, scope: !83)
!100 = !DILocation(line: 68, column: 24, scope: !83)
!101 = !DILocalVariable(name: "data", scope: !102, file: !17, line: 70, type: !4)
!102 = distinct !DILexicalBlock(scope: !83, file: !17, line: 69, column: 5)
!103 = !DILocation(line: 70, column: 19, scope: !102)
!104 = !DILocation(line: 70, column: 34, scope: !102)
!105 = !DILocalVariable(name: "source", scope: !106, file: !17, line: 72, type: !48)
!106 = distinct !DILexicalBlock(scope: !102, file: !17, line: 71, column: 9)
!107 = !DILocation(line: 72, column: 21, scope: !106)
!108 = !DILocation(line: 74, column: 20, scope: !106)
!109 = !DILocation(line: 74, column: 26, scope: !106)
!110 = !DILocation(line: 74, column: 13, scope: !106)
!111 = !DILocation(line: 75, column: 24, scope: !106)
!112 = !DILocation(line: 75, column: 13, scope: !106)
!113 = !DILocation(line: 76, column: 18, scope: !106)
!114 = !DILocation(line: 76, column: 13, scope: !106)
!115 = !DILocation(line: 79, column: 1, scope: !83)
