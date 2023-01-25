; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end2, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !33
  store i32* %1, i32** %data, align 8, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %cmp = icmp eq i32* %2, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !41

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05_bad.source to i8*), i64 44, i1 false), !dbg !47
  %4 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call3 = call i32* @wcscpy(i32* %4, i32* %arraydecay) #6, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %5), !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %7 = bitcast i32* %6 to i8*, !dbg !53
  call void @free(i8* %7) #6, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i32* null, i32** %data, align 8, !dbg !83
  %0 = load i32, i32* @staticFalse, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end2, !dbg !89

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !90
  %1 = bitcast i8* %call to i32*, !dbg !92
  store i32* %1, i32** %data, align 8, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %cmp = icmp eq i32* %2, null, !dbg !96
  br i1 %cmp, label %if.then1, label %if.end, !dbg !97

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !102
  %4 = load i32*, i32** %data, align 8, !dbg !103
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !104
  %call3 = call i32* @wcscpy(i32* %4, i32* %arraydecay) #6, !dbg !105
  %5 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %5), !dbg !107
  %6 = load i32*, i32** %data, align 8, !dbg !108
  %7 = bitcast i32* %6 to i8*, !dbg !108
  call void @free(i8* %7) #6, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i32* null, i32** %data, align 8, !dbg !114
  %0 = load i32, i32* @staticTrue, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end2, !dbg !117

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !118
  %1 = bitcast i8* %call to i32*, !dbg !120
  store i32* %1, i32** %data, align 8, !dbg !121
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %cmp = icmp eq i32* %2, null, !dbg !124
  br i1 %cmp, label %if.then1, label %if.end, !dbg !125

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !128

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !131
  %4 = load i32*, i32** %data, align 8, !dbg !132
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !133
  %call3 = call i32* @wcscpy(i32* %4, i32* %arraydecay) #6, !dbg !134
  %5 = load i32*, i32** %data, align 8, !dbg !135
  call void @printWLine(i32* %5), !dbg !136
  %6 = load i32*, i32** %data, align 8, !dbg !137
  %7 = bitcast i32* %6 to i8*, !dbg !137
  call void @free(i8* %7) #6, !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 31, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05_bad", scope: !15, file: !15, line: 35, type: !23, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 37, type: !6)
!26 = !DILocation(line: 37, column: 15, scope: !22)
!27 = !DILocation(line: 38, column: 10, scope: !22)
!28 = !DILocation(line: 39, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 39, column: 8)
!30 = !DILocation(line: 39, column: 8, scope: !22)
!31 = !DILocation(line: 42, column: 27, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 40, column: 5)
!33 = !DILocation(line: 42, column: 16, scope: !32)
!34 = !DILocation(line: 42, column: 14, scope: !32)
!35 = !DILocation(line: 43, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 43, column: 13)
!37 = !DILocation(line: 43, column: 18, scope: !36)
!38 = !DILocation(line: 43, column: 13, scope: !32)
!39 = !DILocation(line: 43, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 43, column: 27)
!41 = !DILocation(line: 44, column: 5, scope: !32)
!42 = !DILocalVariable(name: "source", scope: !43, file: !15, line: 46, type: !44)
!43 = distinct !DILexicalBlock(scope: !22, file: !15, line: 45, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 11)
!47 = !DILocation(line: 46, column: 17, scope: !43)
!48 = !DILocation(line: 48, column: 16, scope: !43)
!49 = !DILocation(line: 48, column: 22, scope: !43)
!50 = !DILocation(line: 48, column: 9, scope: !43)
!51 = !DILocation(line: 49, column: 20, scope: !43)
!52 = !DILocation(line: 49, column: 9, scope: !43)
!53 = !DILocation(line: 50, column: 14, scope: !43)
!54 = !DILocation(line: 50, column: 9, scope: !43)
!55 = !DILocation(line: 52, column: 1, scope: !22)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_05_good", scope: !15, file: !15, line: 103, type: !23, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 105, column: 5, scope: !56)
!58 = !DILocation(line: 106, column: 5, scope: !56)
!59 = !DILocation(line: 107, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 119, type: !61, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!9, !9, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 119, type: !9)
!67 = !DILocation(line: 119, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 119, type: !63)
!69 = !DILocation(line: 119, column: 27, scope: !60)
!70 = !DILocation(line: 122, column: 22, scope: !60)
!71 = !DILocation(line: 122, column: 12, scope: !60)
!72 = !DILocation(line: 122, column: 5, scope: !60)
!73 = !DILocation(line: 124, column: 5, scope: !60)
!74 = !DILocation(line: 125, column: 5, scope: !60)
!75 = !DILocation(line: 126, column: 5, scope: !60)
!76 = !DILocation(line: 129, column: 5, scope: !60)
!77 = !DILocation(line: 130, column: 5, scope: !60)
!78 = !DILocation(line: 131, column: 5, scope: !60)
!79 = !DILocation(line: 133, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 59, type: !23, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 61, type: !6)
!82 = !DILocation(line: 61, column: 15, scope: !80)
!83 = !DILocation(line: 62, column: 10, scope: !80)
!84 = !DILocation(line: 63, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !15, line: 63, column: 8)
!86 = !DILocation(line: 63, column: 8, scope: !80)
!87 = !DILocation(line: 66, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !15, line: 64, column: 5)
!89 = !DILocation(line: 67, column: 5, scope: !88)
!90 = !DILocation(line: 71, column: 27, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !15, line: 69, column: 5)
!92 = !DILocation(line: 71, column: 16, scope: !91)
!93 = !DILocation(line: 71, column: 14, scope: !91)
!94 = !DILocation(line: 72, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 72, column: 13)
!96 = !DILocation(line: 72, column: 18, scope: !95)
!97 = !DILocation(line: 72, column: 13, scope: !91)
!98 = !DILocation(line: 72, column: 28, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 72, column: 27)
!100 = !DILocalVariable(name: "source", scope: !101, file: !15, line: 75, type: !44)
!101 = distinct !DILexicalBlock(scope: !80, file: !15, line: 74, column: 5)
!102 = !DILocation(line: 75, column: 17, scope: !101)
!103 = !DILocation(line: 77, column: 16, scope: !101)
!104 = !DILocation(line: 77, column: 22, scope: !101)
!105 = !DILocation(line: 77, column: 9, scope: !101)
!106 = !DILocation(line: 78, column: 20, scope: !101)
!107 = !DILocation(line: 78, column: 9, scope: !101)
!108 = !DILocation(line: 79, column: 14, scope: !101)
!109 = !DILocation(line: 79, column: 9, scope: !101)
!110 = !DILocation(line: 81, column: 1, scope: !80)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 84, type: !23, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 86, type: !6)
!113 = !DILocation(line: 86, column: 15, scope: !111)
!114 = !DILocation(line: 87, column: 10, scope: !111)
!115 = !DILocation(line: 88, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !15, line: 88, column: 8)
!117 = !DILocation(line: 88, column: 8, scope: !111)
!118 = !DILocation(line: 91, column: 27, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !15, line: 89, column: 5)
!120 = !DILocation(line: 91, column: 16, scope: !119)
!121 = !DILocation(line: 91, column: 14, scope: !119)
!122 = !DILocation(line: 92, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 92, column: 13)
!124 = !DILocation(line: 92, column: 18, scope: !123)
!125 = !DILocation(line: 92, column: 13, scope: !119)
!126 = !DILocation(line: 92, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 92, column: 27)
!128 = !DILocation(line: 93, column: 5, scope: !119)
!129 = !DILocalVariable(name: "source", scope: !130, file: !15, line: 95, type: !44)
!130 = distinct !DILexicalBlock(scope: !111, file: !15, line: 94, column: 5)
!131 = !DILocation(line: 95, column: 17, scope: !130)
!132 = !DILocation(line: 97, column: 16, scope: !130)
!133 = !DILocation(line: 97, column: 22, scope: !130)
!134 = !DILocation(line: 97, column: 9, scope: !130)
!135 = !DILocation(line: 98, column: 20, scope: !130)
!136 = !DILocation(line: 98, column: 9, scope: !130)
!137 = !DILocation(line: 99, column: 14, scope: !130)
!138 = !DILocation(line: 99, column: 9, scope: !130)
!139 = !DILocation(line: 101, column: 1, scope: !111)
