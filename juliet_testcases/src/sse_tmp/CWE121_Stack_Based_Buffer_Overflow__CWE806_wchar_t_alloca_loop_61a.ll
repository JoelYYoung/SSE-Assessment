; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61_bad() #0 !dbg !15 {
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
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61b_badSource(i32* %3), !dbg !28
  store i32* %call, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !40, metadata !DIExpression()), !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !43
  store i64 %call1, i64* %dataLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !48
  %7 = load i64, i64* %dataLen, align 8, !dbg !50
  %cmp = icmp ult i64 %6, %7, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %9 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !53
  %10 = load i32, i32* %arrayidx, align 4, !dbg !53
  %11 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !57
  store i32 %10, i32* %arrayidx2, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %12, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !65
  store i32 0, i32* %arrayidx3, align 4, !dbg !66
  %13 = load i32*, i32** %data, align 8, !dbg !67
  call void @printWLine(i32* %13), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61_good() #0 !dbg !70 {
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
  %call = call i64 @time(i64* null) #7, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #7, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 400, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  store i32* %1, i32** %dataBuffer, align 8, !dbg !97
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %2, i32** %data, align 8, !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61b_goodG2BSource(i32* %3), !dbg !103
  store i32* %call, i32** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !110, metadata !DIExpression()), !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !113
  store i64 %call1, i64* %dataLen, align 8, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !118
  %7 = load i64, i64* %dataLen, align 8, !dbg !120
  %cmp = icmp ult i64 %6, %7, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !123
  %9 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !123
  %10 = load i32, i32* %arrayidx, align 4, !dbg !123
  %11 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !127
  store i32 %10, i32* %arrayidx2, align 4, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %12, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !134
  store i32 0, i32* %arrayidx3, align 4, !dbg !135
  %13 = load i32*, i32** %data, align 8, !dbg !136
  call void @printWLine(i32* %13), !dbg !137
  ret void, !dbg !138
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 29, type: !4)
!22 = !DILocation(line: 29, column: 15, scope: !15)
!23 = !DILocation(line: 29, column: 39, scope: !15)
!24 = !DILocation(line: 29, column: 28, scope: !15)
!25 = !DILocation(line: 30, column: 12, scope: !15)
!26 = !DILocation(line: 30, column: 10, scope: !15)
!27 = !DILocation(line: 31, column: 89, scope: !15)
!28 = !DILocation(line: 31, column: 12, scope: !15)
!29 = !DILocation(line: 31, column: 10, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 33, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 33, column: 17, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !16, line: 34, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 34, column: 16, scope: !31)
!40 = !DILocalVariable(name: "dataLen", scope: !31, file: !16, line: 34, type: !37)
!41 = !DILocation(line: 34, column: 19, scope: !31)
!42 = !DILocation(line: 35, column: 26, scope: !31)
!43 = !DILocation(line: 35, column: 19, scope: !31)
!44 = !DILocation(line: 35, column: 17, scope: !31)
!45 = !DILocation(line: 37, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !31, file: !16, line: 37, column: 9)
!47 = !DILocation(line: 37, column: 14, scope: !46)
!48 = !DILocation(line: 37, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !16, line: 37, column: 9)
!50 = !DILocation(line: 37, column: 25, scope: !49)
!51 = !DILocation(line: 37, column: 23, scope: !49)
!52 = !DILocation(line: 37, column: 9, scope: !46)
!53 = !DILocation(line: 39, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !16, line: 38, column: 9)
!55 = !DILocation(line: 39, column: 28, scope: !54)
!56 = !DILocation(line: 39, column: 18, scope: !54)
!57 = !DILocation(line: 39, column: 13, scope: !54)
!58 = !DILocation(line: 39, column: 21, scope: !54)
!59 = !DILocation(line: 40, column: 9, scope: !54)
!60 = !DILocation(line: 37, column: 35, scope: !49)
!61 = !DILocation(line: 37, column: 9, scope: !49)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 40, column: 9, scope: !46)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 41, column: 9, scope: !31)
!66 = !DILocation(line: 41, column: 20, scope: !31)
!67 = !DILocation(line: 42, column: 20, scope: !31)
!68 = !DILocation(line: 42, column: 9, scope: !31)
!69 = !DILocation(line: 44, column: 1, scope: !15)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_61_good", scope: !16, file: !16, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 75, column: 5, scope: !70)
!72 = !DILocation(line: 76, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 88, type: !74, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!7, !7, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !16, line: 88, type: !7)
!80 = !DILocation(line: 88, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !16, line: 88, type: !76)
!82 = !DILocation(line: 88, column: 27, scope: !73)
!83 = !DILocation(line: 91, column: 22, scope: !73)
!84 = !DILocation(line: 91, column: 12, scope: !73)
!85 = !DILocation(line: 91, column: 5, scope: !73)
!86 = !DILocation(line: 93, column: 5, scope: !73)
!87 = !DILocation(line: 94, column: 5, scope: !73)
!88 = !DILocation(line: 95, column: 5, scope: !73)
!89 = !DILocation(line: 98, column: 5, scope: !73)
!90 = !DILocation(line: 99, column: 5, scope: !73)
!91 = !DILocation(line: 100, column: 5, scope: !73)
!92 = !DILocation(line: 102, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !16, line: 55, type: !4)
!95 = !DILocation(line: 55, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !16, line: 56, type: !4)
!97 = !DILocation(line: 56, column: 15, scope: !93)
!98 = !DILocation(line: 56, column: 39, scope: !93)
!99 = !DILocation(line: 56, column: 28, scope: !93)
!100 = !DILocation(line: 57, column: 12, scope: !93)
!101 = !DILocation(line: 57, column: 10, scope: !93)
!102 = !DILocation(line: 58, column: 93, scope: !93)
!103 = !DILocation(line: 58, column: 12, scope: !93)
!104 = !DILocation(line: 58, column: 10, scope: !93)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !16, line: 60, type: !32)
!106 = distinct !DILexicalBlock(scope: !93, file: !16, line: 59, column: 5)
!107 = !DILocation(line: 60, column: 17, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !106, file: !16, line: 61, type: !37)
!109 = !DILocation(line: 61, column: 16, scope: !106)
!110 = !DILocalVariable(name: "dataLen", scope: !106, file: !16, line: 61, type: !37)
!111 = !DILocation(line: 61, column: 19, scope: !106)
!112 = !DILocation(line: 62, column: 26, scope: !106)
!113 = !DILocation(line: 62, column: 19, scope: !106)
!114 = !DILocation(line: 62, column: 17, scope: !106)
!115 = !DILocation(line: 64, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !16, line: 64, column: 9)
!117 = !DILocation(line: 64, column: 14, scope: !116)
!118 = !DILocation(line: 64, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !16, line: 64, column: 9)
!120 = !DILocation(line: 64, column: 25, scope: !119)
!121 = !DILocation(line: 64, column: 23, scope: !119)
!122 = !DILocation(line: 64, column: 9, scope: !116)
!123 = !DILocation(line: 66, column: 23, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !16, line: 65, column: 9)
!125 = !DILocation(line: 66, column: 28, scope: !124)
!126 = !DILocation(line: 66, column: 18, scope: !124)
!127 = !DILocation(line: 66, column: 13, scope: !124)
!128 = !DILocation(line: 66, column: 21, scope: !124)
!129 = !DILocation(line: 67, column: 9, scope: !124)
!130 = !DILocation(line: 64, column: 35, scope: !119)
!131 = !DILocation(line: 64, column: 9, scope: !119)
!132 = distinct !{!132, !122, !133, !64}
!133 = !DILocation(line: 67, column: 9, scope: !116)
!134 = !DILocation(line: 68, column: 9, scope: !106)
!135 = !DILocation(line: 68, column: 20, scope: !106)
!136 = !DILocation(line: 69, column: 20, scope: !106)
!137 = !DILocation(line: 69, column: 9, scope: !106)
!138 = !DILocation(line: 71, column: 1, scope: !93)
