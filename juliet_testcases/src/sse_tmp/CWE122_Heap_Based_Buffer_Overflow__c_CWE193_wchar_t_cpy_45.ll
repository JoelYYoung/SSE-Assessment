; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_goodG2BData = internal global i32* null, align 8, !dbg !13
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_badData, align 8, !dbg !67
  store i32* %0, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !68, metadata !DIExpression()), !dbg !73
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !73
  %2 = load i32*, i32** %data, align 8, !dbg !74
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !75
  %call = call i32* @wcscpy(i32* %2, i32* %arraydecay) #6, !dbg !76
  %3 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %3), !dbg !78
  %4 = load i32*, i32** %data, align 8, !dbg !79
  %5 = bitcast i32* %4 to i8*, !dbg !79
  call void @free(i8* %5) #6, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !95
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_goodG2BData, align 8, !dbg !96
  call void @goodG2BSink(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_goodG2BData, align 8, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !105
  %2 = load i32*, i32** %data, align 8, !dbg !106
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !107
  %call = call i32* @wcscpy(i32* %2, i32* %arraydecay) #6, !dbg !108
  %3 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* %3), !dbg !110
  %4 = load i32*, i32** %data, align 8, !dbg !111
  %5 = bitcast i32* %4 to i8*, !dbg !111
  call void @free(i8* %5) #6, !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_badData", scope: !2, file: !15, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_goodG2BData", scope: !2, file: !15, line: 27, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_bad", scope: !15, file: !15, line: 43, type: !23, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 45, type: !6)
!26 = !DILocation(line: 45, column: 15, scope: !22)
!27 = !DILocation(line: 46, column: 10, scope: !22)
!28 = !DILocation(line: 48, column: 23, scope: !22)
!29 = !DILocation(line: 48, column: 12, scope: !22)
!30 = !DILocation(line: 48, column: 10, scope: !22)
!31 = !DILocation(line: 49, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !15, line: 49, column: 9)
!33 = !DILocation(line: 49, column: 14, scope: !32)
!34 = !DILocation(line: 49, column: 9, scope: !22)
!35 = !DILocation(line: 49, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 49, column: 23)
!37 = !DILocation(line: 50, column: 74, scope: !22)
!38 = !DILocation(line: 50, column: 72, scope: !22)
!39 = !DILocation(line: 51, column: 5, scope: !22)
!40 = !DILocation(line: 52, column: 1, scope: !22)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_45_good", scope: !15, file: !15, line: 82, type: !23, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 84, column: 5, scope: !41)
!43 = !DILocation(line: 85, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !45, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!9, !9, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !15, line: 96, type: !9)
!51 = !DILocation(line: 96, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !15, line: 96, type: !47)
!53 = !DILocation(line: 96, column: 27, scope: !44)
!54 = !DILocation(line: 99, column: 22, scope: !44)
!55 = !DILocation(line: 99, column: 12, scope: !44)
!56 = !DILocation(line: 99, column: 5, scope: !44)
!57 = !DILocation(line: 101, column: 5, scope: !44)
!58 = !DILocation(line: 102, column: 5, scope: !44)
!59 = !DILocation(line: 103, column: 5, scope: !44)
!60 = !DILocation(line: 106, column: 5, scope: !44)
!61 = !DILocation(line: 107, column: 5, scope: !44)
!62 = !DILocation(line: 108, column: 5, scope: !44)
!63 = !DILocation(line: 110, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 31, type: !23, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !15, line: 33, type: !6)
!66 = !DILocation(line: 33, column: 15, scope: !64)
!67 = !DILocation(line: 33, column: 22, scope: !64)
!68 = !DILocalVariable(name: "source", scope: !69, file: !15, line: 35, type: !70)
!69 = distinct !DILexicalBlock(scope: !64, file: !15, line: 34, column: 5)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 11)
!73 = !DILocation(line: 35, column: 17, scope: !69)
!74 = !DILocation(line: 37, column: 16, scope: !69)
!75 = !DILocation(line: 37, column: 22, scope: !69)
!76 = !DILocation(line: 37, column: 9, scope: !69)
!77 = !DILocation(line: 38, column: 20, scope: !69)
!78 = !DILocation(line: 38, column: 9, scope: !69)
!79 = !DILocation(line: 39, column: 14, scope: !69)
!80 = !DILocation(line: 39, column: 9, scope: !69)
!81 = !DILocation(line: 41, column: 1, scope: !64)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 71, type: !23, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 73, type: !6)
!84 = !DILocation(line: 73, column: 15, scope: !82)
!85 = !DILocation(line: 74, column: 10, scope: !82)
!86 = !DILocation(line: 76, column: 23, scope: !82)
!87 = !DILocation(line: 76, column: 12, scope: !82)
!88 = !DILocation(line: 76, column: 10, scope: !82)
!89 = !DILocation(line: 77, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !15, line: 77, column: 9)
!91 = !DILocation(line: 77, column: 14, scope: !90)
!92 = !DILocation(line: 77, column: 9, scope: !82)
!93 = !DILocation(line: 77, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 77, column: 23)
!95 = !DILocation(line: 78, column: 78, scope: !82)
!96 = !DILocation(line: 78, column: 76, scope: !82)
!97 = !DILocation(line: 79, column: 5, scope: !82)
!98 = !DILocation(line: 80, column: 1, scope: !82)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 59, type: !23, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 61, type: !6)
!101 = !DILocation(line: 61, column: 15, scope: !99)
!102 = !DILocation(line: 61, column: 22, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !15, line: 63, type: !70)
!104 = distinct !DILexicalBlock(scope: !99, file: !15, line: 62, column: 5)
!105 = !DILocation(line: 63, column: 17, scope: !104)
!106 = !DILocation(line: 65, column: 16, scope: !104)
!107 = !DILocation(line: 65, column: 22, scope: !104)
!108 = !DILocation(line: 65, column: 9, scope: !104)
!109 = !DILocation(line: 66, column: 20, scope: !104)
!110 = !DILocation(line: 66, column: 9, scope: !104)
!111 = !DILocation(line: 67, column: 14, scope: !104)
!112 = !DILocation(line: 67, column: 9, scope: !104)
!113 = !DILocation(line: 69, column: 1, scope: !99)
