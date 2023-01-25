; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_bad() #0 !dbg !21 {
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
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_good() #0 !dbg !42 {
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
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_bad(), !dbg !62
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
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_badData, align 8, !dbg !68
  store i32* %0, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !69, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !75
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !76
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %1 = load i32*, i32** %data, align 8, !dbg !79
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !80
  %call2 = call i32* @wcscpy(i32* %1, i32* %arraydecay1) #4, !dbg !81
  %2 = load i32*, i32** %data, align 8, !dbg !82
  call void @printWLine(i32* %2), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 200, align 16, !dbg !90
  %1 = bitcast i8* %0 to i32*, !dbg !91
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %2 = alloca i8, i64 400, align 16, !dbg !94
  %3 = bitcast i8* %2 to i32*, !dbg !95
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !93
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !96
  store i32* %4, i32** %data, align 8, !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_goodG2BData, align 8, !dbg !101
  call void @goodG2BSink(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_goodG2BData, align 8, !dbg !107
  store i32* %0, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !112
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %1 = load i32*, i32** %data, align 8, !dbg !115
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %call2 = call i32* @wcscpy(i32* %1, i32* %arraydecay1) #4, !dbg !117
  %2 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* %2), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_bad", scope: !14, file: !14, line: 39, type: !22, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 41, type: !6)
!25 = !DILocation(line: 41, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 42, type: !6)
!27 = !DILocation(line: 42, column: 15, scope: !21)
!28 = !DILocation(line: 42, column: 42, scope: !21)
!29 = !DILocation(line: 42, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 43, type: !6)
!31 = !DILocation(line: 43, column: 15, scope: !21)
!32 = !DILocation(line: 43, column: 43, scope: !21)
!33 = !DILocation(line: 43, column: 32, scope: !21)
!34 = !DILocation(line: 46, column: 12, scope: !21)
!35 = !DILocation(line: 46, column: 10, scope: !21)
!36 = !DILocation(line: 47, column: 5, scope: !21)
!37 = !DILocation(line: 47, column: 13, scope: !21)
!38 = !DILocation(line: 48, column: 78, scope: !21)
!39 = !DILocation(line: 48, column: 76, scope: !21)
!40 = !DILocation(line: 49, column: 5, scope: !21)
!41 = !DILocation(line: 50, column: 1, scope: !21)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_45_good", scope: !14, file: !14, line: 82, type: !22, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 84, column: 5, scope: !42)
!44 = !DILocation(line: 85, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 96, type: !46, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!9, !9, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !14, line: 96, type: !9)
!52 = !DILocation(line: 96, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !14, line: 96, type: !48)
!54 = !DILocation(line: 96, column: 27, scope: !45)
!55 = !DILocation(line: 99, column: 22, scope: !45)
!56 = !DILocation(line: 99, column: 12, scope: !45)
!57 = !DILocation(line: 99, column: 5, scope: !45)
!58 = !DILocation(line: 101, column: 5, scope: !45)
!59 = !DILocation(line: 102, column: 5, scope: !45)
!60 = !DILocation(line: 103, column: 5, scope: !45)
!61 = !DILocation(line: 106, column: 5, scope: !45)
!62 = !DILocation(line: 107, column: 5, scope: !45)
!63 = !DILocation(line: 108, column: 5, scope: !45)
!64 = !DILocation(line: 110, column: 5, scope: !45)
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
!79 = !DILocation(line: 34, column: 16, scope: !70)
!80 = !DILocation(line: 34, column: 22, scope: !70)
!81 = !DILocation(line: 34, column: 9, scope: !70)
!82 = !DILocation(line: 35, column: 20, scope: !70)
!83 = !DILocation(line: 35, column: 9, scope: !70)
!84 = !DILocation(line: 37, column: 1, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 70, type: !22, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocalVariable(name: "data", scope: !85, file: !14, line: 72, type: !6)
!87 = !DILocation(line: 72, column: 15, scope: !85)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !14, line: 73, type: !6)
!89 = !DILocation(line: 73, column: 15, scope: !85)
!90 = !DILocation(line: 73, column: 42, scope: !85)
!91 = !DILocation(line: 73, column: 31, scope: !85)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !14, line: 74, type: !6)
!93 = !DILocation(line: 74, column: 15, scope: !85)
!94 = !DILocation(line: 74, column: 43, scope: !85)
!95 = !DILocation(line: 74, column: 32, scope: !85)
!96 = !DILocation(line: 76, column: 12, scope: !85)
!97 = !DILocation(line: 76, column: 10, scope: !85)
!98 = !DILocation(line: 77, column: 5, scope: !85)
!99 = !DILocation(line: 77, column: 13, scope: !85)
!100 = !DILocation(line: 78, column: 82, scope: !85)
!101 = !DILocation(line: 78, column: 80, scope: !85)
!102 = !DILocation(line: 79, column: 5, scope: !85)
!103 = !DILocation(line: 80, column: 1, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 57, type: !22, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 59, type: !6)
!106 = !DILocation(line: 59, column: 15, scope: !104)
!107 = !DILocation(line: 59, column: 22, scope: !104)
!108 = !DILocalVariable(name: "source", scope: !109, file: !14, line: 61, type: !71)
!109 = distinct !DILexicalBlock(scope: !104, file: !14, line: 60, column: 5)
!110 = !DILocation(line: 61, column: 17, scope: !109)
!111 = !DILocation(line: 62, column: 17, scope: !109)
!112 = !DILocation(line: 62, column: 9, scope: !109)
!113 = !DILocation(line: 63, column: 9, scope: !109)
!114 = !DILocation(line: 63, column: 23, scope: !109)
!115 = !DILocation(line: 65, column: 16, scope: !109)
!116 = !DILocation(line: 65, column: 22, scope: !109)
!117 = !DILocation(line: 65, column: 9, scope: !109)
!118 = !DILocation(line: 66, column: 20, scope: !109)
!119 = !DILocation(line: 66, column: 9, scope: !109)
!120 = !DILocation(line: 68, column: 1, scope: !104)
