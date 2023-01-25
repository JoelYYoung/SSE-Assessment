; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !42
  store i32* %3, i32** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !47
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !47
  store i32* %4, i32** %data1, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx3, align 4, !dbg !57
  %5 = load i32*, i32** %data1, align 8, !dbg !58
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !59
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !60
  %6 = load i32*, i32** %data1, align 8, !dbg !61
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !61
  store i32 0, i32* %arrayidx6, align 4, !dbg !62
  %7 = load i32*, i32** %data1, align 8, !dbg !63
  call void @printWLine(i32* %7), !dbg !64
  %8 = load i32*, i32** %data1, align 8, !dbg !65
  %9 = bitcast i32* %8 to i8*, !dbg !65
  call void @free(i8* %9) #5, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType* %myUnion, metadata !94, metadata !DIExpression()), !dbg !95
  store i32* null, i32** %data, align 8, !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !97
  %0 = bitcast i8* %call to i32*, !dbg !98
  store i32* %0, i32** %data, align 8, !dbg !99
  %1 = load i32*, i32** %data, align 8, !dbg !100
  %cmp = icmp eq i32* %1, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %3 = load i32*, i32** %data, align 8, !dbg !108
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !109
  store i32* %3, i32** %unionFirst, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !111, metadata !DIExpression()), !dbg !113
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType* %myUnion to i32**, !dbg !114
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !114
  store i32* %4, i32** %data1, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !119
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx3, align 4, !dbg !121
  %5 = load i32*, i32** %data1, align 8, !dbg !122
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !124
  %6 = load i32*, i32** %data1, align 8, !dbg !125
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !125
  store i32 0, i32* %arrayidx6, align 4, !dbg !126
  %7 = load i32*, i32** %data1, align 8, !dbg !127
  call void @printWLine(i32* %7), !dbg !128
  %8 = load i32*, i32** %data1, align 8, !dbg !129
  %9 = bitcast i32* %8 to i8*, !dbg !129
  call void @free(i8* %9) #5, !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 75, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocation(line: 35, column: 23, scope: !16)
!31 = !DILocation(line: 35, column: 12, scope: !16)
!32 = !DILocation(line: 35, column: 10, scope: !16)
!33 = !DILocation(line: 36, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 9)
!35 = !DILocation(line: 36, column: 14, scope: !34)
!36 = !DILocation(line: 36, column: 9, scope: !16)
!37 = !DILocation(line: 36, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 36, column: 23)
!39 = !DILocation(line: 37, column: 5, scope: !16)
!40 = !DILocation(line: 37, column: 13, scope: !16)
!41 = !DILocation(line: 38, column: 26, scope: !16)
!42 = !DILocation(line: 38, column: 13, scope: !16)
!43 = !DILocation(line: 38, column: 24, scope: !16)
!44 = !DILocalVariable(name: "data", scope: !45, file: !17, line: 40, type: !4)
!45 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!46 = !DILocation(line: 40, column: 19, scope: !45)
!47 = !DILocation(line: 40, column: 34, scope: !45)
!48 = !DILocalVariable(name: "source", scope: !49, file: !17, line: 42, type: !50)
!49 = distinct !DILexicalBlock(scope: !45, file: !17, line: 41, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 42, column: 21, scope: !49)
!54 = !DILocation(line: 43, column: 21, scope: !49)
!55 = !DILocation(line: 43, column: 13, scope: !49)
!56 = !DILocation(line: 44, column: 13, scope: !49)
!57 = !DILocation(line: 44, column: 27, scope: !49)
!58 = !DILocation(line: 46, column: 21, scope: !49)
!59 = !DILocation(line: 46, column: 27, scope: !49)
!60 = !DILocation(line: 46, column: 13, scope: !49)
!61 = !DILocation(line: 47, column: 13, scope: !49)
!62 = !DILocation(line: 47, column: 25, scope: !49)
!63 = !DILocation(line: 48, column: 24, scope: !49)
!64 = !DILocation(line: 48, column: 13, scope: !49)
!65 = !DILocation(line: 49, column: 18, scope: !49)
!66 = !DILocation(line: 49, column: 13, scope: !49)
!67 = !DILocation(line: 52, column: 1, scope: !16)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_34_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 86, column: 5, scope: !68)
!70 = !DILocation(line: 87, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 98, type: !72, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!7, !7, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !17, line: 98, type: !7)
!78 = !DILocation(line: 98, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !17, line: 98, type: !74)
!80 = !DILocation(line: 98, column: 27, scope: !71)
!81 = !DILocation(line: 101, column: 22, scope: !71)
!82 = !DILocation(line: 101, column: 12, scope: !71)
!83 = !DILocation(line: 101, column: 5, scope: !71)
!84 = !DILocation(line: 103, column: 5, scope: !71)
!85 = !DILocation(line: 104, column: 5, scope: !71)
!86 = !DILocation(line: 105, column: 5, scope: !71)
!87 = !DILocation(line: 108, column: 5, scope: !71)
!88 = !DILocation(line: 109, column: 5, scope: !71)
!89 = !DILocation(line: 110, column: 5, scope: !71)
!90 = !DILocation(line: 112, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !17, line: 61, type: !4)
!93 = !DILocation(line: 61, column: 15, scope: !91)
!94 = !DILocalVariable(name: "myUnion", scope: !91, file: !17, line: 62, type: !23)
!95 = !DILocation(line: 62, column: 75, scope: !91)
!96 = !DILocation(line: 63, column: 10, scope: !91)
!97 = !DILocation(line: 65, column: 23, scope: !91)
!98 = !DILocation(line: 65, column: 12, scope: !91)
!99 = !DILocation(line: 65, column: 10, scope: !91)
!100 = !DILocation(line: 66, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !91, file: !17, line: 66, column: 9)
!102 = !DILocation(line: 66, column: 14, scope: !101)
!103 = !DILocation(line: 66, column: 9, scope: !91)
!104 = !DILocation(line: 66, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !17, line: 66, column: 23)
!106 = !DILocation(line: 67, column: 5, scope: !91)
!107 = !DILocation(line: 67, column: 13, scope: !91)
!108 = !DILocation(line: 68, column: 26, scope: !91)
!109 = !DILocation(line: 68, column: 13, scope: !91)
!110 = !DILocation(line: 68, column: 24, scope: !91)
!111 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 70, type: !4)
!112 = distinct !DILexicalBlock(scope: !91, file: !17, line: 69, column: 5)
!113 = !DILocation(line: 70, column: 19, scope: !112)
!114 = !DILocation(line: 70, column: 34, scope: !112)
!115 = !DILocalVariable(name: "source", scope: !116, file: !17, line: 72, type: !50)
!116 = distinct !DILexicalBlock(scope: !112, file: !17, line: 71, column: 9)
!117 = !DILocation(line: 72, column: 21, scope: !116)
!118 = !DILocation(line: 73, column: 21, scope: !116)
!119 = !DILocation(line: 73, column: 13, scope: !116)
!120 = !DILocation(line: 74, column: 13, scope: !116)
!121 = !DILocation(line: 74, column: 27, scope: !116)
!122 = !DILocation(line: 76, column: 21, scope: !116)
!123 = !DILocation(line: 76, column: 27, scope: !116)
!124 = !DILocation(line: 76, column: 13, scope: !116)
!125 = !DILocation(line: 77, column: 13, scope: !116)
!126 = !DILocation(line: 77, column: 25, scope: !116)
!127 = !DILocation(line: 78, column: 24, scope: !116)
!128 = !DILocation(line: 78, column: 13, scope: !116)
!129 = !DILocation(line: 79, column: 18, scope: !116)
!130 = !DILocation(line: 79, column: 13, scope: !116)
!131 = !DILocation(line: 82, column: 1, scope: !91)
