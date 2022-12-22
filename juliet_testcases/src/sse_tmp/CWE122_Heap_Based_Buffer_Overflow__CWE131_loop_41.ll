; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_badSink(i32* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !30
  store i64 0, i64* %i, align 8, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !34
  %cmp = icmp ult i64 %1, 10, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !38
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !40
  %3 = load i32, i32* %arrayidx, align 4, !dbg !40
  %4 = load i32*, i32** %data.addr, align 8, !dbg !41
  %5 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !41
  store i32 %3, i32* %arrayidx1, align 4, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !45
  %inc = add i64 %6, 1, !dbg !45
  store i64 %inc, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !50
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !50
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !50
  call void @printIntLine(i32 %8), !dbg !51
  %9 = load i32*, i32** %data.addr, align 8, !dbg !52
  %10 = bitcast i32* %9 to i8*, !dbg !52
  call void @free(i8* %10) #6, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_bad() #0 !dbg !55 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  store i32* null, i32** %data, align 8, !dbg !60
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !61
  %0 = bitcast i8* %call to i32*, !dbg !62
  store i32* %0, i32** %data, align 8, !dbg !63
  %1 = load i32*, i32** %data, align 8, !dbg !64
  %cmp = icmp eq i32* %1, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_badSink(i32* %2), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_goodG2BSink(i32* %data) #0 !dbg !73 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !76, metadata !DIExpression()), !dbg !78
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %i, metadata !79, metadata !DIExpression()), !dbg !80
  store i64 0, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !84
  %cmp = icmp ult i64 %1, 10, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !90
  %3 = load i32, i32* %arrayidx, align 4, !dbg !90
  %4 = load i32*, i32** %data.addr, align 8, !dbg !91
  %5 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !91
  store i32 %3, i32* %arrayidx1, align 4, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %6, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !99
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !99
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !99
  call void @printIntLine(i32 %8), !dbg !100
  %9 = load i32*, i32** %data.addr, align 8, !dbg !101
  %10 = bitcast i32* %9 to i8*, !dbg !101
  call void @free(i8* %10) #6, !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_good() #0 !dbg !104 {
entry:
  call void @goodG2B(), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !107 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !115, metadata !DIExpression()), !dbg !116
  %call = call i64 @time(i64* null) #6, !dbg !117
  %conv = trunc i64 %call to i32, !dbg !118
  call void @srand(i32 %conv) #6, !dbg !119
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_good(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !123
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_bad(), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !125
  ret i32 0, !dbg !126
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !127 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !128, metadata !DIExpression()), !dbg !129
  store i32* null, i32** %data, align 8, !dbg !130
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !131
  %0 = bitcast i8* %call to i32*, !dbg !132
  store i32* %0, i32** %data, align 8, !dbg !133
  %1 = load i32*, i32** %data, align 8, !dbg !134
  %cmp = icmp eq i32* %1, null, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !140
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_goodG2BSink(i32* %2), !dbg !141
  ret void, !dbg !142
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_badSink", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 21, type: !4)
!19 = !DILocation(line: 21, column: 70, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 24, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 23, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 24, column: 13, scope: !21)
!26 = !DILocalVariable(name: "i", scope: !21, file: !15, line: 25, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 46, baseType: !29)
!28 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 25, column: 16, scope: !21)
!31 = !DILocation(line: 27, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !21, file: !15, line: 27, column: 9)
!33 = !DILocation(line: 27, column: 14, scope: !32)
!34 = !DILocation(line: 27, column: 21, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !15, line: 27, column: 9)
!36 = !DILocation(line: 27, column: 23, scope: !35)
!37 = !DILocation(line: 27, column: 9, scope: !32)
!38 = !DILocation(line: 29, column: 30, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 28, column: 9)
!40 = !DILocation(line: 29, column: 23, scope: !39)
!41 = !DILocation(line: 29, column: 13, scope: !39)
!42 = !DILocation(line: 29, column: 18, scope: !39)
!43 = !DILocation(line: 29, column: 21, scope: !39)
!44 = !DILocation(line: 30, column: 9, scope: !39)
!45 = !DILocation(line: 27, column: 30, scope: !35)
!46 = !DILocation(line: 27, column: 9, scope: !35)
!47 = distinct !{!47, !37, !48, !49}
!48 = !DILocation(line: 30, column: 9, scope: !32)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 31, column: 22, scope: !21)
!51 = !DILocation(line: 31, column: 9, scope: !21)
!52 = !DILocation(line: 32, column: 14, scope: !21)
!53 = !DILocation(line: 32, column: 9, scope: !21)
!54 = !DILocation(line: 34, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_bad", scope: !15, file: !15, line: 36, type: !56, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null}
!58 = !DILocalVariable(name: "data", scope: !55, file: !15, line: 38, type: !4)
!59 = !DILocation(line: 38, column: 11, scope: !55)
!60 = !DILocation(line: 39, column: 10, scope: !55)
!61 = !DILocation(line: 41, column: 19, scope: !55)
!62 = !DILocation(line: 41, column: 12, scope: !55)
!63 = !DILocation(line: 41, column: 10, scope: !55)
!64 = !DILocation(line: 42, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !55, file: !15, line: 42, column: 9)
!66 = !DILocation(line: 42, column: 14, scope: !65)
!67 = !DILocation(line: 42, column: 9, scope: !55)
!68 = !DILocation(line: 42, column: 24, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 42, column: 23)
!70 = !DILocation(line: 43, column: 63, scope: !55)
!71 = !DILocation(line: 43, column: 5, scope: !55)
!72 = !DILocation(line: 44, column: 1, scope: !55)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_goodG2BSink", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", arg: 1, scope: !73, file: !15, line: 50, type: !4)
!75 = !DILocation(line: 50, column: 74, scope: !73)
!76 = !DILocalVariable(name: "source", scope: !77, file: !15, line: 53, type: !22)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 52, column: 5)
!78 = !DILocation(line: 53, column: 13, scope: !77)
!79 = !DILocalVariable(name: "i", scope: !77, file: !15, line: 54, type: !27)
!80 = !DILocation(line: 54, column: 16, scope: !77)
!81 = !DILocation(line: 56, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !15, line: 56, column: 9)
!83 = !DILocation(line: 56, column: 14, scope: !82)
!84 = !DILocation(line: 56, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !15, line: 56, column: 9)
!86 = !DILocation(line: 56, column: 23, scope: !85)
!87 = !DILocation(line: 56, column: 9, scope: !82)
!88 = !DILocation(line: 58, column: 30, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 57, column: 9)
!90 = !DILocation(line: 58, column: 23, scope: !89)
!91 = !DILocation(line: 58, column: 13, scope: !89)
!92 = !DILocation(line: 58, column: 18, scope: !89)
!93 = !DILocation(line: 58, column: 21, scope: !89)
!94 = !DILocation(line: 59, column: 9, scope: !89)
!95 = !DILocation(line: 56, column: 30, scope: !85)
!96 = !DILocation(line: 56, column: 9, scope: !85)
!97 = distinct !{!97, !87, !98, !49}
!98 = !DILocation(line: 59, column: 9, scope: !82)
!99 = !DILocation(line: 60, column: 22, scope: !77)
!100 = !DILocation(line: 60, column: 9, scope: !77)
!101 = !DILocation(line: 61, column: 14, scope: !77)
!102 = !DILocation(line: 61, column: 9, scope: !77)
!103 = !DILocation(line: 63, column: 1, scope: !73)
!104 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_41_good", scope: !15, file: !15, line: 76, type: !56, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocation(line: 78, column: 5, scope: !104)
!106 = !DILocation(line: 79, column: 1, scope: !104)
!107 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !108, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DISubroutineType(types: !109)
!109 = !{!5, !5, !110}
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!113 = !DILocalVariable(name: "argc", arg: 1, scope: !107, file: !15, line: 91, type: !5)
!114 = !DILocation(line: 91, column: 14, scope: !107)
!115 = !DILocalVariable(name: "argv", arg: 2, scope: !107, file: !15, line: 91, type: !110)
!116 = !DILocation(line: 91, column: 27, scope: !107)
!117 = !DILocation(line: 94, column: 22, scope: !107)
!118 = !DILocation(line: 94, column: 12, scope: !107)
!119 = !DILocation(line: 94, column: 5, scope: !107)
!120 = !DILocation(line: 96, column: 5, scope: !107)
!121 = !DILocation(line: 97, column: 5, scope: !107)
!122 = !DILocation(line: 98, column: 5, scope: !107)
!123 = !DILocation(line: 101, column: 5, scope: !107)
!124 = !DILocation(line: 102, column: 5, scope: !107)
!125 = !DILocation(line: 103, column: 5, scope: !107)
!126 = !DILocation(line: 105, column: 5, scope: !107)
!127 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 66, type: !56, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocalVariable(name: "data", scope: !127, file: !15, line: 68, type: !4)
!129 = !DILocation(line: 68, column: 11, scope: !127)
!130 = !DILocation(line: 69, column: 10, scope: !127)
!131 = !DILocation(line: 71, column: 19, scope: !127)
!132 = !DILocation(line: 71, column: 12, scope: !127)
!133 = !DILocation(line: 71, column: 10, scope: !127)
!134 = !DILocation(line: 72, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !127, file: !15, line: 72, column: 9)
!136 = !DILocation(line: 72, column: 14, scope: !135)
!137 = !DILocation(line: 72, column: 9, scope: !127)
!138 = !DILocation(line: 72, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !15, line: 72, column: 23)
!140 = !DILocation(line: 73, column: 67, scope: !127)
!141 = !DILocation(line: 73, column: 5, scope: !127)
!142 = !DILocation(line: 74, column: 1, scope: !127)
