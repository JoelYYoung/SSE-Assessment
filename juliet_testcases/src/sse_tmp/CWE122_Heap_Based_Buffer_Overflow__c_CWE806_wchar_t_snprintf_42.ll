; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @badSource(i32* %2), !dbg !32
  store i32* %call1, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #7, !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %6), !dbg !46
  %7 = load i32*, i32** %data, align 8, !dbg !47
  %8 = bitcast i32* %7 to i8*, !dbg !47
  call void @free(i8* %8) #7, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32*, i32** %data.addr, align 8, !dbg !55
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !56
  %1 = load i32*, i32** %data.addr, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !58
  %2 = load i32*, i32** %data.addr, align 8, !dbg !59
  ret i32* %2, !dbg !60
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42_good() #0 !dbg !61 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !87
  %0 = bitcast i8* %call to i32*, !dbg !88
  store i32* %0, i32** %data, align 8, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %cmp = icmp eq i32* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !96
  %call1 = call i32* @goodG2BSource(i32* %2), !dbg !97
  store i32* %call1, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !101
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !102
  %4 = load i32*, i32** %data, align 8, !dbg !103
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !104
  %5 = load i32*, i32** %data, align 8, !dbg !105
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %5) #7, !dbg !106
  %6 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %6), !dbg !108
  %7 = load i32*, i32** %data, align 8, !dbg !109
  %8 = bitcast i32* %7 to i8*, !dbg !109
  call void @free(i8* %8) #7, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !112 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load i32*, i32** %data.addr, align 8, !dbg !115
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !116
  %1 = load i32*, i32** %data.addr, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %2 = load i32*, i32** %data.addr, align 8, !dbg !119
  ret i32* %2, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 23, scope: !16)
!23 = !DILocation(line: 40, column: 12, scope: !16)
!24 = !DILocation(line: 40, column: 10, scope: !16)
!25 = !DILocation(line: 41, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 9)
!27 = !DILocation(line: 41, column: 14, scope: !26)
!28 = !DILocation(line: 41, column: 9, scope: !16)
!29 = !DILocation(line: 41, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 41, column: 23)
!31 = !DILocation(line: 42, column: 22, scope: !16)
!32 = !DILocation(line: 42, column: 12, scope: !16)
!33 = !DILocation(line: 42, column: 10, scope: !16)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !17, line: 44, type: !36)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 44, column: 17, scope: !35)
!40 = !DILocation(line: 46, column: 18, scope: !35)
!41 = !DILocation(line: 46, column: 31, scope: !35)
!42 = !DILocation(line: 46, column: 24, scope: !35)
!43 = !DILocation(line: 46, column: 45, scope: !35)
!44 = !DILocation(line: 46, column: 9, scope: !35)
!45 = !DILocation(line: 47, column: 20, scope: !35)
!46 = !DILocation(line: 47, column: 9, scope: !35)
!47 = !DILocation(line: 48, column: 14, scope: !35)
!48 = !DILocation(line: 48, column: 9, scope: !35)
!49 = !DILocation(line: 50, column: 1, scope: !16)
!50 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 29, type: !51, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!4, !4}
!53 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !17, line: 29, type: !4)
!54 = !DILocation(line: 29, column: 38, scope: !50)
!55 = !DILocation(line: 32, column: 13, scope: !50)
!56 = !DILocation(line: 32, column: 5, scope: !50)
!57 = !DILocation(line: 33, column: 5, scope: !50)
!58 = !DILocation(line: 33, column: 17, scope: !50)
!59 = !DILocation(line: 34, column: 12, scope: !50)
!60 = !DILocation(line: 34, column: 5, scope: !50)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_42_good", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 82, column: 5, scope: !61)
!63 = !DILocation(line: 83, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 95, type: !65, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !17, line: 95, type: !7)
!71 = !DILocation(line: 95, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !17, line: 95, type: !67)
!73 = !DILocation(line: 95, column: 27, scope: !64)
!74 = !DILocation(line: 98, column: 22, scope: !64)
!75 = !DILocation(line: 98, column: 12, scope: !64)
!76 = !DILocation(line: 98, column: 5, scope: !64)
!77 = !DILocation(line: 100, column: 5, scope: !64)
!78 = !DILocation(line: 101, column: 5, scope: !64)
!79 = !DILocation(line: 102, column: 5, scope: !64)
!80 = !DILocation(line: 105, column: 5, scope: !64)
!81 = !DILocation(line: 106, column: 5, scope: !64)
!82 = !DILocation(line: 107, column: 5, scope: !64)
!83 = !DILocation(line: 109, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 65, type: !18, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !17, line: 67, type: !4)
!86 = !DILocation(line: 67, column: 15, scope: !84)
!87 = !DILocation(line: 68, column: 23, scope: !84)
!88 = !DILocation(line: 68, column: 12, scope: !84)
!89 = !DILocation(line: 68, column: 10, scope: !84)
!90 = !DILocation(line: 69, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !17, line: 69, column: 9)
!92 = !DILocation(line: 69, column: 14, scope: !91)
!93 = !DILocation(line: 69, column: 9, scope: !84)
!94 = !DILocation(line: 69, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !17, line: 69, column: 23)
!96 = !DILocation(line: 70, column: 26, scope: !84)
!97 = !DILocation(line: 70, column: 12, scope: !84)
!98 = !DILocation(line: 70, column: 10, scope: !84)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !17, line: 72, type: !36)
!100 = distinct !DILexicalBlock(scope: !84, file: !17, line: 71, column: 5)
!101 = !DILocation(line: 72, column: 17, scope: !100)
!102 = !DILocation(line: 74, column: 18, scope: !100)
!103 = !DILocation(line: 74, column: 31, scope: !100)
!104 = !DILocation(line: 74, column: 24, scope: !100)
!105 = !DILocation(line: 74, column: 45, scope: !100)
!106 = !DILocation(line: 74, column: 9, scope: !100)
!107 = !DILocation(line: 75, column: 20, scope: !100)
!108 = !DILocation(line: 75, column: 9, scope: !100)
!109 = !DILocation(line: 76, column: 14, scope: !100)
!110 = !DILocation(line: 76, column: 9, scope: !100)
!111 = !DILocation(line: 78, column: 1, scope: !84)
!112 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 56, type: !51, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", arg: 1, scope: !112, file: !17, line: 56, type: !4)
!114 = !DILocation(line: 56, column: 42, scope: !112)
!115 = !DILocation(line: 59, column: 13, scope: !112)
!116 = !DILocation(line: 59, column: 5, scope: !112)
!117 = !DILocation(line: 60, column: 5, scope: !112)
!118 = !DILocation(line: 60, column: 16, scope: !112)
!119 = !DILocation(line: 61, column: 12, scope: !112)
!120 = !DILocation(line: 61, column: 5, scope: !112)
