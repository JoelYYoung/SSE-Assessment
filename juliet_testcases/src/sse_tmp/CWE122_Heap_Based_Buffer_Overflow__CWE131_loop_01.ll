; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %data, align 8, !dbg !23
  %1 = load i32*, i32** %data, align 8, !dbg !24
  %cmp = icmp eq i32* %1, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !44
  %cmp1 = icmp ult i64 %3, 10, !dbg !46
  br i1 %cmp1, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !50
  %5 = load i32, i32* %arrayidx, align 4, !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !51
  %7 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !51
  store i32 %5, i32* %arrayidx2, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %8, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !60
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !60
  call void @printIntLine(i32 %10), !dbg !61
  %11 = load i32*, i32** %data, align 8, !dbg !62
  %12 = bitcast i32* %11 to i8*, !dbg !62
  call void @free(i8* %12) #6, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !103
  call void @llvm.dbg.declare(metadata i64* %i, metadata !104, metadata !DIExpression()), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !109
  %cmp1 = icmp ult i64 %3, 10, !dbg !111
  br i1 %cmp1, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !115
  %5 = load i32, i32* %arrayidx, align 4, !dbg !115
  %6 = load i32*, i32** %data, align 8, !dbg !116
  %7 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !116
  store i32 %5, i32* %arrayidx2, align 4, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %8, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !124
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !124
  call void @printIntLine(i32 %10), !dbg !125
  %11 = load i32*, i32** %data, align 8, !dbg !126
  %12 = bitcast i32* %11 to i8*, !dbg !126
  call void @free(i8* %12) #6, !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 26, column: 19, scope: !14)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 26, column: 10, scope: !14)
!24 = !DILocation(line: 27, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!26 = !DILocation(line: 27, column: 14, scope: !25)
!27 = !DILocation(line: 27, column: 9, scope: !14)
!28 = !DILocation(line: 27, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 27, column: 23)
!30 = !DILocalVariable(name: "source", scope: !31, file: !15, line: 29, type: !32)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DILocation(line: 29, column: 13, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !15, line: 30, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 30, column: 16, scope: !31)
!41 = !DILocation(line: 32, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !31, file: !15, line: 32, column: 9)
!43 = !DILocation(line: 32, column: 14, scope: !42)
!44 = !DILocation(line: 32, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !15, line: 32, column: 9)
!46 = !DILocation(line: 32, column: 23, scope: !45)
!47 = !DILocation(line: 32, column: 9, scope: !42)
!48 = !DILocation(line: 34, column: 30, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !15, line: 33, column: 9)
!50 = !DILocation(line: 34, column: 23, scope: !49)
!51 = !DILocation(line: 34, column: 13, scope: !49)
!52 = !DILocation(line: 34, column: 18, scope: !49)
!53 = !DILocation(line: 34, column: 21, scope: !49)
!54 = !DILocation(line: 35, column: 9, scope: !49)
!55 = !DILocation(line: 32, column: 30, scope: !45)
!56 = !DILocation(line: 32, column: 9, scope: !45)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 35, column: 9, scope: !42)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 36, column: 22, scope: !31)
!61 = !DILocation(line: 36, column: 9, scope: !31)
!62 = !DILocation(line: 37, column: 14, scope: !31)
!63 = !DILocation(line: 37, column: 9, scope: !31)
!64 = !DILocation(line: 39, column: 1, scope: !14)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_good", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 68, column: 5, scope: !65)
!67 = !DILocation(line: 69, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 81, type: !69, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!5, !5, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !15, line: 81, type: !5)
!75 = !DILocation(line: 81, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !15, line: 81, type: !71)
!77 = !DILocation(line: 81, column: 27, scope: !68)
!78 = !DILocation(line: 84, column: 22, scope: !68)
!79 = !DILocation(line: 84, column: 12, scope: !68)
!80 = !DILocation(line: 84, column: 5, scope: !68)
!81 = !DILocation(line: 86, column: 5, scope: !68)
!82 = !DILocation(line: 87, column: 5, scope: !68)
!83 = !DILocation(line: 88, column: 5, scope: !68)
!84 = !DILocation(line: 91, column: 5, scope: !68)
!85 = !DILocation(line: 92, column: 5, scope: !68)
!86 = !DILocation(line: 93, column: 5, scope: !68)
!87 = !DILocation(line: 95, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 46, type: !16, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !15, line: 48, type: !4)
!90 = !DILocation(line: 48, column: 11, scope: !88)
!91 = !DILocation(line: 49, column: 10, scope: !88)
!92 = !DILocation(line: 51, column: 19, scope: !88)
!93 = !DILocation(line: 51, column: 12, scope: !88)
!94 = !DILocation(line: 51, column: 10, scope: !88)
!95 = !DILocation(line: 52, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !88, file: !15, line: 52, column: 9)
!97 = !DILocation(line: 52, column: 14, scope: !96)
!98 = !DILocation(line: 52, column: 9, scope: !88)
!99 = !DILocation(line: 52, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 52, column: 23)
!101 = !DILocalVariable(name: "source", scope: !102, file: !15, line: 54, type: !32)
!102 = distinct !DILexicalBlock(scope: !88, file: !15, line: 53, column: 5)
!103 = !DILocation(line: 54, column: 13, scope: !102)
!104 = !DILocalVariable(name: "i", scope: !102, file: !15, line: 55, type: !37)
!105 = !DILocation(line: 55, column: 16, scope: !102)
!106 = !DILocation(line: 57, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !15, line: 57, column: 9)
!108 = !DILocation(line: 57, column: 14, scope: !107)
!109 = !DILocation(line: 57, column: 21, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !15, line: 57, column: 9)
!111 = !DILocation(line: 57, column: 23, scope: !110)
!112 = !DILocation(line: 57, column: 9, scope: !107)
!113 = !DILocation(line: 59, column: 30, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 58, column: 9)
!115 = !DILocation(line: 59, column: 23, scope: !114)
!116 = !DILocation(line: 59, column: 13, scope: !114)
!117 = !DILocation(line: 59, column: 18, scope: !114)
!118 = !DILocation(line: 59, column: 21, scope: !114)
!119 = !DILocation(line: 60, column: 9, scope: !114)
!120 = !DILocation(line: 57, column: 30, scope: !110)
!121 = !DILocation(line: 57, column: 9, scope: !110)
!122 = distinct !{!122, !112, !123, !59}
!123 = !DILocation(line: 60, column: 9, scope: !107)
!124 = !DILocation(line: 61, column: 22, scope: !102)
!125 = !DILocation(line: 61, column: 9, scope: !102)
!126 = !DILocation(line: 62, column: 14, scope: !102)
!127 = !DILocation(line: 62, column: 9, scope: !102)
!128 = !DILocation(line: 64, column: 1, scope: !88)
