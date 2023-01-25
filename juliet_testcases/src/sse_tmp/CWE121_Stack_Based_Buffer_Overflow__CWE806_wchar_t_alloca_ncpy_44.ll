; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  %3 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !36
  %6 = load i32*, i32** %data, align 8, !dbg !37
  call void %5(i32* %6), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %1 = load i32*, i32** %data.addr, align 8, !dbg !49
  %2 = load i32*, i32** %data.addr, align 8, !dbg !50
  %call = call i64 @wcslen(i32* %2) #7, !dbg !51
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %1, i64 %call) #6, !dbg !52
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  %3 = load i32*, i32** %data.addr, align 8, !dbg !55
  call void @printWLine(i32* %3), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !84, metadata !DIExpression()), !dbg !85
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 400, align 16, !dbg !88
  %1 = bitcast i8* %0 to i32*, !dbg !89
  store i32* %1, i32** %dataBuffer, align 8, !dbg !87
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  store i32* %2, i32** %data, align 8, !dbg !91
  %3 = load i32*, i32** %data, align 8, !dbg !92
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !93
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !96
  %6 = load i32*, i32** %data, align 8, !dbg !97
  call void %5(i32* %6), !dbg !96
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !99 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !105
  %1 = load i32*, i32** %data.addr, align 8, !dbg !106
  %2 = load i32*, i32** %data.addr, align 8, !dbg !107
  %call = call i64 @wcslen(i32* %2) #7, !dbg !108
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %1, i64 %call) #6, !dbg !109
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %3 = load i32*, i32** %data.addr, align 8, !dbg !112
  call void @printWLine(i32* %3), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_bad", scope: !16, file: !16, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 36, type: !4)
!20 = !DILocation(line: 36, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 38, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 38, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 39, type: !4)
!27 = !DILocation(line: 39, column: 15, scope: !15)
!28 = !DILocation(line: 39, column: 39, scope: !15)
!29 = !DILocation(line: 39, column: 28, scope: !15)
!30 = !DILocation(line: 40, column: 12, scope: !15)
!31 = !DILocation(line: 40, column: 10, scope: !15)
!32 = !DILocation(line: 42, column: 13, scope: !15)
!33 = !DILocation(line: 42, column: 5, scope: !15)
!34 = !DILocation(line: 43, column: 5, scope: !15)
!35 = !DILocation(line: 43, column: 17, scope: !15)
!36 = !DILocation(line: 45, column: 5, scope: !15)
!37 = !DILocation(line: 45, column: 13, scope: !15)
!38 = !DILocation(line: 46, column: 1, scope: !15)
!39 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !16, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 31, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !16, line: 26, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !16, line: 25, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 26, column: 17, scope: !43)
!48 = !DILocation(line: 28, column: 17, scope: !43)
!49 = !DILocation(line: 28, column: 23, scope: !43)
!50 = !DILocation(line: 28, column: 36, scope: !43)
!51 = !DILocation(line: 28, column: 29, scope: !43)
!52 = !DILocation(line: 28, column: 9, scope: !43)
!53 = !DILocation(line: 29, column: 9, scope: !43)
!54 = !DILocation(line: 29, column: 20, scope: !43)
!55 = !DILocation(line: 30, column: 20, scope: !43)
!56 = !DILocation(line: 30, column: 9, scope: !43)
!57 = !DILocation(line: 32, column: 1, scope: !39)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_good", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 78, column: 5, scope: !58)
!60 = !DILocation(line: 79, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 90, type: !62, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !16, line: 90, type: !7)
!68 = !DILocation(line: 90, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !16, line: 90, type: !64)
!70 = !DILocation(line: 90, column: 27, scope: !61)
!71 = !DILocation(line: 93, column: 22, scope: !61)
!72 = !DILocation(line: 93, column: 12, scope: !61)
!73 = !DILocation(line: 93, column: 5, scope: !61)
!74 = !DILocation(line: 95, column: 5, scope: !61)
!75 = !DILocation(line: 96, column: 5, scope: !61)
!76 = !DILocation(line: 97, column: 5, scope: !61)
!77 = !DILocation(line: 100, column: 5, scope: !61)
!78 = !DILocation(line: 101, column: 5, scope: !61)
!79 = !DILocation(line: 102, column: 5, scope: !61)
!80 = !DILocation(line: 104, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 64, type: !17, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !16, line: 66, type: !4)
!83 = !DILocation(line: 66, column: 15, scope: !81)
!84 = !DILocalVariable(name: "funcPtr", scope: !81, file: !16, line: 67, type: !22)
!85 = !DILocation(line: 67, column: 12, scope: !81)
!86 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !16, line: 68, type: !4)
!87 = !DILocation(line: 68, column: 15, scope: !81)
!88 = !DILocation(line: 68, column: 39, scope: !81)
!89 = !DILocation(line: 68, column: 28, scope: !81)
!90 = !DILocation(line: 69, column: 12, scope: !81)
!91 = !DILocation(line: 69, column: 10, scope: !81)
!92 = !DILocation(line: 71, column: 13, scope: !81)
!93 = !DILocation(line: 71, column: 5, scope: !81)
!94 = !DILocation(line: 72, column: 5, scope: !81)
!95 = !DILocation(line: 72, column: 16, scope: !81)
!96 = !DILocation(line: 73, column: 5, scope: !81)
!97 = !DILocation(line: 73, column: 13, scope: !81)
!98 = !DILocation(line: 74, column: 1, scope: !81)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 53, type: !23, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", arg: 1, scope: !99, file: !16, line: 53, type: !4)
!101 = !DILocation(line: 53, column: 35, scope: !99)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !16, line: 56, type: !44)
!103 = distinct !DILexicalBlock(scope: !99, file: !16, line: 55, column: 5)
!104 = !DILocation(line: 56, column: 17, scope: !103)
!105 = !DILocation(line: 58, column: 17, scope: !103)
!106 = !DILocation(line: 58, column: 23, scope: !103)
!107 = !DILocation(line: 58, column: 36, scope: !103)
!108 = !DILocation(line: 58, column: 29, scope: !103)
!109 = !DILocation(line: 58, column: 9, scope: !103)
!110 = !DILocation(line: 59, column: 9, scope: !103)
!111 = !DILocation(line: 59, column: 20, scope: !103)
!112 = !DILocation(line: 60, column: 20, scope: !103)
!113 = !DILocation(line: 60, column: 9, scope: !103)
!114 = !DILocation(line: 62, column: 1, scope: !99)
