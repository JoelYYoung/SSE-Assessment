; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !27
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !28
  %1 = load i32*, i32** %data.addr, align 8, !dbg !29
  %call = call i64 @wcslen(i32* %1) #7, !dbg !30
  %2 = load i32*, i32** %data.addr, align 8, !dbg !31
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %2) #8, !dbg !32
  %3 = load i32*, i32** %data.addr, align 8, !dbg !33
  call void @printWLine(i32* %3), !dbg !34
  %4 = load i32*, i32** %data.addr, align 8, !dbg !35
  %5 = bitcast i32* %4 to i8*, !dbg !35
  call void @free(i8* %5) #8, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_bad() #0 !dbg !38 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !41, metadata !DIExpression()), !dbg !42
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !43
  %0 = bitcast i8* %call to i32*, !dbg !44
  store i32* %0, i32** %data, align 8, !dbg !45
  %1 = load i32*, i32** %data, align 8, !dbg !46
  %cmp = icmp eq i32* %1, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !50
  unreachable, !dbg !50

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !52
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #8, !dbg !53
  %3 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %4 = load i32*, i32** %data, align 8, !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_badSink(i32* %4), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_goodG2BSink(i32* %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !62, metadata !DIExpression()), !dbg !64
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !64
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !65
  %1 = load i32*, i32** %data.addr, align 8, !dbg !66
  %call = call i64 @wcslen(i32* %1) #7, !dbg !67
  %2 = load i32*, i32** %data.addr, align 8, !dbg !68
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %2) #8, !dbg !69
  %3 = load i32*, i32** %data.addr, align 8, !dbg !70
  call void @printWLine(i32* %3), !dbg !71
  %4 = load i32*, i32** %data.addr, align 8, !dbg !72
  %5 = bitcast i32* %4 to i8*, !dbg !72
  call void @free(i8* %5) #8, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #8, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #8, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %cmp = icmp eq i32* %1, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !110
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !111
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_goodG2BSink(i32* %4), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_badSink", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 29, type: !4)
!21 = !DILocation(line: 29, column: 88, scope: !16)
!22 = !DILocalVariable(name: "dest", scope: !23, file: !17, line: 32, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 32, column: 17, scope: !23)
!28 = !DILocation(line: 34, column: 18, scope: !23)
!29 = !DILocation(line: 34, column: 31, scope: !23)
!30 = !DILocation(line: 34, column: 24, scope: !23)
!31 = !DILocation(line: 34, column: 45, scope: !23)
!32 = !DILocation(line: 34, column: 9, scope: !23)
!33 = !DILocation(line: 35, column: 20, scope: !23)
!34 = !DILocation(line: 35, column: 9, scope: !23)
!35 = !DILocation(line: 36, column: 14, scope: !23)
!36 = !DILocation(line: 36, column: 9, scope: !23)
!37 = !DILocation(line: 38, column: 1, scope: !16)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_bad", scope: !17, file: !17, line: 40, type: !39, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !17, line: 42, type: !4)
!42 = !DILocation(line: 42, column: 15, scope: !38)
!43 = !DILocation(line: 43, column: 23, scope: !38)
!44 = !DILocation(line: 43, column: 12, scope: !38)
!45 = !DILocation(line: 43, column: 10, scope: !38)
!46 = !DILocation(line: 44, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !17, line: 44, column: 9)
!48 = !DILocation(line: 44, column: 14, scope: !47)
!49 = !DILocation(line: 44, column: 9, scope: !38)
!50 = !DILocation(line: 44, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !17, line: 44, column: 23)
!52 = !DILocation(line: 46, column: 13, scope: !38)
!53 = !DILocation(line: 46, column: 5, scope: !38)
!54 = !DILocation(line: 47, column: 5, scope: !38)
!55 = !DILocation(line: 47, column: 17, scope: !38)
!56 = !DILocation(line: 48, column: 77, scope: !38)
!57 = !DILocation(line: 48, column: 5, scope: !38)
!58 = !DILocation(line: 49, column: 1, scope: !38)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_goodG2BSink", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !17, line: 55, type: !4)
!61 = !DILocation(line: 55, column: 92, scope: !59)
!62 = !DILocalVariable(name: "dest", scope: !63, file: !17, line: 58, type: !24)
!63 = distinct !DILexicalBlock(scope: !59, file: !17, line: 57, column: 5)
!64 = !DILocation(line: 58, column: 17, scope: !63)
!65 = !DILocation(line: 60, column: 18, scope: !63)
!66 = !DILocation(line: 60, column: 31, scope: !63)
!67 = !DILocation(line: 60, column: 24, scope: !63)
!68 = !DILocation(line: 60, column: 45, scope: !63)
!69 = !DILocation(line: 60, column: 9, scope: !63)
!70 = !DILocation(line: 61, column: 20, scope: !63)
!71 = !DILocation(line: 61, column: 9, scope: !63)
!72 = !DILocation(line: 62, column: 14, scope: !63)
!73 = !DILocation(line: 62, column: 9, scope: !63)
!74 = !DILocation(line: 64, column: 1, scope: !59)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_41_good", scope: !17, file: !17, line: 78, type: !39, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 80, column: 5, scope: !75)
!77 = !DILocation(line: 81, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 93, type: !79, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !17, line: 93, type: !7)
!85 = !DILocation(line: 93, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !17, line: 93, type: !81)
!87 = !DILocation(line: 93, column: 27, scope: !78)
!88 = !DILocation(line: 96, column: 22, scope: !78)
!89 = !DILocation(line: 96, column: 12, scope: !78)
!90 = !DILocation(line: 96, column: 5, scope: !78)
!91 = !DILocation(line: 98, column: 5, scope: !78)
!92 = !DILocation(line: 99, column: 5, scope: !78)
!93 = !DILocation(line: 100, column: 5, scope: !78)
!94 = !DILocation(line: 103, column: 5, scope: !78)
!95 = !DILocation(line: 104, column: 5, scope: !78)
!96 = !DILocation(line: 105, column: 5, scope: !78)
!97 = !DILocation(line: 107, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 67, type: !39, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !17, line: 69, type: !4)
!100 = !DILocation(line: 69, column: 15, scope: !98)
!101 = !DILocation(line: 70, column: 23, scope: !98)
!102 = !DILocation(line: 70, column: 12, scope: !98)
!103 = !DILocation(line: 70, column: 10, scope: !98)
!104 = !DILocation(line: 71, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !17, line: 71, column: 9)
!106 = !DILocation(line: 71, column: 14, scope: !105)
!107 = !DILocation(line: 71, column: 9, scope: !98)
!108 = !DILocation(line: 71, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !17, line: 71, column: 23)
!110 = !DILocation(line: 73, column: 13, scope: !98)
!111 = !DILocation(line: 73, column: 5, scope: !98)
!112 = !DILocation(line: 74, column: 5, scope: !98)
!113 = !DILocation(line: 74, column: 16, scope: !98)
!114 = !DILocation(line: 75, column: 81, scope: !98)
!115 = !DILocation(line: 75, column: 5, scope: !98)
!116 = !DILocation(line: 76, column: 1, scope: !98)
