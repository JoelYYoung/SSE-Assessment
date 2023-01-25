; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
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
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion to i32**, !dbg !42
  store i32* %3, i32** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion to i32**, !dbg !47
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !47
  store i32* %4, i32** %data1, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx3, align 4, !dbg !57
  %5 = load i32*, i32** %data1, align 8, !dbg !58
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !59
  %call5 = call i32* @wcscat(i32* %5, i32* %arraydecay4) #5, !dbg !60
  %6 = load i32*, i32** %data1, align 8, !dbg !61
  call void @printWLine(i32* %6), !dbg !62
  %7 = load i32*, i32** %data1, align 8, !dbg !63
  %8 = bitcast i32* %7 to i8*, !dbg !63
  call void @free(i8* %8) #5, !dbg !64
  ret void, !dbg !65
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
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !95
  %0 = bitcast i8* %call to i32*, !dbg !96
  store i32* %0, i32** %data, align 8, !dbg !97
  %1 = load i32*, i32** %data, align 8, !dbg !98
  %cmp = icmp eq i32* %1, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion to i32**, !dbg !107
  store i32* %3, i32** %unionFirst, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !109, metadata !DIExpression()), !dbg !111
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion to i32**, !dbg !112
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !112
  store i32* %4, i32** %data1, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !117
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx3, align 4, !dbg !119
  %5 = load i32*, i32** %data1, align 8, !dbg !120
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %call5 = call i32* @wcscat(i32* %5, i32* %arraydecay4) #5, !dbg !122
  %6 = load i32*, i32** %data1, align 8, !dbg !123
  call void @printWLine(i32* %6), !dbg !124
  %7 = load i32*, i32** %data1, align 8, !dbg !125
  %8 = bitcast i32* %7 to i8*, !dbg !125
  call void @free(i8* %8) #5, !dbg !126
  ret void, !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 72, scope: !16)
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
!58 = !DILocation(line: 46, column: 20, scope: !49)
!59 = !DILocation(line: 46, column: 26, scope: !49)
!60 = !DILocation(line: 46, column: 13, scope: !49)
!61 = !DILocation(line: 47, column: 24, scope: !49)
!62 = !DILocation(line: 47, column: 13, scope: !49)
!63 = !DILocation(line: 48, column: 18, scope: !49)
!64 = !DILocation(line: 48, column: 13, scope: !49)
!65 = !DILocation(line: 51, column: 1, scope: !16)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_good", scope: !17, file: !17, line: 82, type: !18, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 84, column: 5, scope: !66)
!68 = !DILocation(line: 85, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 96, type: !70, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!7, !7, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !17, line: 96, type: !7)
!76 = !DILocation(line: 96, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !17, line: 96, type: !72)
!78 = !DILocation(line: 96, column: 27, scope: !69)
!79 = !DILocation(line: 99, column: 22, scope: !69)
!80 = !DILocation(line: 99, column: 12, scope: !69)
!81 = !DILocation(line: 99, column: 5, scope: !69)
!82 = !DILocation(line: 101, column: 5, scope: !69)
!83 = !DILocation(line: 102, column: 5, scope: !69)
!84 = !DILocation(line: 103, column: 5, scope: !69)
!85 = !DILocation(line: 106, column: 5, scope: !69)
!86 = !DILocation(line: 107, column: 5, scope: !69)
!87 = !DILocation(line: 108, column: 5, scope: !69)
!88 = !DILocation(line: 110, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !17, line: 60, type: !4)
!91 = !DILocation(line: 60, column: 15, scope: !89)
!92 = !DILocalVariable(name: "myUnion", scope: !89, file: !17, line: 61, type: !23)
!93 = !DILocation(line: 61, column: 72, scope: !89)
!94 = !DILocation(line: 62, column: 10, scope: !89)
!95 = !DILocation(line: 64, column: 23, scope: !89)
!96 = !DILocation(line: 64, column: 12, scope: !89)
!97 = !DILocation(line: 64, column: 10, scope: !89)
!98 = !DILocation(line: 65, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !89, file: !17, line: 65, column: 9)
!100 = !DILocation(line: 65, column: 14, scope: !99)
!101 = !DILocation(line: 65, column: 9, scope: !89)
!102 = !DILocation(line: 65, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !17, line: 65, column: 23)
!104 = !DILocation(line: 66, column: 5, scope: !89)
!105 = !DILocation(line: 66, column: 13, scope: !89)
!106 = !DILocation(line: 67, column: 26, scope: !89)
!107 = !DILocation(line: 67, column: 13, scope: !89)
!108 = !DILocation(line: 67, column: 24, scope: !89)
!109 = !DILocalVariable(name: "data", scope: !110, file: !17, line: 69, type: !4)
!110 = distinct !DILexicalBlock(scope: !89, file: !17, line: 68, column: 5)
!111 = !DILocation(line: 69, column: 19, scope: !110)
!112 = !DILocation(line: 69, column: 34, scope: !110)
!113 = !DILocalVariable(name: "source", scope: !114, file: !17, line: 71, type: !50)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 70, column: 9)
!115 = !DILocation(line: 71, column: 21, scope: !114)
!116 = !DILocation(line: 72, column: 21, scope: !114)
!117 = !DILocation(line: 72, column: 13, scope: !114)
!118 = !DILocation(line: 73, column: 13, scope: !114)
!119 = !DILocation(line: 73, column: 27, scope: !114)
!120 = !DILocation(line: 75, column: 20, scope: !114)
!121 = !DILocation(line: 75, column: 26, scope: !114)
!122 = !DILocation(line: 75, column: 13, scope: !114)
!123 = !DILocation(line: 76, column: 24, scope: !114)
!124 = !DILocation(line: 76, column: 13, scope: !114)
!125 = !DILocation(line: 77, column: 18, scope: !114)
!126 = !DILocation(line: 77, column: 13, scope: !114)
!127 = !DILocation(line: 80, column: 1, scope: !89)
