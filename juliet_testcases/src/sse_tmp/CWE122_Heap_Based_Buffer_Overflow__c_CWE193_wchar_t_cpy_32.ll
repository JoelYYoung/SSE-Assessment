; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !31
  %1 = load i32*, i32** %0, align 8, !dbg !32
  store i32* %1, i32** %data1, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !33
  %2 = bitcast i8* %call to i32*, !dbg !34
  store i32* %2, i32** %data1, align 8, !dbg !35
  %3 = load i32*, i32** %data1, align 8, !dbg !36
  %cmp = icmp eq i32* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !42
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !43
  store i32* %4, i32** %5, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !48
  %7 = load i32*, i32** %6, align 8, !dbg !49
  store i32* %7, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32_bad.source to i8*), i64 44, i1 false), !dbg !55
  %9 = load i32*, i32** %data2, align 8, !dbg !56
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !57
  %call3 = call i32* @wcscpy(i32* %9, i32* %arraydecay) #6, !dbg !58
  %10 = load i32*, i32** %data2, align 8, !dbg !59
  call void @printWLine(i32* %10), !dbg !60
  %11 = load i32*, i32** %data2, align 8, !dbg !61
  %12 = bitcast i32* %11 to i8*, !dbg !61
  call void @free(i8* %12) #6, !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !90, metadata !DIExpression()), !dbg !91
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !92, metadata !DIExpression()), !dbg !93
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !95, metadata !DIExpression()), !dbg !97
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !98
  %1 = load i32*, i32** %0, align 8, !dbg !99
  store i32* %1, i32** %data1, align 8, !dbg !97
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !100
  %2 = bitcast i8* %call to i32*, !dbg !101
  store i32* %2, i32** %data1, align 8, !dbg !102
  %3 = load i32*, i32** %data1, align 8, !dbg !103
  %cmp = icmp eq i32* %3, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !109
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !110
  store i32* %4, i32** %5, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !112, metadata !DIExpression()), !dbg !114
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !115
  %7 = load i32*, i32** %6, align 8, !dbg !116
  store i32* %7, i32** %data2, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !119
  %9 = load i32*, i32** %data2, align 8, !dbg !120
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !121
  %call3 = call i32* @wcscpy(i32* %9, i32* %arraydecay) #6, !dbg !122
  %10 = load i32*, i32** %data2, align 8, !dbg !123
  call void @printWLine(i32* %10), !dbg !124
  %11 = load i32*, i32** %data2, align 8, !dbg !125
  %12 = bitcast i32* %11 to i8*, !dbg !125
  call void @free(i8* %12) #6, !dbg !126
  ret void, !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 31, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 31, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 32, type: !23)
!26 = !DILocation(line: 32, column: 16, scope: !16)
!27 = !DILocation(line: 33, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !17, line: 35, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!30 = !DILocation(line: 35, column: 19, scope: !29)
!31 = !DILocation(line: 35, column: 27, scope: !29)
!32 = !DILocation(line: 35, column: 26, scope: !29)
!33 = !DILocation(line: 37, column: 27, scope: !29)
!34 = !DILocation(line: 37, column: 16, scope: !29)
!35 = !DILocation(line: 37, column: 14, scope: !29)
!36 = !DILocation(line: 38, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !17, line: 38, column: 13)
!38 = !DILocation(line: 38, column: 18, scope: !37)
!39 = !DILocation(line: 38, column: 13, scope: !29)
!40 = !DILocation(line: 38, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 38, column: 27)
!42 = !DILocation(line: 39, column: 21, scope: !29)
!43 = !DILocation(line: 39, column: 10, scope: !29)
!44 = !DILocation(line: 39, column: 19, scope: !29)
!45 = !DILocalVariable(name: "data", scope: !46, file: !17, line: 42, type: !4)
!46 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!47 = !DILocation(line: 42, column: 19, scope: !46)
!48 = !DILocation(line: 42, column: 27, scope: !46)
!49 = !DILocation(line: 42, column: 26, scope: !46)
!50 = !DILocalVariable(name: "source", scope: !51, file: !17, line: 44, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !17, line: 43, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 11)
!55 = !DILocation(line: 44, column: 21, scope: !51)
!56 = !DILocation(line: 46, column: 20, scope: !51)
!57 = !DILocation(line: 46, column: 26, scope: !51)
!58 = !DILocation(line: 46, column: 13, scope: !51)
!59 = !DILocation(line: 47, column: 24, scope: !51)
!60 = !DILocation(line: 47, column: 13, scope: !51)
!61 = !DILocation(line: 48, column: 18, scope: !51)
!62 = !DILocation(line: 48, column: 13, scope: !51)
!63 = !DILocation(line: 51, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_32_good", scope: !17, file: !17, line: 83, type: !18, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 85, column: 5, scope: !64)
!66 = !DILocation(line: 86, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 97, type: !68, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 97, type: !7)
!74 = !DILocation(line: 97, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 97, type: !70)
!76 = !DILocation(line: 97, column: 27, scope: !67)
!77 = !DILocation(line: 100, column: 22, scope: !67)
!78 = !DILocation(line: 100, column: 12, scope: !67)
!79 = !DILocation(line: 100, column: 5, scope: !67)
!80 = !DILocation(line: 102, column: 5, scope: !67)
!81 = !DILocation(line: 103, column: 5, scope: !67)
!82 = !DILocation(line: 104, column: 5, scope: !67)
!83 = !DILocation(line: 107, column: 5, scope: !67)
!84 = !DILocation(line: 108, column: 5, scope: !67)
!85 = !DILocation(line: 109, column: 5, scope: !67)
!86 = !DILocation(line: 111, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 60, type: !4)
!89 = !DILocation(line: 60, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataPtr1", scope: !87, file: !17, line: 61, type: !23)
!91 = !DILocation(line: 61, column: 16, scope: !87)
!92 = !DILocalVariable(name: "dataPtr2", scope: !87, file: !17, line: 62, type: !23)
!93 = !DILocation(line: 62, column: 16, scope: !87)
!94 = !DILocation(line: 63, column: 10, scope: !87)
!95 = !DILocalVariable(name: "data", scope: !96, file: !17, line: 65, type: !4)
!96 = distinct !DILexicalBlock(scope: !87, file: !17, line: 64, column: 5)
!97 = !DILocation(line: 65, column: 19, scope: !96)
!98 = !DILocation(line: 65, column: 27, scope: !96)
!99 = !DILocation(line: 65, column: 26, scope: !96)
!100 = !DILocation(line: 67, column: 27, scope: !96)
!101 = !DILocation(line: 67, column: 16, scope: !96)
!102 = !DILocation(line: 67, column: 14, scope: !96)
!103 = !DILocation(line: 68, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !17, line: 68, column: 13)
!105 = !DILocation(line: 68, column: 18, scope: !104)
!106 = !DILocation(line: 68, column: 13, scope: !96)
!107 = !DILocation(line: 68, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !17, line: 68, column: 27)
!109 = !DILocation(line: 69, column: 21, scope: !96)
!110 = !DILocation(line: 69, column: 10, scope: !96)
!111 = !DILocation(line: 69, column: 19, scope: !96)
!112 = !DILocalVariable(name: "data", scope: !113, file: !17, line: 72, type: !4)
!113 = distinct !DILexicalBlock(scope: !87, file: !17, line: 71, column: 5)
!114 = !DILocation(line: 72, column: 19, scope: !113)
!115 = !DILocation(line: 72, column: 27, scope: !113)
!116 = !DILocation(line: 72, column: 26, scope: !113)
!117 = !DILocalVariable(name: "source", scope: !118, file: !17, line: 74, type: !52)
!118 = distinct !DILexicalBlock(scope: !113, file: !17, line: 73, column: 9)
!119 = !DILocation(line: 74, column: 21, scope: !118)
!120 = !DILocation(line: 76, column: 20, scope: !118)
!121 = !DILocation(line: 76, column: 26, scope: !118)
!122 = !DILocation(line: 76, column: 13, scope: !118)
!123 = !DILocation(line: 77, column: 24, scope: !118)
!124 = !DILocation(line: 77, column: 13, scope: !118)
!125 = !DILocation(line: 78, column: 18, scope: !118)
!126 = !DILocation(line: 78, column: 13, scope: !118)
!127 = !DILocation(line: 81, column: 1, scope: !87)
