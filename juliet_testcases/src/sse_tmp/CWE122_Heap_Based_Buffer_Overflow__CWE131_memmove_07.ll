; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32* null, i32** %data, align 8, !dbg !23
  %0 = load i32, i32* @staticFive, align 4, !dbg !24
  %cmp = icmp eq i32 %0, 5, !dbg !26
  br i1 %cmp, label %if.then, label %if.end3, !dbg !27

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !28
  %1 = bitcast i8* %call to i32*, !dbg !30
  store i32* %1, i32** %data, align 8, !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %cmp1 = icmp eq i32* %2, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !44
  %4 = load i32*, i32** %data, align 8, !dbg !45
  %5 = bitcast i32* %4 to i8*, !dbg !46
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !46
  %6 = bitcast i32* %arraydecay to i8*, !dbg !46
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !46
  %7 = load i32*, i32** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !47
  %8 = load i32, i32* %arrayidx, align 4, !dbg !47
  call void @printIntLine(i32 %8), !dbg !48
  %9 = load i32*, i32** %data, align 8, !dbg !49
  %10 = bitcast i32* %9 to i8*, !dbg !49
  call void @free(i8* %10) #7, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
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
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  %0 = load i32, i32* @staticFive, align 4, !dbg !80
  %cmp = icmp ne i32 %0, 5, !dbg !82
  br i1 %cmp, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end3, !dbg !86

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !87
  %1 = bitcast i8* %call to i32*, !dbg !89
  store i32* %1, i32** %data, align 8, !dbg !90
  %2 = load i32*, i32** %data, align 8, !dbg !91
  %cmp1 = icmp eq i32* %2, null, !dbg !93
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !94

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !99
  %4 = load i32*, i32** %data, align 8, !dbg !100
  %5 = bitcast i32* %4 to i8*, !dbg !101
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !101
  %6 = bitcast i32* %arraydecay to i8*, !dbg !101
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !102
  %8 = load i32, i32* %arrayidx, align 4, !dbg !102
  call void @printIntLine(i32 %8), !dbg !103
  %9 = load i32*, i32** %data, align 8, !dbg !104
  %10 = bitcast i32* %9 to i8*, !dbg !104
  call void @free(i8* %10) #7, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i32* null, i32** %data, align 8, !dbg !110
  %0 = load i32, i32* @staticFive, align 4, !dbg !111
  %cmp = icmp eq i32 %0, 5, !dbg !113
  br i1 %cmp, label %if.then, label %if.end3, !dbg !114

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !115
  %1 = bitcast i8* %call to i32*, !dbg !117
  store i32* %1, i32** %data, align 8, !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %cmp1 = icmp eq i32* %2, null, !dbg !121
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !122

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !125

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !128
  %4 = load i32*, i32** %data, align 8, !dbg !129
  %5 = bitcast i32* %4 to i8*, !dbg !130
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !130
  %6 = bitcast i32* %arraydecay to i8*, !dbg !130
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !130
  %7 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !131
  %8 = load i32, i32* %arrayidx, align 4, !dbg !131
  call void @printIntLine(i32 %8), !dbg !132
  %9 = load i32*, i32** %data, align 8, !dbg !133
  %10 = bitcast i32* %9 to i8*, !dbg !133
  call void @free(i8* %10) #7, !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07.c", directory: "/root/SSE-Assessment")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07_bad", scope: !11, file: !11, line: 27, type: !19, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !11, line: 29, type: !6)
!22 = !DILocation(line: 29, column: 11, scope: !18)
!23 = !DILocation(line: 30, column: 10, scope: !18)
!24 = !DILocation(line: 31, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !11, line: 31, column: 8)
!26 = !DILocation(line: 31, column: 18, scope: !25)
!27 = !DILocation(line: 31, column: 8, scope: !18)
!28 = !DILocation(line: 34, column: 23, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !11, line: 32, column: 5)
!30 = !DILocation(line: 34, column: 16, scope: !29)
!31 = !DILocation(line: 34, column: 14, scope: !29)
!32 = !DILocation(line: 35, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !11, line: 35, column: 13)
!34 = !DILocation(line: 35, column: 18, scope: !33)
!35 = !DILocation(line: 35, column: 13, scope: !29)
!36 = !DILocation(line: 35, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 35, column: 27)
!38 = !DILocation(line: 36, column: 5, scope: !29)
!39 = !DILocalVariable(name: "source", scope: !40, file: !11, line: 38, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !11, line: 37, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 10)
!44 = !DILocation(line: 38, column: 13, scope: !40)
!45 = !DILocation(line: 40, column: 17, scope: !40)
!46 = !DILocation(line: 40, column: 9, scope: !40)
!47 = !DILocation(line: 41, column: 22, scope: !40)
!48 = !DILocation(line: 41, column: 9, scope: !40)
!49 = !DILocation(line: 42, column: 14, scope: !40)
!50 = !DILocation(line: 42, column: 9, scope: !40)
!51 = !DILocation(line: 44, column: 1, scope: !18)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_07_good", scope: !11, file: !11, line: 95, type: !19, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 97, column: 5, scope: !52)
!54 = !DILocation(line: 98, column: 5, scope: !52)
!55 = !DILocation(line: 99, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 111, type: !57, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!7, !7, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !11, line: 111, type: !7)
!63 = !DILocation(line: 111, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !11, line: 111, type: !59)
!65 = !DILocation(line: 111, column: 27, scope: !56)
!66 = !DILocation(line: 114, column: 22, scope: !56)
!67 = !DILocation(line: 114, column: 12, scope: !56)
!68 = !DILocation(line: 114, column: 5, scope: !56)
!69 = !DILocation(line: 116, column: 5, scope: !56)
!70 = !DILocation(line: 117, column: 5, scope: !56)
!71 = !DILocation(line: 118, column: 5, scope: !56)
!72 = !DILocation(line: 121, column: 5, scope: !56)
!73 = !DILocation(line: 122, column: 5, scope: !56)
!74 = !DILocation(line: 123, column: 5, scope: !56)
!75 = !DILocation(line: 125, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !11, line: 53, type: !6)
!78 = !DILocation(line: 53, column: 11, scope: !76)
!79 = !DILocation(line: 54, column: 10, scope: !76)
!80 = !DILocation(line: 55, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !11, line: 55, column: 8)
!82 = !DILocation(line: 55, column: 18, scope: !81)
!83 = !DILocation(line: 55, column: 8, scope: !76)
!84 = !DILocation(line: 58, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !11, line: 56, column: 5)
!86 = !DILocation(line: 59, column: 5, scope: !85)
!87 = !DILocation(line: 63, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !11, line: 61, column: 5)
!89 = !DILocation(line: 63, column: 16, scope: !88)
!90 = !DILocation(line: 63, column: 14, scope: !88)
!91 = !DILocation(line: 64, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !11, line: 64, column: 13)
!93 = !DILocation(line: 64, column: 18, scope: !92)
!94 = !DILocation(line: 64, column: 13, scope: !88)
!95 = !DILocation(line: 64, column: 28, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !11, line: 64, column: 27)
!97 = !DILocalVariable(name: "source", scope: !98, file: !11, line: 67, type: !41)
!98 = distinct !DILexicalBlock(scope: !76, file: !11, line: 66, column: 5)
!99 = !DILocation(line: 67, column: 13, scope: !98)
!100 = !DILocation(line: 69, column: 17, scope: !98)
!101 = !DILocation(line: 69, column: 9, scope: !98)
!102 = !DILocation(line: 70, column: 22, scope: !98)
!103 = !DILocation(line: 70, column: 9, scope: !98)
!104 = !DILocation(line: 71, column: 14, scope: !98)
!105 = !DILocation(line: 71, column: 9, scope: !98)
!106 = !DILocation(line: 73, column: 1, scope: !76)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 76, type: !19, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !11, line: 78, type: !6)
!109 = !DILocation(line: 78, column: 11, scope: !107)
!110 = !DILocation(line: 79, column: 10, scope: !107)
!111 = !DILocation(line: 80, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !11, line: 80, column: 8)
!113 = !DILocation(line: 80, column: 18, scope: !112)
!114 = !DILocation(line: 80, column: 8, scope: !107)
!115 = !DILocation(line: 83, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !11, line: 81, column: 5)
!117 = !DILocation(line: 83, column: 16, scope: !116)
!118 = !DILocation(line: 83, column: 14, scope: !116)
!119 = !DILocation(line: 84, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !11, line: 84, column: 13)
!121 = !DILocation(line: 84, column: 18, scope: !120)
!122 = !DILocation(line: 84, column: 13, scope: !116)
!123 = !DILocation(line: 84, column: 28, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !11, line: 84, column: 27)
!125 = !DILocation(line: 85, column: 5, scope: !116)
!126 = !DILocalVariable(name: "source", scope: !127, file: !11, line: 87, type: !41)
!127 = distinct !DILexicalBlock(scope: !107, file: !11, line: 86, column: 5)
!128 = !DILocation(line: 87, column: 13, scope: !127)
!129 = !DILocation(line: 89, column: 17, scope: !127)
!130 = !DILocation(line: 89, column: 9, scope: !127)
!131 = !DILocation(line: 90, column: 22, scope: !127)
!132 = !DILocation(line: 90, column: 9, scope: !127)
!133 = !DILocation(line: 91, column: 14, scope: !127)
!134 = !DILocation(line: 91, column: 9, scope: !127)
!135 = !DILocation(line: 93, column: 1, scope: !107)
