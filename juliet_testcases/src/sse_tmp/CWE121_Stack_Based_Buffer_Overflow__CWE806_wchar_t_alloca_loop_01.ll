; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !28
  %4 = load i32*, i32** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !41, metadata !DIExpression()), !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !44
  store i64 %call1, i64* %dataLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !49
  %8 = load i64, i64* %dataLen, align 8, !dbg !51
  %cmp = icmp ult i64 %7, %8, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !54
  %10 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !54
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !54
  %12 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !58
  store i32 %11, i32* %arrayidx3, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %13, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !66
  store i32 0, i32* %arrayidx4, align 4, !dbg !67
  %14 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %14), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #6, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #6, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 400, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBuffer, align 8, !dbg !98
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  store i32* %2, i32** %data, align 8, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !104
  %4 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !112, metadata !DIExpression()), !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !115
  store i64 %call1, i64* %dataLen, align 8, !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !120
  %8 = load i64, i64* %dataLen, align 8, !dbg !122
  %cmp = icmp ult i64 %7, %8, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !125
  %10 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !125
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !125
  %12 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !129
  store i32 %11, i32* %arrayidx3, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %13, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !136
  store i32 0, i32* %arrayidx4, align 4, !dbg !137
  %14 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* %14), !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 29, column: 13, scope: !15)
!28 = !DILocation(line: 29, column: 5, scope: !15)
!29 = !DILocation(line: 30, column: 5, scope: !15)
!30 = !DILocation(line: 30, column: 17, scope: !15)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !16, line: 32, type: !33)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 32, column: 17, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !16, line: 33, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !39)
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 33, column: 16, scope: !32)
!41 = !DILocalVariable(name: "dataLen", scope: !32, file: !16, line: 33, type: !38)
!42 = !DILocation(line: 33, column: 19, scope: !32)
!43 = !DILocation(line: 34, column: 26, scope: !32)
!44 = !DILocation(line: 34, column: 19, scope: !32)
!45 = !DILocation(line: 34, column: 17, scope: !32)
!46 = !DILocation(line: 36, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !32, file: !16, line: 36, column: 9)
!48 = !DILocation(line: 36, column: 14, scope: !47)
!49 = !DILocation(line: 36, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !16, line: 36, column: 9)
!51 = !DILocation(line: 36, column: 25, scope: !50)
!52 = !DILocation(line: 36, column: 23, scope: !50)
!53 = !DILocation(line: 36, column: 9, scope: !47)
!54 = !DILocation(line: 38, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !16, line: 37, column: 9)
!56 = !DILocation(line: 38, column: 28, scope: !55)
!57 = !DILocation(line: 38, column: 18, scope: !55)
!58 = !DILocation(line: 38, column: 13, scope: !55)
!59 = !DILocation(line: 38, column: 21, scope: !55)
!60 = !DILocation(line: 39, column: 9, scope: !55)
!61 = !DILocation(line: 36, column: 35, scope: !50)
!62 = !DILocation(line: 36, column: 9, scope: !50)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 39, column: 9, scope: !47)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 40, column: 9, scope: !32)
!67 = !DILocation(line: 40, column: 20, scope: !32)
!68 = !DILocation(line: 41, column: 20, scope: !32)
!69 = !DILocation(line: 41, column: 9, scope: !32)
!70 = !DILocation(line: 43, column: 1, scope: !15)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_01_good", scope: !16, file: !16, line: 72, type: !17, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 74, column: 5, scope: !71)
!73 = !DILocation(line: 75, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 87, type: !75, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7, !7, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !16, line: 87, type: !7)
!81 = !DILocation(line: 87, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !16, line: 87, type: !77)
!83 = !DILocation(line: 87, column: 27, scope: !74)
!84 = !DILocation(line: 90, column: 22, scope: !74)
!85 = !DILocation(line: 90, column: 12, scope: !74)
!86 = !DILocation(line: 90, column: 5, scope: !74)
!87 = !DILocation(line: 92, column: 5, scope: !74)
!88 = !DILocation(line: 93, column: 5, scope: !74)
!89 = !DILocation(line: 94, column: 5, scope: !74)
!90 = !DILocation(line: 97, column: 5, scope: !74)
!91 = !DILocation(line: 98, column: 5, scope: !74)
!92 = !DILocation(line: 99, column: 5, scope: !74)
!93 = !DILocation(line: 101, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !16, line: 52, type: !4)
!96 = !DILocation(line: 52, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !16, line: 53, type: !4)
!98 = !DILocation(line: 53, column: 15, scope: !94)
!99 = !DILocation(line: 53, column: 39, scope: !94)
!100 = !DILocation(line: 53, column: 28, scope: !94)
!101 = !DILocation(line: 54, column: 12, scope: !94)
!102 = !DILocation(line: 54, column: 10, scope: !94)
!103 = !DILocation(line: 56, column: 13, scope: !94)
!104 = !DILocation(line: 56, column: 5, scope: !94)
!105 = !DILocation(line: 57, column: 5, scope: !94)
!106 = !DILocation(line: 57, column: 16, scope: !94)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !16, line: 59, type: !33)
!108 = distinct !DILexicalBlock(scope: !94, file: !16, line: 58, column: 5)
!109 = !DILocation(line: 59, column: 17, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !108, file: !16, line: 60, type: !38)
!111 = !DILocation(line: 60, column: 16, scope: !108)
!112 = !DILocalVariable(name: "dataLen", scope: !108, file: !16, line: 60, type: !38)
!113 = !DILocation(line: 60, column: 19, scope: !108)
!114 = !DILocation(line: 61, column: 26, scope: !108)
!115 = !DILocation(line: 61, column: 19, scope: !108)
!116 = !DILocation(line: 61, column: 17, scope: !108)
!117 = !DILocation(line: 63, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !16, line: 63, column: 9)
!119 = !DILocation(line: 63, column: 14, scope: !118)
!120 = !DILocation(line: 63, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !16, line: 63, column: 9)
!122 = !DILocation(line: 63, column: 25, scope: !121)
!123 = !DILocation(line: 63, column: 23, scope: !121)
!124 = !DILocation(line: 63, column: 9, scope: !118)
!125 = !DILocation(line: 65, column: 23, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !16, line: 64, column: 9)
!127 = !DILocation(line: 65, column: 28, scope: !126)
!128 = !DILocation(line: 65, column: 18, scope: !126)
!129 = !DILocation(line: 65, column: 13, scope: !126)
!130 = !DILocation(line: 65, column: 21, scope: !126)
!131 = !DILocation(line: 66, column: 9, scope: !126)
!132 = !DILocation(line: 63, column: 35, scope: !121)
!133 = !DILocation(line: 63, column: 9, scope: !121)
!134 = distinct !{!134, !124, !135, !65}
!135 = !DILocation(line: 66, column: 9, scope: !118)
!136 = !DILocation(line: 67, column: 9, scope: !108)
!137 = !DILocation(line: 67, column: 20, scope: !108)
!138 = !DILocation(line: 68, column: 20, scope: !108)
!139 = !DILocation(line: 68, column: 9, scope: !108)
!140 = !DILocation(line: 70, column: 1, scope: !94)
