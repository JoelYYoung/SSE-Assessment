; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15_bad.source to i8*), i64 44, i1 false), !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !39
  %call1 = call i32* @wcscpy(i32* %3, i32* %arraydecay) #6, !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  call void @printWLine(i32* %4), !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %6 = bitcast i32* %5 to i8*, !dbg !43
  call void @free(i8* %6) #6, !dbg !44
  ret void, !dbg !45
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !74
  %0 = bitcast i8* %call to i32*, !dbg !75
  store i32* %0, i32** %data, align 8, !dbg !76
  %1 = load i32*, i32** %data, align 8, !dbg !77
  %cmp = icmp eq i32* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !85
  %3 = load i32*, i32** %data, align 8, !dbg !86
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !87
  %call1 = call i32* @wcscpy(i32* %3, i32* %arraydecay) #6, !dbg !88
  %4 = load i32*, i32** %data, align 8, !dbg !89
  call void @printWLine(i32* %4), !dbg !90
  %5 = load i32*, i32** %data, align 8, !dbg !91
  %6 = bitcast i32* %5 to i8*, !dbg !91
  call void @free(i8* %6) #6, !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !98
  %0 = bitcast i8* %call to i32*, !dbg !99
  store i32* %0, i32** %data, align 8, !dbg !100
  %1 = load i32*, i32** %data, align 8, !dbg !101
  %cmp = icmp eq i32* %1, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !109
  %3 = load i32*, i32** %data, align 8, !dbg !110
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !111
  %call1 = call i32* @wcscpy(i32* %3, i32* %arraydecay) #6, !dbg !112
  %4 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %4), !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  %6 = bitcast i32* %5 to i8*, !dbg !115
  call void @free(i8* %6) #6, !dbg !116
  ret void, !dbg !117
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 36, column: 27, scope: !16)
!24 = !DILocation(line: 36, column: 16, scope: !16)
!25 = !DILocation(line: 36, column: 14, scope: !16)
!26 = !DILocation(line: 37, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 13)
!28 = !DILocation(line: 37, column: 18, scope: !27)
!29 = !DILocation(line: 37, column: 13, scope: !16)
!30 = !DILocation(line: 37, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 37, column: 27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !17, line: 45, type: !34)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 45, column: 17, scope: !33)
!38 = !DILocation(line: 47, column: 16, scope: !33)
!39 = !DILocation(line: 47, column: 22, scope: !33)
!40 = !DILocation(line: 47, column: 9, scope: !33)
!41 = !DILocation(line: 48, column: 20, scope: !33)
!42 = !DILocation(line: 48, column: 9, scope: !33)
!43 = !DILocation(line: 49, column: 14, scope: !33)
!44 = !DILocation(line: 49, column: 9, scope: !33)
!45 = !DILocation(line: 51, column: 1, scope: !16)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_15_good", scope: !17, file: !17, line: 109, type: !18, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 111, column: 5, scope: !46)
!48 = !DILocation(line: 112, column: 5, scope: !46)
!49 = !DILocation(line: 113, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 125, type: !51, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!7, !7, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !17, line: 125, type: !7)
!57 = !DILocation(line: 125, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !17, line: 125, type: !53)
!59 = !DILocation(line: 125, column: 27, scope: !50)
!60 = !DILocation(line: 128, column: 22, scope: !50)
!61 = !DILocation(line: 128, column: 12, scope: !50)
!62 = !DILocation(line: 128, column: 5, scope: !50)
!63 = !DILocation(line: 130, column: 5, scope: !50)
!64 = !DILocation(line: 131, column: 5, scope: !50)
!65 = !DILocation(line: 132, column: 5, scope: !50)
!66 = !DILocation(line: 135, column: 5, scope: !50)
!67 = !DILocation(line: 136, column: 5, scope: !50)
!68 = !DILocation(line: 137, column: 5, scope: !50)
!69 = !DILocation(line: 139, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !17, line: 60, type: !4)
!72 = !DILocation(line: 60, column: 15, scope: !70)
!73 = !DILocation(line: 61, column: 10, scope: !70)
!74 = !DILocation(line: 70, column: 27, scope: !70)
!75 = !DILocation(line: 70, column: 16, scope: !70)
!76 = !DILocation(line: 70, column: 14, scope: !70)
!77 = !DILocation(line: 71, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !17, line: 71, column: 13)
!79 = !DILocation(line: 71, column: 18, scope: !78)
!80 = !DILocation(line: 71, column: 13, scope: !70)
!81 = !DILocation(line: 71, column: 28, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !17, line: 71, column: 27)
!83 = !DILocalVariable(name: "source", scope: !84, file: !17, line: 75, type: !34)
!84 = distinct !DILexicalBlock(scope: !70, file: !17, line: 74, column: 5)
!85 = !DILocation(line: 75, column: 17, scope: !84)
!86 = !DILocation(line: 77, column: 16, scope: !84)
!87 = !DILocation(line: 77, column: 22, scope: !84)
!88 = !DILocation(line: 77, column: 9, scope: !84)
!89 = !DILocation(line: 78, column: 20, scope: !84)
!90 = !DILocation(line: 78, column: 9, scope: !84)
!91 = !DILocation(line: 79, column: 14, scope: !84)
!92 = !DILocation(line: 79, column: 9, scope: !84)
!93 = !DILocation(line: 81, column: 1, scope: !70)
!94 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !17, line: 86, type: !4)
!96 = !DILocation(line: 86, column: 15, scope: !94)
!97 = !DILocation(line: 87, column: 10, scope: !94)
!98 = !DILocation(line: 92, column: 27, scope: !94)
!99 = !DILocation(line: 92, column: 16, scope: !94)
!100 = !DILocation(line: 92, column: 14, scope: !94)
!101 = !DILocation(line: 93, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !17, line: 93, column: 13)
!103 = !DILocation(line: 93, column: 18, scope: !102)
!104 = !DILocation(line: 93, column: 13, scope: !94)
!105 = !DILocation(line: 93, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !17, line: 93, column: 27)
!107 = !DILocalVariable(name: "source", scope: !108, file: !17, line: 101, type: !34)
!108 = distinct !DILexicalBlock(scope: !94, file: !17, line: 100, column: 5)
!109 = !DILocation(line: 101, column: 17, scope: !108)
!110 = !DILocation(line: 103, column: 16, scope: !108)
!111 = !DILocation(line: 103, column: 22, scope: !108)
!112 = !DILocation(line: 103, column: 9, scope: !108)
!113 = !DILocation(line: 104, column: 20, scope: !108)
!114 = !DILocation(line: 104, column: 9, scope: !108)
!115 = !DILocation(line: 105, column: 14, scope: !108)
!116 = !DILocation(line: 105, column: 9, scope: !108)
!117 = !DILocation(line: 107, column: 1, scope: !94)
