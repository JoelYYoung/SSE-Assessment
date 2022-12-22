; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i32*, i32** %data, align 8, !dbg !33
  store i32* %2, i32** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !35
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !36
  store i32* %3, i32** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !51
  %cmp2 = icmp ult i64 %5, 10, !dbg !53
  br i1 %cmp2, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !57
  %7 = load i32, i32* %arrayidx, align 4, !dbg !57
  %8 = load i32*, i32** %data1, align 8, !dbg !58
  %9 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !58
  store i32 %7, i32* %arrayidx3, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %10, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !67
  %12 = load i32, i32* %arrayidx4, align 4, !dbg !67
  call void @printIntLine(i32 %12), !dbg !68
  %13 = load i32*, i32** %data1, align 8, !dbg !69
  %14 = bitcast i32* %13 to i8*, !dbg !69
  call void @free(i8* %14) #6, !dbg !70
  ret void, !dbg !71
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32* null, i32** %data, align 8, !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !99
  %0 = bitcast i8* %call to i32*, !dbg !100
  store i32* %0, i32** %data, align 8, !dbg !101
  %1 = load i32*, i32** %data, align 8, !dbg !102
  %cmp = icmp eq i32* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = load i32*, i32** %data, align 8, !dbg !111
  store i32* %2, i32** %dataCopy, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !112, metadata !DIExpression()), !dbg !113
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !114
  store i32* %3, i32** %data1, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !123
  %cmp2 = icmp ult i64 %5, 10, !dbg !125
  br i1 %cmp2, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !129
  %7 = load i32, i32* %arrayidx, align 4, !dbg !129
  %8 = load i32*, i32** %data1, align 8, !dbg !130
  %9 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !130
  store i32 %7, i32* %arrayidx3, align 4, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %10, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !138
  %12 = load i32, i32* %arrayidx4, align 4, !dbg !138
  call void @printIntLine(i32 %12), !dbg !139
  %13 = load i32*, i32** %data1, align 8, !dbg !140
  %14 = bitcast i32* %13 to i8*, !dbg !140
  call void @free(i8* %14) #6, !dbg !141
  ret void, !dbg !142
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31.c", directory: "/root/SSE-Assessment")
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
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !15, line: 29, type: !4)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!32 = !DILocation(line: 29, column: 15, scope: !31)
!33 = !DILocation(line: 29, column: 26, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !15, line: 30, type: !4)
!35 = !DILocation(line: 30, column: 15, scope: !31)
!36 = !DILocation(line: 30, column: 22, scope: !31)
!37 = !DILocalVariable(name: "source", scope: !38, file: !15, line: 32, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !15, line: 31, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 10)
!42 = !DILocation(line: 32, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !15, line: 33, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 33, column: 20, scope: !38)
!48 = !DILocation(line: 35, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !15, line: 35, column: 13)
!50 = !DILocation(line: 35, column: 18, scope: !49)
!51 = !DILocation(line: 35, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !15, line: 35, column: 13)
!53 = !DILocation(line: 35, column: 27, scope: !52)
!54 = !DILocation(line: 35, column: 13, scope: !49)
!55 = !DILocation(line: 37, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !15, line: 36, column: 13)
!57 = !DILocation(line: 37, column: 27, scope: !56)
!58 = !DILocation(line: 37, column: 17, scope: !56)
!59 = !DILocation(line: 37, column: 22, scope: !56)
!60 = !DILocation(line: 37, column: 25, scope: !56)
!61 = !DILocation(line: 38, column: 13, scope: !56)
!62 = !DILocation(line: 35, column: 34, scope: !52)
!63 = !DILocation(line: 35, column: 13, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 38, column: 13, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 39, column: 26, scope: !38)
!68 = !DILocation(line: 39, column: 13, scope: !38)
!69 = !DILocation(line: 40, column: 18, scope: !38)
!70 = !DILocation(line: 40, column: 13, scope: !38)
!71 = !DILocation(line: 43, column: 1, scope: !14)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_31_good", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 76, column: 5, scope: !72)
!74 = !DILocation(line: 77, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 88, type: !76, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!5, !5, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 88, type: !5)
!82 = !DILocation(line: 88, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 88, type: !78)
!84 = !DILocation(line: 88, column: 27, scope: !75)
!85 = !DILocation(line: 91, column: 22, scope: !75)
!86 = !DILocation(line: 91, column: 12, scope: !75)
!87 = !DILocation(line: 91, column: 5, scope: !75)
!88 = !DILocation(line: 93, column: 5, scope: !75)
!89 = !DILocation(line: 94, column: 5, scope: !75)
!90 = !DILocation(line: 95, column: 5, scope: !75)
!91 = !DILocation(line: 98, column: 5, scope: !75)
!92 = !DILocation(line: 99, column: 5, scope: !75)
!93 = !DILocation(line: 100, column: 5, scope: !75)
!94 = !DILocation(line: 102, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !15, line: 52, type: !4)
!97 = !DILocation(line: 52, column: 11, scope: !95)
!98 = !DILocation(line: 53, column: 10, scope: !95)
!99 = !DILocation(line: 55, column: 19, scope: !95)
!100 = !DILocation(line: 55, column: 12, scope: !95)
!101 = !DILocation(line: 55, column: 10, scope: !95)
!102 = !DILocation(line: 56, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !95, file: !15, line: 56, column: 9)
!104 = !DILocation(line: 56, column: 14, scope: !103)
!105 = !DILocation(line: 56, column: 9, scope: !95)
!106 = !DILocation(line: 56, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 56, column: 23)
!108 = !DILocalVariable(name: "dataCopy", scope: !109, file: !15, line: 58, type: !4)
!109 = distinct !DILexicalBlock(scope: !95, file: !15, line: 57, column: 5)
!110 = !DILocation(line: 58, column: 15, scope: !109)
!111 = !DILocation(line: 58, column: 26, scope: !109)
!112 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 59, type: !4)
!113 = !DILocation(line: 59, column: 15, scope: !109)
!114 = !DILocation(line: 59, column: 22, scope: !109)
!115 = !DILocalVariable(name: "source", scope: !116, file: !15, line: 61, type: !39)
!116 = distinct !DILexicalBlock(scope: !109, file: !15, line: 60, column: 9)
!117 = !DILocation(line: 61, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !116, file: !15, line: 62, type: !44)
!119 = !DILocation(line: 62, column: 20, scope: !116)
!120 = !DILocation(line: 64, column: 20, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !15, line: 64, column: 13)
!122 = !DILocation(line: 64, column: 18, scope: !121)
!123 = !DILocation(line: 64, column: 25, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !15, line: 64, column: 13)
!125 = !DILocation(line: 64, column: 27, scope: !124)
!126 = !DILocation(line: 64, column: 13, scope: !121)
!127 = !DILocation(line: 66, column: 34, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 65, column: 13)
!129 = !DILocation(line: 66, column: 27, scope: !128)
!130 = !DILocation(line: 66, column: 17, scope: !128)
!131 = !DILocation(line: 66, column: 22, scope: !128)
!132 = !DILocation(line: 66, column: 25, scope: !128)
!133 = !DILocation(line: 67, column: 13, scope: !128)
!134 = !DILocation(line: 64, column: 34, scope: !124)
!135 = !DILocation(line: 64, column: 13, scope: !124)
!136 = distinct !{!136, !126, !137, !66}
!137 = !DILocation(line: 67, column: 13, scope: !121)
!138 = !DILocation(line: 68, column: 26, scope: !116)
!139 = !DILocation(line: 68, column: 13, scope: !116)
!140 = !DILocation(line: 69, column: 18, scope: !116)
!141 = !DILocation(line: 69, column: 13, scope: !116)
!142 = !DILocation(line: 72, column: 1, scope: !95)
