; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32*, i32** %data, align 8, !dbg !21
  %call = call i32* @badSource(i32* %0), !dbg !22
  store i32* %call, i32** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %2, 10, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !44
  %4 = load i32, i32* %arrayidx, align 4, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %6 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !45
  store i32 %4, i32* %arrayidx1, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %7, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !54
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !54
  call void @printIntLine(i32 %9), !dbg !55
  %10 = load i32*, i32** %data, align 8, !dbg !56
  %11 = bitcast i32* %10 to i8*, !dbg !56
  call void @free(i8* %11) #6, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !64
  %0 = bitcast i8* %call to i32*, !dbg !65
  store i32* %0, i32** %data.addr, align 8, !dbg !66
  %1 = load i32*, i32** %data.addr, align 8, !dbg !67
  %cmp = icmp eq i32* %1, null, !dbg !69
  br i1 %cmp, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !73
  ret i32* %2, !dbg !74
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #6, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #6, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32* null, i32** %data, align 8, !dbg !101
  %0 = load i32*, i32** %data, align 8, !dbg !102
  %call = call i32* @goodG2BSource(i32* %0), !dbg !103
  store i32* %call, i32** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !113
  %cmp = icmp ult i64 %2, 10, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !119
  %4 = load i32, i32* %arrayidx, align 4, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %6 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !120
  store i32 %4, i32* %arrayidx1, align 4, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %7, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !128
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !128
  call void @printIntLine(i32 %9), !dbg !129
  %10 = load i32*, i32** %data, align 8, !dbg !130
  %11 = bitcast i32* %10 to i8*, !dbg !130
  call void @free(i8* %11) #6, !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !133 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !134, metadata !DIExpression()), !dbg !135
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !136
  %0 = bitcast i8* %call to i32*, !dbg !137
  store i32* %0, i32** %data.addr, align 8, !dbg !138
  %1 = load i32*, i32** %data.addr, align 8, !dbg !139
  %cmp = icmp eq i32* %1, null, !dbg !141
  br i1 %cmp, label %if.then, label %if.end, !dbg !142

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !145
  ret i32* %2, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !5)
!19 = !DILocation(line: 31, column: 11, scope: !14)
!20 = !DILocation(line: 32, column: 10, scope: !14)
!21 = !DILocation(line: 33, column: 22, scope: !14)
!22 = !DILocation(line: 33, column: 12, scope: !14)
!23 = !DILocation(line: 33, column: 10, scope: !14)
!24 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 35, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 35, column: 13, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 36, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 36, column: 16, scope: !25)
!35 = !DILocation(line: 38, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !25, file: !15, line: 38, column: 9)
!37 = !DILocation(line: 38, column: 14, scope: !36)
!38 = !DILocation(line: 38, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !15, line: 38, column: 9)
!40 = !DILocation(line: 38, column: 23, scope: !39)
!41 = !DILocation(line: 38, column: 9, scope: !36)
!42 = !DILocation(line: 40, column: 30, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 39, column: 9)
!44 = !DILocation(line: 40, column: 23, scope: !43)
!45 = !DILocation(line: 40, column: 13, scope: !43)
!46 = !DILocation(line: 40, column: 18, scope: !43)
!47 = !DILocation(line: 40, column: 21, scope: !43)
!48 = !DILocation(line: 41, column: 9, scope: !43)
!49 = !DILocation(line: 38, column: 30, scope: !39)
!50 = !DILocation(line: 38, column: 9, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 41, column: 9, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 42, column: 22, scope: !25)
!55 = !DILocation(line: 42, column: 9, scope: !25)
!56 = !DILocation(line: 43, column: 14, scope: !25)
!57 = !DILocation(line: 43, column: 9, scope: !25)
!58 = !DILocation(line: 45, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 21, type: !60, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!5, !5}
!62 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !15, line: 21, type: !5)
!63 = !DILocation(line: 21, column: 30, scope: !59)
!64 = !DILocation(line: 24, column: 19, scope: !59)
!65 = !DILocation(line: 24, column: 12, scope: !59)
!66 = !DILocation(line: 24, column: 10, scope: !59)
!67 = !DILocation(line: 25, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !59, file: !15, line: 25, column: 9)
!69 = !DILocation(line: 25, column: 14, scope: !68)
!70 = !DILocation(line: 25, column: 9, scope: !59)
!71 = !DILocation(line: 25, column: 24, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !15, line: 25, column: 23)
!73 = !DILocation(line: 26, column: 12, scope: !59)
!74 = !DILocation(line: 26, column: 5, scope: !59)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_42_good", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 80, column: 5, scope: !75)
!77 = !DILocation(line: 81, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 93, type: !79, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!6, !6, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !15, line: 93, type: !6)
!85 = !DILocation(line: 93, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !15, line: 93, type: !81)
!87 = !DILocation(line: 93, column: 27, scope: !78)
!88 = !DILocation(line: 96, column: 22, scope: !78)
!89 = !DILocation(line: 96, column: 12, scope: !78)
!90 = !DILocation(line: 96, column: 5, scope: !78)
!91 = !DILocation(line: 98, column: 5, scope: !78)
!92 = !DILocation(line: 99, column: 5, scope: !78)
!93 = !DILocation(line: 100, column: 5, scope: !78)
!94 = !DILocation(line: 103, column: 5, scope: !78)
!95 = !DILocation(line: 104, column: 5, scope: !78)
!96 = !DILocation(line: 105, column: 5, scope: !78)
!97 = !DILocation(line: 107, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 62, type: !5)
!100 = !DILocation(line: 62, column: 11, scope: !98)
!101 = !DILocation(line: 63, column: 10, scope: !98)
!102 = !DILocation(line: 64, column: 26, scope: !98)
!103 = !DILocation(line: 64, column: 12, scope: !98)
!104 = !DILocation(line: 64, column: 10, scope: !98)
!105 = !DILocalVariable(name: "source", scope: !106, file: !15, line: 66, type: !26)
!106 = distinct !DILexicalBlock(scope: !98, file: !15, line: 65, column: 5)
!107 = !DILocation(line: 66, column: 13, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !106, file: !15, line: 67, type: !31)
!109 = !DILocation(line: 67, column: 16, scope: !106)
!110 = !DILocation(line: 69, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !15, line: 69, column: 9)
!112 = !DILocation(line: 69, column: 14, scope: !111)
!113 = !DILocation(line: 69, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !15, line: 69, column: 9)
!115 = !DILocation(line: 69, column: 23, scope: !114)
!116 = !DILocation(line: 69, column: 9, scope: !111)
!117 = !DILocation(line: 71, column: 30, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 70, column: 9)
!119 = !DILocation(line: 71, column: 23, scope: !118)
!120 = !DILocation(line: 71, column: 13, scope: !118)
!121 = !DILocation(line: 71, column: 18, scope: !118)
!122 = !DILocation(line: 71, column: 21, scope: !118)
!123 = !DILocation(line: 72, column: 9, scope: !118)
!124 = !DILocation(line: 69, column: 30, scope: !114)
!125 = !DILocation(line: 69, column: 9, scope: !114)
!126 = distinct !{!126, !116, !127, !53}
!127 = !DILocation(line: 72, column: 9, scope: !111)
!128 = !DILocation(line: 73, column: 22, scope: !106)
!129 = !DILocation(line: 73, column: 9, scope: !106)
!130 = !DILocation(line: 74, column: 14, scope: !106)
!131 = !DILocation(line: 74, column: 9, scope: !106)
!132 = !DILocation(line: 76, column: 1, scope: !98)
!133 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 51, type: !60, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", arg: 1, scope: !133, file: !15, line: 51, type: !5)
!135 = !DILocation(line: 51, column: 34, scope: !133)
!136 = !DILocation(line: 54, column: 19, scope: !133)
!137 = !DILocation(line: 54, column: 12, scope: !133)
!138 = !DILocation(line: 54, column: 10, scope: !133)
!139 = !DILocation(line: 55, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !15, line: 55, column: 9)
!141 = !DILocation(line: 55, column: 14, scope: !140)
!142 = !DILocation(line: 55, column: 9, scope: !133)
!143 = !DILocation(line: 55, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 55, column: 23)
!145 = !DILocation(line: 56, column: 12, scope: !133)
!146 = !DILocation(line: 56, column: 5, scope: !133)
