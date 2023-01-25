; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
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
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %7 = load i32*, i32** %data, align 8, !dbg !39
  call void %6(i32* %7), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx, align 4, !dbg !53
  %0 = load i32*, i32** %data.addr, align 8, !dbg !54
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #4, !dbg !56
  %1 = load i32*, i32** %data.addr, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !57
  store i32 0, i32* %arrayidx3, align 4, !dbg !58
  %2 = load i32*, i32** %data.addr, align 8, !dbg !59
  call void @printWLine(i32* %2), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #4, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #4, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !88, metadata !DIExpression()), !dbg !89
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 200, align 16, !dbg !92
  %1 = bitcast i8* %0 to i32*, !dbg !93
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %2 = alloca i8, i64 400, align 16, !dbg !96
  %3 = bitcast i8* %2 to i32*, !dbg !97
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !95
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !98
  store i32* %4, i32** %data, align 8, !dbg !99
  %5 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !102
  %7 = load i32*, i32** %data, align 8, !dbg !103
  call void %6(i32* %7), !dbg !102
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !105 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !112
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %0 = load i32*, i32** %data.addr, align 8, !dbg !115
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #4, !dbg !117
  %1 = load i32*, i32** %data.addr, align 8, !dbg !118
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !118
  store i32 0, i32* %arrayidx3, align 4, !dbg !119
  %2 = load i32*, i32** %data.addr, align 8, !dbg !120
  call void @printWLine(i32* %2), !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44_bad", scope: !16, file: !16, line: 36, type: !17, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 38, type: !4)
!20 = !DILocation(line: 38, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 40, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 40, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 41, type: !4)
!27 = !DILocation(line: 41, column: 15, scope: !15)
!28 = !DILocation(line: 41, column: 42, scope: !15)
!29 = !DILocation(line: 41, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 42, type: !4)
!31 = !DILocation(line: 42, column: 15, scope: !15)
!32 = !DILocation(line: 42, column: 43, scope: !15)
!33 = !DILocation(line: 42, column: 32, scope: !15)
!34 = !DILocation(line: 45, column: 12, scope: !15)
!35 = !DILocation(line: 45, column: 10, scope: !15)
!36 = !DILocation(line: 46, column: 5, scope: !15)
!37 = !DILocation(line: 46, column: 13, scope: !15)
!38 = !DILocation(line: 48, column: 5, scope: !15)
!39 = !DILocation(line: 48, column: 13, scope: !15)
!40 = !DILocation(line: 49, column: 1, scope: !15)
!41 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !16, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !16, line: 26, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !16, line: 25, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 26, column: 17, scope: !45)
!50 = !DILocation(line: 27, column: 17, scope: !45)
!51 = !DILocation(line: 27, column: 9, scope: !45)
!52 = !DILocation(line: 28, column: 9, scope: !45)
!53 = !DILocation(line: 28, column: 23, scope: !45)
!54 = !DILocation(line: 30, column: 17, scope: !45)
!55 = !DILocation(line: 30, column: 23, scope: !45)
!56 = !DILocation(line: 30, column: 9, scope: !45)
!57 = !DILocation(line: 31, column: 9, scope: !45)
!58 = !DILocation(line: 31, column: 21, scope: !45)
!59 = !DILocation(line: 32, column: 20, scope: !45)
!60 = !DILocation(line: 32, column: 9, scope: !45)
!61 = !DILocation(line: 34, column: 1, scope: !41)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_44_good", scope: !16, file: !16, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 83, column: 5, scope: !62)
!64 = !DILocation(line: 84, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 95, type: !66, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!7, !7, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !16, line: 95, type: !7)
!72 = !DILocation(line: 95, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !16, line: 95, type: !68)
!74 = !DILocation(line: 95, column: 27, scope: !65)
!75 = !DILocation(line: 98, column: 22, scope: !65)
!76 = !DILocation(line: 98, column: 12, scope: !65)
!77 = !DILocation(line: 98, column: 5, scope: !65)
!78 = !DILocation(line: 100, column: 5, scope: !65)
!79 = !DILocation(line: 101, column: 5, scope: !65)
!80 = !DILocation(line: 102, column: 5, scope: !65)
!81 = !DILocation(line: 105, column: 5, scope: !65)
!82 = !DILocation(line: 106, column: 5, scope: !65)
!83 = !DILocation(line: 107, column: 5, scope: !65)
!84 = !DILocation(line: 109, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 69, type: !17, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !16, line: 71, type: !4)
!87 = !DILocation(line: 71, column: 15, scope: !85)
!88 = !DILocalVariable(name: "funcPtr", scope: !85, file: !16, line: 72, type: !22)
!89 = !DILocation(line: 72, column: 12, scope: !85)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !16, line: 73, type: !4)
!91 = !DILocation(line: 73, column: 15, scope: !85)
!92 = !DILocation(line: 73, column: 42, scope: !85)
!93 = !DILocation(line: 73, column: 31, scope: !85)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !16, line: 74, type: !4)
!95 = !DILocation(line: 74, column: 15, scope: !85)
!96 = !DILocation(line: 74, column: 43, scope: !85)
!97 = !DILocation(line: 74, column: 32, scope: !85)
!98 = !DILocation(line: 76, column: 12, scope: !85)
!99 = !DILocation(line: 76, column: 10, scope: !85)
!100 = !DILocation(line: 77, column: 5, scope: !85)
!101 = !DILocation(line: 77, column: 13, scope: !85)
!102 = !DILocation(line: 78, column: 5, scope: !85)
!103 = !DILocation(line: 78, column: 13, scope: !85)
!104 = !DILocation(line: 79, column: 1, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 56, type: !23, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", arg: 1, scope: !105, file: !16, line: 56, type: !4)
!107 = !DILocation(line: 56, column: 35, scope: !105)
!108 = !DILocalVariable(name: "source", scope: !109, file: !16, line: 59, type: !46)
!109 = distinct !DILexicalBlock(scope: !105, file: !16, line: 58, column: 5)
!110 = !DILocation(line: 59, column: 17, scope: !109)
!111 = !DILocation(line: 60, column: 17, scope: !109)
!112 = !DILocation(line: 60, column: 9, scope: !109)
!113 = !DILocation(line: 61, column: 9, scope: !109)
!114 = !DILocation(line: 61, column: 23, scope: !109)
!115 = !DILocation(line: 63, column: 17, scope: !109)
!116 = !DILocation(line: 63, column: 23, scope: !109)
!117 = !DILocation(line: 63, column: 9, scope: !109)
!118 = !DILocation(line: 64, column: 9, scope: !109)
!119 = !DILocation(line: 64, column: 21, scope: !109)
!120 = !DILocation(line: 65, column: 20, scope: !109)
!121 = !DILocation(line: 65, column: 9, scope: !109)
!122 = !DILocation(line: 67, column: 1, scope: !105)
