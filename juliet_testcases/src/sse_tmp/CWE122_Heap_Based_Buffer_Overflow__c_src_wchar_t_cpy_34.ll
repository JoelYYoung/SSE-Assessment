; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !43
  store i32* %4, i32** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !48
  %5 = load i32*, i32** %unionSecond, align 8, !dbg !48
  store i32* %5, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !54
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !55
  %7 = load i32*, i32** %data2, align 8, !dbg !56
  %call3 = call i32* @wcscpy(i32* %arraydecay, i32* %7) #6, !dbg !57
  %8 = load i32*, i32** %data2, align 8, !dbg !58
  call void @printWLine(i32* %8), !dbg !59
  %9 = load i32*, i32** %data2, align 8, !dbg !60
  %10 = bitcast i32* %9 to i8*, !dbg !60
  call void @free(i8* %10) #6, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_good() #0 !dbg !63 {
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
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType* %myUnion, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !91
  %0 = bitcast i8* %call to i32*, !dbg !92
  store i32* %0, i32** %data, align 8, !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %cmp = icmp eq i32* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %4 = load i32*, i32** %data, align 8, !dbg !104
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !105
  store i32* %4, i32** %unionFirst, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !107, metadata !DIExpression()), !dbg !109
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType* %myUnion to i32**, !dbg !110
  %5 = load i32*, i32** %unionSecond, align 8, !dbg !110
  store i32* %5, i32** %data2, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !114
  %7 = load i32*, i32** %data2, align 8, !dbg !115
  %call3 = call i32* @wcscpy(i32* %arraydecay, i32* %7) #6, !dbg !116
  %8 = load i32*, i32** %data2, align 8, !dbg !117
  call void @printWLine(i32* %8), !dbg !118
  %9 = load i32*, i32** %data2, align 8, !dbg !119
  %10 = bitcast i32* %9 to i8*, !dbg !119
  call void @free(i8* %10) #6, !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 71, scope: !16)
!29 = !DILocation(line: 33, column: 23, scope: !16)
!30 = !DILocation(line: 33, column: 12, scope: !16)
!31 = !DILocation(line: 33, column: 10, scope: !16)
!32 = !DILocation(line: 34, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 9)
!34 = !DILocation(line: 34, column: 14, scope: !33)
!35 = !DILocation(line: 34, column: 9, scope: !16)
!36 = !DILocation(line: 34, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 34, column: 23)
!38 = !DILocation(line: 36, column: 13, scope: !16)
!39 = !DILocation(line: 36, column: 5, scope: !16)
!40 = !DILocation(line: 37, column: 5, scope: !16)
!41 = !DILocation(line: 37, column: 17, scope: !16)
!42 = !DILocation(line: 38, column: 26, scope: !16)
!43 = !DILocation(line: 38, column: 13, scope: !16)
!44 = !DILocation(line: 38, column: 24, scope: !16)
!45 = !DILocalVariable(name: "data", scope: !46, file: !17, line: 40, type: !4)
!46 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!47 = !DILocation(line: 40, column: 19, scope: !46)
!48 = !DILocation(line: 40, column: 34, scope: !46)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !17, line: 42, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !17, line: 41, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 42, column: 21, scope: !50)
!55 = !DILocation(line: 44, column: 20, scope: !50)
!56 = !DILocation(line: 44, column: 26, scope: !50)
!57 = !DILocation(line: 44, column: 13, scope: !50)
!58 = !DILocation(line: 45, column: 24, scope: !50)
!59 = !DILocation(line: 45, column: 13, scope: !50)
!60 = !DILocation(line: 46, column: 18, scope: !50)
!61 = !DILocation(line: 46, column: 13, scope: !50)
!62 = !DILocation(line: 49, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_34_good", scope: !17, file: !17, line: 78, type: !18, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 80, column: 5, scope: !63)
!65 = !DILocation(line: 81, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 92, type: !67, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !17, line: 92, type: !7)
!73 = !DILocation(line: 92, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !17, line: 92, type: !69)
!75 = !DILocation(line: 92, column: 27, scope: !66)
!76 = !DILocation(line: 95, column: 22, scope: !66)
!77 = !DILocation(line: 95, column: 12, scope: !66)
!78 = !DILocation(line: 95, column: 5, scope: !66)
!79 = !DILocation(line: 97, column: 5, scope: !66)
!80 = !DILocation(line: 98, column: 5, scope: !66)
!81 = !DILocation(line: 99, column: 5, scope: !66)
!82 = !DILocation(line: 102, column: 5, scope: !66)
!83 = !DILocation(line: 103, column: 5, scope: !66)
!84 = !DILocation(line: 104, column: 5, scope: !66)
!85 = !DILocation(line: 106, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !17, line: 58, type: !4)
!88 = !DILocation(line: 58, column: 15, scope: !86)
!89 = !DILocalVariable(name: "myUnion", scope: !86, file: !17, line: 59, type: !23)
!90 = !DILocation(line: 59, column: 71, scope: !86)
!91 = !DILocation(line: 60, column: 23, scope: !86)
!92 = !DILocation(line: 60, column: 12, scope: !86)
!93 = !DILocation(line: 60, column: 10, scope: !86)
!94 = !DILocation(line: 61, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !86, file: !17, line: 61, column: 9)
!96 = !DILocation(line: 61, column: 14, scope: !95)
!97 = !DILocation(line: 61, column: 9, scope: !86)
!98 = !DILocation(line: 61, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !17, line: 61, column: 23)
!100 = !DILocation(line: 63, column: 13, scope: !86)
!101 = !DILocation(line: 63, column: 5, scope: !86)
!102 = !DILocation(line: 64, column: 5, scope: !86)
!103 = !DILocation(line: 64, column: 16, scope: !86)
!104 = !DILocation(line: 65, column: 26, scope: !86)
!105 = !DILocation(line: 65, column: 13, scope: !86)
!106 = !DILocation(line: 65, column: 24, scope: !86)
!107 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 67, type: !4)
!108 = distinct !DILexicalBlock(scope: !86, file: !17, line: 66, column: 5)
!109 = !DILocation(line: 67, column: 19, scope: !108)
!110 = !DILocation(line: 67, column: 34, scope: !108)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !17, line: 69, type: !51)
!112 = distinct !DILexicalBlock(scope: !108, file: !17, line: 68, column: 9)
!113 = !DILocation(line: 69, column: 21, scope: !112)
!114 = !DILocation(line: 71, column: 20, scope: !112)
!115 = !DILocation(line: 71, column: 26, scope: !112)
!116 = !DILocation(line: 71, column: 13, scope: !112)
!117 = !DILocation(line: 72, column: 24, scope: !112)
!118 = !DILocation(line: 72, column: 13, scope: !112)
!119 = !DILocation(line: 73, column: 18, scope: !112)
!120 = !DILocation(line: 73, column: 13, scope: !112)
!121 = !DILocation(line: 76, column: 1, scope: !86)
