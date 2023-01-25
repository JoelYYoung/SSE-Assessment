; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !32
  %0 = bitcast i8* %call to i64*, !dbg !33
  store i64* %0, i64** %data, align 8, !dbg !34
  %1 = load i64*, i64** %data, align 8, !dbg !35
  %cmp = icmp eq i64* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !41
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType* %myUnion to i64**, !dbg !42
  store i64* %2, i64** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType* %myUnion to i64**, !dbg !47
  %3 = load i64*, i64** %unionSecond, align 8, !dbg !47
  store i64* %3, i64** %data1, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !53
  %5 = load i64*, i64** %data1, align 8, !dbg !54
  %6 = bitcast i64* %5 to i8*, !dbg !55
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !55
  %7 = bitcast i64* %arraydecay to i8*, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !55
  %8 = load i64*, i64** %data1, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !56
  %9 = load i64, i64* %arrayidx, align 8, !dbg !56
  call void @printLongLongLine(i64 %9), !dbg !57
  %10 = load i64*, i64** %data1, align 8, !dbg !58
  %11 = bitcast i64* %10 to i8*, !dbg !58
  call void @free(i8* %11) #7, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_bad(), !dbg !82
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
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType* %myUnion, metadata !88, metadata !DIExpression()), !dbg !89
  store i64* null, i64** %data, align 8, !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !91
  %0 = bitcast i8* %call to i64*, !dbg !92
  store i64* %0, i64** %data, align 8, !dbg !93
  %1 = load i64*, i64** %data, align 8, !dbg !94
  %cmp = icmp eq i64* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !100
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType* %myUnion to i64**, !dbg !101
  store i64* %2, i64** %unionFirst, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !103, metadata !DIExpression()), !dbg !105
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType* %myUnion to i64**, !dbg !106
  %3 = load i64*, i64** %unionSecond, align 8, !dbg !106
  store i64* %3, i64** %data1, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !109
  %5 = load i64*, i64** %data1, align 8, !dbg !110
  %6 = bitcast i64* %5 to i8*, !dbg !111
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !111
  %7 = bitcast i64* %arraydecay to i8*, !dbg !111
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !111
  %8 = load i64*, i64** %data1, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !112
  %9 = load i64, i64* %arrayidx, align 8, !dbg !112
  call void @printLongLongLine(i64 %9), !dbg !113
  %10 = load i64*, i64** %data1, align 8, !dbg !114
  %11 = bitcast i64* %10 to i8*, !dbg !114
  call void @free(i8* %11) #7, !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 15, scope: !18)
!24 = !DILocalVariable(name: "myUnion", scope: !18, file: !19, line: 30, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_unionType", file: !19, line: 23, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !19, line: 19, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !19, line: 21, baseType: !4, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !19, line: 22, baseType: !4, size: 64)
!30 = !DILocation(line: 30, column: 78, scope: !18)
!31 = !DILocation(line: 31, column: 10, scope: !18)
!32 = !DILocation(line: 33, column: 23, scope: !18)
!33 = !DILocation(line: 33, column: 12, scope: !18)
!34 = !DILocation(line: 33, column: 10, scope: !18)
!35 = !DILocation(line: 34, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 9)
!37 = !DILocation(line: 34, column: 14, scope: !36)
!38 = !DILocation(line: 34, column: 9, scope: !18)
!39 = !DILocation(line: 34, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 34, column: 23)
!41 = !DILocation(line: 35, column: 26, scope: !18)
!42 = !DILocation(line: 35, column: 13, scope: !18)
!43 = !DILocation(line: 35, column: 24, scope: !18)
!44 = !DILocalVariable(name: "data", scope: !45, file: !19, line: 37, type: !4)
!45 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 5)
!46 = !DILocation(line: 37, column: 19, scope: !45)
!47 = !DILocation(line: 37, column: 34, scope: !45)
!48 = !DILocalVariable(name: "source", scope: !49, file: !19, line: 39, type: !50)
!49 = distinct !DILexicalBlock(scope: !45, file: !19, line: 38, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 39, column: 21, scope: !49)
!54 = !DILocation(line: 41, column: 21, scope: !49)
!55 = !DILocation(line: 41, column: 13, scope: !49)
!56 = !DILocation(line: 42, column: 31, scope: !49)
!57 = !DILocation(line: 42, column: 13, scope: !49)
!58 = !DILocation(line: 43, column: 18, scope: !49)
!59 = !DILocation(line: 43, column: 13, scope: !49)
!60 = !DILocation(line: 46, column: 1, scope: !18)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_34_good", scope: !19, file: !19, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 76, column: 5, scope: !61)
!63 = !DILocation(line: 77, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 88, type: !65, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !19, line: 88, type: !67)
!72 = !DILocation(line: 88, column: 14, scope: !64)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !19, line: 88, type: !68)
!74 = !DILocation(line: 88, column: 27, scope: !64)
!75 = !DILocation(line: 91, column: 22, scope: !64)
!76 = !DILocation(line: 91, column: 12, scope: !64)
!77 = !DILocation(line: 91, column: 5, scope: !64)
!78 = !DILocation(line: 93, column: 5, scope: !64)
!79 = !DILocation(line: 94, column: 5, scope: !64)
!80 = !DILocation(line: 95, column: 5, scope: !64)
!81 = !DILocation(line: 98, column: 5, scope: !64)
!82 = !DILocation(line: 99, column: 5, scope: !64)
!83 = !DILocation(line: 100, column: 5, scope: !64)
!84 = !DILocation(line: 102, column: 5, scope: !64)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 53, type: !20, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !19, line: 55, type: !4)
!87 = !DILocation(line: 55, column: 15, scope: !85)
!88 = !DILocalVariable(name: "myUnion", scope: !85, file: !19, line: 56, type: !25)
!89 = !DILocation(line: 56, column: 78, scope: !85)
!90 = !DILocation(line: 57, column: 10, scope: !85)
!91 = !DILocation(line: 59, column: 23, scope: !85)
!92 = !DILocation(line: 59, column: 12, scope: !85)
!93 = !DILocation(line: 59, column: 10, scope: !85)
!94 = !DILocation(line: 60, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !85, file: !19, line: 60, column: 9)
!96 = !DILocation(line: 60, column: 14, scope: !95)
!97 = !DILocation(line: 60, column: 9, scope: !85)
!98 = !DILocation(line: 60, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !19, line: 60, column: 23)
!100 = !DILocation(line: 61, column: 26, scope: !85)
!101 = !DILocation(line: 61, column: 13, scope: !85)
!102 = !DILocation(line: 61, column: 24, scope: !85)
!103 = !DILocalVariable(name: "data", scope: !104, file: !19, line: 63, type: !4)
!104 = distinct !DILexicalBlock(scope: !85, file: !19, line: 62, column: 5)
!105 = !DILocation(line: 63, column: 19, scope: !104)
!106 = !DILocation(line: 63, column: 34, scope: !104)
!107 = !DILocalVariable(name: "source", scope: !108, file: !19, line: 65, type: !50)
!108 = distinct !DILexicalBlock(scope: !104, file: !19, line: 64, column: 9)
!109 = !DILocation(line: 65, column: 21, scope: !108)
!110 = !DILocation(line: 67, column: 21, scope: !108)
!111 = !DILocation(line: 67, column: 13, scope: !108)
!112 = !DILocation(line: 68, column: 31, scope: !108)
!113 = !DILocation(line: 68, column: 13, scope: !108)
!114 = !DILocation(line: 69, column: 18, scope: !108)
!115 = !DILocation(line: 69, column: 13, scope: !108)
!116 = !DILocation(line: 72, column: 1, scope: !85)
