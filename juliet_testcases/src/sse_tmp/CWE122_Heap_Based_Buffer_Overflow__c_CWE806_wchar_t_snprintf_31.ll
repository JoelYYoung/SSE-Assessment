; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
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
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %4, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %5, i32** %data2, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %7 = load i32*, i32** %data2, align 8, !dbg !49
  %call3 = call i64 @wcslen(i32* %7) #9, !dbg !50
  %8 = load i32*, i32** %data2, align 8, !dbg !51
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #7, !dbg !52
  %9 = load i32*, i32** %data2, align 8, !dbg !53
  call void @printWLine(i32* %9), !dbg !54
  %10 = load i32*, i32** %data2, align 8, !dbg !55
  %11 = bitcast i32* %10 to i8*, !dbg !55
  call void @free(i8* %11) #7, !dbg !56
  ret void, !dbg !57
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
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31_good() #0 !dbg !58 {
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
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !84
  %0 = bitcast i8* %call to i32*, !dbg !85
  store i32* %0, i32** %data, align 8, !dbg !86
  %1 = load i32*, i32** %data, align 8, !dbg !87
  %cmp = icmp eq i32* %1, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !93
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !97, metadata !DIExpression()), !dbg !99
  %4 = load i32*, i32** %data, align 8, !dbg !100
  store i32* %4, i32** %dataCopy, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !101, metadata !DIExpression()), !dbg !102
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !103
  store i32* %5, i32** %data2, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !107
  %7 = load i32*, i32** %data2, align 8, !dbg !108
  %call3 = call i64 @wcslen(i32* %7) #9, !dbg !109
  %8 = load i32*, i32** %data2, align 8, !dbg !110
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #7, !dbg !111
  %9 = load i32*, i32** %data2, align 8, !dbg !112
  call void @printWLine(i32* %9), !dbg !113
  %10 = load i32*, i32** %data2, align 8, !dbg !114
  %11 = bitcast i32* %10 to i8*, !dbg !114
  call void @free(i8* %11) #7, !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocation(line: 32, column: 23, scope: !16)
!23 = !DILocation(line: 32, column: 12, scope: !16)
!24 = !DILocation(line: 32, column: 10, scope: !16)
!25 = !DILocation(line: 33, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 9)
!27 = !DILocation(line: 33, column: 14, scope: !26)
!28 = !DILocation(line: 33, column: 9, scope: !16)
!29 = !DILocation(line: 33, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 33, column: 23)
!31 = !DILocation(line: 35, column: 13, scope: !16)
!32 = !DILocation(line: 35, column: 5, scope: !16)
!33 = !DILocation(line: 36, column: 5, scope: !16)
!34 = !DILocation(line: 36, column: 17, scope: !16)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !17, line: 38, type: !4)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!37 = !DILocation(line: 38, column: 19, scope: !36)
!38 = !DILocation(line: 38, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !17, line: 39, type: !4)
!40 = !DILocation(line: 39, column: 19, scope: !36)
!41 = !DILocation(line: 39, column: 26, scope: !36)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !17, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !17, line: 40, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 41, column: 21, scope: !43)
!48 = !DILocation(line: 43, column: 22, scope: !43)
!49 = !DILocation(line: 43, column: 35, scope: !43)
!50 = !DILocation(line: 43, column: 28, scope: !43)
!51 = !DILocation(line: 43, column: 49, scope: !43)
!52 = !DILocation(line: 43, column: 13, scope: !43)
!53 = !DILocation(line: 44, column: 24, scope: !43)
!54 = !DILocation(line: 44, column: 13, scope: !43)
!55 = !DILocation(line: 45, column: 18, scope: !43)
!56 = !DILocation(line: 45, column: 13, scope: !43)
!57 = !DILocation(line: 48, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_31_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 78, column: 5, scope: !58)
!60 = !DILocation(line: 79, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 90, type: !62, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !17, line: 90, type: !7)
!68 = !DILocation(line: 90, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !17, line: 90, type: !64)
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
!81 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !17, line: 57, type: !4)
!83 = !DILocation(line: 57, column: 15, scope: !81)
!84 = !DILocation(line: 58, column: 23, scope: !81)
!85 = !DILocation(line: 58, column: 12, scope: !81)
!86 = !DILocation(line: 58, column: 10, scope: !81)
!87 = !DILocation(line: 59, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !17, line: 59, column: 9)
!89 = !DILocation(line: 59, column: 14, scope: !88)
!90 = !DILocation(line: 59, column: 9, scope: !81)
!91 = !DILocation(line: 59, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !17, line: 59, column: 23)
!93 = !DILocation(line: 61, column: 13, scope: !81)
!94 = !DILocation(line: 61, column: 5, scope: !81)
!95 = !DILocation(line: 62, column: 5, scope: !81)
!96 = !DILocation(line: 62, column: 16, scope: !81)
!97 = !DILocalVariable(name: "dataCopy", scope: !98, file: !17, line: 64, type: !4)
!98 = distinct !DILexicalBlock(scope: !81, file: !17, line: 63, column: 5)
!99 = !DILocation(line: 64, column: 19, scope: !98)
!100 = !DILocation(line: 64, column: 30, scope: !98)
!101 = !DILocalVariable(name: "data", scope: !98, file: !17, line: 65, type: !4)
!102 = !DILocation(line: 65, column: 19, scope: !98)
!103 = !DILocation(line: 65, column: 26, scope: !98)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !17, line: 67, type: !44)
!105 = distinct !DILexicalBlock(scope: !98, file: !17, line: 66, column: 9)
!106 = !DILocation(line: 67, column: 21, scope: !105)
!107 = !DILocation(line: 69, column: 22, scope: !105)
!108 = !DILocation(line: 69, column: 35, scope: !105)
!109 = !DILocation(line: 69, column: 28, scope: !105)
!110 = !DILocation(line: 69, column: 49, scope: !105)
!111 = !DILocation(line: 69, column: 13, scope: !105)
!112 = !DILocation(line: 70, column: 24, scope: !105)
!113 = !DILocation(line: 70, column: 13, scope: !105)
!114 = !DILocation(line: 71, column: 18, scope: !105)
!115 = !DILocation(line: 71, column: 13, scope: !105)
!116 = !DILocation(line: 74, column: 1, scope: !81)
