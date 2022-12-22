; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !27
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !28
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %0 = load i32*, i32** %data.addr, align 8, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #4, !dbg !33
  %1 = load i32*, i32** %data.addr, align 8, !dbg !34
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !34
  store i32 0, i32* %arrayidx3, align 4, !dbg !35
  %2 = load i32*, i32** %data.addr, align 8, !dbg !36
  call void @printWLine(i32* %2), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_bad() #0 !dbg !39 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = alloca i8, i64 200, align 16, !dbg !46
  %1 = bitcast i8* %0 to i32*, !dbg !47
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !48, metadata !DIExpression()), !dbg !49
  %2 = alloca i8, i64 400, align 16, !dbg !50
  %3 = bitcast i8* %2 to i32*, !dbg !51
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !49
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !52
  store i32* %4, i32** %data, align 8, !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_badSink(i32* %6), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_goodG2BSink(i32* %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !62, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !65
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !66
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx, align 4, !dbg !68
  %0 = load i32*, i32** %data.addr, align 8, !dbg !69
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !70
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #4, !dbg !71
  %1 = load i32*, i32** %data.addr, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !72
  store i32 0, i32* %arrayidx3, align 4, !dbg !73
  %2 = load i32*, i32** %data.addr, align 8, !dbg !74
  call void @printWLine(i32* %2), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #4, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #4, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 200, align 16, !dbg !105
  %1 = bitcast i8* %0 to i32*, !dbg !106
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = alloca i8, i64 400, align 16, !dbg !109
  %3 = bitcast i8* %2 to i32*, !dbg !110
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !108
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !111
  store i32* %4, i32** %data, align 8, !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %6 = load i32*, i32** %data, align 8, !dbg !115
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_goodG2BSink(i32* %6), !dbg !116
  ret void, !dbg !117
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 90, scope: !15)
!21 = !DILocalVariable(name: "source", scope: !22, file: !16, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 27, column: 17, scope: !22)
!28 = !DILocation(line: 27, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 9, scope: !22)
!30 = !DILocation(line: 28, column: 23, scope: !22)
!31 = !DILocation(line: 30, column: 17, scope: !22)
!32 = !DILocation(line: 30, column: 23, scope: !22)
!33 = !DILocation(line: 30, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 9, scope: !22)
!35 = !DILocation(line: 31, column: 21, scope: !22)
!36 = !DILocation(line: 32, column: 20, scope: !22)
!37 = !DILocation(line: 32, column: 9, scope: !22)
!38 = !DILocation(line: 34, column: 1, scope: !15)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_bad", scope: !16, file: !16, line: 36, type: !40, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null}
!42 = !DILocalVariable(name: "data", scope: !39, file: !16, line: 38, type: !4)
!43 = !DILocation(line: 38, column: 15, scope: !39)
!44 = !DILocalVariable(name: "dataBadBuffer", scope: !39, file: !16, line: 39, type: !4)
!45 = !DILocation(line: 39, column: 15, scope: !39)
!46 = !DILocation(line: 39, column: 42, scope: !39)
!47 = !DILocation(line: 39, column: 31, scope: !39)
!48 = !DILocalVariable(name: "dataGoodBuffer", scope: !39, file: !16, line: 40, type: !4)
!49 = !DILocation(line: 40, column: 15, scope: !39)
!50 = !DILocation(line: 40, column: 43, scope: !39)
!51 = !DILocation(line: 40, column: 32, scope: !39)
!52 = !DILocation(line: 43, column: 12, scope: !39)
!53 = !DILocation(line: 43, column: 10, scope: !39)
!54 = !DILocation(line: 44, column: 5, scope: !39)
!55 = !DILocation(line: 44, column: 13, scope: !39)
!56 = !DILocation(line: 45, column: 79, scope: !39)
!57 = !DILocation(line: 45, column: 5, scope: !39)
!58 = !DILocation(line: 46, column: 1, scope: !39)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_goodG2BSink", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !16, line: 52, type: !4)
!61 = !DILocation(line: 52, column: 94, scope: !59)
!62 = !DILocalVariable(name: "source", scope: !63, file: !16, line: 55, type: !23)
!63 = distinct !DILexicalBlock(scope: !59, file: !16, line: 54, column: 5)
!64 = !DILocation(line: 55, column: 17, scope: !63)
!65 = !DILocation(line: 56, column: 17, scope: !63)
!66 = !DILocation(line: 56, column: 9, scope: !63)
!67 = !DILocation(line: 57, column: 9, scope: !63)
!68 = !DILocation(line: 57, column: 23, scope: !63)
!69 = !DILocation(line: 59, column: 17, scope: !63)
!70 = !DILocation(line: 59, column: 23, scope: !63)
!71 = !DILocation(line: 59, column: 9, scope: !63)
!72 = !DILocation(line: 60, column: 9, scope: !63)
!73 = !DILocation(line: 60, column: 21, scope: !63)
!74 = !DILocation(line: 61, column: 20, scope: !63)
!75 = !DILocation(line: 61, column: 9, scope: !63)
!76 = !DILocation(line: 63, column: 1, scope: !59)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_41_good", scope: !16, file: !16, line: 77, type: !40, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 79, column: 5, scope: !77)
!79 = !DILocation(line: 80, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 92, type: !81, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !16, line: 92, type: !7)
!87 = !DILocation(line: 92, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !16, line: 92, type: !83)
!89 = !DILocation(line: 92, column: 27, scope: !80)
!90 = !DILocation(line: 95, column: 22, scope: !80)
!91 = !DILocation(line: 95, column: 12, scope: !80)
!92 = !DILocation(line: 95, column: 5, scope: !80)
!93 = !DILocation(line: 97, column: 5, scope: !80)
!94 = !DILocation(line: 98, column: 5, scope: !80)
!95 = !DILocation(line: 99, column: 5, scope: !80)
!96 = !DILocation(line: 102, column: 5, scope: !80)
!97 = !DILocation(line: 103, column: 5, scope: !80)
!98 = !DILocation(line: 104, column: 5, scope: !80)
!99 = !DILocation(line: 106, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 66, type: !40, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !16, line: 68, type: !4)
!102 = !DILocation(line: 68, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !16, line: 69, type: !4)
!104 = !DILocation(line: 69, column: 15, scope: !100)
!105 = !DILocation(line: 69, column: 42, scope: !100)
!106 = !DILocation(line: 69, column: 31, scope: !100)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !16, line: 70, type: !4)
!108 = !DILocation(line: 70, column: 15, scope: !100)
!109 = !DILocation(line: 70, column: 43, scope: !100)
!110 = !DILocation(line: 70, column: 32, scope: !100)
!111 = !DILocation(line: 72, column: 12, scope: !100)
!112 = !DILocation(line: 72, column: 10, scope: !100)
!113 = !DILocation(line: 73, column: 5, scope: !100)
!114 = !DILocation(line: 73, column: 13, scope: !100)
!115 = !DILocation(line: 74, column: 83, scope: !100)
!116 = !DILocation(line: 74, column: 5, scope: !100)
!117 = !DILocation(line: 75, column: 1, scope: !100)
