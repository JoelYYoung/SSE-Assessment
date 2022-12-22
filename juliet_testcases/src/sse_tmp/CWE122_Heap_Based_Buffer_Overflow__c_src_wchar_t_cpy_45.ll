; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_badData, align 8, !dbg !41
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_good() #0 !dbg !44 {
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
  %call = call i64 @time(i64* null) #6, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #6, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_bad(), !dbg !64
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
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !76
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !76
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !77
  %2 = load i32*, i32** %data, align 8, !dbg !78
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %2) #6, !dbg !79
  %3 = load i32*, i32** %data, align 8, !dbg !80
  call void @printWLine(i32* %3), !dbg !81
  %4 = load i32*, i32** %data, align 8, !dbg !82
  %5 = bitcast i32* %4 to i8*, !dbg !82
  call void @free(i8* %5) #6, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !88
  %0 = bitcast i8* %call to i32*, !dbg !89
  store i32* %0, i32** %data, align 8, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %cmp = icmp eq i32* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !98
  %3 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %4 = load i32*, i32** %data, align 8, !dbg !101
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_goodG2BData, align 8, !dbg !102
  call void @goodG2BSink(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_goodG2BData, align 8, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !111
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !112
  %2 = load i32*, i32** %data, align 8, !dbg !113
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %2) #6, !dbg !114
  %3 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %3), !dbg !116
  %4 = load i32*, i32** %data, align 8, !dbg !117
  %5 = bitcast i32* %4 to i8*, !dbg !117
  call void @free(i8* %5) #6, !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45.c", directory: "/root/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_bad", scope: !15, file: !15, line: 38, type: !23, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 40, type: !6)
!26 = !DILocation(line: 40, column: 15, scope: !22)
!27 = !DILocation(line: 41, column: 23, scope: !22)
!28 = !DILocation(line: 41, column: 12, scope: !22)
!29 = !DILocation(line: 41, column: 10, scope: !22)
!30 = !DILocation(line: 42, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 9)
!32 = !DILocation(line: 42, column: 14, scope: !31)
!33 = !DILocation(line: 42, column: 9, scope: !22)
!34 = !DILocation(line: 42, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 42, column: 23)
!36 = !DILocation(line: 44, column: 13, scope: !22)
!37 = !DILocation(line: 44, column: 5, scope: !22)
!38 = !DILocation(line: 45, column: 5, scope: !22)
!39 = !DILocation(line: 45, column: 17, scope: !22)
!40 = !DILocation(line: 46, column: 71, scope: !22)
!41 = !DILocation(line: 46, column: 69, scope: !22)
!42 = !DILocation(line: 47, column: 5, scope: !22)
!43 = !DILocation(line: 48, column: 1, scope: !22)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_good", scope: !15, file: !15, line: 79, type: !23, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 81, column: 5, scope: !44)
!46 = !DILocation(line: 82, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 93, type: !48, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!9, !9, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 93, type: !9)
!54 = !DILocation(line: 93, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 93, type: !50)
!56 = !DILocation(line: 93, column: 27, scope: !47)
!57 = !DILocation(line: 96, column: 22, scope: !47)
!58 = !DILocation(line: 96, column: 12, scope: !47)
!59 = !DILocation(line: 96, column: 5, scope: !47)
!60 = !DILocation(line: 98, column: 5, scope: !47)
!61 = !DILocation(line: 99, column: 5, scope: !47)
!62 = !DILocation(line: 100, column: 5, scope: !47)
!63 = !DILocation(line: 103, column: 5, scope: !47)
!64 = !DILocation(line: 104, column: 5, scope: !47)
!65 = !DILocation(line: 105, column: 5, scope: !47)
!66 = !DILocation(line: 107, column: 5, scope: !47)
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
!77 = !DILocation(line: 32, column: 16, scope: !72)
!78 = !DILocation(line: 32, column: 22, scope: !72)
!79 = !DILocation(line: 32, column: 9, scope: !72)
!80 = !DILocation(line: 33, column: 20, scope: !72)
!81 = !DILocation(line: 33, column: 9, scope: !72)
!82 = !DILocation(line: 34, column: 14, scope: !72)
!83 = !DILocation(line: 34, column: 9, scope: !72)
!84 = !DILocation(line: 36, column: 1, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !23, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 69, type: !6)
!87 = !DILocation(line: 69, column: 15, scope: !85)
!88 = !DILocation(line: 70, column: 23, scope: !85)
!89 = !DILocation(line: 70, column: 12, scope: !85)
!90 = !DILocation(line: 70, column: 10, scope: !85)
!91 = !DILocation(line: 71, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !15, line: 71, column: 9)
!93 = !DILocation(line: 71, column: 14, scope: !92)
!94 = !DILocation(line: 71, column: 9, scope: !85)
!95 = !DILocation(line: 71, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 71, column: 23)
!97 = !DILocation(line: 73, column: 13, scope: !85)
!98 = !DILocation(line: 73, column: 5, scope: !85)
!99 = !DILocation(line: 74, column: 5, scope: !85)
!100 = !DILocation(line: 74, column: 16, scope: !85)
!101 = !DILocation(line: 75, column: 75, scope: !85)
!102 = !DILocation(line: 75, column: 73, scope: !85)
!103 = !DILocation(line: 76, column: 5, scope: !85)
!104 = !DILocation(line: 77, column: 1, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 55, type: !23, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 57, type: !6)
!107 = !DILocation(line: 57, column: 15, scope: !105)
!108 = !DILocation(line: 57, column: 22, scope: !105)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !15, line: 59, type: !73)
!110 = distinct !DILexicalBlock(scope: !105, file: !15, line: 58, column: 5)
!111 = !DILocation(line: 59, column: 17, scope: !110)
!112 = !DILocation(line: 61, column: 16, scope: !110)
!113 = !DILocation(line: 61, column: 22, scope: !110)
!114 = !DILocation(line: 61, column: 9, scope: !110)
!115 = !DILocation(line: 62, column: 20, scope: !110)
!116 = !DILocation(line: 62, column: 9, scope: !110)
!117 = !DILocation(line: 63, column: 14, scope: !110)
!118 = !DILocation(line: 63, column: 9, scope: !110)
!119 = !DILocation(line: 65, column: 1, scope: !105)
