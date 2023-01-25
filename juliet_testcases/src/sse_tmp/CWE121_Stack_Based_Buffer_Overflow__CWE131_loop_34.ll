; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %0 = alloca i8, i64 10, align 16, !dbg !27
  %1 = bitcast i8* %0 to i32*, !dbg !28
  store i32* %1, i32** %data, align 8, !dbg !29
  %2 = load i32*, i32** %data, align 8, !dbg !30
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !31
  store i32* %2, i32** %unionFirst, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !33, metadata !DIExpression()), !dbg !35
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !36
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !36
  store i32* %3, i32** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %5, 10, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !57
  %7 = load i32, i32* %arrayidx, align 4, !dbg !57
  %8 = load i32*, i32** %data1, align 8, !dbg !58
  %9 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !58
  store i32 %7, i32* %arrayidx2, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %10, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !67
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !67
  call void @printIntLine(i32 %12), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion, metadata !96, metadata !DIExpression()), !dbg !97
  store i32* null, i32** %data, align 8, !dbg !98
  %0 = alloca i8, i64 40, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %data, align 8, !dbg !101
  %2 = load i32*, i32** %data, align 8, !dbg !102
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !103
  store i32* %2, i32** %unionFirst, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !105, metadata !DIExpression()), !dbg !107
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !108
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !108
  store i32* %3, i32** %data1, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !117
  %cmp = icmp ult i64 %5, 10, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !123
  %7 = load i32, i32* %arrayidx, align 4, !dbg !123
  %8 = load i32*, i32** %data1, align 8, !dbg !124
  %9 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !124
  store i32 %7, i32* %arrayidx2, align 4, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %10, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !132
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !132
  call void @printIntLine(i32 %12), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_bad", scope: !14, file: !14, line: 27, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 29, type: !4)
!18 = !DILocation(line: 29, column: 11, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 30, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType", file: !14, line: 23, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 19, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 21, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 22, baseType: !4, size: 64)
!25 = !DILocation(line: 30, column: 66, scope: !13)
!26 = !DILocation(line: 31, column: 10, scope: !13)
!27 = !DILocation(line: 33, column: 19, scope: !13)
!28 = !DILocation(line: 33, column: 12, scope: !13)
!29 = !DILocation(line: 33, column: 10, scope: !13)
!30 = !DILocation(line: 34, column: 26, scope: !13)
!31 = !DILocation(line: 34, column: 13, scope: !13)
!32 = !DILocation(line: 34, column: 24, scope: !13)
!33 = !DILocalVariable(name: "data", scope: !34, file: !14, line: 36, type: !4)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!35 = !DILocation(line: 36, column: 15, scope: !34)
!36 = !DILocation(line: 36, column: 30, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !14, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !34, file: !14, line: 37, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 10)
!42 = !DILocation(line: 38, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !14, line: 39, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 39, column: 20, scope: !38)
!48 = !DILocation(line: 41, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !14, line: 41, column: 13)
!50 = !DILocation(line: 41, column: 18, scope: !49)
!51 = !DILocation(line: 41, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 41, column: 13)
!53 = !DILocation(line: 41, column: 27, scope: !52)
!54 = !DILocation(line: 41, column: 13, scope: !49)
!55 = !DILocation(line: 43, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 42, column: 13)
!57 = !DILocation(line: 43, column: 27, scope: !56)
!58 = !DILocation(line: 43, column: 17, scope: !56)
!59 = !DILocation(line: 43, column: 22, scope: !56)
!60 = !DILocation(line: 43, column: 25, scope: !56)
!61 = !DILocation(line: 44, column: 13, scope: !56)
!62 = !DILocation(line: 41, column: 34, scope: !52)
!63 = !DILocation(line: 41, column: 13, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 44, column: 13, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 45, column: 26, scope: !38)
!68 = !DILocation(line: 45, column: 13, scope: !38)
!69 = !DILocation(line: 48, column: 1, scope: !13)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_good", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 80, column: 5, scope: !70)
!72 = !DILocation(line: 81, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !74, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!5, !5, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !14, line: 92, type: !5)
!80 = !DILocation(line: 92, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !14, line: 92, type: !76)
!82 = !DILocation(line: 92, column: 27, scope: !73)
!83 = !DILocation(line: 95, column: 22, scope: !73)
!84 = !DILocation(line: 95, column: 12, scope: !73)
!85 = !DILocation(line: 95, column: 5, scope: !73)
!86 = !DILocation(line: 97, column: 5, scope: !73)
!87 = !DILocation(line: 98, column: 5, scope: !73)
!88 = !DILocation(line: 99, column: 5, scope: !73)
!89 = !DILocation(line: 102, column: 5, scope: !73)
!90 = !DILocation(line: 103, column: 5, scope: !73)
!91 = !DILocation(line: 104, column: 5, scope: !73)
!92 = !DILocation(line: 106, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 57, type: !4)
!95 = !DILocation(line: 57, column: 11, scope: !93)
!96 = !DILocalVariable(name: "myUnion", scope: !93, file: !14, line: 58, type: !20)
!97 = !DILocation(line: 58, column: 66, scope: !93)
!98 = !DILocation(line: 59, column: 10, scope: !93)
!99 = !DILocation(line: 61, column: 19, scope: !93)
!100 = !DILocation(line: 61, column: 12, scope: !93)
!101 = !DILocation(line: 61, column: 10, scope: !93)
!102 = !DILocation(line: 62, column: 26, scope: !93)
!103 = !DILocation(line: 62, column: 13, scope: !93)
!104 = !DILocation(line: 62, column: 24, scope: !93)
!105 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 64, type: !4)
!106 = distinct !DILexicalBlock(scope: !93, file: !14, line: 63, column: 5)
!107 = !DILocation(line: 64, column: 15, scope: !106)
!108 = !DILocation(line: 64, column: 30, scope: !106)
!109 = !DILocalVariable(name: "source", scope: !110, file: !14, line: 66, type: !39)
!110 = distinct !DILexicalBlock(scope: !106, file: !14, line: 65, column: 9)
!111 = !DILocation(line: 66, column: 17, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !110, file: !14, line: 67, type: !44)
!113 = !DILocation(line: 67, column: 20, scope: !110)
!114 = !DILocation(line: 69, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !14, line: 69, column: 13)
!116 = !DILocation(line: 69, column: 18, scope: !115)
!117 = !DILocation(line: 69, column: 25, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 69, column: 13)
!119 = !DILocation(line: 69, column: 27, scope: !118)
!120 = !DILocation(line: 69, column: 13, scope: !115)
!121 = !DILocation(line: 71, column: 34, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !14, line: 70, column: 13)
!123 = !DILocation(line: 71, column: 27, scope: !122)
!124 = !DILocation(line: 71, column: 17, scope: !122)
!125 = !DILocation(line: 71, column: 22, scope: !122)
!126 = !DILocation(line: 71, column: 25, scope: !122)
!127 = !DILocation(line: 72, column: 13, scope: !122)
!128 = !DILocation(line: 69, column: 34, scope: !118)
!129 = !DILocation(line: 69, column: 13, scope: !118)
!130 = distinct !{!130, !120, !131, !66}
!131 = !DILocation(line: 72, column: 13, scope: !115)
!132 = !DILocation(line: 73, column: 26, scope: !110)
!133 = !DILocation(line: 73, column: 13, scope: !110)
!134 = !DILocation(line: 76, column: 1, scope: !93)
