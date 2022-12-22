; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_badData, align 8, !dbg !35
  call void @badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #5, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #5, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_badData, align 8, !dbg !64
  store i32* %0, i32** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !65, metadata !DIExpression()), !dbg !70
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !70
  call void @llvm.dbg.declare(metadata i64* %i, metadata !71, metadata !DIExpression()), !dbg !76
  store i64 0, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !80
  %cmp = icmp ult i64 %2, 100, !dbg !82
  br i1 %cmp, label %for.body, label %for.end, !dbg !83

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !86
  %4 = load i32, i32* %arrayidx, align 4, !dbg !86
  %5 = load i32*, i32** %data, align 8, !dbg !87
  %6 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !87
  store i32 %4, i32* %arrayidx1, align 4, !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !91
  %inc = add i64 %7, 1, !dbg !91
  store i64 %inc, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !96
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !96
  call void @printIntLine(i32 %9), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 200, align 16, !dbg !104
  %1 = bitcast i8* %0 to i32*, !dbg !105
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %2 = alloca i8, i64 400, align 16, !dbg !108
  %3 = bitcast i8* %2 to i32*, !dbg !109
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !107
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  store i32* %4, i32** %data, align 8, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_goodG2BData, align 8, !dbg !113
  call void @goodG2BSink(), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_goodG2BData, align 8, !dbg !119
  store i32* %0, i32** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %2, 100, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !135
  %4 = load i32, i32* %arrayidx, align 4, !dbg !135
  %5 = load i32*, i32** %data, align 8, !dbg !136
  %6 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !136
  store i32 %4, i32* %arrayidx1, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %7, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !144
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !144
  call void @printIntLine(i32 %9), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_badData", scope: !2, file: !12, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_goodG2BData", scope: !2, file: !12, line: 20, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45.c", directory: "/root/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_bad", scope: !12, file: !12, line: 41, type: !20, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 43, type: !6)
!23 = !DILocation(line: 43, column: 11, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 44, type: !6)
!25 = !DILocation(line: 44, column: 11, scope: !19)
!26 = !DILocation(line: 44, column: 34, scope: !19)
!27 = !DILocation(line: 44, column: 27, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 45, type: !6)
!29 = !DILocation(line: 45, column: 11, scope: !19)
!30 = !DILocation(line: 45, column: 35, scope: !19)
!31 = !DILocation(line: 45, column: 28, scope: !19)
!32 = !DILocation(line: 48, column: 12, scope: !19)
!33 = !DILocation(line: 48, column: 10, scope: !19)
!34 = !DILocation(line: 49, column: 77, scope: !19)
!35 = !DILocation(line: 49, column: 75, scope: !19)
!36 = !DILocation(line: 50, column: 5, scope: !19)
!37 = !DILocation(line: 51, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_45_good", scope: !12, file: !12, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 88, column: 5, scope: !38)
!40 = !DILocation(line: 89, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !42, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!7, !7, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 100, type: !7)
!48 = !DILocation(line: 100, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 100, type: !44)
!50 = !DILocation(line: 100, column: 27, scope: !41)
!51 = !DILocation(line: 103, column: 22, scope: !41)
!52 = !DILocation(line: 103, column: 12, scope: !41)
!53 = !DILocation(line: 103, column: 5, scope: !41)
!54 = !DILocation(line: 105, column: 5, scope: !41)
!55 = !DILocation(line: 106, column: 5, scope: !41)
!56 = !DILocation(line: 107, column: 5, scope: !41)
!57 = !DILocation(line: 110, column: 5, scope: !41)
!58 = !DILocation(line: 111, column: 5, scope: !41)
!59 = !DILocation(line: 112, column: 5, scope: !41)
!60 = !DILocation(line: 114, column: 5, scope: !41)
!61 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocalVariable(name: "data", scope: !61, file: !12, line: 26, type: !6)
!63 = !DILocation(line: 26, column: 11, scope: !61)
!64 = !DILocation(line: 26, column: 18, scope: !61)
!65 = !DILocalVariable(name: "source", scope: !66, file: !12, line: 28, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !12, line: 27, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 100)
!70 = !DILocation(line: 28, column: 13, scope: !66)
!71 = !DILocalVariable(name: "i", scope: !72, file: !12, line: 30, type: !73)
!72 = distinct !DILexicalBlock(scope: !66, file: !12, line: 29, column: 9)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !74, line: 46, baseType: !75)
!74 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!75 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!76 = !DILocation(line: 30, column: 20, scope: !72)
!77 = !DILocation(line: 32, column: 20, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !12, line: 32, column: 13)
!79 = !DILocation(line: 32, column: 18, scope: !78)
!80 = !DILocation(line: 32, column: 25, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !12, line: 32, column: 13)
!82 = !DILocation(line: 32, column: 27, scope: !81)
!83 = !DILocation(line: 32, column: 13, scope: !78)
!84 = !DILocation(line: 34, column: 34, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !12, line: 33, column: 13)
!86 = !DILocation(line: 34, column: 27, scope: !85)
!87 = !DILocation(line: 34, column: 17, scope: !85)
!88 = !DILocation(line: 34, column: 22, scope: !85)
!89 = !DILocation(line: 34, column: 25, scope: !85)
!90 = !DILocation(line: 35, column: 13, scope: !85)
!91 = !DILocation(line: 32, column: 35, scope: !81)
!92 = !DILocation(line: 32, column: 13, scope: !81)
!93 = distinct !{!93, !83, !94, !95}
!94 = !DILocation(line: 35, column: 13, scope: !78)
!95 = !{!"llvm.loop.mustprogress"}
!96 = !DILocation(line: 36, column: 26, scope: !72)
!97 = !DILocation(line: 36, column: 13, scope: !72)
!98 = !DILocation(line: 39, column: 1, scope: !61)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 75, type: !20, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 77, type: !6)
!101 = !DILocation(line: 77, column: 11, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 78, type: !6)
!103 = !DILocation(line: 78, column: 11, scope: !99)
!104 = !DILocation(line: 78, column: 34, scope: !99)
!105 = !DILocation(line: 78, column: 27, scope: !99)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 79, type: !6)
!107 = !DILocation(line: 79, column: 11, scope: !99)
!108 = !DILocation(line: 79, column: 35, scope: !99)
!109 = !DILocation(line: 79, column: 28, scope: !99)
!110 = !DILocation(line: 81, column: 12, scope: !99)
!111 = !DILocation(line: 81, column: 10, scope: !99)
!112 = !DILocation(line: 82, column: 81, scope: !99)
!113 = !DILocation(line: 82, column: 79, scope: !99)
!114 = !DILocation(line: 83, column: 5, scope: !99)
!115 = !DILocation(line: 84, column: 1, scope: !99)
!116 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 60, type: !6)
!118 = !DILocation(line: 60, column: 11, scope: !116)
!119 = !DILocation(line: 60, column: 18, scope: !116)
!120 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 62, type: !67)
!121 = distinct !DILexicalBlock(scope: !116, file: !12, line: 61, column: 5)
!122 = !DILocation(line: 62, column: 13, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 64, type: !73)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 63, column: 9)
!125 = !DILocation(line: 64, column: 20, scope: !124)
!126 = !DILocation(line: 66, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 66, column: 13)
!128 = !DILocation(line: 66, column: 18, scope: !127)
!129 = !DILocation(line: 66, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 66, column: 13)
!131 = !DILocation(line: 66, column: 27, scope: !130)
!132 = !DILocation(line: 66, column: 13, scope: !127)
!133 = !DILocation(line: 68, column: 34, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 67, column: 13)
!135 = !DILocation(line: 68, column: 27, scope: !134)
!136 = !DILocation(line: 68, column: 17, scope: !134)
!137 = !DILocation(line: 68, column: 22, scope: !134)
!138 = !DILocation(line: 68, column: 25, scope: !134)
!139 = !DILocation(line: 69, column: 13, scope: !134)
!140 = !DILocation(line: 66, column: 35, scope: !130)
!141 = !DILocation(line: 66, column: 13, scope: !130)
!142 = distinct !{!142, !132, !143, !95}
!143 = !DILocation(line: 69, column: 13, scope: !127)
!144 = !DILocation(line: 70, column: 26, scope: !124)
!145 = !DILocation(line: 70, column: 13, scope: !124)
!146 = !DILocation(line: 73, column: 1, scope: !116)
