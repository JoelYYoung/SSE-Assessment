; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #7, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #7, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !76
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !76
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !77
  %2 = load i32*, i32** %data, align 8, !dbg !78
  %3 = load i32*, i32** %data, align 8, !dbg !79
  %call = call i64 @wcslen(i32* %3) #9, !dbg !80
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %2, i64 %call) #7, !dbg !81
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  %4 = load i32*, i32** %data, align 8, !dbg !84
  call void @printWLine(i32* %4), !dbg !85
  %5 = load i32*, i32** %data, align 8, !dbg !86
  %6 = bitcast i32* %5 to i8*, !dbg !86
  call void @free(i8* %6) #7, !dbg !87
  ret void, !dbg !88
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %4 = load i32*, i32** %data, align 8, !dbg !105
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_goodG2BData, align 8, !dbg !106
  call void @goodG2BSink(), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_goodG2BData, align 8, !dbg !112
  store i32* %0, i32** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !115
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !116
  %2 = load i32*, i32** %data, align 8, !dbg !117
  %3 = load i32*, i32** %data, align 8, !dbg !118
  %call = call i64 @wcslen(i32* %3) #9, !dbg !119
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %2, i64 %call) #7, !dbg !120
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %4 = load i32*, i32** %data, align 8, !dbg !123
  call void @printWLine(i32* %4), !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %6 = bitcast i32* %5 to i8*, !dbg !125
  call void @free(i8* %6) #7, !dbg !126
  ret void, !dbg !127
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45.c", directory: "/root/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_bad", scope: !15, file: !15, line: 39, type: !23, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 41, type: !6)
!26 = !DILocation(line: 41, column: 15, scope: !22)
!27 = !DILocation(line: 42, column: 23, scope: !22)
!28 = !DILocation(line: 42, column: 12, scope: !22)
!29 = !DILocation(line: 42, column: 10, scope: !22)
!30 = !DILocation(line: 43, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !15, line: 43, column: 9)
!32 = !DILocation(line: 43, column: 14, scope: !31)
!33 = !DILocation(line: 43, column: 9, scope: !22)
!34 = !DILocation(line: 43, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 43, column: 23)
!36 = !DILocation(line: 45, column: 13, scope: !22)
!37 = !DILocation(line: 45, column: 5, scope: !22)
!38 = !DILocation(line: 46, column: 5, scope: !22)
!39 = !DILocation(line: 46, column: 17, scope: !22)
!40 = !DILocation(line: 47, column: 75, scope: !22)
!41 = !DILocation(line: 47, column: 73, scope: !22)
!42 = !DILocation(line: 48, column: 5, scope: !22)
!43 = !DILocation(line: 49, column: 1, scope: !22)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncpy_45_good", scope: !15, file: !15, line: 81, type: !23, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 83, column: 5, scope: !44)
!46 = !DILocation(line: 84, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 95, type: !48, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!9, !9, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 95, type: !9)
!54 = !DILocation(line: 95, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 95, type: !50)
!56 = !DILocation(line: 95, column: 27, scope: !47)
!57 = !DILocation(line: 98, column: 22, scope: !47)
!58 = !DILocation(line: 98, column: 12, scope: !47)
!59 = !DILocation(line: 98, column: 5, scope: !47)
!60 = !DILocation(line: 100, column: 5, scope: !47)
!61 = !DILocation(line: 101, column: 5, scope: !47)
!62 = !DILocation(line: 102, column: 5, scope: !47)
!63 = !DILocation(line: 105, column: 5, scope: !47)
!64 = !DILocation(line: 106, column: 5, scope: !47)
!65 = !DILocation(line: 107, column: 5, scope: !47)
!66 = !DILocation(line: 109, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !15, line: 28, type: !6)
!69 = !DILocation(line: 28, column: 15, scope: !67)
!70 = !DILocation(line: 28, column: 22, scope: !67)
!71 = !DILocalVariable(name: "dest", scope: !72, file: !15, line: 30, type: !73)
!72 = distinct !DILexicalBlock(scope: !67, file: !15, line: 29, column: 5)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 50)
!76 = !DILocation(line: 30, column: 17, scope: !72)
!77 = !DILocation(line: 32, column: 17, scope: !72)
!78 = !DILocation(line: 32, column: 23, scope: !72)
!79 = !DILocation(line: 32, column: 36, scope: !72)
!80 = !DILocation(line: 32, column: 29, scope: !72)
!81 = !DILocation(line: 32, column: 9, scope: !72)
!82 = !DILocation(line: 33, column: 9, scope: !72)
!83 = !DILocation(line: 33, column: 20, scope: !72)
!84 = !DILocation(line: 34, column: 20, scope: !72)
!85 = !DILocation(line: 34, column: 9, scope: !72)
!86 = !DILocation(line: 35, column: 14, scope: !72)
!87 = !DILocation(line: 35, column: 9, scope: !72)
!88 = !DILocation(line: 37, column: 1, scope: !67)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 69, type: !23, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocalVariable(name: "data", scope: !89, file: !15, line: 71, type: !6)
!91 = !DILocation(line: 71, column: 15, scope: !89)
!92 = !DILocation(line: 72, column: 23, scope: !89)
!93 = !DILocation(line: 72, column: 12, scope: !89)
!94 = !DILocation(line: 72, column: 10, scope: !89)
!95 = !DILocation(line: 73, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !15, line: 73, column: 9)
!97 = !DILocation(line: 73, column: 14, scope: !96)
!98 = !DILocation(line: 73, column: 9, scope: !89)
!99 = !DILocation(line: 73, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 73, column: 23)
!101 = !DILocation(line: 75, column: 13, scope: !89)
!102 = !DILocation(line: 75, column: 5, scope: !89)
!103 = !DILocation(line: 76, column: 5, scope: !89)
!104 = !DILocation(line: 76, column: 16, scope: !89)
!105 = !DILocation(line: 77, column: 79, scope: !89)
!106 = !DILocation(line: 77, column: 77, scope: !89)
!107 = !DILocation(line: 78, column: 5, scope: !89)
!108 = !DILocation(line: 79, column: 1, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 56, type: !23, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 58, type: !6)
!111 = !DILocation(line: 58, column: 15, scope: !109)
!112 = !DILocation(line: 58, column: 22, scope: !109)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !15, line: 60, type: !73)
!114 = distinct !DILexicalBlock(scope: !109, file: !15, line: 59, column: 5)
!115 = !DILocation(line: 60, column: 17, scope: !114)
!116 = !DILocation(line: 62, column: 17, scope: !114)
!117 = !DILocation(line: 62, column: 23, scope: !114)
!118 = !DILocation(line: 62, column: 36, scope: !114)
!119 = !DILocation(line: 62, column: 29, scope: !114)
!120 = !DILocation(line: 62, column: 9, scope: !114)
!121 = !DILocation(line: 63, column: 9, scope: !114)
!122 = !DILocation(line: 63, column: 20, scope: !114)
!123 = !DILocation(line: 64, column: 20, scope: !114)
!124 = !DILocation(line: 64, column: 9, scope: !114)
!125 = !DILocation(line: 65, column: 14, scope: !114)
!126 = !DILocation(line: 65, column: 9, scope: !114)
!127 = !DILocation(line: 67, column: 1, scope: !109)
