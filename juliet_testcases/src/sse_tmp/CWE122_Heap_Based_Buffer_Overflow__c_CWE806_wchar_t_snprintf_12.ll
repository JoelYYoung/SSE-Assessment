; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12_bad() #0 !dbg !16 {
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
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !31
  %tobool = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool, label %if.then2, label %if.else, !dbg !33

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end6, !dbg !39

if.else:                                          ; preds = %if.end
  %4 = load i32*, i32** %data, align 8, !dbg !40
  %call4 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 49, !dbg !43
  store i32 0, i32* %arrayidx5, align 4, !dbg !44
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %call7 = call i64 @wcslen(i32* %7) #9, !dbg !53
  %8 = load i32*, i32** %data, align 8, !dbg !54
  %call8 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call7, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #7, !dbg !55
  %9 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %9), !dbg !57
  %10 = load i32*, i32** %data, align 8, !dbg !58
  %11 = bitcast i32* %10 to i8*, !dbg !58
  call void @free(i8* %11) #7, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @globalReturnsTrueOrFalse(...) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12_good() #0 !dbg !61 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

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
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !96
  %tobool = icmp ne i32 %call1, 0, !dbg !96
  br i1 %tobool, label %if.then2, label %if.else, !dbg !98

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !99
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %if.end6, !dbg !104

if.else:                                          ; preds = %if.end
  %4 = load i32*, i32** %data, align 8, !dbg !105
  %call4 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !107
  %5 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 49, !dbg !108
  store i32 0, i32* %arrayidx5, align 4, !dbg !109
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %call7 = call i64 @wcslen(i32* %7) #9, !dbg !115
  %8 = load i32*, i32** %data, align 8, !dbg !116
  %call8 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call7, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #7, !dbg !117
  %9 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* %9), !dbg !119
  %10 = load i32*, i32** %data, align 8, !dbg !120
  %11 = bitcast i32* %10 to i8*, !dbg !120
  call void @free(i8* %11) #7, !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 8, scope: !16)
!34 = !DILocation(line: 37, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 9, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 21, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocation(line: 43, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !17, line: 41, column: 5)
!42 = !DILocation(line: 43, column: 9, scope: !41)
!43 = !DILocation(line: 44, column: 9, scope: !41)
!44 = !DILocation(line: 44, column: 20, scope: !41)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !17, line: 47, type: !47)
!46 = distinct !DILexicalBlock(scope: !16, file: !17, line: 46, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 47, column: 17, scope: !46)
!51 = !DILocation(line: 49, column: 18, scope: !46)
!52 = !DILocation(line: 49, column: 31, scope: !46)
!53 = !DILocation(line: 49, column: 24, scope: !46)
!54 = !DILocation(line: 49, column: 45, scope: !46)
!55 = !DILocation(line: 49, column: 9, scope: !46)
!56 = !DILocation(line: 50, column: 20, scope: !46)
!57 = !DILocation(line: 50, column: 9, scope: !46)
!58 = !DILocation(line: 51, column: 14, scope: !46)
!59 = !DILocation(line: 51, column: 9, scope: !46)
!60 = !DILocation(line: 53, column: 1, scope: !16)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_12_good", scope: !17, file: !17, line: 87, type: !18, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 89, column: 5, scope: !61)
!63 = !DILocation(line: 90, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 102, type: !65, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !17, line: 102, type: !7)
!71 = !DILocation(line: 102, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !17, line: 102, type: !67)
!73 = !DILocation(line: 102, column: 27, scope: !64)
!74 = !DILocation(line: 105, column: 22, scope: !64)
!75 = !DILocation(line: 105, column: 12, scope: !64)
!76 = !DILocation(line: 105, column: 5, scope: !64)
!77 = !DILocation(line: 107, column: 5, scope: !64)
!78 = !DILocation(line: 108, column: 5, scope: !64)
!79 = !DILocation(line: 109, column: 5, scope: !64)
!80 = !DILocation(line: 112, column: 5, scope: !64)
!81 = !DILocation(line: 113, column: 5, scope: !64)
!82 = !DILocation(line: 114, column: 5, scope: !64)
!83 = !DILocation(line: 116, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !17, line: 63, type: !4)
!86 = !DILocation(line: 63, column: 15, scope: !84)
!87 = !DILocation(line: 64, column: 23, scope: !84)
!88 = !DILocation(line: 64, column: 12, scope: !84)
!89 = !DILocation(line: 64, column: 10, scope: !84)
!90 = !DILocation(line: 65, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !17, line: 65, column: 9)
!92 = !DILocation(line: 65, column: 14, scope: !91)
!93 = !DILocation(line: 65, column: 9, scope: !84)
!94 = !DILocation(line: 65, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !17, line: 65, column: 23)
!96 = !DILocation(line: 66, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !84, file: !17, line: 66, column: 8)
!98 = !DILocation(line: 66, column: 8, scope: !84)
!99 = !DILocation(line: 69, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !17, line: 67, column: 5)
!101 = !DILocation(line: 69, column: 9, scope: !100)
!102 = !DILocation(line: 70, column: 9, scope: !100)
!103 = !DILocation(line: 70, column: 20, scope: !100)
!104 = !DILocation(line: 71, column: 5, scope: !100)
!105 = !DILocation(line: 75, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !97, file: !17, line: 73, column: 5)
!107 = !DILocation(line: 75, column: 9, scope: !106)
!108 = !DILocation(line: 76, column: 9, scope: !106)
!109 = !DILocation(line: 76, column: 20, scope: !106)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !17, line: 79, type: !47)
!111 = distinct !DILexicalBlock(scope: !84, file: !17, line: 78, column: 5)
!112 = !DILocation(line: 79, column: 17, scope: !111)
!113 = !DILocation(line: 81, column: 18, scope: !111)
!114 = !DILocation(line: 81, column: 31, scope: !111)
!115 = !DILocation(line: 81, column: 24, scope: !111)
!116 = !DILocation(line: 81, column: 45, scope: !111)
!117 = !DILocation(line: 81, column: 9, scope: !111)
!118 = !DILocation(line: 82, column: 20, scope: !111)
!119 = !DILocation(line: 82, column: 9, scope: !111)
!120 = !DILocation(line: 83, column: 14, scope: !111)
!121 = !DILocation(line: 83, column: 9, scope: !111)
!122 = !DILocation(line: 85, column: 1, scope: !84)
