; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__CWE135_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G1Global = dso_local global i32 0, align 4, !dbg !15
@CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G2Global = dso_local global i32 0, align 4, !dbg !18
@CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal = dso_local global i32 0, align 4, !dbg !20
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_bad() #0 !dbg !28 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !31, metadata !DIExpression()), !dbg !32
  store i8* null, i8** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !34, metadata !DIExpression()), !dbg !36
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !37
  %0 = bitcast i8* %call to i32*, !dbg !38
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !36
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  %cmp = icmp eq i32* %1, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !46
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !49
  %5 = bitcast i32* %4 to i8*, !dbg !50
  store i8* %5, i8** %data, align 8, !dbg !51
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_badGlobal, align 4, !dbg !52
  %6 = load i8*, i8** %data, align 8, !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_badSink(i8* %6), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_badSink(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_good() #0 !dbg !56 {
entry:
  call void @goodB2G1(), !dbg !57
  call void @goodB2G2(), !dbg !58
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* null, i8** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !85
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !88
  %cmp = icmp eq i32* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !94
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !95
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !98
  %5 = bitcast i32* %4 to i8*, !dbg !99
  store i8* %5, i8** %data, align 8, !dbg !100
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G1Global, align 4, !dbg !101
  %6 = load i8*, i8** %data, align 8, !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G1Sink(i8* %6), !dbg !103
  ret void, !dbg !104
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G1Sink(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i8* null, i8** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !111
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !112
  %0 = bitcast i8* %call to i32*, !dbg !113
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !111
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !114
  %cmp = icmp eq i32* %1, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !120
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !121
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !124
  %5 = bitcast i32* %4 to i8*, !dbg !125
  store i8* %5, i8** %data, align 8, !dbg !126
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G2Global, align 4, !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G2Sink(i8* %6), !dbg !129
  ret void, !dbg !130
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G2Sink(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !131 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i8* null, i8** %data, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !135, metadata !DIExpression()), !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !138
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !137
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !139
  %cmp = icmp eq i8* %0, null, !dbg !141
  br i1 %cmp, label %if.then, label %if.end, !dbg !142

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !146
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !147
  store i8 0, i8* %arrayidx, align 1, !dbg !148
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !149
  store i8* %3, i8** %data, align 8, !dbg !150
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal, align 4, !dbg !151
  %4 = load i8*, i8** %data, align 8, !dbg !152
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodG2BSink(i8* %4), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodG2BSink(i8*) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_badGlobal", scope: !2, file: !17, line: 25, type: !10, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_22a.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = !{!0, !15, !18, !20}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G1Global", scope: !2, file: !17, line: 50, type: !10, isLocal: false, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_22a.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodB2G2Global", scope: !2, file: !17, line: 51, type: !10, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal", scope: !2, file: !17, line: 52, type: !10, isLocal: false, isDefinition: true)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"clang version 13.0.0"}
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_bad", scope: !17, file: !17, line: 29, type: !29, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{null}
!31 = !DILocalVariable(name: "data", scope: !28, file: !17, line: 31, type: !6)
!32 = !DILocation(line: 31, column: 12, scope: !28)
!33 = !DILocation(line: 32, column: 10, scope: !28)
!34 = !DILocalVariable(name: "dataBadBuffer", scope: !35, file: !17, line: 34, type: !7)
!35 = distinct !DILexicalBlock(scope: !28, file: !17, line: 33, column: 5)
!36 = !DILocation(line: 34, column: 19, scope: !35)
!37 = !DILocation(line: 34, column: 46, scope: !35)
!38 = !DILocation(line: 34, column: 35, scope: !35)
!39 = !DILocation(line: 35, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !35, file: !17, line: 35, column: 13)
!41 = !DILocation(line: 35, column: 27, scope: !40)
!42 = !DILocation(line: 35, column: 13, scope: !35)
!43 = !DILocation(line: 35, column: 37, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 35, column: 36)
!45 = !DILocation(line: 36, column: 17, scope: !35)
!46 = !DILocation(line: 36, column: 9, scope: !35)
!47 = !DILocation(line: 37, column: 9, scope: !35)
!48 = !DILocation(line: 37, column: 29, scope: !35)
!49 = !DILocation(line: 39, column: 24, scope: !35)
!50 = !DILocation(line: 39, column: 16, scope: !35)
!51 = !DILocation(line: 39, column: 14, scope: !35)
!52 = !DILocation(line: 41, column: 60, scope: !28)
!53 = !DILocation(line: 42, column: 58, scope: !28)
!54 = !DILocation(line: 42, column: 5, scope: !28)
!55 = !DILocation(line: 43, column: 1, scope: !28)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_22_good", scope: !17, file: !17, line: 111, type: !29, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 113, column: 5, scope: !56)
!58 = !DILocation(line: 114, column: 5, scope: !56)
!59 = !DILocation(line: 115, column: 5, scope: !56)
!60 = !DILocation(line: 116, column: 1, scope: !56)
!61 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 127, type: !62, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!10, !10, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !17, line: 127, type: !10)
!66 = !DILocation(line: 127, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !17, line: 127, type: !64)
!68 = !DILocation(line: 127, column: 27, scope: !61)
!69 = !DILocation(line: 130, column: 22, scope: !61)
!70 = !DILocation(line: 130, column: 12, scope: !61)
!71 = !DILocation(line: 130, column: 5, scope: !61)
!72 = !DILocation(line: 132, column: 5, scope: !61)
!73 = !DILocation(line: 133, column: 5, scope: !61)
!74 = !DILocation(line: 134, column: 5, scope: !61)
!75 = !DILocation(line: 137, column: 5, scope: !61)
!76 = !DILocation(line: 138, column: 5, scope: !61)
!77 = !DILocation(line: 139, column: 5, scope: !61)
!78 = !DILocation(line: 141, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodB2G1", scope: !17, file: !17, line: 57, type: !29, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !17, line: 59, type: !6)
!81 = !DILocation(line: 59, column: 12, scope: !79)
!82 = !DILocation(line: 60, column: 10, scope: !79)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !17, line: 62, type: !7)
!84 = distinct !DILexicalBlock(scope: !79, file: !17, line: 61, column: 5)
!85 = !DILocation(line: 62, column: 19, scope: !84)
!86 = !DILocation(line: 62, column: 46, scope: !84)
!87 = !DILocation(line: 62, column: 35, scope: !84)
!88 = !DILocation(line: 63, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !17, line: 63, column: 13)
!90 = !DILocation(line: 63, column: 27, scope: !89)
!91 = !DILocation(line: 63, column: 13, scope: !84)
!92 = !DILocation(line: 63, column: 37, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !17, line: 63, column: 36)
!94 = !DILocation(line: 64, column: 17, scope: !84)
!95 = !DILocation(line: 64, column: 9, scope: !84)
!96 = !DILocation(line: 65, column: 9, scope: !84)
!97 = !DILocation(line: 65, column: 29, scope: !84)
!98 = !DILocation(line: 67, column: 24, scope: !84)
!99 = !DILocation(line: 67, column: 16, scope: !84)
!100 = !DILocation(line: 67, column: 14, scope: !84)
!101 = !DILocation(line: 69, column: 65, scope: !79)
!102 = !DILocation(line: 70, column: 63, scope: !79)
!103 = !DILocation(line: 70, column: 5, scope: !79)
!104 = !DILocation(line: 71, column: 1, scope: !79)
!105 = distinct !DISubprogram(name: "goodB2G2", scope: !17, file: !17, line: 76, type: !29, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !17, line: 78, type: !6)
!107 = !DILocation(line: 78, column: 12, scope: !105)
!108 = !DILocation(line: 79, column: 10, scope: !105)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !17, line: 81, type: !7)
!110 = distinct !DILexicalBlock(scope: !105, file: !17, line: 80, column: 5)
!111 = !DILocation(line: 81, column: 19, scope: !110)
!112 = !DILocation(line: 81, column: 46, scope: !110)
!113 = !DILocation(line: 81, column: 35, scope: !110)
!114 = !DILocation(line: 82, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !17, line: 82, column: 13)
!116 = !DILocation(line: 82, column: 27, scope: !115)
!117 = !DILocation(line: 82, column: 13, scope: !110)
!118 = !DILocation(line: 82, column: 37, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !17, line: 82, column: 36)
!120 = !DILocation(line: 83, column: 17, scope: !110)
!121 = !DILocation(line: 83, column: 9, scope: !110)
!122 = !DILocation(line: 84, column: 9, scope: !110)
!123 = !DILocation(line: 84, column: 29, scope: !110)
!124 = !DILocation(line: 86, column: 24, scope: !110)
!125 = !DILocation(line: 86, column: 16, scope: !110)
!126 = !DILocation(line: 86, column: 14, scope: !110)
!127 = !DILocation(line: 88, column: 65, scope: !105)
!128 = !DILocation(line: 89, column: 63, scope: !105)
!129 = !DILocation(line: 89, column: 5, scope: !105)
!130 = !DILocation(line: 90, column: 1, scope: !105)
!131 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 95, type: !29, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocalVariable(name: "data", scope: !131, file: !17, line: 97, type: !6)
!133 = !DILocation(line: 97, column: 12, scope: !131)
!134 = !DILocation(line: 98, column: 10, scope: !131)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !136, file: !17, line: 100, type: !12)
!136 = distinct !DILexicalBlock(scope: !131, file: !17, line: 99, column: 5)
!137 = !DILocation(line: 100, column: 16, scope: !136)
!138 = !DILocation(line: 100, column: 41, scope: !136)
!139 = !DILocation(line: 101, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !17, line: 101, column: 13)
!141 = !DILocation(line: 101, column: 28, scope: !140)
!142 = !DILocation(line: 101, column: 13, scope: !136)
!143 = !DILocation(line: 101, column: 38, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !17, line: 101, column: 37)
!145 = !DILocation(line: 102, column: 16, scope: !136)
!146 = !DILocation(line: 102, column: 9, scope: !136)
!147 = !DILocation(line: 103, column: 9, scope: !136)
!148 = !DILocation(line: 103, column: 30, scope: !136)
!149 = !DILocation(line: 105, column: 24, scope: !136)
!150 = !DILocation(line: 105, column: 14, scope: !136)
!151 = !DILocation(line: 107, column: 64, scope: !131)
!152 = !DILocation(line: 108, column: 62, scope: !131)
!153 = !DILocation(line: 108, column: 5, scope: !131)
!154 = !DILocation(line: 109, column: 1, scope: !131)
