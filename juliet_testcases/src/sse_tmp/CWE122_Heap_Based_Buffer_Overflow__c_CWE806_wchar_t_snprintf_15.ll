; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15_bad() #0 !dbg !16 {
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
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !44
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %7), !dbg !47
  %8 = load i32*, i32** %data, align 8, !dbg !48
  %9 = bitcast i32* %8 to i8*, !dbg !48
  call void @free(i8* %9) #7, !dbg !49
  ret void, !dbg !50
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #7, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #7, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !78
  %0 = bitcast i8* %call to i32*, !dbg !79
  store i32* %0, i32** %data, align 8, !dbg !80
  %1 = load i32*, i32** %data, align 8, !dbg !81
  %cmp = icmp eq i32* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !87
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !88
  %3 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !93
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !96
  %6 = load i32*, i32** %data, align 8, !dbg !97
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !98
  %7 = load i32*, i32** %data, align 8, !dbg !99
  call void @printWLine(i32* %7), !dbg !100
  %8 = load i32*, i32** %data, align 8, !dbg !101
  %9 = bitcast i32* %8 to i8*, !dbg !101
  call void @free(i8* %9) #7, !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !107
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %cmp = icmp eq i32* %1, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !117
  %3 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !122
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !123
  %5 = load i32*, i32** %data, align 8, !dbg !124
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !125
  %6 = load i32*, i32** %data, align 8, !dbg !126
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !127
  %7 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* %7), !dbg !129
  %8 = load i32*, i32** %data, align 8, !dbg !130
  %9 = bitcast i32* %8 to i8*, !dbg !130
  call void @free(i8* %9) #7, !dbg !131
  ret void, !dbg !132
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 38, column: 17, scope: !16)
!32 = !DILocation(line: 38, column: 9, scope: !16)
!33 = !DILocation(line: 39, column: 9, scope: !16)
!34 = !DILocation(line: 39, column: 21, scope: !16)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !17, line: 47, type: !37)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 46, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 47, column: 17, scope: !36)
!41 = !DILocation(line: 49, column: 18, scope: !36)
!42 = !DILocation(line: 49, column: 31, scope: !36)
!43 = !DILocation(line: 49, column: 24, scope: !36)
!44 = !DILocation(line: 49, column: 45, scope: !36)
!45 = !DILocation(line: 49, column: 9, scope: !36)
!46 = !DILocation(line: 50, column: 20, scope: !36)
!47 = !DILocation(line: 50, column: 9, scope: !36)
!48 = !DILocation(line: 51, column: 14, scope: !36)
!49 = !DILocation(line: 51, column: 9, scope: !36)
!50 = !DILocation(line: 53, column: 1, scope: !16)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_15_good", scope: !17, file: !17, line: 113, type: !18, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 115, column: 5, scope: !51)
!53 = !DILocation(line: 116, column: 5, scope: !51)
!54 = !DILocation(line: 117, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 129, type: !56, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !17, line: 129, type: !7)
!62 = !DILocation(line: 129, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !17, line: 129, type: !58)
!64 = !DILocation(line: 129, column: 27, scope: !55)
!65 = !DILocation(line: 132, column: 22, scope: !55)
!66 = !DILocation(line: 132, column: 12, scope: !55)
!67 = !DILocation(line: 132, column: 5, scope: !55)
!68 = !DILocation(line: 134, column: 5, scope: !55)
!69 = !DILocation(line: 135, column: 5, scope: !55)
!70 = !DILocation(line: 136, column: 5, scope: !55)
!71 = !DILocation(line: 139, column: 5, scope: !55)
!72 = !DILocation(line: 140, column: 5, scope: !55)
!73 = !DILocation(line: 141, column: 5, scope: !55)
!74 = !DILocation(line: 143, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 60, type: !18, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !17, line: 62, type: !4)
!77 = !DILocation(line: 62, column: 15, scope: !75)
!78 = !DILocation(line: 63, column: 23, scope: !75)
!79 = !DILocation(line: 63, column: 12, scope: !75)
!80 = !DILocation(line: 63, column: 10, scope: !75)
!81 = !DILocation(line: 64, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !17, line: 64, column: 9)
!83 = !DILocation(line: 64, column: 14, scope: !82)
!84 = !DILocation(line: 64, column: 9, scope: !75)
!85 = !DILocation(line: 64, column: 24, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !17, line: 64, column: 23)
!87 = !DILocation(line: 73, column: 17, scope: !75)
!88 = !DILocation(line: 73, column: 9, scope: !75)
!89 = !DILocation(line: 74, column: 9, scope: !75)
!90 = !DILocation(line: 74, column: 20, scope: !75)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !17, line: 78, type: !37)
!92 = distinct !DILexicalBlock(scope: !75, file: !17, line: 77, column: 5)
!93 = !DILocation(line: 78, column: 17, scope: !92)
!94 = !DILocation(line: 80, column: 18, scope: !92)
!95 = !DILocation(line: 80, column: 31, scope: !92)
!96 = !DILocation(line: 80, column: 24, scope: !92)
!97 = !DILocation(line: 80, column: 45, scope: !92)
!98 = !DILocation(line: 80, column: 9, scope: !92)
!99 = !DILocation(line: 81, column: 20, scope: !92)
!100 = !DILocation(line: 81, column: 9, scope: !92)
!101 = !DILocation(line: 82, column: 14, scope: !92)
!102 = !DILocation(line: 82, column: 9, scope: !92)
!103 = !DILocation(line: 84, column: 1, scope: !75)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 87, type: !18, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !17, line: 89, type: !4)
!106 = !DILocation(line: 89, column: 15, scope: !104)
!107 = !DILocation(line: 90, column: 23, scope: !104)
!108 = !DILocation(line: 90, column: 12, scope: !104)
!109 = !DILocation(line: 90, column: 10, scope: !104)
!110 = !DILocation(line: 91, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !17, line: 91, column: 9)
!112 = !DILocation(line: 91, column: 14, scope: !111)
!113 = !DILocation(line: 91, column: 9, scope: !104)
!114 = !DILocation(line: 91, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 91, column: 23)
!116 = !DILocation(line: 96, column: 17, scope: !104)
!117 = !DILocation(line: 96, column: 9, scope: !104)
!118 = !DILocation(line: 97, column: 9, scope: !104)
!119 = !DILocation(line: 97, column: 20, scope: !104)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !17, line: 105, type: !37)
!121 = distinct !DILexicalBlock(scope: !104, file: !17, line: 104, column: 5)
!122 = !DILocation(line: 105, column: 17, scope: !121)
!123 = !DILocation(line: 107, column: 18, scope: !121)
!124 = !DILocation(line: 107, column: 31, scope: !121)
!125 = !DILocation(line: 107, column: 24, scope: !121)
!126 = !DILocation(line: 107, column: 45, scope: !121)
!127 = !DILocation(line: 107, column: 9, scope: !121)
!128 = !DILocation(line: 108, column: 20, scope: !121)
!129 = !DILocation(line: 108, column: 9, scope: !121)
!130 = !DILocation(line: 109, column: 14, scope: !121)
!131 = !DILocation(line: 109, column: 9, scope: !121)
!132 = !DILocation(line: 111, column: 1, scope: !104)