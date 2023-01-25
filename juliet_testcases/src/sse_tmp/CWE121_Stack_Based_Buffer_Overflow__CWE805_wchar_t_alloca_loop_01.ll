; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx1, align 4, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %6, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !56
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !56
  %9 = load i32*, i32** %data, align 8, !dbg !57
  %10 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !57
  store i32 %8, i32* %arrayidx3, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %11, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !66
  store i32 0, i32* %arrayidx4, align 4, !dbg !67
  %13 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %13), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01_good() #0 !dbg !71 {
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
  %call = call i64 @time(i64* null) #4, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #4, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 200, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %2 = alloca i8, i64 400, align 16, !dbg !103
  %3 = bitcast i8* %2 to i32*, !dbg !104
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !102
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !105
  store i32* %4, i32** %data, align 8, !dbg !106
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !115
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx1, align 4, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %6, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !127
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !127
  %9 = load i32*, i32** %data, align 8, !dbg !128
  %10 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !128
  store i32 %8, i32* %arrayidx3, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %11, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !136
  store i32 0, i32* %arrayidx4, align 4, !dbg !137
  %13 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* %13), !dbg !139
  ret void, !dbg !140
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 30, column: 12, scope: !15)
!30 = !DILocation(line: 30, column: 10, scope: !15)
!31 = !DILocation(line: 31, column: 5, scope: !15)
!32 = !DILocation(line: 31, column: 13, scope: !15)
!33 = !DILocalVariable(name: "i", scope: !34, file: !16, line: 33, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !36)
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 33, column: 16, scope: !34)
!38 = !DILocalVariable(name: "source", scope: !34, file: !16, line: 34, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 34, column: 17, scope: !34)
!43 = !DILocation(line: 35, column: 17, scope: !34)
!44 = !DILocation(line: 35, column: 9, scope: !34)
!45 = !DILocation(line: 36, column: 9, scope: !34)
!46 = !DILocation(line: 36, column: 23, scope: !34)
!47 = !DILocation(line: 38, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !16, line: 38, column: 9)
!49 = !DILocation(line: 38, column: 14, scope: !48)
!50 = !DILocation(line: 38, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !16, line: 38, column: 9)
!52 = !DILocation(line: 38, column: 23, scope: !51)
!53 = !DILocation(line: 38, column: 9, scope: !48)
!54 = !DILocation(line: 40, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !16, line: 39, column: 9)
!56 = !DILocation(line: 40, column: 23, scope: !55)
!57 = !DILocation(line: 40, column: 13, scope: !55)
!58 = !DILocation(line: 40, column: 18, scope: !55)
!59 = !DILocation(line: 40, column: 21, scope: !55)
!60 = !DILocation(line: 41, column: 9, scope: !55)
!61 = !DILocation(line: 38, column: 31, scope: !51)
!62 = !DILocation(line: 38, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 41, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 42, column: 9, scope: !34)
!67 = !DILocation(line: 42, column: 21, scope: !34)
!68 = !DILocation(line: 43, column: 20, scope: !34)
!69 = !DILocation(line: 43, column: 9, scope: !34)
!70 = !DILocation(line: 45, column: 1, scope: !15)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_01_good", scope: !16, file: !16, line: 75, type: !17, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 77, column: 5, scope: !71)
!73 = !DILocation(line: 78, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 90, type: !75, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7, !7, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !16, line: 90, type: !7)
!81 = !DILocation(line: 90, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !16, line: 90, type: !77)
!83 = !DILocation(line: 90, column: 27, scope: !74)
!84 = !DILocation(line: 93, column: 22, scope: !74)
!85 = !DILocation(line: 93, column: 12, scope: !74)
!86 = !DILocation(line: 93, column: 5, scope: !74)
!87 = !DILocation(line: 95, column: 5, scope: !74)
!88 = !DILocation(line: 96, column: 5, scope: !74)
!89 = !DILocation(line: 97, column: 5, scope: !74)
!90 = !DILocation(line: 100, column: 5, scope: !74)
!91 = !DILocation(line: 101, column: 5, scope: !74)
!92 = !DILocation(line: 102, column: 5, scope: !74)
!93 = !DILocation(line: 104, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !16, line: 54, type: !4)
!96 = !DILocation(line: 54, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !16, line: 55, type: !4)
!98 = !DILocation(line: 55, column: 15, scope: !94)
!99 = !DILocation(line: 55, column: 42, scope: !94)
!100 = !DILocation(line: 55, column: 31, scope: !94)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !16, line: 56, type: !4)
!102 = !DILocation(line: 56, column: 15, scope: !94)
!103 = !DILocation(line: 56, column: 43, scope: !94)
!104 = !DILocation(line: 56, column: 32, scope: !94)
!105 = !DILocation(line: 58, column: 12, scope: !94)
!106 = !DILocation(line: 58, column: 10, scope: !94)
!107 = !DILocation(line: 59, column: 5, scope: !94)
!108 = !DILocation(line: 59, column: 13, scope: !94)
!109 = !DILocalVariable(name: "i", scope: !110, file: !16, line: 61, type: !35)
!110 = distinct !DILexicalBlock(scope: !94, file: !16, line: 60, column: 5)
!111 = !DILocation(line: 61, column: 16, scope: !110)
!112 = !DILocalVariable(name: "source", scope: !110, file: !16, line: 62, type: !39)
!113 = !DILocation(line: 62, column: 17, scope: !110)
!114 = !DILocation(line: 63, column: 17, scope: !110)
!115 = !DILocation(line: 63, column: 9, scope: !110)
!116 = !DILocation(line: 64, column: 9, scope: !110)
!117 = !DILocation(line: 64, column: 23, scope: !110)
!118 = !DILocation(line: 66, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !16, line: 66, column: 9)
!120 = !DILocation(line: 66, column: 14, scope: !119)
!121 = !DILocation(line: 66, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !16, line: 66, column: 9)
!123 = !DILocation(line: 66, column: 23, scope: !122)
!124 = !DILocation(line: 66, column: 9, scope: !119)
!125 = !DILocation(line: 68, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !16, line: 67, column: 9)
!127 = !DILocation(line: 68, column: 23, scope: !126)
!128 = !DILocation(line: 68, column: 13, scope: !126)
!129 = !DILocation(line: 68, column: 18, scope: !126)
!130 = !DILocation(line: 68, column: 21, scope: !126)
!131 = !DILocation(line: 69, column: 9, scope: !126)
!132 = !DILocation(line: 66, column: 31, scope: !122)
!133 = !DILocation(line: 66, column: 9, scope: !122)
!134 = distinct !{!134, !124, !135, !65}
!135 = !DILocation(line: 69, column: 9, scope: !119)
!136 = !DILocation(line: 70, column: 9, scope: !110)
!137 = !DILocation(line: 70, column: 21, scope: !110)
!138 = !DILocation(line: 71, column: 20, scope: !110)
!139 = !DILocation(line: 71, column: 9, scope: !110)
!140 = !DILocation(line: 73, column: 1, scope: !94)
