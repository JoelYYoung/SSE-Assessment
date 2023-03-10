; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !30
  store i32* %add.ptr, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx2, align 4, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %5, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !55
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !55
  %8 = load i32*, i32** %data, align 8, !dbg !56
  %9 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !56
  store i32 %7, i32* %arrayidx4, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %10, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !65
  store i32 0, i32* %arrayidx5, align 4, !dbg !66
  %12 = load i32*, i32** %data, align 8, !dbg !67
  call void @printWLine(i32* %12), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01_good() #0 !dbg !70 {
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
  %call = call i64 @time(i64* null) #4, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #4, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 400, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  store i32* %1, i32** %dataBuffer, align 8, !dbg !97
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !101
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  store i32* %4, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !112
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx2, align 4, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !118
  %cmp = icmp ult i64 %5, 100, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !124
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !124
  %8 = load i32*, i32** %data, align 8, !dbg !125
  %9 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !125
  store i32 %7, i32* %arrayidx4, align 4, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %10, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !133
  store i32 0, i32* %arrayidx5, align 4, !dbg !134
  %12 = load i32*, i32** %data, align 8, !dbg !135
  call void @printWLine(i32* %12), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 30, column: 12, scope: !15)
!30 = !DILocation(line: 30, column: 23, scope: !15)
!31 = !DILocation(line: 30, column: 10, scope: !15)
!32 = !DILocalVariable(name: "i", scope: !33, file: !16, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !35)
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 32, column: 16, scope: !33)
!37 = !DILocalVariable(name: "source", scope: !33, file: !16, line: 33, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 33, column: 17, scope: !33)
!42 = !DILocation(line: 34, column: 17, scope: !33)
!43 = !DILocation(line: 34, column: 9, scope: !33)
!44 = !DILocation(line: 35, column: 9, scope: !33)
!45 = !DILocation(line: 35, column: 23, scope: !33)
!46 = !DILocation(line: 37, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !33, file: !16, line: 37, column: 9)
!48 = !DILocation(line: 37, column: 14, scope: !47)
!49 = !DILocation(line: 37, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !16, line: 37, column: 9)
!51 = !DILocation(line: 37, column: 23, scope: !50)
!52 = !DILocation(line: 37, column: 9, scope: !47)
!53 = !DILocation(line: 39, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !16, line: 38, column: 9)
!55 = !DILocation(line: 39, column: 23, scope: !54)
!56 = !DILocation(line: 39, column: 13, scope: !54)
!57 = !DILocation(line: 39, column: 18, scope: !54)
!58 = !DILocation(line: 39, column: 21, scope: !54)
!59 = !DILocation(line: 40, column: 9, scope: !54)
!60 = !DILocation(line: 37, column: 31, scope: !50)
!61 = !DILocation(line: 37, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 40, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 42, column: 9, scope: !33)
!66 = !DILocation(line: 42, column: 21, scope: !33)
!67 = !DILocation(line: 43, column: 20, scope: !33)
!68 = !DILocation(line: 43, column: 9, scope: !33)
!69 = !DILocation(line: 45, column: 1, scope: !15)
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_01_good", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 78, column: 5, scope: !70)
!72 = !DILocation(line: 79, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 91, type: !74, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!7, !7, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !16, line: 91, type: !7)
!80 = !DILocation(line: 91, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !16, line: 91, type: !76)
!82 = !DILocation(line: 91, column: 27, scope: !73)
!83 = !DILocation(line: 94, column: 22, scope: !73)
!84 = !DILocation(line: 94, column: 12, scope: !73)
!85 = !DILocation(line: 94, column: 5, scope: !73)
!86 = !DILocation(line: 96, column: 5, scope: !73)
!87 = !DILocation(line: 97, column: 5, scope: !73)
!88 = !DILocation(line: 98, column: 5, scope: !73)
!89 = !DILocation(line: 101, column: 5, scope: !73)
!90 = !DILocation(line: 102, column: 5, scope: !73)
!91 = !DILocation(line: 103, column: 5, scope: !73)
!92 = !DILocation(line: 105, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !16, line: 54, type: !4)
!95 = !DILocation(line: 54, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !16, line: 55, type: !4)
!97 = !DILocation(line: 55, column: 15, scope: !93)
!98 = !DILocation(line: 55, column: 39, scope: !93)
!99 = !DILocation(line: 55, column: 28, scope: !93)
!100 = !DILocation(line: 56, column: 13, scope: !93)
!101 = !DILocation(line: 56, column: 5, scope: !93)
!102 = !DILocation(line: 57, column: 5, scope: !93)
!103 = !DILocation(line: 57, column: 23, scope: !93)
!104 = !DILocation(line: 59, column: 12, scope: !93)
!105 = !DILocation(line: 59, column: 10, scope: !93)
!106 = !DILocalVariable(name: "i", scope: !107, file: !16, line: 61, type: !34)
!107 = distinct !DILexicalBlock(scope: !93, file: !16, line: 60, column: 5)
!108 = !DILocation(line: 61, column: 16, scope: !107)
!109 = !DILocalVariable(name: "source", scope: !107, file: !16, line: 62, type: !38)
!110 = !DILocation(line: 62, column: 17, scope: !107)
!111 = !DILocation(line: 63, column: 17, scope: !107)
!112 = !DILocation(line: 63, column: 9, scope: !107)
!113 = !DILocation(line: 64, column: 9, scope: !107)
!114 = !DILocation(line: 64, column: 23, scope: !107)
!115 = !DILocation(line: 66, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !107, file: !16, line: 66, column: 9)
!117 = !DILocation(line: 66, column: 14, scope: !116)
!118 = !DILocation(line: 66, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !16, line: 66, column: 9)
!120 = !DILocation(line: 66, column: 23, scope: !119)
!121 = !DILocation(line: 66, column: 9, scope: !116)
!122 = !DILocation(line: 68, column: 30, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !16, line: 67, column: 9)
!124 = !DILocation(line: 68, column: 23, scope: !123)
!125 = !DILocation(line: 68, column: 13, scope: !123)
!126 = !DILocation(line: 68, column: 18, scope: !123)
!127 = !DILocation(line: 68, column: 21, scope: !123)
!128 = !DILocation(line: 69, column: 9, scope: !123)
!129 = !DILocation(line: 66, column: 31, scope: !119)
!130 = !DILocation(line: 66, column: 9, scope: !119)
!131 = distinct !{!131, !121, !132, !64}
!132 = !DILocation(line: 69, column: 9, scope: !116)
!133 = !DILocation(line: 71, column: 9, scope: !107)
!134 = !DILocation(line: 71, column: 21, scope: !107)
!135 = !DILocation(line: 72, column: 20, scope: !107)
!136 = !DILocation(line: 72, column: 9, scope: !107)
!137 = !DILocation(line: 74, column: 1, scope: !93)
