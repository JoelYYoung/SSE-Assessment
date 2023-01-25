; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType = type { i32* }

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %2, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !45
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %3, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_bad.source to i8*), i64 44, i1 false), !dbg !51
  %5 = load i32*, i32** %data1, align 8, !dbg !52
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !53
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %call3 = call i64 @wcslen(i32* %arraydecay2) #9, !dbg !55
  %add = add i64 %call3, 1, !dbg !56
  %call4 = call i32* @wcsncpy(i32* %5, i32* %arraydecay, i64 %add) #7, !dbg !57
  %6 = load i32*, i32** %data1, align 8, !dbg !58
  call void @printWLine(i32* %6), !dbg !59
  %7 = load i32*, i32** %data1, align 8, !dbg !60
  %8 = bitcast i32* %7 to i8*, !dbg !60
  call void @free(i8* %8) #7, !dbg !61
  ret void, !dbg !62
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
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_good() #0 !dbg !63 {
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
  %call = call i64 @time(i64* null) #7, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #7, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType* %myUnion, metadata !89, metadata !DIExpression()), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !102
  store i32* %2, i32** %unionFirst, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !104, metadata !DIExpression()), !dbg !106
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !107
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !107
  store i32* %3, i32** %data1, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !110
  %5 = load i32*, i32** %data1, align 8, !dbg !111
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !112
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !113
  %call3 = call i64 @wcslen(i32* %arraydecay2) #9, !dbg !114
  %add = add i64 %call3, 1, !dbg !115
  %call4 = call i32* @wcsncpy(i32* %5, i32* %arraydecay, i64 %add) #7, !dbg !116
  %6 = load i32*, i32** %data1, align 8, !dbg !117
  call void @printWLine(i32* %6), !dbg !118
  %7 = load i32*, i32** %data1, align 8, !dbg !119
  %8 = bitcast i32* %7 to i8*, !dbg !119
  call void @free(i8* %8) #7, !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_bad", scope: !17, file: !17, line: 34, type: !18, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 36, type: !4)
!21 = !DILocation(line: 36, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 37, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_unionType", file: !17, line: 30, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 26, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 28, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 29, baseType: !4, size: 64)
!28 = !DILocation(line: 37, column: 75, scope: !16)
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
!52 = !DILocation(line: 49, column: 21, scope: !47)
!53 = !DILocation(line: 49, column: 27, scope: !47)
!54 = !DILocation(line: 49, column: 42, scope: !47)
!55 = !DILocation(line: 49, column: 35, scope: !47)
!56 = !DILocation(line: 49, column: 50, scope: !47)
!57 = !DILocation(line: 49, column: 13, scope: !47)
!58 = !DILocation(line: 50, column: 24, scope: !47)
!59 = !DILocation(line: 50, column: 13, scope: !47)
!60 = !DILocation(line: 51, column: 18, scope: !47)
!61 = !DILocation(line: 51, column: 13, scope: !47)
!62 = !DILocation(line: 54, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_34_good", scope: !17, file: !17, line: 83, type: !18, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 85, column: 5, scope: !63)
!65 = !DILocation(line: 86, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 97, type: !67, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !17, line: 97, type: !7)
!73 = !DILocation(line: 97, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !17, line: 97, type: !69)
!75 = !DILocation(line: 97, column: 27, scope: !66)
!76 = !DILocation(line: 100, column: 22, scope: !66)
!77 = !DILocation(line: 100, column: 12, scope: !66)
!78 = !DILocation(line: 100, column: 5, scope: !66)
!79 = !DILocation(line: 102, column: 5, scope: !66)
!80 = !DILocation(line: 103, column: 5, scope: !66)
!81 = !DILocation(line: 104, column: 5, scope: !66)
!82 = !DILocation(line: 107, column: 5, scope: !66)
!83 = !DILocation(line: 108, column: 5, scope: !66)
!84 = !DILocation(line: 109, column: 5, scope: !66)
!85 = !DILocation(line: 111, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !17, line: 63, type: !4)
!88 = !DILocation(line: 63, column: 15, scope: !86)
!89 = !DILocalVariable(name: "myUnion", scope: !86, file: !17, line: 64, type: !23)
!90 = !DILocation(line: 64, column: 75, scope: !86)
!91 = !DILocation(line: 65, column: 10, scope: !86)
!92 = !DILocation(line: 67, column: 23, scope: !86)
!93 = !DILocation(line: 67, column: 12, scope: !86)
!94 = !DILocation(line: 67, column: 10, scope: !86)
!95 = !DILocation(line: 68, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !86, file: !17, line: 68, column: 9)
!97 = !DILocation(line: 68, column: 14, scope: !96)
!98 = !DILocation(line: 68, column: 9, scope: !86)
!99 = !DILocation(line: 68, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 68, column: 23)
!101 = !DILocation(line: 69, column: 26, scope: !86)
!102 = !DILocation(line: 69, column: 13, scope: !86)
!103 = !DILocation(line: 69, column: 24, scope: !86)
!104 = !DILocalVariable(name: "data", scope: !105, file: !17, line: 71, type: !4)
!105 = distinct !DILexicalBlock(scope: !86, file: !17, line: 70, column: 5)
!106 = !DILocation(line: 71, column: 19, scope: !105)
!107 = !DILocation(line: 71, column: 34, scope: !105)
!108 = !DILocalVariable(name: "source", scope: !109, file: !17, line: 73, type: !48)
!109 = distinct !DILexicalBlock(scope: !105, file: !17, line: 72, column: 9)
!110 = !DILocation(line: 73, column: 21, scope: !109)
!111 = !DILocation(line: 76, column: 21, scope: !109)
!112 = !DILocation(line: 76, column: 27, scope: !109)
!113 = !DILocation(line: 76, column: 42, scope: !109)
!114 = !DILocation(line: 76, column: 35, scope: !109)
!115 = !DILocation(line: 76, column: 50, scope: !109)
!116 = !DILocation(line: 76, column: 13, scope: !109)
!117 = !DILocation(line: 77, column: 24, scope: !109)
!118 = !DILocation(line: 77, column: 13, scope: !109)
!119 = !DILocation(line: 78, column: 18, scope: !109)
!120 = !DILocation(line: 78, column: 13, scope: !109)
!121 = !DILocation(line: 81, column: 1, scope: !86)
