; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !24
  %0 = bitcast i8* %call1 to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !34

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !35
  %2 = bitcast i8* %call3 to i32*, !dbg !37
  store i32* %2, i32** %data, align 8, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %cmp4 = icmp eq i32* %3, null, !dbg !41
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !42

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !43
  unreachable, !dbg !43

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %6 = bitcast i32* %5 to i8*, !dbg !52
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !52
  %7 = bitcast i32* %arraydecay to i8*, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !53
  %9 = load i32, i32* %arrayidx, align 4, !dbg !53
  call void @printIntLine(i32 %9), !dbg !54
  %10 = load i32*, i32** %data, align 8, !dbg !55
  %11 = bitcast i32* %10 to i8*, !dbg !55
  call void @free(i8* %11) #7, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printIntLine(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12_good() #0 !dbg !58 {
entry:
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32* null, i32** %data, align 8, !dbg !84
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !88
  %0 = bitcast i8* %call1 to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then2, label %if.end, !dbg !95

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !98

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !99
  %2 = bitcast i8* %call3 to i32*, !dbg !101
  store i32* %2, i32** %data, align 8, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %cmp4 = icmp eq i32* %3, null, !dbg !105
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !106

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !107
  unreachable, !dbg !107

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %6 = bitcast i32* %5 to i8*, !dbg !113
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !113
  %7 = bitcast i32* %arraydecay to i8*, !dbg !113
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !113
  %8 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !114
  %9 = load i32, i32* %arrayidx, align 4, !dbg !114
  call void @printIntLine(i32 %9), !dbg !115
  %10 = load i32*, i32** %data, align 8, !dbg !116
  %11 = bitcast i32* %10 to i8*, !dbg !116
  call void @free(i8* %11) #7, !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 25, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 8)
!23 = !DILocation(line: 25, column: 8, scope: !14)
!24 = !DILocation(line: 28, column: 23, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 26, column: 5)
!26 = !DILocation(line: 28, column: 16, scope: !25)
!27 = !DILocation(line: 28, column: 14, scope: !25)
!28 = !DILocation(line: 29, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 29, column: 13)
!30 = !DILocation(line: 29, column: 18, scope: !29)
!31 = !DILocation(line: 29, column: 13, scope: !25)
!32 = !DILocation(line: 29, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 27)
!34 = !DILocation(line: 30, column: 5, scope: !25)
!35 = !DILocation(line: 34, column: 23, scope: !36)
!36 = distinct !DILexicalBlock(scope: !22, file: !15, line: 32, column: 5)
!37 = !DILocation(line: 34, column: 16, scope: !36)
!38 = !DILocation(line: 34, column: 14, scope: !36)
!39 = !DILocation(line: 35, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 35, column: 13)
!41 = !DILocation(line: 35, column: 18, scope: !40)
!42 = !DILocation(line: 35, column: 13, scope: !36)
!43 = !DILocation(line: 35, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 35, column: 27)
!45 = !DILocalVariable(name: "source", scope: !46, file: !15, line: 38, type: !47)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 10)
!50 = !DILocation(line: 38, column: 13, scope: !46)
!51 = !DILocation(line: 40, column: 17, scope: !46)
!52 = !DILocation(line: 40, column: 9, scope: !46)
!53 = !DILocation(line: 41, column: 22, scope: !46)
!54 = !DILocation(line: 41, column: 9, scope: !46)
!55 = !DILocation(line: 42, column: 14, scope: !46)
!56 = !DILocation(line: 42, column: 9, scope: !46)
!57 = !DILocation(line: 44, column: 1, scope: !14)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_12_good", scope: !15, file: !15, line: 77, type: !16, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 79, column: 5, scope: !58)
!60 = !DILocation(line: 80, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 92, type: !62, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!5, !5, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !15, line: 92, type: !5)
!68 = !DILocation(line: 92, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !15, line: 92, type: !64)
!70 = !DILocation(line: 92, column: 27, scope: !61)
!71 = !DILocation(line: 95, column: 22, scope: !61)
!72 = !DILocation(line: 95, column: 12, scope: !61)
!73 = !DILocation(line: 95, column: 5, scope: !61)
!74 = !DILocation(line: 97, column: 5, scope: !61)
!75 = !DILocation(line: 98, column: 5, scope: !61)
!76 = !DILocation(line: 99, column: 5, scope: !61)
!77 = !DILocation(line: 102, column: 5, scope: !61)
!78 = !DILocation(line: 103, column: 5, scope: !61)
!79 = !DILocation(line: 104, column: 5, scope: !61)
!80 = !DILocation(line: 106, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 54, type: !4)
!83 = !DILocation(line: 54, column: 11, scope: !81)
!84 = !DILocation(line: 55, column: 10, scope: !81)
!85 = !DILocation(line: 56, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !15, line: 56, column: 8)
!87 = !DILocation(line: 56, column: 8, scope: !81)
!88 = !DILocation(line: 59, column: 23, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !15, line: 57, column: 5)
!90 = !DILocation(line: 59, column: 16, scope: !89)
!91 = !DILocation(line: 59, column: 14, scope: !89)
!92 = !DILocation(line: 60, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 60, column: 13)
!94 = !DILocation(line: 60, column: 18, scope: !93)
!95 = !DILocation(line: 60, column: 13, scope: !89)
!96 = !DILocation(line: 60, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 60, column: 27)
!98 = !DILocation(line: 61, column: 5, scope: !89)
!99 = !DILocation(line: 65, column: 23, scope: !100)
!100 = distinct !DILexicalBlock(scope: !86, file: !15, line: 63, column: 5)
!101 = !DILocation(line: 65, column: 16, scope: !100)
!102 = !DILocation(line: 65, column: 14, scope: !100)
!103 = !DILocation(line: 66, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 66, column: 13)
!105 = !DILocation(line: 66, column: 18, scope: !104)
!106 = !DILocation(line: 66, column: 13, scope: !100)
!107 = !DILocation(line: 66, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 66, column: 27)
!109 = !DILocalVariable(name: "source", scope: !110, file: !15, line: 69, type: !47)
!110 = distinct !DILexicalBlock(scope: !81, file: !15, line: 68, column: 5)
!111 = !DILocation(line: 69, column: 13, scope: !110)
!112 = !DILocation(line: 71, column: 17, scope: !110)
!113 = !DILocation(line: 71, column: 9, scope: !110)
!114 = !DILocation(line: 72, column: 22, scope: !110)
!115 = !DILocation(line: 72, column: 9, scope: !110)
!116 = !DILocation(line: 73, column: 14, scope: !110)
!117 = !DILocation(line: 73, column: 9, scope: !110)
!118 = !DILocation(line: 75, column: 1, scope: !81)
