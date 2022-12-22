; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_goodG2BData = internal global i32* null, align 8, !dbg !13
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_badData, align 8, !dbg !38
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_good() #0 !dbg !41 {
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
  %call = call i64 @time(i64* null) #7, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #7, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_bad(), !dbg !61
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
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_badData, align 8, !dbg !67
  store i32* %0, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !68, metadata !DIExpression()), !dbg !73
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !73
  %2 = load i32*, i32** %data, align 8, !dbg !74
  %3 = bitcast i32* %2 to i8*, !dbg !75
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !75
  %4 = bitcast i32* %arraydecay to i8*, !dbg !75
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !76
  %call = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !77
  %add = add i64 %call, 1, !dbg !78
  %mul = mul i64 %add, 4, !dbg !79
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !75
  %5 = load i32*, i32** %data, align 8, !dbg !80
  call void @printWLine(i32* %5), !dbg !81
  %6 = load i32*, i32** %data, align 8, !dbg !82
  %7 = bitcast i32* %6 to i8*, !dbg !82
  call void @free(i8* %7) #7, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !98
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_goodG2BData, align 8, !dbg !99
  call void @goodG2BSink(), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_goodG2BData, align 8, !dbg !105
  store i32* %0, i32** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !108
  %2 = load i32*, i32** %data, align 8, !dbg !109
  %3 = bitcast i32* %2 to i8*, !dbg !110
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !110
  %4 = bitcast i32* %arraydecay to i8*, !dbg !110
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !111
  %call = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !112
  %add = add i64 %call, 1, !dbg !113
  %mul = mul i64 %add, 4, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !110
  %5 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %5), !dbg !116
  %6 = load i32*, i32** %data, align 8, !dbg !117
  %7 = bitcast i32* %6 to i8*, !dbg !117
  call void @free(i8* %7) #7, !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_badData", scope: !2, file: !15, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_goodG2BData", scope: !2, file: !15, line: 27, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45.c", directory: "/root/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_bad", scope: !15, file: !15, line: 44, type: !23, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 46, type: !6)
!26 = !DILocation(line: 46, column: 15, scope: !22)
!27 = !DILocation(line: 47, column: 10, scope: !22)
!28 = !DILocation(line: 49, column: 23, scope: !22)
!29 = !DILocation(line: 49, column: 12, scope: !22)
!30 = !DILocation(line: 49, column: 10, scope: !22)
!31 = !DILocation(line: 50, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !15, line: 50, column: 9)
!33 = !DILocation(line: 50, column: 14, scope: !32)
!34 = !DILocation(line: 50, column: 9, scope: !22)
!35 = !DILocation(line: 50, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 50, column: 23)
!37 = !DILocation(line: 51, column: 77, scope: !22)
!38 = !DILocation(line: 51, column: 75, scope: !22)
!39 = !DILocation(line: 52, column: 5, scope: !22)
!40 = !DILocation(line: 53, column: 1, scope: !22)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_45_good", scope: !15, file: !15, line: 84, type: !23, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 86, column: 5, scope: !41)
!43 = !DILocation(line: 87, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 98, type: !45, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!9, !9, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !15, line: 98, type: !9)
!51 = !DILocation(line: 98, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !15, line: 98, type: !47)
!53 = !DILocation(line: 98, column: 27, scope: !44)
!54 = !DILocation(line: 101, column: 22, scope: !44)
!55 = !DILocation(line: 101, column: 12, scope: !44)
!56 = !DILocation(line: 101, column: 5, scope: !44)
!57 = !DILocation(line: 103, column: 5, scope: !44)
!58 = !DILocation(line: 104, column: 5, scope: !44)
!59 = !DILocation(line: 105, column: 5, scope: !44)
!60 = !DILocation(line: 108, column: 5, scope: !44)
!61 = !DILocation(line: 109, column: 5, scope: !44)
!62 = !DILocation(line: 110, column: 5, scope: !44)
!63 = !DILocation(line: 112, column: 5, scope: !44)
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
!74 = !DILocation(line: 38, column: 16, scope: !69)
!75 = !DILocation(line: 38, column: 9, scope: !69)
!76 = !DILocation(line: 38, column: 38, scope: !69)
!77 = !DILocation(line: 38, column: 31, scope: !69)
!78 = !DILocation(line: 38, column: 46, scope: !69)
!79 = !DILocation(line: 38, column: 51, scope: !69)
!80 = !DILocation(line: 39, column: 20, scope: !69)
!81 = !DILocation(line: 39, column: 9, scope: !69)
!82 = !DILocation(line: 40, column: 14, scope: !69)
!83 = !DILocation(line: 40, column: 9, scope: !69)
!84 = !DILocation(line: 42, column: 1, scope: !64)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 73, type: !23, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 75, type: !6)
!87 = !DILocation(line: 75, column: 15, scope: !85)
!88 = !DILocation(line: 76, column: 10, scope: !85)
!89 = !DILocation(line: 78, column: 23, scope: !85)
!90 = !DILocation(line: 78, column: 12, scope: !85)
!91 = !DILocation(line: 78, column: 10, scope: !85)
!92 = !DILocation(line: 79, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !85, file: !15, line: 79, column: 9)
!94 = !DILocation(line: 79, column: 14, scope: !93)
!95 = !DILocation(line: 79, column: 9, scope: !85)
!96 = !DILocation(line: 79, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 79, column: 23)
!98 = !DILocation(line: 80, column: 81, scope: !85)
!99 = !DILocation(line: 80, column: 79, scope: !85)
!100 = !DILocation(line: 81, column: 5, scope: !85)
!101 = !DILocation(line: 82, column: 1, scope: !85)
!102 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 60, type: !23, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !15, line: 62, type: !6)
!104 = !DILocation(line: 62, column: 15, scope: !102)
!105 = !DILocation(line: 62, column: 22, scope: !102)
!106 = !DILocalVariable(name: "source", scope: !107, file: !15, line: 64, type: !70)
!107 = distinct !DILexicalBlock(scope: !102, file: !15, line: 63, column: 5)
!108 = !DILocation(line: 64, column: 17, scope: !107)
!109 = !DILocation(line: 67, column: 16, scope: !107)
!110 = !DILocation(line: 67, column: 9, scope: !107)
!111 = !DILocation(line: 67, column: 38, scope: !107)
!112 = !DILocation(line: 67, column: 31, scope: !107)
!113 = !DILocation(line: 67, column: 46, scope: !107)
!114 = !DILocation(line: 67, column: 51, scope: !107)
!115 = !DILocation(line: 68, column: 20, scope: !107)
!116 = !DILocation(line: 68, column: 9, scope: !107)
!117 = !DILocation(line: 69, column: 14, scope: !107)
!118 = !DILocation(line: 69, column: 9, scope: !107)
!119 = !DILocation(line: 71, column: 1, scope: !102)
