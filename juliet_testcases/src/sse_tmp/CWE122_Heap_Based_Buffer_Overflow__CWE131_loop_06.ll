; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !46
  %cmp1 = icmp ult i64 %3, 10, !dbg !48
  br i1 %cmp1, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !52
  %5 = load i32, i32* %arrayidx, align 4, !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %7 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !53
  store i32 %5, i32* %arrayidx2, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %8, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !62
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !62
  call void @printIntLine(i32 %10), !dbg !63
  %11 = load i32*, i32** %data, align 8, !dbg !64
  %12 = bitcast i32* %11 to i8*, !dbg !64
  call void @free(i8* %12) #6, !dbg !65
  ret void, !dbg !66
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !95
  %0 = bitcast i8* %call to i32*, !dbg !98
  store i32* %0, i32** %data, align 8, !dbg !99
  %1 = load i32*, i32** %data, align 8, !dbg !100
  %cmp = icmp eq i32* %1, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !110
  store i64 0, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !114
  %cmp1 = icmp ult i64 %3, 10, !dbg !116
  br i1 %cmp1, label %for.body, label %for.end, !dbg !117

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !120
  %5 = load i32, i32* %arrayidx, align 4, !dbg !120
  %6 = load i32*, i32** %data, align 8, !dbg !121
  %7 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !121
  store i32 %5, i32* %arrayidx2, align 4, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !125
  %inc = add i64 %8, 1, !dbg !125
  store i64 %inc, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !129
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !129
  call void @printIntLine(i32 %10), !dbg !130
  %11 = load i32*, i32** %data, align 8, !dbg !131
  %12 = bitcast i32* %11 to i8*, !dbg !131
  call void @free(i8* %12) #6, !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i32* null, i32** %data, align 8, !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !138
  %0 = bitcast i8* %call to i32*, !dbg !141
  store i32* %0, i32** %data, align 8, !dbg !142
  %1 = load i32*, i32** %data, align 8, !dbg !143
  %cmp = icmp eq i32* %1, null, !dbg !145
  br i1 %cmp, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !147
  unreachable, !dbg !147

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !149, metadata !DIExpression()), !dbg !151
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !157
  %cmp1 = icmp ult i64 %3, 10, !dbg !159
  br i1 %cmp1, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !163
  %5 = load i32, i32* %arrayidx, align 4, !dbg !163
  %6 = load i32*, i32** %data, align 8, !dbg !164
  %7 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !164
  store i32 %5, i32* %arrayidx2, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !168
  %inc = add i64 %8, 1, !dbg !168
  store i64 %inc, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !172
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !172
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !172
  call void @printIntLine(i32 %10), !dbg !173
  %11 = load i32*, i32** %data, align 8, !dbg !174
  %12 = bitcast i32* %11 to i8*, !dbg !174
  call void @free(i8* %12) #6, !dbg !175
  ret void, !dbg !176
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06_bad", scope: !15, file: !15, line: 25, type: !16, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 27, type: !4)
!19 = !DILocation(line: 27, column: 11, scope: !14)
!20 = !DILocation(line: 28, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 23, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 30, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 8)
!24 = !DILocation(line: 32, column: 16, scope: !22)
!25 = !DILocation(line: 32, column: 14, scope: !22)
!26 = !DILocation(line: 33, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 13)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 13, scope: !22)
!30 = !DILocation(line: 33, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 33, column: 27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !15, line: 36, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 36, column: 13, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 37, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 37, column: 16, scope: !33)
!43 = !DILocation(line: 39, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !15, line: 39, column: 9)
!45 = !DILocation(line: 39, column: 14, scope: !44)
!46 = !DILocation(line: 39, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !15, line: 39, column: 9)
!48 = !DILocation(line: 39, column: 23, scope: !47)
!49 = !DILocation(line: 39, column: 9, scope: !44)
!50 = !DILocation(line: 41, column: 30, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !15, line: 40, column: 9)
!52 = !DILocation(line: 41, column: 23, scope: !51)
!53 = !DILocation(line: 41, column: 13, scope: !51)
!54 = !DILocation(line: 41, column: 18, scope: !51)
!55 = !DILocation(line: 41, column: 21, scope: !51)
!56 = !DILocation(line: 42, column: 9, scope: !51)
!57 = !DILocation(line: 39, column: 30, scope: !47)
!58 = !DILocation(line: 39, column: 9, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 42, column: 9, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 43, column: 22, scope: !33)
!63 = !DILocation(line: 43, column: 9, scope: !33)
!64 = !DILocation(line: 44, column: 14, scope: !33)
!65 = !DILocation(line: 44, column: 9, scope: !33)
!66 = !DILocation(line: 46, column: 1, scope: !14)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_06_good", scope: !15, file: !15, line: 105, type: !16, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 107, column: 5, scope: !67)
!69 = !DILocation(line: 108, column: 5, scope: !67)
!70 = !DILocation(line: 109, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 121, type: !72, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!5, !5, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 121, type: !5)
!78 = !DILocation(line: 121, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 121, type: !74)
!80 = !DILocation(line: 121, column: 27, scope: !71)
!81 = !DILocation(line: 124, column: 22, scope: !71)
!82 = !DILocation(line: 124, column: 12, scope: !71)
!83 = !DILocation(line: 124, column: 5, scope: !71)
!84 = !DILocation(line: 126, column: 5, scope: !71)
!85 = !DILocation(line: 127, column: 5, scope: !71)
!86 = !DILocation(line: 128, column: 5, scope: !71)
!87 = !DILocation(line: 131, column: 5, scope: !71)
!88 = !DILocation(line: 132, column: 5, scope: !71)
!89 = !DILocation(line: 133, column: 5, scope: !71)
!90 = !DILocation(line: 135, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !15, line: 55, type: !4)
!93 = !DILocation(line: 55, column: 11, scope: !91)
!94 = !DILocation(line: 56, column: 10, scope: !91)
!95 = !DILocation(line: 65, column: 23, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !15, line: 63, column: 5)
!97 = distinct !DILexicalBlock(scope: !91, file: !15, line: 57, column: 8)
!98 = !DILocation(line: 65, column: 16, scope: !96)
!99 = !DILocation(line: 65, column: 14, scope: !96)
!100 = !DILocation(line: 66, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !15, line: 66, column: 13)
!102 = !DILocation(line: 66, column: 18, scope: !101)
!103 = !DILocation(line: 66, column: 13, scope: !96)
!104 = !DILocation(line: 66, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 66, column: 27)
!106 = !DILocalVariable(name: "source", scope: !107, file: !15, line: 69, type: !34)
!107 = distinct !DILexicalBlock(scope: !91, file: !15, line: 68, column: 5)
!108 = !DILocation(line: 69, column: 13, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !107, file: !15, line: 70, type: !39)
!110 = !DILocation(line: 70, column: 16, scope: !107)
!111 = !DILocation(line: 72, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !15, line: 72, column: 9)
!113 = !DILocation(line: 72, column: 14, scope: !112)
!114 = !DILocation(line: 72, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 72, column: 9)
!116 = !DILocation(line: 72, column: 23, scope: !115)
!117 = !DILocation(line: 72, column: 9, scope: !112)
!118 = !DILocation(line: 74, column: 30, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 73, column: 9)
!120 = !DILocation(line: 74, column: 23, scope: !119)
!121 = !DILocation(line: 74, column: 13, scope: !119)
!122 = !DILocation(line: 74, column: 18, scope: !119)
!123 = !DILocation(line: 74, column: 21, scope: !119)
!124 = !DILocation(line: 75, column: 9, scope: !119)
!125 = !DILocation(line: 72, column: 30, scope: !115)
!126 = !DILocation(line: 72, column: 9, scope: !115)
!127 = distinct !{!127, !117, !128, !61}
!128 = !DILocation(line: 75, column: 9, scope: !112)
!129 = !DILocation(line: 76, column: 22, scope: !107)
!130 = !DILocation(line: 76, column: 9, scope: !107)
!131 = !DILocation(line: 77, column: 14, scope: !107)
!132 = !DILocation(line: 77, column: 9, scope: !107)
!133 = !DILocation(line: 79, column: 1, scope: !91)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !15, line: 84, type: !4)
!136 = !DILocation(line: 84, column: 11, scope: !134)
!137 = !DILocation(line: 85, column: 10, scope: !134)
!138 = !DILocation(line: 89, column: 23, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !15, line: 87, column: 5)
!140 = distinct !DILexicalBlock(scope: !134, file: !15, line: 86, column: 8)
!141 = !DILocation(line: 89, column: 16, scope: !139)
!142 = !DILocation(line: 89, column: 14, scope: !139)
!143 = !DILocation(line: 90, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !15, line: 90, column: 13)
!145 = !DILocation(line: 90, column: 18, scope: !144)
!146 = !DILocation(line: 90, column: 13, scope: !139)
!147 = !DILocation(line: 90, column: 28, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !15, line: 90, column: 27)
!149 = !DILocalVariable(name: "source", scope: !150, file: !15, line: 93, type: !34)
!150 = distinct !DILexicalBlock(scope: !134, file: !15, line: 92, column: 5)
!151 = !DILocation(line: 93, column: 13, scope: !150)
!152 = !DILocalVariable(name: "i", scope: !150, file: !15, line: 94, type: !39)
!153 = !DILocation(line: 94, column: 16, scope: !150)
!154 = !DILocation(line: 96, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !15, line: 96, column: 9)
!156 = !DILocation(line: 96, column: 14, scope: !155)
!157 = !DILocation(line: 96, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !15, line: 96, column: 9)
!159 = !DILocation(line: 96, column: 23, scope: !158)
!160 = !DILocation(line: 96, column: 9, scope: !155)
!161 = !DILocation(line: 98, column: 30, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !15, line: 97, column: 9)
!163 = !DILocation(line: 98, column: 23, scope: !162)
!164 = !DILocation(line: 98, column: 13, scope: !162)
!165 = !DILocation(line: 98, column: 18, scope: !162)
!166 = !DILocation(line: 98, column: 21, scope: !162)
!167 = !DILocation(line: 99, column: 9, scope: !162)
!168 = !DILocation(line: 96, column: 30, scope: !158)
!169 = !DILocation(line: 96, column: 9, scope: !158)
!170 = distinct !{!170, !160, !171, !61}
!171 = !DILocation(line: 99, column: 9, scope: !155)
!172 = !DILocation(line: 100, column: 22, scope: !150)
!173 = !DILocation(line: 100, column: 9, scope: !150)
!174 = !DILocation(line: 101, column: 14, scope: !150)
!175 = !DILocation(line: 101, column: 9, scope: !150)
!176 = !DILocation(line: 103, column: 1, scope: !134)
