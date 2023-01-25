; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %2, i32** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !38
  store i32* %3, i32** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31_bad.source to i8*), i64 44, i1 false), !dbg !44
  %5 = load i32*, i32** %data1, align 8, !dbg !45
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call2 = call i32* @wcscpy(i32* %5, i32* %arraydecay) #6, !dbg !47
  %6 = load i32*, i32** %data1, align 8, !dbg !48
  call void @printWLine(i32* %6), !dbg !49
  %7 = load i32*, i32** %data1, align 8, !dbg !50
  %8 = bitcast i32* %7 to i8*, !dbg !50
  call void @free(i8* %8) #6, !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !80
  %0 = bitcast i8* %call to i32*, !dbg !81
  store i32* %0, i32** %data, align 8, !dbg !82
  %1 = load i32*, i32** %data, align 8, !dbg !83
  %cmp = icmp eq i32* %1, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !89, metadata !DIExpression()), !dbg !91
  %2 = load i32*, i32** %data, align 8, !dbg !92
  store i32* %2, i32** %dataCopy, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !93, metadata !DIExpression()), !dbg !94
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !95
  store i32* %3, i32** %data1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !98
  %5 = load i32*, i32** %data1, align 8, !dbg !99
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !100
  %call2 = call i32* @wcscpy(i32* %5, i32* %arraydecay) #6, !dbg !101
  %6 = load i32*, i32** %data1, align 8, !dbg !102
  call void @printWLine(i32* %6), !dbg !103
  %7 = load i32*, i32** %data1, align 8, !dbg !104
  %8 = bitcast i32* %7 to i8*, !dbg !104
  call void @free(i8* %8) #6, !dbg !105
  ret void, !dbg !106
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 33, column: 23, scope: !16)
!24 = !DILocation(line: 33, column: 12, scope: !16)
!25 = !DILocation(line: 33, column: 10, scope: !16)
!26 = !DILocation(line: 34, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 9)
!28 = !DILocation(line: 34, column: 14, scope: !27)
!29 = !DILocation(line: 34, column: 9, scope: !16)
!30 = !DILocation(line: 34, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 34, column: 23)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !17, line: 36, type: !4)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!34 = !DILocation(line: 36, column: 19, scope: !33)
!35 = !DILocation(line: 36, column: 30, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !17, line: 37, type: !4)
!37 = !DILocation(line: 37, column: 19, scope: !33)
!38 = !DILocation(line: 37, column: 26, scope: !33)
!39 = !DILocalVariable(name: "source", scope: !40, file: !17, line: 39, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !17, line: 38, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 39, column: 21, scope: !40)
!45 = !DILocation(line: 41, column: 20, scope: !40)
!46 = !DILocation(line: 41, column: 26, scope: !40)
!47 = !DILocation(line: 41, column: 13, scope: !40)
!48 = !DILocation(line: 42, column: 24, scope: !40)
!49 = !DILocation(line: 42, column: 13, scope: !40)
!50 = !DILocation(line: 43, column: 18, scope: !40)
!51 = !DILocation(line: 43, column: 13, scope: !40)
!52 = !DILocation(line: 46, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_31_good", scope: !17, file: !17, line: 73, type: !18, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 75, column: 5, scope: !53)
!55 = !DILocation(line: 76, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 87, type: !57, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!7, !7, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !17, line: 87, type: !7)
!63 = !DILocation(line: 87, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !17, line: 87, type: !59)
!65 = !DILocation(line: 87, column: 27, scope: !56)
!66 = !DILocation(line: 90, column: 22, scope: !56)
!67 = !DILocation(line: 90, column: 12, scope: !56)
!68 = !DILocation(line: 90, column: 5, scope: !56)
!69 = !DILocation(line: 92, column: 5, scope: !56)
!70 = !DILocation(line: 93, column: 5, scope: !56)
!71 = !DILocation(line: 94, column: 5, scope: !56)
!72 = !DILocation(line: 97, column: 5, scope: !56)
!73 = !DILocation(line: 98, column: 5, scope: !56)
!74 = !DILocation(line: 99, column: 5, scope: !56)
!75 = !DILocation(line: 101, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !17, line: 55, type: !4)
!78 = !DILocation(line: 55, column: 15, scope: !76)
!79 = !DILocation(line: 56, column: 10, scope: !76)
!80 = !DILocation(line: 58, column: 23, scope: !76)
!81 = !DILocation(line: 58, column: 12, scope: !76)
!82 = !DILocation(line: 58, column: 10, scope: !76)
!83 = !DILocation(line: 59, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !76, file: !17, line: 59, column: 9)
!85 = !DILocation(line: 59, column: 14, scope: !84)
!86 = !DILocation(line: 59, column: 9, scope: !76)
!87 = !DILocation(line: 59, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !17, line: 59, column: 23)
!89 = !DILocalVariable(name: "dataCopy", scope: !90, file: !17, line: 61, type: !4)
!90 = distinct !DILexicalBlock(scope: !76, file: !17, line: 60, column: 5)
!91 = !DILocation(line: 61, column: 19, scope: !90)
!92 = !DILocation(line: 61, column: 30, scope: !90)
!93 = !DILocalVariable(name: "data", scope: !90, file: !17, line: 62, type: !4)
!94 = !DILocation(line: 62, column: 19, scope: !90)
!95 = !DILocation(line: 62, column: 26, scope: !90)
!96 = !DILocalVariable(name: "source", scope: !97, file: !17, line: 64, type: !41)
!97 = distinct !DILexicalBlock(scope: !90, file: !17, line: 63, column: 9)
!98 = !DILocation(line: 64, column: 21, scope: !97)
!99 = !DILocation(line: 66, column: 20, scope: !97)
!100 = !DILocation(line: 66, column: 26, scope: !97)
!101 = !DILocation(line: 66, column: 13, scope: !97)
!102 = !DILocation(line: 67, column: 24, scope: !97)
!103 = !DILocation(line: 67, column: 13, scope: !97)
!104 = !DILocation(line: 68, column: 18, scope: !97)
!105 = !DILocation(line: 68, column: 13, scope: !97)
!106 = !DILocation(line: 71, column: 1, scope: !76)
