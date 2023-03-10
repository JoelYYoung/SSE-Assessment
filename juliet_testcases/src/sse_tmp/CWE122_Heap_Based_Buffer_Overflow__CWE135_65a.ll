; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_65a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !24, metadata !DIExpression()), !dbg !28
  store void (i8*)* @CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_badSink, void (i8*)** %funcPtr, align 8, !dbg !28
  store i8* null, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !33
  %0 = bitcast i8* %call to i32*, !dbg !34
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !32
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  %cmp = icmp eq i32* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !41
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !42
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  %5 = bitcast i32* %4 to i8*, !dbg !46
  store i8* %5, i8** %data, align 8, !dbg !47
  %6 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !48
  %7 = load i8*, i8** %data, align 8, !dbg !49
  call void %6(i8* %7), !dbg !48
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_badSink(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  call void @goodB2G(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !76, metadata !DIExpression()), !dbg !77
  store void (i8*)* @CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !81
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !82
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !81
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !90
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !93
  store i8* %3, i8** %data, align 8, !dbg !94
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !96
  call void %4(i8* %5), !dbg !95
  ret void, !dbg !97
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_goodG2BSink(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !101, metadata !DIExpression()), !dbg !102
  store void (i8*)* @CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_goodB2GSink, void (i8*)** %funcPtr, align 8, !dbg !102
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
  %6 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !122
  %7 = load i8*, i8** %data, align 8, !dbg !123
  call void %6(i8* %7), !dbg !122
  ret void, !dbg !124
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_65b_goodB2GSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_65_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_65a.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocalVariable(name: "funcPtr", scope: !18, file: !19, line: 31, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !4}
!28 = !DILocation(line: 31, column: 12, scope: !18)
!29 = !DILocation(line: 32, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !31, file: !19, line: 34, type: !5)
!31 = distinct !DILexicalBlock(scope: !18, file: !19, line: 33, column: 5)
!32 = !DILocation(line: 34, column: 19, scope: !31)
!33 = !DILocation(line: 34, column: 46, scope: !31)
!34 = !DILocation(line: 34, column: 35, scope: !31)
!35 = !DILocation(line: 35, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !19, line: 35, column: 13)
!37 = !DILocation(line: 35, column: 27, scope: !36)
!38 = !DILocation(line: 35, column: 13, scope: !31)
!39 = !DILocation(line: 35, column: 37, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 35, column: 36)
!41 = !DILocation(line: 36, column: 17, scope: !31)
!42 = !DILocation(line: 36, column: 9, scope: !31)
!43 = !DILocation(line: 37, column: 9, scope: !31)
!44 = !DILocation(line: 37, column: 29, scope: !31)
!45 = !DILocation(line: 39, column: 24, scope: !31)
!46 = !DILocation(line: 39, column: 16, scope: !31)
!47 = !DILocation(line: 39, column: 14, scope: !31)
!48 = !DILocation(line: 42, column: 5, scope: !18)
!49 = !DILocation(line: 42, column: 13, scope: !18)
!50 = !DILocation(line: 43, column: 1, scope: !18)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_65_good", scope: !19, file: !19, line: 87, type: !20, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 89, column: 5, scope: !51)
!53 = !DILocation(line: 90, column: 5, scope: !51)
!54 = !DILocation(line: 91, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 102, type: !56, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!8, !8, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !19, line: 102, type: !8)
!60 = !DILocation(line: 102, column: 14, scope: !55)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !19, line: 102, type: !58)
!62 = !DILocation(line: 102, column: 27, scope: !55)
!63 = !DILocation(line: 105, column: 22, scope: !55)
!64 = !DILocation(line: 105, column: 12, scope: !55)
!65 = !DILocation(line: 105, column: 5, scope: !55)
!66 = !DILocation(line: 107, column: 5, scope: !55)
!67 = !DILocation(line: 108, column: 5, scope: !55)
!68 = !DILocation(line: 109, column: 5, scope: !55)
!69 = !DILocation(line: 112, column: 5, scope: !55)
!70 = !DILocation(line: 113, column: 5, scope: !55)
!71 = !DILocation(line: 114, column: 5, scope: !55)
!72 = !DILocation(line: 116, column: 5, scope: !55)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !19, line: 54, type: !4)
!75 = !DILocation(line: 54, column: 12, scope: !73)
!76 = !DILocalVariable(name: "funcPtr", scope: !73, file: !19, line: 55, type: !25)
!77 = !DILocation(line: 55, column: 12, scope: !73)
!78 = !DILocation(line: 56, column: 10, scope: !73)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !19, line: 58, type: !10)
!80 = distinct !DILexicalBlock(scope: !73, file: !19, line: 57, column: 5)
!81 = !DILocation(line: 58, column: 16, scope: !80)
!82 = !DILocation(line: 58, column: 41, scope: !80)
!83 = !DILocation(line: 59, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !19, line: 59, column: 13)
!85 = !DILocation(line: 59, column: 28, scope: !84)
!86 = !DILocation(line: 59, column: 13, scope: !80)
!87 = !DILocation(line: 59, column: 38, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !19, line: 59, column: 37)
!89 = !DILocation(line: 60, column: 16, scope: !80)
!90 = !DILocation(line: 60, column: 9, scope: !80)
!91 = !DILocation(line: 61, column: 9, scope: !80)
!92 = !DILocation(line: 61, column: 30, scope: !80)
!93 = !DILocation(line: 63, column: 24, scope: !80)
!94 = !DILocation(line: 63, column: 14, scope: !80)
!95 = !DILocation(line: 65, column: 5, scope: !73)
!96 = !DILocation(line: 65, column: 13, scope: !73)
!97 = !DILocation(line: 66, column: 1, scope: !73)
!98 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 71, type: !20, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !19, line: 73, type: !4)
!100 = !DILocation(line: 73, column: 12, scope: !98)
!101 = !DILocalVariable(name: "funcPtr", scope: !98, file: !19, line: 74, type: !25)
!102 = !DILocation(line: 74, column: 12, scope: !98)
!103 = !DILocation(line: 75, column: 10, scope: !98)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !19, line: 77, type: !5)
!105 = distinct !DILexicalBlock(scope: !98, file: !19, line: 76, column: 5)
!106 = !DILocation(line: 77, column: 19, scope: !105)
!107 = !DILocation(line: 77, column: 46, scope: !105)
!108 = !DILocation(line: 77, column: 35, scope: !105)
!109 = !DILocation(line: 78, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !19, line: 78, column: 13)
!111 = !DILocation(line: 78, column: 27, scope: !110)
!112 = !DILocation(line: 78, column: 13, scope: !105)
!113 = !DILocation(line: 78, column: 37, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !19, line: 78, column: 36)
!115 = !DILocation(line: 79, column: 17, scope: !105)
!116 = !DILocation(line: 79, column: 9, scope: !105)
!117 = !DILocation(line: 80, column: 9, scope: !105)
!118 = !DILocation(line: 80, column: 29, scope: !105)
!119 = !DILocation(line: 82, column: 24, scope: !105)
!120 = !DILocation(line: 82, column: 16, scope: !105)
!121 = !DILocation(line: 82, column: 14, scope: !105)
!122 = !DILocation(line: 84, column: 5, scope: !98)
!123 = !DILocation(line: 84, column: 13, scope: !98)
!124 = !DILocation(line: 85, column: 1, scope: !98)
