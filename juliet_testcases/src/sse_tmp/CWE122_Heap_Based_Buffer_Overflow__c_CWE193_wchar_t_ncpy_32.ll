; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32_bad() #0 !dbg !16 {
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
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !33
  %2 = bitcast i8* %call to i32*, !dbg !34
  store i32* %2, i32** %data1, align 8, !dbg !35
  %3 = load i32*, i32** %data1, align 8, !dbg !36
  %cmp = icmp eq i32* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !40
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32_bad.source to i8*), i64 44, i1 false), !dbg !55
  %9 = load i32*, i32** %data2, align 8, !dbg !56
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !57
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !58
  %call4 = call i64 @wcslen(i32* %arraydecay3) #9, !dbg !59
  %add = add i64 %call4, 1, !dbg !60
  %call5 = call i32* @wcsncpy(i32* %9, i32* %arraydecay, i64 %add) #7, !dbg !61
  %10 = load i32*, i32** %data2, align 8, !dbg !62
  call void @printWLine(i32* %10), !dbg !63
  %11 = load i32*, i32** %data2, align 8, !dbg !64
  %12 = bitcast i32* %11 to i8*, !dbg !64
  call void @free(i8* %12) #7, !dbg !65
  ret void, !dbg !66
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
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #7, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #7, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !95, metadata !DIExpression()), !dbg !96
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !98, metadata !DIExpression()), !dbg !100
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !101
  %1 = load i32*, i32** %0, align 8, !dbg !102
  store i32* %1, i32** %data1, align 8, !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !103
  %2 = bitcast i8* %call to i32*, !dbg !104
  store i32* %2, i32** %data1, align 8, !dbg !105
  %3 = load i32*, i32** %data1, align 8, !dbg !106
  %cmp = icmp eq i32* %3, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !112
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !113
  store i32* %4, i32** %5, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !115, metadata !DIExpression()), !dbg !117
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !118
  %7 = load i32*, i32** %6, align 8, !dbg !119
  store i32* %7, i32** %data2, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !122
  %9 = load i32*, i32** %data2, align 8, !dbg !123
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !124
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !125
  %call4 = call i64 @wcslen(i32* %arraydecay3) #9, !dbg !126
  %add = add i64 %call4, 1, !dbg !127
  %call5 = call i32* @wcsncpy(i32* %9, i32* %arraydecay, i64 %add) #7, !dbg !128
  %10 = load i32*, i32** %data2, align 8, !dbg !129
  call void @printWLine(i32* %10), !dbg !130
  %11 = load i32*, i32** %data2, align 8, !dbg !131
  %12 = bitcast i32* %11 to i8*, !dbg !131
  call void @free(i8* %12) #7, !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!56 = !DILocation(line: 47, column: 21, scope: !51)
!57 = !DILocation(line: 47, column: 27, scope: !51)
!58 = !DILocation(line: 47, column: 42, scope: !51)
!59 = !DILocation(line: 47, column: 35, scope: !51)
!60 = !DILocation(line: 47, column: 50, scope: !51)
!61 = !DILocation(line: 47, column: 13, scope: !51)
!62 = !DILocation(line: 48, column: 24, scope: !51)
!63 = !DILocation(line: 48, column: 13, scope: !51)
!64 = !DILocation(line: 49, column: 18, scope: !51)
!65 = !DILocation(line: 49, column: 13, scope: !51)
!66 = !DILocation(line: 52, column: 1, scope: !16)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_32_good", scope: !17, file: !17, line: 85, type: !18, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 87, column: 5, scope: !67)
!69 = !DILocation(line: 88, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 99, type: !71, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !17, line: 99, type: !7)
!77 = !DILocation(line: 99, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !17, line: 99, type: !73)
!79 = !DILocation(line: 99, column: 27, scope: !70)
!80 = !DILocation(line: 102, column: 22, scope: !70)
!81 = !DILocation(line: 102, column: 12, scope: !70)
!82 = !DILocation(line: 102, column: 5, scope: !70)
!83 = !DILocation(line: 104, column: 5, scope: !70)
!84 = !DILocation(line: 105, column: 5, scope: !70)
!85 = !DILocation(line: 106, column: 5, scope: !70)
!86 = !DILocation(line: 109, column: 5, scope: !70)
!87 = !DILocation(line: 110, column: 5, scope: !70)
!88 = !DILocation(line: 111, column: 5, scope: !70)
!89 = !DILocation(line: 113, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !17, line: 61, type: !4)
!92 = !DILocation(line: 61, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataPtr1", scope: !90, file: !17, line: 62, type: !23)
!94 = !DILocation(line: 62, column: 16, scope: !90)
!95 = !DILocalVariable(name: "dataPtr2", scope: !90, file: !17, line: 63, type: !23)
!96 = !DILocation(line: 63, column: 16, scope: !90)
!97 = !DILocation(line: 64, column: 10, scope: !90)
!98 = !DILocalVariable(name: "data", scope: !99, file: !17, line: 66, type: !4)
!99 = distinct !DILexicalBlock(scope: !90, file: !17, line: 65, column: 5)
!100 = !DILocation(line: 66, column: 19, scope: !99)
!101 = !DILocation(line: 66, column: 27, scope: !99)
!102 = !DILocation(line: 66, column: 26, scope: !99)
!103 = !DILocation(line: 68, column: 27, scope: !99)
!104 = !DILocation(line: 68, column: 16, scope: !99)
!105 = !DILocation(line: 68, column: 14, scope: !99)
!106 = !DILocation(line: 69, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !17, line: 69, column: 13)
!108 = !DILocation(line: 69, column: 18, scope: !107)
!109 = !DILocation(line: 69, column: 13, scope: !99)
!110 = !DILocation(line: 69, column: 28, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !17, line: 69, column: 27)
!112 = !DILocation(line: 70, column: 21, scope: !99)
!113 = !DILocation(line: 70, column: 10, scope: !99)
!114 = !DILocation(line: 70, column: 19, scope: !99)
!115 = !DILocalVariable(name: "data", scope: !116, file: !17, line: 73, type: !4)
!116 = distinct !DILexicalBlock(scope: !90, file: !17, line: 72, column: 5)
!117 = !DILocation(line: 73, column: 19, scope: !116)
!118 = !DILocation(line: 73, column: 27, scope: !116)
!119 = !DILocation(line: 73, column: 26, scope: !116)
!120 = !DILocalVariable(name: "source", scope: !121, file: !17, line: 75, type: !52)
!121 = distinct !DILexicalBlock(scope: !116, file: !17, line: 74, column: 9)
!122 = !DILocation(line: 75, column: 21, scope: !121)
!123 = !DILocation(line: 78, column: 21, scope: !121)
!124 = !DILocation(line: 78, column: 27, scope: !121)
!125 = !DILocation(line: 78, column: 42, scope: !121)
!126 = !DILocation(line: 78, column: 35, scope: !121)
!127 = !DILocation(line: 78, column: 50, scope: !121)
!128 = !DILocation(line: 78, column: 13, scope: !121)
!129 = !DILocation(line: 79, column: 24, scope: !121)
!130 = !DILocation(line: 79, column: 13, scope: !121)
!131 = !DILocation(line: 80, column: 18, scope: !121)
!132 = !DILocation(line: 80, column: 13, scope: !121)
!133 = !DILocation(line: 83, column: 1, scope: !90)
