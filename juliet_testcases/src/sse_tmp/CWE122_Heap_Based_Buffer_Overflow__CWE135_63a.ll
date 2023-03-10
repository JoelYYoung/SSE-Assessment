; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_63a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !37
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  %5 = bitcast i32* %4 to i8*, !dbg !41
  store i8* %5, i8** %data, align 8, !dbg !42
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_badSink(i8** %data), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_badSink(i8**) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  call void @goodB2G(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #6, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #6, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i8* null, i8** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !71, metadata !DIExpression()), !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !74
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !73
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !75
  %cmp = icmp eq i8* %0, null, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !82
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !85
  store i8* %3, i8** %data, align 8, !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_goodG2BSink(i8** %data), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_goodG2BSink(i8**) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i8* null, i8** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !96
  %0 = bitcast i8* %call to i32*, !dbg !97
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !95
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !98
  %cmp = icmp eq i32* %1, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !104
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !105
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !108
  %5 = bitcast i32* %4 to i8*, !dbg !109
  store i8* %5, i8** %data, align 8, !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_goodB2GSink(i8** %data), !dbg !111
  ret void, !dbg !112
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_63b_goodB2GSink(i8**) #4

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_63a.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_63_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_63a.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !26, file: !19, line: 32, type: !5)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 5)
!27 = !DILocation(line: 32, column: 19, scope: !26)
!28 = !DILocation(line: 32, column: 46, scope: !26)
!29 = !DILocation(line: 32, column: 35, scope: !26)
!30 = !DILocation(line: 33, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !19, line: 33, column: 13)
!32 = !DILocation(line: 33, column: 27, scope: !31)
!33 = !DILocation(line: 33, column: 13, scope: !26)
!34 = !DILocation(line: 33, column: 37, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !19, line: 33, column: 36)
!36 = !DILocation(line: 34, column: 17, scope: !26)
!37 = !DILocation(line: 34, column: 9, scope: !26)
!38 = !DILocation(line: 35, column: 9, scope: !26)
!39 = !DILocation(line: 35, column: 29, scope: !26)
!40 = !DILocation(line: 37, column: 24, scope: !26)
!41 = !DILocation(line: 37, column: 16, scope: !26)
!42 = !DILocation(line: 37, column: 14, scope: !26)
!43 = !DILocation(line: 39, column: 5, scope: !18)
!44 = !DILocation(line: 40, column: 1, scope: !18)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_63_good", scope: !19, file: !19, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 84, column: 5, scope: !45)
!47 = !DILocation(line: 85, column: 5, scope: !45)
!48 = !DILocation(line: 86, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 97, type: !50, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!8, !8, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !19, line: 97, type: !8)
!54 = !DILocation(line: 97, column: 14, scope: !49)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !19, line: 97, type: !52)
!56 = !DILocation(line: 97, column: 27, scope: !49)
!57 = !DILocation(line: 100, column: 22, scope: !49)
!58 = !DILocation(line: 100, column: 12, scope: !49)
!59 = !DILocation(line: 100, column: 5, scope: !49)
!60 = !DILocation(line: 102, column: 5, scope: !49)
!61 = !DILocation(line: 103, column: 5, scope: !49)
!62 = !DILocation(line: 104, column: 5, scope: !49)
!63 = !DILocation(line: 107, column: 5, scope: !49)
!64 = !DILocation(line: 108, column: 5, scope: !49)
!65 = !DILocation(line: 109, column: 5, scope: !49)
!66 = !DILocation(line: 111, column: 5, scope: !49)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 49, type: !20, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !19, line: 51, type: !4)
!69 = !DILocation(line: 51, column: 12, scope: !67)
!70 = !DILocation(line: 52, column: 10, scope: !67)
!71 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !19, line: 54, type: !10)
!72 = distinct !DILexicalBlock(scope: !67, file: !19, line: 53, column: 5)
!73 = !DILocation(line: 54, column: 16, scope: !72)
!74 = !DILocation(line: 54, column: 41, scope: !72)
!75 = !DILocation(line: 55, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !19, line: 55, column: 13)
!77 = !DILocation(line: 55, column: 28, scope: !76)
!78 = !DILocation(line: 55, column: 13, scope: !72)
!79 = !DILocation(line: 55, column: 38, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !19, line: 55, column: 37)
!81 = !DILocation(line: 56, column: 16, scope: !72)
!82 = !DILocation(line: 56, column: 9, scope: !72)
!83 = !DILocation(line: 57, column: 9, scope: !72)
!84 = !DILocation(line: 57, column: 30, scope: !72)
!85 = !DILocation(line: 59, column: 24, scope: !72)
!86 = !DILocation(line: 59, column: 14, scope: !72)
!87 = !DILocation(line: 61, column: 5, scope: !67)
!88 = !DILocation(line: 62, column: 1, scope: !67)
!89 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !19, line: 69, type: !4)
!91 = !DILocation(line: 69, column: 12, scope: !89)
!92 = !DILocation(line: 70, column: 10, scope: !89)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !19, line: 72, type: !5)
!94 = distinct !DILexicalBlock(scope: !89, file: !19, line: 71, column: 5)
!95 = !DILocation(line: 72, column: 19, scope: !94)
!96 = !DILocation(line: 72, column: 46, scope: !94)
!97 = !DILocation(line: 72, column: 35, scope: !94)
!98 = !DILocation(line: 73, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !19, line: 73, column: 13)
!100 = !DILocation(line: 73, column: 27, scope: !99)
!101 = !DILocation(line: 73, column: 13, scope: !94)
!102 = !DILocation(line: 73, column: 37, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !19, line: 73, column: 36)
!104 = !DILocation(line: 74, column: 17, scope: !94)
!105 = !DILocation(line: 74, column: 9, scope: !94)
!106 = !DILocation(line: 75, column: 9, scope: !94)
!107 = !DILocation(line: 75, column: 29, scope: !94)
!108 = !DILocation(line: 77, column: 24, scope: !94)
!109 = !DILocation(line: 77, column: 16, scope: !94)
!110 = !DILocation(line: 77, column: 14, scope: !94)
!111 = !DILocation(line: 79, column: 5, scope: !89)
!112 = !DILocation(line: 80, column: 1, scope: !89)
