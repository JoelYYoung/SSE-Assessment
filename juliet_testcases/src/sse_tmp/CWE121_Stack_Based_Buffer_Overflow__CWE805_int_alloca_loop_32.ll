; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !35
  %5 = load i32*, i32** %4, align 8, !dbg !36
  store i32* %5, i32** %data1, align 8, !dbg !34
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %6, i32** %data1, align 8, !dbg !38
  %7 = load i32*, i32** %data1, align 8, !dbg !39
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !40
  store i32* %7, i32** %8, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !45
  %10 = load i32*, i32** %9, align 8, !dbg !46
  store i32* %10, i32** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %11 = bitcast [100 x i32]* %source to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 400, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !62
  %cmp = icmp ult i64 %12, 100, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %13, !dbg !68
  %14 = load i32, i32* %arrayidx, align 4, !dbg !68
  %15 = load i32*, i32** %data2, align 8, !dbg !69
  %16 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !69
  store i32 %14, i32* %arrayidx3, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %17, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %18 = load i32*, i32** %data2, align 8, !dbg !78
  %arrayidx4 = getelementptr inbounds i32, i32* %18, i64 0, !dbg !78
  %19 = load i32, i32* %arrayidx4, align 4, !dbg !78
  call void @printIntLine(i32 %19), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !107, metadata !DIExpression()), !dbg !108
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !109, metadata !DIExpression()), !dbg !110
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 200, align 16, !dbg !113
  %1 = bitcast i8* %0 to i32*, !dbg !114
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = alloca i8, i64 400, align 16, !dbg !117
  %3 = bitcast i8* %2 to i32*, !dbg !118
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !119, metadata !DIExpression()), !dbg !121
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !122
  %5 = load i32*, i32** %4, align 8, !dbg !123
  store i32* %5, i32** %data1, align 8, !dbg !121
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !124
  store i32* %6, i32** %data1, align 8, !dbg !125
  %7 = load i32*, i32** %data1, align 8, !dbg !126
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !127
  store i32* %7, i32** %8, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !129, metadata !DIExpression()), !dbg !131
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !132
  %10 = load i32*, i32** %9, align 8, !dbg !133
  store i32* %10, i32** %data2, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  %11 = bitcast [100 x i32]* %source to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 400, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !143
  %cmp = icmp ult i64 %12, 100, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %13, !dbg !149
  %14 = load i32, i32* %arrayidx, align 4, !dbg !149
  %15 = load i32*, i32** %data2, align 8, !dbg !150
  %16 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx3 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !150
  store i32 %14, i32* %arrayidx3, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %17, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %18 = load i32*, i32** %data2, align 8, !dbg !158
  %arrayidx4 = getelementptr inbounds i32, i32* %18, i64 0, !dbg !158
  %19 = load i32, i32* %arrayidx4, align 4, !dbg !158
  call void @printIntLine(i32 %19), !dbg !159
  ret void, !dbg !160
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 24, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 24, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 25, type: !20)
!23 = !DILocation(line: 25, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!25 = !DILocation(line: 26, column: 11, scope: !13)
!26 = !DILocation(line: 26, column: 34, scope: !13)
!27 = !DILocation(line: 26, column: 27, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!29 = !DILocation(line: 27, column: 11, scope: !13)
!30 = !DILocation(line: 27, column: 35, scope: !13)
!31 = !DILocation(line: 27, column: 28, scope: !13)
!32 = !DILocalVariable(name: "data", scope: !33, file: !14, line: 29, type: !4)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 5)
!34 = !DILocation(line: 29, column: 15, scope: !33)
!35 = !DILocation(line: 29, column: 23, scope: !33)
!36 = !DILocation(line: 29, column: 22, scope: !33)
!37 = !DILocation(line: 32, column: 16, scope: !33)
!38 = !DILocation(line: 32, column: 14, scope: !33)
!39 = !DILocation(line: 33, column: 21, scope: !33)
!40 = !DILocation(line: 33, column: 10, scope: !33)
!41 = !DILocation(line: 33, column: 19, scope: !33)
!42 = !DILocalVariable(name: "data", scope: !43, file: !14, line: 36, type: !4)
!43 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!44 = !DILocation(line: 36, column: 15, scope: !43)
!45 = !DILocation(line: 36, column: 23, scope: !43)
!46 = !DILocation(line: 36, column: 22, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 38, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !14, line: 37, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 38, column: 17, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !54, file: !14, line: 40, type: !55)
!54 = distinct !DILexicalBlock(scope: !48, file: !14, line: 39, column: 13)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !56, line: 46, baseType: !57)
!56 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 40, column: 24, scope: !54)
!59 = !DILocation(line: 42, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !14, line: 42, column: 17)
!61 = !DILocation(line: 42, column: 22, scope: !60)
!62 = !DILocation(line: 42, column: 29, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !14, line: 42, column: 17)
!64 = !DILocation(line: 42, column: 31, scope: !63)
!65 = !DILocation(line: 42, column: 17, scope: !60)
!66 = !DILocation(line: 44, column: 38, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !14, line: 43, column: 17)
!68 = !DILocation(line: 44, column: 31, scope: !67)
!69 = !DILocation(line: 44, column: 21, scope: !67)
!70 = !DILocation(line: 44, column: 26, scope: !67)
!71 = !DILocation(line: 44, column: 29, scope: !67)
!72 = !DILocation(line: 45, column: 17, scope: !67)
!73 = !DILocation(line: 42, column: 39, scope: !63)
!74 = !DILocation(line: 42, column: 17, scope: !63)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 45, column: 17, scope: !60)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 46, column: 30, scope: !54)
!79 = !DILocation(line: 46, column: 17, scope: !54)
!80 = !DILocation(line: 50, column: 1, scope: !13)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_32_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 89, column: 5, scope: !81)
!83 = !DILocation(line: 90, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 101, type: !85, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!5, !5, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !14, line: 101, type: !5)
!91 = !DILocation(line: 101, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !14, line: 101, type: !87)
!93 = !DILocation(line: 101, column: 27, scope: !84)
!94 = !DILocation(line: 104, column: 22, scope: !84)
!95 = !DILocation(line: 104, column: 12, scope: !84)
!96 = !DILocation(line: 104, column: 5, scope: !84)
!97 = !DILocation(line: 106, column: 5, scope: !84)
!98 = !DILocation(line: 107, column: 5, scope: !84)
!99 = !DILocation(line: 108, column: 5, scope: !84)
!100 = !DILocation(line: 111, column: 5, scope: !84)
!101 = !DILocation(line: 112, column: 5, scope: !84)
!102 = !DILocation(line: 113, column: 5, scope: !84)
!103 = !DILocation(line: 115, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 59, type: !4)
!106 = !DILocation(line: 59, column: 11, scope: !104)
!107 = !DILocalVariable(name: "dataPtr1", scope: !104, file: !14, line: 60, type: !20)
!108 = !DILocation(line: 60, column: 12, scope: !104)
!109 = !DILocalVariable(name: "dataPtr2", scope: !104, file: !14, line: 61, type: !20)
!110 = !DILocation(line: 61, column: 12, scope: !104)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !14, line: 62, type: !4)
!112 = !DILocation(line: 62, column: 11, scope: !104)
!113 = !DILocation(line: 62, column: 34, scope: !104)
!114 = !DILocation(line: 62, column: 27, scope: !104)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !14, line: 63, type: !4)
!116 = !DILocation(line: 63, column: 11, scope: !104)
!117 = !DILocation(line: 63, column: 35, scope: !104)
!118 = !DILocation(line: 63, column: 28, scope: !104)
!119 = !DILocalVariable(name: "data", scope: !120, file: !14, line: 65, type: !4)
!120 = distinct !DILexicalBlock(scope: !104, file: !14, line: 64, column: 5)
!121 = !DILocation(line: 65, column: 15, scope: !120)
!122 = !DILocation(line: 65, column: 23, scope: !120)
!123 = !DILocation(line: 65, column: 22, scope: !120)
!124 = !DILocation(line: 67, column: 16, scope: !120)
!125 = !DILocation(line: 67, column: 14, scope: !120)
!126 = !DILocation(line: 68, column: 21, scope: !120)
!127 = !DILocation(line: 68, column: 10, scope: !120)
!128 = !DILocation(line: 68, column: 19, scope: !120)
!129 = !DILocalVariable(name: "data", scope: !130, file: !14, line: 71, type: !4)
!130 = distinct !DILexicalBlock(scope: !104, file: !14, line: 70, column: 5)
!131 = !DILocation(line: 71, column: 15, scope: !130)
!132 = !DILocation(line: 71, column: 23, scope: !130)
!133 = !DILocation(line: 71, column: 22, scope: !130)
!134 = !DILocalVariable(name: "source", scope: !135, file: !14, line: 73, type: !49)
!135 = distinct !DILexicalBlock(scope: !130, file: !14, line: 72, column: 9)
!136 = !DILocation(line: 73, column: 17, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !138, file: !14, line: 75, type: !55)
!138 = distinct !DILexicalBlock(scope: !135, file: !14, line: 74, column: 13)
!139 = !DILocation(line: 75, column: 24, scope: !138)
!140 = !DILocation(line: 77, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !14, line: 77, column: 17)
!142 = !DILocation(line: 77, column: 22, scope: !141)
!143 = !DILocation(line: 77, column: 29, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !14, line: 77, column: 17)
!145 = !DILocation(line: 77, column: 31, scope: !144)
!146 = !DILocation(line: 77, column: 17, scope: !141)
!147 = !DILocation(line: 79, column: 38, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !14, line: 78, column: 17)
!149 = !DILocation(line: 79, column: 31, scope: !148)
!150 = !DILocation(line: 79, column: 21, scope: !148)
!151 = !DILocation(line: 79, column: 26, scope: !148)
!152 = !DILocation(line: 79, column: 29, scope: !148)
!153 = !DILocation(line: 80, column: 17, scope: !148)
!154 = !DILocation(line: 77, column: 39, scope: !144)
!155 = !DILocation(line: 77, column: 17, scope: !144)
!156 = distinct !{!156, !146, !157, !77}
!157 = !DILocation(line: 80, column: 17, scope: !141)
!158 = !DILocation(line: 81, column: 30, scope: !138)
!159 = !DILocation(line: 81, column: 17, scope: !138)
!160 = !DILocation(line: 85, column: 1, scope: !104)
