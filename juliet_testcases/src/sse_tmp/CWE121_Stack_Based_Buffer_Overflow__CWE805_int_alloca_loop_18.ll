; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  br label %source, !dbg !27

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !28), !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  store i32* %4, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !32, metadata !DIExpression()), !dbg !37
  %5 = bitcast [100 x i32]* %source1 to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %6, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %7, !dbg !53
  %8 = load i32, i32* %arrayidx, align 4, !dbg !53
  %9 = load i32*, i32** %data, align 8, !dbg !54
  %10 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !54
  store i32 %8, i32* %arrayidx2, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %11, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !63
  %13 = load i32, i32* %arrayidx3, align 4, !dbg !63
  call void @printIntLine(i32 %13), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 200, align 16, !dbg !94
  %1 = bitcast i8* %0 to i32*, !dbg !95
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %2 = alloca i8, i64 400, align 16, !dbg !98
  %3 = bitcast i8* %2 to i32*, !dbg !99
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !97
  br label %source, !dbg !100

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !101), !dbg !102
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !103
  store i32* %4, i32** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !105, metadata !DIExpression()), !dbg !107
  %5 = bitcast [100 x i32]* %source1 to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !110
  store i64 0, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !114
  %cmp = icmp ult i64 %6, 100, !dbg !116
  br i1 %cmp, label %for.body, label %for.end, !dbg !117

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %7, !dbg !120
  %8 = load i32, i32* %arrayidx, align 4, !dbg !120
  %9 = load i32*, i32** %data, align 8, !dbg !121
  %10 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !121
  store i32 %8, i32* %arrayidx2, align 4, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !125
  %inc = add i64 %11, 1, !dbg !125
  store i64 %inc, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !129
  %13 = load i32, i32* %arrayidx3, align 4, !dbg !129
  call void @printIntLine(i32 %13), !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 26, column: 5, scope: !13)
!28 = !DILabel(scope: !13, name: "source", file: !14, line: 27)
!29 = !DILocation(line: 27, column: 1, scope: !13)
!30 = !DILocation(line: 30, column: 12, scope: !13)
!31 = !DILocation(line: 30, column: 10, scope: !13)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 32, column: 13, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !14, line: 34, type: !40)
!39 = distinct !DILexicalBlock(scope: !33, file: !14, line: 33, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 34, column: 20, scope: !39)
!44 = !DILocation(line: 36, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !14, line: 36, column: 13)
!46 = !DILocation(line: 36, column: 18, scope: !45)
!47 = !DILocation(line: 36, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !14, line: 36, column: 13)
!49 = !DILocation(line: 36, column: 27, scope: !48)
!50 = !DILocation(line: 36, column: 13, scope: !45)
!51 = !DILocation(line: 38, column: 34, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !14, line: 37, column: 13)
!53 = !DILocation(line: 38, column: 27, scope: !52)
!54 = !DILocation(line: 38, column: 17, scope: !52)
!55 = !DILocation(line: 38, column: 22, scope: !52)
!56 = !DILocation(line: 38, column: 25, scope: !52)
!57 = !DILocation(line: 39, column: 13, scope: !52)
!58 = !DILocation(line: 36, column: 35, scope: !48)
!59 = !DILocation(line: 36, column: 13, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 39, column: 13, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 40, column: 26, scope: !39)
!64 = !DILocation(line: 40, column: 13, scope: !39)
!65 = !DILocation(line: 43, column: 1, scope: !13)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_18_good", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 75, column: 5, scope: !66)
!68 = !DILocation(line: 76, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 88, type: !70, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!5, !5, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !14, line: 88, type: !5)
!76 = !DILocation(line: 88, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !14, line: 88, type: !72)
!78 = !DILocation(line: 88, column: 27, scope: !69)
!79 = !DILocation(line: 91, column: 22, scope: !69)
!80 = !DILocation(line: 91, column: 12, scope: !69)
!81 = !DILocation(line: 91, column: 5, scope: !69)
!82 = !DILocation(line: 93, column: 5, scope: !69)
!83 = !DILocation(line: 94, column: 5, scope: !69)
!84 = !DILocation(line: 95, column: 5, scope: !69)
!85 = !DILocation(line: 98, column: 5, scope: !69)
!86 = !DILocation(line: 99, column: 5, scope: !69)
!87 = !DILocation(line: 100, column: 5, scope: !69)
!88 = !DILocation(line: 102, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !14, line: 52, type: !4)
!91 = !DILocation(line: 52, column: 11, scope: !89)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !14, line: 53, type: !4)
!93 = !DILocation(line: 53, column: 11, scope: !89)
!94 = !DILocation(line: 53, column: 34, scope: !89)
!95 = !DILocation(line: 53, column: 27, scope: !89)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !14, line: 54, type: !4)
!97 = !DILocation(line: 54, column: 11, scope: !89)
!98 = !DILocation(line: 54, column: 35, scope: !89)
!99 = !DILocation(line: 54, column: 28, scope: !89)
!100 = !DILocation(line: 55, column: 5, scope: !89)
!101 = !DILabel(scope: !89, name: "source", file: !14, line: 56)
!102 = !DILocation(line: 56, column: 1, scope: !89)
!103 = !DILocation(line: 58, column: 12, scope: !89)
!104 = !DILocation(line: 58, column: 10, scope: !89)
!105 = !DILocalVariable(name: "source", scope: !106, file: !14, line: 60, type: !34)
!106 = distinct !DILexicalBlock(scope: !89, file: !14, line: 59, column: 5)
!107 = !DILocation(line: 60, column: 13, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !109, file: !14, line: 62, type: !40)
!109 = distinct !DILexicalBlock(scope: !106, file: !14, line: 61, column: 9)
!110 = !DILocation(line: 62, column: 20, scope: !109)
!111 = !DILocation(line: 64, column: 20, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !14, line: 64, column: 13)
!113 = !DILocation(line: 64, column: 18, scope: !112)
!114 = !DILocation(line: 64, column: 25, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !14, line: 64, column: 13)
!116 = !DILocation(line: 64, column: 27, scope: !115)
!117 = !DILocation(line: 64, column: 13, scope: !112)
!118 = !DILocation(line: 66, column: 34, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !14, line: 65, column: 13)
!120 = !DILocation(line: 66, column: 27, scope: !119)
!121 = !DILocation(line: 66, column: 17, scope: !119)
!122 = !DILocation(line: 66, column: 22, scope: !119)
!123 = !DILocation(line: 66, column: 25, scope: !119)
!124 = !DILocation(line: 67, column: 13, scope: !119)
!125 = !DILocation(line: 64, column: 35, scope: !115)
!126 = !DILocation(line: 64, column: 13, scope: !115)
!127 = distinct !{!127, !117, !128, !62}
!128 = !DILocation(line: 67, column: 13, scope: !112)
!129 = !DILocation(line: 68, column: 26, scope: !109)
!130 = !DILocation(line: 68, column: 13, scope: !109)
!131 = !DILocation(line: 71, column: 1, scope: !89)
