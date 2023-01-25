; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04_bad.source to i8*), i64 44, i1 false), !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !41
  %call1 = call i32* @wcscpy(i32* %3, i32* %arraydecay) #6, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* %4), !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %6 = bitcast i32* %5 to i8*, !dbg !45
  call void @free(i8* %6) #6, !dbg !46
  ret void, !dbg !47
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #6, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #6, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32* null, i32** %data, align 8, !dbg !75
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !76
  %0 = bitcast i8* %call to i32*, !dbg !79
  store i32* %0, i32** %data, align 8, !dbg !80
  %1 = load i32*, i32** %data, align 8, !dbg !81
  %cmp = icmp eq i32* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !89
  %3 = load i32*, i32** %data, align 8, !dbg !90
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !91
  %call1 = call i32* @wcscpy(i32* %3, i32* %arraydecay) #6, !dbg !92
  %4 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* %4), !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  %6 = bitcast i32* %5 to i8*, !dbg !95
  call void @free(i8* %6) #6, !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32* null, i32** %data, align 8, !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !102
  %0 = bitcast i8* %call to i32*, !dbg !105
  store i32* %0, i32** %data, align 8, !dbg !106
  %1 = load i32*, i32** %data, align 8, !dbg !107
  %cmp = icmp eq i32* %1, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !115
  %3 = load i32*, i32** %data, align 8, !dbg !116
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !117
  %call1 = call i32* @wcscpy(i32* %3, i32* %arraydecay) #6, !dbg !118
  %4 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* %4), !dbg !120
  %5 = load i32*, i32** %data, align 8, !dbg !121
  %6 = bitcast i32* %5 to i8*, !dbg !121
  call void @free(i8* %6) #6, !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04_bad", scope: !17, file: !17, line: 35, type: !18, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 37, type: !4)
!21 = !DILocation(line: 37, column: 15, scope: !16)
!22 = !DILocation(line: 38, column: 10, scope: !16)
!23 = !DILocation(line: 42, column: 27, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 40, column: 5)
!25 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 8)
!26 = !DILocation(line: 42, column: 16, scope: !24)
!27 = !DILocation(line: 42, column: 14, scope: !24)
!28 = !DILocation(line: 43, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 43, column: 13)
!30 = !DILocation(line: 43, column: 18, scope: !29)
!31 = !DILocation(line: 43, column: 13, scope: !24)
!32 = !DILocation(line: 43, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 43, column: 27)
!34 = !DILocalVariable(name: "source", scope: !35, file: !17, line: 46, type: !36)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 45, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 46, column: 17, scope: !35)
!40 = !DILocation(line: 48, column: 16, scope: !35)
!41 = !DILocation(line: 48, column: 22, scope: !35)
!42 = !DILocation(line: 48, column: 9, scope: !35)
!43 = !DILocation(line: 49, column: 20, scope: !35)
!44 = !DILocation(line: 49, column: 9, scope: !35)
!45 = !DILocation(line: 50, column: 14, scope: !35)
!46 = !DILocation(line: 50, column: 9, scope: !35)
!47 = !DILocation(line: 52, column: 1, scope: !16)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_04_good", scope: !17, file: !17, line: 103, type: !18, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 105, column: 5, scope: !48)
!50 = !DILocation(line: 106, column: 5, scope: !48)
!51 = !DILocation(line: 107, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 119, type: !53, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !17, line: 119, type: !7)
!59 = !DILocation(line: 119, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !17, line: 119, type: !55)
!61 = !DILocation(line: 119, column: 27, scope: !52)
!62 = !DILocation(line: 122, column: 22, scope: !52)
!63 = !DILocation(line: 122, column: 12, scope: !52)
!64 = !DILocation(line: 122, column: 5, scope: !52)
!65 = !DILocation(line: 124, column: 5, scope: !52)
!66 = !DILocation(line: 125, column: 5, scope: !52)
!67 = !DILocation(line: 126, column: 5, scope: !52)
!68 = !DILocation(line: 129, column: 5, scope: !52)
!69 = !DILocation(line: 130, column: 5, scope: !52)
!70 = !DILocation(line: 131, column: 5, scope: !52)
!71 = !DILocation(line: 133, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !17, line: 61, type: !4)
!74 = !DILocation(line: 61, column: 15, scope: !72)
!75 = !DILocation(line: 62, column: 10, scope: !72)
!76 = !DILocation(line: 71, column: 27, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !17, line: 69, column: 5)
!78 = distinct !DILexicalBlock(scope: !72, file: !17, line: 63, column: 8)
!79 = !DILocation(line: 71, column: 16, scope: !77)
!80 = !DILocation(line: 71, column: 14, scope: !77)
!81 = !DILocation(line: 72, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !17, line: 72, column: 13)
!83 = !DILocation(line: 72, column: 18, scope: !82)
!84 = !DILocation(line: 72, column: 13, scope: !77)
!85 = !DILocation(line: 72, column: 28, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !17, line: 72, column: 27)
!87 = !DILocalVariable(name: "source", scope: !88, file: !17, line: 75, type: !36)
!88 = distinct !DILexicalBlock(scope: !72, file: !17, line: 74, column: 5)
!89 = !DILocation(line: 75, column: 17, scope: !88)
!90 = !DILocation(line: 77, column: 16, scope: !88)
!91 = !DILocation(line: 77, column: 22, scope: !88)
!92 = !DILocation(line: 77, column: 9, scope: !88)
!93 = !DILocation(line: 78, column: 20, scope: !88)
!94 = !DILocation(line: 78, column: 9, scope: !88)
!95 = !DILocation(line: 79, column: 14, scope: !88)
!96 = !DILocation(line: 79, column: 9, scope: !88)
!97 = !DILocation(line: 81, column: 1, scope: !72)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !17, line: 86, type: !4)
!100 = !DILocation(line: 86, column: 15, scope: !98)
!101 = !DILocation(line: 87, column: 10, scope: !98)
!102 = !DILocation(line: 91, column: 27, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !17, line: 89, column: 5)
!104 = distinct !DILexicalBlock(scope: !98, file: !17, line: 88, column: 8)
!105 = !DILocation(line: 91, column: 16, scope: !103)
!106 = !DILocation(line: 91, column: 14, scope: !103)
!107 = !DILocation(line: 92, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !17, line: 92, column: 13)
!109 = !DILocation(line: 92, column: 18, scope: !108)
!110 = !DILocation(line: 92, column: 13, scope: !103)
!111 = !DILocation(line: 92, column: 28, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !17, line: 92, column: 27)
!113 = !DILocalVariable(name: "source", scope: !114, file: !17, line: 95, type: !36)
!114 = distinct !DILexicalBlock(scope: !98, file: !17, line: 94, column: 5)
!115 = !DILocation(line: 95, column: 17, scope: !114)
!116 = !DILocation(line: 97, column: 16, scope: !114)
!117 = !DILocation(line: 97, column: 22, scope: !114)
!118 = !DILocation(line: 97, column: 9, scope: !114)
!119 = !DILocation(line: 98, column: 20, scope: !114)
!120 = !DILocation(line: 98, column: 9, scope: !114)
!121 = !DILocation(line: 99, column: 14, scope: !114)
!122 = !DILocation(line: 99, column: 9, scope: !114)
!123 = !DILocation(line: 101, column: 1, scope: !98)
