; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__CWE135_68_badData = dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodG2BData = dso_local global i8* null, align 8, !dbg !15
@CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodB2GData = dso_local global i8* null, align 8, !dbg !18

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_bad() #0 !dbg !26 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store i8* null, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !32, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !35
  %0 = bitcast i8* %call to i32*, !dbg !36
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !34
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  %cmp = icmp eq i32* %1, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !44
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  %5 = bitcast i32* %4 to i8*, !dbg !48
  store i8* %5, i8** %data, align 8, !dbg !49
  %6 = load i8*, i8** %data, align 8, !dbg !50
  store i8* %6, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_badData, align 8, !dbg !51
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_badSink(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_badSink(...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  call void @goodB2G(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* null, i8** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !83
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !82
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !91
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !94
  store i8* %3, i8** %data, align 8, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  store i8* %4, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodG2BData, align 8, !dbg !97
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_goodG2BSink(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_goodG2BSink(...) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* null, i8** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !107
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !106
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !109
  %cmp = icmp eq i32* %1, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !115
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !116
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !119
  %5 = bitcast i32* %4 to i8*, !dbg !120
  store i8* %5, i8** %data, align 8, !dbg !121
  %6 = load i8*, i8** %data, align 8, !dbg !122
  store i8* %6, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodB2GData, align 8, !dbg !123
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_goodB2GSink(), !dbg !124
  ret void, !dbg !125
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_68b_goodB2GSink(...) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_68_badData", scope: !2, file: !17, line: 22, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!0, !15, !18}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodG2BData", scope: !2, file: !17, line: 23, type: !6, isLocal: false, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_68a.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_68_goodB2GData", scope: !2, file: !17, line: 24, type: !6, isLocal: false, isDefinition: true)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"clang version 13.0.0"}
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_68_bad", scope: !17, file: !17, line: 31, type: !27, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "data", scope: !26, file: !17, line: 33, type: !6)
!30 = !DILocation(line: 33, column: 12, scope: !26)
!31 = !DILocation(line: 34, column: 10, scope: !26)
!32 = !DILocalVariable(name: "dataBadBuffer", scope: !33, file: !17, line: 36, type: !7)
!33 = distinct !DILexicalBlock(scope: !26, file: !17, line: 35, column: 5)
!34 = !DILocation(line: 36, column: 19, scope: !33)
!35 = !DILocation(line: 36, column: 46, scope: !33)
!36 = !DILocation(line: 36, column: 35, scope: !33)
!37 = !DILocation(line: 37, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !17, line: 37, column: 13)
!39 = !DILocation(line: 37, column: 27, scope: !38)
!40 = !DILocation(line: 37, column: 13, scope: !33)
!41 = !DILocation(line: 37, column: 37, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !17, line: 37, column: 36)
!43 = !DILocation(line: 38, column: 17, scope: !33)
!44 = !DILocation(line: 38, column: 9, scope: !33)
!45 = !DILocation(line: 39, column: 9, scope: !33)
!46 = !DILocation(line: 39, column: 29, scope: !33)
!47 = !DILocation(line: 41, column: 24, scope: !33)
!48 = !DILocation(line: 41, column: 16, scope: !33)
!49 = !DILocation(line: 41, column: 14, scope: !33)
!50 = !DILocation(line: 43, column: 60, scope: !26)
!51 = !DILocation(line: 43, column: 58, scope: !26)
!52 = !DILocation(line: 44, column: 5, scope: !26)
!53 = !DILocation(line: 45, column: 1, scope: !26)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_68_good", scope: !17, file: !17, line: 89, type: !27, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 91, column: 5, scope: !54)
!56 = !DILocation(line: 92, column: 5, scope: !54)
!57 = !DILocation(line: 93, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 104, type: !59, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!10, !10, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !17, line: 104, type: !10)
!63 = !DILocation(line: 104, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !17, line: 104, type: !61)
!65 = !DILocation(line: 104, column: 27, scope: !58)
!66 = !DILocation(line: 107, column: 22, scope: !58)
!67 = !DILocation(line: 107, column: 12, scope: !58)
!68 = !DILocation(line: 107, column: 5, scope: !58)
!69 = !DILocation(line: 109, column: 5, scope: !58)
!70 = !DILocation(line: 110, column: 5, scope: !58)
!71 = !DILocation(line: 111, column: 5, scope: !58)
!72 = !DILocation(line: 114, column: 5, scope: !58)
!73 = !DILocation(line: 115, column: 5, scope: !58)
!74 = !DILocation(line: 116, column: 5, scope: !58)
!75 = !DILocation(line: 118, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 56, type: !27, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !17, line: 58, type: !6)
!78 = !DILocation(line: 58, column: 12, scope: !76)
!79 = !DILocation(line: 59, column: 10, scope: !76)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !17, line: 61, type: !12)
!81 = distinct !DILexicalBlock(scope: !76, file: !17, line: 60, column: 5)
!82 = !DILocation(line: 61, column: 16, scope: !81)
!83 = !DILocation(line: 61, column: 41, scope: !81)
!84 = !DILocation(line: 62, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !17, line: 62, column: 13)
!86 = !DILocation(line: 62, column: 28, scope: !85)
!87 = !DILocation(line: 62, column: 13, scope: !81)
!88 = !DILocation(line: 62, column: 38, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !17, line: 62, column: 37)
!90 = !DILocation(line: 63, column: 16, scope: !81)
!91 = !DILocation(line: 63, column: 9, scope: !81)
!92 = !DILocation(line: 64, column: 9, scope: !81)
!93 = !DILocation(line: 64, column: 30, scope: !81)
!94 = !DILocation(line: 66, column: 24, scope: !81)
!95 = !DILocation(line: 66, column: 14, scope: !81)
!96 = !DILocation(line: 68, column: 64, scope: !76)
!97 = !DILocation(line: 68, column: 62, scope: !76)
!98 = !DILocation(line: 69, column: 5, scope: !76)
!99 = !DILocation(line: 70, column: 1, scope: !76)
!100 = distinct !DISubprogram(name: "goodB2G", scope: !17, file: !17, line: 73, type: !27, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !17, line: 75, type: !6)
!102 = !DILocation(line: 75, column: 12, scope: !100)
!103 = !DILocation(line: 76, column: 10, scope: !100)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !17, line: 78, type: !7)
!105 = distinct !DILexicalBlock(scope: !100, file: !17, line: 77, column: 5)
!106 = !DILocation(line: 78, column: 19, scope: !105)
!107 = !DILocation(line: 78, column: 46, scope: !105)
!108 = !DILocation(line: 78, column: 35, scope: !105)
!109 = !DILocation(line: 79, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !17, line: 79, column: 13)
!111 = !DILocation(line: 79, column: 27, scope: !110)
!112 = !DILocation(line: 79, column: 13, scope: !105)
!113 = !DILocation(line: 79, column: 37, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 79, column: 36)
!115 = !DILocation(line: 80, column: 17, scope: !105)
!116 = !DILocation(line: 80, column: 9, scope: !105)
!117 = !DILocation(line: 81, column: 9, scope: !105)
!118 = !DILocation(line: 81, column: 29, scope: !105)
!119 = !DILocation(line: 83, column: 24, scope: !105)
!120 = !DILocation(line: 83, column: 16, scope: !105)
!121 = !DILocation(line: 83, column: 14, scope: !105)
!122 = !DILocation(line: 85, column: 64, scope: !100)
!123 = !DILocation(line: 85, column: 62, scope: !100)
!124 = !DILocation(line: 86, column: 5, scope: !100)
!125 = !DILocation(line: 87, column: 1, scope: !100)
