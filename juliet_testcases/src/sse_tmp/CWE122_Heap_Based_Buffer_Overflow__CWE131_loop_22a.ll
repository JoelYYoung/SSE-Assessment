; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_badGlobal, align 4, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_badSource(i32* %0), !dbg !29
  store i32* %call, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %2, 10, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !51
  %4 = load i32, i32* %arrayidx, align 4, !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  %6 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !52
  store i32 %4, i32* %arrayidx1, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %7, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !61
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !61
  call void @printIntLine(i32 %9), !dbg !62
  %10 = load i32*, i32** %data, align 8, !dbg !63
  %11 = bitcast i32* %10 to i8*, !dbg !63
  call void @free(i8* %11) #5, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B1Global, align 4, !dbg !94
  %0 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B1Source(i32* %0), !dbg !96
  store i32* %call, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !100
  call void @llvm.dbg.declare(metadata i64* %i, metadata !101, metadata !DIExpression()), !dbg !102
  store i64 0, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !106
  %cmp = icmp ult i64 %2, 10, !dbg !108
  br i1 %cmp, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !110
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !112
  %4 = load i32, i32* %arrayidx, align 4, !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %6 = load i64, i64* %i, align 8, !dbg !114
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !113
  store i32 %4, i32* %arrayidx1, align 4, !dbg !115
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !117
  %inc = add i64 %7, 1, !dbg !117
  store i64 %inc, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !121
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !121
  call void @printIntLine(i32 %9), !dbg !122
  %10 = load i32*, i32** %data, align 8, !dbg !123
  %11 = bitcast i32* %10 to i8*, !dbg !123
  call void @free(i8* %11) #5, !dbg !124
  ret void, !dbg !125
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !126 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i32* null, i32** %data, align 8, !dbg !129
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B2Global, align 4, !dbg !130
  %0 = load i32*, i32** %data, align 8, !dbg !131
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B2Source(i32* %0), !dbg !132
  store i32* %call, i32** %data, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !142
  %cmp = icmp ult i64 %2, 10, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !148
  %4 = load i32, i32* %arrayidx, align 4, !dbg !148
  %5 = load i32*, i32** %data, align 8, !dbg !149
  %6 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !149
  store i32 %4, i32* %arrayidx1, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %7, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !157
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !157
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !157
  call void @printIntLine(i32 %9), !dbg !158
  %10 = load i32*, i32** %data, align 8, !dbg !159
  %11 = bitcast i32* %10 to i8*, !dbg !159
  call void @free(i8* %11) #5, !dbg !160
  ret void, !dbg !161
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_badGlobal", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B1Global", scope: !2, file: !10, line: 50, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_goodG2B2Global", scope: !2, file: !10, line: 51, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_bad", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!25 = !DILocation(line: 28, column: 11, scope: !20)
!26 = !DILocation(line: 29, column: 10, scope: !20)
!27 = !DILocation(line: 30, column: 65, scope: !20)
!28 = !DILocation(line: 31, column: 72, scope: !20)
!29 = !DILocation(line: 31, column: 12, scope: !20)
!30 = !DILocation(line: 31, column: 10, scope: !20)
!31 = !DILocalVariable(name: "source", scope: !32, file: !10, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !20, file: !10, line: 32, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 10)
!36 = !DILocation(line: 33, column: 13, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !10, line: 34, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 34, column: 16, scope: !32)
!42 = !DILocation(line: 36, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !32, file: !10, line: 36, column: 9)
!44 = !DILocation(line: 36, column: 14, scope: !43)
!45 = !DILocation(line: 36, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !10, line: 36, column: 9)
!47 = !DILocation(line: 36, column: 23, scope: !46)
!48 = !DILocation(line: 36, column: 9, scope: !43)
!49 = !DILocation(line: 38, column: 30, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !10, line: 37, column: 9)
!51 = !DILocation(line: 38, column: 23, scope: !50)
!52 = !DILocation(line: 38, column: 13, scope: !50)
!53 = !DILocation(line: 38, column: 18, scope: !50)
!54 = !DILocation(line: 38, column: 21, scope: !50)
!55 = !DILocation(line: 39, column: 9, scope: !50)
!56 = !DILocation(line: 36, column: 30, scope: !46)
!57 = !DILocation(line: 36, column: 9, scope: !46)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 39, column: 9, scope: !43)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 40, column: 22, scope: !32)
!62 = !DILocation(line: 40, column: 9, scope: !32)
!63 = !DILocation(line: 41, column: 14, scope: !32)
!64 = !DILocation(line: 41, column: 9, scope: !32)
!65 = !DILocation(line: 43, column: 1, scope: !20)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_22_good", scope: !10, file: !10, line: 97, type: !21, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 99, column: 5, scope: !66)
!68 = !DILocation(line: 100, column: 5, scope: !66)
!69 = !DILocation(line: 101, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 113, type: !71, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!11, !11, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !10, line: 113, type: !11)
!77 = !DILocation(line: 113, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !10, line: 113, type: !73)
!79 = !DILocation(line: 113, column: 27, scope: !70)
!80 = !DILocation(line: 116, column: 22, scope: !70)
!81 = !DILocation(line: 116, column: 12, scope: !70)
!82 = !DILocation(line: 116, column: 5, scope: !70)
!83 = !DILocation(line: 118, column: 5, scope: !70)
!84 = !DILocation(line: 119, column: 5, scope: !70)
!85 = !DILocation(line: 120, column: 5, scope: !70)
!86 = !DILocation(line: 123, column: 5, scope: !70)
!87 = !DILocation(line: 124, column: 5, scope: !70)
!88 = !DILocation(line: 125, column: 5, scope: !70)
!89 = !DILocation(line: 127, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 56, type: !21, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !10, line: 58, type: !24)
!92 = !DILocation(line: 58, column: 11, scope: !90)
!93 = !DILocation(line: 59, column: 10, scope: !90)
!94 = !DILocation(line: 60, column: 70, scope: !90)
!95 = !DILocation(line: 61, column: 77, scope: !90)
!96 = !DILocation(line: 61, column: 12, scope: !90)
!97 = !DILocation(line: 61, column: 10, scope: !90)
!98 = !DILocalVariable(name: "source", scope: !99, file: !10, line: 63, type: !33)
!99 = distinct !DILexicalBlock(scope: !90, file: !10, line: 62, column: 5)
!100 = !DILocation(line: 63, column: 13, scope: !99)
!101 = !DILocalVariable(name: "i", scope: !99, file: !10, line: 64, type: !38)
!102 = !DILocation(line: 64, column: 16, scope: !99)
!103 = !DILocation(line: 66, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !10, line: 66, column: 9)
!105 = !DILocation(line: 66, column: 14, scope: !104)
!106 = !DILocation(line: 66, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !10, line: 66, column: 9)
!108 = !DILocation(line: 66, column: 23, scope: !107)
!109 = !DILocation(line: 66, column: 9, scope: !104)
!110 = !DILocation(line: 68, column: 30, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !10, line: 67, column: 9)
!112 = !DILocation(line: 68, column: 23, scope: !111)
!113 = !DILocation(line: 68, column: 13, scope: !111)
!114 = !DILocation(line: 68, column: 18, scope: !111)
!115 = !DILocation(line: 68, column: 21, scope: !111)
!116 = !DILocation(line: 69, column: 9, scope: !111)
!117 = !DILocation(line: 66, column: 30, scope: !107)
!118 = !DILocation(line: 66, column: 9, scope: !107)
!119 = distinct !{!119, !109, !120, !60}
!120 = !DILocation(line: 69, column: 9, scope: !104)
!121 = !DILocation(line: 70, column: 22, scope: !99)
!122 = !DILocation(line: 70, column: 9, scope: !99)
!123 = !DILocation(line: 71, column: 14, scope: !99)
!124 = !DILocation(line: 71, column: 9, scope: !99)
!125 = !DILocation(line: 73, column: 1, scope: !90)
!126 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocalVariable(name: "data", scope: !126, file: !10, line: 80, type: !24)
!128 = !DILocation(line: 80, column: 11, scope: !126)
!129 = !DILocation(line: 81, column: 10, scope: !126)
!130 = !DILocation(line: 82, column: 70, scope: !126)
!131 = !DILocation(line: 83, column: 77, scope: !126)
!132 = !DILocation(line: 83, column: 12, scope: !126)
!133 = !DILocation(line: 83, column: 10, scope: !126)
!134 = !DILocalVariable(name: "source", scope: !135, file: !10, line: 85, type: !33)
!135 = distinct !DILexicalBlock(scope: !126, file: !10, line: 84, column: 5)
!136 = !DILocation(line: 85, column: 13, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !135, file: !10, line: 86, type: !38)
!138 = !DILocation(line: 86, column: 16, scope: !135)
!139 = !DILocation(line: 88, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !10, line: 88, column: 9)
!141 = !DILocation(line: 88, column: 14, scope: !140)
!142 = !DILocation(line: 88, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !10, line: 88, column: 9)
!144 = !DILocation(line: 88, column: 23, scope: !143)
!145 = !DILocation(line: 88, column: 9, scope: !140)
!146 = !DILocation(line: 90, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !10, line: 89, column: 9)
!148 = !DILocation(line: 90, column: 23, scope: !147)
!149 = !DILocation(line: 90, column: 13, scope: !147)
!150 = !DILocation(line: 90, column: 18, scope: !147)
!151 = !DILocation(line: 90, column: 21, scope: !147)
!152 = !DILocation(line: 91, column: 9, scope: !147)
!153 = !DILocation(line: 88, column: 30, scope: !143)
!154 = !DILocation(line: 88, column: 9, scope: !143)
!155 = distinct !{!155, !145, !156, !60}
!156 = !DILocation(line: 91, column: 9, scope: !140)
!157 = !DILocation(line: 92, column: 22, scope: !135)
!158 = !DILocation(line: 92, column: 9, scope: !135)
!159 = !DILocation(line: 93, column: 14, scope: !135)
!160 = !DILocation(line: 93, column: 9, scope: !135)
!161 = !DILocation(line: 95, column: 1, scope: !126)
