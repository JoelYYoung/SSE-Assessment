; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_badData, align 8, !dbg !68
  store i32* %0, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !69, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !75
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !76
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %1 = load i32*, i32** %data, align 8, !dbg !79
  %2 = bitcast i32* %1 to i8*, !dbg !80
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !80
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !80
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !80
  %4 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !81
  store i32 0, i32* %arrayidx2, align 4, !dbg !82
  %5 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* %5), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 200, align 16, !dbg !91
  %1 = bitcast i8* %0 to i32*, !dbg !92
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %2 = alloca i8, i64 400, align 16, !dbg !95
  %3 = bitcast i8* %2 to i32*, !dbg !96
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !94
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !97
  store i32* %4, i32** %data, align 8, !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_goodG2BData, align 8, !dbg !102
  call void @goodG2BSink(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_goodG2BData, align 8, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !113
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %2 = bitcast i32* %1 to i8*, !dbg !117
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !117
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !117
  %4 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !118
  store i32 0, i32* %arrayidx2, align 4, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %5), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_bad", scope: !14, file: !14, line: 40, type: !22, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 42, type: !6)
!25 = !DILocation(line: 42, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 43, type: !6)
!27 = !DILocation(line: 43, column: 15, scope: !21)
!28 = !DILocation(line: 43, column: 42, scope: !21)
!29 = !DILocation(line: 43, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 44, type: !6)
!31 = !DILocation(line: 44, column: 15, scope: !21)
!32 = !DILocation(line: 44, column: 43, scope: !21)
!33 = !DILocation(line: 44, column: 32, scope: !21)
!34 = !DILocation(line: 47, column: 12, scope: !21)
!35 = !DILocation(line: 47, column: 10, scope: !21)
!36 = !DILocation(line: 48, column: 5, scope: !21)
!37 = !DILocation(line: 48, column: 13, scope: !21)
!38 = !DILocation(line: 49, column: 84, scope: !21)
!39 = !DILocation(line: 49, column: 82, scope: !21)
!40 = !DILocation(line: 50, column: 5, scope: !21)
!41 = !DILocation(line: 51, column: 1, scope: !21)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_45_good", scope: !14, file: !14, line: 84, type: !22, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 86, column: 5, scope: !42)
!44 = !DILocation(line: 87, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 98, type: !46, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!9, !9, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !14, line: 98, type: !9)
!52 = !DILocation(line: 98, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !14, line: 98, type: !48)
!54 = !DILocation(line: 98, column: 27, scope: !45)
!55 = !DILocation(line: 101, column: 22, scope: !45)
!56 = !DILocation(line: 101, column: 12, scope: !45)
!57 = !DILocation(line: 101, column: 5, scope: !45)
!58 = !DILocation(line: 103, column: 5, scope: !45)
!59 = !DILocation(line: 104, column: 5, scope: !45)
!60 = !DILocation(line: 105, column: 5, scope: !45)
!61 = !DILocation(line: 108, column: 5, scope: !45)
!62 = !DILocation(line: 109, column: 5, scope: !45)
!63 = !DILocation(line: 110, column: 5, scope: !45)
!64 = !DILocation(line: 112, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "data", scope: !65, file: !14, line: 28, type: !6)
!67 = !DILocation(line: 28, column: 15, scope: !65)
!68 = !DILocation(line: 28, column: 22, scope: !65)
!69 = !DILocalVariable(name: "source", scope: !70, file: !14, line: 30, type: !71)
!70 = distinct !DILexicalBlock(scope: !65, file: !14, line: 29, column: 5)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 100)
!74 = !DILocation(line: 30, column: 17, scope: !70)
!75 = !DILocation(line: 31, column: 17, scope: !70)
!76 = !DILocation(line: 31, column: 9, scope: !70)
!77 = !DILocation(line: 32, column: 9, scope: !70)
!78 = !DILocation(line: 32, column: 23, scope: !70)
!79 = !DILocation(line: 34, column: 17, scope: !70)
!80 = !DILocation(line: 34, column: 9, scope: !70)
!81 = !DILocation(line: 35, column: 9, scope: !70)
!82 = !DILocation(line: 35, column: 21, scope: !70)
!83 = !DILocation(line: 36, column: 20, scope: !70)
!84 = !DILocation(line: 36, column: 9, scope: !70)
!85 = !DILocation(line: 38, column: 1, scope: !65)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 72, type: !22, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 74, type: !6)
!88 = !DILocation(line: 74, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !14, line: 75, type: !6)
!90 = !DILocation(line: 75, column: 15, scope: !86)
!91 = !DILocation(line: 75, column: 42, scope: !86)
!92 = !DILocation(line: 75, column: 31, scope: !86)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !14, line: 76, type: !6)
!94 = !DILocation(line: 76, column: 15, scope: !86)
!95 = !DILocation(line: 76, column: 43, scope: !86)
!96 = !DILocation(line: 76, column: 32, scope: !86)
!97 = !DILocation(line: 78, column: 12, scope: !86)
!98 = !DILocation(line: 78, column: 10, scope: !86)
!99 = !DILocation(line: 79, column: 5, scope: !86)
!100 = !DILocation(line: 79, column: 13, scope: !86)
!101 = !DILocation(line: 80, column: 88, scope: !86)
!102 = !DILocation(line: 80, column: 86, scope: !86)
!103 = !DILocation(line: 81, column: 5, scope: !86)
!104 = !DILocation(line: 82, column: 1, scope: !86)
!105 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 58, type: !22, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 60, type: !6)
!107 = !DILocation(line: 60, column: 15, scope: !105)
!108 = !DILocation(line: 60, column: 22, scope: !105)
!109 = !DILocalVariable(name: "source", scope: !110, file: !14, line: 62, type: !71)
!110 = distinct !DILexicalBlock(scope: !105, file: !14, line: 61, column: 5)
!111 = !DILocation(line: 62, column: 17, scope: !110)
!112 = !DILocation(line: 63, column: 17, scope: !110)
!113 = !DILocation(line: 63, column: 9, scope: !110)
!114 = !DILocation(line: 64, column: 9, scope: !110)
!115 = !DILocation(line: 64, column: 23, scope: !110)
!116 = !DILocation(line: 66, column: 17, scope: !110)
!117 = !DILocation(line: 66, column: 9, scope: !110)
!118 = !DILocation(line: 67, column: 9, scope: !110)
!119 = !DILocation(line: 67, column: 21, scope: !110)
!120 = !DILocation(line: 68, column: 20, scope: !110)
!121 = !DILocation(line: 68, column: 9, scope: !110)
!122 = !DILocation(line: 70, column: 1, scope: !105)
