; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_66a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataArray = alloca [5 x i8*], align 16
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [5 x i8*]* %dataArray, metadata !24, metadata !DIExpression()), !dbg !28
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
  %6 = load i8*, i8** %data, align 8, !dbg !48
  %arrayidx2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 2, !dbg !49
  store i8* %6, i8** %arrayidx2, align 16, !dbg !50
  %arraydecay = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 0, !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_badSink(i8** %arraydecay), !dbg !52
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

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_badSink(i8**) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66_good() #0 !dbg !54 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66_bad(), !dbg !73
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
  %dataArray = alloca [5 x i8*], align 16
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [5 x i8*]* %dataArray, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !85
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !84
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !86
  %cmp = icmp eq i8* %0, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !93
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !96
  store i8* %3, i8** %data, align 8, !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx1 = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 2, !dbg !99
  store i8* %4, i8** %arrayidx1, align 16, !dbg !100
  %arraydecay = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 0, !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_goodG2BSink(i8** %arraydecay), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_goodG2BSink(i8**) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataArray = alloca [5 x i8*], align 16
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [5 x i8*]* %dataArray, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !113
  %0 = bitcast i8* %call to i32*, !dbg !114
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !112
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !115
  %cmp = icmp eq i32* %1, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !121
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !122
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !125
  %5 = bitcast i32* %4 to i8*, !dbg !126
  store i8* %5, i8** %data, align 8, !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 2, !dbg !129
  store i8* %6, i8** %arrayidx2, align 16, !dbg !130
  %arraydecay = getelementptr inbounds [5 x i8*], [5 x i8*]* %dataArray, i64 0, i64 0, !dbg !131
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_goodB2GSink(i8** %arraydecay), !dbg !132
  ret void, !dbg !133
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_66b_goodB2GSink(i8**) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_66_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_66a.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocalVariable(name: "dataArray", scope: !18, file: !19, line: 30, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 5)
!28 = !DILocation(line: 30, column: 12, scope: !18)
!29 = !DILocation(line: 31, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !31, file: !19, line: 33, type: !5)
!31 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 5)
!32 = !DILocation(line: 33, column: 19, scope: !31)
!33 = !DILocation(line: 33, column: 46, scope: !31)
!34 = !DILocation(line: 33, column: 35, scope: !31)
!35 = !DILocation(line: 34, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !19, line: 34, column: 13)
!37 = !DILocation(line: 34, column: 27, scope: !36)
!38 = !DILocation(line: 34, column: 13, scope: !31)
!39 = !DILocation(line: 34, column: 37, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 34, column: 36)
!41 = !DILocation(line: 35, column: 17, scope: !31)
!42 = !DILocation(line: 35, column: 9, scope: !31)
!43 = !DILocation(line: 36, column: 9, scope: !31)
!44 = !DILocation(line: 36, column: 29, scope: !31)
!45 = !DILocation(line: 38, column: 24, scope: !31)
!46 = !DILocation(line: 38, column: 16, scope: !31)
!47 = !DILocation(line: 38, column: 14, scope: !31)
!48 = !DILocation(line: 41, column: 20, scope: !18)
!49 = !DILocation(line: 41, column: 5, scope: !18)
!50 = !DILocation(line: 41, column: 18, scope: !18)
!51 = !DILocation(line: 42, column: 59, scope: !18)
!52 = !DILocation(line: 42, column: 5, scope: !18)
!53 = !DILocation(line: 43, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_66_good", scope: !19, file: !19, line: 89, type: !20, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 91, column: 5, scope: !54)
!56 = !DILocation(line: 92, column: 5, scope: !54)
!57 = !DILocation(line: 93, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 104, type: !59, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !19, line: 104, type: !8)
!63 = !DILocation(line: 104, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !19, line: 104, type: !61)
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
!76 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !19, line: 54, type: !4)
!78 = !DILocation(line: 54, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataArray", scope: !76, file: !19, line: 55, type: !25)
!80 = !DILocation(line: 55, column: 12, scope: !76)
!81 = !DILocation(line: 56, column: 10, scope: !76)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !19, line: 58, type: !10)
!83 = distinct !DILexicalBlock(scope: !76, file: !19, line: 57, column: 5)
!84 = !DILocation(line: 58, column: 16, scope: !83)
!85 = !DILocation(line: 58, column: 41, scope: !83)
!86 = !DILocation(line: 59, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !19, line: 59, column: 13)
!88 = !DILocation(line: 59, column: 28, scope: !87)
!89 = !DILocation(line: 59, column: 13, scope: !83)
!90 = !DILocation(line: 59, column: 38, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !19, line: 59, column: 37)
!92 = !DILocation(line: 60, column: 16, scope: !83)
!93 = !DILocation(line: 60, column: 9, scope: !83)
!94 = !DILocation(line: 61, column: 9, scope: !83)
!95 = !DILocation(line: 61, column: 30, scope: !83)
!96 = !DILocation(line: 63, column: 24, scope: !83)
!97 = !DILocation(line: 63, column: 14, scope: !83)
!98 = !DILocation(line: 65, column: 20, scope: !76)
!99 = !DILocation(line: 65, column: 5, scope: !76)
!100 = !DILocation(line: 65, column: 18, scope: !76)
!101 = !DILocation(line: 66, column: 63, scope: !76)
!102 = !DILocation(line: 66, column: 5, scope: !76)
!103 = !DILocation(line: 67, column: 1, scope: !76)
!104 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 72, type: !20, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !19, line: 74, type: !4)
!106 = !DILocation(line: 74, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataArray", scope: !104, file: !19, line: 75, type: !25)
!108 = !DILocation(line: 75, column: 12, scope: !104)
!109 = !DILocation(line: 76, column: 10, scope: !104)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !19, line: 78, type: !5)
!111 = distinct !DILexicalBlock(scope: !104, file: !19, line: 77, column: 5)
!112 = !DILocation(line: 78, column: 19, scope: !111)
!113 = !DILocation(line: 78, column: 46, scope: !111)
!114 = !DILocation(line: 78, column: 35, scope: !111)
!115 = !DILocation(line: 79, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !19, line: 79, column: 13)
!117 = !DILocation(line: 79, column: 27, scope: !116)
!118 = !DILocation(line: 79, column: 13, scope: !111)
!119 = !DILocation(line: 79, column: 37, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !19, line: 79, column: 36)
!121 = !DILocation(line: 80, column: 17, scope: !111)
!122 = !DILocation(line: 80, column: 9, scope: !111)
!123 = !DILocation(line: 81, column: 9, scope: !111)
!124 = !DILocation(line: 81, column: 29, scope: !111)
!125 = !DILocation(line: 83, column: 24, scope: !111)
!126 = !DILocation(line: 83, column: 16, scope: !111)
!127 = !DILocation(line: 83, column: 14, scope: !111)
!128 = !DILocation(line: 85, column: 20, scope: !104)
!129 = !DILocation(line: 85, column: 5, scope: !104)
!130 = !DILocation(line: 85, column: 18, scope: !104)
!131 = !DILocation(line: 86, column: 63, scope: !104)
!132 = !DILocation(line: 86, column: 5, scope: !104)
!133 = !DILocation(line: 87, column: 1, scope: !104)
