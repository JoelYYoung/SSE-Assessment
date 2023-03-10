; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_16.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_16_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
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
  br label %while.body, !dbg !29

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !32
  store i32* %add.ptr, i32** %data, align 8, !dbg !33
  br label %while.end, !dbg !34

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx2, align 4, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %5, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !56
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !56
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !56
  %9 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !60
  store i32 %8, i32* %arrayidx4, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %10, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx5, align 4, !dbg !69
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !70
  call void @printWLine(i32* %arraydecay6), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_16_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #4, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #4, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_16_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_16_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 400, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBuffer, align 8, !dbg !100
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !104
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  br label %while.body, !dbg !107

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %4, i32** %data, align 8, !dbg !110
  br label %while.end, !dbg !111

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !118
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx2, align 4, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !124
  %cmp = icmp ult i64 %5, 100, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !128
  %7 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !128
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !128
  %9 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !132
  store i32 %8, i32* %arrayidx4, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %10, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !139
  store i32 0, i32* %arrayidx5, align 4, !dbg !140
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !141
  call void @printWLine(i32* %arraydecay6), !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_16_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 29, column: 5, scope: !15)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 9, scope: !31)
!35 = !DILocalVariable(name: "i", scope: !36, file: !16, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 36, column: 16, scope: !36)
!40 = !DILocalVariable(name: "dest", scope: !36, file: !16, line: 37, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 37, column: 17, scope: !36)
!45 = !DILocation(line: 38, column: 17, scope: !36)
!46 = !DILocation(line: 38, column: 9, scope: !36)
!47 = !DILocation(line: 39, column: 9, scope: !36)
!48 = !DILocation(line: 39, column: 21, scope: !36)
!49 = !DILocation(line: 41, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !36, file: !16, line: 41, column: 9)
!51 = !DILocation(line: 41, column: 14, scope: !50)
!52 = !DILocation(line: 41, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !16, line: 41, column: 9)
!54 = !DILocation(line: 41, column: 23, scope: !53)
!55 = !DILocation(line: 41, column: 9, scope: !50)
!56 = !DILocation(line: 43, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !16, line: 42, column: 9)
!58 = !DILocation(line: 43, column: 28, scope: !57)
!59 = !DILocation(line: 43, column: 18, scope: !57)
!60 = !DILocation(line: 43, column: 13, scope: !57)
!61 = !DILocation(line: 43, column: 21, scope: !57)
!62 = !DILocation(line: 44, column: 9, scope: !57)
!63 = !DILocation(line: 41, column: 31, scope: !53)
!64 = !DILocation(line: 41, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 44, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 46, column: 9, scope: !36)
!69 = !DILocation(line: 46, column: 21, scope: !36)
!70 = !DILocation(line: 47, column: 20, scope: !36)
!71 = !DILocation(line: 47, column: 9, scope: !36)
!72 = !DILocation(line: 49, column: 1, scope: !15)
!73 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_16_good", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 86, column: 5, scope: !73)
!75 = !DILocation(line: 87, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 99, type: !77, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!7, !7, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !16, line: 99, type: !7)
!83 = !DILocation(line: 99, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !16, line: 99, type: !79)
!85 = !DILocation(line: 99, column: 27, scope: !76)
!86 = !DILocation(line: 102, column: 22, scope: !76)
!87 = !DILocation(line: 102, column: 12, scope: !76)
!88 = !DILocation(line: 102, column: 5, scope: !76)
!89 = !DILocation(line: 104, column: 5, scope: !76)
!90 = !DILocation(line: 105, column: 5, scope: !76)
!91 = !DILocation(line: 106, column: 5, scope: !76)
!92 = !DILocation(line: 109, column: 5, scope: !76)
!93 = !DILocation(line: 110, column: 5, scope: !76)
!94 = !DILocation(line: 111, column: 5, scope: !76)
!95 = !DILocation(line: 113, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !16, line: 58, type: !4)
!98 = !DILocation(line: 58, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !16, line: 59, type: !4)
!100 = !DILocation(line: 59, column: 15, scope: !96)
!101 = !DILocation(line: 59, column: 39, scope: !96)
!102 = !DILocation(line: 59, column: 28, scope: !96)
!103 = !DILocation(line: 60, column: 13, scope: !96)
!104 = !DILocation(line: 60, column: 5, scope: !96)
!105 = !DILocation(line: 61, column: 5, scope: !96)
!106 = !DILocation(line: 61, column: 23, scope: !96)
!107 = !DILocation(line: 62, column: 5, scope: !96)
!108 = !DILocation(line: 65, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !96, file: !16, line: 63, column: 5)
!110 = !DILocation(line: 65, column: 14, scope: !109)
!111 = !DILocation(line: 66, column: 9, scope: !109)
!112 = !DILocalVariable(name: "i", scope: !113, file: !16, line: 69, type: !37)
!113 = distinct !DILexicalBlock(scope: !96, file: !16, line: 68, column: 5)
!114 = !DILocation(line: 69, column: 16, scope: !113)
!115 = !DILocalVariable(name: "dest", scope: !113, file: !16, line: 70, type: !41)
!116 = !DILocation(line: 70, column: 17, scope: !113)
!117 = !DILocation(line: 71, column: 17, scope: !113)
!118 = !DILocation(line: 71, column: 9, scope: !113)
!119 = !DILocation(line: 72, column: 9, scope: !113)
!120 = !DILocation(line: 72, column: 21, scope: !113)
!121 = !DILocation(line: 74, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !113, file: !16, line: 74, column: 9)
!123 = !DILocation(line: 74, column: 14, scope: !122)
!124 = !DILocation(line: 74, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !16, line: 74, column: 9)
!126 = !DILocation(line: 74, column: 23, scope: !125)
!127 = !DILocation(line: 74, column: 9, scope: !122)
!128 = !DILocation(line: 76, column: 23, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !16, line: 75, column: 9)
!130 = !DILocation(line: 76, column: 28, scope: !129)
!131 = !DILocation(line: 76, column: 18, scope: !129)
!132 = !DILocation(line: 76, column: 13, scope: !129)
!133 = !DILocation(line: 76, column: 21, scope: !129)
!134 = !DILocation(line: 77, column: 9, scope: !129)
!135 = !DILocation(line: 74, column: 31, scope: !125)
!136 = !DILocation(line: 74, column: 9, scope: !125)
!137 = distinct !{!137, !127, !138, !67}
!138 = !DILocation(line: 77, column: 9, scope: !122)
!139 = !DILocation(line: 79, column: 9, scope: !113)
!140 = !DILocation(line: 79, column: 21, scope: !113)
!141 = !DILocation(line: 80, column: 20, scope: !113)
!142 = !DILocation(line: 80, column: 9, scope: !113)
!143 = !DILocation(line: 82, column: 1, scope: !96)
