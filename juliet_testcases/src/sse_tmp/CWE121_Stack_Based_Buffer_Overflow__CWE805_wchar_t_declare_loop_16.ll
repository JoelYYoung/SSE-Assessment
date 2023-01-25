; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  br label %while.body, !dbg !31

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %while.end, !dbg !37

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx2, align 4, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %while.end
  %1 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %1, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !58
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !58
  %4 = load i32*, i32** %data, align 8, !dbg !59
  %5 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !59
  store i32 %3, i32* %arrayidx4, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %6, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !68
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !68
  store i32 0, i32* %arrayidx5, align 4, !dbg !69
  %8 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* %8), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16_good() #0 !dbg !73 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16_bad(), !dbg !93
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  br label %while.body, !dbg !103

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay, i32** %data, align 8, !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  br label %while.end, !dbg !109

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !116
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !117
  store i32 0, i32* %arrayidx2, align 4, !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %while.end
  %1 = load i64, i64* %i, align 8, !dbg !122
  %cmp = icmp ult i64 %1, 100, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !128
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !128
  %4 = load i32*, i32** %data, align 8, !dbg !129
  %5 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !129
  store i32 %3, i32* %arrayidx4, align 4, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %6, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !137
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !137
  store i32 0, i32* %arrayidx5, align 4, !dbg !138
  %8 = load i32*, i32** %data, align 8, !dbg !139
  call void @printWLine(i32* %8), !dbg !140
  ret void, !dbg !141
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 5, scope: !11)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 14, scope: !33)
!35 = !DILocation(line: 33, column: 9, scope: !33)
!36 = !DILocation(line: 33, column: 17, scope: !33)
!37 = !DILocation(line: 34, column: 9, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 37, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 37, column: 16, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 38, type: !27)
!44 = !DILocation(line: 38, column: 17, scope: !39)
!45 = !DILocation(line: 39, column: 17, scope: !39)
!46 = !DILocation(line: 39, column: 9, scope: !39)
!47 = !DILocation(line: 40, column: 9, scope: !39)
!48 = !DILocation(line: 40, column: 23, scope: !39)
!49 = !DILocation(line: 42, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !39, file: !12, line: 42, column: 9)
!51 = !DILocation(line: 42, column: 14, scope: !50)
!52 = !DILocation(line: 42, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 42, column: 9)
!54 = !DILocation(line: 42, column: 23, scope: !53)
!55 = !DILocation(line: 42, column: 9, scope: !50)
!56 = !DILocation(line: 44, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 43, column: 9)
!58 = !DILocation(line: 44, column: 23, scope: !57)
!59 = !DILocation(line: 44, column: 13, scope: !57)
!60 = !DILocation(line: 44, column: 18, scope: !57)
!61 = !DILocation(line: 44, column: 21, scope: !57)
!62 = !DILocation(line: 45, column: 9, scope: !57)
!63 = !DILocation(line: 42, column: 31, scope: !53)
!64 = !DILocation(line: 42, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 45, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 46, column: 9, scope: !39)
!69 = !DILocation(line: 46, column: 21, scope: !39)
!70 = !DILocation(line: 47, column: 20, scope: !39)
!71 = !DILocation(line: 47, column: 9, scope: !39)
!72 = !DILocation(line: 49, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_16_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 85, column: 5, scope: !73)
!75 = !DILocation(line: 86, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !77, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!19, !19, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 98, type: !19)
!83 = !DILocation(line: 98, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 98, type: !79)
!85 = !DILocation(line: 98, column: 27, scope: !76)
!86 = !DILocation(line: 101, column: 22, scope: !76)
!87 = !DILocation(line: 101, column: 12, scope: !76)
!88 = !DILocation(line: 101, column: 5, scope: !76)
!89 = !DILocation(line: 103, column: 5, scope: !76)
!90 = !DILocation(line: 104, column: 5, scope: !76)
!91 = !DILocation(line: 105, column: 5, scope: !76)
!92 = !DILocation(line: 108, column: 5, scope: !76)
!93 = !DILocation(line: 109, column: 5, scope: !76)
!94 = !DILocation(line: 110, column: 5, scope: !76)
!95 = !DILocation(line: 112, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 58, type: !16)
!98 = !DILocation(line: 58, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 59, type: !22)
!100 = !DILocation(line: 59, column: 13, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 60, type: !27)
!102 = !DILocation(line: 60, column: 13, scope: !96)
!103 = !DILocation(line: 61, column: 5, scope: !96)
!104 = !DILocation(line: 64, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !96, file: !12, line: 62, column: 5)
!106 = !DILocation(line: 64, column: 14, scope: !105)
!107 = !DILocation(line: 65, column: 9, scope: !105)
!108 = !DILocation(line: 65, column: 17, scope: !105)
!109 = !DILocation(line: 66, column: 9, scope: !105)
!110 = !DILocalVariable(name: "i", scope: !111, file: !12, line: 69, type: !40)
!111 = distinct !DILexicalBlock(scope: !96, file: !12, line: 68, column: 5)
!112 = !DILocation(line: 69, column: 16, scope: !111)
!113 = !DILocalVariable(name: "source", scope: !111, file: !12, line: 70, type: !27)
!114 = !DILocation(line: 70, column: 17, scope: !111)
!115 = !DILocation(line: 71, column: 17, scope: !111)
!116 = !DILocation(line: 71, column: 9, scope: !111)
!117 = !DILocation(line: 72, column: 9, scope: !111)
!118 = !DILocation(line: 72, column: 23, scope: !111)
!119 = !DILocation(line: 74, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !111, file: !12, line: 74, column: 9)
!121 = !DILocation(line: 74, column: 14, scope: !120)
!122 = !DILocation(line: 74, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 74, column: 9)
!124 = !DILocation(line: 74, column: 23, scope: !123)
!125 = !DILocation(line: 74, column: 9, scope: !120)
!126 = !DILocation(line: 76, column: 30, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 75, column: 9)
!128 = !DILocation(line: 76, column: 23, scope: !127)
!129 = !DILocation(line: 76, column: 13, scope: !127)
!130 = !DILocation(line: 76, column: 18, scope: !127)
!131 = !DILocation(line: 76, column: 21, scope: !127)
!132 = !DILocation(line: 77, column: 9, scope: !127)
!133 = !DILocation(line: 74, column: 31, scope: !123)
!134 = !DILocation(line: 74, column: 9, scope: !123)
!135 = distinct !{!135, !125, !136, !67}
!136 = !DILocation(line: 77, column: 9, scope: !120)
!137 = !DILocation(line: 78, column: 9, scope: !111)
!138 = !DILocation(line: 78, column: 21, scope: !111)
!139 = !DILocation(line: 79, column: 20, scope: !111)
!140 = !DILocation(line: 79, column: 9, scope: !111)
!141 = !DILocation(line: 81, column: 1, scope: !96)
