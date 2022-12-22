; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion to i8**, !dbg !40
  store i8* %3, i8** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion to i8**, !dbg !45
  %4 = load i8*, i8** %unionSecond, align 8, !dbg !45
  store i8* %4, i8** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !52
  %6 = load i8*, i8** %data1, align 8, !dbg !53
  %call2 = call i8* @strcat(i8* %arraydecay, i8* %6) #6, !dbg !54
  %7 = load i8*, i8** %data1, align 8, !dbg !55
  call void @printLine(i8* %7), !dbg !56
  %8 = load i8*, i8** %data1, align 8, !dbg !57
  call void @free(i8* %8) #6, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_good() #0 !dbg !60 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !87
  store i8* %call, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %cmp = icmp eq i8* %0, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %3 = load i8*, i8** %data, align 8, !dbg !99
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion to i8**, !dbg !100
  store i8* %3, i8** %unionFirst, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !102, metadata !DIExpression()), !dbg !104
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion to i8**, !dbg !105
  %4 = load i8*, i8** %unionSecond, align 8, !dbg !105
  store i8* %4, i8** %data1, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !109
  %6 = load i8*, i8** %data1, align 8, !dbg !110
  %call2 = call i8* @strcat(i8* %arraydecay, i8* %6) #6, !dbg !111
  %7 = load i8*, i8** %data1, align 8, !dbg !112
  call void @printLine(i8* %7), !dbg !113
  %8 = load i8*, i8** %data1, align 8, !dbg !114
  call void @free(i8* %8) #6, !dbg !115
  ret void, !dbg !116
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
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType", file: !15, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 23, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 24, baseType: !4, size: 64)
!26 = !DILocation(line: 32, column: 68, scope: !14)
!27 = !DILocation(line: 33, column: 20, scope: !14)
!28 = !DILocation(line: 33, column: 10, scope: !14)
!29 = !DILocation(line: 34, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!31 = !DILocation(line: 34, column: 14, scope: !30)
!32 = !DILocation(line: 34, column: 9, scope: !14)
!33 = !DILocation(line: 34, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 34, column: 23)
!35 = !DILocation(line: 36, column: 12, scope: !14)
!36 = !DILocation(line: 36, column: 5, scope: !14)
!37 = !DILocation(line: 37, column: 5, scope: !14)
!38 = !DILocation(line: 37, column: 17, scope: !14)
!39 = !DILocation(line: 38, column: 26, scope: !14)
!40 = !DILocation(line: 38, column: 13, scope: !14)
!41 = !DILocation(line: 38, column: 24, scope: !14)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 40, type: !4)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 16, scope: !43)
!45 = !DILocation(line: 40, column: 31, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !15, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 41, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 42, column: 18, scope: !47)
!52 = !DILocation(line: 44, column: 20, scope: !47)
!53 = !DILocation(line: 44, column: 26, scope: !47)
!54 = !DILocation(line: 44, column: 13, scope: !47)
!55 = !DILocation(line: 45, column: 23, scope: !47)
!56 = !DILocation(line: 45, column: 13, scope: !47)
!57 = !DILocation(line: 46, column: 18, scope: !47)
!58 = !DILocation(line: 46, column: 13, scope: !47)
!59 = !DILocation(line: 49, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_good", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 80, column: 5, scope: !60)
!62 = !DILocation(line: 81, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 92, type: !64, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 92, type: !66)
!69 = !DILocation(line: 92, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 92, type: !67)
!71 = !DILocation(line: 92, column: 27, scope: !63)
!72 = !DILocation(line: 95, column: 22, scope: !63)
!73 = !DILocation(line: 95, column: 12, scope: !63)
!74 = !DILocation(line: 95, column: 5, scope: !63)
!75 = !DILocation(line: 97, column: 5, scope: !63)
!76 = !DILocation(line: 98, column: 5, scope: !63)
!77 = !DILocation(line: 99, column: 5, scope: !63)
!78 = !DILocation(line: 102, column: 5, scope: !63)
!79 = !DILocation(line: 103, column: 5, scope: !63)
!80 = !DILocation(line: 104, column: 5, scope: !63)
!81 = !DILocation(line: 106, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 58, type: !4)
!84 = !DILocation(line: 58, column: 12, scope: !82)
!85 = !DILocalVariable(name: "myUnion", scope: !82, file: !15, line: 59, type: !21)
!86 = !DILocation(line: 59, column: 68, scope: !82)
!87 = !DILocation(line: 60, column: 20, scope: !82)
!88 = !DILocation(line: 60, column: 10, scope: !82)
!89 = !DILocation(line: 61, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !15, line: 61, column: 9)
!91 = !DILocation(line: 61, column: 14, scope: !90)
!92 = !DILocation(line: 61, column: 9, scope: !82)
!93 = !DILocation(line: 61, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 61, column: 23)
!95 = !DILocation(line: 63, column: 12, scope: !82)
!96 = !DILocation(line: 63, column: 5, scope: !82)
!97 = !DILocation(line: 64, column: 5, scope: !82)
!98 = !DILocation(line: 64, column: 16, scope: !82)
!99 = !DILocation(line: 65, column: 26, scope: !82)
!100 = !DILocation(line: 65, column: 13, scope: !82)
!101 = !DILocation(line: 65, column: 24, scope: !82)
!102 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 67, type: !4)
!103 = distinct !DILexicalBlock(scope: !82, file: !15, line: 66, column: 5)
!104 = !DILocation(line: 67, column: 16, scope: !103)
!105 = !DILocation(line: 67, column: 31, scope: !103)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !15, line: 69, type: !48)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 68, column: 9)
!108 = !DILocation(line: 69, column: 18, scope: !107)
!109 = !DILocation(line: 71, column: 20, scope: !107)
!110 = !DILocation(line: 71, column: 26, scope: !107)
!111 = !DILocation(line: 71, column: 13, scope: !107)
!112 = !DILocation(line: 72, column: 23, scope: !107)
!113 = !DILocation(line: 72, column: 13, scope: !107)
!114 = !DILocation(line: 73, column: 18, scope: !107)
!115 = !DILocation(line: 73, column: 13, scope: !107)
!116 = !DILocation(line: 76, column: 1, scope: !82)
